@interface PathCodec
+ (uint64_t)dataForRoutingPathLeg:(uint64_t)a1;
+ (void)compress:(const maps:(maps::path_codec::geo3::RoutingPathLeg *)a2@<X8> :path_codec::geo3::RoutingPathLeg *)a1@<X1>;
+ (void)decompressInPlace:(uint64_t)a1;
+ (void)routingPathLegForData:(void *)a1@<X1>;
@end

@implementation PathCodec

+ (void)routingPathLegForData:(void *)a1@<X1>
{
  id v3 = a1;
  self;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg(a2, 0);
  id v6 = v3;
  v4 = (unsigned char *)[v6 bytes];
  int v5 = [v6 length];
  (*(void (**)(maps::path_codec::geo3::RoutingPathLeg *))(*(void *)a2 + 40))(a2);
  google::protobuf::internal::MergeFromImpl<false>(v4, v5, a2, 1);
}

+ (uint64_t)dataForRoutingPathLeg:(uint64_t)a1
{
  self;
  int v3 = (*(uint64_t (**)(google::protobuf::MessageLite *))(*(void *)a2 + 72))(a2);
  v4 = (char *)malloc_type_malloc(v3, 0x5CE9AD7CuLL);
  google::protobuf::MessageLite::SerializePartialToArray(a2, v4, v3);
  int v5 = (void *)MEMORY[0x1E4F1C9B8];

  return [v5 dataWithBytesNoCopy:v4 length:v3 freeWhenDone:1];
}

+ (void)decompressInPlace:(uint64_t)a1
{
  self;
  uint64_t v6 = 0;
  v3[0] = 0x4039000000000000;
  v3[1] = 5000;
  long long v4 = xmmword_18A62B120;
  long long v5 = xmmword_18A62B130;
  uint64_t v7 = 20000000;
  uint64_t v8 = 0x3FF199999999999ALL;
  uint64_t v9 = 0x3E800002710;
  uint64_t v10 = 0xA00002710;
  long long v11 = xmmword_18A62B140;
  long long v12 = 0x3FE6147AE147AE14uLL;
  maps::path_codec::decompress_inplace((uint64_t)v3, a2);
}

+ (void)compress:(const maps:(maps::path_codec::geo3::RoutingPathLeg *)a2@<X8> :path_codec::geo3::RoutingPathLeg *)a1@<X1>
{
  self;
  uint64_t v7 = 0;
  v4[0] = 0x4039000000000000;
  v4[1] = 5000;
  long long v5 = xmmword_18A62B120;
  long long v6 = xmmword_18A62B130;
  uint64_t v8 = 20000000;
  uint64_t v9 = 0x3FF199999999999ALL;
  uint64_t v10 = 0x3E800002710;
  uint64_t v11 = 0xA00002710;
  long long v12 = xmmword_18A62B140;
  long long v13 = 0x3FE6147AE147AE14uLL;
  maps::path_codec::compress((uint64_t)v4, a1, a2);
}

@end