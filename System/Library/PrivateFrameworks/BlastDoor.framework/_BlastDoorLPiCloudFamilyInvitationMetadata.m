@interface _BlastDoorLPiCloudFamilyInvitationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)action;
- (NSString)kind;
- (NSString)subtitle;
- (NSString)title;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)image;
- (_BlastDoorLPiCloudFamilyInvitationMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setKind:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BlastDoorLPiCloudFamilyInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiCloudFamilyInvitationMetadata)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPiCloudFamilyInvitationMetadata;
  v5 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)&v20 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"action");
    action = v5->_action;
    v5->_action = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"kind");
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"image");
    image = v5->_image;
    v5->_image = (_BlastDoorLPImage *)v14;

    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", title, @"title");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, @"subtitle");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_action, @"action");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_kind, @"kind");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, @"image");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiCloudFamilyInvitationMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)self title];
    [(_BlastDoorLPiCloudFamilyInvitationMetadata *)v4 setTitle:v5];

    uint64_t v6 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)self subtitle];
    [(_BlastDoorLPiCloudFamilyInvitationMetadata *)v4 setSubtitle:v6];

    v7 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)self action];
    [(_BlastDoorLPiCloudFamilyInvitationMetadata *)v4 setAction:v7];

    uint64_t v8 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)self kind];
    [(_BlastDoorLPiCloudFamilyInvitationMetadata *)v4 setKind:v8];

    v9 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)self image];
    [(_BlastDoorLPiCloudFamilyInvitationMetadata *)v4 setImage:v9];

    uint64_t v10 = [(_BlastDoorLPiCloudFamilyInvitationMetadata *)self icon];
    [(_BlastDoorLPiCloudFamilyInvitationMetadata *)v4 setIcon:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPiCloudFamilyInvitationMetadata;
  if ([(_BlastDoorLPiCloudFamilyInvitationMetadata *)&v14 isEqual:v4])
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
      if (v7 | (unint64_t)self->_title && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[3], v8 | (unint64_t)self->_subtitle) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[4], v9 | (unint64_t)self->_action) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_kind) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_image) && !objc_msgSend((id)v11, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v12 = v6[7];
        if (v12 | (unint64_t)self->_icon) {
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
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_action hash];
  return v4 ^ v5 ^ [(_BlastDoorLPImage *)self->_image hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  NSUInteger v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  NSUInteger v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"icon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", @"action", @"kind", @"image", @"icon", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (_BlastDoorLPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end