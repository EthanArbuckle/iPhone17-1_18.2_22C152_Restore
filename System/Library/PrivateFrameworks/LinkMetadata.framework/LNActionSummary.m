@interface LNActionSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionSummary)initWithCoder:(id)a3;
- (LNActionSummary)initWithSummaryString:(id)a3 bundleURL:(id)a4 table:(id)a5 otherParameterIdentifiers:(id)a6;
- (LNActionSummaryString)summaryString;
- (NSArray)otherParameterIdentifiers;
- (NSString)table;
- (NSURL)bundleURL;
- (id)actionConfigurationByEvaluatingAction:(id)a3;
- (id)description;
- (id)localizedFormatStringForLocaleIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)localizedFormatStringForLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionSummary *)self summaryString];

  if (v5)
  {
    v6 = [LNStaticDeferredLocalizedString alloc];
    v7 = [(LNActionSummary *)self summaryString];
    v8 = [v7 formatString];
    v9 = [(LNActionSummary *)self table];
    v10 = [(LNActionSummary *)self bundleURL];
    v11 = [(LNStaticDeferredLocalizedString *)v6 initWithKey:v8 table:v9 bundleURL:v10];

    v12 = [(LNStaticDeferredLocalizedString *)v11 localizedStringForLocaleIdentifier:v4];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNActionSummaryString)summaryString
{
  return self->_summaryString;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionSummary *)self summaryString];
  [v4 encodeObject:v5 forKey:@"summaryString"];

  v6 = [(LNActionSummary *)self bundleURL];
  [v4 encodeObject:v6 forKey:@"bundleURL"];

  v7 = [(LNActionSummary *)self table];
  [v4 encodeObject:v7 forKey:@"table"];

  id v8 = [(LNActionSummary *)self otherParameterIdentifiers];
  [v4 encodeObject:v8 forKey:@"otherParameterIdentifiers"];
}

- (NSString)table
{
  return self->_table;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSArray)otherParameterIdentifiers
{
  return self->_otherParameterIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherParameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
}

- (LNActionSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"otherParameterIdentifiers"];

  if (v8)
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summaryString"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"table"];
    self = [(LNActionSummary *)self initWithSummaryString:v9 bundleURL:v10 table:v11 otherParameterIdentifiers:v8];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNActionSummary)initWithSummaryString:(id)a3 bundleURL:(id)a4 table:(id)a5 otherParameterIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LNActionSummary.m", 23, @"Invalid parameter not satisfying: %@", @"otherParameterIdentifiers" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)LNActionSummary;
  v15 = [(LNActionSummary *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    summaryString = v15->_summaryString;
    v15->_summaryString = (LNActionSummaryString *)v16;

    uint64_t v18 = [v12 copy];
    bundleURL = v15->_bundleURL;
    v15->_bundleURL = (NSURL *)v18;

    uint64_t v20 = [v13 copy];
    table = v15->_table;
    v15->_table = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    otherParameterIdentifiers = v15->_otherParameterIdentifiers;
    v15->_otherParameterIdentifiers = (NSArray *)v22;

    v24 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionSummary *)a3;
  v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    v7 = [(LNActionSummary *)self summaryString];
    id v8 = [(LNActionSummary *)v6 summaryString];
    id v9 = v7;
    id v10 = v8;
    id v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_33;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    uint64_t v16 = [(LNActionSummary *)self bundleURL];
    v17 = [(LNActionSummary *)v6 bundleURL];
    id v14 = v16;
    id v18 = v17;
    id v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_32;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    uint64_t v22 = [(LNActionSummary *)self table];
    v23 = [(LNActionSummary *)v6 table];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      id v26 = v20;
      if (!v20 || !v24) {
        goto LABEL_28;
      }
      LODWORD(v12) = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_32;
      }
    }
    v38 = v19;
    objc_super v27 = [(LNActionSummary *)self otherParameterIdentifiers];
    v28 = [(LNActionSummary *)v6 otherParameterIdentifiers];

    if (v27 == v28)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      id v12 = [(LNActionSummary *)self otherParameterIdentifiers];
      if (v12)
      {
        v29 = [(LNActionSummary *)v6 otherParameterIdentifiers];

        if (v29)
        {
          v30 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v37 = [(LNActionSummary *)self otherParameterIdentifiers];
          v36 = [v30 setWithArray:v37];
          v31 = (void *)MEMORY[0x1E4F1CAD0];
          v32 = [(LNActionSummary *)v6 otherParameterIdentifiers];
          v33 = [v31 setWithArray:v32];
          LOBYTE(v12) = [v36 isEqualToSet:v33];

          v25 = v36;
          id v26 = (id)v37;
          v19 = v38;
LABEL_28:
          v34 = v26;

LABEL_32:
          goto LABEL_33;
        }
        LOBYTE(v12) = 0;
      }
    }
    v19 = v38;
    goto LABEL_32;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return (char)v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionSummary *)self summaryString];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionSummary *)self bundleURL];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNActionSummary *)self table];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNActionSummary *)self otherParameterIdentifiers];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNActionSummary *)self summaryString];
  v7 = [(LNActionSummary *)self bundleURL];
  uint64_t v8 = [(LNActionSummary *)self table];
  id v9 = [(LNActionSummary *)self otherParameterIdentifiers];
  unint64_t v10 = [v9 valueForKeyPath:@"description"];
  id v11 = [v10 componentsJoinedByString:@", "];
  id v12 = [v3 stringWithFormat:@"<%@: %p, summaryString: %@, bundleURL: %@, table: %@, otherParameterIdentifiers: [%@]>", v5, self, v6, v7, v8, v11];

  return v12;
}

- (id)actionConfigurationByEvaluatingAction:(id)a3
{
  return [(LNActionSummary *)self actionConfigurationByEvaluatingAction:a3 context:0];
}

@end