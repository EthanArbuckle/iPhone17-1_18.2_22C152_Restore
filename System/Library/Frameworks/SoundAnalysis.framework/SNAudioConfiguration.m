@interface SNAudioConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)shazamAudioConfiguration;
- (BOOL)allowHapticsAndSystemSoundsDuringRecording;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferDecoupledIO;
- (BOOL)prefersNoInterruptions;
- (BOOL)prefersNoMicrophoneUsageIndicator;
- (BOOL)smartRoutingConsideration;
- (BOOL)useSiriAudioRouting;
- (NSArray)audioHWControlFlags;
- (NSArray)channelMap;
- (NSString)category;
- (NSString)description;
- (NSString)mode;
- (SNAudioConfiguration)init;
- (SNAudioConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setChannelMap:(id)a3;
- (void)setMode:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPrefersNoMicrophoneUsageIndicator:(BOOL)a3;
- (void)setUseSiriAudioRouting:(BOOL)a3;
@end

@implementation SNAudioConfiguration

- (NSString)category
{
  v2 = self;
  v3 = (void *)sub_1DCA5BA3C();

  return (NSString *)v3;
}

- (void)setCategory:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DCA5BAE8(v4);
}

- (NSString)mode
{
  v2 = self;
  v3 = (void *)sub_1DCA5BB88();

  return (NSString *)v3;
}

- (void)setMode:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DCA5BC34(v4);
}

- (unint64_t)options
{
  return sub_1DCA5BCB4();
}

- (void)setOptions:(unint64_t)a3
{
}

- (NSArray)channelMap
{
  return (NSArray *)sub_1DCA5BFC8((uint64_t)self, (uint64_t)a2, sub_1DCA5BD24);
}

- (void)setChannelMap:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1DCB87C38();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1DCA5BDAC(v4);
}

- (BOOL)useSiriAudioRouting
{
  return sub_1DCA5BDF0() & 1;
}

- (void)setUseSiriAudioRouting:(BOOL)a3
{
}

- (BOOL)prefersNoMicrophoneUsageIndicator
{
  return sub_1DCA5BE68() & 1;
}

- (void)setPrefersNoMicrophoneUsageIndicator:(BOOL)a3
{
}

- (BOOL)prefersNoInterruptions
{
  return sub_1DCA5BEE0() & 1;
}

- (BOOL)allowHapticsAndSystemSoundsDuringRecording
{
  return sub_1DCA5BF1C() & 1;
}

- (BOOL)preferDecoupledIO
{
  return sub_1DCA5BF58() & 1;
}

- (BOOL)smartRoutingConsideration
{
  return sub_1DCA5BF94() & 1;
}

- (NSArray)audioHWControlFlags
{
  return (NSArray *)sub_1DCA5BFC8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_1DCA5C02C);
}

- (SNAudioConfiguration)init
{
  return (SNAudioConfiguration *)sub_1DCA5C138();
}

- (NSString)description
{
  v2 = self;
  SNAudioConfiguration.description.getter();

  v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNAudioConfiguration.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNAudioConfiguration.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SNAudioConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNAudioConfiguration)initWithCoder:(id)a3
{
  return (SNAudioConfiguration *)SNAudioConfiguration.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNAudioConfiguration.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (id)shazamAudioConfiguration
{
  swift_getObjCClassMetadata();
  id v2 = sub_1DCA5CD08();

  return v2;
}

@end