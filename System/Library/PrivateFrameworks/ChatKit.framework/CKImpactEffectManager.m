@interface CKImpactEffectManager
+ (BOOL)identifierIsAnimatedImpactEffect:(id)a3;
+ (BOOL)identifierIsValidImpactEffect:(id)a3;
+ (BOOL)identifierShouldPlayInWindow:(id)a3;
+ (id)effectIdentifiers;
+ (id)localizedEffectNameForEffectWithIdentifier:(id)a3;
+ (id)maskingStringForID:(id)a3;
- (BOOL)isAnimating;
- (BOOL)isDisabled;
- (CABackdropLayer)expressiveSendAnimationBackdrop;
- (CKAudioController)audioController;
- (CKBalloonView)expressiveSendAnimationBalloon;
- (CKBalloonView)originalBalloonView;
- (CKImpactEffectManager)init;
- (CKSendAnimationBalloonProvider)sendAnimationBalloonProvider;
- (CKSendAnimationManagerDelegate)delegate;
- (CKSendAnimationManagerDelegate)sendAnimationManagerDelegate;
- (NSString)animatingIdentifier;
- (NSString)undoSendChatItemGUID;
- (UIScrollView)expressiveSendScrollView;
- (UIWindow)expressiveSendAnimationWindow;
- (id)_sendAnimationContextForIdentifier:(id)a3 message:(id)a4 isSender:(BOOL)a5 beginAnimationFromTranscriptPresentedState:(BOOL)a6;
- (id)cloneBalloonForAnimationWithChatItem:(id)a3;
- (void)_animateLastMessage:(id)a3 withEffectIdentifier:(id)a4 beginAnimationFromTranscriptPresentedState:(BOOL)a5;
- (void)_audioSessionOptionsWillChange:(id)a3;
- (void)_cleanupExpressiveSendComponents;
- (void)_renderEffectInView;
- (void)_renderEffectInWindow;
- (void)_sizeAnimationWindow;
- (void)_visibleCells:(id *)a3 aboveItem:(id)a4;
- (void)animateMessages:(id)a3;
- (void)animateMessages:(id)a3 withEffectIdentifier:(id)a4 beginAnimationFromTranscriptPresentedState:(BOOL)a5;
- (void)animationDidFinishWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)dealloc;
- (void)matchScrollViewOffset:(id)a3;
- (void)playSoundForEffectIdentifier:(id)a3;
- (void)playSoundForPopAnimation;
- (void)playUndoSendAnimationForChatItem:(id)a3;
- (void)popAnimationDidBegin;
- (void)setAudioController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressiveSendAnimationBackdrop:(id)a3;
- (void)setExpressiveSendAnimationBalloon:(id)a3;
- (void)setExpressiveSendAnimationWindow:(id)a3;
- (void)setExpressiveSendScrollView:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setOriginalBalloonView:(id)a3;
- (void)setSendAnimationBalloonProvider:(id)a3;
- (void)setSendAnimationManagerDelegate:(id)a3;
- (void)setUndoSendChatItemGUID:(id)a3;
- (void)setupAudioPlayerWithURL:(id)a3;
- (void)stopAllEffects;
- (void)stopPlayingSound;
@end

@implementation CKImpactEffectManager

+ (id)effectIdentifiers
{
  if (effectIdentifiers_onceToken != -1) {
    dispatch_once(&effectIdentifiers_onceToken, &__block_literal_global_120);
  }
  v2 = (void *)effectIdentifiers_effects;

  return v2;
}

void __42__CKImpactEffectManager_effectIdentifiers__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.MobileSMS.expressivesend.invisibleink";
  v2[1] = @"com.apple.MobileSMS.expressivesend.gentle";
  v2[2] = @"com.apple.MobileSMS.expressivesend.loud";
  v2[3] = @"com.apple.MobileSMS.expressivesend.impact";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)effectIdentifiers_effects;
  effectIdentifiers_effects = v0;
}

+ (id)maskingStringForID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_IMPACT_MESSAGE";
LABEL_11:
    v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.loud"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_LOUD_MESSAGE";
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.gentle"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_GENTLE_MESSAGE";
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_INVISIBLE_INK_MESSAGE";
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.focus"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_FOCUS_MESSAGE";
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

+ (BOOL)identifierIsValidImpactEffect:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.loud"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.gentle"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.focus"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.pop"];
  }

  return v4;
}

+ (BOOL)identifierIsAnimatedImpactEffect:(id)a3
{
  id v4 = a3;
  if ([a1 identifierIsValidImpactEffect:v4]) {
    int v5 = [v4 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)identifierShouldPlayInWindow:(id)a3
{
  int v3 = [a3 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"];
  if (v3) {
    LOBYTE(v3) = CKIsRunningInMessages() != 0;
  }
  return v3;
}

+ (id)localizedEffectNameForEffectWithIdentifier:(id)a3
{
  uint64_t v3 = localizedEffectNameForEffectWithIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&localizedEffectNameForEffectWithIdentifier__onceToken, &__block_literal_global_114_1);
  }
  int v5 = [(id)localizedEffectNameForEffectWithIdentifier__effectNames objectForKey:v4];

  return v5;
}

void __68__CKImpactEffectManager_localizedEffectNameForEffectWithIdentifier___block_invoke()
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"com.apple.MobileSMS.expressivesend.invisibleink";
  uint64_t v0 = CKFrameworkBundle();
  v1 = [v0 localizedStringForKey:@"IMPACT_PICKER_INVISIBLE_INK_NAME_NORMAL_CASE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v11[0] = v1;
  v10[1] = @"com.apple.MobileSMS.expressivesend.gentle";
  v2 = CKFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"IMPACT_PICKER_GENTLE_NAME_NORMAL_CASE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v11[1] = v3;
  v10[2] = @"com.apple.MobileSMS.expressivesend.loud";
  id v4 = CKFrameworkBundle();
  int v5 = [v4 localizedStringForKey:@"IMPACT_PICKER_LOUD_NAME_NORMAL_CASE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v11[2] = v5;
  v10[3] = @"com.apple.MobileSMS.expressivesend.impact";
  v6 = CKFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"IMPACT_PICKER_IMPACT_NAME_NORMAL_CASE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v11[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v9 = (void *)localizedEffectNameForEffectWithIdentifier__effectNames;
  localizedEffectNameForEffectWithIdentifier__effectNames = v8;
}

- (CKImpactEffectManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKImpactEffectManager;
  return [(CKImpactEffectManager *)&v3 init];
}

- (void)animateMessages:(id)a3
{
  id v5 = [a3 lastObject];
  id v4 = [v5 expressiveSendStyleID];
  [(CKImpactEffectManager *)self _animateLastMessage:v5 withEffectIdentifier:v4 beginAnimationFromTranscriptPresentedState:0];
}

- (void)animateMessages:(id)a3 withEffectIdentifier:(id)a4 beginAnimationFromTranscriptPresentedState:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 lastObject];
  [(CKImpactEffectManager *)self _animateLastMessage:v9 withEffectIdentifier:v8 beginAnimationFromTranscriptPresentedState:v5];
}

- (void)setupAudioPlayerWithURL:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [[CKImpactEffectMediaObject alloc] initWithImpactEffectAudioFileURL:v4];

  v6 = [CKAudioController alloc];
  v12[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v8 = [(CKAudioController *)v6 initWithMediaObjects:v7 conversation:0];
  audioController = self->_audioController;
  self->_audioController = v8;

  [(CKAudioController *)self->_audioController setShouldUseAVPlayer:CKSupportsAdvancedHaptics()];
  [(CKAudioController *)self->_audioController setDelegate:self];
  [(CKAudioController *)self->_audioController setShouldStopPlayingWhenSilent:1];
  [(CKAudioController *)self->_audioController setShouldDuckOthers:0];
  [(CKAudioController *)self->_audioController setShouldUseSpeaker:1];
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11 = +[CKAudioSessionController shareInstance];
  [v10 addObserver:self selector:sel__audioSessionOptionsWillChange_ name:@"CKAudioSessionControllerSessionOptionsWillChangeNotification" object:v11];
}

- (void)playSoundForEffectIdentifier:(id)a3
{
  id v7 = a3;
  if ([v7 isEqualToString:@"com.apple.MobileSMS.expressivesend.pop"])
  {
    id v4 = @"Pop";
  }
  else
  {
    if (![v7 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"]) {
      goto LABEL_8;
    }
    id v4 = @"Slam";
  }
  BOOL v5 = CKFrameworkBundle();
  v6 = [v5 URLForResource:v4 withExtension:@"m4r"];

  [(CKImpactEffectManager *)self setupAudioPlayerWithURL:v6];
  [(CKAudioController *)self->_audioController prepareToPlay];
  if (([v7 isEqualToString:@"com.apple.MobileSMS.expressivesend.pop"] & 1) == 0) {
    [(CKAudioController *)self->_audioController play];
  }

LABEL_8:
}

- (void)playSoundForPopAnimation
{
}

- (void)playUndoSendAnimationForChatItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKImpactEffectManager *)self delegate];
  v6 = [v5 collectionViewControllerForImpactEffectManager:self];

  id v7 = [v6 chatItems];
  id v8 = [v4 message];
  uint64_t v9 = objc_msgSend(v7, "__ck_indexOfPartOfMessage:withMessagePartIndex:", v8, objc_msgSend(v4, "index"));
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKImpactEffectManager playUndoSendAnimationForChatItem:](v10);
    }
  }
  else
  {
    v10 = [v7 objectAtIndexedSubscript:v9];
    v11 = [v10 IMChatItem];
    v12 = [v11 guid];

    undoSendChatItemGUID = self->_undoSendChatItemGUID;
    self->_undoSendChatItemGUID = v12;
  }
  v14 = [v4 message];
  [(CKImpactEffectManager *)self _animateLastMessage:v14 withEffectIdentifier:@"com.apple.MobileSMS.expressivesend.pop" beginAnimationFromTranscriptPresentedState:0];
}

- (void)_animateLastMessage:(id)a3 withEffectIdentifier:(id)a4 beginAnimationFromTranscriptPresentedState:(BOOL)a5
{
  BOOL v21 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [v6 fileTransferGUIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
      uint64_t v14 = [MEMORY[0x1E4F6BCC8] sharedInstance];
      v15 = [(id)v14 transferForGUID:v13];

      LOBYTE(v14) = +[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForFileTransfer:v15];
      if (v14) {
        goto LABEL_19;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (![(CKImpactEffectManager *)self isAnimating]
    && ![(CKImpactEffectManager *)self isDisabled]
    && +[CKImpactEffectManager identifierIsAnimatedImpactEffect:v7])
  {
    [(CKImpactEffectManager *)self playSoundForEffectIdentifier:v7];
    if (_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__onceToken != -1) {
      dispatch_once(&_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__onceToken, &__block_literal_global_139);
    }
    [(id)_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator setAnimationDelegate:self];
    if (+[CKImpactEffectManager identifierShouldPlayInWindow:v7])
    {
      [(CKImpactEffectManager *)self _renderEffectInWindow];
    }
    id v8 = -[CKImpactEffectManager _sendAnimationContextForIdentifier:message:isSender:beginAnimationFromTranscriptPresentedState:](self, "_sendAnimationContextForIdentifier:message:isSender:beginAnimationFromTranscriptPresentedState:", v7, v6, [v6 isFromMe], v21);
    v16 = [(CKImpactEffectManager *)self expressiveSendAnimationBackdrop];
    [v8 setBackdropLayer:v16];

    v17 = [(CKImpactEffectManager *)self delegate];
    [v17 sendAnimationManagerWillStartAnimation:self context:v8];

    if ([v7 isEqualToString:@"com.apple.MobileSMS.expressivesend.pop"])
    {
      v18 = [(CKImpactEffectManager *)self delegate];
      v19 = [v18 collectionViewControllerForImpactEffectManager:self];

      v20 = [v19 view];
      [v8 setContainerView:v20];
    }
    [(id)_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator beginAnimationWithSendAnimationContext:v8];
LABEL_19:
  }
}

void __109__CKImpactEffectManager__animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState___block_invoke()
{
  uint64_t v0 = objc_alloc_init(CKChatControllerDummyAnimator);
  v1 = (void *)_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator;
  _animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator = (uint64_t)v0;
}

- (void)_renderEffectInView
{
  objc_super v3 = [(CKImpactEffectManager *)self delegate];
  id v19 = [v3 collectionViewControllerForImpactEffectManager:self];

  id v4 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F42DB0]);
  [v5 setClipsToBounds:0];
  [v5 setAutoresizingMask:18];
  [(CKImpactEffectManager *)self setExpressiveSendScrollView:v5];
  id v6 = [v4 view];
  [v6 addSubview:v5];

  id v7 = [v19 delegate];
  id v8 = [v7 transcriptCollectionViewControllerOuterEffectPresentingView:v19];

  uint64_t v9 = [v4 view];
  [v8 addSubview:v9];

  uint64_t v10 = [v19 collectionView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v5, "setFrame:", v12, v14, v16, v18);
}

- (void)_renderEffectInWindow
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKImpactEffectManager *)self expressiveSendAnimationWindow];
  if (!v3)
  {
    id v4 = [(CKImpactEffectManager *)self delegate];
    id v5 = [v4 collectionViewControllerForImpactEffectManager:self];

    id v3 = objc_alloc_init(MEMORY[0x1E4F43058]);
    id v6 = [MEMORY[0x1E4F428B8] clearColor];
    [v3 setBackgroundColor:v6];

    id v7 = [v5 view];
    id v8 = [v7 window];
    uint64_t v9 = [v8 windowScene];
    [v3 setWindowScene:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F42DB0]);
    [v11 setClipsToBounds:0];
    [v11 setAutoresizingMask:18];
    [(CKImpactEffectManager *)self setExpressiveSendScrollView:v11];
    double v12 = [v10 view];
    [v12 addSubview:v11];

    [v3 setRootViewController:v10];
    [v3 setUserInteractionEnabled:1];
    double v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v13 setValue:&unk_1EDF166E8 forKey:@"inputRadius"];
    [v13 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    id v14 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    [v14 setAllowsGroupBlending:0];
    v19[0] = v13;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v14 setFilters:v15];

    double v16 = [v3 rootViewController];
    double v17 = [v16 view];
    double v18 = [v17 layer];
    [v18 insertSublayer:v14 atIndex:0];

    [(CKImpactEffectManager *)self setExpressiveSendAnimationBackdrop:v14];
  }
  [(CKImpactEffectManager *)self setExpressiveSendAnimationWindow:v3];
  [(CKImpactEffectManager *)self _sizeAnimationWindow];
  [v3 setHidden:0];
}

- (void)matchScrollViewOffset:(id)a3
{
  id v4 = a3;
  id v9 = [(CKImpactEffectManager *)self expressiveSendScrollView];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(v9, "setContentOffset:", v6, v8);
}

- (void)stopAllEffects
{
  [(CKImpactEffectManager *)self stopPlayingSound];

  [(CKImpactEffectManager *)self _cleanupExpressiveSendComponents];
}

- (void)_sizeAnimationWindow
{
  id v3 = [(CKImpactEffectManager *)self delegate];
  id v4 = [v3 collectionViewControllerForImpactEffectManager:self];
  id v31 = [v4 collectionView];

  double v5 = [(CKImpactEffectManager *)self expressiveSendAnimationWindow];
  double v6 = [v31 superview];
  [v31 frame];
  objc_msgSend(v6, "convertRect:toView:", 0);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 presentationControllerWindowLevel];
  objc_msgSend(v5, "setLevel:");

  double v16 = [v31 superview];
  [v31 frame];
  objc_msgSend(v16, "convertRect:toView:", 0);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  long long v25 = [v5 rootViewController];
  long long v26 = [v25 view];
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  v27 = [(CKImpactEffectManager *)self expressiveSendAnimationBackdrop];
  uint64_t v28 = [v5 rootViewController];
  v29 = [v28 view];
  v30 = [v29 layer];
  [v30 bounds];
  objc_msgSend(v27, "setFrame:");
}

- (id)_sendAnimationContextForIdentifier:(id)a3 message:(id)a4 isSender:(BOOL)a5 beginAnimationFromTranscriptPresentedState:(BOOL)a6
{
  BOOL v71 = a6;
  BOOL v72 = a5;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  id v8 = a4;
  v75 = objc_alloc_init(CKSendAnimationContext);
  v76 = self;
  double v9 = [(CKImpactEffectManager *)self delegate];
  double v10 = [v9 collectionViewControllerForImpactEffectManager:v76];
  v74 = [v10 chatItems];

  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__38;
  v113 = __Block_byref_object_dispose__38;
  id v114 = 0;
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __120__CKImpactEffectManager__sendAnimationContextForIdentifier_message_isSender_beginAnimationFromTranscriptPresentedState___block_invoke;
  v106[3] = &unk_1E5628400;
  id v70 = v8;
  id v107 = v70;
  v108 = &v109;
  [v74 enumerateObjectsWithOptions:2 usingBlock:v106];
  id v105 = 0;
  [(CKImpactEffectManager *)v76 _visibleCells:&v105 aboveItem:v110[5]];
  id v11 = v105;
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v11;
  v83 = v12;
  uint64_t v79 = [obj countByEnumeratingWithState:&v101 objects:v119 count:16];
  if (v79)
  {
    uint64_t v78 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v79; ++i)
      {
        if (*(void *)v102 != v78) {
          objc_enumerationMutation(obj);
        }
        double v14 = [*(id *)(*((void *)&v101 + 1) + 8 * i) contentView];
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        double v15 = [v14 subviews];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v97 objects:v118 count:16];
        if (v16)
        {
          v80 = v14;
          id v17 = 0;
          id v84 = v15;
          uint64_t v86 = *(void *)v98;
          do
          {
            uint64_t v18 = 0;
            double v19 = v17;
            do
            {
              if (*(void *)v98 != v86) {
                objc_enumerationMutation(v84);
              }
              id v17 = *(id *)(*((void *)&v97 + 1) + 8 * v18);

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v95 = 0u;
                long long v96 = 0u;
                long long v93 = 0u;
                long long v94 = 0u;
                double v20 = [v17 subviews];
                id v21 = (id)[v20 countByEnumeratingWithState:&v93 objects:v117 count:16];
                if (v21)
                {
                  double v22 = v13;
                  uint64_t v23 = *(void *)v94;
                  while (2)
                  {
                    for (j = 0; j != v21; j = (char *)j + 1)
                    {
                      if (*(void *)v94 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      long long v25 = *(void **)(*((void *)&v93 + 1) + 8 * (void)j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v21 = v25;
                        goto LABEL_23;
                      }
                    }
                    id v21 = (id)[v20 countByEnumeratingWithState:&v93 objects:v117 count:16];
                    if (v21) {
                      continue;
                    }
                    break;
                  }
LABEL_23:
                  double v12 = v83;
                  double v13 = v22;
                }
              }
              else
              {
                id v21 = 0;
              }
              [v12 addObject:v17];
              if (v21)
              {
                [v13 addObject:v21];
              }
              else
              {
                long long v26 = [MEMORY[0x1E4F1CA98] null];
                [v13 addObject:v26];
              }
              ++v18;
              double v19 = v17;
            }
            while (v18 != v16);
            uint64_t v16 = [v84 countByEnumeratingWithState:&v97 objects:v118 count:16];
          }
          while (v16);

          double v14 = v80;
          double v15 = v84;
        }
      }
      uint64_t v79 = [obj countByEnumeratingWithState:&v101 objects:v119 count:16];
    }
    while (v79);
  }

  v27 = v76;
  if (+[CKImpactEffectManager identifierShouldPlayInWindow:](CKImpactEffectManager, "identifierShouldPlayInWindow:", v73)&& [v12 count])
  {
    uint64_t v28 = [(CKImpactEffectManager *)v76 delegate];
    v29 = [v28 collectionViewControllerForImpactEffectManager:v76];

    v30 = [v29 collectionView];
    id v31 = [v29 balloonViewForChatItem:v110[5]];
    v32 = [obj firstObject];
    uint64_t v33 = [v29 chatItemForCell:v32];

    v34 = [(CKImpactEffectManager *)v76 expressiveSendAnimationBalloon];

    if (v34)
    {
      v35 = [(CKImpactEffectManager *)v76 expressiveSendAnimationBalloon];
      CKBalloonViewReuse(v35);
    }
    v36 = [(CKImpactEffectManager *)v76 cloneBalloonForAnimationWithChatItem:v33];
    [(CKImpactEffectManager *)v76 setExpressiveSendAnimationBalloon:v36];
    uint64_t v37 = [v12 indexOfObject:v31];
    if (v37 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v38 = 0;
    }
    else {
      uint64_t v38 = v37;
    }
    v87 = [v12 objectAtIndex:v38];
    [v87 frame];
    double v40 = v39;
    double v42 = v41;
    v43 = [v87 superview];
    objc_msgSend(v43, "convertPoint:toView:", v30, v40, v42);
    double v45 = v44;
    double v47 = v46;

    v48 = [v30 layer];
    int v49 = [v48 flipsHorizontalAxis];

    if (v49)
    {
      [v30 frame];
      double v45 = v50 - v45;
    }
    [v36 frame];
    objc_msgSend(v36, "setFrame:", v45, v47);
    [(CKImpactEffectManager *)v76 setOriginalBalloonView:v87];
    if (v36)
    {
      [v12 replaceObjectAtIndex:v38 withObject:v36];
    }
    else if (IMOSLoggingEnabled())
    {
      v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v51, OS_LOG_TYPE_INFO, "_sendAnimationContextForIdentifier clone is nil", buf, 2u);
      }
    }
    v81 = (void *)v33;
    id v85 = v30;
    v52 = v29;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v53 = [v36 subviews];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v88 objects:v116 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v89;
      while (2)
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v89 != v55) {
            objc_enumerationMutation(v53);
          }
          v57 = *(void **)(*((void *)&v88 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v60 = v57;

            v58 = v85;
            v59 = v81;
            if (v60) {
              [v13 replaceObjectAtIndex:0 withObject:v60];
            }
            goto LABEL_59;
          }
        }
        uint64_t v54 = [v53 countByEnumeratingWithState:&v88 objects:v116 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }

    v58 = v85;
    v59 = v81;
    id v60 = 0;
LABEL_59:

    v61 = [(CKImpactEffectManager *)v76 expressiveSendScrollView];
    [v61 addSubview:v36];

    v27 = v76;
  }
  v62 = [v12 firstObject];
  [v12 removeFirstObject];
  while (v62)
  {
    v63 = objc_opt_class();
    if ([v63 isSubclassOfClass:objc_opt_class()])
    {
      id v67 = v62;
      id v115 = v67;
      v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];

LABEL_69:
      v27 = v76;
      goto LABEL_71;
    }
    uint64_t v64 = [v12 firstObject];

    [v12 removeFirstObject];
    v27 = v76;
    [v13 removeFirstObject];
    v62 = (void *)v64;
  }
  if (IMOSLoggingEnabled())
  {
    v65 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v65, OS_LOG_TYPE_INFO, "_sendAnimationContextForIdentifier throwBalloonView is nil", buf, 2u);
    }

    v66 = 0;
    goto LABEL_69;
  }
  v66 = 0;
LABEL_71:
  [(CKSendAnimationContext *)v75 setAnimatableViews:v12];
  [(CKSendAnimationContext *)v75 setAnimatableTextViews:v13];
  [(CKSendAnimationContext *)v75 setImpactIdentifier:v73];
  [(CKSendAnimationContext *)v75 setThrowBalloonViews:v66];
  [(CKSendAnimationContext *)v75 setIsSender:v72];
  v68 = [(CKImpactEffectManager *)v27 expressiveSendScrollView];
  [(CKSendAnimationContext *)v75 setContainerView:v68];

  [(CKSendAnimationContext *)v75 setBeginAnimationFromTranscriptPresentedState:v71];
  _Block_object_dispose(&v109, 8);

  return v75;
}

void __120__CKImpactEffectManager__sendAnimationContextForIdentifier_message_isSender_beginAnimationFromTranscriptPresentedState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v13;
  if (isKindOfClass)
  {
    double v9 = [v13 IMChatItem];
    if (([v9 isReplyContextPreview] & 1) == 0)
    {
      double v10 = [v9 guid];
      id v11 = [*(id *)(a1 + 32) guid];
      int v12 = [v10 containsString:v11];

      if (v12)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *a4 = 1;
      }
    }

    id v8 = v13;
  }
}

- (id)cloneBalloonForAnimationWithChatItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = CKBalloonViewForClass((objc_class *)[v3 impactBalloonViewClass]);
    [v4 configureForMessagePart:v3];
    [v4 setCanUseOpaqueMask:0];
    [v3 size];
    double v6 = v5;
    double v8 = v7;
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    int v11 = [v3 itemIsReplyContextPreview];
    int v12 = +[CKUIBehavior sharedBehaviors];
    id v13 = v12;
    if (v11)
    {
      [v12 replyBalloonMaskSizeWithTailShape:1 isMultiline:0];
      [v4 setWantsSkinnyMask:v6 < v14];

      double v15 = +[CKUIBehavior sharedBehaviors];
      [v15 textReplyPreviewBalloonMinHeight];
    }
    else
    {
      [v12 balloonMaskSizeWithTailShape:1 isMultiline:0];
      [v4 setWantsSkinnyMask:v6 < v17];

      double v15 = +[CKUIBehavior sharedBehaviors];
      [v15 textBalloonMinHeight];
    }
    [v4 setWantsMultilineMask:v8 > v16];

    objc_msgSend(v4, "setFrame:", v9, v10, v6, v8);
    [v4 layoutIfNeeded];
    [v4 prepareForDisplayIfNeeded];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)popAnimationDidBegin
{
  id v3 = [(CKImpactEffectManager *)self delegate];
  id v4 = [v3 collectionViewControllerForImpactEffectManager:self];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CKImpactEffectManager_popAnimationDidBegin__block_invoke;
  v6[3] = &unk_1E5620AF8;
  id v7 = v4;
  double v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __45__CKImpactEffectManager_popAnimationDidBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPoppedBalloonGUIDHiddenUntilNextChatItemUpdate:*(void *)(*(void *)(a1 + 40) + 96)];
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v16 = a3;
  id v4 = [v16 impactIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"];

  if ((v5 & 1) == 0)
  {
    [MEMORY[0x1E4F39CF8] flush];
    double v6 = [(CKImpactEffectManager *)self delegate];
    id v7 = [v6 collectionViewControllerForImpactEffectManager:self];

    double v8 = [v7 collectionView];
    [v8 setNeedsLayout];

    double v9 = [v7 collectionView];
    [v9 layoutIfNeeded];

    double v10 = [v16 impactIdentifier];
    LODWORD(v9) = +[CKImpactEffectManager identifierShouldPlayInWindow:v10];

    if (v9)
    {
      int v11 = [(CKImpactEffectManager *)self expressiveSendScrollView];
      int v12 = [v7 collectionView];
      [v12 contentOffset];
      objc_msgSend(v11, "setContentOffset:");

      id v13 = [(CKImpactEffectManager *)self originalBalloonView];
      [v13 setHidden:1];
    }
    double v14 = [(CKImpactEffectManager *)self delegate];
    double v15 = [v14 chatForSendAnimationManager:self];

    [v15 beginHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B938]];
    [(CKImpactEffectManager *)self setIsAnimating:1];
  }
}

- (void)animationDidFinishWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [v4 impactIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 impactIdentifier];
    [(CKImpactEffectManager *)self setIsAnimating:0];
    if (+[CKImpactEffectManager identifierShouldPlayInWindow:v7])
    {
      double v8 = [(CKImpactEffectManager *)self originalBalloonView];
      [v8 setHidden:0];

      [(CKImpactEffectManager *)self setOriginalBalloonView:0];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__CKImpactEffectManager_animationDidFinishWithContext___block_invoke;
    v10[3] = &unk_1E5620AF8;
    void v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __55__CKImpactEffectManager_animationDidFinishWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupExpressiveSendComponents];
  char v5 = objc_alloc_init(CKSendAnimationContext);
  [(CKSendAnimationContext *)v5 setImpactIdentifier:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 sendAnimationManagerDidStopAnimation:*(void *)(a1 + 32) context:v5];

  id v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [v3 chatForSendAnimationManager:*(void *)(a1 + 32)];

  [v4 endHoldingChatItemsUpdatesForReason:*MEMORY[0x1E4F6B938]];
}

- (void)_visibleCells:(id *)a3 aboveItem:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(CKImpactEffectManager *)self delegate];
  double v8 = [v7 collectionViewControllerForImpactEffectManager:self];

  id v9 = [v8 collectionView];
  double v10 = [v9 indexPathsForVisibleItems];
  id v11 = (void *)[v10 mutableCopy];

  double v24 = v5;
  id v21 = [v8 cellForChatItem:v5];
  int v12 = objc_msgSend(v9, "indexPathForCell:");
  [v11 sortUsingComparator:&__block_literal_global_166_0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v22 = v11;
  id v13 = [v11 reverseObjectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v19 = [v18 row];
        if (v19 <= [v12 row])
        {
          double v20 = [v9 cellForItemAtIndexPath:v18];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v6 addObject:v20];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  if (a3) {
    *a3 = v6;
  }
}

uint64_t __49__CKImpactEffectManager__visibleCells_aboveItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 row];
  uint64_t v6 = [v4 row];

  if (v5 >= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (void)_cleanupExpressiveSendComponents
{
  id v3 = [(CKImpactEffectManager *)self expressiveSendAnimationBalloon];
  [v3 removeFromSuperview];

  id v4 = [(CKImpactEffectManager *)self expressiveSendAnimationBalloon];
  CKBalloonViewReuse(v4);

  [(CKImpactEffectManager *)self setExpressiveSendAnimationBalloon:0];
  uint64_t v5 = [(CKImpactEffectManager *)self expressiveSendScrollView];
  id v8 = [v5 superview];

  [v8 setHidden:1];
  uint64_t v6 = [(CKImpactEffectManager *)self expressiveSendScrollView];
  [v6 removeFromSuperview];

  [(CKImpactEffectManager *)self setExpressiveSendScrollView:0];
  uint64_t v7 = [(CKImpactEffectManager *)self expressiveSendAnimationWindow];
  [v7 setHidden:1];

  [(CKImpactEffectManager *)self setExpressiveSendAnimationWindow:0];
  [(CKImpactEffectManager *)self setExpressiveSendAnimationBackdrop:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = +[CKAudioSessionController shareInstance];
  [v3 removeObserver:self name:@"CKAudioSessionControllerSessionOptionsWillChangeNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)CKImpactEffectManager;
  [(CKImpactEffectManager *)&v5 dealloc];
}

- (void)_audioSessionOptionsWillChange:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"CKAudioSessionControllerSessionNotificationOptionsKey"];

  if (v5 && ([v5 unsignedIntegerValue] & 2) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CKImpactEffectManager__audioSessionOptionsWillChange___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__CKImpactEffectManager__audioSessionOptionsWillChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopPlayingSound];
}

- (void)stopPlayingSound
{
  audioController = self->_audioController;
  if (audioController)
  {
    [(CKAudioController *)audioController pause];
    id v4 = self->_audioController;
    [(CKAudioController *)v4 stop];
  }
}

- (CKSendAnimationManagerDelegate)sendAnimationManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->sendAnimationManagerDelegate);

  return (CKSendAnimationManagerDelegate *)WeakRetained;
}

- (void)setSendAnimationManagerDelegate:(id)a3
{
}

- (CKSendAnimationBalloonProvider)sendAnimationBalloonProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->sendAnimationBalloonProvider);

  return (CKSendAnimationBalloonProvider *)WeakRetained;
}

- (void)setSendAnimationBalloonProvider:(id)a3
{
}

- (CKSendAnimationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSendAnimationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (NSString)animatingIdentifier
{
  return self->_animatingIdentifier;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (UIWindow)expressiveSendAnimationWindow
{
  return self->_expressiveSendAnimationWindow;
}

- (void)setExpressiveSendAnimationWindow:(id)a3
{
}

- (CKBalloonView)expressiveSendAnimationBalloon
{
  return self->_expressiveSendAnimationBalloon;
}

- (void)setExpressiveSendAnimationBalloon:(id)a3
{
}

- (CKBalloonView)originalBalloonView
{
  return self->_originalBalloonView;
}

- (void)setOriginalBalloonView:(id)a3
{
}

- (UIScrollView)expressiveSendScrollView
{
  return self->_expressiveSendScrollView;
}

- (void)setExpressiveSendScrollView:(id)a3
{
}

- (CABackdropLayer)expressiveSendAnimationBackdrop
{
  return self->_expressiveSendAnimationBackdrop;
}

- (void)setExpressiveSendAnimationBackdrop:(id)a3
{
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (NSString)undoSendChatItemGUID
{
  return self->_undoSendChatItemGUID;
}

- (void)setUndoSendChatItemGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSendChatItemGUID, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_expressiveSendAnimationBackdrop, 0);
  objc_storeStrong((id *)&self->_expressiveSendScrollView, 0);
  objc_storeStrong((id *)&self->_originalBalloonView, 0);
  objc_storeStrong((id *)&self->_expressiveSendAnimationBalloon, 0);
  objc_storeStrong((id *)&self->_expressiveSendAnimationWindow, 0);
  objc_storeStrong((id *)&self->_animatingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->sendAnimationBalloonProvider);

  objc_destroyWeak((id *)&self->sendAnimationManagerDelegate);
}

- (void)playUndoSendAnimationForChatItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Unable to find chat item index coresponding to chat item", v1, 2u);
}

@end