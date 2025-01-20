@interface LNBasicDialog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNBasicDialog)initWithCoder:(id)a3;
- (LNBasicDialog)initWithFullString:(id)a3 supportingString:(id)a4 localeIdentifier:(id)a5;
- (LNBasicDialog)initWithPrintedString:(id)a3 spokenString:(id)a4 localeIdentifier:(id)a5;
- (LNDeferredLocalizedString)fullString;
- (LNDeferredLocalizedString)printedString;
- (LNDeferredLocalizedString)spokenString;
- (LNDeferredLocalizedString)supportingString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNBasicDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenString, 0);
  objc_storeStrong((id *)&self->_printedString, 0);
  objc_storeStrong((id *)&self->_supportingString, 0);
  objc_storeStrong((id *)&self->_fullString, 0);
}

- (LNDeferredLocalizedString)spokenString
{
  return self->_spokenString;
}

- (LNDeferredLocalizedString)printedString
{
  return self->_printedString;
}

- (LNDeferredLocalizedString)supportingString
{
  return self->_supportingString;
}

- (LNDeferredLocalizedString)fullString
{
  return self->_fullString;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LNBasicDialog;
  id v4 = a3;
  [(LNDialog *)&v7 encodeWithCoder:v4];
  v5 = [(LNBasicDialog *)self fullString];
  [v4 encodeObject:v5 forKey:@"fullString"];

  v6 = [(LNBasicDialog *)self supportingString];
  [v4 encodeObject:v6 forKey:@"supportingString"];
}

- (LNBasicDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullString"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportingString"];
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    if (v7)
    {
      self = [(LNBasicDialog *)self initWithFullString:v5 supportingString:v6 localeIdentifier:v7];
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNBasicDialog *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)LNBasicDialog;
    if ([(LNDialog *)&v18 isEqual:v4])
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_22:

        goto LABEL_23;
      }
      v6 = [(LNBasicDialog *)self fullString];
      objc_super v7 = [(LNBasicDialog *)v5 fullString];
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
        if (!v8 || !v9)
        {
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11) {
          goto LABEL_21;
        }
      }
      v14 = [(LNBasicDialog *)self supportingString];
      v15 = [(LNBasicDialog *)v5 supportingString];
      id v13 = v14;
      id v16 = v15;
      v12 = v16;
      if (v13 == v16)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v13 && v16) {
          LOBYTE(v11) = [v13 isEqual:v16];
        }
      }

      goto LABEL_20;
    }
    LOBYTE(v11) = 0;
  }
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)LNBasicDialog;
  unint64_t v3 = [(LNDialog *)&v9 hash];
  id v4 = [(LNBasicDialog *)self fullString];
  uint64_t v5 = [v4 hash];
  v6 = [(LNBasicDialog *)self supportingString];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (LNBasicDialog)initWithPrintedString:(id)a3 spokenString:(id)a4 localeIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNBasicDialog.m", 42, @"Invalid parameter not satisfying: %@", @"printedString" object file lineNumber description];
  }
  v12 = [(LNBasicDialog *)self initWithFullString:v9 supportingString:0 localeIdentifier:v11];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    printedString = v12->_printedString;
    v12->_printedString = (LNDeferredLocalizedString *)v13;

    uint64_t v15 = [v10 copy];
    spokenString = v12->_spokenString;
    v12->_spokenString = (LNDeferredLocalizedString *)v15;

    v17 = v12;
  }

  return v12;
}

- (LNBasicDialog)initWithFullString:(id)a3 supportingString:(id)a4 localeIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNBasicDialog.m", 20, @"Invalid parameter not satisfying: %@", @"fullString" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNBasicDialog;
  v12 = [(LNDialog *)&v22 initWithLocaleIdentifier:v11];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    fullString = v12->_fullString;
    v12->_fullString = (LNDeferredLocalizedString *)v13;

    uint64_t v15 = [v10 copy];
    supportingString = v12->_supportingString;
    v12->_supportingString = (LNDeferredLocalizedString *)v15;

    uint64_t v17 = [v9 copy];
    printedString = v12->_printedString;
    v12->_printedString = (LNDeferredLocalizedString *)v17;

    v19 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end