@interface CNTimeIntervalFormatter
+ (CNTimeIntervalFormatter)sharedFormatter;
+ (id)multiplierForOrder:(int64_t)a3;
+ (id)numberFormatterWithSignificantDigits:(unint64_t)a3;
+ (id)stringForTimeInterval:(double)a3;
- (NSNumberFormatter)numberFormatterWith3SigFigs;
- (NSNumberFormatter)numberFormatterWith4SigFigs;
- (id)stringForObjectValue:(id)a3;
- (id)stringForTimeInterval:(double)a3;
@end

@implementation CNTimeIntervalFormatter

id __54__CNTimeIntervalFormatter_numberFormatterWith3SigFigs__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = [(id)objc_opt_class() numberFormatterWithSignificantDigits:3];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v2;
}

+ (id)stringForTimeInterval:(double)a3
{
  uint64_t v4 = [(id)objc_opt_class() sharedFormatter];
  v5 = [v4 stringForTimeInterval:a3];

  return v5;
}

- (id)stringForTimeInterval:(double)a3
{
  double v5 = fabs(a3);
  if (v5 >= 2.0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      double v5 = v5 * 1000.0;
      uint64_t v7 = v6 - 1;
    }
    while (v5 < 2.0 && v6-- > -7);
  }
  if (v5 >= 2000.0 && v7 <= 7)
  {
    do
    {
      double v5 = v5 / 1000.0;
      uint64_t v10 = v7 + 1;
    }
    while (v5 >= 2000.0 && v7++ < 7);
  }
  else
  {
    uint64_t v10 = v7;
  }
  v12 = [(id)objc_opt_class() multiplierForOrder:v10];
  v13 = [(CNTimeIntervalFormatter *)self numberFormatterWith3SigFigs];
  if (v5 >= 1000.0)
  {
    uint64_t v14 = [(CNTimeIntervalFormatter *)self numberFormatterWith4SigFigs];

    v13 = (void *)v14;
  }
  v15 = &stru_1EE0267A8;
  if (a3 < 0.0) {
    v15 = @"-";
  }
  v16 = NSNumber;
  v17 = v15;
  v18 = [v16 numberWithDouble:v5];
  v19 = [v13 stringFromNumber:v18];

  v20 = [NSString stringWithFormat:@"%@s", v12];
  v21 = [NSString stringWithFormat:@"%@%@ %@", v17, v19, v20];

  return v21;
}

- (NSNumberFormatter)numberFormatterWith3SigFigs
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CNTimeIntervalFormatter_numberFormatterWith3SigFigs__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSNumberFormatter *)v2;
}

+ (CNTimeIntervalFormatter)sharedFormatter
{
  if (sharedFormatter_cn_once_token_1 != -1) {
    dispatch_once(&sharedFormatter_cn_once_token_1, &__block_literal_global_87);
  }
  v2 = (void *)sharedFormatter_cn_once_object_1;

  return (CNTimeIntervalFormatter *)v2;
}

+ (id)multiplierForOrder:(int64_t)a3
{
  if (a3 > 8) {
    return @"Y";
  }
  if (a3 < -8) {
    return @"y";
  }
  if ((unint64_t)(a3 + 8) > 0x10) {
    return &stru_1EE0267A8;
  }
  return off_1E56A2558[a3 + 8];
}

- (NSNumberFormatter)numberFormatterWith4SigFigs
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__CNTimeIntervalFormatter_numberFormatterWith4SigFigs__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSNumberFormatter *)v2;
}

id __54__CNTimeIntervalFormatter_numberFormatterWith4SigFigs__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [(id)objc_opt_class() numberFormatterWithSignificantDigits:4];
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v2;
}

+ (id)numberFormatterWithSignificantDigits:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v4 setUsesSignificantDigits:1];
  [v4 setMaximumSignificantDigits:a3];
  [v4 setMinimumSignificantDigits:a3];

  return v4;
}

uint64_t __42__CNTimeIntervalFormatter_sharedFormatter__block_invoke()
{
  sharedFormatter_cn_once_object_1 = objc_alloc_init(CNTimeIntervalFormatter);

  return MEMORY[0x1F41817F8]();
}

- (id)stringForObjectValue:(id)a3
{
  [a3 doubleValue];

  return -[CNTimeIntervalFormatter stringForTimeInterval:](self, "stringForTimeInterval:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatterWith4SigFigs, 0);

  objc_storeStrong((id *)&self->_numberFormatterWith3SigFigs, 0);
}

@end