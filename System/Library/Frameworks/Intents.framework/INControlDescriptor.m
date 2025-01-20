@interface INControlDescriptor
- (INControlDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5 actionIntentType:(id)a6;
- (NSString)actionIntentType;
- (id)description;
@end

@implementation INControlDescriptor

- (void).cxx_destruct
{
}

- (NSString)actionIntentType
{
  return self->_actionIntentType;
}

- (id)description
{
  v3 = NSString;
  v4 = [(INConfigurableDescriptor *)self extensionBundleIdentifier];
  v5 = [(INConfigurableDescriptor *)self kind];
  v6 = [(INConfigurableDescriptor *)self intentClassName];
  v7 = [v3 stringWithFormat:@"extensionBundleIdentifier: %@, kind: %@, intentClassName: %@, actionIntentType: %@", v4, v5, v6, self->_actionIntentType];

  return v7;
}

- (INControlDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5 actionIntentType:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)INControlDescriptor;
  v11 = [(INConfigurableDescriptor *)&v15 initWithExtensionBundleIdentifier:a3 kind:a4 intentClassName:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    actionIntentType = v11->_actionIntentType;
    v11->_actionIntentType = (NSString *)v12;
  }
  return v11;
}

@end