@interface EncoderByNSCoding
- (BOOL)allowsKeyedCoding;
- (_TtC13SoundAnalysis17EncoderByNSCoding)init;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(int64_t)a4 forKey:(id)a5;
- (void)encodeCMTime:(id *)a3 forKey:(id)a4;
- (void)encodeCMTimeMapping:(id *)a3 forKey:(id)a4;
- (void)encodeCMTimeRange:(id *)a3 forKey:(id)a4;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation EncoderByNSCoding

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeCMTime:(id *)a3 forKey:(id)a4
{
  sub_1DCB87938();
  v5 = self;
  sub_1DCA69800();

  swift_bridgeObjectRelease();
}

- (void)encodeCMTimeRange:(id *)a3 forKey:(id)a4
{
  sub_1DCB87938();
  v5 = self;
  sub_1DCA69888();

  swift_bridgeObjectRelease();
}

- (void)encodeCMTimeMapping:(id *)a3 forKey:(id)a4
{
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }
  sub_1DCB87938();

  sub_1DCA699BC((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_1DC881978((uint64_t)v10);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  sub_1DCB87938();
  v5 = self;
  sub_1DCA69B28();

  swift_bridgeObjectRelease();
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  sub_1DCB87938();
  v5 = self;
  sub_1DCA69CB0();

  swift_bridgeObjectRelease();
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  sub_1DCB87938();
  v5 = self;
  sub_1DCA69D2C();

  swift_bridgeObjectRelease();
}

- (void)encodeBytes:(const char *)a3 length:(int64_t)a4 forKey:(id)a5
{
  sub_1DCB87938();
  id v8 = self;
  sub_1DCA69DA8((uint64_t)a3, a4);

  swift_bridgeObjectRelease();
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v8 = a4;
    v9 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = a4;
    v7 = self;
  }
  sub_1DCB87938();

  sub_1DCA69F28();
}

- (_TtC13SoundAnalysis17EncoderByNSCoding)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SoundAnalysis17EncoderByNSCoding_encoder;
  uint64_t v3 = sub_1DC87E988(&qword_1EAAA6720);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end