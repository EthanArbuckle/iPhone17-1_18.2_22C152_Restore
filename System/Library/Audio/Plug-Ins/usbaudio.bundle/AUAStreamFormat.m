@interface AUAStreamFormat
- (AUAStreamFormat)init;
- (AUAStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (AUAStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3;
- (AUAStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6;
- (BOOL)isCompatible:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(void *)a3;
@end

@implementation AUAStreamFormat

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  [(AUAStreamFormat *)v3 audioStreamBasicDescription];
  double v4 = v11;
  uint64_t v5 = *(void *)&v3->ASDStreamFormat_opaque[OBJC_IVAR___AUAStreamFormat_altSetting];
  unint64_t v6 = *(void *)&v3->ASDStreamFormat_opaque[OBJC_IVAR___AUAStreamFormat_rateRange];
  unint64_t v7 = *(void *)&v3->altSetting[OBJC_IVAR___AUAStreamFormat_rateRange];
  unint64_t v8 = *(void *)&v3->rateRange[OBJC_IVAR___AUAStreamFormat_rateRange];
  objc_allocWithZone((Class)type metadata accessor for AUAStreamFormat());
  swift_retain();
  id v9 = sub_1000386E0((uint64_t)&v11, v5, v6, v7, v8);
  [v9 setSampleRate:v4];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = sub_100038900((uint64_t)v8);

  sub_100038E5C((uint64_t)v8);
  return v6;
}

- (BOOL)isCompatible:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v5 = a3;
  BOOL v6 = self;
  LOBYTE(v3) = sub_100038C68(v3);

  return v3 & 1;
}

- (AUAStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AUAStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AUAStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AUAStreamFormat)init
{
  result = (AUAStreamFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end