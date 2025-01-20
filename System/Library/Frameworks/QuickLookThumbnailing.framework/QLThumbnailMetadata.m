@interface QLThumbnailMetadata
+ (BOOL)supportsSecureCoding;
+ (id)thumbnailMetadataFromPropertiesDictionary:(id)a3;
- (BOOL)hasIconModeApplied;
- (BOOL)isLowQuality;
- (NSDictionary)additionalProperties;
- (NSString)extensionBadge;
- (QLThumbnailMetadata)init;
- (QLThumbnailMetadata)initWithCoder:(id)a3;
- (id)description;
- (id)propertiesDict;
- (int)iconFlavor;
- (int)inlinePreviewMode;
- (int64_t)baseline;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalProperties:(id)a3;
- (void)setBaseline:(int64_t)a3;
- (void)setExtensionBadge:(id)a3;
- (void)setHasIconModeApplied:(BOOL)a3;
- (void)setIconFlavor:(int)a3;
- (void)setInlinePreviewMode:(int)a3;
- (void)setIsLowQuality:(BOOL)a3;
@end

@implementation QLThumbnailMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLThumbnailMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(QLThumbnailMetadata *)self init];
  if (v5)
  {
    v5->_inlinePreviewMode = [v4 decodeIntForKey:@"inlinePreviewMode"];
    v5->_baseline = [v4 decodeIntegerForKey:@"baseline"];
    v5->_iconFlavor = [v4 decodeIntForKey:@"iconFlavor"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBadge"];
    extensionBadge = v5->_extensionBadge;
    v5->_extensionBadge = (NSString *)v6;

    v5->_isLowQuality = [v4 decodeBoolForKey:@"isLowQuality"];
    v5->_hasIconModeApplied = [v4 decodeBoolForKey:@"hasIconModeApplied"];
    uint64_t v8 = [v4 decodePropertyListForKey:@"additionalProperties"];
    additionalProperties = v5->_additionalProperties;
    v5->_additionalProperties = (NSDictionary *)v8;
  }
  return v5;
}

- (QLThumbnailMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)QLThumbnailMetadata;
  result = [(QLThumbnailMetadata *)&v3 init];
  if (result)
  {
    result->_inlinePreviewMode = 1;
    result->_baseline = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProperties, 0);

  objc_storeStrong((id *)&self->_extensionBadge, 0);
}

+ (id)thumbnailMetadataFromPropertiesDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(QLThumbnailMetadata);
    v5 = [v3 objectForKeyedSubscript:@"inlinePreviewMode"];
    uint64_t v6 = v5;
    if (v5) {
      -[QLThumbnailMetadata setInlinePreviewMode:](v4, "setInlinePreviewMode:", [v5 intValue]);
    }
    v7 = [v3 objectForKeyedSubscript:@"yBaseline"];
    uint64_t v8 = v7;
    if (v7) {
      -[QLThumbnailMetadata setBaseline:](v4, "setBaseline:", [v7 integerValue]);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)propertiesDict
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(QLThumbnailMetadata *)self baseline] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = @"inlinePreviewMode";
    id v3 = objc_msgSend(NSNumber, "numberWithInt:", -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"));
    v10[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v7[0] = @"inlinePreviewMode";
    id v3 = objc_msgSend(NSNumber, "numberWithInt:", -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"));
    v8[0] = v3;
    v7[1] = @"yBaseline";
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[QLThumbnailMetadata baseline](self, "baseline"));
    v8[1] = v5;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[QLThumbnailMetadata inlinePreviewMode](self, "inlinePreviewMode"), @"inlinePreviewMode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[QLThumbnailMetadata baseline](self, "baseline"), @"baseline");
  objc_msgSend(v4, "encodeInt:forKey:", -[QLThumbnailMetadata iconFlavor](self, "iconFlavor"), @"iconFlavor");
  v5 = [(QLThumbnailMetadata *)self extensionBadge];
  [v4 encodeObject:v5 forKey:@"extensionBadge"];

  objc_msgSend(v4, "encodeBool:forKey:", -[QLThumbnailMetadata isLowQuality](self, "isLowQuality"), @"isLowQuality");
  objc_msgSend(v4, "encodeBool:forKey:", -[QLThumbnailMetadata hasIconModeApplied](self, "hasIconModeApplied"), @"hasIconModeApplied");
  id v6 = [(QLThumbnailMetadata *)self additionalProperties];
  [v4 encodeObject:v6 forKey:@"additionalProperties"];
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"inlinePreviewMode: %d; baseline %ld; props = %@",
                 [(QLThumbnailMetadata *)self inlinePreviewMode],
                 [(QLThumbnailMetadata *)self baseline],
                 self->_additionalProperties);

  return v2;
}

- (int)inlinePreviewMode
{
  return self->_inlinePreviewMode;
}

- (void)setInlinePreviewMode:(int)a3
{
  self->_inlinePreviewMode = a3;
}

- (int64_t)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(int64_t)a3
{
  self->_baseline = a3;
}

- (int)iconFlavor
{
  return self->_iconFlavor;
}

- (void)setIconFlavor:(int)a3
{
  self->_iconFlavor = a3;
}

- (NSString)extensionBadge
{
  return self->_extensionBadge;
}

- (void)setExtensionBadge:(id)a3
{
}

- (BOOL)isLowQuality
{
  return self->_isLowQuality;
}

- (void)setIsLowQuality:(BOOL)a3
{
  self->_isLowQuality = a3;
}

- (BOOL)hasIconModeApplied
{
  return self->_hasIconModeApplied;
}

- (void)setHasIconModeApplied:(BOOL)a3
{
  self->_hasIconModeApplied = a3;
}

- (NSDictionary)additionalProperties
{
  return self->_additionalProperties;
}

- (void)setAdditionalProperties:(id)a3
{
}

@end