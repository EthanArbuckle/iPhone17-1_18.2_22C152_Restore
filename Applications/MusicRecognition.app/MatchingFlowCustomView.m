@interface MatchingFlowCustomView
- (_TtC16MusicRecognition22MatchingFlowCustomView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition22MatchingFlowCustomView)initWithFrame:(CGRect)a3;
- (void)appleMusicButtonAction;
- (void)cancelAction;
- (void)displayMatchedMediaItemAction;
- (void)retryAction;
@end

@implementation MatchingFlowCustomView

- (_TtC16MusicRecognition22MatchingFlowCustomView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition22MatchingFlowCustomView *)sub_1000A817C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicRecognition22MatchingFlowCustomView)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition22MatchingFlowCustomView *)sub_1000A89DC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_matchedMediaItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_matchView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_noMatchView);
}

- (void)appleMusicButtonAction
{
  v2 = self;
  sub_1000A961C();
}

- (void)cancelAction
{
}

- (void)retryAction
{
}

- (void)displayMatchedMediaItemAction
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_matchedMediaItem);
  if (v2)
  {
    v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                   + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_displayMatchedMediaItemHandler);
    v4 = self;
    id v5 = v2;
    swift_retain();
    v3(v5);

    swift_release();
  }
}

@end