@interface FedStatsCategoricalTypePreEncoderFactory
+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5;
+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7;
+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4;
+ (id)preEncoderForVariant:(id)a3 parameters:(id)a4 error:(id *)a5;
@end

@implementation FedStatsCategoricalTypePreEncoderFactory

+ (id)preEncoderForVariant:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([@"huffman" isEqual:v7])
  {
    v9 = FedStatsCategoricalTypeHuffmanEncoder;
LABEL_7:
    a5 = [(__objc2_class *)v9 instanceWithParameters:v8 error:a5];
    goto LABEL_8;
  }
  if ([@"ipv4" isEqual:v7])
  {
    v9 = FedStatsCategoricalTypeIPv4Encoder;
    goto LABEL_7;
  }
  if ([@"ipv6" isEqual:v7])
  {
    v9 = FedStatsCategoricalTypeIPv6Encoder;
    goto LABEL_7;
  }
  if (a5) {
    v11 = {;
  }
    *a5 = +[FedStatsError errorWithCode:900 description:v11];

    a5 = 0;
  }
LABEL_8:

  return a5;
}

+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([@"huffman" isEqual:v11])
  {
    v15 = FedStatsCategoricalTypeHuffmanEncoder;
LABEL_7:
    a7 = [(__objc2_class *)v15 mutateParameters:v12 usingFieldValues:v13 assetURLs:v14 requiredFields:0 assetNames:0 error:a7];
    goto LABEL_8;
  }
  if ([@"ipv4" isEqual:v11])
  {
    v15 = FedStatsCategoricalTypeIPv4Encoder;
    goto LABEL_7;
  }
  if ([@"ipv6" isEqual:v11])
  {
    v15 = FedStatsCategoricalTypeIPv6Encoder;
    goto LABEL_7;
  }
  if (a7) {
    v17 = {;
  }
    *a7 = +[FedStatsError errorWithCode:900 description:v17];

    a7 = 0;
  }
LABEL_8:

  return a7;
}

+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([@"huffman" isEqual:v7])
  {
    v10 = FedStatsCategoricalTypeHuffmanEncoder;
    uint64_t v20 = MEMORY[0x263EFFA68];
    id v11 = (id *)&v20;
    id v12 = &v20;
LABEL_7:
    id v15 = (id)[(__objc2_class *)v10 mutateParameters:v8 usingFieldValues:v9 assetURLs:0 requiredFields:0 assetNames:v12 error:0];
    id v16 = *v11;
    id v14 = v16;
    goto LABEL_8;
  }
  if ([@"ipv4" isEqual:v7])
  {
    v10 = FedStatsCategoricalTypeIPv4Encoder;
    uint64_t v19 = MEMORY[0x263EFFA68];
    id v11 = (id *)&v19;
    id v12 = &v19;
    goto LABEL_7;
  }
  int v13 = [@"ipv6" isEqual:v7];
  id v14 = (void *)MEMORY[0x263EFFA68];
  if (v13)
  {
    v10 = FedStatsCategoricalTypeIPv6Encoder;
    uint64_t v18 = MEMORY[0x263EFFA68];
    id v11 = (id *)&v18;
    id v12 = &v18;
    goto LABEL_7;
  }
  id v16 = 0;
LABEL_8:

  return v16;
}

+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([@"huffman" isEqual:v5])
  {
    id v7 = FedStatsCategoricalTypeHuffmanEncoder;
    uint64_t v17 = MEMORY[0x263EFFA68];
    id v8 = (id *)&v17;
    id v9 = &v17;
LABEL_7:
    id v12 = (id)[(__objc2_class *)v7 mutateParameters:v6 usingFieldValues:0 assetURLs:0 requiredFields:v9 assetNames:0 error:0];
    id v13 = *v8;
    id v11 = v13;
    goto LABEL_8;
  }
  if ([@"ipv4" isEqual:v5])
  {
    id v7 = FedStatsCategoricalTypeIPv4Encoder;
    uint64_t v16 = MEMORY[0x263EFFA68];
    id v8 = (id *)&v16;
    id v9 = &v16;
    goto LABEL_7;
  }
  int v10 = [@"ipv6" isEqual:v5];
  id v11 = (void *)MEMORY[0x263EFFA68];
  if (v10)
  {
    id v7 = FedStatsCategoricalTypeIPv6Encoder;
    uint64_t v15 = MEMORY[0x263EFFA68];
    id v8 = (id *)&v15;
    id v9 = &v15;
    goto LABEL_7;
  }
  id v13 = 0;
LABEL_8:

  return v13;
}

@end