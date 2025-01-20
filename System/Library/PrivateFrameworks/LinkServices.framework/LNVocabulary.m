@interface LNVocabulary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNVocabulary)initWithCoder:(id)a3;
- (LNVocabulary)initWithTerm:(id)a3 appSettingName:(id)a4;
- (LNVocabulary)initWithTerm:(id)a3 entityIdentifier:(id)a4;
- (LNVocabulary)initWithTerm:(id)a3 entityTypeName:(id)a4;
- (LNVocabulary)initWithTerm:(id)a3 traits:(id)a4;
- (NSDictionary)traits;
- (NSString)term;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNVocabulary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

- (NSDictionary)traits
{
  return self->_traits;
}

- (NSString)term
{
  return self->_term;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNVocabulary *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNVocabulary *)self term];
    v8 = [(LNVocabulary *)v6 term];
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
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNVocabulary *)self traits];
    v16 = [(LNVocabulary *)v6 traits];
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
        LOBYTE(v12) = [v14 isEqualToDictionary:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNVocabulary *)self term];
  uint64_t v4 = [v3 hash];
  v5 = [(LNVocabulary *)self traits];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNVocabulary *)self term];
  v7 = [(LNVocabulary *)self traits];
  v8 = [v3 stringWithFormat:@"<%@: %p, term: %@, traits: %@>", v5, self, v6, v7];

  return v8;
}

- (LNVocabulary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"term"];
  unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"traits"];

  if (v5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    self = [(LNVocabulary *)self initWithTerm:v5 traits:v9];
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNVocabulary *)self term];
  [v4 encodeObject:v5 forKey:@"term"];

  id v6 = [(LNVocabulary *)self traits];
  [v4 encodeObject:v6 forKey:@"traits"];
}

- (LNVocabulary)initWithTerm:(id)a3 entityIdentifier:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v16[0] = @"appEntity";
  v15[0] = @"model";
  v15[1] = @"id";
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 instanceIdentifier];
  id v9 = (void *)[v8 copy];
  v16[1] = v9;
  v15[2] = @"name";
  BOOL v10 = [v6 typeIdentifier];

  v11 = (void *)[v10 copy];
  v16[2] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v13 = [(LNVocabulary *)self initWithTerm:v7 traits:v12];

  return v13;
}

- (LNVocabulary)initWithTerm:(id)a3 entityTypeName:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"model";
  v11[1] = @"name";
  v12[0] = @"appEntityType";
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [(LNVocabulary *)self initWithTerm:v6 traits:v8];

  return v9;
}

- (LNVocabulary)initWithTerm:(id)a3 appSettingName:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"model";
  v11[1] = @"name";
  v12[0] = @"appSetting";
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [(LNVocabulary *)self initWithTerm:v6 traits:v8];

  return v9;
}

- (LNVocabulary)initWithTerm:(id)a3 traits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNVocabulary.m", 25, @"Invalid parameter not satisfying: %@", @"term" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNVocabulary.m", 26, @"Invalid parameter not satisfying: %@", @"traits" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNVocabulary;
  BOOL v10 = [(LNVocabulary *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    term = v10->_term;
    v10->_term = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    traits = v10->_traits;
    v10->_traits = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end