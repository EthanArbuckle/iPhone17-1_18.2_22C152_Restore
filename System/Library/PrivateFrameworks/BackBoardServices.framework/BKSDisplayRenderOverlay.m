@interface BKSDisplayRenderOverlay
+ (id)existingOverlayForDisplay:(id)a3;
- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties;
- (BKSDisplayRenderOverlay)initWithDescriptor:(id)a3;
- (BKSDisplayRenderOverlayDescriptor)_descriptor;
- (BKSDisplayRenderOverlayDescriptor)overlayDescriptor;
- (BOOL)isInterstitial;
- (BOOL)lockBacklight;
- (CADisplay)display;
- (NSString)name;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceOrientation;
- (void)dismiss;
- (void)dismissWithAnimation:(id)a3;
- (void)present;
@end

@implementation BKSDisplayRenderOverlay

- (void).cxx_destruct
{
}

- (BKSDisplayRenderOverlayDescriptor)_descriptor
{
  return self->_descriptor;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSDisplayRenderOverlay *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self->_descriptor];
  id v4 = (id)[v3 appendObject:self->_descriptor withName:@"descriptor"];
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKSDisplayRenderOverlay *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)dismissWithAnimation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__BKSDisplayRenderOverlay_dismissWithAnimation___block_invoke;
  v6[3] = &unk_1E5441BB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__BKSDisplayRenderOverlay_dismissWithAnimation___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  BSRunLoopPerformAfterCACommit();
}

BOOL __48__BKSDisplayRenderOverlay_dismissWithAnimation___block_invoke_2(uint64_t a1)
{
  return BKSDisplayServicesRemoveRenderOverlay(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)dismiss
{
}

- (BOOL)isInterstitial
{
  return 0;
}

- (BKSDisplayRenderOverlayDescriptor)overlayDescriptor
{
  return self->_descriptor;
}

- (void)present
{
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor progressIndicatorProperties];
}

- (BOOL)lockBacklight
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor lockBacklight];
}

- (int64_t)interfaceOrientation
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor interfaceOrientation];
}

- (CADisplay)display
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor display];
}

- (NSString)name
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor name];
}

- (BKSDisplayRenderOverlay)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSDisplayRenderOverlay;
  v6 = [(BKSDisplayRenderOverlay *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

+ (id)existingOverlayForDisplay:(id)a3
{
  return BKSDisplayServicesGetRenderOverlayForDisplay(a3);
}

@end