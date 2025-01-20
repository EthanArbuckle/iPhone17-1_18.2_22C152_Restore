@interface ApplicationInfo
- (NSURL)executableURL;
- (_TtC12PreviewShell15ApplicationInfo)initWithApplicationProxy:(id)a3;
- (_TtC12PreviewShell15ApplicationInfo)initWithApplicationRecord:(id)a3;
- (void)_loadFromProxy:(id)a3;
@end

@implementation ApplicationInfo

- (void)_loadFromProxy:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ApplicationInfo();
  [(ApplicationInfo *)&v4 _loadFromProxy:a3];
}

- (NSURL)executableURL
{
  uint64_t v3 = sub_10000758C(&qword_10006F9E8);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_100018048((uint64_t)v5);

  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v10;
}

- (_TtC12PreviewShell15ApplicationInfo)initWithApplicationRecord:(id)a3
{
  return (_TtC12PreviewShell15ApplicationInfo *)sub_100018354((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithApplicationRecord_);
}

- (_TtC12PreviewShell15ApplicationInfo)initWithApplicationProxy:(id)a3
{
  return (_TtC12PreviewShell15ApplicationInfo *)sub_100018354((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithApplicationProxy_);
}

- (void).cxx_destruct
{
}

@end