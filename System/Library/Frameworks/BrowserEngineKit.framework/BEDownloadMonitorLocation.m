@interface BEDownloadMonitorLocation
- (BEDownloadMonitorLocation)init;
- (NSData)bookmarkData;
- (NSURL)url;
@end

@implementation BEDownloadMonitorLocation

- (NSURL)url
{
  v2 = (void *)sub_243259700();

  return (NSURL *)v2;
}

- (NSData)bookmarkData
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData);
  unint64_t v3 = *(void *)&self->_anon_0[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
  sub_243245024(v2, v3);
  v4 = (void *)sub_243259790();
  sub_24324DF00(v2, v3);

  return (NSData *)v4;
}

- (BEDownloadMonitorLocation)init
{
  result = (BEDownloadMonitorLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unint64_t v3 = (char *)self + OBJC_IVAR___BEDownloadMonitorLocation_url;
  uint64_t v4 = sub_243259760();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData);
  unint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];

  sub_24324DF00(v5, v6);
}

@end