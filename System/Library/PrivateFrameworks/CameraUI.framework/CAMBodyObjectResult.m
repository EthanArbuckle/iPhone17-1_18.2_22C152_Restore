@interface CAMBodyObjectResult
- (AVMetadataBodyObject)_metadataBodyObject;
- (CAMBodyObjectResult)initWithBodyObject:(id)a3;
- (NSString)description;
- (NSString)metadataType;
- (NSString)uniqueIdentifier;
- (unint64_t)syntheticFocusMode;
- (void)set_metadataBodyObject:(id)a3;
@end

@implementation CAMBodyObjectResult

- (CAMBodyObjectResult)initWithBodyObject:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMBodyObjectResult;
  v6 = [(CAMBodyObjectResult *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metadataBodyObject, a3);
    v8 = NSString;
    v9 = [v5 type];
    uint64_t v10 = [v8 stringWithFormat:@"%@ %ld", v9, objc_msgSend(v5, "bodyID")];
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
  v6 = [(CAMBodyObjectResult *)self _metadataBodyObject];
  v7 = [v6 type];
  v8 = [(CAMBodyObjectResult *)self _metadataBodyObject];
  v9 = [v3 stringWithFormat:@"<%@: %p type: %@ identifier: %ld>", v5, self, v7, objc_msgSend(v8, "bodyID")];

  return (NSString *)v9;
}

- (NSString)metadataType
{
  v2 = [(CAMBodyObjectResult *)self _metadataBodyObject];
  v3 = [v2 type];

  return (NSString *)v3;
}

- (unint64_t)syntheticFocusMode
{
  v2 = [(CAMBodyObjectResult *)self underlyingMetadataObject];
  unint64_t v3 = +[CAMCaptureConversions CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:](CAMCaptureConversions, "CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:", [v2 syntheticFocusMode]);

  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (AVMetadataBodyObject)_metadataBodyObject
{
  return self->__metadataBodyObject;
}

- (void)set_metadataBodyObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataBodyObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end