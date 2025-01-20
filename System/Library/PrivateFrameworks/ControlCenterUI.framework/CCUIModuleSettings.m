@interface CCUIModuleSettings
- (BOOL)isEqual:(id)a3;
- (CCUIModuleSettings)initWithGridSizeClass:(id)a3 containerBundleIdentifier:(id)a4;
- (CCUIModuleSettings)initWithGridSizeClass:(id)a3 moduleContainerBundleIdentifier:(id)a4 controlExtensionIdentifier:(id)a5 controlContainerBundleIdentifier:(id)a6 controlKind:(id)a7 controlType:(id)a8;
- (NSString)gridSizeClass;
- (NSString)moduleContainerBundleIdentifier;
- (NSString)parityControlContainerBundleIdentifier;
- (NSString)parityControlExtensionIdentifier;
- (NSString)parityControlKind;
- (NSString)parityControlType;
- (id)description;
- (unint64_t)hash;
- (void)setGridSizeClass:(id)a3;
@end

@implementation CCUIModuleSettings

- (CCUIModuleSettings)initWithGridSizeClass:(id)a3 moduleContainerBundleIdentifier:(id)a4 controlExtensionIdentifier:(id)a5 controlContainerBundleIdentifier:(id)a6 controlKind:(id)a7 controlType:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CCUIModuleSettings;
  v20 = [(CCUIModuleSettings *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    gridSizeClass = v20->_gridSizeClass;
    v20->_gridSizeClass = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    moduleContainerBundleIdentifier = v20->_moduleContainerBundleIdentifier;
    v20->_moduleContainerBundleIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    parityControlExtensionIdentifier = v20->_parityControlExtensionIdentifier;
    v20->_parityControlExtensionIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    parityControlContainerBundleIdentifier = v20->_parityControlContainerBundleIdentifier;
    v20->_parityControlContainerBundleIdentifier = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    parityControlKind = v20->_parityControlKind;
    v20->_parityControlKind = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    parityControlType = v20->_parityControlType;
    v20->_parityControlType = (NSString *)v31;
  }
  return v20;
}

- (CCUIModuleSettings)initWithGridSizeClass:(id)a3 containerBundleIdentifier:(id)a4
{
  return [(CCUIModuleSettings *)self initWithGridSizeClass:a3 moduleContainerBundleIdentifier:a4 controlExtensionIdentifier:0 controlContainerBundleIdentifier:0 controlKind:0 controlType:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_gridSizeClass withName:@"Grid size class"];
  [v3 appendString:self->_moduleContainerBundleIdentifier withName:@"Container bundle identifier"];
  parityControlExtensionIdentifier = self->_parityControlExtensionIdentifier;
  if (parityControlExtensionIdentifier) {
    [v3 appendString:parityControlExtensionIdentifier withName:@"Parity control extension identifier"];
  }
  parityControlContainerBundleIdentifier = self->_parityControlContainerBundleIdentifier;
  if (parityControlContainerBundleIdentifier) {
    [v3 appendString:parityControlContainerBundleIdentifier withName:@"Parity control container bundle identifier"];
  }
  parityControlKind = self->_parityControlKind;
  if (parityControlKind) {
    [v3 appendString:parityControlKind withName:@"Parity control kind"];
  }
  parityControlType = self->_parityControlType;
  if (parityControlType) {
    [v3 appendString:parityControlType withName:@"Parity control type"];
  }
  v8 = [v3 build];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_gridSizeClass];
  id v5 = (id)[v3 appendString:self->_moduleContainerBundleIdentifier];
  if (self->_parityControlExtensionIdentifier) {
    id v6 = (id)objc_msgSend(v3, "appendString:");
  }
  if (self->_parityControlContainerBundleIdentifier) {
    id v7 = (id)objc_msgSend(v3, "appendString:");
  }
  if (self->_parityControlKind) {
    id v8 = (id)objc_msgSend(v3, "appendString:");
  }
  if (self->_parityControlType) {
    id v9 = (id)objc_msgSend(v3, "appendString:");
  }
  unint64_t v10 = [v3 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCUIModuleSettings *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      if (BSEqualStrings()
        && BSEqualStrings()
        && BSEqualStrings()
        && BSEqualStrings()
        && BSEqualStrings())
      {
        char v6 = BSEqualStrings();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)setGridSizeClass:(id)a3
{
}

- (NSString)moduleContainerBundleIdentifier
{
  return self->_moduleContainerBundleIdentifier;
}

- (NSString)parityControlExtensionIdentifier
{
  return self->_parityControlExtensionIdentifier;
}

- (NSString)parityControlContainerBundleIdentifier
{
  return self->_parityControlContainerBundleIdentifier;
}

- (NSString)parityControlKind
{
  return self->_parityControlKind;
}

- (NSString)parityControlType
{
  return self->_parityControlType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parityControlType, 0);
  objc_storeStrong((id *)&self->_parityControlKind, 0);
  objc_storeStrong((id *)&self->_parityControlContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_parityControlExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_moduleContainerBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_gridSizeClass, 0);
}

@end