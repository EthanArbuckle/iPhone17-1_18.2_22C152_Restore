@interface GEOCacheInvalidationData
+ (BOOL)supportsSecureCoding;
- (BOOL)_isKey:(id)a3 subsetOf:(id)a4;
- (BOOL)isInvalidatedByServiceVersion:(unsigned int)a3 domains:(id)a4;
- (GEOCacheInvalidationData)initWithCoder:(id)a3;
- (GEOCacheInvalidationData)initWithTimestamp:(double)a3 ttl:(double)a4 version:(unsigned int)a5 domains:(id)a6;
- (NSArray)versionDomains;
- (double)timestamp;
- (double)ttl;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOCacheInvalidationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOCacheInvalidationData)initWithTimestamp:(double)a3 ttl:(double)a4 version:(unsigned int)a5 domains:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)GEOCacheInvalidationData;
  v12 = [(GEOCacheInvalidationData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_timestamp = a3;
    v12->_ttl = a4;
    v12->_version = a5;
    objc_storeStrong((id *)&v12->_versionDomains, a6);
  }

  return v13;
}

- (GEOCacheInvalidationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOCacheInvalidationData;
  v5 = [(GEOCacheInvalidationData *)&v14 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"GEOCacheInvalidationDataTimestampKey"];
    v5->_timestamp = v6;
    [v4 decodeDoubleForKey:@"GEOCacheInvalidationDataTTLKey"];
    v5->_ttl = v7;
    v5->_version = [v4 decodeInt32ForKey:@"GEOCacheInvalidationDataVersionKey"];
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"GEOCacheInvalidationDataVersionDomainsKey"];
    versionDomains = v5->_versionDomains;
    v5->_versionDomains = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"GEOCacheInvalidationDataTimestampKey" forKey:timestamp];
  [v5 encodeDouble:@"GEOCacheInvalidationDataTTLKey" forKey:self->_ttl];
  [v5 encodeInt32:self->_version forKey:@"GEOCacheInvalidationDataVersionKey"];
  [v5 encodeObject:self->_versionDomains forKey:@"GEOCacheInvalidationDataVersionDomainsKey"];
}

- (BOOL)isInvalidatedByServiceVersion:(unsigned int)a3 domains:(id)a4
{
  BOOL v6 = [(GEOCacheInvalidationData *)self _isKey:self->_versionDomains subsetOf:a4];
  if (v6) {
    LOBYTE(v6) = self->_version < a3;
  }
  return v6;
}

- (BOOL)_isKey:(id)a3 subsetOf:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    unint64_t v9 = [v6 count];
    if (v9 <= [v5 count])
    {
      if ([v7 count])
      {
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
          v12 = [v5 objectAtIndexedSubscript:v10];
          uint64_t v13 = [v11 caseInsensitiveCompare:v12];
          BOOL v8 = v13 == 0;

          if (v13) {
            break;
          }
          ++v10;
        }
        while (v10 < [v7 count]);
      }
      else
      {
        BOOL v8 = 1;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)ttl
{
  return self->_ttl;
}

- (unsigned)version
{
  return self->_version;
}

- (NSArray)versionDomains
{
  return self->_versionDomains;
}

- (void).cxx_destruct
{
}

@end