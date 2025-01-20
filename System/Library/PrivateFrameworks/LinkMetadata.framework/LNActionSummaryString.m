@interface LNActionSummaryString
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionSummaryString)initWithCoder:(id)a3;
- (LNActionSummaryString)initWithFormatString:(id)a3 parameterIdentifiers:(id)a4;
- (NSArray)parameterIdentifiers;
- (NSString)formatString;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionSummaryString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionSummaryString *)self formatString];
  [v4 encodeObject:v5 forKey:@"formatString"];

  id v6 = [(LNActionSummaryString *)self parameterIdentifiers];
  [v4 encodeObject:v6 forKey:@"parameterIdentifiers"];
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSArray)parameterIdentifiers
{
  return self->_parameterIdentifiers;
}

- (LNActionSummaryString)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatString"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parameterIdentifiers"];

    if (v9)
    {
      self = [(LNActionSummaryString *)self initWithFormatString:v5 parameterIdentifiers:v9];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LNActionSummaryString)initWithFormatString:(id)a3 parameterIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNActionSummaryString.m", 18, @"Invalid parameter not satisfying: %@", @"formatString" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNActionSummaryString.m", 19, @"Invalid parameter not satisfying: %@", @"parameterIdentifiers" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNActionSummaryString;
  v10 = [(LNActionSummaryString *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    formatString = v10->_formatString;
    v10->_formatString = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    parameterIdentifiers = v10->_parameterIdentifiers;
    v10->_parameterIdentifiers = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionSummaryString *)a3;
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
    id v7 = [(LNActionSummaryString *)self formatString];
    id v8 = [(LNActionSummaryString *)v6 formatString];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
      v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_16;
      }
      LODWORD(v12) = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNActionSummaryString *)self parameterIdentifiers];
    v16 = [(LNActionSummaryString *)v6 parameterIdentifiers];

    if (v15 == v16)
    {
      LOBYTE(v12) = 1;
      goto LABEL_19;
    }
    v12 = [(LNActionSummaryString *)self parameterIdentifiers];
    if (!v12)
    {
LABEL_19:

      goto LABEL_20;
    }
    v17 = [(LNActionSummaryString *)v6 parameterIdentifiers];

    if (!v17)
    {
      LOBYTE(v12) = 0;
      goto LABEL_19;
    }
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v14 = [(LNActionSummaryString *)self parameterIdentifiers];
    uint64_t v13 = [v12 setWithArray:v14];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v19 = [(LNActionSummaryString *)v6 parameterIdentifiers];
    v20 = [v18 setWithArray:v19];
    LOBYTE(v12) = [v13 isEqualToSet:v20];

LABEL_16:
    goto LABEL_19;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return (char)v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionSummaryString *)self formatString];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionSummaryString *)self parameterIdentifiers];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNActionSummaryString *)self formatString];
  id v7 = [(LNActionSummaryString *)self parameterIdentifiers];
  id v8 = [v7 valueForKeyPath:@"description"];
  id v9 = [v8 componentsJoinedByString:@", "];
  id v10 = [v3 stringWithFormat:@"<%@: %p, formatString: %@, parameterIdentifiers: [%@]>", v5, self, v6, v9];

  return v10;
}

@end