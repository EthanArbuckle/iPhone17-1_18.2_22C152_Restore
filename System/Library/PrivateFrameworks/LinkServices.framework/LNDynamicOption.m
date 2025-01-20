@interface LNDynamicOption
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDynamicOption)initWithCoder:(id)a3;
- (LNDynamicOption)initWithValue:(id)a3 indentationLevel:(int64_t)a4;
- (LNImage)image;
- (LNStaticDeferredLocalizedString)subtitle;
- (LNStaticDeferredLocalizedString)title;
- (LNValue)value;
- (id)description;
- (int64_t)indentationLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDynamicOption

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNDynamicOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"indentationLevel"];

  v7 = [(LNDynamicOption *)self initWithValue:v5 indentationLevel:v6];
  return v7;
}

- (LNDynamicOption)initWithValue:(id)a3 indentationLevel:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNDynamicOptionsResult.m", 18, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNDynamicOption;
  v9 = [(LNDynamicOption *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    v10->_indentationLevel = a4;
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(LNDynamicOption *)self value];
  [v5 encodeObject:v4 forKey:@"value"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNDynamicOption indentationLevel](self, "indentationLevel"), @"indentationLevel");
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (LNStaticDeferredLocalizedString)title
{
  v2 = [(LNDynamicOption *)self value];
  v3 = [v2 displayRepresentation];
  id v4 = [v3 title];

  return (LNStaticDeferredLocalizedString *)v4;
}

- (LNImage)image
{
  v2 = [(LNDynamicOption *)self value];
  v3 = [v2 displayRepresentation];
  id v4 = [v3 image];

  return (LNImage *)v4;
}

- (LNStaticDeferredLocalizedString)subtitle
{
  v2 = [(LNDynamicOption *)self value];
  v3 = [v2 displayRepresentation];
  id v4 = [v3 subtitle];

  return (LNStaticDeferredLocalizedString *)v4;
}

- (LNValue)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v3 = [(LNDynamicOption *)self value];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNDynamicOption *)self title];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNDynamicOption *)self subtitle];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNDynamicOption *)a3;
  id v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_29:

      goto LABEL_30;
    }
    v7 = [(LNDynamicOption *)self value];
    unint64_t v8 = [(LNDynamicOption *)v6 value];
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
      if (!v9 || !v10) {
        goto LABEL_27;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v16 = [(LNDynamicOption *)self title];
    v17 = [(LNDynamicOption *)v6 title];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_26;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_27;
      }
    }
    v21 = [(LNDynamicOption *)self subtitle];
    v22 = [(LNDynamicOption *)v6 subtitle];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
    }
    else
    {
      if (!v20 || !v23)
      {

        LOBYTE(v12) = 0;
        goto LABEL_26;
      }
      int v12 = [v20 isEqual:v23];

      if (!v12) {
        goto LABEL_26;
      }
    }
    int64_t v24 = [(LNDynamicOption *)self indentationLevel];
    LOBYTE(v12) = v24 == [(LNDynamicOption *)v6 indentationLevel];
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  LOBYTE(v12) = 1;
LABEL_30:

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNDynamicOption *)self title];
  v7 = [v3 stringWithFormat:@"<%@: %p titleKey=%@>", v5, self, v6];

  return v7;
}

@end