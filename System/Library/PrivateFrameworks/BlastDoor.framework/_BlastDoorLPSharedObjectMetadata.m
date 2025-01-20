@interface _BlastDoorLPSharedObjectMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isCollaboration;
- (BOOL)isEqual:(id)a3;
- (NSString)information;
- (NSString)subtitle;
- (NSString)title;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPSharedObjectMetadata)initWithCoder:(id)a3;
- (_BlastDoorLPSpecializationMetadata)specialization;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(id)a3;
- (void)setInformation:(id)a3;
- (void)setIsCollaboration:(BOOL)a3;
- (void)setSpecialization:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _BlastDoorLPSharedObjectMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSharedObjectMetadata)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_BlastDoorLPSharedObjectMetadata;
  v5 = [(_BlastDoorLPSharedObjectMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    v7 = *(void **)&v5->_isCollaboration;
    *(void *)&v5->_isCollaboration = v6;

    uint64_t v8 = decodeStringForKey(v4, @"subtitle");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"information");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    information = v5->_information;
    v5->_information = (NSString *)v12;

    *(&v5->super.__dummyPropertyForObservation + 1) = [v4 decodeBoolForKey:@"isCollaboration"];
    if ([v4 containsValueForKey:@"specialization"])
    {
      v14 = allKnownSpecializationClasses();
      id v20 = 0;
      uint64_t v15 = objc_msgSend(v4, "_bd_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v14, @"specialization", &v20);
      id v16 = v20;
      icon = v5->_icon;
      v5->_icon = (_BlastDoorLPImage *)v15;
    }
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_isCollaboration;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"title");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, @"subtitle");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, @"information");
  [v5 encodeBool:*((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1) forKey:@"isCollaboration"];
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_information, @"icon");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"specialization");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_BlastDoorLPSharedObjectMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPSharedObjectMetadata *)self title];
    [(_BlastDoorLPSharedObjectMetadata *)v4 setTitle:v5];

    uint64_t v6 = [(_BlastDoorLPSharedObjectMetadata *)self subtitle];
    [(_BlastDoorLPSharedObjectMetadata *)v4 setSubtitle:v6];

    v7 = [(_BlastDoorLPSharedObjectMetadata *)self information];
    [(_BlastDoorLPSharedObjectMetadata *)v4 setInformation:v7];

    [(_BlastDoorLPSharedObjectMetadata *)v4 setIsCollaboration:[(_BlastDoorLPSharedObjectMetadata *)self isCollaboration]];
    uint64_t v8 = [(_BlastDoorLPSharedObjectMetadata *)self icon];
    [(_BlastDoorLPSharedObjectMetadata *)v4 setIcon:v8];

    v9 = [(_BlastDoorLPSharedObjectMetadata *)self specialization];
    [(_BlastDoorLPSharedObjectMetadata *)v4 setSpecialization:v9];

    uint64_t v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_BlastDoorLPSharedObjectMetadata;
  if ([(_BlastDoorLPSharedObjectMetadata *)&v26 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (unsigned __int8 *)v4;
      unint64_t v7 = *(void *)&self->_isCollaboration;
      uint64_t v8 = [v6 title];
      if (v7 | v8)
      {
        v9 = (void *)v8;
        int v10 = [(id)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_16;
        }
      }
      title = self->_title;
      uint64_t v12 = [v6 subtitle];
      if ((unint64_t)title | v12)
      {
        v13 = (void *)v12;
        int v14 = [(NSString *)title isEqual:v12];

        if (!v14) {
          goto LABEL_16;
        }
      }
      subtitle = self->_subtitle;
      uint64_t v16 = [v6 information];
      if ((unint64_t)subtitle | v16)
      {
        v17 = (void *)v16;
        int v18 = [(NSString *)subtitle isEqual:v16];

        if (!v18) {
          goto LABEL_16;
        }
      }
      if (v6[9] == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1)
        && ((information = self->_information,
             [v6 icon],
             uint64_t v20 = objc_claimAutoreleasedReturnValue(),
             !((unint64_t)information | v20))
         || (objc_super v21 = (void *)v20, v22 = [(NSString *)information isEqual:v20], v21, v22)))
      {
        icon = self->_icon;
        uint64_t v24 = [v6 specialization];
        if ((unint64_t)icon | v24) {
          char v5 = [(_BlastDoorLPImage *)icon isEqual:v24];
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
LABEL_16:
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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", @"information", @"icon", @"isCollaboration", @"specialization", 0);
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

- (NSString)title
{
  return *(NSString **)&self->_isCollaboration;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_title;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)information
{
  return self->_subtitle;
}

- (void)setInformation:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_information;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)isCollaboration
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setIsCollaboration:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (_BlastDoorLPSpecializationMetadata)specialization
{
  return (_BlastDoorLPSpecializationMetadata *)self->_icon;
}

- (void)setSpecialization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_isCollaboration, 0);
}

@end