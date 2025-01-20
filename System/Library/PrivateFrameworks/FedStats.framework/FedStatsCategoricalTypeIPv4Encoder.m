@interface FedStatsCategoricalTypeIPv4Encoder
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsCategoricalTypeIPv4Encoder)initWithSignificantBitCount:(unint64_t)a3;
- (id)preEncode:(id)a3;
- (unint64_t)significantBitCount;
@end

@implementation FedStatsCategoricalTypeIPv4Encoder

- (FedStatsCategoricalTypeIPv4Encoder)initWithSignificantBitCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatsCategoricalTypeIPv4Encoder;
  result = [(FedStatsCategoricalTypeIPv4Encoder *)&v5 init];
  if (result) {
    result->_significantBitCount = a3;
  }
  return result;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v6 = [a3 objectForKey:@"significantBitCount"];
  if (!v6)
  {
    v7 = [NSNumber numberWithUnsignedInteger:24];
    goto LABEL_6;
  }
  v7 = v6;
  if ([v6 integerValue] > 0)
  {
LABEL_6:
    a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithSignificantBitCount:", objc_msgSend(v7, "unsignedIntegerValue"));
    goto LABEL_7;
  }
  if (a4)
  {
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v8 stringWithFormat:@"Parameter '%@' must be positive in %@ constructor", @"significantBitCount", v10];
    *a4 = +[FedStatsError errorWithCode:101 description:v11];

    a4 = 0;
  }
LABEL_7:

  return a4;
}

- (id)preEncode:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v4 count] == 4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      v9 = &stru_270008ED0;
      while (2)
      {
        uint64_t v10 = 0;
        v11 = v9;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = [NSString stringWithFormat:@"%@", *(void *)(*((void *)&v21 + 1) + 8 * v10)];
          uint64_t v20 = -1;
          v13 = [MEMORY[0x263F08B08] scannerWithString:v12];
          int v14 = [v13 scanUnsignedInteger:&v20];

          if (!v14)
          {

            v16 = 0;
            goto LABEL_20;
          }
          v15 = +[FedStatsUtils intToBitString:v20 withLength:8];
          v9 = [(__CFString *)v11 stringByAppendingString:v15];

          ++v10;
          v11 = v9;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      v9 = &stru_270008ED0;
    }

    v18 = [(__CFString *)v9 substringToIndex:[(FedStatsCategoricalTypeIPv4Encoder *)self significantBitCount]];
    v19 = objc_msgSend(v18, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v9, "length"), @"0", 0);

    v11 = v19;
    v16 = v11;
LABEL_20:
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

- (unint64_t)significantBitCount
{
  return self->_significantBitCount;
}

@end