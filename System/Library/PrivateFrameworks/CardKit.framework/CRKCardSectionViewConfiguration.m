@interface CRKCardSectionViewConfiguration
- (BOOL)_debugModeEnabled;
- (CRCardSection)cardSection;
- (CRKCardSectionView)cardSectionView;
- (CRKCardSectionViewController)_cardKitCardSectionViewController;
- (CRKCardSectionViewControlling)cardSectionViewController;
- (CRKFeedbackDelegateProxying)feedbackDelegateProxy;
- (NSString)_providerIdentifier;
- (_CRKDebugOverlayView)_debugOverlayView;
- (void)_setCardKitCardSectionViewController:(id)a3;
- (void)_setDebugModeEnabled:(BOOL)a3;
- (void)_setDebugOverlayView:(id)a3;
- (void)_setProviderIdentifier:(id)a3;
- (void)_updateDebugOverlayViewText:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setCardSectionView:(id)a3;
- (void)setCardSectionViewController:(id)a3;
- (void)setFeedbackDelegateProxy:(id)a3;
@end

@implementation CRKCardSectionViewConfiguration

- (void)_setDebugOverlayView:(id)a3
{
  v5 = (_CRKDebugOverlayView *)a3;
  debugOverlayView = self->_debugOverlayView;
  v8 = v5;
  if (debugOverlayView != v5)
  {
    [(_CRKDebugOverlayView *)debugOverlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_debugOverlayView, a3);
    v7 = [(CRKCardSectionViewConfiguration *)self cardSectionView];
    [v7 addSubview:v8];
  }
}

- (void)setCardSectionView:(id)a3
{
  v5 = (CRKCardSectionView *)a3;
  if (self->_cardSectionView != v5)
  {
    [(_CRKDebugOverlayView *)self->_debugOverlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_cardSectionView, a3);
    [(CRKCardSectionView *)v5 addSubview:self->_debugOverlayView];
  }
}

- (void)_setDebugModeEnabled:(BOOL)a3
{
  if (self->_debugModeEnabled == a3) {
    return;
  }
  BOOL v3 = a3;
  [(_CRKDebugOverlayView *)self->_debugOverlayView removeFromSuperview];
  self->_debugModeEnabled = v3;
  if (!self->_debugOverlayView)
  {
    v6 = objc_alloc_init(_CRKDebugOverlayView);
    [(CRKCardSectionViewConfiguration *)self _updateDebugOverlayViewText:v6];
    v7 = [MEMORY[0x263F1C550] redColor];
    [(_CRKDebugOverlayView *)v6 setColor:v7];

    debugOverlayView = self->_debugOverlayView;
    self->_debugOverlayView = v6;

    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v3)
  {
LABEL_4:
    v5 = [(CRKCardSectionViewConfiguration *)self cardSectionView];
    [v5 addSubview:self->_debugOverlayView];
  }
LABEL_5:
  id v9 = [(CRKCardSectionViewConfiguration *)self cardSectionView];
  [v9 setNeedsLayout];
}

- (void)setCardSection:(id)a3
{
  v5 = (CRCardSection *)a3;
  p_cardSection = &self->_cardSection;
  if (self->_cardSection != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)p_cardSection, a3);
    v7 = [(CRKCardSectionViewConfiguration *)self _debugOverlayView];
    [(CRKCardSectionViewConfiguration *)self _updateDebugOverlayViewText:v7];

    v8 = [(CRKCardSectionViewConfiguration *)self cardSectionView];
    [v8 setNeedsLayout];

    v5 = v9;
  }

  MEMORY[0x270F9A758](p_cardSection, v5);
}

- (void)_setProviderIdentifier:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_providerIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_providerIdentifier, a3);
    v5 = [(CRKCardSectionViewConfiguration *)self _debugOverlayView];
    [(CRKCardSectionViewConfiguration *)self _updateDebugOverlayViewText:v5];

    v6 = [(CRKCardSectionViewConfiguration *)self cardSectionView];
    [v6 setNeedsLayout];
  }
}

- (void)_updateDebugOverlayViewText:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [(CRKCardSectionViewConfiguration *)self cardSection];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [(CRKCardSectionViewConfiguration *)self _providerIdentifier];
  v10 = [v9 componentsSeparatedByString:@"."];
  v11 = [v10 lastObject];
  id v12 = [v4 stringWithFormat:@"%@\n%@", v8, v11];

  [v5 setDebugText:v12];
}

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (CRKCardSectionView)cardSectionView
{
  return self->_cardSectionView;
}

- (CRKFeedbackDelegateProxying)feedbackDelegateProxy
{
  return self->_feedbackDelegateProxy;
}

- (void)setFeedbackDelegateProxy:(id)a3
{
}

- (CRKCardSectionViewControlling)cardSectionViewController
{
  return self->_cardSectionViewController;
}

- (void)setCardSectionViewController:(id)a3
{
}

- (NSString)_providerIdentifier
{
  return self->_providerIdentifier;
}

- (_CRKDebugOverlayView)_debugOverlayView
{
  return self->_debugOverlayView;
}

- (BOOL)_debugModeEnabled
{
  return self->_debugModeEnabled;
}

- (CRKCardSectionViewController)_cardKitCardSectionViewController
{
  return self->_cardKitCardSectionViewController;
}

- (void)_setCardKitCardSectionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardKitCardSectionViewController, 0);
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_cardSectionViewController, 0);
  objc_storeStrong((id *)&self->_feedbackDelegateProxy, 0);
  objc_storeStrong((id *)&self->_cardSectionView, 0);

  objc_storeStrong((id *)&self->_cardSection, 0);
}

@end