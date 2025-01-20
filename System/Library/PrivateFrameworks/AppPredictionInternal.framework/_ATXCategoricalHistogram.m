@interface _ATXCategoricalHistogram
+ (BOOL)supportsSecureCoding;
- (_ATXCategoricalHistogram)init;
- (_ATXCategoricalHistogram)initWithCoder:(id)a3;
- (id)getLastDatesByCategoryId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerate:(id)a3;
@end

@implementation _ATXCategoricalHistogram

- (_ATXCategoricalHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXCategoricalHistogram;
  v2 = [(_ATXCategoricalHistogram *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lastDates = v2->_lastDates;
    v2->_lastDates = (NSDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  free(self->_entries);
  v3.receiver = self;
  v3.super_class = (Class)_ATXCategoricalHistogram;
  [(_ATXCategoricalHistogram *)&v3 dealloc];
}

- (id)getLastDatesByCategoryId
{
  return self->_lastDates;
}

- (void)enumerate:(id)a3
{
  if (self->_count)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      (*((void (**)(id, void, void, double))a3 + 2))(a3, LOWORD(self->_entries[v5].var1), LOWORD(self->_entries[v5].var2), self->_entries[v5].var0);
      ++v6;
      ++v5;
    }
    while (v6 < self->_count);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXCategoricalHistogram)initWithCoder:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_ATXCategoricalHistogram;
  unint64_t v6 = [(_ATXCategoricalHistogram *)&v21 init];
  if (!v6) {
    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x1D25F6CC0]();
  unsigned int v8 = [v5 decodeInt32ForKey:@"count"];
  v6->_count = v8;
  v6->_capacity = v8;
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"entries"];
  if ([v9 length] != 16 * v6->_capacity)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, v6, @"_ATXCategoricalHistogram.m", 61, @"Invalid parameter not satisfying: %@", @"entryData.length == _capacity * sizeof(bucket_t)" object file lineNumber description];

    if (!v9) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v9)
  {
LABEL_4:
    v10 = ($79C7EF85C67C40ADD34ABE84379EB493 *)malloc_type_calloc(v6->_capacity, 0x10uLL, 0x1000040451B5BE8uLL);
    v6->_entries = v10;
    id v11 = v9;
    memcpy(v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  }
LABEL_5:
  if ([v5 containsValueForKey:@"lastDates"])
  {
    uint64_t v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"lastDates"];
    lastDates = v6->_lastDates;
    v6->_lastDates = (NSDictionary *)v12;
  }
  else
  {
    v14 = (NSDictionary *)objc_opt_new();
    lastDates = [MEMORY[0x1E4F1C9C8] date];
    if (v6->_count)
    {
      unint64_t v15 = 0;
      uint64_t v16 = 12;
      do
      {
        v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v6->_entries->var0 + v16)];
        [(NSDictionary *)v14 setObject:lastDates forKeyedSubscript:v17];

        ++v15;
        v16 += 16;
      }
      while (v15 < v6->_count);
    }
    v18 = v6->_lastDates;
    v6->_lastDates = v14;
  }
LABEL_12:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt32:self->_count forKey:@"count"];
  if (self->_entries)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:self->_entries length:16 * self->_count];
    [v5 encodeObject:v4 forKey:@"entries"];
  }
  [v5 encodeObject:self->_lastDates forKey:@"lastDates"];
}

- (void).cxx_destruct
{
}

@end