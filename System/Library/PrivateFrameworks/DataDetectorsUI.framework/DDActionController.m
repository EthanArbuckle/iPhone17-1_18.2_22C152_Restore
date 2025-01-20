@interface DDActionController
+ (BOOL)presentingBaseView:(id)a3 isLargeEnoughForAction:(id)a4;
- (BOOL)actionIsCancellable;
- (BOOL)facetimeAvailable;
- (BOOL)isPerformingAction;
- (BOOL)isPresentingInPopover;
- (DDAction)currentAction;
- (DDActionController)init;
- (DDDetectionControllerInteractionDelegate)interactionDelegate;
- (UIAlertController)alertController;
- (UIView)baseView;
- (id)actionsForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)actionsForURL:(id)a3 result:(__DDResult *)a4 enclosingResult:(__DDResult *)a5 context:(id)a6;
- (id)defaultActionForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (void)_cleanup;
- (void)_didDismissActionViewController;
- (void)_dismissCurrentViewControllerOurselves;
- (void)_presentController:(id)a3;
- (void)_presentCurrentViewControllerOurselves;
- (void)_willPresentViewController;
- (void)action:(id)a3 presentationShouldBeModal:(BOOL)a4;
- (void)action:(id)a3 viewControllerReady:(id)a4;
- (void)actionDidFinish:(id)a3;
- (void)actionDidFinish:(id)a3 shouldDismiss:(BOOL)a4;
- (void)cancelAction;
- (void)cleanupNoDismiss;
- (void)dealloc;
- (void)dismissCurrentController;
- (void)failedToPrepareViewControllerForAction:(id)a3;
- (void)performAction:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setBaseView:(id)a3;
- (void)setCurrentAction:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)tellDelegateActionDidFinish;
- (void)tellDelegateActionDidFinishShouldDismiss:(BOOL)a3;
- (void)viewControllerRequiresModalInPopover:(BOOL)a3;
@end

@implementation DDActionController

- (DDActionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)DDActionController;
  v2 = [(DDActionController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    presentedViewController = v2->_presentedViewController;
    v2->_presentedViewController = 0;

    currentBaseViewController = v3->_currentBaseViewController;
    v3->_currentBaseViewController = 0;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_idsListenerID)
  {
    v3 = [MEMORY[0x1E4F6AB98] sharedInstance];
    [v3 removeListenerID:self->_idsListenerID forService:*MEMORY[0x1E4F6AA50]];
  }
  v4.receiver = self;
  v4.super_class = (Class)DDActionController;
  [(DDActionController *)&v4 dealloc];
}

- (void)_cleanup
{
  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = 0;

  currentBaseViewController = self->_currentBaseViewController;
  self->_currentBaseViewController = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

  [(DDActionController *)self setCurrentAction:0];
  [(DDActionController *)self setBaseView:0];
  [(DDActionController *)self setInteractionDelegate:0];
  originalWindow = self->_originalWindow;
  self->_originalWindow = 0;
}

- (BOOL)facetimeAvailable
{
  if (self->_idsListenerID)
  {
    uint64_t v3 = *MEMORY[0x1E4F6AA50];
  }
  else
  {
    id v4 = [NSString alloc];
    uint64_t v5 = facetimeAvailable_i++;
    v6 = (NSString *)objc_msgSend(v4, "initWithFormat:", @"com.apple.datadetectors.%d", v5);
    idsListenerID = self->_idsListenerID;
    self->_idsListenerID = v6;

    v8 = [MEMORY[0x1E4F6AB98] sharedInstance];
    uint64_t v3 = *MEMORY[0x1E4F6AA50];
    [v8 addListenerID:self->_idsListenerID forService:*MEMORY[0x1E4F6AA50]];
  }
  v9 = [MEMORY[0x1E4F6AB98] sharedInstance];
  BOOL v10 = [v9 availabilityForListenerID:self->_idsListenerID forService:v3] == 1;

  return v10;
}

- (id)actionsForURL:(id)a3 result:(__DDResult *)a4 enclosingResult:(__DDResult *)a5 context:(id)a6
{
  v145[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (uint64_t)a3;
  id v11 = a6;
  v12 = [v11 objectForKeyedSubscript:@"defaultActionOnly"];

  if (v10 | (unint64_t)a4)
  {
    if (+[DDMessagesCustomAction handlesUrl:v10 result:a4])
    {
      v23 = (void *)MEMORY[0x1E4F1C978];
      v17 = +[DDAction actionWithURL:v10 result:a4 context:v11];
      if (!v12)
      {
        v28 = +[DDAction actionWithURL:v10 result:a4 context:v11];
        objc_msgSend(v23, "arrayWithObjects:", v17, v28, 0);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_35;
      }
      uint64_t v24 = objc_msgSend(v23, "arrayWithObjects:", v17, 0, 0);
LABEL_27:
      id v13 = (id)v24;
LABEL_35:

      goto LABEL_36;
    }
    if (+[DDChatBotAction handlesUrl:v10 result:a4])
    {
      v17 = [(DDAction *)[DDChatBotAction alloc] initWithURL:v10 result:a4 context:v11];
      uint64_t v24 = [(DDChatBotAction *)v17 sheetActions];
      goto LABEL_27;
    }
    v25 = [(id)v10 scheme];
    v26 = [v25 lowercaseString];

    if (a4)
    {
      int Category = DDResultGetCategory();
      if (!v26)
      {
LABEL_42:
        if ((([(id)v10 isFaceTimeURL] & 1) != 0
           || [(id)v10 isFaceTimePromptURL])
          && [(DDActionController *)self facetimeAvailable]
          || (([(id)v10 isFaceTimeAudioURL] & 1) != 0
           || [(id)v10 isFaceTimeAudioPromptURL])
          && [(DDActionController *)self facetimeAvailable])
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (+[DDFaceTimeAction isAvailable])
          {
            v30 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            [v13 addObject:v30];

            if (v12) {
              goto LABEL_138;
            }
          }
          if (+[DDFaceTimeAudioAction isAvailable])
          {
            v31 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            [v13 addObject:v31];

            if (v12) {
              goto LABEL_138;
            }
          }
          v32 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          [v13 addObject:v32];
          goto LABEL_53;
        }
        v39 = v12;
        if ([v26 isEqualToString:@"mailto"])
        {
          BOOL v40 = +[DDAddToAddressBookAction isAvailable];
          v41 = (void *)MEMORY[0x1E4F1C978];
          v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          if (v40)
          {
            if (v39)
            {
LABEL_62:
              v42 = 0;
            }
            else
            {
              uint64_t v68 = +[DDAddressAction actionWithURL:v10 result:a4 enclosingResult:a5 context:v11];
LABEL_110:
              v42 = (void *)v68;
            }
            v69 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            objc_msgSend(v41, "arrayWithObjects:", v34, v42, v69, 0);
            id v13 = (id)objc_claimAutoreleasedReturnValue();

            if (!v39) {
            goto LABEL_137;
            }
          }
          if (v39)
          {
            objc_msgSend(v41, "arrayWithObjects:", v34, 0, 0);
LABEL_76:
            id v50 = (id)objc_claimAutoreleasedReturnValue();
LABEL_136:
            id v13 = v50;
            goto LABEL_137;
          }
          v35 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          objc_msgSend(v41, "arrayWithObjects:", v34, v35, 0);
          goto LABEL_114;
        }
        if ([v26 isEqualToString:@"upi"])
        {
LABEL_71:
          v48 = DDUPIAction;
          goto LABEL_72;
        }
        if (objc_msgSend((id)v10, "dd_isMaps:", 0)
          && DDExtractMapLocationInformationFromURL((void *)v10, 0, 0))
        {
          v51 = (void *)MEMORY[0x1E4F1C978];
          v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          if (v12)
          {
            v52 = 0;
          }
          else
          {
            v52 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          }
          v87 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          objc_msgSend(v51, "arrayWithObjects:", v34, v52, v87, 0);
          id v13 = (id)objc_claimAutoreleasedReturnValue();

          if (!v12) {
LABEL_141:
          }

          goto LABEL_137;
        }
        if (+[DDClientPreviewAction clientCanPerformActionWithUrl:v10])
        {
          v32 = +[DDAction actionWithURL:v10 result:0 context:v11];
          v141 = v32;
          v59 = (void *)MEMORY[0x1E4F1C978];
          v60 = &v141;
LABEL_95:
          id v13 = [v59 arrayWithObjects:v60 count:1];
LABEL_53:

LABEL_138:
          goto LABEL_36;
        }
        if (!a4)
        {
          BOOL v72 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v72) {
            -[DDActionController actionsForURL:result:enclosingResult:context:](v72, v73, v74, v75, v76, v77, v78, v79);
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[DDActionController actionsForURL:result:enclosingResult:context:]((void *)v10);
          }
          id v13 = 0;
          goto LABEL_138;
        }
        int v70 = DDResultGetCategory();
        CFStringRef Type = (const __CFString *)DDResultGetType();
        switch(v70)
        {
          case 1:
            if (!v10)
            {
              uint64_t v10 = _DDURLFromResult((uint64_t)a4);
            }
            if (!+[DDNewsPreviewAction handlesUrl:result:](DDNewsPreviewAction, "handlesUrl:result:", v10, a4)&& !+[DDURLPreviewAction handlesUrl:v10 result:a4])
            {
              v105 = [(id)v10 scheme];
              v106 = [v105 lowercaseString];
              int v107 = [v106 isEqualToString:@"upi"];

              if (v107) {
                goto LABEL_71;
              }
              v103 = (void *)MEMORY[0x1E4F1C978];
              v104 = DDOpenURLAction;
              goto LABEL_184;
            }
            if (+[DDAddToReadingListAction isAvailable])
            {
              v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              v140[0] = v34;
              if (v12)
              {
                v52 = 0;
              }
              else
              {
                v52 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              }
              v140[1] = v52;
              v114 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              v140[2] = v114;
              id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:3];

              if (v12) {
                goto LABEL_137;
              }
              goto LABEL_141;
            }
            v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            v139[0] = v34;
            if (v12)
            {
              v94 = 0;
            }
            else
            {
              v94 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            }
            v139[1] = v94;
            id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:2];
            if (v12) {
              goto LABEL_137;
            }
            goto LABEL_214;
          case 3:
            BOOL v88 = +[DDAddToAddressBookAction isAvailable];
            v41 = (void *)MEMORY[0x1E4F1C978];
            v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            if (v88)
            {
              v127 = v26;
              if (v39)
              {
                v89 = 0;
              }
              else
              {
                v89 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              }
              v108 = +[DDAddressAction actionWithURL:v10 result:a4 enclosingResult:a5 context:v11];
              v109 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              objc_msgSend(v41, "arrayWithObjects:", v34, v89, v108, v109, 0);
              id v13 = (id)objc_claimAutoreleasedReturnValue();

              if (!v39) {
              v26 = v127;
              }
              goto LABEL_138;
            }
            if (v39) {
              goto LABEL_62;
            }
            uint64_t v68 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            goto LABEL_110;
          case 4:
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (+[DDAddEventAction isAvailable])
            {
              v90 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              [v13 addObject:v90];

              if (v12) {
                goto LABEL_138;
              }
            }
            if (+[DDCreateReminderAction isAvailable])
            {
              v91 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              [v13 addObject:v91];

              if (v12) {
                goto LABEL_138;
              }
            }
            if (+[DDEventsAction isAvailable])
            {
              v92 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              [v13 addObject:v92];

              if (v12) {
                goto LABEL_138;
              }
            }
            v93 = (void *)MEMORY[0x1E4F1C978];
            v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            if (v12)
            {
              v94 = 0;
            }
            else
            {
              v94 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            }
            v115 = objc_msgSend(v93, "arrayWithObjects:", v34, v94, 0);
            [v13 addObjectsFromArray:v115];

            if (!v12) {
              goto LABEL_214;
            }
            goto LABEL_137;
          case 5:
            CFStringRef v95 = Type;
            if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F0E8], 0))
            {
              if (CFStringCompare(v95, (CFStringRef)*MEMORY[0x1E4F5F038], 0))
              {
                if (CFStringCompare(v95, (CFStringRef)*MEMORY[0x1E4F5F080], 0))
                {
                  if (CFEqual(v95, (CFStringRef)*MEMORY[0x1E4F5F000]))
                  {
                    v34 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                    v138[0] = v34;
                    if (v12)
                    {
                      v94 = 0;
                    }
                    else
                    {
                      v94 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                    }
                    v138[1] = v94;
                    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
                    if (!v12) {
LABEL_214:
                    }

                    goto LABEL_137;
                  }
                  if (CFEqual(v95, (CFStringRef)*MEMORY[0x1E4F5EF80]))
                  {
                    v116 = (void *)MEMORY[0x1E4F1C978];
                    v117 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                    objc_msgSend(v116, "arrayWithObjects:", v117, 0);
                    id v13 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_138;
                  }
                  if (CFEqual(v95, (CFStringRef)*MEMORY[0x1E4F5F090]))
                  {
                    uint64_t v49 = +[DDConversionAction allActionsForResult:a4 context:v11];
                    goto LABEL_73;
                  }
                  if (CFEqual(v95, (CFStringRef)*MEMORY[0x1E4F5F0F0])) {
                    goto LABEL_71;
                  }
                  if (CFStringCompare(v95, @"evts", 0))
                  {
                    if (CFEqual(v95, (CFStringRef)*MEMORY[0x1E4F5EFF0]))
                    {
                      v96 = [MEMORY[0x1E4F28B50] mainBundle];
                      v97 = [v96 bundleIdentifier];
                      int v98 = [v97 isEqualToString:@"com.apple.MobileSMS"];

                      if (v98)
                      {
                        v32 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                        v137 = v32;
                        v59 = (void *)MEMORY[0x1E4F1C978];
                        v60 = &v137;
                        goto LABEL_95;
                      }
                    }
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                      -[DDActionController actionsForURL:result:enclosingResult:context:].cold.4((uint64_t)v95, v10);
                    }
LABEL_144:
                    uint64_t v49 = [MEMORY[0x1E4F1C978] array];
                    goto LABEL_73;
                  }
                  v48 = DDEventsAction;
LABEL_72:
                  uint64_t v49 = [(__objc2_class *)v48 actionsWithURL:v10 result:a4 context:v11];
LABEL_73:
                  id v13 = (id)v49;
                  goto LABEL_138;
                }
                v110 = v26;
                int ShouldKeepParsecScoresBelowThreshold = DDScannerShouldKeepParsecScoresBelowThreshold();
                v112 = (void *)MEMORY[0x1E4F1C978];
                if (ShouldKeepParsecScoresBelowThreshold)
                {
                  if (v12)
                  {
                    v113 = 0;
                  }
                  else
                  {
                    v113 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  }
                  v119 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  v120 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  if (v39)
                  {
                    v121 = 0;
                  }
                  else
                  {
                    v121 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  }
                  v122 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  objc_msgSend(v112, "arrayWithObjects:", v113, v119, v120, v121, v122, 0);
                  id v13 = (id)objc_claimAutoreleasedReturnValue();

                  if (v39)
                  {

LABEL_221:
                    v26 = v110;
                    goto LABEL_138;
                  }
                }
                else
                {
                  v113 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  uint64_t v118 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                  v119 = (void *)v118;
                  if (v12)
                  {
                    objc_msgSend(v112, "arrayWithObjects:", v113, v118, 0, 0);
                    id v13 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v123 = +[DDAction actionWithURL:v10 result:a4 context:v11];
                    objc_msgSend(v112, "arrayWithObjects:", v113, v119, v123, 0);
                    id v13 = (id)objc_claimAutoreleasedReturnValue();
                  }
                }

                goto LABEL_221;
              }
              v103 = (void *)MEMORY[0x1E4F1C978];
              v104 = DDShowItemAction;
            }
            else
            {
              v103 = (void *)MEMORY[0x1E4F1C978];
              v104 = DDTrackShipmentAction;
            }
LABEL_184:
            v34 = [(__objc2_class *)v104 actionWithURL:v10 result:a4 context:v11];
            if (v12)
            {
              objc_msgSend(v103, "arrayWithObjects:", v34, 0, 0);
              goto LABEL_76;
            }
            v35 = +[DDAction actionWithURL:v10 result:a4 context:v11];
            objc_msgSend(v103, "arrayWithObjects:", v34, v35, 0);
            uint64_t v38 = LABEL_114:;
            goto LABEL_58;
          case 6:
            v32 = +[DDAction clientActionsDelegate];
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v99 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              [v13 addObject:v99];
            }
            if (+[DDConversionAction actionAvailableForResult:a4])
            {
              v100 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              [v13 addObject:v100];
              v101 = [v100 specialCaseActions];
              v102 = -[DDActionGroup flattenedActions]((uint64_t)v101);

              if ([v102 count]) {
                [v13 addObjectsFromArray:v102];
              }
            }
            else
            {
              v100 = +[DDAction actionWithURL:v10 result:a4 context:v11];
              [v13 addObject:v100];
            }

            goto LABEL_53;
          default:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[DDActionController actionsForURL:result:enclosingResult:context:]((uint64_t)a4, v10);
            }
            goto LABEL_144;
        }
      }
    }
    else
    {
      int Category = 0;
      if (!v26) {
        goto LABEL_42;
      }
    }
    if ((objc_msgSend((id)v10, "dd_isAnySimpleTelephonyScheme") & 1) == 0 && Category != 2) {
      goto LABEL_42;
    }
    BOOL v33 = +[DDTextMessageAction supportsURL:v10];
    v34 = [MEMORY[0x1E4F1CA48] array];
    if (v33)
    {
      if (v12)
      {
        v35 = [[DDTextMessageAction alloc] initWithURL:v10 result:a4 context:v11];
        v145[0] = v35;
        v36 = (void *)MEMORY[0x1E4F1C978];
        v37 = (DDTextMessageAction **)v145;
LABEL_57:
        uint64_t v38 = [v36 arrayWithObjects:v37 count:1];
LABEL_58:
        id v13 = (id)v38;

LABEL_137:
        goto LABEL_138;
      }
      v128 = 0;
      v53 = +[DDTextMessageAction actionsWithURL:v10 result:a4 context:v11];
      [v34 addObjectsFromArray:v53];
    }
    else
    {
      if (dd_phoneNumberResultCanBeRdarLink((BOOL)a4))
      {
        v43 = v12;
        v44 = objc_msgSend((id)v10, "dd_rdarLinkFromTelScheme");
        if (v44)
        {
          +[DDAction actionWithURL:v44 result:0 context:v11];
          v46 = v45 = v26;
          [v34 addObject:v46];

          v26 = v45;
          if (v43) {
            goto LABEL_92;
          }
        }

        v12 = v43;
      }
      v128 = v12;
      if (v12)
      {
        uint64_t v47 = +[DDCallKitAudioAction defaultActionWithURL:v10 result:a4 context:v11];
        if (v47)
        {
LABEL_91:
          v44 = (void *)v47;
          *(unsigned char *)(v47 + 85) = 1;
          [v34 addObject:v47];
LABEL_92:

          goto LABEL_133;
        }
        goto LABEL_90;
      }
    }
    v126 = v26;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v54 = +[DDCallKitAudioAction actionsWithURL:v10 result:a4 context:v11 defaultAppsOnly:1];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v133 objects:v144 count:16];
    v125 = a5;
    BOOL v124 = v33;
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v134;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v134 != v57) {
            objc_enumerationMutation(v54);
          }
          *(unsigned char *)(*(void *)(*((void *)&v133 + 1) + 8 * i) + 85) = 1;
          objc_msgSend(v34, "addObject:");
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v133 objects:v144 count:16];
      }
      while (v56);

      v26 = v126;
      a5 = v125;
      LOBYTE(v33) = v124;
      if (v128)
      {
LABEL_90:
        uint64_t v47 = +[DDCallKitAudioAction defaultActionWithURL:v10 result:a4 context:v11];
        if (v47) {
          goto LABEL_91;
        }
LABEL_105:
        if (!v33)
        {
          v66 = +[DDDetectionController sharedController];
          char v67 = [v66 shouldIgnoreMessageActionForURL:v10];

          if ((v67 & 1) == 0)
          {
            if (v128)
            {
              v35 = [[DDTextMessageAction alloc] initWithURL:v10 result:a4 context:v11];
              v142 = v35;
              v36 = (void *)MEMORY[0x1E4F1C978];
              v37 = &v142;
              goto LABEL_57;
            }
            v80 = +[DDTextMessageAction actionsWithURL:v10 result:a4 context:v11];
            [v34 addObjectsFromArray:v80];
          }
        }
        if (!+[DDAddToAddressBookAction isAvailable]
          || (+[DDAddressAction actionWithURL:result:enclosingResult:context:](DDAddToAddressBookAction, "actionWithURL:result:enclosingResult:context:", v10, a4, a5, v11), v81 = objc_claimAutoreleasedReturnValue(), [v34 addObject:v81], v81, !v128))
        {
          v82 = +[DDAction actionWithURL:v10 result:a4 context:v11];
          [v34 addObject:v82];
        }
LABEL_133:
        v83 = [MEMORY[0x1E4F28B50] mainBundle];
        v84 = [v83 bundleIdentifier];
        int v85 = [v84 isEqualToString:@"com.apple.MobileSMS"];

        if (v85)
        {
          v86 = [v34 objectAtIndex:0];
          [v86 addToRecents];
        }
        id v50 = v34;
        goto LABEL_136;
      }
    }
    else
    {
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v61 = +[DDCallKitAudioAction actionsWithURL:v10 result:a4 context:v11 defaultAppsOnly:1];
    uint64_t v62 = [v61 countByEnumeratingWithState:&v129 objects:v143 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v130;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v130 != v64) {
            objc_enumerationMutation(v61);
          }
          *(unsigned char *)(*(void *)(*((void *)&v129 + 1) + 8 * j) + 85) = 1;
          objc_msgSend(v34, "addObject:");
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v129 objects:v143 count:16];
      }
      while (v63);
    }

    a5 = v125;
    v26 = v126;
    LOBYTE(v33) = v124;
    goto LABEL_105;
  }
  uint64_t v10 = [v11 objectForKeyedSubscript:@"Contact"];
  if (!v10) {
    goto LABEL_11;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!+[DDAddToAddressBookAction actionAvailableForContact:](DDAddToAddressBookAction, "actionAvailableForContact:", v10)|| (v14 = -[DDAction initWithURL:result:context:]([DDAddToAddressBookAction alloc], "initWithURL:result:context:", 0, 0, v11), [v13 addObject:v14], v14, !v12))
  {
    if (!+[DDOpenMapsAction actionAvailableForContact:](DDDirectionsAction, "actionAvailableForContact:", v10)|| (v15 = -[DDAction initWithURL:result:context:]([DDDirectionsAction alloc], "initWithURL:result:context:", 0, 0, v11), [v13 addObject:v15], v15, !v12))
    {
      if (+[DDOpenMapsAction actionAvailableForContact:v10])
      {
        v16 = [(DDAction *)[DDOpenMapsAction alloc] initWithURL:0 result:0 context:v11];
        [v13 addObject:v16];
      }
      if (![v13 count])
      {

LABEL_11:
        v17 = [v11 objectForKeyedSubscript:@"ICS"];
        if ([(DDChatBotAction *)v17 length])
        {
          v18 = +[DDAddEventAction cachedEventForICSString:v17];
          if (v18)
          {
            uint64_t v19 = +[DDAction contextByAddingValue:v18 toKey:0x1EF5023F8 inContext:v11];

            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (!+[DDAddEventAction isAvailable]
              || (v20 = -[DDAction initWithURL:result:context:]([DDAddEventAction alloc], "initWithURL:result:context:", 0, 0, v19), [v13 addObject:v20], v20, !v12))
            {
              if (!+[DDOpenMapsAction actionAvailableForCachedEvent:](DDDirectionsAction, "actionAvailableForCachedEvent:", v18)|| (v21 = -[DDAction initWithURL:result:context:]([DDDirectionsAction alloc], "initWithURL:result:context:", 0, 0, v19), [v13 addObject:v21], v21, !v12))
              {
                if (!+[DDOpenMapsAction actionAvailableForCachedEvent:](DDOpenMapsAction, "actionAvailableForCachedEvent:", v18)|| (v22 = -[DDAction initWithURL:result:context:]([DDOpenMapsAction alloc], "initWithURL:result:context:", 0, 0, v19), [v13 addObject:v22], v22, !v12))
                {
                  if (![v13 count])
                  {

                    id v13 = 0;
                  }
                }
              }
            }
            id v11 = (id)v19;
          }
          else
          {
            id v13 = 0;
          }
        }
        else
        {
          id v13 = 0;
        }
        goto LABEL_35;
      }
    }
  }
LABEL_36:

  return v13;
}

- (id)actionsForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  return [(DDActionController *)self actionsForURL:a3 result:a4 enclosingResult:0 context:a5];
}

- (id)defaultActionForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (+[DDMessagesCustomAction handlesUrl:v8 result:a4])
  {
    uint64_t v10 = +[DDAction actionWithURL:v8 result:a4 context:v9];
    goto LABEL_19;
  }
  id v11 = [v8 scheme];
  v12 = [v11 lowercaseString];

  if ([v12 isEqualToString:@"mailto"])
  {
    id v13 = DDSendMailAction;
LABEL_5:
    id v14 = v8;
    v15 = a4;
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "dd_isAnySimpleTelephonyScheme"))
  {
    v16 = (void *)[v9 mutableCopy];
    v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v19 = v18;

    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"defaultActionOnly"];
    v20 = [(DDActionController *)self actionsForURL:v8 result:a4 enclosingResult:0 context:v19];
    v21 = [v20 firstObject];

    uint64_t v10 = [v21 defaultAction];

    goto LABEL_17;
  }
  if (!+[DDClientPreviewAction clientCanPerformActionWithUrl:v8])
  {
    if (![v8 isSpringboardHandledURL])
    {
      if (a4)
      {
        int Category = DDResultGetCategory();
        CFStringRef Type = (const void *)DDResultGetType();
        switch(Category)
        {
          case 3:
            id v13 = DDOpenMapsAction;
            goto LABEL_5;
          case 4:
            id v13 = DDShowCalendarAction;
            goto LABEL_5;
          case 5:
            v34 = Type;
            if (CFEqual(Type, (CFTypeRef)*MEMORY[0x1E4F5F0E8]))
            {
              id v13 = DDTrackShipmentAction;
              goto LABEL_5;
            }
            if (CFEqual(v34, (CFTypeRef)*MEMORY[0x1E4F5F038]))
            {
              id v13 = DDShowItemAction;
              goto LABEL_5;
            }
            if (CFEqual(v34, (CFTypeRef)*MEMORY[0x1E4F5F080]))
            {
              id v13 = DDParsecAction;
              goto LABEL_5;
            }
            if (+[DDEventsAction actionAvailableForResult:a4 url:v8 context:v9])
            {
              id v13 = DDEventsAction;
              goto LABEL_5;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[DDActionController defaultActionForURL:result:context:].cold.5((uint64_t)v34, (uint64_t)v8);
            }
            break;
          case 6:
            id v13 = DDMoneyPreviewAction;
            goto LABEL_5;
          default:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[DDActionController actionsForURL:result:enclosingResult:context:]((uint64_t)a4, (uint64_t)v8);
            }
            goto LABEL_41;
        }
      }
      else
      {
        BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v26) {
          -[DDActionController actionsForURL:result:enclosingResult:context:](v26, v27, v28, v29, v30, v31, v32, v33);
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[DDActionController actionsForURL:result:enclosingResult:context:](v8);
        }
      }
      goto LABEL_41;
    }
    if (![v8 hasTelephonyScheme])
    {
      if (([v8 isFaceTimeURL] & 1) != 0
        || ([v8 isFaceTimeAudioURL] & 1) != 0
        || ([v8 isFaceTimePromptURL] & 1) != 0
        || [v8 isFaceTimeAudioPromptURL])
      {
        v25 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:v8];
        [v25 setShowUIPrompt:1];
        [v25 setPerformDialAssist:1];
        [v25 setPreferDefaultApp:0];
        [v25 setAllowProviderFallback:0];
        id v19 = [v25 URL];
        if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[DDActionController defaultActionForURL:result:context:](v8);
        }

LABEL_33:
        if (v19)
        {
          uint64_t v10 = +[DDAction defaultActionWithURL:v19 result:a4 context:v9];
LABEL_17:

          goto LABEL_18;
        }
LABEL_41:
        uint64_t v10 = 0;
        goto LABEL_18;
      }
      if (([v12 isEqualToString:@"http"] & 1) == 0
        && ![v12 isEqualToString:@"https"])
      {
        goto LABEL_41;
      }
      v35 = [v9 objectForKeyedSubscript:@"defaultHttpActionRequested"];

      if (!v35) {
        goto LABEL_41;
      }
    }
    id v19 = v8;
    goto LABEL_33;
  }
  id v13 = DDClientPreviewAction;
  id v14 = v8;
  v15 = 0;
LABEL_6:
  uint64_t v10 = [(__objc2_class *)v13 defaultActionWithURL:v14 result:v15 context:v9];
LABEL_18:

LABEL_19:
  return v10;
}

- (void)_presentController:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self->_presentedViewController || self->_currentBaseViewController || self->_originalWindow)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[DDActionController _presentController:]((uint64_t)v5, (uint64_t)&self->_presentedViewController, v6, v7, v8, v9, v10, v11);
      }
      presentedViewController = self->_presentedViewController;
      self->_presentedViewController = 0;

      currentBaseViewController = self->_currentBaseViewController;
      self->_currentBaseViewController = 0;

      originalWindow = self->_originalWindow;
      self->_originalWindow = 0;
    }
    [(DDActionController *)self _willPresentViewController];
    if (self->_interactionDelegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(DDDetectionControllerInteractionDelegate *)self->_interactionDelegate actionWillStart:self->_currentAction];
    }
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    BOOL v15 = [(DDActionController *)self isPresentingInPopover];
    alertController = self->_alertController;
    if (alertController)
    {
      v17 = [(UIAlertController *)alertController presentingViewController];
      id v18 = self->_currentBaseViewController;
      self->_currentBaseViewController = v17;

      if ([(DDAction *)self->_currentAction interactionType] == 1
        || [(DDAction *)self->_currentAction interactionType] == 3)
      {
        id v19 = [(UIAlertController *)self->_alertController popoverPresentationController];
        if (v19)
        {

          uint64_t v20 = 7;
        }
        else
        {
          v36 = [MEMORY[0x1E4F28B50] mainBundle];
          v37 = [v36 bundleIdentifier];
          int v38 = [v37 isEqualToString:@"com.apple.mobilesafari"];

          if (v38) {
            uint64_t v20 = 2;
          }
          else {
            uint64_t v20 = 7;
          }
        }
        [(UIViewController *)self->_presentedViewController setModalPresentationStyle:v20];
        v39 = [(UIViewController *)self->_presentedViewController popoverPresentationController];
        BOOL v40 = [(UIAlertController *)self->_alertController popoverPresentationController];
        v41 = [v40 sourceView];
        [v39 setSourceView:v41];

        v42 = [(UIAlertController *)self->_alertController popoverPresentationController];
        [v42 sourceRect];
        objc_msgSend(v39, "setSourceRect:");

        [v39 setDelegate:self];
      }
      if (v15) {
        [(UIAlertController *)self->_alertController setModalTransitionStyle:2];
      }
      v43 = self->_alertController;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __41__DDActionController__presentController___block_invoke;
      v44[3] = &unk_1E5A853B0;
      v44[4] = self;
      [(UIAlertController *)v43 dismissViewControllerAnimated:1 completion:v44];
      goto LABEL_34;
    }
    if (!v15)
    {
      [(DDActionController *)self _presentCurrentViewControllerOurselves];
      goto LABEL_34;
    }
    uint64_t v29 = [(UIViewController *)self->_presentedViewController popoverPresentationController];
    [(DDAction *)self->_currentAction setupPopoverPresentationController:v29 view:self->_baseView];
    [v29 setDelegate:self];
    uint64_t v30 = self->_currentBaseViewController;
    if (v30)
    {
      uint64_t v31 = [(UIView *)self->_baseView window];
      if (!v31) {
        goto LABEL_32;
      }
      uint64_t v32 = (void *)v31;
      uint64_t v33 = [(UIViewController *)self->_currentBaseViewController view];
      v34 = [v33 window];
      v35 = [(UIView *)self->_baseView window];

      if (v34 == v35)
      {
LABEL_32:
        [(UIViewController *)self->_currentBaseViewController presentViewController:self->_presentedViewController animated:1 completion:0];
        goto LABEL_33;
      }
      uint64_t v30 = self->_currentBaseViewController;
    }
    self->_currentBaseViewController = 0;

    [(DDActionController *)self _presentCurrentViewControllerOurselves];
LABEL_33:

    goto LABEL_34;
  }
  BOOL v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v21) {
    -[DDActionController _presentController:](v21, v22, v23, v24, v25, v26, v27, v28);
  }
LABEL_34:
}

uint64_t __41__DDActionController__presentController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) interactionDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) interactionDelegate];
    [v4 action:*(void *)(*(void *)(a1 + 32) + 32) didDismissAlertController:*(void *)(*(void *)(a1 + 32) + 64)];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = 0;

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) window];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 24) view];
  uint64_t v10 = [v9 window];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 16) window];

  if (v10 == v11)
  {
LABEL_8:
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 24);
    uint64_t v18 = *(void *)(v16 + 8);
    return [v17 presentViewController:v18 animated:1 completion:0];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = 0;

    id v14 = *(void **)(a1 + 32);
    return [v14 _presentCurrentViewControllerOurselves];
  }
}

- (void)tellDelegateActionDidFinish
{
}

- (void)tellDelegateActionDidFinishShouldDismiss:(BOOL)a3
{
  if (a3) {
    [(DDActionController *)self _didDismissActionViewController];
  }
  if (self->_interactionDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    currentAction = self->_currentAction;
    interactionDelegate = self->_interactionDelegate;
    [(DDDetectionControllerInteractionDelegate *)interactionDelegate actionDidFinish:currentAction];
  }
}

- (void)_willPresentViewController
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"DDDetectionControllerWillPresentActionNotification" object:0 userInfo:0];
}

- (void)_didDismissActionViewController
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"DDDetectionControllerDidDismissActionNotification" object:0 userInfo:0];
}

- (void)dismissCurrentController
{
  currentBaseViewController = self->_currentBaseViewController;
  if (currentBaseViewController)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__DDActionController_dismissCurrentController__block_invoke;
    v13[3] = &unk_1E5A853B0;
    v13[4] = self;
    [(UIViewController *)currentBaseViewController dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    p_alertController = &self->_alertController;
    if (self->_alertController)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__DDActionController_dismissCurrentController__block_invoke_2;
      v12[3] = &unk_1E5A853B0;
      v12[4] = self;
      uint64_t v5 = (void *)MEMORY[0x1A6236DA0](v12, a2);
      presentedViewController = self->_presentedViewController;
      p_presentedViewController = &self->_presentedViewController;
      uint64_t v6 = presentedViewController;
      if (!presentedViewController
        || ([(UIViewController *)v6 presentingViewController],
            uint64_t v9 = (UIAlertController *)objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = *p_alertController,
            v9,
            v9 == v10))
      {
        p_presentedViewController = (UIViewController **)p_alertController;
      }
      uint64_t v11 = [(UIViewController *)*p_presentedViewController presentingViewController];
      [v11 dismissViewControllerAnimated:1 completion:v5];
    }
    else
    {
      [(DDActionController *)self _dismissCurrentViewControllerOurselves];
    }
  }
}

uint64_t __46__DDActionController_dismissCurrentController__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) tellDelegateActionDidFinish];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cleanup];
}

uint64_t __46__DDActionController_dismissCurrentController__block_invoke_2(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 40) action:*(void *)(*(void *)(a1 + 32) + 32) didDismissAlertController:*(void *)(*(void *)(a1 + 32) + 64)];
  }
  [*(id *)(a1 + 32) tellDelegateActionDidFinish];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cleanup];
}

- (void)cleanupNoDismiss
{
  if (self->_presentedViewController || self->_currentBaseViewController || self->_originalWindow)
  {
    [(DDActionController *)self tellDelegateActionDidFinishShouldDismiss:0];
    [(DDActionController *)self _cleanup];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  [(DDAction *)self->_currentAction invalidate];
  if (self->_interactionDelegate)
  {
    if (objc_opt_respondsToSelector()) {
      [(DDDetectionControllerInteractionDelegate *)self->_interactionDelegate action:self->_currentAction didDismissAlertController:self->_alertController];
    }
    [(DDActionController *)self tellDelegateActionDidFinish];
  }
  [(DDActionController *)self _cleanup];
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  [a3 _setCentersPopoverIfSourceViewNotSet:1];
  currentAction = self->_currentAction;
  [(DDAction *)currentAction adaptForPresentationInPopover:1];
}

- (void)_presentCurrentViewControllerOurselves
{
  baseView = self->_baseView;
  if (!baseView)
  {
    id v4 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v5 = [v4 keyWindow];
    uint64_t v6 = self->_baseView;
    self->_baseView = v5;

    baseView = self->_baseView;
  }
  uint64_t v16 = [MEMORY[0x1E4F42FF8] _viewControllerForFullScreenPresentationFromView:baseView];
  uint64_t v7 = [(DDFallbackController *)v16 view];
  uint64_t v8 = [v7 window];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v10 = [(UIView *)self->_baseView window];
  }
  originalWindow = self->_originalWindow;
  self->_originalWindow = v10;

  if (!self->_originalWindow) {
    DDUILogAssertionFailure((uint64_t)"_originalWindow != nil", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDActionController.m", (uint64_t)"-[DDActionController _presentCurrentViewControllerOurselves]", 861, @"Need an original window to present a fallback controller; _baseView = %@",
  }
      v12,
      v13,
      v14,
      (uint64_t)self->_baseView);
  BOOL v15 = v16;
  if (!v16) {
    BOOL v15 = [[DDFallbackController alloc] initWithWindow:self->_originalWindow interactionDelegate:self];
  }
  v17 = v15;
  [(DDFallbackController *)v15 presentViewController:self->_presentedViewController animated:1 completion:0];
}

- (void)_dismissCurrentViewControllerOurselves
{
  char v3 = [(UIViewController *)self->_presentedViewController presentingViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__DDActionController__dismissCurrentViewControllerOurselves__block_invoke;
  v4[3] = &unk_1E5A853B0;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __60__DDActionController__dismissCurrentViewControllerOurselves__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) tellDelegateActionDidFinish];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cleanup];
}

+ (BOOL)presentingBaseView:(id)a3 isLargeEnoughForAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 interactionType] == 1 && _UIApplicationIsExtension())
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__1;
    uint64_t v23 = __Block_byref_object_dispose__1;
    uint64_t v7 = [v5 window];
    id v24 = [v7 screen];

    if (!v20[5])
    {
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        uint64_t v8 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v9 = [v8 windows];
        uint64_t v10 = [v9 firstObject];
        uint64_t v11 = [v10 screen];
        uint64_t v12 = (void *)v20[5];
        v20[5] = v11;
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__DDActionController_presentingBaseView_isLargeEnoughForAction___block_invoke;
        block[3] = &unk_1E5A85810;
        block[4] = &v19;
        dispatch_sync(MEMORY[0x1E4F14428], block);
      }
    }
    if (v20[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v14 = 375.0;
      }
      else {
        double v14 = 320.0;
      }
      [(id)v20[5] bounds];
      BOOL v13 = v15 >= v14 && v16 >= 667.0 || v16 >= v14 && v15 >= 667.0;
    }
    else
    {
      BOOL v13 = 0;
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

void __64__DDActionController_presentingBaseView_isLargeEnoughForAction___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F42738] sharedApplication];
  id v2 = [v7 windows];
  char v3 = [v2 firstObject];
  uint64_t v4 = [v3 screen];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)performAction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = objc_opt_class();
    _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Performing action %@", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDActionController performAction:]((uint64_t)v4);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__DDActionController_performAction___block_invoke;
  v6[3] = &unk_1E5A85428;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1A1709000, "performing Data Detectors action", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __36__DDActionController_performAction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentAction:*(void *)(a1 + 40)];
  int v2 = [*(id *)(a1 + 40) canBePerformedWhenDeviceIsLocked] ^ 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__DDActionController_performAction___block_invoke_2;
  v4[3] = &unk_1E5A85838;
  char v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v6 = v2;
  dd_requireDeviceUnlockAndPerformBlock(v2, v4);
}

void __36__DDActionController_performAction___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) baseView];
  id v5 = (id *)(a1 + 40);
  BOOL v6 = +[DDActionController presentingBaseView:v4 isLargeEnoughForAction:*(void *)(a1 + 40)];

  if ([*(id *)(a1 + 40) interactionType]) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (!a2 && *(unsigned char *)(a1 + 48))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __36__DDActionController_performAction___block_invoke_2_cold_2();
      if (v7) {
        return;
      }
    }
    else if (v7)
    {
      return;
    }
LABEL_20:
    [*(id *)(a1 + 32) _cleanup];
    return;
  }
  if (!v7)
  {
    if (v6 || [*v5 canBePerformedByOpeningURL])
    {
      uint64_t v12 = *(void **)(a1 + 40);
      BOOL v13 = [*(id *)(a1 + 32) baseView];
      [v12 performFromView:v13];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __36__DDActionController_performAction___block_invoke_2_cold_1((id *)(a1 + 40));
    }
    goto LABEL_20;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 64);
  if (v9)
  {
    uint64_t v10 = [v9 view];
    [v10 setUserInteractionEnabled:0];

    uint64_t v8 = *(void *)(a1 + 32);
  }
  id v11 = *v5;
  [v11 prepareViewControllerForActionController:v8];
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
  [(DDActionController *)self viewControllerRequiresModalInPopover:0];
}

- (void)action:(id)a3 viewControllerReady:(id)a4
{
  id v6 = a4;
  [a3 setDelegate:self];
  [(DDActionController *)self _presentController:v6];
}

- (void)action:(id)a3 presentationShouldBeModal:(BOOL)a4
{
  if (self->_currentAction == a3)
  {
    BOOL v4 = a4;
    id v6 = [a3 viewController];
    [v6 setModalInPresentation:v4];

    [(DDActionController *)self viewControllerRequiresModalInPopover:v4];
  }
}

- (void)failedToPrepareViewControllerForAction:(id)a3
{
  alertController = self->_alertController;
  if (alertController)
  {
    id v5 = [(UIAlertController *)alertController view];
    [v5 setUserInteractionEnabled:1];
  }
  [(DDActionController *)self setCurrentAction:0];
}

- (void)actionDidFinish:(id)a3 shouldDismiss:(BOOL)a4
{
  if (a4) {
    [(DDActionController *)self dismissCurrentController];
  }
  else {
    [(DDActionController *)self cleanupNoDismiss];
  }
  id v5 = [(DDActionController *)self currentAction];
  [v5 setDelegate:0];

  [(DDActionController *)self setCurrentAction:0];
}

- (void)actionDidFinish:(id)a3
{
}

- (BOOL)isPerformingAction
{
  return self->_currentAction != 0;
}

- (BOOL)actionIsCancellable
{
  alertController = self->_alertController;
  if (alertController)
  {
    char v3 = alertController;
  }
  else
  {
    char v3 = [(DDAction *)self->_currentAction viewController];
  }
  BOOL v4 = v3;
  char v5 = [(UIAlertController *)v3 isModalInPresentation] ^ 1;

  return v5;
}

- (void)cancelAction
{
  id v3 = [(DDActionController *)self currentAction];
  [(DDActionController *)self actionDidFinish:v3];
}

- (BOOL)isPresentingInPopover
{
  alertController = self->_alertController;
  if (!alertController) {
    alertController = (UIAlertController *)self->_presentedViewController;
  }
  BOOL v4 = alertController;
  char v5 = [(UIAlertController *)v4 presentationController];
  uint64_t v6 = [v5 presentationStyle];
  if ([v5 _isAdapted]
    && [(DDAction *)self->_currentAction interactionType] != 1)
  {
    uint64_t v6 = [v5 adaptivePresentationStyle];
  }

  return v6 == 7;
}

- (void)viewControllerRequiresModalInPopover:(BOOL)a3
{
}

- (DDDetectionControllerInteractionDelegate)interactionDelegate
{
  return self->_interactionDelegate;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (UIView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
}

- (DDAction)currentAction
{
  return (DDAction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentAction:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_idsListenerID, 0);
  objc_storeStrong((id *)&self->_originalWindow, 0);
  objc_storeStrong((id *)&self->_interactionDelegate, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_currentBaseViewController, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

- (void)actionsForURL:(void *)a1 result:enclosingResult:context:.cold.1(void *a1)
{
  v1 = [a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "Could not find any actions for URL %p (%@) without any result.", v3, v4, v5, v6, v7);
}

- (void)actionsForURL:(uint64_t)a3 result:(uint64_t)a4 enclosingResult:(uint64_t)a5 context:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)actionsForURL:(uint64_t)a1 result:(uint64_t)a2 enclosingResult:context:.cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1, a2), "scheme");
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown DDResult category %d for result %@; could not find any actions for URL %p (%@)",
    v3,
    0x26u);
}

- (void)actionsForURL:(uint64_t)a1 result:(uint64_t)a2 enclosingResult:context:.cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1, a2), "scheme");
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown result type %@ in the Misc category; no actions found (URL %p (%@))",
    v3,
    0x20u);
}

- (void)defaultActionForURL:(void *)a1 result:context:.cold.1(void *a1)
{
  v1 = [a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "Can't transform URL to prompt: %p (%@)", v3, v4, v5, v6, v7);
}

- (void)defaultActionForURL:(uint64_t)a1 result:(uint64_t)a2 context:.cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(a1, a2), "scheme");
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown type %@ in the Misc category; could not find any actions for URL %p (%@)",
    v3,
    0x20u);
}

- (void)_presentController:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentController:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performAction:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Performing action %@", (uint8_t *)&v1, 0xCu);
}

void __36__DDActionController_performAction___block_invoke_2_cold_1(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  int v3 = [*a1 canBePerformedByOpeningURL];
  int v4 = 138413058;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = 1;
  __int16 v8 = 1024;
  int v9 = 1;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Performing action %@ aborted (%d-%d-%d)", (uint8_t *)&v4, 0x1Eu);
}

void __36__DDActionController_performAction___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 138412290;
  uint64_t v1 = objc_opt_class();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Performing action %@ aborted because device is locked", (uint8_t *)&v0, 0xCu);
}

@end