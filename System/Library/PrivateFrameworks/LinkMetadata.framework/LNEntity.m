@interface LNEntity
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersistentFileIdentifiable;
- (BOOL)isTransient;
- (LNEntity)initWithBSXPCCoder:(id)a3;
- (LNEntity)initWithCoder:(id)a3;
- (LNEntity)initWithIdentifier:(id)a3;
- (LNEntity)initWithIdentifier:(id)a3 managedAccountIdentifier:(id)a4;
- (LNEntity)initWithIdentifier:(id)a3 properties:(id)a4;
- (LNEntity)initWithIdentifier:(id)a3 properties:(id)a4 managedAccountIdentifier:(id)a5;
- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 persistentFileIdentifiable:(BOOL)a5 properties:(id)a6 managedAccountIdentifier:(id)a7;
- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 properties:(id)a5 managedAccountIdentifier:(id)a6;
- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 properties:(id)a5 prototypeMangledTypeName:(id)a6 managedAccountIdentifier:(id)a7;
- (LNEntityIdentifier)identifier;
- (NSArray)properties;
- (NSString)description;
- (NSString)managedAccountIdentifier;
- (NSString)prototypeMangledTypeName;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEntity

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isTransient](self, "isTransient"), @"transient");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isPersistentFileIdentifiable](self, "isPersistentFileIdentifiable"), @"persistentFileIdentifiable");
  v5 = [(LNEntity *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNEntity *)self properties];
  [v4 encodeObject:v6 forKey:@"properties"];

  v7 = [(LNEntity *)self managedAccountIdentifier];
  [v4 encodeObject:v7 forKey:@"managedAccountIdentifier"];

  id v8 = [(LNEntity *)self prototypeMangledTypeName];
  [v4 encodeObject:v8 forKey:@"prototypeMangledTypeName"];
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (LNEntityIdentifier)identifier
{
  return self->_identifier;
}

- (NSString)prototypeMangledTypeName
{
  return self->_prototypeMangledTypeName;
}

- (NSArray)properties
{
  return self->_properties;
}

- (NSString)managedAccountIdentifier
{
  return self->_managedAccountIdentifier;
}

- (BOOL)isPersistentFileIdentifiable
{
  return self->_persistentFileIdentifiable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"properties"];

  if (v5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v17 = 0;
  }
  else
  {
    uint64_t v11 = [v4 decodeBoolForKey:@"transient"];
    uint64_t v12 = [v4 decodeBoolForKey:@"persistentFileIdentifiable"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedAccountIdentifier"];
    v14 = [(LNEntity *)self initWithTransient:v11 identifier:v5 persistentFileIdentifiable:v12 properties:v9 managedAccountIdentifier:v13];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prototypeMangledTypeName"];
    prototypeMangledTypeName = v14->_prototypeMangledTypeName;
    v14->_prototypeMangledTypeName = (NSString *)v15;

    self = v14;
    v17 = self;
  }

  return v17;
}

- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 persistentFileIdentifiable:(BOOL)a5 properties:(id)a6 managedAccountIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)LNEntity;
  uint64_t v15 = [(LNEntity *)&v23 init];
  v16 = v15;
  if (v15)
  {
    v15->_transient = a3;
    v15->_persistentFileIdentifiable = a5;
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (LNEntityIdentifier *)v17;

    uint64_t v19 = [v13 copy];
    properties = v16->_properties;
    v16->_properties = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_managedAccountIdentifier, a7);
    v21 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeMangledTypeName, 0);
  objc_storeStrong((id *)&self->_managedAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)hash
{
  if ([(LNEntity *)self isTransient])
  {
    v3 = [(LNEntity *)self properties];
    uint64_t v4 = [v3 hash];
  }
  else
  {
    v3 = [(LNEntity *)self identifier];
    uint64_t v5 = [v3 hash];
    v6 = [(LNEntity *)self properties];
    uint64_t v4 = [v6 hash] ^ v5;
  }
  uint64_t v7 = [(LNEntity *)self isTransient];
  id v8 = [(LNEntity *)self managedAccountIdentifier];
  uint64_t v9 = v4 ^ [v8 hash];
  BOOL v10 = [(LNEntity *)self prototypeMangledTypeName];
  unint64_t v11 = v9 ^ v7 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNEntity *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v7 = [(LNEntity *)self isTransient];
        if (v7 != [(LNEntity *)v6 isTransient])
        {
LABEL_5:
          LOBYTE(v8) = 0;
LABEL_43:

          goto LABEL_44;
        }
        if ([(LNEntity *)self isTransient])
        {
          BOOL v10 = [(LNEntity *)self properties];
          unint64_t v11 = [(LNEntity *)v6 properties];

          if (v10 != v11)
          {
            uint64_t v12 = [(LNEntity *)self properties];
            if (!v12) {
              goto LABEL_5;
            }
            id v13 = (void *)v12;
            id v14 = [(LNEntity *)v6 properties];

            if (!v14) {
              goto LABEL_5;
            }
            uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
            v16 = [(LNEntity *)self properties];
            uint64_t v17 = [v15 setWithArray:v16];
            v18 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v19 = [(LNEntity *)v6 properties];
            v20 = [v18 setWithArray:v19];
            int v21 = [v17 isEqualToSet:v20];

            if (!v21) {
              goto LABEL_5;
            }
          }
        }
        else
        {
          v22 = [(LNEntity *)self identifier];
          objc_super v23 = [(LNEntity *)v6 identifier];
          uint64_t v9 = v22;
          v24 = v23;
          v25 = v24;
          if (v9 == v24)
          {
          }
          else
          {
            LOBYTE(v8) = 0;
            if (!v9 || !v24) {
              goto LABEL_32;
            }
            LODWORD(v8) = [(LNEntity *)v9 isEqual:v24];

            if (!v8) {
              goto LABEL_41;
            }
          }
          v26 = [(LNEntity *)self properties];
          v27 = [(LNEntity *)v6 properties];

          if (v26 == v27)
          {
          }
          else
          {
            id v8 = [(LNEntity *)self properties];
            if (!v8)
            {
LABEL_41:

              goto LABEL_42;
            }
            v28 = [(LNEntity *)v6 properties];

            if (!v28)
            {
              LOBYTE(v8) = 0;
              goto LABEL_41;
            }
            v29 = (void *)MEMORY[0x1E4F1CAD0];
            v30 = [(LNEntity *)self properties];
            v31 = [v29 setWithArray:v30];
            v32 = (void *)MEMORY[0x1E4F1CAD0];
            v33 = [(LNEntity *)v6 properties];
            v34 = [v32 setWithArray:v33];
            char v35 = [v31 isEqualToSet:v34];

            if ((v35 & 1) == 0) {
              goto LABEL_5;
            }
          }
        }
        v36 = [(LNEntity *)self managedAccountIdentifier];
        v37 = [(LNEntity *)v6 managedAccountIdentifier];
        uint64_t v9 = v36;
        v38 = v37;
        v25 = v38;
        if (v9 == v38)
        {

LABEL_34:
          v41 = [(LNEntity *)self prototypeMangledTypeName];
          v42 = [(LNEntity *)v6 prototypeMangledTypeName];
          v40 = v41;
          v43 = v42;
          v39 = v43;
          if (v40 == v43)
          {
            LOBYTE(v8) = 1;
          }
          else
          {
            LOBYTE(v8) = 0;
            if (v40 && v43) {
              LOBYTE(v8) = [(LNEntity *)v40 isEqualToString:v43];
            }
          }

          goto LABEL_40;
        }
        LOBYTE(v8) = 0;
        if (v9 && v38)
        {
          LODWORD(v8) = [(LNEntity *)v9 isEqualToString:v38];

          if (!v8) {
            goto LABEL_41;
          }
          goto LABEL_34;
        }
LABEL_32:
        v39 = v25;
        v40 = v9;
LABEL_40:

        goto LABEL_41;
      }
      LOBYTE(v8) = 0;
      uint64_t v9 = v6;
      v6 = 0;
    }
    else
    {
      uint64_t v9 = 0;
      LOBYTE(v8) = 0;
    }
LABEL_42:

    goto LABEL_43;
  }
  LOBYTE(v8) = 1;
LABEL_44:

  return (char)v8;
}

- (NSString)description
{
  uint64_t v19 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v4);
  BOOL v5 = [(LNEntity *)self isTransient];
  v6 = &stru_1EEDBEA90;
  BOOL v7 = @"(transient) ";
  if (!v5) {
    BOOL v7 = &stru_1EEDBEA90;
  }
  v18 = v7;
  id v8 = [(LNEntity *)self identifier];
  uint64_t v9 = [(LNEntity *)self prototypeMangledTypeName];
  if ([(LNEntity *)self isPersistentFileIdentifiable]) {
    BOOL v10 = @"YES";
  }
  else {
    BOOL v10 = @"NO";
  }
  unint64_t v11 = [(LNEntity *)self managedAccountIdentifier];
  if (v11)
  {
    uint64_t v12 = NSString;
    v2 = [(LNEntity *)self managedAccountIdentifier];
    v6 = [v12 stringWithFormat:@"MAI: %@,", v2];
  }
  id v13 = [(LNEntity *)self properties];
  id v14 = [v13 valueForKeyPath:@"description"];
  uint64_t v15 = [v14 componentsJoinedByString:@", "];
  v16 = [v19 stringWithFormat:@"<%@: %p, identifier: %@%@, prototypeMangledTypeName: %@, isFile: %@, %@ properties: [%@]>", v20, self, v18, v8, v9, v10, v6, v15];

  if (v11)
  {
  }
  return (NSString *)v16;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isTransient](self, "isTransient"), @"transient");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntity isPersistentFileIdentifiable](self, "isPersistentFileIdentifiable"), @"persistentFileIdentifiable");
  BOOL v5 = [(LNEntity *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNEntity *)self properties];
  [v4 encodeObject:v6 forKey:@"properties"];

  BOOL v7 = [(LNEntity *)self managedAccountIdentifier];
  [v4 encodeObject:v7 forKey:@"managedAccountIdentifier"];

  id v8 = [(LNEntity *)self prototypeMangledTypeName];
  [v4 encodeObject:v8 forKey:@"prototypeMangledTypeName"];
}

- (LNEntity)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"properties"];
  id v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v16 = 0;
  }
  else
  {
    uint64_t v10 = [v4 decodeBoolForKey:@"transient"];
    uint64_t v11 = [v4 decodeBoolForKey:@"persistentFileIdentifiable"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedAccountIdentifier"];
    id v13 = [(LNEntity *)self initWithTransient:v10 identifier:v5 persistentFileIdentifiable:v11 properties:v8 managedAccountIdentifier:v12];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prototypeMangledTypeName"];
    prototypeMangledTypeName = v13->_prototypeMangledTypeName;
    v13->_prototypeMangledTypeName = (NSString *)v14;

    self = v13;
    v16 = self;
  }

  return v16;
}

- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 properties:(id)a5 prototypeMangledTypeName:(id)a6 managedAccountIdentifier:(id)a7
{
  BOOL v10 = a3;
  id v12 = a6;
  id v13 = [(LNEntity *)self initWithTransient:v10 identifier:a4 properties:a5 managedAccountIdentifier:a7];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    prototypeMangledTypeName = v13->_prototypeMangledTypeName;
    v13->_prototypeMangledTypeName = (NSString *)v14;

    v16 = v13;
  }

  return v13;
}

- (LNEntity)initWithTransient:(BOOL)a3 identifier:(id)a4 properties:(id)a5 managedAccountIdentifier:(id)a6
{
  return [(LNEntity *)self initWithTransient:a3 identifier:a4 persistentFileIdentifiable:0 properties:a5 managedAccountIdentifier:a6];
}

- (LNEntity)initWithIdentifier:(id)a3
{
  return [(LNEntity *)self initWithTransient:0 identifier:a3 properties:MEMORY[0x1E4F1CBF0] managedAccountIdentifier:0];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (LNEntity)initWithIdentifier:(id)a3 properties:(id)a4 managedAccountIdentifier:(id)a5
{
  return [(LNEntity *)self initWithTransient:0 identifier:a3 properties:a4 managedAccountIdentifier:a5];
}

- (LNEntity)initWithIdentifier:(id)a3 managedAccountIdentifier:(id)a4
{
  return [(LNEntity *)self initWithTransient:0 identifier:a3 properties:MEMORY[0x1E4F1CBF0] managedAccountIdentifier:a4];
}

- (LNEntity)initWithIdentifier:(id)a3 properties:(id)a4
{
  return [(LNEntity *)self initWithTransient:0 identifier:a3 properties:a4 managedAccountIdentifier:0];
}

@end