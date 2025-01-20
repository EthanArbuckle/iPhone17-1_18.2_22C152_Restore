@interface ShareCopyLinkActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (UIViewController)activityViewController;
- (_TtC37com_apple_CloudSharingUI_CloudSharing21ShareCopyLinkActivity)init;
- (id)_activitySettingsImage;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation ShareCopyLinkActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  uint64_t v2 = qword_10010ACE8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_1001153B8;

  return v4;
}

- (NSString)activityTitle
{
  NSString v2 = sub_1000C7400();

  return (NSString *)v2;
}

- (UIImage)activityImage
{
  NSString v2 = self;
  NSString v3 = sub_1000C7400();
  id v4 = [self imageNamed:v3];

  return (UIImage *)v4;
}

- (id)_activitySettingsImage
{
  NSString v2 = self;
  NSString v3 = sub_1000C7400();
  id v4 = (_TtC37com_apple_CloudSharingUI_CloudSharing21ShareCopyLinkActivity *)[self imageNamed:v3];

  if (v4)
  {
    id v5 = [(ShareCopyLinkActivity *)v4 _applicationIconImageForFormat:0 precomposed:0];

    NSString v2 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = sub_1000C7540();
  id v5 = self;
  char v6 = sub_1000C5D18(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4 = sub_1000C7540();
  id v5 = self;
  sub_1000C5468(v4);

  swift_bridgeObjectRelease();
}

- (UIViewController)activityViewController
{
  return (UIViewController *)0;
}

- (void)performActivity
{
  NSString v2 = self;
  sub_1000C5704();
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing21ShareCopyLinkActivity)init
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing21ShareCopyLinkActivity_urlToCopy;
  uint64_t v4 = sub_1000C6530();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ShareCopyLinkActivity();
  return [(ShareCopyLinkActivity *)&v6 init];
}

- (void).cxx_destruct
{
}

@end