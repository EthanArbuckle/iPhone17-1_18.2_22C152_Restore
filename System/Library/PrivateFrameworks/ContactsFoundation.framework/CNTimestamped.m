@interface CNTimestamped
+ (id)timestampedWithValue:(id)a3 timestamp:(double)a4;
+ (id)wrapTransformWithScheduler:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNTimestamped)initWithValue:(id)a3 timestamp:(double)a4;
- (double)timestamp;
- (id)description;
- (id)value;
- (unint64_t)hash;
@end

@implementation CNTimestamped

+ (id)wrapTransformWithScheduler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CNTimestamped_wrapTransformWithScheduler___block_invoke;
  v8[3] = &unk_1E56A15A0;
  id v9 = v4;
  id v10 = a1;
  id v5 = v4;
  v6 = (void *)[v8 copy];

  return v6;
}

id __44__CNTimestamped_wrapTransformWithScheduler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 alloc];
  [*(id *)(a1 + 32) timestamp];
  v6 = objc_msgSend(v5, "initWithValue:timestamp:", v4);

  return v6;
}

+ (id)timestampedWithValue:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithValue:v6 timestamp:a4];

  return v7;
}

- (CNTimestamped)initWithValue:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNTimestamped;
  v8 = [(CNTimestamped *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_timestamp = a4;
    id v10 = v9;
  }

  return v9;
}

- (id)description
{
  v3 = NSNumber;
  [(CNTimestamped *)self timestamp];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  id v5 = [(CNTimestamped *)self value];
  id v6 = +[CNDescriptionBuilder descriptionForObject:self, @"timestamp", v4, @"value", v5, 0 withNamesAndObjects];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __25__CNTimestamped_isEqual___block_invoke;
  v14[3] = &unk_1E56A0218;
  v14[4] = self;
  id v15 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __25__CNTimestamped_isEqual___block_invoke_2;
  v11 = &unk_1E56A0218;
  objc_super v12 = self;
  id v13 = v15;
  id v5 = v15;
  id v6 = _Block_copy(&aBlock);
  LOBYTE(self) = +[CNEqualsBuilder isObject:memberOfSameClassAndEqualTo:withBlocks:](CNEqualsBuilder, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v5, self, v14, v6, 0, aBlock, v9, v10, v11, v12);

  return (char)self;
}

BOOL __25__CNTimestamped_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) value];
  v3 = [*(id *)(a1 + 40) value];
  BOOL v4 = +[CNEqualsBuilder isObject:v2 equalToOther:v3];

  return v4;
}

BOOL __25__CNTimestamped_isEqual___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) timestamp];
  double v3 = v2;
  [*(id *)(a1 + 40) timestamp];

  return +[CNEqualsBuilder isDouble:v3 equalToOther:v4 withAccuracy:0.000001];
}

- (unint64_t)hash
{
  double v2 = [(CNTimestamped *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)value
{
  return self->_value;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end