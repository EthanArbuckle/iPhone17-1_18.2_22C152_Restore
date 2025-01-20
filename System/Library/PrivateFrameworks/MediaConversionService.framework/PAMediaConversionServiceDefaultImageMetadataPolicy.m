@interface PAMediaConversionServiceDefaultImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithLossyCompressionQuality:(float)a3;
+ (id)standardPolicy;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)init;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3;
- (float)lossyCompressionQuality;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLossyCompressionQuality:(float)a3;
@end

@implementation PAMediaConversionServiceDefaultImageMetadataPolicy

- (void)setLossyCompressionQuality:(float)a3
{
  self->_lossyCompressionQuality = a3;
}

- (float)lossyCompressionQuality
{
  return self->_lossyCompressionQuality;
}

- (id)processMetadata:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA60];
  v6 = (void *)MEMORY[0x1E4F28ED0];
  [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self lossyCompressionQuality];
  v7 = objc_msgSend(v6, "numberWithFloat:");
  v8 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E4F2F430], 0);

  v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F2F800], *MEMORY[0x1E4F2F6D8], *MEMORY[0x1E4F2FA18], *MEMORY[0x1E4F2FC28], *MEMORY[0x1E4F2FC28], *MEMORY[0x1E4F2FC48], *MEMORY[0x1E4F2FC40], *MEMORY[0x1E4F2FC38], *MEMORY[0x1E4F2FC80], *MEMORY[0x1E4F2FC88], 0);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v15 = [v4 objectForKey:v14];
        if (v15) {
          [v8 setObject:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }
  uint64_t v16 = *MEMORY[0x1E4F2FB80];
  v17 = [v4 objectForKey:*MEMORY[0x1E4F2FB80]];
  if (v17)
  {
    v18 = v17;
    v19 = (void *)[v17 mutableCopy];

    [v19 removeObjectForKey:*MEMORY[0x1E4F2FBB8]];
    [v8 setObject:v19 forKey:v16];
  }
  uint64_t v20 = *MEMORY[0x1E4F2FD40];
  v21 = [v4 objectForKey:*MEMORY[0x1E4F2FD40]];
  if (v21)
  {
    v22 = v21;
    v23 = (void *)[v21 mutableCopy];

    [v23 removeObjectForKey:*MEMORY[0x1E4F2FD70]];
    [v8 setObject:v23 forKey:v20];
  }
  else
  {
    v23 = 0;
  }
  uint64_t v24 = *MEMORY[0x1E4F2FC20];
  v25 = [v4 objectForKey:*MEMORY[0x1E4F2FC20]];
  if (v25)
  {
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];

    uint64_t v27 = *MEMORY[0x1E4F15560];
    v28 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F15560]];
    [v26 setObject:v28 forKeyedSubscript:v27];

    uint64_t v29 = *MEMORY[0x1E4F15568];
    v30 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F15568]];
    [v26 setObject:v30 forKeyedSubscript:v29];

    [v8 setObject:v26 forKey:v24];
    v23 = v26;
  }

  return v8;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self lossyCompressionQuality];
  objc_msgSend(v4, "encodeFloat:forKey:", @"lossyCompressionQuality");
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"lossyCompressionQuality"])
  {
    [v4 decodeFloatForKey:@"lossyCompressionQuality"];
    v5 = -[PAMediaConversionServiceDefaultImageMetadataPolicy initWithLossyCompressionQuality:](self, "initWithLossyCompressionQuality:");
  }
  else
  {
    v5 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self init];
  }
  v6 = v5;

  return v6;
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PAMediaConversionServiceDefaultImageMetadataPolicy;
  id v4 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)&v8 init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3;
    [(PAMediaConversionServiceDefaultImageMetadataPolicy *)v4 setLossyCompressionQuality:v5];
  }
  return v6;
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)init
{
  LODWORD(v2) = 1062836634;
  return [(PAMediaConversionServiceDefaultImageMetadataPolicy *)self initWithLossyCompressionQuality:v2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithLossyCompressionQuality:(float)a3
{
  id v4 = objc_alloc((Class)a1);
  *(float *)&double v5 = a3;
  v6 = (void *)[v4 initWithLossyCompressionQuality:v5];
  return v6;
}

+ (id)standardPolicy
{
  id v4 = objc_opt_class();
  if (([v4 isEqual:objc_opt_class()] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 82, @"Subclasses must override %@", v8 object file lineNumber description];
  }
  if (standardPolicy_onceToken_50 != -1) {
    dispatch_once(&standardPolicy_onceToken_50, &__block_literal_global_52);
  }
  double v5 = (void *)standardPolicy_standardPolicy_49;
  return v5;
}

uint64_t __68__PAMediaConversionServiceDefaultImageMetadataPolicy_standardPolicy__block_invoke()
{
  standardPolicy_standardPolicy_49 = objc_alloc_init(PAMediaConversionServiceDefaultImageMetadataPolicy);
  return MEMORY[0x1F41817F8]();
}

@end