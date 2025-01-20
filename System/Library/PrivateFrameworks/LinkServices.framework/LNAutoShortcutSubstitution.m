@interface LNAutoShortcutSubstitution
+ (BOOL)supportsSecureCoding;
- (LNAutoShortcutSubstitution)initWithActionIdentifier:(id)a3 basePhraseTemplateSubstitutions:(id)a4;
- (LNAutoShortcutSubstitution)initWithCoder:(id)a3;
- (NSArray)basePhraseTemplateSubstitutions;
- (NSString)actionIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAutoShortcutSubstitution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePhraseTemplateSubstitutions, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (NSArray)basePhraseTemplateSubstitutions
{
  return self->_basePhraseTemplateSubstitutions;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAutoShortcutSubstitution *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"actionIdentifier"];

  id v6 = [(LNAutoShortcutSubstitution *)self basePhraseTemplateSubstitutions];
  [v4 encodeObject:v6 forKey:@"basePhraseTemplateSubstitutions"];
}

- (LNAutoShortcutSubstitution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"basePhraseTemplateSubstitutions"];

    if (v9)
    {
      self = [(LNAutoShortcutSubstitution *)self initWithActionIdentifier:v5 basePhraseTemplateSubstitutions:v9];
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

- (LNAutoShortcutSubstitution)initWithActionIdentifier:(id)a3 basePhraseTemplateSubstitutions:(id)a4
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
    [v17 handleFailureInMethod:a2, self, @"LNAutoShortcutSubstitution.m", 18, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNAutoShortcutSubstitution.m", 19, @"Invalid parameter not satisfying: %@", @"basePhraseTemplateSubstitutions" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAutoShortcutSubstitution;
  v10 = [(LNAutoShortcutSubstitution *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    actionIdentifier = v10->_actionIdentifier;
    v10->_actionIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    basePhraseTemplateSubstitutions = v10->_basePhraseTemplateSubstitutions;
    v10->_basePhraseTemplateSubstitutions = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end