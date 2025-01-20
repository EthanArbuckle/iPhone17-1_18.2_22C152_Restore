@interface HLPDataCache
+ (BOOL)supportsSecureCoding;
- (BOOL)expired;
- (HLPDataCache)initWithCoder:(id)a3;
- (NSDate)updatedDate;
- (NSString)identifier;
- (NSString)languageCode;
- (NSString)lastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)maxAge;
- (unint64_t)cacheType;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheType:(unint64_t)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLastModified:(id)a3;
- (void)setMaxAge:(int64_t)a3;
- (void)setUpdatedDate:(id)a3;
@end

@implementation HLPDataCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HLPDataCache allocWithZone:a3];
  [(HLPDataCache *)v4 setCacheType:self->_cacheType];
  [(HLPDataCache *)v4 setMaxAge:self->_maxAge];
  [(HLPDataCache *)v4 setFileSize:self->_fileSize];
  [(HLPDataCache *)v4 setIdentifier:self->_identifier];
  [(HLPDataCache *)v4 setUpdatedDate:self->_updatedDate];
  [(HLPDataCache *)v4 setLastModified:self->_lastModified];
  [(HLPDataCache *)v4 setLanguageCode:self->_languageCode];
  return v4;
}

- (HLPDataCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HLPDataCache;
  v5 = [(HLPDataCache *)&v11 init];
  if (v5)
  {
    -[HLPDataCache setMaxAge:](v5, "setMaxAge:", [v4 decodeIntegerForKey:@"HLPDataCacheMaxAge"]);
    -[HLPDataCache setCacheType:](v5, "setCacheType:", [v4 decodeIntegerForKey:@"HLPDataCacheType"]);
    -[HLPDataCache setFileSize:](v5, "setFileSize:", [v4 decodeIntegerForKey:@"HLPDataCacheFileSize"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HLPDataCacheIdentifier"];
    [(HLPDataCache *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HLPDataCacheLastModified"];
    [(HLPDataCache *)v5 setLastModified:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HLPDataCacheLangaugeCode"];
    [(HLPDataCache *)v5 setLanguageCode:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HLPDataCacheUpdatedDate"];
    [(HLPDataCache *)v5 setUpdatedDate:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HLPDataCache maxAge](self, "maxAge"), @"HLPDataCacheMaxAge");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HLPDataCache cacheType](self, "cacheType"), @"HLPDataCacheType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HLPDataCache fileSize](self, "fileSize"), @"HLPDataCacheFileSize");
  v5 = [(HLPDataCache *)self identifier];
  [v4 encodeObject:v5 forKey:@"HLPDataCacheIdentifier"];

  v6 = [(HLPDataCache *)self updatedDate];
  [v4 encodeObject:v6 forKey:@"HLPDataCacheUpdatedDate"];

  v7 = [(HLPDataCache *)self lastModified];
  [v4 encodeObject:v7 forKey:@"HLPDataCacheLastModified"];

  id v8 = [(HLPDataCache *)self languageCode];
  [v4 encodeObject:v8 forKey:@"HLPDataCacheLangaugeCode"];
}

- (BOOL)expired
{
  v3 = [(HLPDataCache *)self updatedDate];
  id v4 = [v3 dateByAddingTimeInterval:(double)self->_maxAge];

  v5 = [MEMORY[0x263EFF910] date];
  v6 = [(HLPDataCache *)self updatedDate];
  if (v6) {
    BOOL v7 = [v4 compare:v5] == -1;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)debugDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@", self];
  [v3 appendFormat:@" %@ = %@\n", @"HLPDataCacheIdentifier", self->_identifier];
  [v3 appendFormat:@" %@ = %zd\n", @"HLPDataCacheType", self->_cacheType];
  [v3 appendFormat:@" %@ = %zd\n", @"HLPDataCacheMaxAge", self->_maxAge];
  [v3 appendFormat:@" %@ = %zd\n", @"HLPDataCacheUpdatedDate", self->_fileSize];
  [v3 appendFormat:@" %@ = %@\n", @"HLPDataCacheFileSize", self->_updatedDate];
  [v3 appendFormat:@" %@ = %@\n", @"HLPDataCacheLastModified", self->_lastModified];
  [v3 appendFormat:@" %@ = %@\n", @"HLPDataCacheLangaugeCode", self->_languageCode];
  return v3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_cacheType = a3;
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(int64_t)a3
{
  self->_maxAge = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end