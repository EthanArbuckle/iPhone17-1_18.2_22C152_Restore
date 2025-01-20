@interface BloomFilterObjectiveCHelper
- (_TtC13CDMFoundation27BloomFilterObjectiveCHelper)init;
- (id)getDecodedBFArrayWithData:(id)a3 error:(id *)a4;
- (id)getDecodedBFWithData:(id)a3 error:(id *)a4;
@end

@implementation BloomFilterObjectiveCHelper

- (id)getDecodedBFWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_2264B6980();

  return v7;
}

- (id)getDecodedBFArrayWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_2264B6B24();

  type metadata accessor for BloomFilter();
  v7 = (void *)sub_2265FB370();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC13CDMFoundation27BloomFilterObjectiveCHelper)init
{
  return (_TtC13CDMFoundation27BloomFilterObjectiveCHelper *)BloomFilterObjectiveCHelper.init()();
}

@end