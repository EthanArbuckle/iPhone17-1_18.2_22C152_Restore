@interface EffectsLayoutController
- (BOOL)shouldAlwaysPresentExpandedAppsFor:(id)a3;
- (CGSize)expandedAppViewControllerSizeFor:(id)a3;
- (_TtC15ConversationKit23EffectsLayoutController)init;
- (_TtC15ConversationKit23EffectsLayoutController)initWithContainingViewController:(id)a3;
- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation EffectsLayoutController

- (_TtC15ConversationKit23EffectsLayoutController)initWithContainingViewController:(id)a3
{
  return (_TtC15ConversationKit23EffectsLayoutController *)EffectsLayoutController.init(containingViewController:)(a3);
}

- (BOOL)shouldAlwaysPresentExpandedAppsFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  BOOL v6 = EffectsLayoutController.shouldAlwaysPresentExpandedApps(for:)();

  return v6;
}

- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v10 = (void (*)(void))_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = (void (*)(void))thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  EffectsLayoutController.effectBrowserViewController(_:presentExpandedAppViewController:animated:completion:)(v12, a4, a5, v10, v11);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v10);
}

- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v10 = (uint64_t (*)(id))_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = (uint64_t (*)(id))partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  EffectsLayoutController.effectBrowserViewController(_:dismissExpandedAppViewController:animated:completion:)((uint64_t)v14, a4, a5, v10, v11);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v10);
}

- (CGSize)expandedAppViewControllerSizeFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = EffectsLayoutController.expandedAppViewControllerSize(for:)(v4);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC15ConversationKit23EffectsLayoutController)init
{
}

- (void).cxx_destruct
{
}

@end