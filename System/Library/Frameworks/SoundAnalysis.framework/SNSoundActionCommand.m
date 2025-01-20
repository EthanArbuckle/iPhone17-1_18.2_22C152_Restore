@interface SNSoundActionCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (SNSoundActionCommand)init;
- (SNSoundActionCommand)initWithCoder:(id)a3;
- (SNSoundActionCommand)initWithDictionary:(id)a3 error:(id *)a4;
- (double)confidenceThreshold;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)minDurationBlocks;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceThreshold:(double)a3;
- (void)setMinDurationBlocks:(int64_t)a3;
- (void)setName:(id)a3;
@end

@implementation SNSoundActionCommand

- (double)confidenceThreshold
{
  return SNSoundActionCommand.confidenceThreshold.getter();
}

- (void)setConfidenceThreshold:(double)a3
{
}

- (int64_t)minDurationBlocks
{
  return SNSoundActionCommand.minDurationBlocks.getter();
}

- (void)setMinDurationBlocks:(int64_t)a3
{
}

- (NSString)name
{
  SNSoundActionCommand.name.getter();
  v2 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_1DCB87938();
  uint64_t v6 = v5;
  v7 = self;
  SNSoundActionCommand.name.setter(v4, v6);
}

- (SNSoundActionCommand)init
{
  return (SNSoundActionCommand *)sub_1DCA86B10();
}

- (SNSoundActionCommand)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1DCB877B8();
  return (SNSoundActionCommand *)sub_1DCA86B84(v4);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNSoundActionCommand.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNSoundActionCommand.hash.getter();

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
    uint64_t v5 = self;
  }
  BOOL v6 = SNSoundActionCommand.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNSoundActionCommand)initWithCoder:(id)a3
{
  return (SNSoundActionCommand *)SNSoundActionCommand.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SNSoundActionCommand.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end