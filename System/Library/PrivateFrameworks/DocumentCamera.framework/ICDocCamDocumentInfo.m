@interface ICDocCamDocumentInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)constantColor;
- (BOOL)hasFilter;
- (DCScanDataDelegate)scanDataDelegate;
- (ICDocCamDocumentInfo)init;
- (ICDocCamDocumentInfo)initWithCoder:(id)a3;
- (ICDocCamDocumentInfo)initWithDelegate:(id)a3;
- (ICDocCamImageQuad)imageQuad;
- (ICDocCamViewControllerDelegate)delegate;
- (NSData)markupModelData;
- (NSDictionary)metaData;
- (NSString)croppedAndFilteredImageUUID;
- (NSString)croppedButNotFilteredImageUUID;
- (NSString)fullImageUUID;
- (NSString)meshAnimImageUUID;
- (NSString)scanDataDelegateIdentifier;
- (id)allUUIDs;
- (id)description;
- (int64_t)currentOrientation;
- (signed)currentFilter;
- (void)encodeWithCoder:(id)a3;
- (void)setConstantColor:(BOOL)a3;
- (void)setCroppedAndFilteredImageUUID:(id)a3;
- (void)setCroppedButNotFilteredImageUUID:(id)a3;
- (void)setCurrentFilter:(signed __int16)a3;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFullImageUUID:(id)a3;
- (void)setImageQuad:(id)a3;
- (void)setMarkupModelData:(id)a3;
- (void)setMeshAnimImageUUID:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setScanDataDelegateIdentifier:(id)a3;
@end

@implementation ICDocCamDocumentInfo

- (ICDocCamDocumentInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamDocumentInfo;
  result = [(ICDocCamDocumentInfo *)&v3 init];
  if (result) {
    result->_currentOrientation = 0;
  }
  return result;
}

- (ICDocCamDocumentInfo)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(ICDocCamDocumentInfo *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (DCScanDataDelegate)scanDataDelegate
{
  objc_super v3 = [(ICDocCamDocumentInfo *)self scanDataDelegateIdentifier];

  if (v3)
  {
    id v4 = [(ICDocCamDocumentInfo *)self delegate];
    v5 = [(ICDocCamDocumentInfo *)self scanDataDelegateIdentifier];
    v6 = [v4 scanDataDelegateWithIdentifier:v5];
  }
  else
  {
    v6 = 0;
  }

  return (DCScanDataDelegate *)v6;
}

- (BOOL)hasFilter
{
  return [(ICDocCamDocumentInfo *)self currentFilter] != 0;
}

- (id)allUUIDs
{
  objc_super v3 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  id v4 = [(ICDocCamDocumentInfo *)self croppedAndFilteredImageUUID];

  if (v4)
  {
    v5 = [(ICDocCamDocumentInfo *)self croppedAndFilteredImageUUID];
    [v3 addObject:v5];
  }
  v6 = [(ICDocCamDocumentInfo *)self croppedButNotFilteredImageUUID];

  if (v6)
  {
    v7 = [(ICDocCamDocumentInfo *)self croppedButNotFilteredImageUUID];
    [v3 addObject:v7];
  }
  v8 = [(ICDocCamDocumentInfo *)self fullImageUUID];

  if (v8)
  {
    v9 = [(ICDocCamDocumentInfo *)self fullImageUUID];
    [v3 addObject:v9];
  }
  v10 = [(ICDocCamDocumentInfo *)self meshAnimImageUUID];

  if (v10)
  {
    v11 = [(ICDocCamDocumentInfo *)self meshAnimImageUUID];
    [v3 addObject:v11];
  }
  v12 = (void *)[v3 copy];

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v3, "appendFormat:", @"\nself: %p\n", self);
  id v4 = [(ICDocCamDocumentInfo *)self imageQuad];
  objc_msgSend(v3, "appendFormat:", @"  imageQuad                      : %p\n", v4);

  v5 = [(ICDocCamDocumentInfo *)self croppedAndFilteredImageUUID];
  [v3 appendFormat:@"  croppedAndFilteredImageUUID    : %@\n", v5];

  v6 = [(ICDocCamDocumentInfo *)self croppedButNotFilteredImageUUID];
  [v3 appendFormat:@"  croppedButNotFilteredImageUUID : %@\n", v6];

  v7 = [(ICDocCamDocumentInfo *)self fullImageUUID];
  [v3 appendFormat:@"  fullImageUUID                  : %@\n", v7];

  v8 = [(ICDocCamDocumentInfo *)self meshAnimImageUUID];
  [v3 appendFormat:@"  meshAnimImageUUID              : %@\n", v8];

  objc_msgSend(v3, "appendFormat:", @"  currentFilter                  : %d\n", -[ICDocCamDocumentInfo currentFilter](self, "currentFilter"));
  objc_msgSend(v3, "appendFormat:", @"  currentOrientation             : %ld\n", -[ICDocCamDocumentInfo currentOrientation](self, "currentOrientation"));
  v9 = [(ICDocCamDocumentInfo *)self scanDataDelegateIdentifier];
  [v3 appendFormat:@"  scanDataDelegateIdentifier     : %@\n", v9];

  v10 = [(ICDocCamDocumentInfo *)self scanDataDelegate];
  objc_msgSend(v3, "appendFormat:", @"  scanDataDelegate               : %p\n", v10);

  BOOL v11 = [(ICDocCamDocumentInfo *)self hasFilter];
  v12 = "NO";
  if (v11) {
    v12 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @"  hasFilter                      : %s\n", v12);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDocCamDocumentInfo)initWithCoder:(id)a3
{
  v19[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICDocCamDocumentInfo;
  v5 = [(ICDocCamDocumentInfo *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:5];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kMetadataFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setMetaData:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kImageQuadFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setImageQuad:v10];

    BOOL v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCroppedAndFilteredImageUUIDFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setCroppedAndFilteredImageUUID:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCroppedButNotFilteredImageUUIDFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setCroppedButNotFilteredImageUUID:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFullImageUUIDFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setFullImageUUID:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMeshAnimImageUUIDFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setMeshAnimImageUUID:v14];

    -[ICDocCamDocumentInfo setCurrentFilter:](v5, "setCurrentFilter:", (__int16)[v4 decodeInt32ForKey:@"kCurrentFilterUUIDFieldCodingKey"]);
    -[ICDocCamDocumentInfo setCurrentOrientation:](v5, "setCurrentOrientation:", [v4 decodeIntegerForKey:@"kCurrentOrientationFieldCodingKey"]);
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kScanDataDelegateIdentifierFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setScanDataDelegateIdentifier:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMarkupModelDataFieldCodingKey"];
    [(ICDocCamDocumentInfo *)v5 setMarkupModelData:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICDocCamDocumentInfo *)self metaData];
  [v4 encodeObject:v5 forKey:@"kMetadataFieldCodingKey"];

  v6 = [(ICDocCamDocumentInfo *)self imageQuad];
  [v4 encodeObject:v6 forKey:@"kImageQuadFieldCodingKey"];

  v7 = [(ICDocCamDocumentInfo *)self croppedAndFilteredImageUUID];
  [v4 encodeObject:v7 forKey:@"kCroppedAndFilteredImageUUIDFieldCodingKey"];

  v8 = [(ICDocCamDocumentInfo *)self croppedButNotFilteredImageUUID];
  [v4 encodeObject:v8 forKey:@"kCroppedButNotFilteredImageUUIDFieldCodingKey"];

  v9 = [(ICDocCamDocumentInfo *)self fullImageUUID];
  [v4 encodeObject:v9 forKey:@"kFullImageUUIDFieldCodingKey"];

  v10 = [(ICDocCamDocumentInfo *)self meshAnimImageUUID];
  [v4 encodeObject:v10 forKey:@"kMeshAnimImageUUIDFieldCodingKey"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[ICDocCamDocumentInfo currentFilter](self, "currentFilter"), @"kCurrentFilterUUIDFieldCodingKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICDocCamDocumentInfo currentOrientation](self, "currentOrientation"), @"kCurrentOrientationFieldCodingKey");
  BOOL v11 = [(ICDocCamDocumentInfo *)self scanDataDelegateIdentifier];
  [v4 encodeObject:v11 forKey:@"kScanDataDelegateIdentifierFieldCodingKey"];

  id v12 = [(ICDocCamDocumentInfo *)self markupModelData];
  [v4 encodeObject:v12 forKey:@"kMarkupModelDataFieldCodingKey"];
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (ICDocCamImageQuad)imageQuad
{
  return self->_imageQuad;
}

- (void)setImageQuad:(id)a3
{
}

- (NSString)croppedAndFilteredImageUUID
{
  return self->_croppedAndFilteredImageUUID;
}

- (void)setCroppedAndFilteredImageUUID:(id)a3
{
}

- (NSString)croppedButNotFilteredImageUUID
{
  return self->_croppedButNotFilteredImageUUID;
}

- (void)setCroppedButNotFilteredImageUUID:(id)a3
{
}

- (NSString)fullImageUUID
{
  return self->_fullImageUUID;
}

- (void)setFullImageUUID:(id)a3
{
}

- (NSString)meshAnimImageUUID
{
  return self->_meshAnimImageUUID;
}

- (void)setMeshAnimImageUUID:(id)a3
{
}

- (signed)currentFilter
{
  return self->_currentFilter;
}

- (void)setCurrentFilter:(signed __int16)a3
{
  self->_currentFilter = a3;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (NSString)scanDataDelegateIdentifier
{
  return self->_scanDataDelegateIdentifier;
}

- (void)setScanDataDelegateIdentifier:(id)a3
{
}

- (NSData)markupModelData
{
  return self->_markupModelData;
}

- (void)setMarkupModelData:(id)a3
{
}

- (ICDocCamViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)constantColor
{
  return self->_constantColor;
}

- (void)setConstantColor:(BOOL)a3
{
  self->_constantColor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_markupModelData, 0);
  objc_storeStrong((id *)&self->_scanDataDelegateIdentifier, 0);
  objc_storeStrong((id *)&self->_meshAnimImageUUID, 0);
  objc_storeStrong((id *)&self->_fullImageUUID, 0);
  objc_storeStrong((id *)&self->_croppedButNotFilteredImageUUID, 0);
  objc_storeStrong((id *)&self->_croppedAndFilteredImageUUID, 0);
  objc_storeStrong((id *)&self->_imageQuad, 0);

  objc_storeStrong((id *)&self->_metaData, 0);
}

@end