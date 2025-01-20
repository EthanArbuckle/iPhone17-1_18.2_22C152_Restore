@interface AXMVisionFeatureAssetMetadata
+ (BOOL)supportsSecureCoding;
+ (id)assetMetadataFromURL:(id)a3;
+ (id)assetMetadataFromURL:(id)a3 localIdentifier:(id)a4 photoLibraryURL:(id)a5;
+ (id)assetMetadataWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 creationDate:(id)a5 UTI:(id)a6;
- (AXMVisionFeatureAssetMetadata)initWithCoder:(id)a3;
- (BOOL)imageAssetLocallyAvailable;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)EXIFUserComment;
- (NSString)IPTCCaptionAbstract;
- (NSString)PNGImageDescription;
- (NSString)TIFFImageDescription;
- (NSString)imageAssetLocalIdentifier;
- (NSString)localizedTypeDescription;
- (NSString)name;
- (NSString)uti;
- (NSURL)assetURL;
- (NSURL)imageAssetPhotoLibraryURL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setEXIFUserComment:(id)a3;
- (void)setIPTCCaptionAbstract:(id)a3;
- (void)setImageAssetLocalIdentifier:(id)a3;
- (void)setImageAssetLocallyAvailable:(BOOL)a3;
- (void)setImageAssetPhotoLibraryURL:(id)a3;
- (void)setLocalizedTypeDescription:(id)a3;
- (void)setName:(id)a3;
- (void)setPNGImageDescription:(id)a3;
- (void)setTIFFImageDescription:(id)a3;
- (void)setUti:(id)a3;
@end

@implementation AXMVisionFeatureAssetMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureAssetMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXMVisionFeatureAssetMetadata;
  v5 = [(AXMVisionFeatureAssetMetadata *)&v18 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyAssetURL];
    [(AXMVisionFeatureAssetMetadata *)v5 setAssetURL:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyName];
    [(AXMVisionFeatureAssetMetadata *)v5 setName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyCreationDate];
    [(AXMVisionFeatureAssetMetadata *)v5 setCreationDate:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyUTI];
    [(AXMVisionFeatureAssetMetadata *)v5 setUti:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyLocalizedTypeDescription];
    [(AXMVisionFeatureAssetMetadata *)v5 setLocalizedTypeDescription:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyTIFFImageDescription];
    [(AXMVisionFeatureAssetMetadata *)v5 setTIFFImageDescription:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyIPTCCaptionAbstract];
    [(AXMVisionFeatureAssetMetadata *)v5 setIPTCCaptionAbstract:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyEXIFUserComment];
    [(AXMVisionFeatureAssetMetadata *)v5 setEXIFUserComment:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyPNGImageDescription];
    [(AXMVisionFeatureAssetMetadata *)v5 setPNGImageDescription:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingKeyLocalIdentifier];
    [(AXMVisionFeatureAssetMetadata *)v5 setImageAssetLocalIdentifier:v15];

    -[AXMVisionFeatureAssetMetadata setImageAssetLocallyAvailable:](v5, "setImageAssetLocallyAvailable:", [v4 decodeBoolForKey:AXMVisionFeatureAssetMetadataCodingKeyAssetLocallyAvailableIdentifier]);
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureAssetMetadataCodingkeyPhotoLibraryURL];
    [(AXMVisionFeatureAssetMetadata *)v5 setImageAssetPhotoLibraryURL:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMVisionFeatureAssetMetadata *)self assetURL];
  [v4 encodeObject:v5 forKey:AXMVisionFeatureAssetMetadataCodingKeyAssetURL];

  v6 = [(AXMVisionFeatureAssetMetadata *)self name];
  [v4 encodeObject:v6 forKey:AXMVisionFeatureAssetMetadataCodingKeyName];

  v7 = [(AXMVisionFeatureAssetMetadata *)self creationDate];
  [v4 encodeObject:v7 forKey:AXMVisionFeatureAssetMetadataCodingKeyCreationDate];

  v8 = [(AXMVisionFeatureAssetMetadata *)self uti];
  [v4 encodeObject:v8 forKey:AXMVisionFeatureAssetMetadataCodingKeyUTI];

  v9 = [(AXMVisionFeatureAssetMetadata *)self localizedTypeDescription];
  [v4 encodeObject:v9 forKey:AXMVisionFeatureAssetMetadataCodingKeyLocalizedTypeDescription];

  v10 = [(AXMVisionFeatureAssetMetadata *)self TIFFImageDescription];
  [v4 encodeObject:v10 forKey:AXMVisionFeatureAssetMetadataCodingKeyTIFFImageDescription];

  v11 = [(AXMVisionFeatureAssetMetadata *)self IPTCCaptionAbstract];
  [v4 encodeObject:v11 forKey:AXMVisionFeatureAssetMetadataCodingKeyIPTCCaptionAbstract];

  v12 = [(AXMVisionFeatureAssetMetadata *)self EXIFUserComment];
  [v4 encodeObject:v12 forKey:AXMVisionFeatureAssetMetadataCodingKeyEXIFUserComment];

  v13 = [(AXMVisionFeatureAssetMetadata *)self PNGImageDescription];
  [v4 encodeObject:v13 forKey:AXMVisionFeatureAssetMetadataCodingKeyPNGImageDescription];

  v14 = [(AXMVisionFeatureAssetMetadata *)self imageAssetLocalIdentifier];
  [v4 encodeObject:v14 forKey:AXMVisionFeatureAssetMetadataCodingKeyLocalIdentifier];

  BOOL v15 = [(AXMVisionFeatureAssetMetadata *)self imageAssetLocallyAvailable];
  [v4 encodeBool:v15 forKey:AXMVisionFeatureAssetMetadataCodingKeyAssetLocallyAvailableIdentifier];
  id v16 = [(AXMVisionFeatureAssetMetadata *)self imageAssetPhotoLibraryURL];
  [v4 encodeObject:v16 forKey:AXMVisionFeatureAssetMetadataCodingkeyPhotoLibraryURL];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXMVisionFeatureAssetMetadata *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(AXMVisionFeatureAssetMetadata *)self localIdentifier];
      v7 = [(AXMVisionFeatureAssetMetadata *)v5 localIdentifier];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        char v9 = 1;
      }
      else
      {
        v10 = [(AXMVisionFeatureAssetMetadata *)self url];
        v11 = [(AXMVisionFeatureAssetMetadata *)v5 url];
        char v9 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(AXMVisionFeatureAssetMetadata *)self url];
  uint64_t v4 = [v3 hash];
  v5 = [(AXMVisionFeatureAssetMetadata *)self localIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(AXMVisionFeatureAssetMetadata *)self name];
  v5 = [(AXMVisionFeatureAssetMetadata *)self creationDate];
  unint64_t v6 = [(AXMVisionFeatureAssetMetadata *)self uti];
  v7 = [(AXMVisionFeatureAssetMetadata *)self localizedTypeDescription];
  char v8 = [(AXMVisionFeatureAssetMetadata *)self imageAssetLocalIdentifier];
  BOOL v9 = [(AXMVisionFeatureAssetMetadata *)self imageAssetLocallyAvailable];
  v10 = [(AXMVisionFeatureAssetMetadata *)self imageAssetPhotoLibraryURL];
  v11 = [v3 stringWithFormat:@"name:%@ created:%@ UTI:%@ typeDesc:%@ assetLocalIdentifier:%@ isAssetLocallyAvailable:%d photoLibraryURL:%@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

+ (id)assetMetadataFromURL:(id)a3
{
  v32[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(AXMVisionFeatureAssetMetadata);
  [(AXMVisionFeatureAssetMetadata *)v4 setAssetURL:v3];
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F1C6E8];
    uint64_t v6 = *MEMORY[0x1E4F1C540];
    v32[0] = *MEMORY[0x1E4F1C6E8];
    v32[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1C728];
    uint64_t v8 = *MEMORY[0x1E4F1C6D0];
    v32[2] = *MEMORY[0x1E4F1C728];
    v32[3] = v8;
    v32[4] = *MEMORY[0x1E4F1C5C0];
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
    id v31 = 0;
    v10 = [v3 resourceValuesForKeys:v9 error:&v31];
    id v11 = v31;
    if (v11)
    {
      v12 = AXMediaLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v11, v12);
      }
    }
    v13 = [v10 objectForKeyedSubscript:v5];
    [(AXMVisionFeatureAssetMetadata *)v4 setName:v13];

    v14 = [v10 objectForKeyedSubscript:v6];
    [(AXMVisionFeatureAssetMetadata *)v4 setCreationDate:v14];

    BOOL v15 = [v10 objectForKeyedSubscript:v7];
    [(AXMVisionFeatureAssetMetadata *)v4 setUti:v15];

    id v16 = [v10 objectForKeyedSubscript:v8];
    [(AXMVisionFeatureAssetMetadata *)v4 setLocalizedTypeDescription:v16];

    v17 = CGImageSourceCreateWithURL((CFURLRef)v3, 0);
    if (v17)
    {
      objc_super v18 = v17;
      CFDictionaryRef v19 = CGImageSourceCopyPropertiesAtIndex(v17, 0, 0);
      v30 = [(__CFDictionary *)v19 objectForKey:*MEMORY[0x1E4F2FD40]];
      v20 = [v30 objectForKey:*MEMORY[0x1E4F2FD58]];
      [(AXMVisionFeatureAssetMetadata *)v4 setTIFFImageDescription:v20];

      v29 = [(__CFDictionary *)v19 objectForKey:*MEMORY[0x1E4F2FB80]];
      v21 = [v29 objectForKey:*MEMORY[0x1E4F2FB58]];
      [(AXMVisionFeatureAssetMetadata *)v4 setIPTCCaptionAbstract:v21];

      v22 = [(__CFDictionary *)v19 objectForKey:*MEMORY[0x1E4F2F800]];
      [v22 objectForKey:*MEMORY[0x1E4F2F958]];
      v24 = v23 = v9;
      [(AXMVisionFeatureAssetMetadata *)v4 setEXIFUserComment:v24];

      v25 = [(__CFDictionary *)v19 objectForKey:*MEMORY[0x1E4F2FCD8]];
      [v25 objectForKey:*MEMORY[0x1E4F2FCC8]];
      v27 = id v26 = v11;
      [(AXMVisionFeatureAssetMetadata *)v4 setPNGImageDescription:v27];

      id v11 = v26;
      CFRelease(v18);

      BOOL v9 = v23;
    }
  }

  return v4;
}

+ (id)assetMetadataFromURL:(id)a3 localIdentifier:(id)a4 photoLibraryURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 assetMetadataFromURL:a3];
  [v10 setImageAssetLocalIdentifier:v9];

  [v10 setImageAssetLocallyAvailable:0];
  [v10 setImageAssetPhotoLibraryURL:v8];

  return v10;
}

+ (id)assetMetadataWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 creationDate:(id)a5 UTI:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  v13 = objc_alloc_init(AXMVisionFeatureAssetMetadata);
  [(AXMVisionFeatureAssetMetadata *)v13 setImageAssetLocalIdentifier:v12];

  [(AXMVisionFeatureAssetMetadata *)v13 setImageAssetLocallyAvailable:1];
  if (v12)
  {
    [(AXMVisionFeatureAssetMetadata *)v13 setCreationDate:v10];
    [(AXMVisionFeatureAssetMetadata *)v13 setUti:v11];
    [(AXMVisionFeatureAssetMetadata *)v13 setImageAssetPhotoLibraryURL:v9];
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSString)localizedTypeDescription
{
  return self->_localizedTypeDescription;
}

- (void)setLocalizedTypeDescription:(id)a3
{
}

- (NSString)TIFFImageDescription
{
  return self->_TIFFImageDescription;
}

- (void)setTIFFImageDescription:(id)a3
{
}

- (NSString)IPTCCaptionAbstract
{
  return self->_IPTCCaptionAbstract;
}

- (void)setIPTCCaptionAbstract:(id)a3
{
}

- (NSString)EXIFUserComment
{
  return self->_EXIFUserComment;
}

- (void)setEXIFUserComment:(id)a3
{
}

- (NSString)PNGImageDescription
{
  return self->_PNGImageDescription;
}

- (void)setPNGImageDescription:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (NSString)imageAssetLocalIdentifier
{
  return self->_imageAssetLocalIdentifier;
}

- (void)setImageAssetLocalIdentifier:(id)a3
{
}

- (BOOL)imageAssetLocallyAvailable
{
  return self->_imageAssetLocallyAvailable;
}

- (void)setImageAssetLocallyAvailable:(BOOL)a3
{
  self->_imageAssetLocallyAvailable = a3;
}

- (NSURL)imageAssetPhotoLibraryURL
{
  return self->_imageAssetPhotoLibraryURL;
}

- (void)setImageAssetPhotoLibraryURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAssetPhotoLibraryURL, 0);
  objc_storeStrong((id *)&self->_imageAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_PNGImageDescription, 0);
  objc_storeStrong((id *)&self->_EXIFUserComment, 0);
  objc_storeStrong((id *)&self->_IPTCCaptionAbstract, 0);
  objc_storeStrong((id *)&self->_TIFFImageDescription, 0);
  objc_storeStrong((id *)&self->_localizedTypeDescription, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end