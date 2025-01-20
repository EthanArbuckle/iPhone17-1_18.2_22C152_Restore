@interface SVSProxVideoView
- (_TtC18SharingViewService16SVSProxVideoView)initWithCoder:(id)a3;
- (_TtC18SharingViewService16SVSProxVideoView)initWithFrame:(CGRect)a3;
@end

@implementation SVSProxVideoView

- (_TtC18SharingViewService16SVSProxVideoView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_movieView;
  type metadata accessor for MediaPlayerView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC18SharingViewService16SVSProxVideoView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC18SharingViewService16SVSProxVideoView)initWithFrame:(CGRect)a3
{
  result = (_TtC18SharingViewService16SVSProxVideoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002DC04(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_playing), *(void **)&self->playing[OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_playing], self->playing[OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_playing + 8]);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_movieView);
}

@end