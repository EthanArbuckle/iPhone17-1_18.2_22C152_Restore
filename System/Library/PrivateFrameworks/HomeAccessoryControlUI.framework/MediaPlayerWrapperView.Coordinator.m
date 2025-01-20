@interface MediaPlayerWrapperView.Coordinator
- (_TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator)init;
- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5;
@end

@implementation MediaPlayerWrapperView.Coordinator

- (_TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator_useCompactLayout) = 2;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator_viewSize);
  v4 = (objc_class *)type metadata accessor for MediaPlayerWrapperView.Coordinator();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(MediaPlayerWrapperView.Coordinator *)&v6 init];
}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v8 = sub_2514AAD64;
    if (v10)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v10;
      v10 = sub_2514AA4B8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  id v13 = a3;
  v14 = self;
  sub_2514A9C24(v13, (uint64_t)v8, v11, (uint64_t)v10, v12);
  sub_2514A4B54((uint64_t)v10);
  sub_2514A4B54((uint64_t)v8);
}

@end