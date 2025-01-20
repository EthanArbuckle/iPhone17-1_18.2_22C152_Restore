@interface BloomFilter
- (BOOL)containsWithData:(id)a3;
- (NSString)name;
- (_TtC13CDMFoundation11BloomFilter)init;
- (double)falsePositiveRate;
- (void)setName:(id)a3;
@end

@implementation BloomFilter

- (double)falsePositiveRate
{
  return BloomFilter.falsePositiveRate.getter();
}

- (NSString)name
{
  sub_226436EC8();
  v2 = (void *)sub_2265FB070();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_2265FB0A0();
  uint64_t v6 = v5;
  v7 = self;
  sub_226436F7C(v4, v6);
}

- (BOOL)containsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_2265F4FA0();
  unint64_t v8 = v7;

  LOBYTE(v4) = sub_226437EA8(v6, v8);
  sub_2263D231C(v6, v8);

  return v4 & 1;
}

- (_TtC13CDMFoundation11BloomFilter)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end