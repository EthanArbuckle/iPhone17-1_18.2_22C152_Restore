@interface _PHPickerResultMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsItemProviderOpenInPlace;
- (BOOL)isEqual:(id)a3;
- (CGRect)acceptableCropRect;
- (CGRect)normalizedFaceAreaRect;
- (CGRect)preferredCropRect;
- (NSDictionary)filePromiseURLs;
- (NSDictionary)sandboxExtensionTokens;
- (NSOrderedSet)typeIdentifiers;
- (NSString)suggestedName;
- (_PHPickerResultMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptableCropRect:(CGRect)a3;
- (void)setAllowsItemProviderOpenInPlace:(BOOL)a3;
- (void)setFilePromiseURLs:(id)a3;
- (void)setNormalizedFaceAreaRect:(CGRect)a3;
- (void)setPixelHeight:(unint64_t)a3;
- (void)setPixelWidth:(unint64_t)a3;
- (void)setPreferredCropRect:(CGRect)a3;
- (void)setSandboxExtensionTokens:(id)a3;
- (void)setSuggestedName:(id)a3;
- (void)setTypeIdentifiers:(id)a3;
@end

@implementation _PHPickerResultMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionTokens, 0);
  objc_storeStrong((id *)&self->_filePromiseURLs, 0);
  objc_storeStrong((id *)&self->_typeIdentifiers, 0);

  objc_storeStrong((id *)&self->_suggestedName, 0);
}

- (void)setSandboxExtensionTokens:(id)a3
{
}

- (NSDictionary)sandboxExtensionTokens
{
  return self->_sandboxExtensionTokens;
}

- (void)setFilePromiseURLs:(id)a3
{
}

- (NSDictionary)filePromiseURLs
{
  return self->_filePromiseURLs;
}

- (void)setTypeIdentifiers:(id)a3
{
}

- (NSOrderedSet)typeIdentifiers
{
  return self->_typeIdentifiers;
}

- (void)setSuggestedName:(id)a3
{
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setAllowsItemProviderOpenInPlace:(BOOL)a3
{
  self->_allowsItemProviderOpenInPlace = a3;
}

- (BOOL)allowsItemProviderOpenInPlace
{
  return self->_allowsItemProviderOpenInPlace;
}

- (void)setNormalizedFaceAreaRect:(CGRect)a3
{
  self->_normalizedFaceAreaRect = a3;
}

- (CGRect)normalizedFaceAreaRect
{
  double x = self->_normalizedFaceAreaRect.origin.x;
  double y = self->_normalizedFaceAreaRect.origin.y;
  double width = self->_normalizedFaceAreaRect.size.width;
  double height = self->_normalizedFaceAreaRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

- (CGRect)acceptableCropRect
{
  double x = self->_acceptableCropRect.origin.x;
  double y = self->_acceptableCropRect.origin.y;
  double width = self->_acceptableCropRect.size.width;
  double height = self->_acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (CGRect)preferredCropRect
{
  double x = self->_preferredCropRect.origin.x;
  double y = self->_preferredCropRect.origin.y;
  double width = self->_preferredCropRect.size.width;
  double height = self->_preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPixelHeight:(unint64_t)a3
{
  self->_pixelHeight = a3;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (void)setPixelWidth:(unint64_t)a3
{
  self->_pixelWidth = a3;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t pixelWidth = self->_pixelWidth;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedInteger:pixelWidth];
  [v8 encodeObject:v6 forKey:@"PHPickerResultMetadataPixelWidthKey"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_pixelHeight];
  [v8 encodeObject:v7 forKey:@"PHPickerResultMetadataPixelHeightKey"];

  objc_msgSend(v8, "encodeCGRect:forKey:", @"PHPickerResultMetadataPreferredCropRectKey", self->_preferredCropRect.origin.x, self->_preferredCropRect.origin.y, self->_preferredCropRect.size.width, self->_preferredCropRect.size.height);
  objc_msgSend(v8, "encodeCGRect:forKey:", @"PHPickerResultMetadataAcceptableCropRectKey", self->_acceptableCropRect.origin.x, self->_acceptableCropRect.origin.y, self->_acceptableCropRect.size.width, self->_acceptableCropRect.size.height);
  objc_msgSend(v8, "encodeCGRect:forKey:", @"PHPickerResultMetadataNormalizedFaceAreaRectKey", self->_normalizedFaceAreaRect.origin.x, self->_normalizedFaceAreaRect.origin.y, self->_normalizedFaceAreaRect.size.width, self->_normalizedFaceAreaRect.size.height);
  [v8 encodeBool:self->_allowsItemProviderOpenInPlace forKey:@"PHPickerResultMetadataAllowsItemProviderOpenInPlaceKey"];
  [v8 encodeObject:self->_suggestedName forKey:@"PHPickerResultMetadataSuggestedNameKey"];
  [v8 encodeObject:self->_typeIdentifiers forKey:@"PHPickerResultMetadataTypeIdentifiersKey"];
  [v8 encodeObject:self->_filePromiseURLs forKey:@"PHPickerResultMetadataFilePromiseURLsKey"];
  [v8 encodeObject:self->_sandboxExtensionTokens forKey:@"PHPickerResultMetadataSandboxExtensionTokensKey"];
}

- (_PHPickerResultMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_PHPickerResultMetadata;
  v5 = [(_PHPickerResultMetadata *)&v34 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerResultMetadataPixelWidthKey"];
    v5->_unint64_t pixelWidth = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerResultMetadataPixelHeightKey"];
    v5->_pixelHeight = [v7 unsignedIntegerValue];

    [v4 decodeCGRectForKey:@"PHPickerResultMetadataPreferredCropRectKey"];
    v5->_preferredCropRect.origin.double x = v8;
    v5->_preferredCropRect.origin.double y = v9;
    v5->_preferredCropRect.size.double width = v10;
    v5->_preferredCropRect.size.double height = v11;
    [v4 decodeCGRectForKey:@"PHPickerResultMetadataAcceptableCropRectKey"];
    v5->_acceptableCropRect.origin.double x = v12;
    v5->_acceptableCropRect.origin.double y = v13;
    v5->_acceptableCropRect.size.double width = v14;
    v5->_acceptableCropRect.size.double height = v15;
    [v4 decodeCGRectForKey:@"PHPickerResultMetadataNormalizedFaceAreaRectKey"];
    v5->_normalizedFaceAreaRect.origin.double x = v16;
    v5->_normalizedFaceAreaRect.origin.double y = v17;
    v5->_normalizedFaceAreaRect.size.double width = v18;
    v5->_normalizedFaceAreaRect.size.double height = v19;
    v5->_allowsItemProviderOpenInPlace = [v4 decodeBoolForKey:@"PHPickerResultMetadataAllowsItemProviderOpenInPlaceKey"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerResultMetadataSuggestedNameKey"];
    suggestedName = v5->_suggestedName;
    v5->_suggestedName = (NSString *)v20;

    v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"PHPickerResultMetadataTypeIdentifiersKey"];
    typeIdentifiers = v5->_typeIdentifiers;
    v5->_typeIdentifiers = (NSOrderedSet *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v28 = [v4 decodeDictionaryWithKeysOfClass:v27 objectsOfClass:objc_opt_class() forKey:@"PHPickerResultMetadataFilePromiseURLsKey"];
    filePromiseURLs = v5->_filePromiseURLs;
    v5->_filePromiseURLs = (NSDictionary *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v31 = [v4 decodeDictionaryWithKeysOfClass:v30 objectsOfClass:objc_opt_class() forKey:@"PHPickerResultMetadataSandboxExtensionTokensKey"];
    sandboxExtensionTokens = v5->_sandboxExtensionTokens;
    v5->_sandboxExtensionTokens = (NSDictionary *)v31;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_PHPickerResultMetadata);
  v4->_unint64_t pixelWidth = self->_pixelWidth;
  v4->_pixelHeight = self->_pixelHeight;
  CGSize size = self->_preferredCropRect.size;
  v4->_preferredCropRect.origin = self->_preferredCropRect.origin;
  v4->_preferredCropRect.CGSize size = size;
  CGSize v6 = self->_acceptableCropRect.size;
  v4->_acceptableCropRect.origin = self->_acceptableCropRect.origin;
  v4->_acceptableCropRect.CGSize size = v6;
  CGSize v7 = self->_normalizedFaceAreaRect.size;
  v4->_normalizedFaceAreaRect.origin = self->_normalizedFaceAreaRect.origin;
  v4->_normalizedFaceAreaRect.CGSize size = v7;
  v4->_allowsItemProviderOpenInPlace = self->_allowsItemProviderOpenInPlace;
  uint64_t v8 = [(NSString *)self->_suggestedName copy];
  suggestedName = v4->_suggestedName;
  v4->_suggestedName = (NSString *)v8;

  uint64_t v10 = [(NSOrderedSet *)self->_typeIdentifiers copy];
  typeIdentifiers = v4->_typeIdentifiers;
  v4->_typeIdentifiers = (NSOrderedSet *)v10;

  uint64_t v12 = [(NSDictionary *)self->_filePromiseURLs copy];
  filePromiseURLs = v4->_filePromiseURLs;
  v4->_filePromiseURLs = (NSDictionary *)v12;

  uint64_t v14 = [(NSDictionary *)self->_sandboxExtensionTokens copy];
  sandboxExtensionTokens = v4->_sandboxExtensionTokens;
  v4->_sandboxExtensionTokens = (NSDictionary *)v14;

  return v4;
}

- (unint64_t)hash
{
  double width = self->_preferredCropRect.size.width;
  if (width == 0.0
    || (double height = self->_preferredCropRect.size.height, height == 0.0)
    || (height == *(double *)(MEMORY[0x263F5D550] + 8) ? (BOOL v5 = width == *MEMORY[0x263F5D550]) : (BOOL v5 = 0), v5))
  {
    double v6 = 0.0;
  }
  else
  {
    double v6 = width * height;
  }
  double v7 = self->_acceptableCropRect.size.width;
  if (v7 == 0.0
    || (double v8 = self->_acceptableCropRect.size.height, v8 == 0.0)
    || (v8 == *(double *)(MEMORY[0x263F5D550] + 8) ? (BOOL v9 = v7 == *MEMORY[0x263F5D550]) : (BOOL v9 = 0), v9))
  {
    double v10 = 0.0;
  }
  else
  {
    double v10 = v7 * v8;
  }
  double v11 = self->_normalizedFaceAreaRect.size.width;
  if (v11 == 0.0
    || (double v12 = self->_normalizedFaceAreaRect.size.height, v12 == 0.0)
    || (v12 == *(double *)(MEMORY[0x263F5D550] + 8) ? (BOOL v13 = v11 == *MEMORY[0x263F5D550]) : (BOOL v13 = 0), v13))
  {
    double v14 = 0.0;
  }
  else
  {
    double v14 = v11 * v12;
  }
  unint64_t v15 = self->_pixelHeight - self->_pixelWidth + 32 * self->_pixelWidth;
  unint64_t v16 = vcvtmd_u64_f64(v6) - v15 + 32 * v15;
  unint64_t v17 = vcvtmd_u64_f64(v10) - v16 + 32 * v16;
  unint64_t v18 = vcvtmd_u64_f64(v14) - v17 + 32 * v17;
  uint64_t v19 = self->_allowsItemProviderOpenInPlace - v18 + 32 * v18;
  NSUInteger v20 = [(NSString *)self->_suggestedName hash] - v19 + 32 * v19;
  uint64_t v21 = [(NSOrderedSet *)self->_typeIdentifiers hash] - v20 + 32 * v20;
  uint64_t v22 = [(NSDictionary *)self->_filePromiseURLs hash] - v21 + 32 * v21;
  return [(NSDictionary *)self->_sandboxExtensionTokens hash] - v22 + 32 * v22 + 0x2E97294E4B2C1;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5 = (_PHPickerResultMetadata *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = v5;
      double v7 = (objc_class *)objc_opt_class();
      if (v6)
      {
        if (objc_opt_isKindOfClass())
        {
          if (self->_pixelWidth != v6->_pixelWidth
            || self->_pixelHeight != v6->_pixelHeight
            || vabdd_f64(self->_preferredCropRect.origin.x, v6->_preferredCropRect.origin.x) > 0.00000999999975
            || vabdd_f64(self->_preferredCropRect.origin.y, v6->_preferredCropRect.origin.y) > 0.00000999999975
            || vabdd_f64(self->_preferredCropRect.size.width, v6->_preferredCropRect.size.width) > 0.00000999999975
            || vabdd_f64(self->_preferredCropRect.size.height, v6->_preferredCropRect.size.height) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.origin.x, v6->_acceptableCropRect.origin.x) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.origin.y, v6->_acceptableCropRect.origin.y) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.size.width, v6->_acceptableCropRect.size.width) > 0.00000999999975
            || vabdd_f64(self->_acceptableCropRect.size.height, v6->_acceptableCropRect.size.height) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.origin.x, v6->_normalizedFaceAreaRect.origin.x) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.origin.y, v6->_normalizedFaceAreaRect.origin.y) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.size.width, v6->_normalizedFaceAreaRect.size.width) > 0.00000999999975
            || vabdd_f64(self->_normalizedFaceAreaRect.size.height, v6->_normalizedFaceAreaRect.size.height) > 0.00000999999975
            || self->_allowsItemProviderOpenInPlace != v6->_allowsItemProviderOpenInPlace)
          {
            goto LABEL_35;
          }
          suggestedName = self->_suggestedName;
          double v8 = v6->_suggestedName;
          if (suggestedName != v8)
          {
            BOOL v9 = v8;
            double v10 = suggestedName;
            int v11 = [(NSString *)v10 isEqual:v9];

            if (!v11) {
              goto LABEL_35;
            }
LABEL_29:
            typeIdentifiers = self->_typeIdentifiers;
            unint64_t v16 = v6->_typeIdentifiers;
            if (typeIdentifiers == v16)
            {
            }
            else
            {
              unint64_t v17 = v16;
              unint64_t v18 = typeIdentifiers;
              int v19 = [(NSOrderedSet *)v18 isEqual:v17];

              if (!v19) {
                goto LABEL_35;
              }
            }
            filePromiseURLs = self->_filePromiseURLs;
            uint64_t v21 = v6->_filePromiseURLs;
            if (filePromiseURLs == v21)
            {
            }
            else
            {
              uint64_t v22 = v21;
              uint64_t v23 = filePromiseURLs;
              int v24 = [(NSDictionary *)v23 isEqual:v22];

              if (!v24)
              {
LABEL_35:
                char v12 = 0;
LABEL_36:

                goto LABEL_37;
              }
            }
            sandboxExtensionTokens = self->_sandboxExtensionTokens;
            uint64_t v27 = v6->_sandboxExtensionTokens;
            uint64_t v28 = sandboxExtensionTokens;
            v29 = v28;
            if (v28 == v27) {
              char v12 = 1;
            }
            else {
              char v12 = [(NSDictionary *)v28 isEqual:v27];
            }

            goto LABEL_36;
          }
LABEL_28:

          goto LABEL_29;
        }
        BOOL v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        BOOL v5 = (_PHPickerResultMetadata *)objc_claimAutoreleasedReturnValue();
        double v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromClass(v7);
        objc_claimAutoreleasedReturnValue();
      }
      _PFAssertFailHandler();
      goto LABEL_28;
    }
    char v12 = 0;
  }
LABEL_37:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end