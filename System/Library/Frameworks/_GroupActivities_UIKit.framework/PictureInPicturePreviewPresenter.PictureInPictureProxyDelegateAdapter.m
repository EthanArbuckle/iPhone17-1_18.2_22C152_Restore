@interface PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter
- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3;
- (_TtCC22_GroupActivities_UIKit32PictureInPicturePreviewPresenter36PictureInPictureProxyDelegateAdapter)init;
- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3;
- (int64_t)pictureInPictureProxyContentType:(id)a3;
- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4;
- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5;
- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5;
- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4;
@end

@implementation PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  void (*v4)(void *__return_ptr);
  _TtCC22_GroupActivities_UIKit32PictureInPicturePreviewPresenter36PictureInPictureProxyDelegateAdapter *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  void *v10;
  void v11[3];
  uint64_t v12;
  uint64_t v13;
  uint64_t vars8;

  v4 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  v6 = a3;
  v4(v11);
  v7 = v12;
  v8 = v13;
  result = __swift_project_boxed_opaque_existential_1(v11, v12);
  if (v6)
  {
    v10 = (void *)(*(uint64_t (**)(id, uint64_t, uint64_t))(v8 + 8))(v6, v7, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  void (*v4)(void *__return_ptr);
  _TtCC22_GroupActivities_UIKit32PictureInPicturePreviewPresenter36PictureInPictureProxyDelegateAdapter *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void v20[3];
  uint64_t v21;
  uint64_t v22;
  CGRect result;

  v4 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  v6 = a3;
  v4(v20);
  v7 = v21;
  v8 = v22;
  __swift_project_boxed_opaque_existential_1(v20, v21);
  if (v6)
  {
    v13 = (*(double (**)(id, uint64_t, uint64_t))(v8 + 16))(v6, v7, v8);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);

    v9 = v13;
    v10 = v15;
    v11 = v17;
    v12 = v19;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter.picture(_:willStartPictureInPictureWith:)(a3, "Will present preview in picture in picture for session: %s");
}

- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter.picture(_:willStartPictureInPictureWith:)(a3, "Presented preview in picture in picture for session: %s");
}

- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v7 = a3;
  v8 = self;
  specialized PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter.picture(_:willStartPictureInPictureWith:)(a3, "Stopping preview in picture in picture for session: %s");
}

- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  specialized PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter.picture(_:failedToStartPictureInPictureWith:error:)(a3, a5);
}

- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = (void (*)(void))_s10ObjectiveC8ObjCBoolVIeyBy_SbIegy_TRTA_0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  specialized PictureInPicturePreviewPresenter.PictureInPictureProxyDelegateAdapter.picture(_:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:)(a3, v6, v7);
  outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v6);
}

- (int64_t)pictureInPictureProxyContentType:(id)a3
{
  return 5;
}

- (_TtCC22_GroupActivities_UIKit32PictureInPicturePreviewPresenter36PictureInPictureProxyDelegateAdapter)init
{
  result = (_TtCC22_GroupActivities_UIKit32PictureInPicturePreviewPresenter36PictureInPictureProxyDelegateAdapter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end