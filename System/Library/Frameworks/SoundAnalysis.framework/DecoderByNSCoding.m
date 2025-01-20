@interface DecoderByNSCoding
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)decodeCMTimeForKey:(SEL)a3;
- ($7BC788A1DE0CAC9D3789EC862BAE0D3E)decodeCMTimeMappingForKey:(SEL)a3;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)decodeCMTimeRangeForKey:(SEL)a3;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (_TtC13SoundAnalysis17DecoderByNSCoding)init;
- (const)decodeBytesForKey:(id)a3 returnedLength:(int64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)decodeObjectForKey:(id)a3;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (void)dealloc;
@end

@implementation DecoderByNSCoding

- (void)dealloc
{
  v2 = self;
  sub_1DCA6A2A0();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SoundAnalysis17DecoderByNSCoding_decoder;
  uint64_t v3 = sub_1DC87E988(&qword_1EAAA6700);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  return sub_1DCA6B900(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1DCA6B224);
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(int64_t *)a4
{
  uint64_t v6 = sub_1DCB87938();
  uint64_t v8 = v7;
  v9 = self;
  v10 = (const char *)sub_1DCA6B310(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)decodeObjectForKey:(id)a3
{
  sub_1DCB87938();
  uint64_t v5 = v4;
  uint64_t v6 = self;
  sub_1DCA6B684(v5, &v14);

  swift_bridgeObjectRelease();
  uint64_t v7 = v15;
  if (v15)
  {
    uint64_t v8 = sub_1DC881A8C(&v14, v15);
    uint64_t v9 = *(void *)(v7 - 8);
    MEMORY[0x1F4188790](v8);
    v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = (void *)sub_1DCB89008();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_1DC8818D0((uint64_t)&v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  return sub_1DCA6B900(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1DCA6B888);
}

- (int)decodeInt32ForKey:(id)a3
{
  return sub_1DCA6BB04(self);
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  return sub_1DCA6BA24(self, (uint64_t)a2, (uint64_t)a3, sub_1DCA6AA7C);
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  return sub_1DCA6BA24(self, (uint64_t)a2, (uint64_t)a3, sub_1DCA6ABC4);
}

- (int)decodeIntForKey:(id)a3
{
  return sub_1DCA6BB04(self);
}

- (double)decodeDoubleForKey:(id)a3
{
  sub_1DCB87938();
  uint64_t v4 = self;
  sub_1DCA6BB6C();
  double v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- (float)decodeFloatForKey:(id)a3
{
  sub_1DCB87938();
  uint64_t v4 = self;
  sub_1DCA6BC34();
  float v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)decodeCMTimeForKey:(SEL)a3
{
  sub_1DCB87938();
  float v6 = self;
  int64_t v7 = sub_1DCA6BCFC();
  uint64_t v9 = v8;
  int64_t v11 = v10;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)swift_bridgeObjectRelease();
  retstr->var0 = v7;
  *(void *)&retstr->var1 = v9;
  retstr->var3 = v11;
  return result;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)decodeCMTimeRangeForKey:(SEL)a3
{
  sub_1DCB87938();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_1DCA6BE08(v7, (uint64_t)v16);
  int64_t v9 = v16[0];
  int64_t v10 = v16[2];
  int64_t v11 = v16[3];
  int64_t v12 = v16[5];

  result = ($A0D62BC7BB322857EA05296DE7D5C3FF *)swift_bridgeObjectRelease();
  uint64_t v14 = v16[1];
  uint64_t v15 = v16[4];
  retstr->var0.var0 = v9;
  *(void *)&retstr->var0.var1 = v14;
  retstr->var0.var3 = v10;
  retstr->var1.var0 = v11;
  *(void *)&retstr->var1.var1 = v15;
  retstr->var1.var3 = v12;
  return result;
}

- ($7BC788A1DE0CAC9D3789EC862BAE0D3E)decodeCMTimeMappingForKey:(SEL)a3
{
}

- (_TtC13SoundAnalysis17DecoderByNSCoding)init
{
}

@end