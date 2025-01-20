@interface _BlastDoorLPMapCollectionPublisherMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPMapCollectionPublisherMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)numberOfPublishedCollections;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfPublishedCollections:(unsigned int)a3;
@end

@implementation _BlastDoorLPMapCollectionPublisherMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPMapCollectionPublisherMetadata)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPMapCollectionPublisherMetadata;
  v5 = [(_BlastDoorLPMapCollectionPublisherMetadata *)&v13 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    v7 = *(void **)&v5->_numberOfPublishedCollections;
    *(void *)&v5->_numberOfPublishedCollections = v6;

    v8 = decodeNumberForKey(v4, @"numberOfPublishedCollections");
    *((_DWORD *)&v5->super.__dummyPropertyForObservation + 1) = [v8 unsignedIntValue];

    uint64_t v9 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    name = v5->_name;
    v5->_name = (NSString *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_numberOfPublishedCollections;
  id v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"name");
  v5 = [NSNumber numberWithUnsignedInt:*((unsigned int *)&self->super.__dummyPropertyForObservation + 1)];
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, @"numberOfPublishedCollections");

  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_BlastDoorLPMapCollectionPublisherMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPMapCollectionPublisherMetadata *)self name];
    [(_BlastDoorLPMapCollectionPublisherMetadata *)v4 setName:v5];

    [(_BlastDoorLPMapCollectionPublisherMetadata *)v4 setNumberOfPublishedCollections:[(_BlastDoorLPMapCollectionPublisherMetadata *)self numberOfPublishedCollections]];
    id v6 = [(_BlastDoorLPMapCollectionPublisherMetadata *)self icon];
    [(_BlastDoorLPMapCollectionPublisherMetadata *)v4 setIcon:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPMapCollectionPublisherMetadata;
  if ([(_BlastDoorLPMapCollectionPublisherMetadata *)&v10 isEqual:v4])
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
      if ((!(v7 | *(void *)&self->_numberOfPublishedCollections) || objc_msgSend((id)v7, "isEqual:"))
        && *((_DWORD *)v6 + 3) == *((_DWORD *)&self->super.__dummyPropertyForObservation + 1))
      {
        unint64_t v8 = v6[3];
        if (v8 | (unint64_t)self->_name) {
          char v5 = objc_msgSend((id)v8, "isEqual:");
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
  return [*(id *)&self->_numberOfPublishedCollections hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"numberOfPublishedCollections", @"icon", 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfPublishedCollections;
}

- (void)setName:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
}

- (unsigned)numberOfPublishedCollections
{
  return *((_DWORD *)&self->super.__dummyPropertyForObservation + 1);
}

- (void)setNumberOfPublishedCollections:(unsigned int)a3
{
  *((_DWORD *)&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_numberOfPublishedCollections, 0);
}

@end