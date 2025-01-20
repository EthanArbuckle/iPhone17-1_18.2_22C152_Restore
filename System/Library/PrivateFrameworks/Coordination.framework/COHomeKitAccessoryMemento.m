@interface COHomeKitAccessoryMemento
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHomeKitAccessoryMemento:(id)a3;
- (COHomeKitAccessoryMemento)initWithCoder:(id)a3;
- (COHomeKitAccessoryMemento)initWithHomeKitAccessory:(id)a3;
- (NSString)IDSIdentifier;
- (NSString)categoryType;
- (NSUUID)homeUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COHomeKitAccessoryMemento

- (COHomeKitAccessoryMemento)initWithHomeKitAccessory:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)COHomeKitAccessoryMemento;
  v5 = [(COHomeKitAccessoryMemento *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 uniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v6;

    v8 = [v4 category];
    v9 = [v8 categoryType];
    uint64_t v10 = [v9 copy];
    categoryType = v5->_categoryType;
    v5->_categoryType = (NSString *)v10;

    v12 = [v4 home];
    uint64_t v13 = [v12 uniqueIdentifier];
    homeUniqueIdentifier = v5->_homeUniqueIdentifier;
    v5->_homeUniqueIdentifier = (NSUUID *)v13;

    v15 = [v4 device];
    v16 = [v15 idsIdentifier];
    uint64_t v17 = [v16 UUIDString];
    IDSIdentifier = v5->_IDSIdentifier;
    v5->_IDSIdentifier = (NSString *)v17;
  }
  return v5;
}

- (COHomeKitAccessoryMemento)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)COHomeKitAccessoryMemento;
  v5 = [(COHomeKitAccessoryMemento *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryType"];
    categoryType = v5->_categoryType;
    v5->_categoryType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeUniqueIdentifier"];
    homeUniqueIdentifier = v5->_homeUniqueIdentifier;
    v5->_homeUniqueIdentifier = (NSUUID *)v10;

    if (!v5->_uniqueIdentifier
      || ![(NSString *)v5->_categoryType length]
      || !v5->_homeUniqueIdentifier
      || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          IDSIdentifier = v5->_IDSIdentifier,
          v5->_IDSIdentifier = (NSString *)v12,
          IDSIdentifier,
          !v5->_IDSIdentifier)
      && [v4 containsValueForKey:@"idsIdentifier"])
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(COHomeKitAccessoryMemento *)self uniqueIdentifier];
  id v7 = [v6 UUIDString];
  uint64_t v8 = [v7 UTF8String];
  v9 = [(COHomeKitAccessoryMemento *)self IDSIdentifier];
  if (v9)
  {
    id v10 = [(COHomeKitAccessoryMemento *)self IDSIdentifier];
    v11 = [v3 stringWithFormat:@"<%@: %p, id = %.8s, ids = %.8s>", v5, self, v8, objc_msgSend(v10, "UTF8String")];
  }
  else
  {
    v11 = [v3 stringWithFormat:@"<%@: %p, id = %.8s, ids = %.8s>", v5, self, v8, "nil"];
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(COHomeKitAccessoryMemento *)self uniqueIdentifier];
  [v8 encodeObject:v4 forKey:@"uniqueIdentifier"];

  v5 = [(COHomeKitAccessoryMemento *)self categoryType];
  [v8 encodeObject:v5 forKey:@"categoryType"];

  uint64_t v6 = [(COHomeKitAccessoryMemento *)self homeUniqueIdentifier];
  [v8 encodeObject:v6 forKey:@"homeUniqueIdentifier"];

  id v7 = [(COHomeKitAccessoryMemento *)self IDSIdentifier];
  if ([v7 length]) {
    [v8 encodeObject:v7 forKey:@"idsIdentifier"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(COHomeKitAccessoryMemento *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COHomeKitAccessoryMemento *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(COHomeKitAccessoryMemento *)self isEqualToHomeKitAccessoryMemento:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToHomeKitAccessoryMemento:(id)a3
{
  id v4 = a3;
  v5 = [(COHomeKitAccessoryMemento *)self uniqueIdentifier];
  BOOL v6 = [v4 uniqueIdentifier];
  if ([v5 isEqual:v6])
  {
    id v7 = [(COHomeKitAccessoryMemento *)self homeUniqueIdentifier];
    id v8 = [v4 homeUniqueIdentifier];
    if ([v7 isEqual:v8])
    {
      v9 = [(COHomeKitAccessoryMemento *)self categoryType];
      id v10 = [v4 categoryType];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(COHomeKitAccessoryMemento *)self IDSIdentifier];
        uint64_t v12 = [v4 IDSIdentifier];
        if (v11 == v12)
        {
          char v14 = 1;
        }
        else
        {
          v16 = [(COHomeKitAccessoryMemento *)self IDSIdentifier];
          [v4 IDSIdentifier];
          uint64_t v13 = v17 = v11;
          char v14 = [v16 isEqualToString:v13];

          v11 = v17;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (NSUUID)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end