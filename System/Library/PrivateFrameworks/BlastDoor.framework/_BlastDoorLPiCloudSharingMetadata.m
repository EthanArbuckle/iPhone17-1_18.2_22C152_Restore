@interface _BlastDoorLPiCloudSharingMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)encodedTokens;
- (NSString)application;
- (NSString)applicationBundleIdenfier;
- (NSString)kind;
- (NSString)title;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)thumbnail;
- (_BlastDoorLPiCloudSharingMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shareURLForHandle:(id)a3;
- (id)tokenDataForHandle:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication:(id)a3;
- (void)setApplicationBundleIdenfier:(id)a3;
- (void)setEncodedTokens:(id)a3;
- (void)setIcon:(id)a3;
- (void)setKind:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTokenData:(id)a3 handle:(id)a4 url:(id)a5;
@end

@implementation _BlastDoorLPiCloudSharingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiCloudSharingMetadata)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_BlastDoorLPiCloudSharingMetadata;
  v5 = [(_BlastDoorLPiCloudSharingMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"application");
    application = v5->_application;
    v5->_application = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"kind");
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"thumbnail");
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (_BlastDoorLPImage *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v4, "_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v16, objc_opt_class(), @"encodedTokens");
    encodedTokens = v5->_encodedTokens;
    v5->_encodedTokens = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  application = self->_application;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", application, @"application");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_kind, @"kind");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, @"thumbnail");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_encodedTokens, @"encodedTokens");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiCloudSharingMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiCloudSharingMetadata *)self application];
    [(_BlastDoorLPiCloudSharingMetadata *)v4 setApplication:v5];

    uint64_t v6 = [(_BlastDoorLPiCloudSharingMetadata *)self kind];
    [(_BlastDoorLPiCloudSharingMetadata *)v4 setKind:v6];

    v7 = [(_BlastDoorLPiCloudSharingMetadata *)self title];
    [(_BlastDoorLPiCloudSharingMetadata *)v4 setTitle:v7];

    uint64_t v8 = [(_BlastDoorLPiCloudSharingMetadata *)self icon];
    [(_BlastDoorLPiCloudSharingMetadata *)v4 setIcon:v8];

    v9 = [(_BlastDoorLPiCloudSharingMetadata *)self thumbnail];
    [(_BlastDoorLPiCloudSharingMetadata *)v4 setThumbnail:v9];

    uint64_t v10 = [(_BlastDoorLPiCloudSharingMetadata *)self encodedTokens];
    [(_BlastDoorLPiCloudSharingMetadata *)v4 setEncodedTokens:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPiCloudSharingMetadata;
  if ([(_BlastDoorLPiCloudSharingMetadata *)&v14 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[3];
      if (v7 | (unint64_t)self->_application && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[4], v8 | (unint64_t)self->_kind) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[5], v9 | (unint64_t)self->_title) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[6], v10 | (unint64_t)self->_icon) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[7], v11 | (unint64_t)self->_thumbnail) && !objc_msgSend((id)v11, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v12 = v6[8];
        if (v12 | (unint64_t)self->_encodedTokens) {
          char v5 = objc_msgSend((id)v12, "isEqual:");
        }
        else {
          char v5 = 1;
        }
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
  return [(NSString *)self->_title hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"thumbnail");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"application", @"kind", @"title", @"icon", @"thumbnail", @"encodedTokens", 0);
}

- (void)setTokenData:(id)a3 handle:(id)a4 url:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_encodedTokens)
  {
    unint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    encodedTokens = self->_encodedTokens;
    self->_encodedTokens = v10;
  }
  unint64_t v12 = [[_BlastDoorCKDeviceToDeviceShareInvitationToken alloc] initWithSharingInvitationData:v13 shareURL:v9];
  [(NSDictionary *)self->_encodedTokens setObject:v12 forKeyedSubscript:v8];
}

- (id)tokenDataForHandle:(id)a3
{
  v3 = [(NSDictionary *)self->_encodedTokens objectForKeyedSubscript:a3];
  id v4 = [v3 sharingInvitationData];

  return v4;
}

- (id)shareURLForHandle:(id)a3
{
  v3 = [(NSDictionary *)self->_encodedTokens objectForKeyedSubscript:a3];
  id v4 = [v3 shareURL];

  return v4;
}

- (NSString)applicationBundleIdenfier
{
  return self->_applicationBundleIdenfier;
}

- (void)setApplicationBundleIdenfier:(id)a3
{
}

- (NSString)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (_BlastDoorLPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (NSDictionary)encodedTokens
{
  return self->_encodedTokens;
}

- (void)setEncodedTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTokens, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdenfier, 0);
}

@end