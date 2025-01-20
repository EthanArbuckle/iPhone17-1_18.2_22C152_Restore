@interface CCUIContentModuleContainerTransition
- (BOOL)isAppearanceTransition;
- (CCUIContentModuleContainerViewController)viewController;
- (CGRect)contentRestOverrideFrame;
- (void)_removeMatchMoveAnimationFromTargetView:(id)a3;
- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)setAppearanceTransition:(BOOL)a3;
- (void)setContentRestOverrideFrame:(CGRect)a3;
- (void)setViewController:(id)a3;
- (void)transitionDidEnd:(BOOL)a3;
@end

@implementation CCUIContentModuleContainerTransition

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v27 = a5;
  id v7 = a4;
  [v27 addSubview:v7];
  [v27 bounds];
  objc_msgSend(v7, "setFrame:");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  BOOL appearanceTransition = self->_appearanceTransition;
  [WeakRetained setExpanded:self->_appearanceTransition];
  v10 = [WeakRetained contentViewController];
  if (objc_opt_respondsToSelector()) {
    [v10 willTransitionToExpandedContentMode:appearanceTransition];
  }
  v11 = [v10 view];
  if (objc_opt_respondsToSelector()) {
    [v11 contentModuleWillTransitionToExpandedContentMode:appearanceTransition];
  }
  sendExpandModuleTransitionNotificationForSubviews(v11, appearanceTransition);
  [(CCUIContentModuleContainerTransition *)self contentRestOverrideFrame];
  if (CGRectIsEmpty(v29))
  {
    id v12 = objc_loadWeakRetained((id *)&self->_viewController);
    [v12 _contentFrameForRestState];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    [(CCUIContentModuleContainerTransition *)self contentRestOverrideFrame];
    double v14 = v17;
    double v16 = v18;
  }
  if (appearanceTransition)
  {
    [WeakRetained _contentBoundsForExpandedState];
    double v20 = v19;
    double v22 = v21;
    v23 = [WeakRetained transitionCoordinator];
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", v23, v20, v22);

    [(CCUIContentModuleContainerTransition *)self _removeMatchMoveAnimationFromTargetView:v27];
  }
  else
  {
    v24 = [WeakRetained transitionCoordinator];
    objc_msgSend(v10, "viewWillTransitionToSize:withTransitionCoordinator:", v24, v14, v16);

    id v25 = v27;
    v26 = [WeakRetained _contentSourceView];
    [(CCUIContentModuleContainerTransition *)self _setupMatchMoveAnimationWithSourceView:v26 targetView:v25];
  }
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v8 = [WeakRetained delegate];
  v9 = [WeakRetained contentContainerView];
  [(CCUIContentModuleContainerTransition *)self contentRestOverrideFrame];
  if (CGRectIsEmpty(v36))
  {
    id v10 = objc_loadWeakRetained((id *)p_viewController);
    [v10 _contentFrameForRestState];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    [(CCUIContentModuleContainerTransition *)self contentRestOverrideFrame];
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
    double v18 = v22;
  }
  BOOL appearanceTransition = self->_appearanceTransition;
  v24 = *MEMORY[0x1E4F5AD98];
  BOOL v25 = os_signpost_enabled((os_log_t)*MEMORY[0x1E4F5AD98]);
  if (appearanceTransition)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7B17000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_PRESENTATION_BEGIN", " enableTelemetry=YES ", buf, 2u);
    }
    kdebug_trace();
    if (gSignpostListener) {
      [(id)gSignpostListener didReceiveSignpost:5];
    }
    v26 = [WeakRetained contentModule];
    [v8 contentModuleContainerViewController:WeakRetained willOpenExpandedModule:v26];

    id v27 = (void *)MEMORY[0x1E4FB1EB0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __87__CCUIContentModuleContainerTransition_performTransitionFromView_toView_containerView___block_invoke;
    v29[3] = &unk_1E6A8A750;
    id v30 = v9;
    double v31 = v12;
    double v32 = v14;
    double v33 = v16;
    double v34 = v18;
    [v27 performWithoutAnimation:v29];
    [WeakRetained transitionToExpandedMode:1];
  }
  else
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7B17000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_DISMISSAL_BEGIN", " enableTelemetry=YES ", buf, 2u);
    }
    kdebug_trace();
    if (gSignpostListener) {
      [(id)gSignpostListener didReceiveSignpost:7];
    }
    [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
    v28 = [WeakRetained contentModule];
    [v8 contentModuleContainerViewController:WeakRetained willCloseExpandedModule:v28];

    objc_msgSend(v9, "setFrame:", v12, v14, v16, v18);
    [WeakRetained transitionToExpandedMode:0];
  }
}

uint64_t __87__CCUIContentModuleContainerTransition_performTransitionFromView_toView_containerView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)transitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v5 = [WeakRetained contentModule];
    v6 = [WeakRetained delegate];
    [WeakRetained _didEndTransitionWithContentModuleContainerTransition:self completed:1];
    id v7 = [WeakRetained contentViewController];
    if (objc_opt_respondsToSelector()) {
      [v7 didTransitionToExpandedContentMode:self->_appearanceTransition];
    }
    v8 = [WeakRetained backgroundViewController];
    [v8 endAppearanceTransition];

    if (self->_appearanceTransition)
    {
      [WeakRetained _setDidExpandModulePreference];
      [v6 contentModuleContainerViewController:WeakRetained didOpenExpandedModule:v5];
      v9 = *MEMORY[0x1E4F5AD98];
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F5AD98]))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7B17000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_PRESENTATION_END", " enableTelemetry=YES ", buf, 2u);
      }
      kdebug_trace();
      if (gSignpostListener) {
        [(id)gSignpostListener didReceiveSignpost:6];
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__CCUIContentModuleContainerTransition_transitionDidEnd___block_invoke;
      v13[3] = &unk_1E6A898F8;
      id v11 = WeakRetained;
      id v14 = v11;
      [v10 performWithoutAnimation:v13];
      [v6 contentModuleContainerViewController:v11 didCloseExpandedModule:v5];
      [v6 contentModuleContainerViewController:v11 didFinishInteractionWithModule:v5];
      double v12 = *MEMORY[0x1E4F5AD98];
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F5AD98]))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7B17000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_DISMISSAL_END", " enableTelemetry=YES ", buf, 2u);
      }
      kdebug_trace();
      if (gSignpostListener) {
        [(id)gSignpostListener didReceiveSignpost:8];
      }
    }
  }
}

void __57__CCUIContentModuleContainerTransition_transitionDidEnd___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _contentFrameForRestState];
  double v3 = v2;
  double v5 = v4;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v8 = [*(id *)(a1 + 32) view];
  objc_msgSend(v8, "setFrame:", v6, v7, v3, v5);

  v9 = [*(id *)(a1 + 32) backgroundView];
  objc_msgSend(v9, "setFrame:", v6, v7, v3, v5);

  id v10 = [*(id *)(a1 + 32) contentContainerView];
  objc_msgSend(v10, "setFrame:", v6, v7, v3, v5);
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v5 = (void *)MEMORY[0x1E4F39C00];
    id v6 = a4;
    id v7 = a3;
    v8 = [v5 animation];
    v9 = [v7 layer];
    [v8 setSourceLayer:v9];

    [v8 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v8 setRemovedOnCompletion:0];
    [v8 setDuration:INFINITY];
    [v8 setAppliesY:1];
    [v8 setAppliesX:1];
    [v6 bounds];
    double v11 = v10;
    double v13 = v12;
    [v7 bounds];
    objc_msgSend(v7, "convertRect:toView:", v6);
    double v15 = v14;
    double v17 = v16;

    double v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11 * 0.5 - v15, v13 * 0.5 - v17);
    v21[0] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v8 setSourcePoints:v19];

    double v20 = [v6 layer];

    [v20 addAnimation:v8 forKey:@"CCUIContentModuleContainerMatchMoveAnimationKey"];
  }
}

- (void)_removeMatchMoveAnimationFromTargetView:(id)a3
{
  id v3 = [a3 layer];
  [v3 removeAnimationForKey:@"CCUIContentModuleContainerMatchMoveAnimationKey"];
}

- (CCUIContentModuleContainerViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (CCUIContentModuleContainerViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)isAppearanceTransition
{
  return self->_appearanceTransition;
}

- (void)setAppearanceTransition:(BOOL)a3
{
  self->_BOOL appearanceTransition = a3;
}

- (CGRect)contentRestOverrideFrame
{
  double x = self->_contentRestOverrideFrame.origin.x;
  double y = self->_contentRestOverrideFrame.origin.y;
  double width = self->_contentRestOverrideFrame.size.width;
  double height = self->_contentRestOverrideFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentRestOverrideFrame:(CGRect)a3
{
  self->_contentRestOverrideFrame = a3;
}

- (void).cxx_destruct
{
}

@end