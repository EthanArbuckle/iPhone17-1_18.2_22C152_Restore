@interface AAUIiCloudMediaUsageInfo
- (AAUIiCloudMediaUsageInfo)initWithMediaType:(id)a3 representativeColor:(id)a4 bytesUsed:(float)a5;
- (NSString)displayLabel;
- (NSString)mediaType;
- (UIColor)representativeColor;
- (float)bytesUsed;
- (id)capacityBarCatagory;
- (void)setBytesUsed:(float)a3;
- (void)setDisplayLabel:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setRepresentativeColor:(id)a3;
@end

@implementation AAUIiCloudMediaUsageInfo

- (AAUIiCloudMediaUsageInfo)initWithMediaType:(id)a3 representativeColor:(id)a4 bytesUsed:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIiCloudMediaUsageInfo;
  v11 = [(AAUIiCloudMediaUsageInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaType, a3);
    objc_storeStrong((id *)&v12->_representativeColor, a4);
    v12->_bytesUsed = a5;
  }

  return v12;
}

- (NSString)displayLabel
{
  displayLabel = self->_displayLabel;
  if (!displayLabel) {
    displayLabel = self->_mediaType;
  }
  v3 = displayLabel;
  return v3;
}

- (id)capacityBarCatagory
{
  id v3 = objc_alloc(MEMORY[0x263F5FB10]);
  if (self->_displayLabel) {
    displayLabel = self->_displayLabel;
  }
  else {
    displayLabel = self->_mediaType;
  }
  v5 = (void *)[v3 initWithIdentifier:self->_mediaType title:displayLabel color:self->_representativeColor bytes:(uint64_t)self->_bytesUsed];
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (UIColor)representativeColor
{
  return self->_representativeColor;
}

- (void)setRepresentativeColor:(id)a3
{
}

- (float)bytesUsed
{
  return self->_bytesUsed;
}

- (void)setBytesUsed:(float)a3
{
  self->_bytesUsed = a3;
}

- (void)setDisplayLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_representativeColor, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
}

@end