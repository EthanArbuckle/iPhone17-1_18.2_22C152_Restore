@interface AVAssetDownloadContentConfiguration
+ (BOOL)supportsSecureCoding;
- (AVAssetDownloadContentConfiguration)init;
- (AVAssetDownloadContentConfiguration)initWithCoder:(id)a3;
- (FigStreamingAssetDownloadContentConfig)_createFigContentConfigForEnvironmentalCondition:(int64_t)a3;
- (NSArray)mediaSelections;
- (NSArray)variantQualifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 asset:(id)a4;
- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 environmentalCondition:(int64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaSelections:(NSArray *)mediaSelections;
- (void)setVariantQualifiers:(NSArray *)variantQualifiers;
@end

@implementation AVAssetDownloadContentConfiguration

- (AVAssetDownloadContentConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVAssetDownloadContentConfiguration;
  v2 = [(AVAssetDownloadContentConfiguration *)&v4 init];
  if (v2)
  {
    v2->_variantQualifiers = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_mediaSelections = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(AVAssetDownloadContentConfiguration);
  [(AVAssetDownloadContentConfiguration *)v4 setVariantQualifiers:self->_variantQualifiers];
  [(AVAssetDownloadContentConfiguration *)v4 setMediaSelections:self->_mediaSelections];
  return v4;
}

- (FigStreamingAssetDownloadContentConfig)_createFigContentConfigForEnvironmentalCondition:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFTypeRef cf = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  variantQualifiers = self->_variantQualifiers;
  uint64_t v7 = [(NSArray *)variantQualifiers countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(variantQualifiers);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v12 environmentalConditions] & a3) != 0
          || [v12 environmentalConditions] == a3)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "_variant"), "_figAlternate"))
          {
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "_variant"), "_figAlternate");
            goto LABEL_17;
          }
          if ([v12 _figAssetVariantQualifier]) {
            objc_msgSend(v5, "addObject:", objc_msgSend(v12, "_figAssetVariantQualifier"));
          }
          else {
            FigSignalErrorAt();
          }
          char v9 = 1;
        }
      }
      uint64_t v8 = [(NSArray *)variantQualifiers countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v9 = 0;
  }
  uint64_t v13 = 0;
  if (!a3 || (v9 & 1) != 0)
  {
LABEL_17:
    if (FigStreamingAssetDownloadContentConfigCreate()) {
      goto LABEL_40;
    }
    if (v13)
    {
      if (FigStreamingAssetDownloadContentConfigSetAlternate()) {
        goto LABEL_40;
      }
    }
    else if ([v5 count] && FigStreamingAssetDownloadContentConfigSetAlternateQualifiers())
    {
LABEL_40:
      if (cf) {
        CFRelease(cf);
      }
      return (FigStreamingAssetDownloadContentConfig *)cf;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    mediaSelections = self->_mediaSelections;
    uint64_t v15 = [(NSArray *)mediaSelections countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v17 = 0;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(mediaSelections);
          }
          uint64_t v20 = [*(id *)(*((void *)&v23 + 1) + 8 * j) _selectedMediaArray];
          if (v20)
          {
            uint64_t v21 = v20;
            if (!v17) {
              v17 = (void *)[MEMORY[0x1E4F1CA48] array];
            }
            [v17 addObject:v21];
          }
        }
        uint64_t v16 = [(NSArray *)mediaSelections countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v16);
      if (v17 && FigStreamingAssetDownloadContentConfigSetMediaSelections()) {
        goto LABEL_40;
      }
    }
  }
  return (FigStreamingAssetDownloadContentConfig *)cf;
}

- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 environmentalCondition:(int64_t)a4
{
  v5 = [(AVAssetDownloadContentConfiguration *)self _createFigContentConfigForEnvironmentalCondition:a4];
  if (v5)
  {
    v6 = v5;
    if ([(AVAssetDownloadContentConfiguration *)self isMemberOfClass:objc_opt_class()])FigStreamingAssetDownloadConfigSetPrimaryContentConfig(); {
    else
    }
      FigStreamingAssetDownloadConfigAddAuxConfig();
    CFRelease(v6);
  }
}

- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 asset:(id)a4
{
  [(AVAssetDownloadContentConfiguration *)self _serializeIntoDownloadConfig:a3 environmentalCondition:0];
  [(AVAssetDownloadContentConfiguration *)self _serializeIntoDownloadConfig:a3 environmentalCondition:1];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadContentConfiguration;
  [(AVAssetDownloadContentConfiguration *)&v3 dealloc];
}

- (NSArray)variantQualifiers
{
  return self->_variantQualifiers;
}

- (void)setVariantQualifiers:(NSArray *)variantQualifiers
{
}

- (NSArray)mediaSelections
{
  return self->_mediaSelections;
}

- (void)setMediaSelections:(NSArray *)mediaSelections
{
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, v18), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  [a3 encodeObject:self->_variantQualifiers forKey:@"variantQualifiers"];
  v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mediaSelections = self->_mediaSelections;
  uint64_t v13 = [(NSArray *)mediaSelections countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(mediaSelections);
        }
        objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16++), "propertyList"));
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)mediaSelections countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
  [a3 encodeObject:v11 forKey:@"mediaSelections"];
}

- (AVAssetDownloadContentConfiguration)initWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    long long v21 = self;
    long long v27 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v22, v23, v24, v25, v26, v28), 0 reason userInfo];
    objc_exception_throw(v27);
  }
  v33.receiver = self;
  v33.super_class = (Class)AVAssetDownloadContentConfiguration;
  uint64_t v6 = [(AVAssetDownloadContentConfiguration *)&v33 init];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v6->_variantQualifiers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"variantQualifiers");
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0), @"mediaSelections");
    v6->_mediaSelections = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [[AVMediaSelection alloc] initWithAsset:0 propertyList:*(void *)(*((void *)&v29 + 1) + 8 * v18)];
          if (v19) {
            [(NSArray *)v6->_mediaSelections addObject:v19];
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v16);
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end