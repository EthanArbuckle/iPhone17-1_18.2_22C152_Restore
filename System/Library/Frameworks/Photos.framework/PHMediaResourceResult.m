@interface PHMediaResourceResult
- (BOOL)containsValidData;
- (NSData)assetResourceData;
- (NSURL)assetResourceFileURL;
- (PHMediaResourceResult)initWithRequestID:(int)a3 assetResource:(id)a4;
- (id)adjustmentData;
- (id)adjustmentSecondaryDataURL;
- (id)allowedInfoKeys;
- (id)exifOrientation;
- (id)imageURL;
- (id)mediaMetadata;
- (id)sanitizedInfoDictionary;
- (id)uniformTypeIdentifier;
- (id)videoURL;
- (void)setAssetResourceData:(id)a3;
- (void)setAssetResourceFileURL:(id)a3;
@end

@implementation PHMediaResourceResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetResourceFileURL, 0);
  objc_storeStrong((id *)&self->_assetResourceData, 0);

  objc_storeStrong((id *)&self->_assetResource, 0);
}

- (void)setAssetResourceFileURL:(id)a3
{
}

- (NSURL)assetResourceFileURL
{
  return self->_assetResourceFileURL;
}

- (void)setAssetResourceData:(id)a3
{
}

- (NSData)assetResourceData
{
  return self->_assetResourceData;
}

- (id)mediaMetadata
{
  if ([(PHAssetResource *)self->_assetResource type] == 104
    || [(PHAssetResource *)self->_assetResource type] == 105)
  {
    v3 = self->_assetResourceData;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)adjustmentSecondaryDataURL
{
  return self->_assetResourceFileURL;
}

- (id)adjustmentData
{
  if (([(PHAssetResource *)self->_assetResource type] == PHAssetResourceTypeAdjustmentData
     || [(PHAssetResource *)self->_assetResource type] == 16)
    && (assetResourceData = self->_assetResourceData) != 0)
  {
    uint64_t v13 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:assetResourceData options:0 format:0 error:&v13];
    if (v4)
    {
      v5 = [PHAdjustmentData alloc];
      v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
      v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
      v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8BA78]];
      v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
      v10 = [(PHAdjustmentData *)v5 initWithFormatIdentifier:v6 formatVersion:v7 adjustmentRenderType:v8 data:v9];

      v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8BA60]];
      [(PHAdjustmentData *)v10 setEditorBundleID:v11];
    }
    else
    {
      [(PHCompositeMediaResult *)self setErrorIfNone:v13];
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)uniformTypeIdentifier
{
  return [(PHAssetResource *)self->_assetResource uniformTypeIdentifier];
}

- (id)videoURL
{
  return self->_assetResourceFileURL;
}

- (id)exifOrientation
{
  v2 = NSNumber;
  uint64_t v3 = [(PHAssetResource *)self->_assetResource orientation];

  return (id)[v2 numberWithUnsignedInt:v3];
}

- (id)imageURL
{
  return self->_assetResourceFileURL;
}

- (id)sanitizedInfoDictionary
{
  if ([(PHAssetResource *)self->_assetResource type] == PHAssetResourceTypeAdjustmentData
    || [(PHAssetResource *)self->_assetResource type] == 16)
  {
    uint64_t v3 = [(PHMediaResourceResult *)self adjustmentData];
    [(NSMutableDictionary *)self->super._mutableInfo setObject:v3 forKeyedSubscript:@"PHAdjustmentDataKey"];
  }
  v6.receiver = self;
  v6.super_class = (Class)PHMediaResourceResult;
  v4 = [(PHCompositeMediaResult *)&v6 sanitizedInfoDictionary];

  return v4;
}

- (id)allowedInfoKeys
{
  v6.receiver = self;
  v6.super_class = (Class)PHMediaResourceResult;
  uint64_t v3 = [(PHCompositeMediaResult *)&v6 allowedInfoKeys];
  v4 = (void *)[v3 mutableCopy];

  if ([(PHAssetResource *)self->_assetResource type] == PHAssetResourceTypeAdjustmentData
    || [(PHAssetResource *)self->_assetResource type] == 16)
  {
    [v4 addObject:@"PHAdjustmentDataKey"];
  }

  return v4;
}

- (BOOL)containsValidData
{
  if (!self->_assetResourceFileURL && !self->_assetResourceData) {
    return 0;
  }
  v2 = [(PHCompositeMediaResult *)self error];
  BOOL v3 = v2 == 0;

  return v3;
}

- (PHMediaResourceResult)initWithRequestID:(int)a3 assetResource:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PHMediaResourceResult;
  v8 = [(PHCompositeMediaResult *)&v11 initWithRequestID:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_assetResource, a4);
  }

  return v9;
}

@end