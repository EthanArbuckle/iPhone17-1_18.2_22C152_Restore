@interface FedStatsCategoricalTypeIPv6Encoder
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsCategoricalTypeIPv6Encoder)initWithSignificantBitCount:(unint64_t)a3;
- (id)preEncode:(id)a3;
- (unint64_t)significantBitCount;
@end

@implementation FedStatsCategoricalTypeIPv6Encoder

- (FedStatsCategoricalTypeIPv6Encoder)initWithSignificantBitCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatsCategoricalTypeIPv6Encoder;
  result = [(FedStatsCategoricalTypeIPv6Encoder *)&v5 init];
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
    v7 = [NSNumber numberWithUnsignedInteger:56];
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
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v4 count] == 6)
  {
    v21 = self;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      v9 = &stru_270008ED0;
      while (2)
      {
        uint64_t v10 = 0;
        v11 = v9;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = [NSString stringWithFormat:@"%@", *(void *)(*((void *)&v23 + 1) + 8 * v10)];
          unsigned int v22 = -1;
          if ([v12 length])
          {
            v13 = [MEMORY[0x263F08B08] scannerWithString:v12];
            int v14 = [v13 scanHexInt:&v22];

            if (!v14)
            {

              v17 = 0;
              goto LABEL_23;
            }
            uint64_t v15 = v22;
          }
          else
          {
            uint64_t v15 = 0;
            unsigned int v22 = 0;
          }
          v16 = +[FedStatsUtils intToBitString:v15 withLength:16];
          v9 = [(__CFString *)v11 stringByAppendingString:v16];

          ++v10;
          v11 = v9;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
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

    v19 = [(__CFString *)v9 substringToIndex:[(FedStatsCategoricalTypeIPv6Encoder *)v21 significantBitCount]];
    v20 = objc_msgSend(v19, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v9, "length"), @"0", 0);

    v11 = v20;
    v17 = v11;
LABEL_23:
  }
  else
  {
    v17 = 0;
  }

  return v17;
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