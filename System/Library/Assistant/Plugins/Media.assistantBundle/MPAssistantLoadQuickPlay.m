@interface MPAssistantLoadQuickPlay
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantLoadQuickPlay

- (void)performWithCompletion:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F965A8];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  v6 = [v7 dictionary];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

@end