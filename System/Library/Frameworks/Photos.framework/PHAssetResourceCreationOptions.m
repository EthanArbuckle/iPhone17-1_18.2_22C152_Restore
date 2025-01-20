@interface PHAssetResourceCreationOptions
- (BOOL)ensureOptionsAreCompleteForURL:(id)a3;
- (BOOL)shouldIngestInPlace;
- (BOOL)shouldMoveFile;
- (NSDate)alternateImportImageDate;
- (NSString)forcePairingIdentifier;
- (NSString)originalFilename;
- (NSString)uniformTypeIdentifier;
- (PHAssetResourceCreationOptions)initWithPropertyListRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyListRepresentation;
- (int)burstPickType;
- (void)setAlternateImportImageDate:(id)a3;
- (void)setBurstPickType:(int)a3;
- (void)setForcePairingIdentifier:(id)a3;
- (void)setOriginalFilename:(NSString *)originalFilename;
- (void)setShouldIngestInPlace:(BOOL)a3;
- (void)setShouldMoveFile:(BOOL)shouldMoveFile;
- (void)setUniformTypeIdentifier:(NSString *)uniformTypeIdentifier;
@end

@implementation PHAssetResourceCreationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcePairingIdentifier, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);

  objc_storeStrong((id *)&self->_alternateImportImageDate, 0);
}

- (void)setForcePairingIdentifier:(id)a3
{
}

- (NSString)forcePairingIdentifier
{
  return self->_forcePairingIdentifier;
}

- (void)setShouldIngestInPlace:(BOOL)a3
{
  self->_shouldIngestInPlace = a3;
}

- (BOOL)shouldIngestInPlace
{
  return self->_shouldIngestInPlace;
}

- (void)setShouldMoveFile:(BOOL)shouldMoveFile
{
  self->_shouldMoveFile = shouldMoveFile;
}

- (BOOL)shouldMoveFile
{
  return self->_shouldMoveFile;
}

- (void)setUniformTypeIdentifier:(NSString *)uniformTypeIdentifier
{
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setOriginalFilename:(NSString *)originalFilename
{
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setBurstPickType:(int)a3
{
  self->_burstPickType = a3;
}

- (int)burstPickType
{
  return self->_burstPickType;
}

- (void)setAlternateImportImageDate:(id)a3
{
}

- (NSDate)alternateImportImageDate
{
  return self->_alternateImportImageDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PHAssetResourceCreationOptions);
  [(PHAssetResourceCreationOptions *)v4 setOriginalFilename:self->_originalFilename];
  [(PHAssetResourceCreationOptions *)v4 setUniformTypeIdentifier:self->_uniformTypeIdentifier];
  [(PHAssetResourceCreationOptions *)v4 setShouldMoveFile:self->_shouldMoveFile];
  [(PHAssetResourceCreationOptions *)v4 setAlternateImportImageDate:self->_alternateImportImageDate];
  [(PHAssetResourceCreationOptions *)v4 setBurstPickType:self->_burstPickType];
  [(PHAssetResourceCreationOptions *)v4 setShouldIngestInPlace:self->_shouldIngestInPlace];
  [(PHAssetResourceCreationOptions *)v4 setForcePairingIdentifier:self->_forcePairingIdentifier];
  return v4;
}

- (BOOL)ensureOptionsAreCompleteForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PHAssetResourceCreationOptions *)self uniformTypeIdentifier];

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E4F442D8];
      v7 = [v4 pathExtension];
      v8 = [v6 typeWithFilenameExtension:v7];
      v9 = [v8 identifier];
      [(PHAssetResourceCreationOptions *)self setUniformTypeIdentifier:v9];
    }
    v10 = [(PHAssetResourceCreationOptions *)self originalFilename];

    if (!v10)
    {
      v11 = [v4 lastPathComponent];
      [(PHAssetResourceCreationOptions *)self setOriginalFilename:v11];
    }
  }
  v12 = [(PHAssetResourceCreationOptions *)self uniformTypeIdentifier];
  if (v12)
  {
    v13 = [(PHAssetResourceCreationOptions *)self originalFilename];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)propertyListRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_originalFilename forKeyedSubscript:@"originalFilename"];
  [v3 setObject:self->_uniformTypeIdentifier forKeyedSubscript:@"uniformTypeIdentifier"];
  id v4 = [NSNumber numberWithBool:self->_shouldMoveFile];
  [v3 setObject:v4 forKeyedSubscript:@"shouldMoveFile"];

  [v3 setObject:self->_alternateImportImageDate forKeyedSubscript:@"alternateImportImageDate"];
  v5 = [NSNumber numberWithInt:self->_burstPickType];
  [v3 setObject:v5 forKeyedSubscript:@"burstPickType"];

  v6 = [NSNumber numberWithBool:self->_shouldIngestInPlace];
  [v3 setObject:v6 forKeyedSubscript:@"shouldIngestInPlace"];

  forcePairingIdentifier = self->_forcePairingIdentifier;
  if (forcePairingIdentifier) {
    [v3 setObject:forcePairingIdentifier forKeyedSubscript:@"forcePairingIdentifier"];
  }

  return v3;
}

- (PHAssetResourceCreationOptions)initWithPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHAssetResourceCreationOptions;
  v5 = [(PHAssetResourceCreationOptions *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"originalFilename"];
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"uniformTypeIdentifier"];
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"shouldMoveFile"];
    v5->_shouldMoveFile = [v10 BOOLValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"alternateImportImageDate"];
    alternateImportImageDate = v5->_alternateImportImageDate;
    v5->_alternateImportImageDate = (NSDate *)v11;

    v13 = [v4 objectForKeyedSubscript:@"burstPickType"];
    v5->_burstPickType = [v13 unsignedIntegerValue];

    BOOL v14 = [v4 objectForKeyedSubscript:@"shouldIngestInPlace"];
    v5->_shouldIngestInPlace = [v14 BOOLValue];

    uint64_t v15 = [v4 objectForKeyedSubscript:@"forcePairingIdentifier"];
    forcePairingIdentifier = v5->_forcePairingIdentifier;
    v5->_forcePairingIdentifier = (NSString *)v15;
  }
  return v5;
}

@end