@interface _BlastDoorLPFileMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)name;
- (NSString)type;
- (_BlastDoorLPFileMetadata)initWithCoder:(id)a3;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setThumbnail:(id)a3;
- (void)setType:(id)a3;
@end

@implementation _BlastDoorLPFileMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPFileMetadata)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BlastDoorLPFileMetadata;
  v5 = [(_BlastDoorLPFileMetadata *)&v19 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"type");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    v10 = decodeNumberForKey(v4, @"size");
    v5->_size = [v10 unsignedLongLongValue];

    uint64_t v11 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"thumbnail");
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (_BlastDoorLPImage *)v11;

    uint64_t v13 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v13;

    uint64_t v15 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"creationDate");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_type, @"type");
  if (self->_size)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"size");
  }
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, @"thumbnail");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creationDate, @"creationDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPFileMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPFileMetadata *)self name];
    [(_BlastDoorLPFileMetadata *)v4 setName:v5];

    uint64_t v6 = [(_BlastDoorLPFileMetadata *)self type];
    [(_BlastDoorLPFileMetadata *)v4 setType:v6];

    [(_BlastDoorLPFileMetadata *)v4 setSize:[(_BlastDoorLPFileMetadata *)self size]];
    v7 = [(_BlastDoorLPFileMetadata *)self thumbnail];
    [(_BlastDoorLPFileMetadata *)v4 setThumbnail:v7];

    uint64_t v8 = [(_BlastDoorLPFileMetadata *)self icon];
    [(_BlastDoorLPFileMetadata *)v4 setIcon:v8];

    v9 = [(_BlastDoorLPFileMetadata *)self creationDate];
    [(_BlastDoorLPFileMetadata *)v4 setCreationDate:v9];

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPFileMetadata;
  if ([(_BlastDoorLPFileMetadata *)&v13 isEqual:v4])
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
      if ((!(v7 | (unint64_t)self->_name) || objc_msgSend((id)v7, "isEqual:"))
        && ((unint64_t v8 = v6[3], !(v8 | (unint64_t)self->_type)) || objc_msgSend((id)v8, "isEqual:"))
        && v6[4] == self->_size
        && ((unint64_t v9 = v6[5], !(v9 | (unint64_t)self->_thumbnail)) || objc_msgSend((id)v9, "isEqual:"))
        && ((unint64_t v10 = v6[6], !(v10 | (unint64_t)self->_icon)) || objc_msgSend((id)v10, "isEqual:")))
      {
        unint64_t v11 = v6[7];
        if (v11 | (unint64_t)self->_creationDate) {
          char v5 = objc_msgSend((id)v11, "isEqual:");
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
  return [(NSString *)self->_name hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"icon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"type", @"size", @"thumbnail", @"icon", @"creationDate", @"encodedTokens", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (_BlastDoorLPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end