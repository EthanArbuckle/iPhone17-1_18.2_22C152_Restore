@interface IAMChangedContextPropertiesTriggerContext
- (BOOL)satisfiesPresentationTrigger:(id)a3;
- (IAMChangedContextPropertiesTriggerContext)initWithContextPropertyNames:(id)a3 bundleIdentifier:(id)a4;
- (NSSet)contextPropertyNames;
- (NSString)bundleIdentifier;
@end

@implementation IAMChangedContextPropertiesTriggerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPropertyNames, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (IAMChangedContextPropertiesTriggerContext)initWithContextPropertyNames:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMChangedContextPropertiesTriggerContext;
  v8 = [(IAMChangedContextPropertiesTriggerContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    contextPropertyNames = v8->_contextPropertyNames;
    v8->_contextPropertyNames = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;
  }
  return v8;
}

- (NSSet)contextPropertyNames
{
  return self->_contextPropertyNames;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)satisfiesPresentationTrigger:(id)a3
{
  id v4 = a3;
  if ([v4 hasKind] && objc_msgSend(v4, "kind") != 1) {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 bundleIdentifier];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v7 = [v4 bundleIdentifier];
  int v8 = [v7 isEqualToString:self->_bundleIdentifier];

  if (!v8)
  {
LABEL_6:
    BOOL v11 = 0;
  }
  else
  {
LABEL_5:
    contextPropertyNames = self->_contextPropertyNames;
    v10 = [v4 triggerName];
    BOOL v11 = [(NSSet *)contextPropertyNames containsObject:v10];
  }
  return v11;
}

@end