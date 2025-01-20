@interface _DKCompatibility
+ (id)compatibilityFromSerializedCompatibility:(id)a3;
+ (id)compatibilityWithMinVersion:(int64_t)a3 maxVersion:(int64_t)a4;
+ (id)currentCompatibility;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)eventPredicate;
- (id)filterIncompatibleEvents:(id)a3;
- (id)serialize;
- (int64_t)max;
- (int64_t)min;
- (unint64_t)hash;
- (void)setMax:(int64_t)a3;
- (void)setMin:(int64_t)a3;
@end

@implementation _DKCompatibility

+ (id)currentCompatibility
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___DKCompatibility_currentCompatibility__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentCompatibility_onceToken != -1) {
    dispatch_once(&currentCompatibility_onceToken, block);
  }
  v2 = (void *)currentCompatibility_compatibility;
  return v2;
}

+ (id)compatibilityWithMinVersion:(int64_t)a3 maxVersion:(int64_t)a4
{
  v6 = objc_alloc_init(_DKCompatibility);
  [(_DKCompatibility *)v6 setMin:a3 & ~(a3 >> 63)];
  [(_DKCompatibility *)v6 setMax:a4];
  return v6;
}

- (id)serialize
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"min";
  v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_DKCompatibility min](self, "min"));
  v7[1] = @"max";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_DKCompatibility max](self, "max"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)compatibilityFromSerializedCompatibility:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"min"];
  v6 = [v4 objectForKeyedSubscript:@"max"];

  v7 = objc_msgSend(a1, "compatibilityWithMinVersion:maxVersion:", objc_msgSend(v5, "unsignedLongLongValue"), objc_msgSend(v6, "unsignedLongLongValue"));

  return v7;
}

- (id)eventPredicate
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_DKCompatibility min](self, "min"));
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_DKCompatibility max](self, "max"));
  v6 = [v3 predicateWithFormat:@"(compatibilityVersion >= %@ AND compatibilityVersion <= %@)", v4, v5];

  return v6;
}

- (id)filterIncompatibleEvents:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_DKCompatibility *)self eventPredicate];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  if (os_variant_has_internal_diagnostics() && ([v6 isEqual:v4] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    v8 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    [v8 minusSet:v7];
    v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "%@ Filtered incompatible events: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DKCompatibility *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(_DKCompatibility *)self min];
      if (v6 == [(_DKCompatibility *)v5 min])
      {
        int64_t v7 = [(_DKCompatibility *)self max];
        BOOL v8 = v7 == [(_DKCompatibility *)v5 max];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(_DKCompatibility *)self min];
  return [(_DKCompatibility *)self max] ^ v3;
}

- (id)description
{
  int64_t v3 = NSString;
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_DKCompatibility min](self, "min"));
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_DKCompatibility max](self, "max"));
  int64_t v6 = [v3 stringWithFormat:@"CompatibilityVersion {min: %@, max: %@}", v4, v5];

  return v6;
}

- (int64_t)min
{
  return self->_min;
}

- (void)setMin:(int64_t)a3
{
  self->_min = a3;
}

- (int64_t)max
{
  return self->_max;
}

- (void)setMax:(int64_t)a3
{
  self->_max = a3;
}

@end