@interface UploadManager
- (_TtC11FlusherUtil13UploadManager)init;
- (void)dealloc;
@end

@implementation UploadManager

- (void)dealloc
{
  v2 = self;
  sub_100116718();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC11FlusherUtil13UploadManager_feedbackURL;
  type metadata accessor for URL();
  sub_1000075D8();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);

  v6(v3, v4);
}

- (_TtC11FlusherUtil13UploadManager)init
{
}

@end