@interface MeProfilePictureCachePublisher.SharePublisherCache
- (void)didReceiveMemoryWarning:(id)a3;
@end

@implementation MeProfilePictureCachePublisher.SharePublisherCache

- (void)didReceiveMemoryWarning:(id)a3
{
  uint64_t v4 = sub_1AD739E80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD739E30();
  swift_retain();
  sub_1AD73AA00();
  swift_beginAccess();
  *(void *)self->sharePublisherForRenderConfiguration = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  sub_1AD73AA10();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end