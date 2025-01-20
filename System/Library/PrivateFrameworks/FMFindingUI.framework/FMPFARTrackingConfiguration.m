@interface FMPFARTrackingConfiguration
+ (NSArray)supportedVideoFormats;
- (_TtC11FMFindingUI27FMPFARTrackingConfiguration)init;
- (id)initPrivate;
@end

@implementation FMPFARTrackingConfiguration

+ (NSArray)supportedVideoFormats
{
  swift_getObjCClassMetadata();
  sub_24D373AD8();
  sub_24D2BC100(0, &qword_269862D00);
  v2 = (void *)sub_24D39CC00();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC11FMFindingUI27FMPFARTrackingConfiguration)init
{
  return (_TtC11FMFindingUI27FMPFARTrackingConfiguration *)sub_24D374734(self, (uint64_t)a2, (SEL *)&selRef_init);
}

- (id)initPrivate
{
  return sub_24D374734(self, (uint64_t)a2, (SEL *)&selRef_initPrivate);
}

@end