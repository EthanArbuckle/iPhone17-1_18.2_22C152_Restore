@interface LNPhotoItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNPhotoItem)initWithCoder:(id)a3;
- (LNPhotoItem)initWithIdentifier:(id)a3 type:(id)a4;
- (NSString)identifier;
- (NSString)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPhotoItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNPhotoItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(LNPhotoItem *)self type];
  [v4 encodeObject:v6 forKey:@"type"];
}

- (LNPhotoItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(LNPhotoItem *)self initWithIdentifier:v5 type:v6];
    v8 = self;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNPhotoItem *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    BOOL v7 = [(LNPhotoItem *)self identifier];
    v8 = [(LNPhotoItem *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNPhotoItem *)self type];
    v16 = [(LNPhotoItem *)v6 type];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNPhotoItem)initWithIdentifier:(id)a3 type:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNPhotoItemCollection.m", 68, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"LNPhotoItemCollection.m", 69, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)LNPhotoItem;
  v11 = [(LNPhotoItem *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_type, a4);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end