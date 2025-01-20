@interface DDPersonAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
+ (id)viewControllerProviderClass;
- (BOOL)menuHasHeaderView;
- (BOOL)prefersActionMenuStyle;
- (CGSize)suggestedContentSize;
- (DDPersonAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (_BYTE)_appendActionsForPhoneNumbers:(void *)a3 emailAddresses:(void *)a4 class:(void *)a5 filter:(void *)a6 scheme:;
- (_BYTE)_menuActionsForPersonWithNumber:(void *)a3 email:;
- (id)_menuActionsForBusinessWithNumber:(uint64_t)a1;
- (id)menuActions;
- (id)menuHeaderView;
- (id)menuHeaderViewController;
- (uint64_t)_phoneNumberIsBusiness:(uint64_t)a1;
@end

@implementation DDPersonAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  id v5 = a3;
  if (!a4) {
    goto LABEL_11;
  }
  if ((DDResultHasType() & 1) == 0)
  {
    if (DDResultHasType())
    {
      uint64_t v7 = [MEMORY[0x1E4F5F150] resultFromCoreResult:a4];
      id v16 = 0;
      [(id)v7 getMailValue:&v16 label:0];
      id v6 = v16;

      LOBYTE(v7) = dd_handleIsChatBot(v6);
      LOBYTE(v6) = v7 ^ 1;
      goto LABEL_17;
    }
    int Category = DDResultGetCategory();
    if (Category != 2)
    {
      if (Category == 1)
      {
        v9 = (void *)DDResultCopyExtractedURLWithOptions();
        if (v9)
        {
          uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];

          id v5 = (id)v10;
        }
      }
LABEL_11:
      if (v5)
      {
        v11 = [v5 scheme];
        v12 = [v11 lowercaseString];

        if (v12)
        {
          v13 = DDPersonActionsSupportedSchemes();
          char v14 = [v13 containsObject:v12];

          if (v14)
          {
            LODWORD(v6) = !+[DDTextMessageAction isShowMessageURL:v5];

            goto LABEL_17;
          }
        }
      }
      LOBYTE(v6) = 0;
      goto LABEL_17;
    }
  }
  LOBYTE(v6) = 1;
LABEL_17:

  return (char)v6;
}

- (DDPersonAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    _DDURLFromResult((uint64_t)a4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v17.receiver = self;
  v17.super_class = (Class)DDPersonAction;
  v12 = [(DDAction *)&v17 initWithURL:v10 result:a4 context:v9];
  v13 = v12;
  if (v12)
  {
    if (v12->super.super.super._contact)
    {
      *(&v12->_fromCNContact + 6) = 1;
    }
    else
    {
      [(DDAction *)v12 associatedResults];
      uint64_t v14 = DDContactFromResult((uint64_t)a4, v8, v13->super.super.super._associatedVisualResults, &v13->_fromCNContact + 5);
      contact = v13->super.super.super._contact;
      v13->super.super.super._contact = (CNContact *)v14;
    }
  }

  return v13;
}

+ (id)viewControllerProviderClass
{
  return @"DDRemotePersonViewControllerProvider";
}

- (_BYTE)_appendActionsForPhoneNumbers:(void *)a3 emailAddresses:(void *)a4 class:(void *)a5 filter:(void *)a6 scheme:
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  id v88 = a6;
  if (!a1) {
    goto LABEL_65;
  }
  if ([v10 count])
  {
    if (!v88) {
      goto LABEL_65;
    }
  }
  else
  {
    uint64_t v13 = [v11 count];
    v86 = 0;
    if (!v88 || !v13) {
      goto LABEL_66;
    }
  }
  if (![a4 isAvailable])
  {
LABEL_65:
    v86 = 0;
    goto LABEL_66;
  }
  v75 = v11;
  +[DDActionGroup emptyGroup]();
  v86 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v74 = v10;
  obuint64_t j = v10;
  uint64_t v15 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
  id v78 = v12;
  v83 = a1;
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v94;
    uint64_t v79 = *(void *)v94;
    v81 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v94 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        v20 = [v19 value];
        v21 = [v20 stringValue];

        if (v21)
        {
          if ([v14 containsObject:v21])
          {
            id v22 = v21;
          }
          else
          {
            [v14 addObject:v21];
            v23 = [a1 context];
            if (v23)
            {
              v24 = [a1 context];
              v25 = (void *)[v24 mutableCopy];
            }
            else
            {
              v25 = [MEMORY[0x1E4F1CA60] dictionary];
            }

            v26 = [v19 label];

            if (v26)
            {
              v27 = (void *)MEMORY[0x1E4F1BA20];
              v28 = [v19 label];
              v29 = [v27 localizedStringForLabel:v28];
              [v25 setObject:v29 forKey:@"ContactLabel"];
            }
            [v25 setObject:v21 forKey:@"ContactValue"];
            uint64_t v30 = TUUnformattedPhoneNumber();
            v31 = (void *)v30;
            if (v30) {
              v32 = (void *)v30;
            }
            else {
              v32 = v21;
            }
            id v22 = v32;

            v33 = (void *)MEMORY[0x1E4F1CB10];
            v34 = [NSString stringWithFormat:@"%@:%@", v88, v22];
            v35 = [v33 URLWithString:v34];

            if (v12
              && +[DDContactUtils phoneNumber:v22 isEqualToPhoneNumber:v12])
            {
              id v36 = v35;
              v37 = [a1[8] scheme];
              v38 = [v37 lowercaseString];

              if (v38
                && ([a4 matchingSchemes],
                    v39 = objc_claimAutoreleasedReturnValue(),
                    int v40 = [v39 containsObject:v38],
                    v39,
                    v40))
              {
                a1 = v83;
                v41 = v36;
                id v36 = v83[8];
              }
              else
              {
                v41 = [a4 patchedSchemeForScheme:v38];
                if (v41)
                {
                  v42 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v83[8] resolvingAgainstBaseURL:0];
                  [v42 setScheme:v41];
                  uint64_t v76 = [v42 URL];

                  a1 = v83;
                  id v36 = (id)v76;
                  id v12 = v78;
                }
                else
                {
                  a1 = v83;
                }
              }

              v43 = [a4 actionsWithURL:v36 result:0 context:v25];
              -[DDActionGroup insertActions:atIndex:](v86, v43, 0);
            }
            else
            {
              id v36 = [a4 actionsWithURL:v35 result:0 context:v25];
              -[DDActionGroup appendActions:](v86, v36);
            }

            uint64_t v17 = v79;
            uint64_t v14 = v81;
          }
        }
        else
        {
          id v22 = 0;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
    }
    while (v16);
  }

  v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v75, "count"));
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v45 = v75;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v90;
    id obja = v44;
    id v82 = v45;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v90 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v89 + 1) + 8 * j);
        v51 = [v50 value];
        if (v51)
        {
          if (([v44 containsObject:v51] & 1) == 0)
          {
            [v44 addObject:v51];
            if (![v88 isEqualToString:@"mailto"]
              || (dd_handleIsChatBot(v51) & 1) == 0)
            {
              v52 = (void *)MEMORY[0x1E4F1CB10];
              v53 = NSString;
              v54 = objc_msgSend(v51, "dd_encodedEmail");
              v55 = [v53 stringWithFormat:@"%@:%@", v88, v54];
              v56 = [v52 URLWithString:v55];

              v57 = [v83 context];
              if (v57)
              {
                v58 = [v83 context];
                v59 = (void *)[v58 mutableCopy];
              }
              else
              {
                v59 = [MEMORY[0x1E4F1CA60] dictionary];
              }

              v60 = [v50 label];

              if (v60)
              {
                v61 = (void *)MEMORY[0x1E4F1BA20];
                v62 = [v50 label];
                v63 = [v61 localizedStringForLabel:v62];
                [v59 setObject:v63 forKey:@"ContactLabel"];
              }
              [v59 setObject:v51 forKey:@"ContactValue"];
              if (v12 && [v51 isEqualToString:v12])
              {
                id v64 = v56;
                v65 = [v83[8] scheme];
                uint64_t v66 = [v65 lowercaseString];

                v80 = (void *)v66;
                if (v66
                  && ([a4 matchingSchemes],
                      v67 = objc_claimAutoreleasedReturnValue(),
                      int v68 = [v67 containsObject:v66],
                      v67,
                      v68))
                {
                  v69 = v83;
                  v70 = v64;
                  id v64 = v83[8];
                }
                else
                {
                  v70 = [a4 patchedSchemeForScheme:v66];
                  v69 = v83;
                  if (v70)
                  {
                    v71 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v83[8] resolvingAgainstBaseURL:0];
                    [v71 setScheme:v70];
                    uint64_t v77 = [v71 URL];

                    id v64 = (id)v77;
                  }
                }

                v72 = objc_msgSend(a4, "actionsWithURL:result:context:", v64, objc_msgSend(v69, "result"), v59);
                -[DDActionGroup insertActions:atIndex:](v86, v72, 0);

                id v12 = v78;
              }
              else
              {
                id v64 = [a4 actionsWithURL:v56 result:0 context:v59];
                -[DDActionGroup appendActions:](v86, v64);
              }

              v44 = obja;
              id v45 = v82;
            }
          }
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v89 objects:v97 count:16];
    }
    while (v47);
  }

  id v10 = v74;
  id v11 = v75;
LABEL_66:

  return v86;
}

- (uint64_t)_phoneNumberIsBusiness:(uint64_t)a1
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    if (v4)
    {
      id v6 = *(void **)(a1 + 136);
      if (!v6 || ([v6 isEqualToString:v5] & 1) == 0)
      {
        if (dd_isLSTrusted()
          && ([MEMORY[0x1E4F223E0] defaultWorkspace],
              uint64_t v7 = objc_claimAutoreleasedReturnValue(),
              int v8 = [v7 applicationIsInstalled:@"com.apple.MobileSMS"],
              v7,
              !v8))
        {
          int v10 = 0;
          id v9 = 0;
        }
        else
        {
          uint64_t v7 = +[DDDetectionController sharedController];
          id v9 = [v7 _businessItemForNumber:v5 messageable:a1 + 128];
          int v10 = 1;
        }
        objc_storeStrong((id *)(a1 + 120), v9);
        if (v10)
        {
        }
        objc_storeStrong((id *)(a1 + 136), a2);
      }
    }
    else
    {
      id v11 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = 0;

      id v12 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0;

      *(unsigned char *)(a1 + 128) = 0;
    }
    a1 = *(void *)(a1 + 120) != 0;
  }

  return a1;
}

- (id)_menuActionsForBusinessWithNumber:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && -[DDPersonAction _phoneNumberIsBusiness:](a1, v3))
  {
    id v4 = +[DDActionGroup emptyGroup]();
    id v5 = [(id)a1 url];
    uint64_t v6 = [(id)a1 result];
    uint64_t v7 = [(id)a1 context];
    int v8 = +[DDCallKitAudioAction actionsWithURL:v5 result:v6 context:v7 defaultAppsOnly:1];
    id v9 = [v8 firstObject];

    if (v9)
    {
      v9[82] = 1;
      [v9 setBizItem:*(void *)(a1 + 120)];
      -[DDActionGroup appendAction:]((uint64_t)v4, v9);
    }
    if (*(unsigned char *)(a1 + 128) && +[DDAction isAvailable])
    {
      int v10 = [*(id *)(a1 + 120) messagesOpenURL];
      id v11 = [(id)a1 context];
      id v12 = +[DDAction actionWithURL:v10 result:0 context:v11];

      [v12 setBizItem:*(void *)(a1 + 120)];
      -[DDActionGroup appendAction:]((uint64_t)v4, v12);
    }
    uint64_t v13 = [(id)a1 url];
    uint64_t v14 = [(id)a1 result];
    uint64_t v15 = [(id)a1 context];
    uint64_t v16 = +[DDAction actionWithURL:v13 result:v14 context:v15];
    -[DDActionGroup appendAction:]((uint64_t)v4, v16);

    if (*(unsigned char *)(a1 + 119))
    {
      uint64_t v17 = [(id)a1 context];
      v18 = +[DDAction actionWithURL:0 result:0 context:v17];
      -[DDActionGroup appendAction:]((uint64_t)v4, v18);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (_BYTE)_menuActionsForPersonWithNumber:(void *)a3 email:
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    v29 = 0;
    goto LABEL_53;
  }
  +[DDActionGroup emptyGroup]();
  uint64_t v7 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  -[DDActionGroup setInlinedGroup:]((uint64_t)v7, 1);
  int v8 = objc_msgSend(*(id *)(a1 + 64), "dd_isAnySimpleTelephonyScheme");
  id v9 = [*(id *)(a1 + 64) scheme];
  v53 = [v9 lowercaseString];

  v50 = v6;
  id v51 = v5;
  uint64_t v55 = a1;
  LODWORD(v49) = v8;
  HIDWORD(v49) = -[DDAction calloutFlavor](a1);
  if (!HIDWORD(v49))
  {
    v54 = [*(id *)(a1 + 32) phoneNumbers];
    v56 = [*(id *)(a1 + 32) emailAddresses];
    goto LABEL_9;
  }
  if (!v5)
  {
    v54 = 0;
    if (v6) {
      goto LABEL_5;
    }
LABEL_8:
    v56 = 0;
    goto LABEL_9;
  }
  int v10 = (void *)MEMORY[0x1E4F1BA20];
  id v11 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
  id v12 = [v10 labeledValueWithLabel:0 value:v11];
  v64[0] = v12;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];

  if (!v6) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1BA20], "labeledValueWithLabel:value:", 0, v6, v49);
  v63 = v13;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];

LABEL_9:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  v61[2] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
  v52 = v7;
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v58;
    if (v51) {
      v20 = v51;
    }
    else {
      v20 = v50;
    }
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(v14);
        }
        id v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v22, "isAvailable", v49))
        {
          v23 = -[DDPersonAction _appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:]((id *)v55, v54, v56, v22, v20, @"tel");
          if (-[DDActionGroup count]((uint64_t)v23))
          {
            if (v53)
            {
              v24 = [v22 matchingSchemes];
              unsigned int v25 = [v24 containsObject:v53];

              if (v25) {
                uint64_t v26 = v18;
              }
              else {
                uint64_t v26 = v17;
              }
              v18 += v25;
              uint64_t v7 = v52;
            }
            else
            {
              uint64_t v26 = v17;
            }
            -[DDActionGroup insertGroup:atIndex:](v7, v23, v26);
            ++v17;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v16);
  }

  id v6 = v50;
  id v5 = v51;
  if (+[DDAction isAvailable])
  {
    v27 = objc_opt_class();
    v28 = -[DDPersonAction _appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:]((id *)v55, 0, v56, v27, v50, @"mailto");
    if (-[DDActionGroup count]((uint64_t)v28))
    {
      if ((v49 & 1) != 0 || ![v53 isEqualToString:@"mailto"]) {
        -[DDActionGroup appendGroup:](v7, v28);
      }
      else {
        -[DDActionGroup insertGroup:atIndex:](v7, v28, 0);
      }
    }
  }
  -[DDActionGroup regroupByService](v7);
  +[DDActionGroup emptyGroup]();
  v29 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if ((v49 & 0x100000000) == 0)
  {
    uint64_t v30 = -[DDActionGroup extractDefaultActions]((id *)v7);
    -[DDActionGroup appendGroup:](v29, v30);
  }
  -[DDActionGroup appendGroup:](v29, v7);
  if (!*(unsigned char *)(v55 + 118)
    && +[DDAddToAddressBookAction isAvailable])
  {
    v31 = [(id)v55 url];
    uint64_t v32 = [(id)v55 result];
    v33 = [(id)v55 context];
    v34 = +[DDAction actionWithURL:v31 result:v32 context:v33];

    if (*(unsigned char *)(v55 + 119)) {
      -[DDActionGroup insertAction:atIndex:]((uint64_t)v29, v34, 0);
    }
    else {
      -[DDActionGroup appendAction:]((uint64_t)v29, v34);
    }
  }
  if (dd_phoneNumberResultCanBeRdarLink(objc_msgSend((id)v55, "result", v49)))
  {
    v35 = [(id)v55 url];
    id v36 = v35;
    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      v38 = objc_msgSend(MEMORY[0x1E4F5F150], "resultFromCoreResult:", objc_msgSend((id)v55, "result"));
      id v37 = [v38 url];
    }
    v39 = objc_msgSend(v37, "dd_rdarLinkFromTelScheme");
    if (v39)
    {
      int v40 = [(id)v55 context];
      v41 = +[DDAction actionWithURL:v39 result:0 context:v40];
      -[DDActionGroup appendAction:]((uint64_t)v29, v41);
    }
  }
  v42 = [(id)v55 url];
  uint64_t v43 = [(id)v55 result];
  v44 = [(id)v55 context];
  id v45 = +[DDAction actionWithURL:v42 result:v43 context:v44];
  -[DDActionGroup appendAction:]((uint64_t)v29, v45);

  if (*(unsigned char *)(v55 + 119))
  {
    uint64_t v46 = [(id)v55 context];
    uint64_t v47 = +[DDAction actionWithURL:0 result:0 context:v46];
    -[DDActionGroup appendAction:]((uint64_t)v29, v47);
  }
LABEL_53:

  return v29;
}

- (id)menuActions
{
  id v3 = [(DDAction *)self url];
  if (v3)
  {
    id v4 = DDPersonActionsSupportedSchemes();
    id v5 = objc_msgSend(v3, "dd_phoneNumberFromValidSchemes:", v4);
    id v6 = objc_msgSend(v3, "dd_emailFromValidSchemes:", v4);
    uint64_t v7 = objc_msgSend(v6, "dd_userFriendlyEmail");

    if (v5)
    {
      int v8 = -[DDPersonAction _menuActionsForBusinessWithNumber:]((uint64_t)self, v5);
      id v9 = v8;
      if (-[DDActionGroup count]((uint64_t)v8))
      {
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      id v9 = -[DDPersonAction _menuActionsForPersonWithNumber:email:]((uint64_t)self, v5, v7);

      goto LABEL_9;
    }
LABEL_7:
    int v8 = 0;
    goto LABEL_8;
  }
  if (*(&self->_fromCNContact + 6))
  {
    id v4 = DDPersonActionsSupportedSchemes();
    id v5 = 0;
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (CGSize)suggestedContentSize
{
  double v2 = 414.0;
  double v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)prefersActionMenuStyle
{
  return 1;
}

- (id)menuHeaderViewController
{
  menuHeaderViewController = self->_menuHeaderViewController;
  if (!menuHeaderViewController)
  {
    gotLoadHelper_x8__OBJC_CLASS___BCError(v2);
    objc_opt_class();
    id v5 = [(BCSBusinessItem *)self->_bizItem makeBrandedHeaderViewController];
    id v6 = self->_menuHeaderViewController;
    self->_menuHeaderViewController = v5;

    menuHeaderViewController = self->_menuHeaderViewController;
  }
  return menuHeaderViewController;
}

- (BOOL)menuHasHeaderView
{
  double v3 = [(DDAction *)self url];
  if (v3)
  {
    id v4 = DDPersonActionsSupportedSchemes();
    id v5 = objc_msgSend(v3, "dd_phoneNumberFromValidSchemes:", v4);
  }
  else
  {
    id v5 = 0;
  }
  if (-[DDPersonAction _phoneNumberIsBusiness:]((uint64_t)self, v5)
    && self->_bizItem
    && self->_bizItemIsMessageable)
  {
    if (dd_isDeviceLocked())
    {
      id v6 = [(DDPersonAction *)self menuHeaderViewController];
      char v7 = [v6 _canShowWhileLocked];
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)menuHeaderView
{
  double v3 = [(DDAction *)self url];
  if (v3)
  {
    id v4 = DDPersonActionsSupportedSchemes();
    id v5 = objc_msgSend(v3, "dd_phoneNumberFromValidSchemes:", v4);
  }
  else
  {
    id v5 = 0;
  }
  if (!-[DDPersonAction _phoneNumberIsBusiness:]((uint64_t)self, v5)) {
    goto LABEL_11;
  }
  if (!self->_bizItem) {
    goto LABEL_11;
  }
  if (!self->_bizItemIsMessageable) {
    goto LABEL_11;
  }
  if (dd_isDeviceLocked())
  {
    id v6 = [(DDPersonAction *)self menuHeaderViewController];
    int v7 = [v6 _canShowWhileLocked];

    if (!v7) {
      goto LABEL_11;
    }
  }
  int v8 = [(DDPersonAction *)self menuHeaderViewController];
  id v9 = [v8 view];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v9];
    id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:-16.0];
    [v11 setActive:1];

    id v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:4 relatedBy:0 toItem:v9 attribute:4 multiplier:1.0 constant:16.0];
    [v12 setActive:1];

    uint64_t v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:1 relatedBy:0 toItem:v9 attribute:1 multiplier:1.0 constant:-16.0];
    [v13 setActive:1];

    uint64_t v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:2 relatedBy:0 toItem:v9 attribute:2 multiplier:1.0 constant:16.0];
    [v14 setActive:1];
  }
  else
  {
LABEL_11:
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuHeaderViewController, 0);
  objc_storeStrong((id *)&self->_lastBizNumberFetched, 0);
  objc_storeStrong((id *)&self->_bizItem, 0);
}

@end