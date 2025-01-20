@interface BKSDisplayInterstitialRenderOverlayDismissAction
- (BKSDisplayInterstitialRenderOverlayDismissAction)initWithDescriptor:(id)a3;
- (BKSDisplayRenderOverlayDescriptor)overlayDescriptor;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dismiss;
- (void)dismissWithAnimation:(id)a3;
@end

@implementation BKSDisplayInterstitialRenderOverlayDismissAction

- (void).cxx_destruct
{
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSDisplayInterstitialRenderOverlayDismissAction *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self->_overlayDescriptor];
  id v4 = (id)[v3 appendObject:self->_overlayDescriptor withName:@"overlayDescriptor"];
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKSDisplayInterstitialRenderOverlayDismissAction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)dismissWithAnimation:(id)a3
{
}

- (void)dismiss
{
}

- (BKSDisplayRenderOverlayDescriptor)overlayDescriptor
{
  return self->_overlayDescriptor;
}

- (BKSDisplayInterstitialRenderOverlayDismissAction)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSDisplayInterstitialRenderOverlayDismissAction;
  v6 = [(BKSDisplayInterstitialRenderOverlayDismissAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_overlayDescriptor, a3);
  }

  return v7;
}

@end