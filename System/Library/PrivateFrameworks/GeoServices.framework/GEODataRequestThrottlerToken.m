@interface GEODataRequestThrottlerToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidForRequest:(id)a3 client:(id)a4;
- (GEODataRequestThrottlerToken)init;
- (GEODataRequestThrottlerToken)initWithCoder:(id)a3;
- (GEODataRequestThrottlerToken)initWithRequest:(id)a3 forClient:(id)a4;
- (GEODataRequestThrottlerToken)initWithXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCCoder:(id)a3;
- (void)refresh;
@end

@implementation GEODataRequestThrottlerToken

- (void).cxx_destruct
{
}

- (GEODataRequestThrottlerToken)initWithRequest:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEODataRequestThrottlerToken;
  v7 = [(GEODataRequestThrottlerToken *)&v12 init];
  if (v7)
  {
    GEOGetMonotonicTime();
    v7->_createdAt = v8;
    v7->_kind = ($7466BF22B2A7275A1F5DB80FF4552E0B)a3;
    uint64_t v9 = [v6 bundleId];
    bundleId = v7->_bundleId;
    v7->_bundleId = (NSString *)v9;
  }
  return v7;
}

- (GEODataRequestThrottlerToken)init
{
  result = (GEODataRequestThrottlerToken *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEODataRequestThrottlerToken)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GEODataRequestThrottlerToken *)self initWithXPCCoder:v4];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GEODataRequestThrottlerToken;
    v5 = [(GEODataRequestThrottlerToken *)&v11 init];
    if (v5)
    {
      [v4 decodeDoubleForKey:@"c"];
      v5->_createdAt = v6;
      v5->_kind.type = [v4 decodeInt32ForKey:@"t"];
      v5->_kind.subtype.raw = [v4 decodeInt32ForKey:@"s"];
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
      bundleId = v5->_bundleId;
      v5->_bundleId = (NSString *)v7;
    }
  }
  uint64_t v9 = v5;

  return v9;
}

- (GEODataRequestThrottlerToken)initWithXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEODataRequestThrottlerToken;
  v5 = [(GEODataRequestThrottlerToken *)&v10 init];
  if (v5)
  {
    objc_msgSend(v4, "geo_decodeXPCDoubleForKey:defaultValue:", @"c", 0.0);
    v5->_createdAt = v6;
    v5->_kind.type = objc_msgSend(v4, "geo_decodeXPCInt64ForKey:defaultValue:", @"t", 0);
    v5->_kind.subtype.raw = objc_msgSend(v4, "geo_decodeXPCInt64ForKey:defaultValue:", @"s", 0);
    uint64_t v7 = objc_msgSend(v4, "geo_decodeXPCStringForKey:", @"b");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(GEODataRequestThrottlerToken *)self encodeWithXPCCoder:v4];
  }
  else
  {
    [v4 encodeDouble:@"c" forKey:self->_createdAt];
    [v4 encodeInt32:self->_kind.type forKey:@"t"];
    [v4 encodeInt32:self->_kind.subtype.raw forKey:@"s"];
    [v4 encodeObject:self->_bundleId forKey:@"b"];
  }
}

- (void)encodeWithXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "geo_encodeXPCDouble:forKey:", @"c", self->_createdAt);
  objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", self->_kind.type, @"t");
  objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", self->_kind.subtype.raw, @"s");
  objc_msgSend(v4, "geo_encodeXPCString:forKey:", self->_bundleId, @"b");
}

- (BOOL)isValidForRequest:(id)a3 client:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (*(void *)&self->_kind == a3)
  {
    double v8 = [v6 bundleId];
    uint64_t v9 = v8;
    bundleId = self->_bundleId;
    if (v8)
    {
      if (!bundleId || (objc_msgSend(v8, "isEqual:") & 1) == 0) {
        goto LABEL_12;
      }
    }
    else if (bundleId)
    {
      goto LABEL_12;
    }
    if (checkEntitlements(a3.var0, v7))
    {
      GEOGetMonotonicTime();
      double v13 = v12 - self->_createdAt;
      if (v13 <= 0.0) {
        double v13 = -v13;
      }
      BOOL v11 = v13 < 5.0;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (void)refresh
{
  GEOGetMonotonicTime();
  self->_createdAt = v3;
}

@end