@interface CAMHeadObjectResult
- (AVMetadataObject)_metadataHeadObject;
- (CAMHeadObjectResult)initWithHeadObject:(id)a3;
- (NSString)description;
- (NSString)metadataType;
- (NSString)uniqueIdentifier;
- (unint64_t)syntheticFocusMode;
- (void)set_metadataHeadObject:(id)a3;
@end

@implementation CAMHeadObjectResult

- (CAMHeadObjectResult)initWithHeadObject:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMHeadObjectResult;
  v6 = [(CAMHeadObjectResult *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metadataHeadObject, a3);
    v8 = NSString;
    v9 = [v5 type];
    uint64_t v10 = [v8 stringWithFormat:@"%@", v9];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v10;

    v12 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CAMHeadObjectResult *)self _metadataHeadObject];
  v7 = [v6 type];
  v8 = [v3 stringWithFormat:@"<%@: %p type: %@>", v5, self, v7];

  return (NSString *)v8;
}

- (NSString)metadataType
{
  v2 = [(CAMHeadObjectResult *)self _metadataHeadObject];
  v3 = [v2 type];

  return (NSString *)v3;
}

- (unint64_t)syntheticFocusMode
{
  v2 = [(CAMHeadObjectResult *)self underlyingMetadataObject];
  unint64_t v3 = +[CAMCaptureConversions CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:](CAMCaptureConversions, "CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:", [v2 syntheticFocusMode]);

  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (AVMetadataObject)_metadataHeadObject
{
  return self->__metadataHeadObject;
}

- (void)set_metadataHeadObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataHeadObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end