@interface PHAssetCreationMetadataCopyOptions
+ (BOOL)supportsSecureCoding;
+ (id)metadataCopyOptionsForPublishingOriginals;
- (BOOL)shouldCopyLocationData;
- (BOOL)shouldCopySpatialOverCaptureResources;
- (BOOL)shouldCopyTitleDescriptionAndKeywords;
- (PHAssetCreationMetadataCopyOptions)init;
- (PHAssetCreationMetadataCopyOptions)initWithCoder:(id)a3;
- (PHAssetCreationMetadataCopyOptions)initWithXPCDict:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)plRepresentation;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldCopyLocationData:(BOOL)a3;
- (void)setShouldCopySpatialOverCaptureResources:(BOOL)a3;
- (void)setShouldCopyTitleDescriptionAndKeywords:(BOOL)a3;
@end

@implementation PHAssetCreationMetadataCopyOptions

- (void)setShouldCopyLocationData:(BOOL)a3
{
  self->_shouldCopyLocationData = a3;
}

- (BOOL)shouldCopyLocationData
{
  return self->_shouldCopyLocationData;
}

- (void)setShouldCopySpatialOverCaptureResources:(BOOL)a3
{
  self->_shouldCopySpatialOverCaptureResources = a3;
}

- (BOOL)shouldCopySpatialOverCaptureResources
{
  return self->_shouldCopySpatialOverCaptureResources;
}

- (void)setShouldCopyTitleDescriptionAndKeywords:(BOOL)a3
{
  self->_shouldCopyTitleDescriptionAndKeywords = a3;
}

- (BOOL)shouldCopyTitleDescriptionAndKeywords
{
  return self->_shouldCopyTitleDescriptionAndKeywords;
}

- (PHAssetCreationMetadataCopyOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHAssetCreationMetadataCopyOptions;
  v5 = [(PHAssetCreationMetadataCopyOptions *)&v10 init];
  if (v5)
  {
    v6 = [NSString stringWithUTF8String:"titleDescriptionAndKeywords"];
    v5->_shouldCopyTitleDescriptionAndKeywords = [v4 decodeBoolForKey:v6];

    v7 = [NSString stringWithUTF8String:"spatialOverCaptureResources"];
    v5->_shouldCopySpatialOverCaptureResources = [v4 decodeBoolForKey:v7];

    v8 = [NSString stringWithUTF8String:"shouldCopyLocationData"];
    v5->_shouldCopyLocationData = [v4 decodeBoolForKey:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL shouldCopyTitleDescriptionAndKeywords = self->_shouldCopyTitleDescriptionAndKeywords;
  v5 = NSString;
  id v6 = a3;
  v7 = [v5 stringWithUTF8String:"titleDescriptionAndKeywords"];
  [v6 encodeBool:shouldCopyTitleDescriptionAndKeywords forKey:v7];

  BOOL shouldCopySpatialOverCaptureResources = self->_shouldCopySpatialOverCaptureResources;
  v9 = [NSString stringWithUTF8String:"spatialOverCaptureResources"];
  [v6 encodeBool:shouldCopySpatialOverCaptureResources forKey:v9];

  BOOL shouldCopyLocationData = self->_shouldCopyLocationData;
  id v11 = [NSString stringWithUTF8String:"shouldCopyLocationData"];
  [v6 encodeBool:shouldCopyLocationData forKey:v11];
}

- (id)plRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8A960]);
  copyPropertiesFromObjectAToObjectB(self, v3);

  return v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHAssetCreationMetadataCopyOptions;
  id v3 = [(PHAssetCreationMetadataCopyOptions *)&v8 description];
  id v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" shouldCopyTitleDescriptionAndKeywords=%d", self->_shouldCopyTitleDescriptionAndKeywords);

  v5 = objc_msgSend(v4, "stringByAppendingFormat:", @" shouldCopySpatialOverCaptureResources=%d", self->_shouldCopySpatialOverCaptureResources);

  id v6 = objc_msgSend(v5, "stringByAppendingFormat:", @" shouldCopyLocationData=%d", self->_shouldCopyLocationData);

  return v6;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "metadataCopyOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "titleDescriptionAndKeywords", self->_shouldCopyTitleDescriptionAndKeywords);
  xpc_dictionary_set_BOOL(xdict, "spatialOverCaptureResources", self->_shouldCopySpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(xdict, "shouldCopyLocationData", self->_shouldCopyLocationData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
  [(PHAssetCreationMetadataCopyOptions *)v4 setShouldCopyTitleDescriptionAndKeywords:self->_shouldCopyTitleDescriptionAndKeywords];
  [(PHAssetCreationMetadataCopyOptions *)v4 setShouldCopySpatialOverCaptureResources:self->_shouldCopySpatialOverCaptureResources];
  [(PHAssetCreationMetadataCopyOptions *)v4 setShouldCopyLocationData:self->_shouldCopyLocationData];
  return v4;
}

- (PHAssetCreationMetadataCopyOptions)initWithXPCDict:(id)a3
{
  id v4 = a3;
  v5 = [(PHAssetCreationMetadataCopyOptions *)self init];
  if (v5)
  {
    id v6 = xpc_dictionary_get_value(v4, "metadataCopyOptions");
    v7 = v6;
    if (v6)
    {
      v5->_BOOL shouldCopyTitleDescriptionAndKeywords = xpc_dictionary_get_BOOL(v6, "titleDescriptionAndKeywords");
      v5->_BOOL shouldCopySpatialOverCaptureResources = xpc_dictionary_get_BOOL(v7, "spatialOverCaptureResources");
      v5->_BOOL shouldCopyLocationData = xpc_dictionary_get_BOOL(v7, "shouldCopyLocationData");
    }
  }
  return v5;
}

- (PHAssetCreationMetadataCopyOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAssetCreationMetadataCopyOptions;
  result = [(PHAssetCreationMetadataCopyOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_BOOL shouldCopyTitleDescriptionAndKeywords = 0;
    result->_BOOL shouldCopyLocationData = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)metadataCopyOptionsForPublishingOriginals
{
  v2 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
  [(PHAssetCreationMetadataCopyOptions *)v2 setShouldCopyTitleDescriptionAndKeywords:1];
  [(PHAssetCreationMetadataCopyOptions *)v2 setShouldCopySpatialOverCaptureResources:1];
  [(PHAssetCreationMetadataCopyOptions *)v2 setShouldCopyLocationData:1];

  return v2;
}

@end