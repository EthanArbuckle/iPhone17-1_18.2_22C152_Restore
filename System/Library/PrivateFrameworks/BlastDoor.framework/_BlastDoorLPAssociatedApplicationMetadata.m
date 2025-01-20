@interface _BlastDoorLPAssociatedApplicationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)action;
- (NSString)bundleIdentifier;
- (NSString)caption;
- (_BlastDoorLPAssociatedApplicationMetadata)initWithCoder:(id)a3;
- (_BlastDoorLPImage)icon;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)clipAction;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCaption:(id)a3;
- (void)setClipAction:(int64_t)a3;
- (void)setIcon:(id)a3;
@end

@implementation _BlastDoorLPAssociatedApplicationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAssociatedApplicationMetadata)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPAssociatedApplicationMetadata;
  v5 = [(_BlastDoorLPAssociatedApplicationMetadata *)&v16 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"caption");
    caption = v5->_caption;
    v5->_caption = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"action");
    action = v5->_action;
    v5->_action = (NSString *)v12;

    v5->_clipAction = [v4 decodeIntegerForKey:@"clipAction"];
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", bundleIdentifier, @"bundleIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_caption, @"caption");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_action, @"action");
  [v5 encodeInteger:self->_clipAction forKey:@"clipAction"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPAssociatedApplicationMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPAssociatedApplicationMetadata *)self bundleIdentifier];
    [(_BlastDoorLPAssociatedApplicationMetadata *)v4 setBundleIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPAssociatedApplicationMetadata *)self icon];
    [(_BlastDoorLPAssociatedApplicationMetadata *)v4 setIcon:v6];

    v7 = [(_BlastDoorLPAssociatedApplicationMetadata *)self caption];
    [(_BlastDoorLPAssociatedApplicationMetadata *)v4 setCaption:v7];

    uint64_t v8 = [(_BlastDoorLPAssociatedApplicationMetadata *)self action];
    [(_BlastDoorLPAssociatedApplicationMetadata *)v4 setAction:v8];

    [(_BlastDoorLPAssociatedApplicationMetadata *)v4 setClipAction:[(_BlastDoorLPAssociatedApplicationMetadata *)self clipAction]];
    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPAssociatedApplicationMetadata;
  if ([(_BlastDoorLPAssociatedApplicationMetadata *)&v12 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      BOOL v5 = (!(v7 | (unint64_t)self->_bundleIdentifier) || objc_msgSend((id)v7, "isEqual:"))
        && ((unint64_t v8 = v6[3], !(v8 | (unint64_t)self->_icon)) || objc_msgSend((id)v8, "isEqual:"))
        && ((unint64_t v9 = v6[4], !(v9 | (unint64_t)self->_caption)) || objc_msgSend((id)v9, "isEqual:"))
        && ((unint64_t v10 = v6[5], !(v10 | (unint64_t)self->_action)) || objc_msgSend((id)v10, "isEqual:"))
        && v6[6] == self->_clipAction;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"bundleIdentifier", @"icon", @"caption", @"action", @"clipAction", 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (int64_t)clipAction
{
  return self->_clipAction;
}

- (void)setClipAction:(int64_t)a3
{
  self->_clipAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end