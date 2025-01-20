@interface CSPerson
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhotosPerson;
- (CSPerson)initWithCoder:(id)a3;
- (CSPerson)initWithDisplayName:(NSString *)displayName handles:(NSArray *)handles handleIdentifier:(NSString *)handleIdentifier;
- (CSPerson)initWithDisplayName:(id)a3 handles:(id)a4 handleIdentifier:(id)a5 photosPersonIdentifier:(id)a6;
- (CSPerson)initWithDisplayName:(id)a3 handles:(id)a4 handleIdentifier:(id)a5 photosPersonIdentifier:(id)a6 isPhotosPerson:(BOOL)a7 personType:(int64_t)a8 nameAlternatives:(id)a9 faceAttributes:(id)a10;
- (NSArray)faceAttributes;
- (NSArray)handles;
- (NSArray)nameAlternatives;
- (NSNumber)personType;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (NSString)handleIdentifier;
- (NSString)photosPersonIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifier:(NSString *)contactIdentifier;
- (void)setDisplayName:(id)a3;
- (void)setFaceAttributes:(id)a3;
- (void)setHandleIdentifier:(id)a3;
- (void)setHandles:(id)a3;
- (void)setIsPhotosPerson:(BOOL)a3;
- (void)setNameAlternatives:(id)a3;
- (void)setPersonType:(id)a3;
- (void)setPhotosPersonIdentifier:(id)a3;
@end

@implementation CSPerson

- (unint64_t)hash
{
  v3 = self->_handles;
  uint64_t v4 = [(NSArray *)v3 count];
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  if (v4)
  {
    v6 = [(NSArray *)v3 firstObject];
    uint64_t v7 = [v6 hash];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v5 ^ v7 ^ v4;
}

- (void)encodeWithCSCoder:(id)a3
{
  id v19 = a3;
  [v19 beginType:"CSPerson"];
  id v4 = [(CSPerson *)self displayName];
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  id v5 = [(CSPerson *)self handleIdentifier];
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v5, "UTF8String"), -1);

  uint64_t v6 = [(CSPerson *)self handles];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  [v19 encodeObject:v9];

  id v10 = [(CSPerson *)self contactIdentifier];
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v10, "UTF8String"), -1);

  id v11 = [(CSPerson *)self photosPersonIdentifier];
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v11, "UTF8String"), -1);

  if ([(CSPerson *)self isPhotosPerson])
  {
    uint64_t v12 = [(CSPerson *)self nameAlternatives];
    v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v8;
    }
    [v19 encodeObject:v14];

    uint64_t v15 = [(CSPerson *)self faceAttributes];
    v16 = (void *)v15;
    if (v15) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v8;
    }
    [v19 encodeObject:v17];

    v18 = [(CSPerson *)self personType];
    objc_msgSend(v19, "encodeInt32:", objc_msgSend(v18, "intValue"));

    objc_msgSend(v19, "encodeBool:", -[CSPerson isPhotosPerson](self, "isPhotosPerson"));
  }
  [v19 endType];
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)handles
{
  return self->_handles;
}

- (NSString)handleIdentifier
{
  return self->_handleIdentifier;
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)nameAlternatives
{
  return self->_nameAlternatives;
}

- (NSArray)faceAttributes
{
  return self->_faceAttributes;
}

- (NSString)photosPersonIdentifier
{
  return self->_photosPersonIdentifier;
}

- (NSNumber)personType
{
  return self->_personType;
}

- (BOOL)isPhotosPerson
{
  return self->_isPhotosPerson;
}

- (CSPerson)initWithDisplayName:(NSString *)displayName handles:(NSArray *)handles handleIdentifier:(NSString *)handleIdentifier
{
  uint64_t v8 = displayName;
  uint64_t v9 = handles;
  id v10 = handleIdentifier;
  v14.receiver = self;
  v14.super_class = (Class)CSPerson;
  id v11 = [(CSPerson *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    [(CSPerson *)v11 setDisplayName:v8];
    [(CSPerson *)v12 setHandles:v9];
    [(CSPerson *)v12 setHandleIdentifier:v10];
  }

  return v12;
}

- (void)setHandles:(id)a3
{
}

- (void)setHandleIdentifier:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personType, 0);
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_nameAlternatives, 0);
  objc_storeStrong((id *)&self->_photosPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handleIdentifier, 0);
  objc_storeStrong((id *)&self->_handles, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(CSPerson *)self displayName];
    uint64_t v7 = [v5 displayName];
    if (v6 != v7)
    {
      uint64_t v8 = [(CSPerson *)self displayName];
      v61 = [v5 displayName];
      if (!objc_msgSend(v8, "isEqualToString:"))
      {
        char v9 = 0;
        goto LABEL_50;
      }
      v59 = v8;
    }
    id v10 = [(CSPerson *)self handles];
    id v11 = [v5 handles];
    if (v10 != v11)
    {
      uint64_t v12 = [(CSPerson *)self handles];
      v13 = [v5 handles];
      if (![v12 isEqual:v13])
      {
        char v9 = 0;
LABEL_48:

LABEL_49:
        uint64_t v8 = v59;
        if (v6 == v7)
        {
LABEL_51:

          goto LABEL_52;
        }
LABEL_50:

        goto LABEL_51;
      }
      v55 = v13;
      v56 = v12;
    }
    uint64_t v14 = [(CSPerson *)self handleIdentifier];
    uint64_t v15 = [v5 handleIdentifier];
    v60 = (void *)v14;
    if ((void *)v14 != v15)
    {
      id v57 = v4;
      v16 = [(CSPerson *)self handleIdentifier];
      [v5 handleIdentifier];
      uint64_t v17 = v53 = v16;
      if (!objc_msgSend(v16, "isEqualToString:"))
      {
        char v9 = 0;
        id v4 = v57;
LABEL_46:

LABEL_47:
        v13 = v55;
        uint64_t v12 = v56;
        if (v10 == v11) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      id v4 = v57;
      v52 = v17;
    }
    uint64_t v18 = [(CSPerson *)self contactIdentifier];
    uint64_t v54 = [v5 contactIdentifier];
    v58 = (void *)v18;
    if (v18 != v54)
    {
      id v19 = [(CSPerson *)self contactIdentifier];
      v50 = [v5 contactIdentifier];
      v51 = v19;
      if (!objc_msgSend(v19, "isEqualToString:"))
      {
        char v9 = 0;
        v20 = (void *)v54;
LABEL_44:

LABEL_45:
        uint64_t v17 = v52;
        if (v60 == v15) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
    }
    uint64_t v21 = [(CSPerson *)self photosPersonIdentifier];
    uint64_t v49 = [v5 photosPersonIdentifier];
    if (v21 != v49)
    {
      v22 = (void *)v21;
      v23 = [(CSPerson *)self photosPersonIdentifier];
      v47 = [v5 photosPersonIdentifier];
      v48 = v23;
      if (objc_msgSend(v23, "isEqualToString:"))
      {
        if (self->_isPhotosPerson)
        {
          uint64_t v21 = (uint64_t)v22;
          goto LABEL_23;
        }
        char v9 = 1;
      }
      else
      {
        char v9 = 0;
      }
      v30 = (void *)v49;
LABEL_42:

LABEL_43:
      v20 = (void *)v54;
      if (v58 == (void *)v54) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    if (!self->_isPhotosPerson)
    {
      char v9 = 1;
      v22 = (void *)v21;
      v30 = (void *)v49;
      goto LABEL_43;
    }
LABEL_23:
    uint64_t v24 = [(CSPerson *)self personType];
    [v5 personType];
    uint64_t v46 = v45 = (void *)v24;
    v44 = (void *)v21;
    if (v24 != v46)
    {
      v25 = [(CSPerson *)self personType];
      v42 = [v5 personType];
      v43 = v25;
      if (!objc_msgSend(v25, "isEqual:"))
      {
        char v9 = 0;
        v26 = v45;
        v27 = (void *)v46;
LABEL_40:

LABEL_41:
        v22 = v44;
        v30 = (void *)v49;
        if (v44 == (void *)v49) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }
    }
    v28 = [(CSPerson *)self nameAlternatives];
    uint64_t v41 = [v5 nameAlternatives];
    if (v28 != (void *)v41)
    {
      v37 = v28;
      v29 = [(CSPerson *)self nameAlternatives];
      v39 = [v5 nameAlternatives];
      v40 = v29;
      if (!objc_msgSend(v29, "isEqual:"))
      {
        char v9 = 0;
        v33 = (void *)v41;
        v28 = v37;
        goto LABEL_38;
      }
      v28 = v37;
    }
    v31 = [(CSPerson *)self faceAttributes];
    uint64_t v32 = [v5 faceAttributes];
    if (v31 == (void *)v32)
    {

      char v9 = 1;
    }
    else
    {
      v38 = (void *)v32;
      v36 = [(CSPerson *)self faceAttributes];
      v35 = [v5 faceAttributes];
      char v9 = [v36 isEqual:v35];
    }
    v33 = (void *)v41;
    if (v28 == (void *)v41)
    {
LABEL_39:

      v26 = v45;
      v27 = (void *)v46;
      if (v45 == (void *)v46) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
LABEL_38:

    goto LABEL_39;
  }
  char v9 = 0;
LABEL_52:

  return v9;
}

- (CSPerson)initWithDisplayName:(id)a3 handles:(id)a4 handleIdentifier:(id)a5 photosPersonIdentifier:(id)a6
{
  return [(CSPerson *)self initWithDisplayName:a3 handles:a4 handleIdentifier:a5 photosPersonIdentifier:a6 isPhotosPerson:0 personType:1 nameAlternatives:0 faceAttributes:0];
}

- (CSPerson)initWithDisplayName:(id)a3 handles:(id)a4 handleIdentifier:(id)a5 photosPersonIdentifier:(id)a6 isPhotosPerson:(BOOL)a7 personType:(int64_t)a8 nameAlternatives:(id)a9 faceAttributes:(id)a10
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  v26.receiver = self;
  v26.super_class = (Class)CSPerson;
  v22 = [(CSPerson *)&v26 init];
  v23 = v22;
  if (v22)
  {
    [(CSPerson *)v22 setDisplayName:v16];
    [(CSPerson *)v23 setHandles:v17];
    [(CSPerson *)v23 setHandleIdentifier:v18];
    [(CSPerson *)v23 setPhotosPersonIdentifier:v19];
    uint64_t v24 = [NSNumber numberWithInteger:a8];
    [(CSPerson *)v23 setPersonType:v24];

    [(CSPerson *)v23 setNameAlternatives:v20];
    [(CSPerson *)v23 setFaceAttributes:v21];
    [(CSPerson *)v23 setIsPhotosPerson:v11];
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(CSPerson *)self displayName];
  [v12 encodeObject:v4 forKey:@"displayName"];

  id v5 = [(CSPerson *)self handles];
  [v12 encodeObject:v5 forKey:@"handles"];

  uint64_t v6 = [(CSPerson *)self handleIdentifier];
  [v12 encodeObject:v6 forKey:@"handleIdentifier"];

  uint64_t v7 = [(CSPerson *)self contactIdentifier];
  [v12 encodeObject:v7 forKey:@"contactIdentifier"];

  uint64_t v8 = [(CSPerson *)self photosPersonIdentifier];
  [v12 encodeObject:v8 forKey:@"photosPersonIdentifier"];

  if (self->_isPhotosPerson)
  {
    char v9 = [(CSPerson *)self nameAlternatives];
    [v12 encodeObject:v9 forKey:@"photosNameAlternatives"];

    id v10 = [(CSPerson *)self faceAttributes];
    [v12 encodeObject:v10 forKey:@"photosFaceAttributes"];

    BOOL v11 = [(CSPerson *)self personType];
    [v12 encodeObject:v11 forKey:@"personType"];

    [v12 encodeBool:self->_isPhotosPerson forKey:@"isPhotosPerson"];
  }
}

- (CSPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CSPerson;
  id v5 = [(CSPerson *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(CSPerson *)v5 setDisplayName:v6];

    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    char v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"handles"];
    [(CSPerson *)v5 setHandles:v10];

    BOOL v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handleIdentifier"];
    [(CSPerson *)v5 setHandleIdentifier:v11];

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    [(CSPerson *)v5 setContactIdentifier:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photosPersonIdentifier"];
    [(CSPerson *)v5 setPhotosPersonIdentifier:v13];

    -[CSPerson setIsPhotosPerson:](v5, "setIsPhotosPerson:", [v4 decodeBoolForKey:@"isPhotosPerson"]);
    if (v5->_isPhotosPerson)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      id v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      id v17 = [v4 decodeObjectOfClasses:v16 forKey:@"photosNameAlternatives"];
      [(CSPerson *)v5 setNameAlternatives:v17];

      id v18 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v19 = objc_opt_class();
      id v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      id v21 = [v4 decodeObjectOfClasses:v20 forKey:@"photosFaceAttributes"];
      [(CSPerson *)v5 setFaceAttributes:v21];

      v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personType"];
      [(CSPerson *)v5 setPersonType:v22];
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(CSPerson *)self displayName];
  uint64_t v6 = [(CSPerson *)self handles];
  uint64_t v7 = [(CSPerson *)self handleIdentifier];
  uint64_t v8 = [(CSPerson *)self photosPersonIdentifier];
  char v9 = (void *)[v4 initWithDisplayName:v5 handles:v6 handleIdentifier:v7 photosPersonIdentifier:v8];

  id v10 = [(CSPerson *)self contactIdentifier];
  [v9 setContactIdentifier:v10];

  if (self->_isPhotosPerson)
  {
    BOOL v11 = [(CSPerson *)self personType];
    [v9 setPersonType:v11];

    id v12 = [(CSPerson *)self nameAlternatives];
    [v9 setNameAlternatives:v12];

    v13 = [(CSPerson *)self faceAttributes];
    [v9 setFaceAttributes:v13];

    objc_msgSend(v9, "setIsPhotosPerson:", -[CSPerson isPhotosPerson](self, "isPhotosPerson"));
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CSPerson *)self displayName];
  uint64_t v6 = [(CSPerson *)self handles];
  uint64_t v7 = [v6 componentsJoinedByString:@", "];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p %@ <%@>", v4, self, v5, v7];

  return v8;
}

- (void)setContactIdentifier:(NSString *)contactIdentifier
{
}

- (void)setPhotosPersonIdentifier:(id)a3
{
}

- (void)setNameAlternatives:(id)a3
{
}

- (void)setFaceAttributes:(id)a3
{
}

- (void)setPersonType:(id)a3
{
}

- (void)setIsPhotosPerson:(BOOL)a3
{
  self->_isPhotosPerson = a3;
}

@end