@interface GKMetrics
- (void)handleNotification:(id)a3;
@end

@implementation GKMetrics

- (void)handleNotification:(id)a3
{
  uint64_t v3 = sub_1AF7A9420();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A93F0();
  swift_retain();
  sub_1AF794F7C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end