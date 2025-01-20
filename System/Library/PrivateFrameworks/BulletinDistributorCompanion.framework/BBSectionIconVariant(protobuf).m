@interface BBSectionIconVariant(protobuf)
+ (id)sectionIconVariantFromProtobuf:()protobuf;
- (id)blt_protobuf;
@end

@implementation BBSectionIconVariant(protobuf)

+ (id)sectionIconVariantFromProtobuf:()protobuf
{
  v3 = (void *)MEMORY[0x263F2BCA0];
  id v4 = a3;
  uint64_t v5 = [v4 format];
  v6 = [v4 imageData];
  v7 = [v3 variantWithFormat:v5 imageData:v6];

  v8 = [v4 systemImageName];
  [v7 setSystemImageName:v8];

  uint64_t v9 = [v4 precomposed];
  [v7 setPrecomposed:v9];
  return v7;
}

- (id)blt_protobuf
{
  v2 = objc_opt_new();
  v3 = [a1 systemImageName];
  [v2 setSystemImageName:v3];

  objc_msgSend(v2, "setFormat:", objc_msgSend(a1, "format"));
  id v4 = [a1 imageData];
  [v2 setImageData:v4];

  objc_msgSend(v2, "setPrecomposed:", objc_msgSend(a1, "isPrecomposed"));
  return v2;
}

@end