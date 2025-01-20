@interface SWShareableContentBSActionResponder
+ (SWShareableContentBSActionResponder)sharedActionResponder;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation SWShareableContentBSActionResponder

+ (SWShareableContentBSActionResponder)sharedActionResponder
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SWShareableContentBSActionResponder_sharedActionResponder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedActionResponder_onceToken_0 != -1) {
    dispatch_once(&sharedActionResponder_onceToken_0, block);
  }
  v2 = (void *)sharedActionResponder_shared_0;

  return (SWShareableContentBSActionResponder *)v2;
}

uint64_t __60__SWShareableContentBSActionResponder_sharedActionResponder__block_invoke(uint64_t a1)
{
  sharedActionResponder_shared_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  v6 = (void *)MEMORY[0x1E4FA5660];
  id v7 = a3;
  v8 = [v6 sharedActionHandler];
  v9 = [v8 respondToBSActions:v7];

  return v9;
}

@end