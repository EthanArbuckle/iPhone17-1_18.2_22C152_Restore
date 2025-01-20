@interface LNLocalizedStringResourceDialog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNLocalizedStringResourceDialog)initWithCoder:(id)a3;
- (LNLocalizedStringResourceDialog)initWithFullString:(id)a3 supportingString:(id)a4 systemImageName:(id)a5 localeIdentifier:(id)a6;
- (LNStaticDeferredLocalizedString)fullString;
- (LNStaticDeferredLocalizedString)supportingString;
- (NSString)systemImageName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNLocalizedStringResourceDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_supportingString, 0);
  objc_storeStrong((id *)&self->_fullString, 0);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (LNStaticDeferredLocalizedString)supportingString
{
  return self->_supportingString;
}

- (LNStaticDeferredLocalizedString)fullString
{
  return self->_fullString;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNLocalizedStringResourceDialog;
  id v4 = a3;
  [(LNDialog *)&v8 encodeWithCoder:v4];
  v5 = [(LNLocalizedStringResourceDialog *)self fullString];
  [v4 encodeObject:v5 forKey:@"fullString"];

  v6 = [(LNLocalizedStringResourceDialog *)self supportingString];
  [v4 encodeObject:v6 forKey:@"supportingString"];

  v7 = [(LNLocalizedStringResourceDialog *)self systemImageName];
  [v4 encodeObject:v7 forKey:@"systemImageName"];
}

- (LNLocalizedStringResourceDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullString"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportingString"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemImageName"];
    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    if (v8)
    {
      self = [(LNLocalizedStringResourceDialog *)self initWithFullString:v5 supportingString:v6 systemImageName:v7 localeIdentifier:v8];
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNLocalizedStringResourceDialog *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNLocalizedStringResourceDialog;
    if ([(LNDialog *)&v24 isEqual:v4])
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v6 = [(LNLocalizedStringResourceDialog *)self fullString];
      v7 = [(LNLocalizedStringResourceDialog *)v5 fullString];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_27;
        }
        int v14 = [v8 isEqual:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      v15 = [(LNLocalizedStringResourceDialog *)self supportingString];
      v16 = [(LNLocalizedStringResourceDialog *)v5 supportingString];
      id v13 = v15;
      id v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        id v19 = v13;
        if (!v13 || !v17)
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        int v11 = [v13 isEqual:v17];

        if (!v11) {
          goto LABEL_27;
        }
      }
      v20 = [(LNLocalizedStringResourceDialog *)self systemImageName];
      v21 = [(LNLocalizedStringResourceDialog *)v5 systemImageName];
      id v19 = v20;
      id v22 = v21;
      v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22) {
          LOBYTE(v11) = [v19 isEqual:v22];
        }
      }

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)LNLocalizedStringResourceDialog;
  unint64_t v3 = [(LNDialog *)&v11 hash];
  id v4 = [(LNLocalizedStringResourceDialog *)self fullString];
  uint64_t v5 = [v4 hash];
  v6 = [(LNLocalizedStringResourceDialog *)self supportingString];
  uint64_t v7 = v5 ^ [v6 hash];
  id v8 = [(LNLocalizedStringResourceDialog *)self systemImageName];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (LNLocalizedStringResourceDialog)initWithFullString:(id)a3 supportingString:(id)a4 systemImageName:(id)a5 localeIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    objc_super v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNLocalizedStringResourceDialog.m", 21, @"Invalid parameter not satisfying: %@", @"fullString" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)LNLocalizedStringResourceDialog;
  v15 = [(LNDialog *)&v25 initWithLocaleIdentifier:v14];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    fullString = v15->_fullString;
    v15->_fullString = (LNStaticDeferredLocalizedString *)v16;

    uint64_t v18 = [v12 copy];
    supportingString = v15->_supportingString;
    v15->_supportingString = (LNStaticDeferredLocalizedString *)v18;

    uint64_t v20 = [v13 copy];
    systemImageName = v15->_systemImageName;
    v15->_systemImageName = (NSString *)v20;

    id v22 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end