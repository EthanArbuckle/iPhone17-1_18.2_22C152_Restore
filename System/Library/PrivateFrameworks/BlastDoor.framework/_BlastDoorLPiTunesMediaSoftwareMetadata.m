@interface _BlastDoorLPiTunesMediaSoftwareMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMessagesOnlyApp;
- (NSArray)screenshots;
- (NSString)genre;
- (NSString)name;
- (NSString)platform;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSString)subtitle;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)messagesAppIcon;
- (_BlastDoorLPVideo)previewVideo;
- (_BlastDoorLPiTunesMediaSoftwareMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIsMessagesOnlyApp:(BOOL)a3;
- (void)setMessagesAppIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPreviewVideo:(id)a3;
- (void)setScreenshots:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaSoftwareMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaSoftwareMetadata)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_BlastDoorLPiTunesMediaSoftwareMetadata;
  v5 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)&v28 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    v7 = *(void **)&v5->_isMessagesOnlyApp;
    *(void *)&v5->_isMessagesOnlyApp = v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"subtitle");
    name = v5->_name;
    v5->_name = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"genre");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v14;

    uint64_t v16 = decodeStringForKey(v4, @"platform");
    genre = v5->_genre;
    v5->_genre = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    platform = v5->_platform;
    v5->_platform = (NSString *)v18;

    uint64_t v20 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfLPImagesForKey:", @"screenshots");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v20;

    uint64_t v22 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPVideoForKey:", @"previewVideo");
    screenshots = v5->_screenshots;
    v5->_screenshots = (NSArray *)v22;

    *(&v5->super.__dummyPropertyForObservation + 1) = [v4 decodeBoolForKey:@"isMessagesOnlyApp"];
    uint64_t v24 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"messagesAppIcon");
    previewVideo = v5->_previewVideo;
    v5->_previewVideo = (_BlastDoorLPVideo *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_isMessagesOnlyApp;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"storeFrontIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, @"name");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"subtitle");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, @"genre");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_genre, @"platform");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_platform, @"icon");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"screenshots");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_screenshots, @"previewVideo");
  [v5 encodeBool:*((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1) forKey:@"isMessagesOnlyApp"];
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_previewVideo, @"messagesAppIcon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_BlastDoorLPiTunesMediaSoftwareMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self name];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self subtitle];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setSubtitle:v8];

    v9 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self genre];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setGenre:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self platform];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setPlatform:v10];

    v11 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self icon];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setIcon:v11];

    uint64_t v12 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self screenshots];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setScreenshots:v12];

    v13 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self previewVideo];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setPreviewVideo:v13];

    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setIsMessagesOnlyApp:[(_BlastDoorLPiTunesMediaSoftwareMetadata *)self isMessagesOnlyApp]];
    uint64_t v14 = [(_BlastDoorLPiTunesMediaSoftwareMetadata *)self messagesAppIcon];
    [(_BlastDoorLPiTunesMediaSoftwareMetadata *)v4 setMessagesAppIcon:v14];

    v15 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPiTunesMediaSoftwareMetadata;
  if ([(_BlastDoorLPiTunesMediaSoftwareMetadata *)&v18 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | *(void *)&self->_isMessagesOnlyApp && !objc_msgSend((id)v7, "isEqual:")) {
        goto LABEL_26;
      }
      unint64_t v8 = v6[3];
      if (v8 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v8, "isEqual:")) {
        goto LABEL_26;
      }
      if (((unint64_t v9 = v6[4], !(v9 | (unint64_t)self->_storeIdentifier))
         || objc_msgSend((id)v9, "isEqual:"))
        && ((unint64_t v10 = v6[5], !(v10 | (unint64_t)self->_name)) || objc_msgSend((id)v10, "isEqual:"))
        && ((unint64_t v11 = v6[6], !(v11 | (unint64_t)self->_subtitle)) || objc_msgSend((id)v11, "isEqual:"))
        && ((unint64_t v12 = v6[7], !(v12 | (unint64_t)self->_genre)) || objc_msgSend((id)v12, "isEqual:"))
        && ((unint64_t v13 = v6[8], !(v13 | (unint64_t)self->_platform)) || objc_msgSend((id)v13, "isEqual:"))
        && ((unint64_t v14 = v6[9], !(v14 | (unint64_t)self->_icon)) || objc_msgSend((id)v14, "isEqual:"))
        && ((unint64_t v15 = v6[10], !(v15 | (unint64_t)self->_screenshots))
         || objc_msgSend((id)v15, "isEqual:"))
        && *((unsigned __int8 *)v6 + 9) == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1))
      {
        unint64_t v16 = v6[11];
        if (v16 | (unint64_t)self->_previewVideo) {
          char v5 = objc_msgSend((id)v16, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
LABEL_26:
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_storeFrontIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"screenshots");
  (*v3)(v5, @"messagesAppIcon");
  (*v3)(v5, @"previewVideo");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"subtitle", @"genre", @"platform", @"icon", @"screenshots", @"previewVideo", @"isMessagesOnlyApp", @"messagesAppIcon", 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_isMessagesOnlyApp;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_storeIdentifier;
}

- (void)setName:(id)a3
{
}

- (NSString)subtitle
{
  return self->_name;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)genre
{
  return self->_subtitle;
}

- (void)setGenre:(id)a3
{
}

- (NSString)platform
{
  return self->_genre;
}

- (void)setPlatform:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_platform;
}

- (void)setIcon:(id)a3
{
}

- (NSArray)screenshots
{
  return (NSArray *)self->_icon;
}

- (void)setScreenshots:(id)a3
{
}

- (_BlastDoorLPVideo)previewVideo
{
  return (_BlastDoorLPVideo *)self->_screenshots;
}

- (void)setPreviewVideo:(id)a3
{
}

- (BOOL)isMessagesOnlyApp
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setIsMessagesOnlyApp:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (_BlastDoorLPImage)messagesAppIcon
{
  return (_BlastDoorLPImage *)self->_previewVideo;
}

- (void)setMessagesAppIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewVideo, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_isMessagesOnlyApp, 0);
}

@end