@interface LNBasePhraseTemplateSubstitution
+ (BOOL)supportsSecureCoding;
- (LNBasePhraseTemplateSubstitution)initWithBasePhraseTemplate:(id)a3 parameterSubstitutions:(id)a4;
- (LNBasePhraseTemplateSubstitution)initWithCoder:(id)a3;
- (NSArray)parameterSubstitutions;
- (NSString)basePhraseTemplate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNBasePhraseTemplateSubstitution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSubstitutions, 0);
  objc_storeStrong((id *)&self->_basePhraseTemplate, 0);
}

- (NSArray)parameterSubstitutions
{
  return self->_parameterSubstitutions;
}

- (NSString)basePhraseTemplate
{
  return self->_basePhraseTemplate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNBasePhraseTemplateSubstitution *)self basePhraseTemplate];
  [v4 encodeObject:v5 forKey:@"basePhraseTemplate"];

  id v6 = [(LNBasePhraseTemplateSubstitution *)self parameterSubstitutions];
  [v4 encodeObject:v6 forKey:@"parameterSubstitutions"];
}

- (LNBasePhraseTemplateSubstitution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"basePhraseTemplate"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parameterSubstitutions"];

    if (v9)
    {
      self = [(LNBasePhraseTemplateSubstitution *)self initWithBasePhraseTemplate:v5 parameterSubstitutions:v9];
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

- (LNBasePhraseTemplateSubstitution)initWithBasePhraseTemplate:(id)a3 parameterSubstitutions:(id)a4
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
    [v17 handleFailureInMethod:a2, self, @"LNBasePhraseTemplateSubstitution.m", 18, @"Invalid parameter not satisfying: %@", @"basePhraseTemplate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNBasePhraseTemplateSubstitution.m", 19, @"Invalid parameter not satisfying: %@", @"parameterSubstitutions" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNBasePhraseTemplateSubstitution;
  v10 = [(LNBasePhraseTemplateSubstitution *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    basePhraseTemplate = v10->_basePhraseTemplate;
    v10->_basePhraseTemplate = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    parameterSubstitutions = v10->_parameterSubstitutions;
    v10->_parameterSubstitutions = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end