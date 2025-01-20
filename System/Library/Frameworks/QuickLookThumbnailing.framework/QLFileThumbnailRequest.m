@interface QLFileThumbnailRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)thirdPartyVideoDecodersAllowed;
- (BOOL)wantsLowQuality;
- (CGFloat)scale;
- (CGSize)maximumSize;
- (CGSize)minimumSize;
- (NSDictionary)generationData;
- (NSDictionary)options;
- (NSURL)fileURL;
- (QLFileThumbnailRequest)initWithCoder:(id)a3;
- (QLFileThumbnailRequest)initWithItem:(id)a3 maximumSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 options:(id)a7 generationData:(id)a8;
- (QLThumbnailItem)item;
- (id)contentType;
- (id)description;
- (int)iconFlavor;
- (int)interpolationQuality;
- (unint64_t)badgeType;
- (void)encodeWithCoder:(id)a3;
- (void)setGenerationData:(id)a3;
- (void)setItem:(id)a3;
- (void)setMaximumSize:(CGSize)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)setOptions:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation QLFileThumbnailRequest

- (QLFileThumbnailRequest)initWithItem:(id)a3 maximumSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 options:(id)a7 generationData:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)QLFileThumbnailRequest;
  v19 = [(QLFileThumbnailRequest *)&v23 init];
  v20 = v19;
  if (v19)
  {
    v19->_maximumSize.CGFloat width = width;
    v19->_maximumSize.CGFloat height = height;
    v19->_minimumSize.CGFloat width = a5;
    v19->_minimumSize.CGFloat height = a5;
    v19->_scale = a6;
    objc_storeStrong((id *)&v19->_item, a3);
    objc_storeStrong((id *)&v20->_generationData, a8);
    objc_storeStrong((id *)&v20->_options, a7);
    v21 = v20;
  }

  return v20;
}

- (NSURL)fileURL
{
  v2 = [(QLFileThumbnailRequest *)self item];
  v3 = [v2 fileURL];

  return (NSURL *)v3;
}

- (id)contentType
{
  v2 = [(QLFileThumbnailRequest *)self item];
  v3 = [v2 contentType];
  v4 = [v3 identifier];

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p maximumSize=(%.2f, %.2f) minimumSize=(%.2f,%.2f) scale=%.1f item=%@>", objc_opt_class(), self, *(void *)&self->_maximumSize.width, *(void *)&self->_maximumSize.height, *(void *)&self->_minimumSize.width, *(void *)&self->_minimumSize.height, *(void *)&self->_scale, self->_item];
}

- (unint64_t)badgeType
{
  v2 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"BadgeType"];
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (int)iconFlavor
{
  v2 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"IconFlavor"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)interpolationQuality
{
  v2 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"InterpolationQuality"];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)wantsLowQuality
{
  v2 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"WantsLowQuality"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)thirdPartyVideoDecodersAllowed
{
  v2 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"ThirdPartyVideoDecodersAllowed"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLFileThumbnailRequest)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)QLFileThumbnailRequest;
  id v3 = a3;
  v4 = [(QLFileThumbnailRequest *)&v18 init];
  objc_msgSend(v3, "decodeFloatForKey:", @"maxW", v18.receiver, v18.super_class);
  CGFloat v6 = v5;
  [v3 decodeFloatForKey:@"maxH"];
  v4->_maximumSize.CGFloat width = v6;
  v4->_maximumSize.CGFloat height = v7;
  [v3 decodeFloatForKey:@"min"];
  CGFloat v9 = v8;
  v4->_minimumSize.CGFloat width = v9;
  v4->_minimumSize.CGFloat height = v9;
  [v3 decodeFloatForKey:@"s"];
  v4->_scale = v10;
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
  item = v4->_item;
  v4->_item = (QLThumbnailItem *)v11;

  uint64_t v13 = [v3 decodePropertyListForKey:@"o"];
  options = v4->_options;
  v4->_options = (NSDictionary *)v13;

  uint64_t v15 = [v3 decodePropertyListForKey:@"g"];

  generationData = v4->_generationData;
  v4->_generationData = (NSDictionary *)v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  float width = self->_maximumSize.width;
  id v9 = a3;
  *(float *)&double v5 = width;
  [v9 encodeFloat:@"maxW" forKey:v5];
  CGFloat height = self->_maximumSize.height;
  *(float *)&CGFloat height = height;
  [v9 encodeFloat:@"maxH" forKey:height];
  CGFloat v7 = self->_minimumSize.width;
  *(float *)&CGFloat v7 = v7;
  [v9 encodeFloat:@"min" forKey:v7];
  double scale = self->_scale;
  *(float *)&double scale = scale;
  [v9 encodeFloat:@"s" forKey:scale];
  [v9 encodeObject:self->_item forKey:@"i"];
  [v9 encodeObject:self->_options forKey:@"o"];
  [v9 encodeObject:self->_generationData forKey:@"g"];
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->_maximumSize = a3;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->_minimumSize = a3;
}

- (CGFloat)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (QLThumbnailItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)generationData
{
  return self->_generationData;
}

- (void)setGenerationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationData, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end