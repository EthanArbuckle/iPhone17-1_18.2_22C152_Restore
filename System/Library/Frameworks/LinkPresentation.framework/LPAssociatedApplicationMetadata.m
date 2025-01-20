@interface LPAssociatedApplicationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (LPAssociatedApplicationMetadata)initWithCoder:(id)a3;
- (LPImage)icon;
- (NSString)action;
- (NSString)bundleIdentifier;
- (NSString)caption;
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

@implementation LPAssociatedApplicationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAssociatedApplicationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPAssociatedApplicationMetadata;
  v5 = [(LPAssociatedApplicationMetadata *)&v16 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v8;

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
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_bundleIdentifier, @"bundleIdentifier");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_caption, @"caption");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_action, @"action");
  [v4 encodeInteger:self->_clipAction forKey:@"clipAction"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPAssociatedApplicationMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPAssociatedApplicationMetadata *)self bundleIdentifier];
    [(LPAssociatedApplicationMetadata *)v4 setBundleIdentifier:v5];

    uint64_t v6 = [(LPAssociatedApplicationMetadata *)self icon];
    [(LPAssociatedApplicationMetadata *)v4 setIcon:v6];

    v7 = [(LPAssociatedApplicationMetadata *)self caption];
    [(LPAssociatedApplicationMetadata *)v4 setCaption:v7];

    uint64_t v8 = [(LPAssociatedApplicationMetadata *)self action];
    [(LPAssociatedApplicationMetadata *)v4 setAction:v8];

    [(LPAssociatedApplicationMetadata *)v4 setClipAction:[(LPAssociatedApplicationMetadata *)self clipAction]];
    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAssociatedApplicationMetadata;
  if ([(LPAssociatedApplicationMetadata *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      BOOL v5 = (objectsAreEqual_0(v6[1], self->_bundleIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[2], self->_icon)
        && objectsAreEqual_0(v6[3], self->_caption)
        && objectsAreEqual_0(v6[4], self->_action)
        && v6[5] == (void *)self->_clipAction;
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

- (LPImage)icon
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