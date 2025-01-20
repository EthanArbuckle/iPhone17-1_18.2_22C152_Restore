@interface _GEOResourceManifestUpdateAssertionRecord
- (BOOL)isExpired;
- (NSString)description;
- (NSString)process;
- (NSString)reason;
- (_GEOResourceManifestUpdateAssertionRecord)init;
- (_GEOResourceManifestUpdateAssertionRecord)initWithProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)Current;
- (double)creationTimestamp;
@end

@implementation _GEOResourceManifestUpdateAssertionRecord

- (_GEOResourceManifestUpdateAssertionRecord)init
{
  result = (_GEOResourceManifestUpdateAssertionRecord *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOResourceManifestUpdateAssertionRecord)initWithProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)Current
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOResourceManifestUpdateAssertionRecord;
  v10 = [(_GEOResourceManifestUpdateAssertionRecord *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    process = v10->_process;
    v10->_process = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v13;

    if (CFAbsoluteTimeGetCurrent() <= Current) {
      Current = CFAbsoluteTimeGetCurrent();
    }
    v10->_creationTimestamp = Current;
    v15 = v10;
  }

  return v10;
}

- (BOOL)isExpired
{
  double creationTimestamp = self->_creationTimestamp;
  if (creationTimestamp >= CFAbsoluteTimeGetCurrent()) {
    return 1;
  }
  double v4 = CFAbsoluteTimeGetCurrent() - self->_creationTimestamp;
  return v4 >= GEOConfigGetDouble(GeoServicesConfig_ResourceManifestUpdateAssertionTimeout, (uint64_t)off_1E9114A08);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %@>", self->_process, self->_reason];
}

- (NSString)process
{
  return self->_process;
}

- (NSString)reason
{
  return self->_reason;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_process, 0);
}

@end