@interface CKChatControllerDummyAnimator
- (CAEmitterLayer)dustEmitter;
- (CKSendAnimationManager)animationDelegate;
- (OS_dispatch_group)throwAnimationGroup;
- (double)_throwAnimationDurationScaleFactorForThrownBalloonAttributes:(id)a3 finalBalloonFrames:(id)a4;
- (id)_animationCompletionBlockWithSendAnimationContext:(id)a3;
- (id)balloonViewFadeInAnimationForConvertedCurrentMediaTime:(double)a3;
- (id)popAnimationCompletionBlock;
- (void)_beginFocusAnimationWithContext:(id)a3;
- (void)_beginGentleAnimationWithContext:(id)a3;
- (void)_beginImpactAnimationWithContext:(id)a3;
- (void)_beginLoudAnimationsWithContext:(id)a3;
- (void)_beginPopAnimationWithContext:(id)a3;
- (void)_beginThrowAnimationWithContext:(id)a3;
- (void)_configureForVFD:(id)a3;
- (void)_configureQuickReplySendAnimationGroup:(id)a3 withSendAnimationContext:(id)a4;
- (void)_prepareToAnimateForSendAnimationContext:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginAnimationWithSendAnimationContext:(id)a3;
- (void)beginQuickReplyAnimationWithSendAnimationContext:(id)a3;
- (void)popRendererViewDidBegin:(id)a3;
- (void)popRendererViewDidFinish:(id)a3;
- (void)popRendererViewPlaySound:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setDustEmitter:(id)a3;
- (void)setPopAnimationCompletionBlock:(id)a3;
- (void)setThrowAnimationGroup:(id)a3;
- (void)stopAnimationWithSendAnimationContext:(id)a3;
@end

@implementation CKChatControllerDummyAnimator

- (void)_prepareToAnimateForSendAnimationContext:(id)a3
{
  id v5 = a3;
  v4 = [(CKChatControllerDummyAnimator *)self animationDelegate];
  [(CKChatControllerDummyAnimator *)self stopAnimationWithSendAnimationContext:v5];
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  [MEMORY[0x1E4F39CF8] begin];
  if (objc_opt_respondsToSelector()) {
    [v4 animationWillBeginWithContext:v5];
  }
}

- (void)stopAnimationWithSendAnimationContext:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 impactIdentifier];

  if (v5)
  {
    v62 = self;
    v63 = v4;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    obuint64_t j = [v4 animatableViews];
    uint64_t v6 = [obj countByEnumeratingWithState:&v110 objects:v118 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v84 = *(void *)v111;
      uint64_t v82 = *MEMORY[0x1E4F3A490];
      long long v78 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      long long v80 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      long long v74 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      long long v76 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v70 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      long long v72 = *MEMORY[0x1E4F39B10];
      long long v66 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      long long v68 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v111 != v84) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
          v11 = [v9 layer];
          v12 = [v11 presentationLayer];
          v13 = [v12 valueForKey:@"transform"];
          [v10 setFromValue:v13];

          long long v106 = v80;
          long long v107 = v78;
          long long v108 = v76;
          long long v109 = v74;
          long long v102 = v72;
          long long v103 = v70;
          long long v104 = v68;
          long long v105 = v66;
          v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v102];
          [v10 setToValue:v14];

          [v10 setDuration:0.2];
          [v10 setAdditive:1];
          v15 = [MEMORY[0x1E4F39C10] functionWithName:v82];
          [v10 setTimingFunction:v15];

          v16 = [v9 layer];
          [v16 setAllowsEdgeAntialiasing:0];

          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          uint64_t v17 = [&unk_1EDF15A40 countByEnumeratingWithState:&v98 objects:v117 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v99;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v99 != v19) {
                  objc_enumerationMutation(&unk_1EDF15A40);
                }
                uint64_t v21 = *(void *)(*((void *)&v98 + 1) + 8 * j);
                v22 = [v9 layer];
                [v22 removeAnimationForKey:v21];
              }
              uint64_t v18 = [&unk_1EDF15A40 countByEnumeratingWithState:&v98 objects:v117 count:16];
            }
            while (v18);
          }
          [v9 addAnimation:v10 forKey:@"finish"];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v110 objects:v118 count:16];
      }
      while (v7);
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obja = [v63 throwBalloonViews];
    uint64_t v23 = [obja countByEnumeratingWithState:&v94 objects:v116 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v85 = *(void *)v95;
      long long v81 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      long long v83 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      long long v77 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      long long v79 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v73 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      long long v75 = *MEMORY[0x1E4F39B10];
      long long v69 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      long long v71 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      uint64_t v67 = *MEMORY[0x1E4F3A490];
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v95 != v85) {
            objc_enumerationMutation(obja);
          }
          v26 = *(void **)(*((void *)&v94 + 1) + 8 * k);
          v27 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
          v28 = [v26 layer];
          v29 = [v28 presentationLayer];
          v30 = [v29 valueForKey:@"transform"];
          [v27 setFromValue:v30];

          long long v106 = v83;
          long long v107 = v81;
          long long v108 = v79;
          long long v109 = v77;
          long long v102 = v75;
          long long v103 = v73;
          long long v104 = v71;
          long long v105 = v69;
          v31 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v102];
          [v27 setToValue:v31];

          [v27 setDuration:0.2];
          [v27 setAdditive:1];
          v32 = [MEMORY[0x1E4F39C10] functionWithName:v67];
          [v27 setTimingFunction:v32];

          v33 = [v26 layer];
          [v33 setAllowsEdgeAntialiasing:0];

          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          uint64_t v34 = [&unk_1EDF15A58 countByEnumeratingWithState:&v90 objects:v115 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v91;
            do
            {
              for (uint64_t m = 0; m != v35; ++m)
              {
                if (*(void *)v91 != v36) {
                  objc_enumerationMutation(&unk_1EDF15A58);
                }
                uint64_t v38 = *(void *)(*((void *)&v90 + 1) + 8 * m);
                v39 = [v26 layer];
                [v39 removeAnimationForKey:v38];
              }
              uint64_t v35 = [&unk_1EDF15A58 countByEnumeratingWithState:&v90 objects:v115 count:16];
            }
            while (v35);
          }
          [v26 addAnimation:v27 forKey:@"finish"];
        }
        uint64_t v24 = [obja countByEnumeratingWithState:&v94 objects:v116 count:16];
      }
      while (v24);
    }

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v40 = [v63 animatableTextViews];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v86 objects:v114 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v87;
      uint64_t v44 = *MEMORY[0x1E4F3A238];
      do
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          if (*(void *)v87 != v43) {
            objc_enumerationMutation(v40);
          }
          v46 = *(void **)(*((void *)&v86 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v47 = [v46 subviews];
            uint64_t v48 = [v47 count];

            if (v48)
            {
              v49 = [v46 subviews];
              v50 = [v49 firstObject];

              v51 = [v46 subviews];
              v52 = [v51 firstObject];
              [v52 setContentScaleFactor:0.0];

              v53 = [v50 layer];
              [v53 setMinificationFilter:v44];

              v54 = [v50 layer];
              [v54 removeAnimationForKey:@"darken"];
            }
            v55 = [v46 layer];
            [v55 removeAnimationForKey:@"position.y"];

            v56 = [v46 layer];
            [v56 removeAnimationForKey:@"position.x"];

            v57 = [v46 layer];
            [v57 removeAnimationForKey:@"transform.scale"];

            v58 = [v46 layer];
            [v58 removeAnimationForKey:@"transform.rotation.z"];

            v59 = [v46 layer];
            [v59 removeAnimationForKey:@"opacity"];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v86 objects:v114 count:16];
      }
      while (v42);
    }

    v60 = [(CKChatControllerDummyAnimator *)v62 dustEmitter];

    id v4 = v63;
    if (v60)
    {
      v61 = [(CKChatControllerDummyAnimator *)v62 dustEmitter];
      [v61 removeFromSuperlayer];

      [(CKChatControllerDummyAnimator *)v62 setDustEmitter:0];
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v4 = [(CKChatControllerDummyAnimator *)self throwAnimationGroup];
  if (v4)
  {
    id v5 = v4;
    dispatch_group_leave(v4);
    id v4 = v5;
  }
}

- (id)_animationCompletionBlockWithSendAnimationContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 impactIdentifier];
  uint64_t v6 = [(CKChatControllerDummyAnimator *)self animationDelegate];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__CKChatControllerDummyAnimator__animationCompletionBlockWithSendAnimationContext___block_invoke;
  aBlock[3] = &unk_1E5620AA8;
  id v7 = v4;
  id v14 = v7;
  v15 = self;
  id v8 = v6;
  id v16 = v8;
  v9 = _Block_copy(aBlock);
  char v10 = [v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.pop"];
  if (([v7 shouldRepeat] & 1) == 0 && v5 && (v10 & 1) == 0) {
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v9];
  }
  v11 = _Block_copy(v9);

  return v11;
}

void __83__CKChatControllerDummyAnimator__animationCompletionBlockWithSendAnimationContext___block_invoke(id *a1)
{
  id v6 = [a1[4] throwBalloonViews];
  if (![v6 count]) {
    goto LABEL_3;
  }
  v2 = [v6 firstObject];
  v3 = [v2 layer];
  id v4 = [v3 animationKeys];
  char v5 = [v4 containsObject:@"finish"];

  if ((v5 & 1) == 0) {
LABEL_3:
  }
    [a1[5] stopAnimationWithSendAnimationContext:a1[4]];
  [a1[6] animationDidFinishWithContext:a1[4]];
}

- (void)beginAnimationWithSendAnimationContext:(id)a3
{
  id v7 = a3;
  [(CKChatControllerDummyAnimator *)self _prepareToAnimateForSendAnimationContext:v7];
  id v4 = [(CKChatControllerDummyAnimator *)self _animationCompletionBlockWithSendAnimationContext:v7];
  char v5 = [v7 impactIdentifier];
  if ([v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"])
  {
    [(CKChatControllerDummyAnimator *)self _beginImpactAnimationWithContext:v7];
  }
  else if ([v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.gentle"])
  {
    [(CKChatControllerDummyAnimator *)self _beginGentleAnimationWithContext:v7];
  }
  else if ([v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.loud"])
  {
    [(CKChatControllerDummyAnimator *)self _beginLoudAnimationsWithContext:v7];
  }
  else if ([v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.focus"])
  {
    [(CKChatControllerDummyAnimator *)self _beginFocusAnimationWithContext:v7];
  }
  else if ([v5 isEqualToString:@"com.apple.MobileSMS.expressivesend.pop"])
  {
    [(CKChatControllerDummyAnimator *)self setPopAnimationCompletionBlock:v4];
    [(CKChatControllerDummyAnimator *)self _beginPopAnimationWithContext:v7];
  }
  else if (!v5)
  {
    id v6 = dispatch_group_create();
    [(CKChatControllerDummyAnimator *)self setThrowAnimationGroup:v6];
    [(CKChatControllerDummyAnimator *)self _beginThrowAnimationWithContext:v7];
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], v4);
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)beginQuickReplyAnimationWithSendAnimationContext:(id)a3
{
  id v4 = a3;
  [(CKChatControllerDummyAnimator *)self _prepareToAnimateForSendAnimationContext:v4];
  group = dispatch_group_create();
  [(CKChatControllerDummyAnimator *)self _configureQuickReplySendAnimationGroup:group withSendAnimationContext:v4];
  char v5 = [(CKChatControllerDummyAnimator *)self _animationCompletionBlockWithSendAnimationContext:v4];

  dispatch_group_notify(group, MEMORY[0x1E4F14428], v5);
  [MEMORY[0x1E4F39CF8] commit];
}

- (double)_throwAnimationDurationScaleFactorForThrownBalloonAttributes:(id)a3 finalBalloonFrames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x3FF0000000000000;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __113__CKChatControllerDummyAnimator__throwAnimationDurationScaleFactorForThrownBalloonAttributes_finalBalloonFrames___block_invoke;
  v10[3] = &unk_1E5628400;
  id v7 = v6;
  id v11 = v7;
  v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  double v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __113__CKChatControllerDummyAnimator__throwAnimationDurationScaleFactorForThrownBalloonAttributes_finalBalloonFrames___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v30 = a2;
  id v7 = [MEMORY[0x1E4F1CA98] null];

  double v8 = v30;
  if (v7 != v30)
  {
    v9 = [v30 throwBalloonView];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v9 frame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      uint64_t v18 = [*(id *)(a1 + 32) objectAtIndex:a3];
      [v18 CGRectValue];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;

      v32.origin.x = v20;
      v32.origin.y = v22;
      v32.size.width = v24;
      v32.size.height = v26;
      double Width = CGRectGetWidth(v32);
      v33.origin.x = v11;
      v33.origin.y = v13;
      v33.size.width = v15;
      v33.size.height = v17;
      if (Width > CGRectGetWidth(v33) * 0.66)
      {
        v28 = +[CKUIBehavior sharedBehaviors];
        [v28 sendAnimationDuration];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0.35 / v29;

        *a4 = 1;
      }
    }

    double v8 = v30;
  }
}

- (void)_beginThrowAnimationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 framesOfAddedChatItems];
  id v6 = [(CKChatControllerDummyAnimator *)self throwAnimationGroup];
  id v7 = [v4 throwBalloonViewAttributesCollection];

  [(CKChatControllerDummyAnimator *)self _throwAnimationDurationScaleFactorForThrownBalloonAttributes:v7 finalBalloonFrames:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke;
  v11[3] = &unk_1E562B878;
  uint64_t v15 = v8;
  id v12 = v5;
  CGFloat v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v11];
}

void __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v289[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [v5 throwBalloonView];
    id v7 = [*(id *)(a1 + 32) objectAtIndex:a3];
    [v7 CGRectValue];
    CGFloat v267 = v9;
    CGFloat v268 = v8;
    double v265 = v10;
    double v266 = v11;

    id v12 = [v6 layer];
    [v12 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v14 = v13;

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();
    CGFloat v17 = (uint64_t *)MEMORY[0x1E4F39FA0];
    uint64_t v18 = &qword_18F81D000;
    double v19 = &qword_18F81D000;
    v264 = v5;
    double v263 = v14;
    if (v16 & 1) != 0 || (isKindOfClass)
    {
      char v251 = isKindOfClass;
      CGFloat v20 = +[CKUIBehavior sharedBehaviors];
      [v20 sendAnimationDuration];
      double v250 = v21;

      CGFloat v22 = [v5 supplementaryViews];
      double v23 = [v22 objectForKey:@"CKSendAnimationSupplementaryViewTextViewContainerView"];
      CGFloat v24 = [v22 objectForKey:@"CKSendAnimationSupplementaryViewSendButtonSnapshot"];
      v262 = [v22 objectForKey:@"CKSendAnimationSupplementaryViewWhiteTextFadeView"];
      v252 = v22;
      double v25 = [v22 objectForKey:@"CKSendAnimationSupplementaryViewAudioMessagePillViewSnapshot"];
      [v23 setHidden:0];
      [v23 frame];
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      [v24 position];
      v255 = v24;
      if (v24)
      {
        double Width = v34;
        double v37 = v35;
      }
      else
      {
        v290.origin.CGFloat x = v27;
        v290.origin.CGFloat y = v29;
        v290.size.width = v31;
        v290.size.double height = v33;
        double Width = CGRectGetWidth(v290);
        v291.origin.CGFloat x = v27;
        v291.origin.CGFloat y = v29;
        v291.size.width = v31;
        v291.size.double height = v33;
        double v37 = CGRectGetHeight(v291) * 0.5;
      }
      v292.origin.CGFloat x = v27;
      v292.origin.CGFloat y = v29;
      v292.size.width = v31;
      v292.size.double height = v33;
      double v38 = Width / CGRectGetWidth(v292);
      v293.origin.CGFloat x = v27;
      v293.origin.CGFloat y = v29;
      v293.size.width = v31;
      v293.size.double height = v33;
      double v39 = v37 / CGRectGetHeight(v293);
      v40 = [v23 layer];
      objc_msgSend(v40, "setAnchorPoint:", v38, v39);

      [v6 frame];
      double v42 = v41;
      double v44 = v43;
      double v257 = v33;
      CGFloat v260 = v27;
      double v46 = v45;
      CGFloat v47 = v29;
      double v49 = v48;
      v50 = [v6 layer];
      objc_msgSend(v50, "setAnchorPoint:", 1.0, 0.5);

      objc_msgSend(v6, "setFrame:", v42, v44, v46, v49);
      [v262 frame];
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      v59 = [v6 layer];
      [v59 anchorPoint];
      double v61 = v60;
      double v63 = v62;
      v64 = [v262 layer];
      objc_msgSend(v64, "setAnchorPoint:", v61, v63);

      objc_msgSend(v262, "setFrame:", v52, v54, v56, v58);
      [v25 frame];
      double v66 = v65;
      double v68 = v67;
      double v70 = v69;
      double v72 = v71;
      long long v73 = [v6 layer];
      [v73 anchorPoint];
      double v75 = v74;
      double v77 = v76;
      long long v78 = [v25 layer];
      objc_msgSend(v78, "setAnchorPoint:", v75, v77);

      v253 = v25;
      objc_msgSend(v25, "setFrame:", v66, v68, v70, v72);
      v294.origin.CGFloat x = v260;
      v294.origin.CGFloat y = v47;
      v294.size.width = v31;
      v294.size.double height = v257;
      double MinX = CGRectGetMinX(v294);
      long long v80 = [v23 layer];
      [v80 anchorPoint];
      double v82 = v81;
      v295.origin.CGFloat x = v260;
      v295.origin.CGFloat y = v47;
      v295.size.width = v31;
      v295.size.double height = v257;
      double v246 = MinX + v82 * CGRectGetWidth(v295);
      v296.origin.CGFloat x = v260;
      v296.origin.CGFloat y = v47;
      v296.size.width = v31;
      v296.size.double height = v257;
      double MinY = CGRectGetMinY(v296);
      uint64_t v84 = [v23 layer];
      [v84 anchorPoint];
      double v86 = v85;
      v297.origin.CGFloat x = v260;
      v297.origin.CGFloat y = v47;
      v297.size.width = v31;
      v297.size.double height = v257;
      double v244 = MinY + v86 * CGRectGetHeight(v297);

      v298.origin.CGFloat x = v268;
      v298.origin.CGFloat y = v267;
      v298.size.width = v265;
      v298.size.double height = v266;
      double MaxX = CGRectGetMaxX(v298);
      long long v88 = [v23 layer];
      [v88 anchorPoint];
      double v90 = 1.0 - v89;
      v299.origin.CGFloat x = v260;
      v299.origin.CGFloat y = v47;
      double rect = v31;
      v299.size.width = v31;
      v299.size.double height = v257;
      double v91 = MaxX - v90 * CGRectGetWidth(v299);
      v300.origin.CGFloat x = v268;
      v300.origin.CGFloat y = v267;
      v300.size.width = v265;
      v300.size.double height = v266;
      double v92 = CGRectGetMinY(v300);
      long long v93 = [v23 layer];
      [v93 anchorPoint];
      double v95 = v94;
      v301.origin.CGFloat x = v268;
      v301.origin.CGFloat y = v267;
      v301.size.width = v265;
      v301.size.double height = v266;
      double v96 = v92 + v95 * CGRectGetHeight(v301);

      long long v97 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
      [v97 setBeginTime:v263];
      [v97 setRemovedOnCompletion:0];
      uint64_t v98 = *v17;
      [v97 setFillMode:*v17];
      LODWORD(v99) = 1056629064;
      LODWORD(v100) = 1035276987;
      LODWORD(v101) = 1053793305;
      LODWORD(v102) = 1063767565;
      long long v103 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v99 :v100 :v101 :v102];
      [v97 setTimingFunction:v103];

      long long v104 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v246, v244);
      [v97 setFromValue:v104];

      long long v105 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v91, v96);
      [v97 setToValue:v105];

      [v97 setDuration:v250 * *(double *)(a1 + 56)];
      [v97 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v97];
      if (v23)
      {
        [v23 addAnimation:v97 forKey:@"position"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      long long v106 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
      [v106 setBeginTime:v263];
      long long v107 = (void *)MEMORY[0x1E4F29238];
      CATransform3DMakeScale(&v285, 1.0, 1.0, 1.0);
      long long v108 = [v107 valueWithCATransform3D:&v285];
      v289[0] = v108;
      long long v109 = (void *)MEMORY[0x1E4F29238];
      CATransform3DMakeScale(&v284, 0.88, 0.88, 1.0);
      long long v110 = [v109 valueWithCATransform3D:&v284];
      v289[1] = v110;
      long long v111 = (void *)MEMORY[0x1E4F29238];
      CATransform3DMakeScale(&v283, 1.0, 1.0, 1.0);
      long long v112 = [v111 valueWithCATransform3D:&v283];
      v289[2] = v112;
      v261 = v23;
      long long v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v289 count:3];
      [v106 setValues:v113];

      LODWORD(v114) = 1059648963;
      LODWORD(v115) = 1.0;
      LODWORD(v116) = 1.0;
      v117 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v114 :0.0 :v115 :v116];
      v288[0] = v117;
      LODWORD(v118) = 1059022886;
      LODWORD(v119) = 1064176765;
      v120 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v118 :v119];
      v288[1] = v120;
      v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:v288 count:2];
      [v106 setTimingFunctions:v121];

      [v106 setKeyTimes:&unk_1EDF15A70];
      [v106 setRemovedOnCompletion:0];
      [v106 setFillMode:v98];
      [v106 setDuration:v250 * *(double *)(a1 + 56)];
      [v106 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v106];
      if (v23)
      {
        [v23 addAnimation:v106 forKey:@"transform"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      [v6 frame];
      double v123 = v122;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v124 = [v264 throwBalloonView];
        v125 = [v124 textView];
        id v126 = objc_alloc_init(MEMORY[0x1E4F42F58]);
        v127 = [v125 attributedText];
        [v126 setAttributedText:v127];

        [v126 sizeToFit];
        [v126 bounds];
        double v123 = CGRectGetWidth(v302);
      }
      double v128 = 1.0 - v123 / 303.0 * (v123 / 303.0);
      v129 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds.size"];
      [v129 setDuration:v250 * *(double *)(a1 + 56)];
      double v130 = 2.0;
      if (v128 >= 1.0) {
        double v130 = v128 + 1.0;
      }
      float v131 = v130;
      *(float *)&double v130 = v131;
      [v129 setSpeed:v130];
      [v129 setBeginTime:v263];
      [v129 setRemovedOnCompletion:0];
      v132 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", rect, v257);
      [v129 setFromValue:v132];

      v133 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v265, v266);
      [v129 setToValue:v133];

      [v129 setFillMode:v98];
      LODWORD(v134) = 1.0;
      LODWORD(v135) = 1057668432;
      LODWORD(v136) = 1058306785;
      v137 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v135 :0.0 :v136 :v134];
      [v129 setTimingFunction:v137];

      [v129 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v129];
      v138 = [v6 layer];
      [v138 addAnimation:v129 forKey:@"bounds.width"];

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v139 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v139 setBeginTime:v263];
      [v139 setDuration:*(double *)(a1 + 56) * 0.3];
      [v139 setFromValue:&unk_1EDF17568];
      [v139 setToValue:&unk_1EDF17548];
      uint64_t v258 = *MEMORY[0x1E4F39FA8];
      objc_msgSend(v139, "setFillMode:");
      [v139 setRemovedOnCompletion:0];
      LODWORD(v140) = 0.5;
      LODWORD(v141) = 0.5;
      LODWORD(v142) = 1.0;
      v143 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v140 :0.0 :v141 :v142];
      [v139 setTimingFunction:v143];

      [v139 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v139];
      v144 = v262;
      if (v262 || (v144 = v253) != 0)
      {
        [v144 addAnimation:v139 forKey:@"opacity"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        [v144 addAnimation:v129 forKey:@"bounds.size"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      recta = [*(id *)(a1 + 40) balloonViewFadeInAnimationForConvertedCurrentMediaTime:v263];
      objc_msgSend(v6, "addAnimation:forKey:");
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v145 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
      [v145 setBeginTime:v263];
      [v145 setDuration:*(double *)(a1 + 56) * 0.25];
      v146 = (void *)MEMORY[0x1E4F29238];
      CATransform3DMakeScale(&v282, 1.0, 1.0, 1.0);
      v147 = [v146 valueWithBytes:&v282 objCType:"{CATransform3D=dddddddddddddddd}"];
      [v145 setFromValue:v147];

      v148 = (void *)MEMORY[0x1E4F29238];
      CATransform3DMakeScale(&v281, 0.0, 0.0, 1.0);
      v149 = [v148 valueWithBytes:&v281 objCType:"{CATransform3D=dddddddddddddddd}"];
      [v145 setToValue:v149];

      v150 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v145 setTimingFunction:v150];

      [v145 setRemovedOnCompletion:0];
      [v145 setFillMode:v258];
      [v145 setDelegate:*(void *)(a1 + 40)];
      v151 = v255;
      if (v255)
      {
        [v255 addAnimation:v145 forKey:@"transform"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      objc_opt_class();
      char v152 = objc_opt_isKindOfClass();
      CGFloat v17 = (uint64_t *)MEMORY[0x1E4F39FA0];
      if (v152)
      {
        v247 = v97;
        v153 = [v264 throwBalloonView];
        v154 = [v153 textView];
        v155 = [v154 text];
        int v156 = [v155 _isNaturallyRTL];

        v157 = v153;
        if (v156)
        {
          v245 = [v252 objectForKeyedSubscript:@"CKSendAnimationSupplementaryViewWhiteTextFadeViewRTL"];
          v158 = [v252 objectForKeyedSubscript:@"CKSendAnimationSupplementaryViewBlueTextFadeViewRTL"];
          v159 = [v157 textView];
          v160 = [v157 textView];
          [v160 bounds];
          objc_msgSend(v159, "convertRect:toView:", v261);
          CGFloat v162 = v161;
          CGFloat v164 = v163;
          CGFloat v166 = v165;
          CGFloat v168 = v167;

          v303.origin.CGFloat x = v162;
          v303.origin.CGFloat y = v164;
          v303.size.width = v166;
          v303.size.double height = v168;
          double v169 = CGRectGetMaxX(v303);
          [v158 frame];
          double v170 = v169 - CGRectGetMaxX(v304);
          v171 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
          [v171 setDuration:v250 * *(double *)(a1 + 56)];
          *(float *)&double v172 = v131;
          [v171 setSpeed:v172];
          [v171 setBeginTime:v263];
          [v171 setRemovedOnCompletion:0];
          v173 = [NSNumber numberWithDouble:v170];
          [v171 setByValue:v173];

          [v171 setFillMode:v258];
          LODWORD(v174) = 1.0;
          LODWORD(v175) = 1057668432;
          LODWORD(v176) = 1058306785;
          v177 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v175 :0.0 :v176 :v174];
          [v171 setTimingFunction:v177];

          [v171 setDelegate:*(void *)(a1 + 40)];
          [*(id *)(a1 + 40) _configureForVFD:v171];
          if (v158)
          {
            [v158 addAnimation:v171 forKey:@"position.x"];
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          }
          if (v245)
          {
            [v245 addAnimation:v171 forKey:@"position.x"];
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            [v245 addAnimation:v139 forKey:@"opacity"];
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          }
        }
        CGFloat v17 = (uint64_t *)MEMORY[0x1E4F39FA0];
        v151 = v255;
        long long v97 = v247;
      }

      id v5 = v264;
      double v19 = &qword_18F81D000;
      uint64_t v18 = &qword_18F81D000;
      char isKindOfClass = v251;
    }
    if (!(isKindOfClass & 1 | (([v6 isAudioMessage] & 1) == 0)))
    {
      v178 = (void *)MEMORY[0x1E4F42FF0];
      v275[0] = MEMORY[0x1E4F143A8];
      v275[1] = 3221225472;
      v275[2] = __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke_148;
      v275[3] = &unk_1E5621968;
      id v276 = v6;
      CGFloat v277 = v268;
      CGFloat v278 = v267;
      double v279 = v265;
      double v280 = v266;
      [v178 _animateUsingSpringWithDuration:0 delay:v275 options:0 mass:0.3 stiffness:0.0 damping:3.0 initialVelocity:500.0 animations:400.0 completion:1.0];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v179 = +[CKUIBehavior sharedBehaviors];
      [v179 sendAnimationDuration];
      double v259 = v180;

      [v6 frame];
      double v182 = v181;
      double v184 = v183;
      double v186 = v185;
      double v188 = v187;
      v189 = [v6 layer];
      objc_msgSend(v189, "setAnchorPoint:", 1.0, 0.5);

      objc_msgSend(v6, "setFrame:", v182, v184, v186, v188);
      [v6 frame];
      CGFloat x = v305.origin.x;
      CGFloat y = v305.origin.y;
      double v192 = v305.size.width;
      double height = v305.size.height;
      double v194 = CGRectGetMinX(v305);
      v195 = [v6 layer];
      [v195 anchorPoint];
      double v197 = v196;
      v306.origin.CGFloat x = x;
      v306.origin.CGFloat y = y;
      v306.size.width = v192;
      v306.size.double height = height;
      double v256 = v194 + v197 * CGRectGetWidth(v306);
      v307.origin.CGFloat x = x;
      v307.origin.CGFloat y = y;
      v307.size.width = v192;
      v307.size.double height = height;
      double v198 = CGRectGetMinY(v307);
      v199 = [v6 layer];
      [v199 anchorPoint];
      double v201 = v200;
      v308.origin.CGFloat x = x;
      v308.origin.CGFloat y = y;
      v308.size.width = v192;
      v308.size.double height = height;
      double v254 = v198 + v201 * CGRectGetHeight(v308);

      v309.origin.CGFloat y = v267;
      v309.origin.CGFloat x = v268;
      v309.size.width = v265;
      v309.size.double height = v266;
      double v202 = CGRectGetMaxX(v309);
      v203 = [v6 layer];
      [v203 anchorPoint];
      double v205 = 1.0 - v204;
      v310.origin.CGFloat x = x;
      v310.origin.CGFloat y = y;
      v310.size.width = v192;
      v310.size.double height = height;
      double v206 = v202 - v205 * CGRectGetWidth(v310);
      v311.origin.CGFloat x = v268;
      v311.origin.CGFloat y = v267;
      v311.size.width = v265;
      v311.size.double height = v266;
      double v207 = CGRectGetMinY(v311);
      v208 = [v6 layer];
      [v208 anchorPoint];
      double v210 = v209;
      v312.origin.CGFloat x = v268;
      v312.origin.CGFloat y = v267;
      v312.size.width = v265;
      v312.size.double height = v266;
      double v211 = v207 + v210 * CGRectGetHeight(v312);

      v212 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.y"];
      [v212 setBeginTime:v263];
      [v212 setRemovedOnCompletion:0];
      uint64_t v213 = *v17;
      [v212 setFillMode:*v17];
      LODWORD(v214) = *((_DWORD *)v18 + 702);
      LODWORD(v215) = 1035276987;
      LODWORD(v216) = 1053793305;
      LODWORD(v217) = 1063767565;
      v218 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v214 :v215 :v216 :v217];
      [v212 setTimingFunction:v218];

      v219 = [NSNumber numberWithDouble:v211 - v254];
      [v212 setByValue:v219];

      [v212 setDuration:v259 * *(double *)(a1 + 56)];
      [v212 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v212];
      [v6 addAnimation:v212 forKey:@"position.y"];
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v313.origin.CGFloat x = v268;
      v313.origin.CGFloat y = v267;
      v313.size.width = v265;
      v313.size.double height = v266;
      CGFloat v220 = CGRectGetWidth(v313);
      double v221 = 1.0 - v220 / 303.0 * (v220 / 303.0);
      v222 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
      [v222 setBeginTime:v263];
      [v222 setRemovedOnCompletion:0];
      uint64_t v269 = v213;
      [v222 setFillMode:v213];
      LODWORD(v223) = *((_DWORD *)v19 + 708);
      LODWORD(v224) = 1058306785;
      LODWORD(v225) = 1.0;
      v226 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v223 :0.0 :v224 :v225];
      [v222 setTimingFunction:v226];

      v227 = [NSNumber numberWithDouble:v206 - v256];
      [v222 setByValue:v227];

      [v222 setDuration:v259 * *(double *)(a1 + 56)];
      double v228 = 2.0;
      if (v221 >= 1.0) {
        double v228 = v221 + 1.0;
      }
      *(float *)&double v228 = v228;
      [v222 setSpeed:v228];
      [v222 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v222];
      [v6 addAnimation:v222 forKey:@"position.x"];
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v229 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
      [v229 setBeginTime:v263];
      memset(&v274, 0, sizeof(v274));
      CATransform3DMakeScale(&v274, 1.0, 1.0, 1.0);
      memset(&v273, 0, sizeof(v273));
      CATransform3DMakeScale(&v273, v265 / v192 * 0.88, v266 / height * 0.88, 1.0);
      memset(&v272, 0, sizeof(v272));
      v230 = [v6 layer];
      v231 = v230;
      if (v230) {
        [v230 transform];
      }
      else {
        memset(&v271, 0, sizeof(v271));
      }
      CATransform3DScale(&v272, &v271, v265 / v192, v266 / height, 1.0);

      CATransform3D v270 = v274;
      v232 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v270];
      v287[0] = v232;
      CATransform3D v270 = v273;
      v233 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v270];
      v287[1] = v233;
      CATransform3D v270 = v272;
      v234 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v270];
      v287[2] = v234;
      v235 = [MEMORY[0x1E4F1C978] arrayWithObjects:v287 count:3];
      [v229 setValues:v235];

      LODWORD(v236) = 1059648963;
      LODWORD(v237) = 1.0;
      LODWORD(v238) = 1.0;
      v239 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v236 :0.0 :v237 :v238];
      v286[0] = v239;
      LODWORD(v240) = 1059022886;
      LODWORD(v241) = 1064176765;
      v242 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v240 :v241];
      v286[1] = v242;
      v243 = [MEMORY[0x1E4F1C978] arrayWithObjects:v286 count:2];
      [v229 setTimingFunctions:v243];

      [v229 setKeyTimes:&unk_1EDF15A88];
      [v229 setRemovedOnCompletion:0];
      [v229 setFillMode:v269];
      [v229 setDuration:v259 * *(double *)(a1 + 56)];
      [v229 setDelegate:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) _configureForVFD:v229];
      [v6 addAnimation:v229 forKey:@"transform"];
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));

      id v5 = v264;
    }
  }
}

uint64_t __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke_148(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_configureQuickReplySendAnimationGroup:(id)a3 withSendAnimationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CKChatControllerDummyAnimator *)self setThrowAnimationGroup:v6];
  double v8 = [v7 framesOfAddedChatItems];
  double v9 = [v7 throwBalloonViewAttributesCollection];
  [(CKChatControllerDummyAnimator *)self _throwAnimationDurationScaleFactorForThrownBalloonAttributes:v9 finalBalloonFrames:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__CKChatControllerDummyAnimator__configureQuickReplySendAnimationGroup_withSendAnimationContext___block_invoke;
  v14[3] = &unk_1E562B8A0;
  uint64_t v18 = v10;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  [v9 enumerateObjectsUsingBlock:v14];
}

void __97__CKChatControllerDummyAnimator__configureQuickReplySendAnimationGroup_withSendAnimationContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [v5 throwBalloonView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v124 = [v5 supplementaryViews];
      id v7 = [v124 objectForKey:@"CKSendAnimationSupplementaryViewTextViewContainerView"];
      double v122 = [v124 objectForKey:@"CKSendAnimationSupplementaryViewQuickReplySnapshot"];
      double v123 = [v124 objectForKey:@"CKSendAnimationSupplementaryViewWhiteTextFadeView"];
      rect_24 = [v124 objectForKey:@"CKSendAnimationSupplementaryViewAudioMessagePillViewSnapshot"];
      if (v7 && v122 && v123)
      {
        double v8 = [v122 superview];
        [v8 insertSubview:v7 aboveSubview:v122];

        [v7 setHidden:0];
        double v9 = [v7 layer];
        objc_msgSend(v9, "setAnchorPoint:", 0.0, 0.0);

        uint64_t v10 = +[CKUIBehavior sharedBehaviors];
        [v10 sendAnimationDuration];
        double v117 = v11;

        id v12 = [v6 layer];
        [v12 convertTime:0 fromLayer:CACurrentMediaTime()];
        double v14 = v13;

        [v6 frame];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v23 = [v6 layer];
        objc_msgSend(v23, "setAnchorPoint:", 1.0, 0.5);

        objc_msgSend(v6, "setFrame:", v16, v18, v20, v22);
        [v123 frame];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v32 = [v6 layer];
        [v32 anchorPoint];
        double v34 = v33;
        double v36 = v35;
        double v37 = [v123 layer];
        objc_msgSend(v37, "setAnchorPoint:", v34, v36);

        objc_msgSend(v123, "setFrame:", v25, v27, v29, v31);
        [rect_24 frame];
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        double v46 = [v6 layer];
        [v46 anchorPoint];
        double v48 = v47;
        double v50 = v49;
        double v51 = [rect_24 layer];
        objc_msgSend(v51, "setAnchorPoint:", v48, v50);

        objc_msgSend(rect_24, "setFrame:", v39, v41, v43, v45);
        double v52 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [*(id *)(a1 + 32) _configureForVFD:v52];
        [v52 setBeginTime:v14];
        [v52 setDuration:*(double *)(a1 + 64) * 0.3];
        [v52 setFromValue:&unk_1EDF17568];
        [v52 setToValue:&unk_1EDF17548];
        uint64_t v53 = *MEMORY[0x1E4F39FA8];
        [v52 setFillMode:*MEMORY[0x1E4F39FA8]];
        [v52 setRemovedOnCompletion:0];
        LODWORD(v54) = 0.5;
        LODWORD(v55) = 0.5;
        LODWORD(v56) = 1.0;
        double v57 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v54 :0.0 :v55 :v56];
        [v52 setTimingFunction:v57];

        [v52 setDelegate:*(void *)(a1 + 32)];
        [v123 addAnimation:v52 forKey:@"opacity"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        if (rect_24)
        {
          [rect_24 addAnimation:v52 forKey:@"opacity"];
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        }
        double v58 = (id *)(a1 + 32);
        rect_16 = [*(id *)(a1 + 32) balloonViewFadeInAnimationForConvertedCurrentMediaTime:v14];
        [v6 addAnimation:rect_16 forKey:@"opacity"];
        rect_8 = (dispatch_group_t *)(a1 + 40);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v59 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [*(id *)(a1 + 32) _configureForVFD:v59];
        [rect_16 beginTime];
        double v61 = v60;
        [rect_16 duration];
        [v59 setBeginTime:v61 + v62];
        [v59 setDuration:*(double *)(a1 + 64) * 0.5];
        [v59 setFromValue:&unk_1EDF17568];
        [v59 setToValue:&unk_1EDF17548];
        [v59 setFillMode:v53];
        [v59 setRemovedOnCompletion:0];
        LODWORD(v63) = 0.5;
        LODWORD(v64) = 0.5;
        LODWORD(v65) = 1.0;
        double v66 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v63 :0.0 :v64 :v65];
        [v59 setTimingFunction:v66];

        [v59 setDelegate:*(void *)(a1 + 32)];
        [v122 addAnimation:v59 forKey:@"opacity"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        [v7 frame];
        CGFloat v68 = v67;
        CGFloat v70 = v69;
        CGFloat v72 = v71;
        CGFloat v74 = v73;
        double v75 = [*(id *)(a1 + 48) objectAtIndex:a3];
        [v75 CGRectValue];
        CGFloat rect = v76;
        CGFloat v78 = v77;
        CGFloat v80 = v79;
        CGFloat v82 = v81;

        [*(id *)(a1 + 56) quickReplySourceRect];
        double v116 = v83;
        uint64_t v84 = +[CKUIBehavior sharedBehaviors];
        [v84 balloonMaskTailWidth];
        double v115 = v85;

        v132.origin.CGFloat x = rect;
        v132.origin.CGFloat y = v78;
        v132.size.width = v80;
        v132.size.double height = v82;
        double MaxX = CGRectGetMaxX(v132);
        double v86 = [v7 layer];
        [v86 anchorPoint];
        double v88 = v87;
        v133.origin.CGFloat x = v68;
        v133.origin.CGFloat y = v70;
        v133.size.width = v72;
        v133.size.double height = v74;
        double Width = CGRectGetWidth(v133);

        double v90 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
        [v59 beginTime];
        objc_msgSend(v90, "setBeginTime:");
        [*(id *)(a1 + 32) _configureForVFD:v90];
        [v90 setDuration:v117];
        [v90 setDamping:45.0];
        [v90 setStiffness:500.0];
        [v90 setInitialVelocity:0.0];
        [v90 setMass:1.0];
        uint64_t v91 = *MEMORY[0x1E4F39FA0];
        [v90 setFillMode:*MEMORY[0x1E4F39FA0]];
        double v92 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
        [v90 setTimingFunction:v92];

        long long v93 = [NSNumber numberWithDouble:v116 + v115];
        [v90 setFromValue:v93];

        double v94 = [NSNumber numberWithDouble:MaxX - (1.0 - v88) * Width];
        [v90 setToValue:v94];

        [v90 setDelegate:*(void *)(a1 + 32)];
        [v90 setRemovedOnCompletion:0];
        [v7 addAnimation:v90 forKey:@"position.x"];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        [*(id *)(a1 + 56) quickReplySourceRect];
        double v96 = v95;
        v134.origin.CGFloat x = rect;
        v134.origin.CGFloat y = v78;
        v134.size.width = v80;
        v134.size.double height = v82;
        double MinY = CGRectGetMinY(v134);
        uint64_t v98 = [v7 layer];
        [v98 anchorPoint];
        double v100 = v99;
        v135.origin.CGFloat x = rect;
        v135.origin.CGFloat y = v78;
        v135.size.width = v80;
        v135.size.double height = v82;
        double Height = CGRectGetHeight(v135);

        double v102 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.y"];
        double v103 = MinY + v100 * Height;
        [*v58 _configureForVFD:v102];
        [v90 beginTime];
        double v105 = v104;
        [v90 duration];
        double v107 = v105 + v106 + 0.2;
        double v108 = v105 + v106 * 0.25;
        if (vabdd_f64(v103, v96) >= 2.0) {
          double v108 = v107;
        }
        [v102 setBeginTime:v108];
        [v102 setFillMode:v91];
        long long v109 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
        [v102 setTimingFunction:v109];

        long long v110 = [NSNumber numberWithDouble:v96];
        [v102 setFromValue:v110];

        long long v111 = [NSNumber numberWithDouble:v103];
        [v102 setToValue:v111];

        [v102 setDuration:v117];
        [v102 setDelegate:*v58];
        [v102 setRemovedOnCompletion:0];
        [v7 addAnimation:v102 forKey:@"position.y"];
        dispatch_group_enter(*rect_8);
      }
      else if (IMOSLoggingEnabled())
      {
        long long v113 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v126 = v7;
          __int16 v127 = 2112;
          double v128 = v122;
          __int16 v129 = 2112;
          double v130 = v123;
          _os_log_impl(&dword_18EF18000, v113, OS_LOG_TYPE_INFO, "CKChatControllerDummyAnimator: Unexpectedly nil view - containerThrowBalloonView: %@ quickReplySnapshot: %@ whiteFadeSupplementaryView: %@", buf, 0x20u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      long long v112 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v112, OS_LOG_TYPE_INFO, "CKChatControllerDummyAnimator: Unsupported balloon type", buf, 2u);
      }
    }
  }
}

- (id)balloonViewFadeInAnimationForConvertedCurrentMediaTime:(double)a3
{
  id v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [(CKChatControllerDummyAnimator *)self _configureForVFD:v5];
  [v5 setBeginTime:a3];
  id v6 = +[CKUIBehavior sharedBehaviors];
  [v6 sendAnimationDuration];
  [v5 setDuration:v7 / 3.0];

  [v5 setFromValue:&unk_1EDF17548];
  [v5 setToValue:&unk_1EDF17568];
  [v5 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v5 setRemovedOnCompletion:0];
  [v5 setDelegate:self];

  return v5;
}

- (void)_beginImpactAnimationWithContext:(id)a3
{
  v184[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v154 = [v3 animatableViews];
  v153 = [v3 animatableTextViews];
  id v4 = [v3 throwBalloonViews];
  int v5 = [v3 isSender];
  int v155 = [v3 shouldRepeat];

  char v152 = v4;
  v159 = [v4 firstObject];
  id v6 = [v159 layer];
  [v6 setAllowsEdgeAntialiasing:1];

  double v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  double v9 = v8 * 5.0;
  uint64_t v10 = [v159 layer];
  [v10 setRasterizationScale:v9];

  [v159 bounds];
  double v12 = -2.0;
  if (v5) {
    double v12 = 2.0;
  }
  CGFloat v13 = v11 / v12;
  double v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contentsMultiplyColor"];
  id v15 = [MEMORY[0x1E4F428B8] blackColor];
  v158 = v14;
  objc_msgSend(v14, "setFromValue:", objc_msgSend(v15, "CGColor"));

  id v16 = [MEMORY[0x1E4F428B8] whiteColor];
  objc_msgSend(v14, "setToValue:", objc_msgSend(v16, "CGColor"));

  [v14 setDuration:0.25];
  double v17 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.rotation"];
  double v18 = [NSNumber numberWithDouble:0.191986218];
  v184[0] = v18;
  double v19 = [NSNumber numberWithDouble:-0.0523598776];
  v184[1] = v19;
  double v20 = [NSNumber numberWithDouble:0.0];
  v184[2] = v20;
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:3];
  [v17 setValues:v21];

  [v17 setKeyTimes:&unk_1EDF15AA0];
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 1.0;
  LODWORD(v24) = 1051372203;
  double v25 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v24 :0.0 :v22 :v23];
  v183[0] = v25;
  LODWORD(v26) = 1.0;
  LODWORD(v27) = 1059760811;
  double v28 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v27 :v26];
  v183[1] = v28;
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:2];
  [v17 setTimingFunctions:v29];

  v157 = v17;
  [v17 setAdditive:1];
  [v17 setDuration:0.583333333];
  int v156 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v30 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v174, -v13, -0.0, 0.0);
  double v31 = [v30 valueWithCATransform3D:&v174];
  [v156 setFromValue:v31];

  double v32 = [v156 fromValue];
  [v156 setToValue:v32];

  [v156 setAdditive:1];
  double v33 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  double v34 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v173, 3.0, 3.0, 1.0);
  double v35 = [v34 valueWithCATransform3D:&v173];
  v182[0] = v35;
  double v36 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v172, 6.9434, 6.9434, 1.0);
  double v37 = [v36 valueWithCATransform3D:&v172];
  v182[1] = v37;
  double v38 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v171, 0.92, 0.92, 1.0);
  double v39 = [v38 valueWithCATransform3D:&v171];
  v182[2] = v39;
  double v40 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v170, 0.918, 0.918, 1.0);
  double v41 = [v40 valueWithCATransform3D:&v170];
  v182[3] = v41;
  double v42 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v169, 1.05, 1.05, 1.0);
  double v43 = [v42 valueWithCATransform3D:&v169];
  v182[4] = v43;
  double v44 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v168, 1.05308, 1.05308, 1.0);
  double v45 = [v44 valueWithCATransform3D:&v168];
  v182[5] = v45;
  double v46 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v167, 1.0, 1.0, 1.0);
  double v47 = [v46 valueWithCATransform3D:&v167];
  v182[6] = v47;
  double v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:7];
  [v33 setValues:v48];

  [v33 setKeyTimes:&unk_1EDF15AB8];
  LODWORD(v49) = 1029517083;
  LODWORD(v50) = 1041529569;
  LODWORD(v51) = 1052099215;
  LODWORD(v52) = 1059447636;
  uint64_t v53 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v49 :v50 :v51 :v52];
  v181[0] = v53;
  LODWORD(v54) = 1051092582;
  LODWORD(v55) = 1064329806;
  LODWORD(v56) = 1062383649;
  LODWORD(v57) = 0.625;
  double v58 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v57 :v54 :v55 :v56];
  v181[1] = v58;
  LODWORD(v59) = 990057071;
  LODWORD(v60) = 1002740646;
  LODWORD(v61) = 1032268546;
  LODWORD(v62) = 1041932222;
  double v63 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v59 :v60 :v61 :v62];
  v181[2] = v63;
  LODWORD(v64) = 1044012597;
  LODWORD(v65) = 1034281812;
  LODWORD(v66) = 1060101947;
  LODWORD(v67) = 1063440613;
  CGFloat v68 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v64 :v65 :v66 :v67];
  v181[3] = v68;
  LODWORD(v69) = 998445679;
  LODWORD(v70) = 1008981770;
  LODWORD(v71) = 1038308344;
  LODWORD(v72) = 1044549468;
  double v73 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v69 :v70 :v71 :v72];
  v181[4] = v73;
  LODWORD(v74) = 1055018451;
  LODWORD(v75) = 1039247868;
  LODWORD(v76) = *(_DWORD *)"?5^?";
  LODWORD(v77) = 1.0;
  CGFloat v78 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v74 :v75 :v76 :v77];
  v181[5] = v78;
  double v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:6];
  [v33 setTimingFunctions:v79];

  [v33 setAdditive:1];
  [v33 setDuration:0.666666667];
  CGFloat v80 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v81 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v166, v13, 0.0, 0.0);
  CGFloat v82 = [v81 valueWithCATransform3D:&v166];
  [v80 setFromValue:v82];

  double v83 = [v80 fromValue];
  [v80 setToValue:v83];

  [v80 setAdditive:1];
  uint64_t v84 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  double v85 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v165, 0.0, 10.0, 0.0);
  double v86 = [v85 valueWithCATransform3D:&v165];
  long long v87 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v88 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v89 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v164[5] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v164[6] = v88;
  v164[7] = v89;
  long long v90 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v164[0] = *MEMORY[0x1E4F39B10];
  v164[1] = v90;
  long long v91 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v164[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v180[0] = v86;
  v164[3] = v91;
  v164[4] = v87;
  double v92 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v164];
  v180[1] = v92;
  long long v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:2];
  [v84 setValues:v93];

  LODWORD(v94) = 1.0;
  LODWORD(v95) = 1051372203;
  LODWORD(v96) = 1059760811;
  long long v97 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v95 :0.0 :v96 :v94];
  v179 = v97;
  uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:1];
  [v84 setTimingFunctions:v98];

  [v84 setAdditive:1];
  [v84 setCalculationMode:*MEMORY[0x1E4F39D68]];
  [v84 setDuration:0.333333333];
  double v99 = CACurrentMediaTime();
  double v100 = [MEMORY[0x1E4F39B38] animation];
  [v100 setBeginTime:v99];
  [v100 setDuration:1.5];
  v178[0] = v156;
  v178[1] = v157;
  v149 = v80;
  v150 = v33;
  v178[2] = v33;
  v178[3] = v80;
  v178[4] = v84;
  v178[5] = v158;
  double v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:6];
  [v100 setAnimations:v101];

  if (v155) {
    *(float *)&double v102 = INFINITY;
  }
  else {
    *(float *)&double v102 = 0.0;
  }
  [v100 setRepeatCount:v102];
  double v103 = [v159 layer];
  [v103 addAnimation:v100 forKey:@"group"];

  double v104 = [MEMORY[0x1E4F39BA8] emitterCell];
  [v104 setContentsScale:0.08];
  LODWORD(v105) = *(_DWORD *)"";
  [v104 setBirthRate:v105];
  LODWORD(v106) = 0.5;
  [v104 setLifetime:v106];
  [v104 setParticleType:*MEMORY[0x1E4F39F40]];
  [v104 setScale:1.1];
  [v104 setVelocity:220.0];
  [v104 setVelocityRange:180.0];
  [v104 setName:@"dustCell"];
  id v107 = [MEMORY[0x1E4F428B8] colorWithWhite:0.3 alpha:0.0156862745];
  objc_msgSend(v104, "setColor:", objc_msgSend(v107, "CGColor"));

  id v108 = [MEMORY[0x1E4F42A80] ckImageNamed:@"impact-effect-dust"];
  objc_msgSend(v104, "setContents:", objc_msgSend(v108, "CGImage"));

  [v104 setEmissionRange:1.57079633];
  long long v109 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F18]];
  id v110 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
  v177[0] = [v110 CGColor];
  id v111 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0];
  v177[1] = [v111 CGColor];
  long long v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:2];
  [v109 setValue:v112 forKey:@"colors"];

  [v109 setValue:&unk_1EDF15AD0 forKey:@"locations"];
  long long v113 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v113 setValue:@"scale" forKey:@"keyPath"];
  [v113 setValue:&unk_1EDF15AE8 forKey:@"values"];
  [v113 setValue:&unk_1EDF15B00 forKey:@"locations"];
  double v114 = [MEMORY[0x1E4F39BB0] layer];
  [v114 setEmitterShape:*MEMORY[0x1E4F39F78]];
  double v115 = [v159 layer];
  [v115 bounds];
  double v117 = v116 + -20.0;

  double v118 = [v159 layer];
  [v118 bounds];
  double v120 = v119 + -20.0;

  objc_msgSend(v114, "setEmitterSize:", fmax(v117, 1.0), fmax(v120, 1.0));
  [v114 setEmitterMode:*MEMORY[0x1E4F39F60]];
  LODWORD(v121) = 4.0;
  [v114 setScale:v121];
  double v176 = v104;
  double v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v176 count:1];
  [v114 setEmitterCells:v122];

  double v123 = [v159 layer];
  [v123 position];
  objc_msgSend(v114, "setPosition:");

  v175[0] = v109;
  v175[1] = v113;
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
  [v114 setEmitterBehaviors:v124];

  [v100 duration];
  objc_msgSend(v114, "setDuration:");
  LODWORD(v125) = 2139095040;
  [v114 setRepeatCount:v125];
  [v100 duration];
  [v114 setBeginTime:v99 + v126 * 0.21];
  __int16 v127 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"birthRate"];
  [v127 setValues:&unk_1EDF15B18];
  [v127 setKeyTimes:&unk_1EDF15B30];
  [v100 duration];
  objc_msgSend(v127, "setDuration:");
  [v127 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v100 duration];
  [v127 setBeginTime:v128 * -0.21];
  [v127 setBeginTimeMode:*MEMORY[0x1E4F39D60]];
  [v127 setRemovedOnCompletion:0];
  [v114 addAnimation:v127 forKey:0];
  __int16 v129 = [v159 superview];
  double v130 = [v129 layer];
  uint64_t v131 = [v159 layer];
  [v130 insertSublayer:v114 below:v131];

  if ((v155 & 1) == 0)
  {
    [v100 duration];
    double v133 = v132;
    [v104 lifetime];
    dispatch_time_t v135 = dispatch_time(0, (uint64_t)((v134 + v133 * 0.25) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_244;
    block[3] = &unk_1E5620C40;
    id v163 = v114;
    dispatch_after(v135, MEMORY[0x1E4F14428], block);
  }
  [(CKChatControllerDummyAnimator *)self setDustEmitter:v114];

  double v136 = [v153 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v137 = [v136 subviews];
    uint64_t v138 = [v137 count];

    if (v138)
    {
      v139 = [v136 subviews];
      double v140 = [v139 firstObject];

      double v141 = [MEMORY[0x1E4F42D90] mainScreen];
      [v141 scale];
      [v140 setContentScaleFactor:v142 * 5.0];

      uint64_t v143 = *MEMORY[0x1E4F3A340];
      v144 = [v140 layer];
      [v144 setMinificationFilter:v143];

      v145 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contentsMultiplyColor"];
      id v146 = [MEMORY[0x1E4F428B8] blackColor];
      objc_msgSend(v145, "setFromValue:", objc_msgSend(v146, "CGColor"));

      id v147 = [MEMORY[0x1E4F428B8] whiteColor];
      objc_msgSend(v145, "setToValue:", objc_msgSend(v147, "CGColor"));

      [v145 setDuration:0.25];
      v148 = [v140 layer];
      [v148 addAnimation:v145 forKey:@"darken"];
    }
  }
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_2;
  v160[3] = &__block_descriptor_41_e23_v32__0__UIView_8Q16_B24l;
  *(double *)&v160[4] = v99;
  char v161 = v155;
  [v154 enumerateObjectsUsingBlock:v160];
}

uint64_t __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_244(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

void __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  v72[4] = *MEMORY[0x1E4F143B8];
  id v58 = a2;
  int v5 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  id v6 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v66, 1.0, 1.0, 1.0);
  double v7 = [v6 valueWithCATransform3D:&v66];
  v72[0] = v7;
  double v8 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v65, 0.9, 0.9, 1.0);
  double v9 = [v8 valueWithCATransform3D:&v65];
  v72[1] = v9;
  uint64_t v10 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v64, 1.1, 1.1, 1.0);
  double v11 = [v10 valueWithCATransform3D:&v64];
  v72[2] = v11;
  double v12 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v63, 1.0, 1.0, 1.0);
  CGFloat v13 = [v12 valueWithCATransform3D:&v63];
  v72[3] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
  [v5 setValues:v14];

  [v5 setKeyTimes:&unk_1EDF15B48];
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1.0;
  double v17 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v15 :v16];
  v71[0] = v17;
  LODWORD(v18) = 1.0;
  LODWORD(v19) = 1059760811;
  double v20 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v19 :v18];
  v71[1] = v20;
  LODWORD(v21) = 1.0;
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 1051372203;
  double v24 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v23 :0.0 :v21 :v22];
  v71[2] = v24;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
  [v5 setTimingFunctions:v25];

  [v5 setAdditive:1];
  [v5 setDuration:(double)(2 * a3 + 20) / 60.0];
  [v5 setBeginTime:((double)(2 * a3) + 20.6) / 60.0];
  double v26 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.translation.y"];
  [v26 setValues:&unk_1EDF15B60];
  v70[0] = &unk_1EDF17548;
  double v27 = [NSNumber numberWithDouble:(double)a3 * -0.01 + 0.26];
  v70[1] = v27;
  double v28 = [NSNumber numberWithDouble:(double)a3 * -0.02 + 0.5];
  v70[2] = v28;
  v70[3] = &unk_1EDF17568;
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
  [v26 setKeyTimes:v29];

  LODWORD(v30) = 1.0;
  LODWORD(v31) = 1059760811;
  double v32 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v31 :v30];
  v69[0] = v32;
  LODWORD(v33) = 1.0;
  LODWORD(v34) = 1.0;
  LODWORD(v35) = 1051372203;
  double v36 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v35 :0.0 :v33 :v34];
  v69[1] = v36;
  LODWORD(v37) = 1.0;
  LODWORD(v38) = 1059760811;
  double v39 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v38 :v37];
  v69[2] = v39;
  double v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  [v26 setTimingFunctions:v40];

  [v26 setAdditive:1];
  [v26 setDuration:(double)(6 * a3 + 30) / 60.0];
  [v26 setBeginTime:((double)a3 * 0.8 + 8.0) / 60.0];
  double v41 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.translation.x"];
  [v41 setValues:&unk_1EDF15B78];
  [v41 setKeyTimes:&unk_1EDF15B90];
  [v41 setAdditive:1];
  [v41 setDuration:0.133333333];
  [v41 setBeginTime:0.333333333];
  double v42 = [MEMORY[0x1E4F39B38] animation];
  [v42 setBeginTime:*(double *)(a1 + 32)];
  v68[0] = v5;
  v68[1] = v26;
  v68[2] = v41;
  double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  [v42 setAnimations:v43];

  LODWORD(v44) = 2139095040;
  if (!*(unsigned char *)(a1 + 40)) {
    *(float *)&double v44 = 0.0;
  }
  [v42 setRepeatCount:v44];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  double v45 = [v42 animations];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v60 != v48) {
          objc_enumerationMutation(v45);
        }
        double v50 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        [v42 duration];
        double v52 = v51;
        [v50 beginTime];
        double v54 = v53;
        [v50 duration];
        double v56 = v54 + v55;
        if (v52 >= v56) {
          double v56 = v52;
        }
        [v42 setDuration:v56];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v47);
  }

  double v57 = [v58 layer];
  [v57 addAnimation:v42 forKey:@"jump"];
}

- (void)_beginPopAnimationWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [v4 throwBalloonViews];
  id v6 = [v5 firstObject];
  double v7 = [CKPopRendererView alloc];
  double v8 = -[CKPopRendererView initWithFrame:device:](v7, "initWithFrame:device:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if ([(CKPopRendererView *)v8 _shouldReverseLayoutDirection])
  {
    CGAffineTransformMakeScale(&v29, -1.0, 1.0);
    CGAffineTransform v28 = v29;
    [(CKPopRendererView *)v8 setTransform:&v28];
  }
  double v9 = [v6 superview];
  [v6 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [v4 containerView];
  objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  -[CKPopRendererView frameForSourceFrame:](v8, "frameForSourceFrame:", v20, v22, v24, v26);
  -[CKPopRendererView setFrame:](v8, "setFrame:");
  [(CKPopRendererView *)v8 setDelegate:self];
  double v27 = [v4 containerView];

  [v27 addSubview:v8];
  if (![(CKPopRendererView *)v8 playWithSourceView:v6]) {
    [(CKPopRendererView *)v8 removeFromSuperview];
  }
}

- (void)popRendererViewDidBegin:(id)a3
{
  id v3 = [(CKChatControllerDummyAnimator *)self animationDelegate];
  [v3 popAnimationDidBegin];
}

- (void)popRendererViewDidFinish:(id)a3
{
  id v4 = a3;
  locatiouint64_t n = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CKChatControllerDummyAnimator_popRendererViewDidFinish___block_invoke;
  block[3] = &unk_1E5623328;
  id v7 = v4;
  id v5 = v4;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __58__CKChatControllerDummyAnimator_popRendererViewDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained popAnimationCompletionBlock];

  if (v5) {
    v5[2]();
  }
  id v4 = objc_loadWeakRetained(v2);
  [v4 setPopAnimationCompletionBlock:0];
}

- (void)popRendererViewPlaySound:(id)a3
{
  id v3 = [(CKChatControllerDummyAnimator *)self animationDelegate];
  [v3 playSoundForPopAnimation];
}

- (void)_beginLoudAnimationsWithContext:(id)a3
{
  v115[11] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 throwBalloonViews];
  double v102 = [v3 animatableViews];
  double v101 = [v3 animatableTextViews];
  int v96 = [v3 shouldRepeat];
  int v5 = [v3 isSender];
  double v99 = v4;
  id v6 = [v4 firstObject];
  id v7 = [v6 layer];
  [v7 setAllowsEdgeAntialiasing:1];

  double v100 = v6;
  [v6 bounds];
  double v9 = -2.0;
  if (v5) {
    double v9 = 2.0;
  }
  double v10 = v8 / v9;
  [v6 bounds];
  double v12 = v11;
  double v13 = v11 * 0.5;
  double v14 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.rotation"];
  double v95 = [NSNumber numberWithDouble:0.0];
  v115[0] = v95;
  double v94 = [NSNumber numberWithDouble:-0.0698131701];
  v115[1] = v94;
  long long v93 = [NSNumber numberWithDouble:0.0872664626];
  v115[2] = v93;
  double v92 = [NSNumber numberWithDouble:-0.0558505361];
  v115[3] = v92;
  double v15 = [NSNumber numberWithDouble:0.0523598776];
  v115[4] = v15;
  double v16 = [NSNumber numberWithDouble:-0.0453785606];
  v115[5] = v16;
  double v17 = [NSNumber numberWithDouble:0.0331612558];
  v115[6] = v17;
  double v18 = [NSNumber numberWithDouble:-0.0244346095];
  v115[7] = v18;
  double v19 = [NSNumber numberWithDouble:0.0174532925];
  v115[8] = v19;
  double v20 = [NSNumber numberWithDouble:-0.0174532925];
  v115[9] = v20;
  double v21 = [NSNumber numberWithDouble:0.0];
  v115[10] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:11];
  [v14 setValues:v22];

  [v14 setKeyTimes:&unk_1EDF15BA8];
  double v23 = v14;
  [v14 setAdditive:1];
  double v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v25 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v109, -v10, -(v12 * 0.5), 0.0);
  double v26 = [v25 valueWithCATransform3D:&v109];
  [v24 setFromValue:v26];

  double v27 = [v24 fromValue];
  [v24 setToValue:v27];

  [v24 setAdditive:1];
  LODWORD(v27) = [v3 beginAnimationFromTranscriptPresentedState];

  if (v27) {
    double v28 = 1.0;
  }
  else {
    double v28 = 0.01;
  }
  CGAffineTransform v29 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  double v30 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v108, v28, v28, 1.0);
  double v31 = [v30 valueWithCATransform3D:&v108];
  v114[0] = v31;
  double v32 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v107, 2.25, 2.25, 1.0);
  double v33 = [v32 valueWithCATransform3D:&v107];
  v114[1] = v33;
  double v34 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v106, 2.25, 2.25, 1.0);
  double v35 = [v34 valueWithCATransform3D:&v106];
  v114[2] = v35;
  double v36 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v105, 1.0, 1.0, 1.0);
  double v37 = [v36 valueWithCATransform3D:&v105];
  v114[3] = v37;
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:4];
  [v29 setValues:v38];

  [v29 setKeyTimes:&unk_1EDF15BC0];
  LODWORD(v39) = 1051595899;
  LODWORD(v40) = 1049582633;
  LODWORD(v41) = 1.0;
  double v42 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v39 :0.0 :v40 :v41];
  v113[0] = v42;
  double v43 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  v113[1] = v43;
  LODWORD(v44) = 1054280253;
  LODWORD(v45) = 1050924810;
  LODWORD(v46) = 1.0;
  uint64_t v47 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v44 :0.0 :v45 :v46];
  v113[2] = v47;
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:3];
  [v29 setTimingFunctions:v48];

  [v29 setAdditive:1];
  double v49 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v50 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v104, v10, v13, 0.0);
  double v51 = [v50 valueWithCATransform3D:&v104];
  [v49 setFromValue:v51];

  double v52 = [v49 fromValue];
  [v49 setToValue:v52];

  [v49 setAdditive:1];
  double v53 = [MEMORY[0x1E4F39B38] animation];
  uint64_t v54 = *MEMORY[0x1E4F39D98];
  [v53 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  [v53 setDelegate:self];
  [v53 setDuration:1.51666667];
  uint64_t v98 = v23;
  v112[0] = v23;
  v112[1] = v24;
  v112[2] = v29;
  v112[3] = v49;
  double v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:4];
  [v53 setAnimations:v55];

  if (v96) {
    float v57 = INFINITY;
  }
  else {
    float v57 = 0.0;
  }
  *(float *)&double v56 = v57;
  [v53 setRepeatCount:v56];
  id v58 = [v100 layer];
  [v58 addAnimation:v53 forKey:@"group"];

  [v100 bounds];
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __65__CKChatControllerDummyAnimator__beginLoudAnimationsWithContext___block_invoke_310;
  v103[3] = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
  *(double *)&v103[4] = v59 * -1.25;
  [v102 enumerateObjectsUsingBlock:v103];
  long long v60 = [v101 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v60 bounds];
    double v62 = v61 + 10.0;
    [v60 bounds];
    double v64 = v62 / v63;
    [v60 bounds];
    double v66 = v65 + 10.0;
    [v60 bounds];
    double v68 = v66 / v67;
    if (v64 < v66 / v67) {
      double v68 = v64;
    }
    if (v68 <= 1.15) {
      double v69 = v68;
    }
    else {
      double v69 = 1.15;
    }
    double v70 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
    v111[0] = &unk_1EDF17568;
    double v71 = [NSNumber numberWithDouble:v69];
    v111[1] = v71;
    v111[2] = &unk_1EDF17568;
    double v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:3];
    [v70 setValues:v72];

    [v70 setKeyTimes:&unk_1EDF15BF0];
    LODWORD(v73) = 1045220557;
    LODWORD(v74) = 1048911544;
    LODWORD(v75) = 1.0;
    double v76 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v73 :0.0 :v74 :v75];
    v110[0] = v76;
    LODWORD(v77) = 0.5;
    LODWORD(v78) = 0.5;
    LODWORD(v79) = 1.0;
    CGFloat v80 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v77 :0.0 :v78 :v79];
    v110[1] = v80;
    double v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
    [v70 setTimingFunctions:v81];

    *(float *)&double v82 = v57;
    [v70 setRepeatCount:v82];
    [v70 setDuration:1.51666667];
    [v70 setBeginTimeMode:v54];
    double v83 = [v60 layer];
    [v83 addAnimation:v70 forKey:@"transform.scale"];

    uint64_t v84 = [v60 subviews];
    uint64_t v85 = [v84 count];

    if (v85)
    {
      double v86 = [v60 subviews];
      long long v87 = [v86 firstObject];

      long long v88 = [MEMORY[0x1E4F42D90] mainScreen];
      [v88 scale];
      [v87 setContentScaleFactor:v89 * 5.0];

      uint64_t v90 = *MEMORY[0x1E4F3A340];
      long long v91 = [v87 layer];
      [v91 setMinificationFilter:v90];
    }
  }
}

void __65__CKChatControllerDummyAnimator__beginLoudAnimationsWithContext___block_invoke_310(uint64_t a1, void *a2)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F39BD8];
  id v4 = a2;
  int v5 = [v3 animationWithKeyPath:@"transform.translation.y"];
  v21[0] = &unk_1EDF16C28;
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v21[1] = v6;
  id v7 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v21[2] = v7;
  v21[3] = &unk_1EDF16C28;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v5 setValues:v8];

  [v5 setKeyTimes:&unk_1EDF15BD8];
  [v5 setDuration:1.5];
  LODWORD(v9) = 1039516303;
  LODWORD(v10) = 1.0;
  double v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v9 :v10];
  double v12 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:", *MEMORY[0x1E4F3A4A0], v11);
  v20[1] = v12;
  LODWORD(v13) = 1040522936;
  LODWORD(v14) = 1051931443;
  LODWORD(v15) = 1053609165;
  LODWORD(v16) = 1.0;
  double v17 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :v14 :v15 :v16];
  v20[2] = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v5 setTimingFunctions:v18];

  double v19 = [v4 layer];

  [v19 addAnimation:v5 forKey:@"jump"];
}

- (void)_beginFocusAnimationWithContext:(id)a3
{
  v88[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v76 = [v3 throwBalloonViews];
  double v75 = [v3 animatableTextViews];
  int v72 = [v3 shouldRepeat];
  double v74 = v3;
  int v4 = [v3 isSender];
  int v5 = [v76 firstObject];
  id v6 = [v5 layer];
  [v6 setAllowsEdgeAntialiasing:1];

  [v5 bounds];
  double v8 = -2.0;
  if (v4) {
    double v8 = 2.0;
  }
  CGFloat v9 = v7 / v8;
  [v5 bounds];
  double v11 = v10;
  CGFloat v12 = v10 * 0.5;
  double v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v14 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v83, -v9, -(v11 * 0.5), 0.0);
  double v15 = [v14 valueWithCATransform3D:&v83];
  [v13 setFromValue:v15];

  double v16 = [v13 fromValue];
  [v13 setToValue:v16];

  [v13 setAdditive:1];
  double v17 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  double v18 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v82, 0.1, 0.1, 1.0);
  double v19 = [v18 valueWithCATransform3D:&v82];
  v88[0] = v19;
  double v20 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v81, 1.25, 1.25, 1.0);
  double v21 = [v20 valueWithCATransform3D:&v81];
  v88[1] = v21;
  double v22 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v80, 1.25, 1.25, 1.0);
  double v23 = [v22 valueWithCATransform3D:&v80];
  v88[2] = v23;
  double v24 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v79, 1.0, 1.0, 1.0);
  double v25 = [v24 valueWithCATransform3D:&v79];
  v88[3] = v25;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:4];
  [v17 setValues:v26];

  [v17 setKeyTimes:&unk_1EDF15C08];
  LODWORD(v27) = 0.5;
  LODWORD(v28) = 1.0;
  LODWORD(v29) = 1051931443;
  double v30 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v29 :0.0 :v27 :v28];
  v87[0] = v30;
  uint64_t v69 = *MEMORY[0x1E4F3A4A0];
  double v31 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:");
  v87[1] = v31;
  LODWORD(v32) = 1.0;
  LODWORD(v33) = 1045220557;
  LODWORD(v34) = 1047233823;
  double v35 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v33 :0.0 :v34 :v32];
  v87[2] = v35;
  double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
  [v17 setTimingFunctions:v36];

  [v17 setAdditive:1];
  double v37 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v38 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v78, v9, v12, 0.0);
  double v39 = [v38 valueWithCATransform3D:&v78];
  [v37 setFromValue:v39];

  double v40 = [v37 fromValue];
  [v37 setToValue:v40];

  [v37 setAdditive:1];
  double v41 = [MEMORY[0x1E4F39B38] animation];
  uint64_t v42 = *MEMORY[0x1E4F39D98];
  [v41 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  [v41 setDelegate:self];
  [v41 setDuration:4.01666667];
  double v71 = v13;
  v86[0] = v13;
  v86[1] = v17;
  v86[2] = v37;
  double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
  [v41 setAnimations:v43];

  if (v72) {
    float v45 = INFINITY;
  }
  else {
    float v45 = 0.0;
  }
  *(float *)&double v44 = v45;
  [v41 setRepeatCount:v44];
  double v46 = [v5 layer];
  [v46 addAnimation:v41 forKey:@"group"];

  double v73 = v5;
  [v5 bounds];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __65__CKChatControllerDummyAnimator__beginFocusAnimationWithContext___block_invoke;
  v77[3] = &__block_descriptor_40_e30_v32__0__CKBalloonView_8Q16_B24l;
  *(double *)&v77[4] = v47 * -0.25;
  [v76 enumerateObjectsUsingBlock:v77];
  uint64_t v48 = [v75 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v49 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
    [v49 setValues:&unk_1EDF15C38];
    [v49 setKeyTimes:&unk_1EDF15C50];
    LODWORD(v50) = 1047904911;
    LODWORD(v51) = 1043878380;
    LODWORD(v52) = 1.0;
    double v53 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v50 :0.0 :v51 :v52];
    uint64_t v85 = v53;
    uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    [v49 setTimingFunctions:v54];

    *(float *)&double v55 = v45;
    [v49 setRepeatCount:v55];
    [v49 setDuration:4.01666667];
    [v49 setBeginTimeMode:v42];
    double v56 = [v48 layer];
    [v56 addAnimation:v49 forKey:@"transform.scale"];
  }
  float v57 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v57 setDuration:4.01666667];
  [v57 setKeyTimes:&unk_1EDF15C68];
  [v57 setValues:&unk_1EDF15C80];
  LODWORD(v58) = 0.5;
  LODWORD(v59) = 1.0;
  LODWORD(v60) = 1051931443;
  double v61 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v60 :0.0 :v58 :v59];
  v84[0] = v61;
  double v62 = [MEMORY[0x1E4F39C10] functionWithName:v69];
  v84[1] = v62;
  LODWORD(v63) = 1.0;
  LODWORD(v64) = 1045220557;
  LODWORD(v65) = 1047233823;
  double v66 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v64 :0.0 :v65 :v63];
  v84[2] = v66;
  double v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
  [v57 setTimingFunctions:v67];

  double v68 = [v74 backdropLayer];
  [v68 addAnimation:v57 forKey:@"filters.gaussianBlur.inputRadius"];
}

void __65__CKChatControllerDummyAnimator__beginFocusAnimationWithContext___block_invoke(uint64_t a1, void *a2)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F39BD8];
  id v4 = a2;
  int v5 = [v3 animationWithKeyPath:@"transform.translation.y"];
  v21[0] = &unk_1EDF16C28;
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v21[1] = v6;
  double v7 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v21[2] = v7;
  v21[3] = &unk_1EDF16C28;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v5 setValues:v8];

  [v5 setKeyTimes:&unk_1EDF15C20];
  [v5 setDuration:2.3];
  LODWORD(v9) = 1039516303;
  LODWORD(v10) = 1.0;
  double v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v9 :v10];
  CGFloat v12 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:", *MEMORY[0x1E4F3A4A0], v11);
  v20[1] = v12;
  LODWORD(v13) = 1040522936;
  LODWORD(v14) = 1051931443;
  LODWORD(v15) = 1053609165;
  LODWORD(v16) = 1.0;
  double v17 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :v14 :v15 :v16];
  v20[2] = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v5 setTimingFunctions:v18];

  double v19 = [v4 layer];

  [v19 addAnimation:v5 forKey:@"jump"];
}

- (void)_beginGentleAnimationWithContext:(id)a3
{
  v76[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v63 = [v3 animatableViews];
  double v62 = [v3 animatableTextViews];
  id v4 = [v3 throwBalloonViews];
  int v5 = [v3 isSender];
  int v59 = [v3 shouldRepeat];

  double v61 = v4;
  id v6 = [v4 firstObject];
  double v7 = [v6 layer];
  [v7 setAllowsEdgeAntialiasing:1];

  [v6 bounds];
  double v9 = -2.0;
  if (v5) {
    double v9 = 2.0;
  }
  CGFloat v10 = v8 / v9;
  [v6 bounds];
  double v12 = v11;
  CGFloat v13 = v11 * 0.5;
  double v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v15 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v72, -v10, -(v12 * 0.5), 0.0);
  double v16 = [v15 valueWithCATransform3D:&v72];
  [v14 setFromValue:v16];

  double v17 = [v14 fromValue];
  [v14 setToValue:v17];

  [v14 setAdditive:1];
  double v18 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  double v19 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v71, 0.1, 0.1, 1.0);
  double v20 = [v19 valueWithCATransform3D:&v71];
  v76[0] = v20;
  double v21 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v70, 1.25, 1.25, 1.0);
  double v22 = [v21 valueWithCATransform3D:&v70];
  v76[1] = v22;
  double v23 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v69, 1.25, 1.25, 1.0);
  double v24 = [v23 valueWithCATransform3D:&v69];
  v76[2] = v24;
  double v25 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v68, 1.0, 1.0, 1.0);
  double v26 = [v25 valueWithCATransform3D:&v68];
  v76[3] = v26;
  double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
  [v18 setValues:v27];

  [v18 setKeyTimes:&unk_1EDF15C98];
  LODWORD(v28) = 1051931443;
  LODWORD(v29) = 0.5;
  LODWORD(v30) = 1.0;
  double v31 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v28 :0.0 :v29 :v30];
  v75[0] = v31;
  double v32 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  v75[1] = v32;
  LODWORD(v33) = 1045220557;
  LODWORD(v34) = 1047233823;
  LODWORD(v35) = 1.0;
  double v36 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v33 :0.0 :v34 :v35];
  v75[2] = v36;
  double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
  [v18 setTimingFunctions:v37];

  [v18 setAdditive:1];
  double v38 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v39 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v67, v10, v13, 0.0);
  double v40 = [v39 valueWithCATransform3D:&v67];
  [v38 setFromValue:v40];

  double v41 = [v38 fromValue];
  [v38 setToValue:v41];

  [v38 setAdditive:1];
  uint64_t v42 = [MEMORY[0x1E4F39B38] animation];
  uint64_t v43 = *MEMORY[0x1E4F39D98];
  [v42 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  [v42 setDelegate:self];
  [v42 setDuration:4.01666667];
  v74[0] = v14;
  v74[1] = v18;
  v74[2] = v38;
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
  [v42 setAnimations:v44];

  if (v59) {
    float v46 = INFINITY;
  }
  else {
    float v46 = 0.0;
  }
  *(float *)&double v45 = v46;
  [v42 setRepeatCount:v45];
  double v47 = [v6 layer];
  [v47 addAnimation:v42 forKey:@"group"];

  [v6 bounds];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __66__CKChatControllerDummyAnimator__beginGentleAnimationWithContext___block_invoke;
  v64[3] = &unk_1E562B928;
  double v66 = v48 * -0.25;
  id v49 = v18;
  id v65 = v49;
  [v63 enumerateObjectsUsingBlock:v64];
  double v50 = [v62 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v51 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
    [v51 setValues:&unk_1EDF15CC8];
    [v51 setKeyTimes:&unk_1EDF15CE0];
    LODWORD(v52) = 1047904911;
    LODWORD(v53) = 1043878380;
    LODWORD(v54) = 1.0;
    double v55 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v52 :0.0 :v53 :v54];
    double v73 = v55;
    double v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v51 setTimingFunctions:v56];

    *(float *)&double v57 = v46;
    [v51 setRepeatCount:v57];
    [v51 setDuration:4.01666667];
    [v51 setBeginTimeMode:v43];
    double v58 = [v50 layer];
    [v58 addAnimation:v51 forKey:@"transform.scale"];
  }
}

void __66__CKChatControllerDummyAnimator__beginGentleAnimationWithContext___block_invoke(uint64_t a1, void *a2)
{
  void v11[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F39BD8];
  id v4 = a2;
  int v5 = [v3 animationWithKeyPath:@"transform.translation.y"];
  v11[0] = &unk_1EDF16C28;
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v11[1] = v6;
  double v7 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v11[2] = v7;
  v11[3] = &unk_1EDF16C28;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  [v5 setValues:v8];

  [v5 setKeyTimes:&unk_1EDF15CB0];
  [*(id *)(a1 + 32) duration];
  objc_msgSend(v5, "setDuration:");
  double v9 = [*(id *)(a1 + 32) timingFunctions];
  [v5 setTimingFunctions:v9];

  CGFloat v10 = [v4 layer];

  [v10 addAnimation:v5 forKey:@"jump"];
}

- (void)_configureForVFD:(id)a3
{
  id v3 = a3;
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setPreferredFrameRateRange:", *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  [v3 setHighFrameRateReason:1310722];
}

- (CKSendAnimationManager)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);

  return (CKSendAnimationManager *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (CAEmitterLayer)dustEmitter
{
  return self->_dustEmitter;
}

- (void)setDustEmitter:(id)a3
{
}

- (OS_dispatch_group)throwAnimationGroup
{
  return self->_throwAnimationGroup;
}

- (void)setThrowAnimationGroup:(id)a3
{
}

- (id)popAnimationCompletionBlock
{
  return self->_popAnimationCompletionBlock;
}

- (void)setPopAnimationCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_popAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_throwAnimationGroup, 0);
  objc_storeStrong((id *)&self->_dustEmitter, 0);

  objc_destroyWeak((id *)&self->_animationDelegate);
}

@end