@interface PAMediaConversionServiceAddPFMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithKey:(id)a3 value:(id)a4;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSString)key;
- (PAMediaConversionServiceAddPFMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (id)value;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PAMediaConversionServiceAddPFMetadataPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithKey:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setKey:v6];

  [v7 setValue:v5];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)processMetadata:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  v7 = (void *)MEMORY[0x1E4F8CC50];
  v8 = [(PAMediaConversionServiceAddPFMetadataPolicy *)self key];
  v9 = [(PAMediaConversionServiceAddPFMetadataPolicy *)self value];
  LOBYTE(v7) = [v7 addMakerApplePropertyWithKey:v8 value:v9 toProperties:v6];

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    uint64_t v12 = 0;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to add metadata: %@", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceAddPFMetadataPolicy *)self key];
  [v4 encodeObject:v5 forKey:@"mediaMetadataType"];

  id v6 = [(PAMediaConversionServiceAddPFMetadataPolicy *)self value];
  [v4 encodeObject:v6 forKey:@"mediaMetadataValue"];
}

- (PAMediaConversionServiceAddPFMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"mediaMetadataType"])
  {
    id v5 = [v4 decodeObjectForKey:@"mediaMetadataType"];
    [(PAMediaConversionServiceAddPFMetadataPolicy *)self setKey:v5];
  }
  if ([v4 containsValueForKey:@"mediaMetadataValue"])
  {
    id v6 = [v4 decodeObjectForKey:@"mediaMetadataValue"];
    [(PAMediaConversionServiceAddPFMetadataPolicy *)self setValue:v6];
  }
  return self;
}

@end