@interface LNDynamicOptionsResult
+ (BOOL)supportsSecureCoding;
- (BOOL)usesIndexedCollation;
- (LNDynamicOptionsResult)initWithCoder:(id)a3;
- (LNDynamicOptionsResult)initWithSections:(id)a3 usesIndexedCollation:(BOOL)a4 promptLabel:(id)a5 dependentParameterIdentifiers:(id)a6;
- (LNStaticDeferredLocalizedString)promptLabel;
- (NSArray)dependentParameterIdentifiers;
- (NSArray)sections;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDynamicOptionsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentParameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNDynamicOptionsResult *)self sections];
  [v4 encodeObject:v5 forKey:@"sections"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNDynamicOptionsResult usesIndexedCollation](self, "usesIndexedCollation"), @"usesIndexedCollation");
  v6 = [(LNDynamicOptionsResult *)self promptLabel];
  [v4 encodeObject:v6 forKey:@"promptLabel"];

  id v7 = [(LNDynamicOptionsResult *)self dependentParameterIdentifiers];
  [v4 encodeObject:v7 forKey:@"dependentParameterIdentifiers"];
}

- (NSArray)sections
{
  return self->_sections;
}

- (BOOL)usesIndexedCollation
{
  return self->_usesIndexedCollation;
}

- (LNStaticDeferredLocalizedString)promptLabel
{
  return self->_promptLabel;
}

- (NSArray)dependentParameterIdentifiers
{
  return self->_dependentParameterIdentifiers;
}

- (LNDynamicOptionsResult)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"sections"];

  uint64_t v9 = [v5 decodeBoolForKey:@"usesIndexedCollation"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"promptLabel"];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v5 decodeObjectOfClasses:v13 forKey:@"dependentParameterIdentifiers"];

  v15 = [(LNDynamicOptionsResult *)self initWithSections:v8 usesIndexedCollation:v9 promptLabel:v10 dependentParameterIdentifiers:v14];
  return v15;
}

- (LNDynamicOptionsResult)initWithSections:(id)a3 usesIndexedCollation:(BOOL)a4 promptLabel:(id)a5 dependentParameterIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"LNDynamicOptionsResult.m", 156, @"Invalid parameter not satisfying: %@", @"sections" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)LNDynamicOptionsResult;
  v14 = [(LNDynamicOptionsResult *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    sections = v14->_sections;
    v14->_sections = (NSArray *)v15;

    v14->_usesIndexedCollation = a4;
    uint64_t v17 = [v12 copy];
    promptLabel = v14->_promptLabel;
    v14->_promptLabel = (LNStaticDeferredLocalizedString *)v17;

    uint64_t v19 = [v13 copy];
    dependentParameterIdentifiers = v14->_dependentParameterIdentifiers;
    v14->_dependentParameterIdentifiers = (NSArray *)v19;

    v21 = v14;
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNDynamicOptionsResult *)self sections];
  id v7 = [v6 description];
  BOOL v8 = [(LNDynamicOptionsResult *)self usesIndexedCollation];
  uint64_t v9 = [(LNDynamicOptionsResult *)self promptLabel];
  v10 = [(LNDynamicOptionsResult *)self dependentParameterIdentifiers];
  id v11 = [v3 stringWithFormat:@"<%@: %p, sections: %@, usesIndexedCollation: %i, promptLabel: %@, dependentParameterIdentifiers: %@>", v5, self, v7, v8, v9, v10];

  return v11;
}

@end