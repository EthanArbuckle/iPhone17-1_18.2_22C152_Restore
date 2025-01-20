@interface _ATXTimeHistogram
+ (BOOL)supportsSecureCoding;
- (BOOL)applyFilter;
- (_ATXTimeHistogram)initWithCoder:(id)a3;
- (unsigned)pointsPerTimeInterval;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerate:(id)a3;
@end

@implementation _ATXTimeHistogram

- (void)dealloc
{
  free(self->_entries);
  v3.receiver = self;
  v3.super_class = (Class)_ATXTimeHistogram;
  [(_ATXTimeHistogram *)&v3 dealloc];
}

- (unsigned)pointsPerTimeInterval
{
  return self->_bucketCount;
}

- (void)enumerate:(id)a3
{
  if (self->_count)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      (*((void (**)(id, void, void, double))a3 + 2))(a3, LOWORD(self->_entries[v5].var1), self->_entries[v5].var2, self->_entries[v5].var0);
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

- (_ATXTimeHistogram)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_ATXTimeHistogram;
  uint64_t v5 = [(_ATXTimeHistogram *)&v17 init];
  if (!v5)
  {
LABEL_15:
    v14 = v5;
    goto LABEL_16;
  }
  unint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
  v5->_size_t count = [v4 decodeInt32ForKey:@"count"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entries"];
  uint64_t v8 = [v7 length];
  size_t count = v5->_count;
  if (v8 == 16 * count)
  {
    if (v7)
    {
      v10 = ($B0AFA044FEED82C75CE0CC5BCB2D4E64 *)malloc_type_calloc(count, 0x10uLL, 0x100004099076E91uLL);
      v5->_entries = v10;
      id v11 = v7;
      memcpy(v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
    }
    if ([v4 containsValueForKey:@"bucketCount"]) {
      __int16 v12 = [v4 decodeInt32ForKey:@"bucketCount"];
    }
    else {
      __int16 v12 = 200;
    }
    v5->_bucketCount = v12;
    if ([v4 containsValueForKey:@"applyFilter"]) {
      char v15 = [v4 decodeBoolForKey:@"applyFilter"];
    }
    else {
      char v15 = 1;
    }
    v5->_applyFilter = v15;

    goto LABEL_15;
  }
  v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[_ATXTimeHistogram initWithCoder:](v13);
  }

  v14 = 0;
LABEL_16:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt32:self->_count forKey:@"count"];
  if (self->_entries)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:self->_entries length:16 * self->_count];
    [v5 encodeObject:v4 forKey:@"entries"];
  }
  [v5 encodeInt32:self->_bucketCount forKey:@"bucketCount"];
  [v5 encodeBool:self->_applyFilter forKey:@"applyFilter"];
}

- (BOOL)applyFilter
{
  return self->_applyFilter;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "invalid input for bucket_t in initWithCoder", v1, 2u);
}

@end