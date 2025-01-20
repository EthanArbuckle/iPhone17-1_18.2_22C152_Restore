@interface AmbientMatchingFlowView
- (_TtC16MusicRecognition23AmbientMatchingFlowView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition23AmbientMatchingFlowView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)appleMusicButtonAction;
- (void)cancelAction;
- (void)displayMatchedMediaItemAction;
- (void)retryAction;
@end

@implementation AmbientMatchingFlowView

- (_TtC16MusicRecognition23AmbientMatchingFlowView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition23AmbientMatchingFlowView *)sub_1000653E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicRecognition23AmbientMatchingFlowView)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition23AmbientMatchingFlowView *)sub_100065DC0(a3);
}

- (void)appleMusicButtonAction
{
  v2 = self;
  sub_100066DC8();
}

- (void)cancelAction
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_cancellationHandler);
  v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (void)retryAction
{
  v2 = self;
  sub_1000670C4();
}

- (void)displayMatchedMediaItemAction
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchedMediaItem);
  if (v2)
  {
    v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                   + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_displayMatchedMediaItemHandler);
    uint64_t v4 = self;
    id v5 = v2;
    swift_retain();
    v3(v5);

    swift_release();
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_listeningView)
                + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_cancelButton);
  id v10 = a4;
  v11 = self;
  [v9 convertPoint:v11 fromCoordinateSpace:x, y];
  double v13 = v12;
  double v15 = v14;
  [v9 bounds];
  v21.double x = v13;
  v21.double y = v15;
  if (CGRectContainsPoint(v22, v21))
  {
    id v16 = [v9 hitTest:v10 withEvent:v13, v15];
  }
  else
  {
    v19.receiver = v11;
    v19.super_class = ObjectType;
    id v16 = -[AmbientMatchingFlowView hitTest:withEvent:](&v19, "hitTest:withEvent:", v10, x, y);
  }
  id v17 = v16;

  return v17;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_noMatchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView____lazy_storage___ambientSceneAnimator));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchedMediaItem);
}

@end