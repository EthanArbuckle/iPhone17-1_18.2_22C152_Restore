@interface _MPCPodcastAVItem
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (BOOL)isAssetLoaded;
- (BOOL)isExplicitTrack;
- (BOOL)prefersSeekOverSkip;
- (BOOL)usesBookmarking;
- (MPModelGenericObject)modelGenericObject;
- (NSArray)musicSubscriptionInformation;
- (NSDate)releaseDate;
- (NSString)album;
- (NSString)albumArtist;
- (NSString)artist;
- (NSString)externalContentIdentifier;
- (NSString)itemDescription;
- (NSString)mainTitle;
- (NSString)newsSubscriptionInformation;
- (NSString)podcastPageContext;
- (NSString)podcastSubscriptionState;
- (NSString)rtcReportingServiceIdentifier;
- (_MPCPodcastAVItem)initWithPlayerItem:(id)a3;
- (double)durationFromExternalMetadata;
- (id)_contentItemDeviceSpecificUserInfo;
- (id)_contentItemUserInfo;
- (id)artworkCatalogBlock;
- (int64_t)albumStoreID;
- (int64_t)storeItemInt64ID;
- (unint64_t)mediaType;
- (void)_clearAssetNow;
- (void)_updateDurationSnapshotWithElapsedTime:(double)a3 playbackRate:(float)a4;
- (void)_willBecomeActivePlayerItem;
- (void)_willResignActivePlayerItem;
- (void)loadAssetAndPlayerItemWithTask:(MPAVItemAssetTask *)a3 completion:(id)a4;
- (void)pauseContentKeySession;
- (void)resolvePlaybackError:(NSError *)a3 withCompletion:(id)a4;
- (void)resumeContentKeySession;
@end

@implementation _MPCPodcastAVItem

- (id)_contentItemUserInfo
{
  return sub_21BCA9458(self, (uint64_t)a2, (uint64_t (*)(void))sub_21BCA526C);
}

- (NSString)itemDescription
{
  return (NSString *)sub_21BCA5ABC(self, (uint64_t)a2, MEMORY[0x263F5E798], (uint64_t (*)(uint64_t))sub_21BCA78E8);
}

- (NSString)albumArtist
{
  return (NSString *)sub_21BCA5ABC(self, (uint64_t)a2, MEMORY[0x263F5E7C0], (uint64_t (*)(uint64_t))sub_21BCA78E8);
}

- (NSString)album
{
  return (NSString *)sub_21BCA5B54(self, (uint64_t)a2, sub_21BCA5BCC);
}

- (BOOL)prefersSeekOverSkip
{
  return 1;
}

- (BOOL)isExplicitTrack
{
  v2 = self;
  char v3 = sub_21BCA7B78();

  return v3 & 1;
}

- (id)artworkCatalogBlock
{
  sub_21BCA5C40();
  v5[4] = sub_21BCB1FF4;
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_21BCA6F98;
  v5[3] = &block_descriptor_90;
  char v3 = _Block_copy(v5);
  swift_release();

  return v3;
}

- (NSString)mainTitle
{
  return (NSString *)sub_21BCA7664(self);
}

- (unint64_t)mediaType
{
  uint64_t v2 = self;
  sub_21BCA7044();
  unint64_t v4 = v3;

  return v4;
}

- (int64_t)storeItemInt64ID
{
  uint64_t v2 = self;
  int64_t v3 = sub_21BCA77C4();

  return v3;
}

- (NSString)externalContentIdentifier
{
  return (NSString *)sub_21BCA7664(self);
}

- (int64_t)albumStoreID
{
  uint64_t v2 = self;
  int64_t v3 = sub_21BCA77C4();

  return v3;
}

- (NSString)artist
{
  return (NSString *)sub_21BCA5ABC(self, (uint64_t)a2, MEMORY[0x263F5E7D0], (uint64_t (*)(uint64_t))sub_21BCA78E8);
}

- (NSDate)releaseDate
{
  sub_21BCB0EF4(0, (unint64_t *)&qword_267C656F0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8, v4, v5);
  v7 = (char *)&v12 - v6;
  v8 = self;
  sub_21BCA7AC0();

  uint64_t v9 = sub_21BEA8D18();
  v10 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9) != 1)
  {
    v10 = (void *)sub_21BEA8CC8();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
  }

  return (NSDate *)v10;
}

- (NSString)podcastSubscriptionState
{
  return (NSString *)sub_21BCA5B54(self, (uint64_t)a2, sub_21BCA7C30);
}

- (NSString)podcastPageContext
{
  return (NSString *)sub_21BCA5ABC(self, (uint64_t)a2, MEMORY[0x263F5E7A0], (uint64_t (*)(uint64_t))sub_21BCA7F20);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  uint64_t v4 = self;
  CMTimeValue v5 = sub_21BCA7D90();
  uint64_t v7 = v6;
  int64_t v9 = v8;

  retstr->var0 = v5;
  *(void *)&retstr->var1 = v7;
  retstr->var3 = v9;
  return result;
}

- (BOOL)usesBookmarking
{
  uint64_t v2 = self;
  BOOL v3 = sub_21BCA7EC0();

  return v3;
}

- (NSString)newsSubscriptionInformation
{
  return (NSString *)sub_21BCA5ABC(self, (uint64_t)a2, MEMORY[0x263F5E7B0], (uint64_t (*)(uint64_t))sub_21BCA7F20);
}

- (NSArray)musicSubscriptionInformation
{
  uint64_t v2 = self;
  uint64_t v3 = sub_21BCA8048();

  if (v3)
  {
    sub_21BC330A4(0, (unint64_t *)&qword_26AAEF8B0);
    uint64_t v4 = (void *)sub_21BEAA2F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (MPModelGenericObject)modelGenericObject
{
  uint64_t v2 = self;
  id v3 = sub_21BCA8130();

  return (MPModelGenericObject *)v3;
}

- (id)_contentItemDeviceSpecificUserInfo
{
  return sub_21BCA9458(self, (uint64_t)a2, (uint64_t (*)(void))sub_21BCA91B0);
}

- (double)durationFromExternalMetadata
{
  uint64_t v2 = self;
  double v3 = sub_21BCA9514();

  return v3;
}

- (BOOL)isAssetLoaded
{
  uint64_t v2 = self;
  unsigned __int8 v3 = sub_21BCAA130();

  return v3 & 1;
}

- (void)_clearAssetNow
{
  uint64_t v2 = self;
  sub_21BCAA19C();
}

- (void)loadAssetAndPlayerItemWithTask:(MPAVItemAssetTask *)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  int64_t v8 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C64390, (uint64_t)v7);
}

- (void)_willBecomeActivePlayerItem
{
  uint64_t v2 = self;
  sub_21BCAB2A0();
}

- (void)_willResignActivePlayerItem
{
  uint64_t v2 = self;
  sub_21BCABF4C();
}

- (void)pauseContentKeySession
{
  uint64_t v2 = self;
  sub_21BCAC06C();
}

- (void)resumeContentKeySession
{
  uint64_t v2 = self;
  sub_21BCAC06C();
}

- (void)_updateDurationSnapshotWithElapsedTime:(double)a3 playbackRate:(float)a4
{
  uint64_t v6 = self;
  sub_21BCAC388(a3, a4);
}

- (_MPCPodcastAVItem)initWithPlayerItem:(id)a3
{
  id v3 = a3;
  sub_21BCAC8E0();
}

- (void).cxx_destruct
{
  sub_21BEA9358();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21_1();
  v3();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____MPCPodcastAVItem____lazy_storage___fairPlayKeyLoader));
  swift_bridgeObjectRelease();
  sub_21BEA9488();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21_1();
  v4();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)resolvePlaybackError:(NSError *)a3 withCompletion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  int64_t v8 = a3;
  int64_t v9 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C642A8, (uint64_t)v7);
}

- (NSString)rtcReportingServiceIdentifier
{
  uint64_t v2 = self;
  sub_21BCB0F58();

  id v3 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end