@interface INConfigurableDescriptor
- (BOOL)supportsIntent:(id)a3;
- (INConfigurableDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5;
- (NSString)extensionBundleIdentifier;
- (NSString)intentClassName;
- (NSString)kind;
- (id)_extensionRecordWithError:(id *)a3;
- (id)description;
@end

@implementation INConfigurableDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);

  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (id)_extensionRecordWithError:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
  v6 = [(INConfigurableDescriptor *)self extensionBundleIdentifier];
  v7 = (void *)[v5 initWithBundleIdentifier:v6 error:a3];

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"extensionBundleIdentifier: %@, kind: %@, intentClassName: %@", self->_extensionBundleIdentifier, self->_kind, self->_intentClassName];
}

- (BOOL)supportsIntent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;
  v7 = [v6 appIntentIdentifier];

  if (v7) {
    [NSString stringWithFormat:@"appintent:%@", v7];
  }
  else {
  v8 = [v4 _className];
  }
  v9 = [(INConfigurableDescriptor *)self intentClassName];
  int v10 = [v9 isEqualToString:v8];

  if (v10)
  {
    id v23 = 0;
    v11 = [(INConfigurableDescriptor *)self _extensionRecordWithError:&v23];
    id v12 = v23;
    if (v11)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F223C8]);
      v14 = objc_msgSend(v4, "_intents_bundleIdForLaunching");
      id v22 = v12;
      v15 = (void *)[v13 initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v22];
      id v16 = v22;

      if (v15)
      {
        v17 = [v11 containingBundleRecord];
        v18 = [v17 bundleIdentifier];
        v19 = [v15 bundleIdentifier];
        char v20 = [v18 isEqualToString:v19];
      }
      else
      {
        char v20 = 0;
      }

      id v12 = v16;
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (INConfigurableDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INConfigurableDescriptor;
  v11 = [(INConfigurableDescriptor *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    extensionBundleIdentifier = v11->_extensionBundleIdentifier;
    v11->_extensionBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    intentClassName = v11->_intentClassName;
    v11->_intentClassName = (NSString *)v16;
  }
  return v11;
}

@end