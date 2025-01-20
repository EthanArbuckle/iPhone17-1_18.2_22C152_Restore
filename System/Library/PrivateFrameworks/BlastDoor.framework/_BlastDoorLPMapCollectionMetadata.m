@interface _BlastDoorLPMapCollectionMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSArray)addresses;
- (NSString)name;
- (NSString)publisherName;
- (_BlastDoorLPImage)darkImage;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)image;
- (_BlastDoorLPImage)publisherIcon;
- (_BlastDoorLPMapCollectionMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)numberOfItems;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setDarkImage:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfItems:(unsigned int)a3;
- (void)setPublisherIcon:(id)a3;
- (void)setPublisherName:(id)a3;
@end

@implementation _BlastDoorLPMapCollectionMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPMapCollectionMetadata)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_BlastDoorLPMapCollectionMetadata;
  v5 = [(_BlastDoorLPMapCollectionMetadata *)&v26 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    v7 = *(void **)&v5->_numberOfItems;
    *(void *)&v5->_numberOfItems = v6;

    v8 = decodeNumberForKey(v4, @"numberOfItems");
    *((_DWORD *)&v5->super.__dummyPropertyForObservation + 1) = [v8 unsignedIntValue];

    uint64_t v9 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    name = v5->_name;
    v5->_name = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"image");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v11;

    uint64_t v13 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"darkImage");
    image = v5->_image;
    v5->_image = (_BlastDoorLPImage *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v17, @"addresses");
    darkImage = v5->_darkImage;
    v5->_darkImage = (_BlastDoorLPImage *)v18;

    uint64_t v20 = decodeStringForKey(v4, @"publisherName");
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v20;

    uint64_t v22 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"publisherIcon");
    publisherName = v5->_publisherName;
    v5->_publisherName = (NSString *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_numberOfItems;
  id v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"name");
  v5 = [NSNumber numberWithUnsignedInt:*((unsigned int *)&self->super.__dummyPropertyForObservation + 1)];
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, @"numberOfItems");

  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"icon");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"image");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, @"darkImage");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_darkImage, @"addresses");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_addresses, @"publisherName");
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_publisherName, @"publisherIcon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_BlastDoorLPMapCollectionMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPMapCollectionMetadata *)self name];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setName:v5];

    [(_BlastDoorLPMapCollectionMetadata *)v4 setNumberOfItems:[(_BlastDoorLPMapCollectionMetadata *)self numberOfItems]];
    id v6 = [(_BlastDoorLPMapCollectionMetadata *)self icon];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setIcon:v6];

    v7 = [(_BlastDoorLPMapCollectionMetadata *)self image];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setImage:v7];

    v8 = [(_BlastDoorLPMapCollectionMetadata *)self darkImage];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setDarkImage:v8];

    uint64_t v9 = [(_BlastDoorLPMapCollectionMetadata *)self addresses];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setAddresses:v9];

    v10 = [(_BlastDoorLPMapCollectionMetadata *)self publisherName];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setPublisherName:v10];

    uint64_t v11 = [(_BlastDoorLPMapCollectionMetadata *)self publisherIcon];
    [(_BlastDoorLPMapCollectionMetadata *)v4 setPublisherIcon:v11];

    v12 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPMapCollectionMetadata;
  if ([(_BlastDoorLPMapCollectionMetadata *)&v15 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = v6[2];
      if ((!(v7 | *(void *)&self->_numberOfItems) || objc_msgSend((id)v7, "isEqual:"))
        && *((_DWORD *)v6 + 3) == *((_DWORD *)&self->super.__dummyPropertyForObservation + 1)
        && ((unint64_t v8 = v6[3], !(v8 | (unint64_t)self->_name)) || objc_msgSend((id)v8, "isEqual:"))
        && ((unint64_t v9 = v6[6], !(v9 | (unint64_t)self->_darkImage)) || objc_msgSend((id)v9, "isEqual:"))
        && ((unint64_t v10 = v6[4], !(v10 | (unint64_t)self->_icon)) || objc_msgSend((id)v10, "isEqual:"))
        && ((unint64_t v11 = v6[5], !(v11 | (unint64_t)self->_image)) || objc_msgSend((id)v11, "isEqual:"))
        && ((unint64_t v12 = v6[7], !(v12 | (unint64_t)self->_addresses)) || objc_msgSend((id)v12, "isEqual:")))
      {
        unint64_t v13 = v6[8];
        if (v13 | (unint64_t)self->_publisherName) {
          char v5 = objc_msgSend((id)v13, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
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
  return [*(id *)&self->_numberOfItems hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"darkImage");
  (*v3)(v5, @"icon");
  (*v3)(v5, @"publisherIcon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"numberOfItems", @"icon", @"image", @"darkImage", @"addresses", @"publisherName", @"publisherIcon", 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfItems;
}

- (void)setName:(id)a3
{
}

- (unsigned)numberOfItems
{
  return *((_DWORD *)&self->super.__dummyPropertyForObservation + 1);
}

- (void)setNumberOfItems:(unsigned int)a3
{
  *((_DWORD *)&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
}

- (_BlastDoorLPImage)image
{
  return self->_icon;
}

- (void)setImage:(id)a3
{
}

- (_BlastDoorLPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
}

- (NSArray)addresses
{
  return (NSArray *)self->_darkImage;
}

- (void)setAddresses:(id)a3
{
}

- (NSString)publisherName
{
  return (NSString *)&self->_addresses->super.isa;
}

- (void)setPublisherName:(id)a3
{
}

- (_BlastDoorLPImage)publisherIcon
{
  return (_BlastDoorLPImage *)self->_publisherName;
}

- (void)setPublisherIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_darkImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_numberOfItems, 0);
}

@end