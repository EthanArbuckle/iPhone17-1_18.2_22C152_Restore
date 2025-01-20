@interface HFNamingComponents
+ (id)namingComponentFromAccessory:(id)a3;
+ (id)namingComponentFromDiscoveredAccessory:(id)a3;
+ (id)namingComponentFromHomeKitObject:(id)a3;
+ (id)namingComponentFromMediaProfile:(id)a3;
+ (id)namingComponentFromMediaSystem:(id)a3;
+ (id)namingComponentFromService:(id)a3;
+ (id)namingComponentFromServiceGroup:(id)a3;
- (BOOL)allowsEmptyNameTextField;
- (BOOL)allowsNullResettableName;
- (BOOL)isAccessory;
- (BOOL)isChildService;
- (BOOL)isDiscoveredAccessory;
- (BOOL)isMediaAccessoryOrStereoPair;
- (BOOL)isService;
- (BOOL)isServiceGroup;
- (BOOL)isTelevision;
- (HFNamingComponents)initWithHomeKitObject:(id)a3;
- (NSString)defaultName;
- (NSString)name;
- (NSString)placeholderText;
- (NSString)textFieldDisplayText;
- (id)categoryName;
- (id)commitableNameForString:(id)a3;
- (id)configuredName;
- (id)description;
- (id)homeKitObject;
- (id)homeKitSafeStringForString:(id)a3;
- (id)roomName;
- (void)setAllowsEmptyNameTextField:(BOOL)a3;
- (void)setAllowsNullResettableName:(BOOL)a3;
- (void)setIsAccessory:(BOOL)a3;
- (void)setIsChildService:(BOOL)a3;
- (void)setIsDiscoveredAccessory:(BOOL)a3;
- (void)setIsMediaAccessoryOrStereoPair:(BOOL)a3;
- (void)setIsService:(BOOL)a3;
- (void)setIsServiceGroup:(BOOL)a3;
- (void)setIsTelevision:(BOOL)a3;
@end

@implementation HFNamingComponents

- (void).cxx_destruct
{
}

- (NSString)name
{
  if ([(HFNamingComponents *)self isMediaAccessoryOrStereoPair])
  {
LABEL_2:
    v3 = [(HFNamingComponents *)self configuredName];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(HFNamingComponents *)self categoryName];
    }
    goto LABEL_10;
  }
  if ([(HFNamingComponents *)self isTelevision])
  {
    v6 = [(HFNamingComponents *)self defaultName];
    v7 = [(HFNamingComponents *)self configuredName];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = [(HFNamingComponents *)self categoryName];
      goto LABEL_12;
    }
    goto LABEL_2;
  }
  v10 = [(HFNamingComponents *)self homeKitObject];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    objc_opt_class();
    v13 = [(HFNamingComponents *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v4 = v14;

    if (v4)
    {
      v15 = [v4 accessory];
      v9 = [v15 name];
    }
    else
    {
      v15 = [(HFNamingComponents *)self homeKitObject];
      NSLog(&cfstr_CouldNotDeterm.isa, v15);
      v9 = 0;
    }

    goto LABEL_11;
  }
  id v4 = [(HFNamingComponents *)self homeKitObject];
  id v5 = [v4 name];
LABEL_10:
  v9 = v5;
LABEL_11:

LABEL_12:
  return (NSString *)v9;
}

- (id)homeKitObject
{
  return self->_homeKitObject;
}

- (BOOL)isTelevision
{
  return self->_isTelevision;
}

- (BOOL)isMediaAccessoryOrStereoPair
{
  return self->_isMediaAccessoryOrStereoPair;
}

+ (id)namingComponentFromService:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeKitObject:v3];
  [v4 setIsService:1];
  id v5 = objc_msgSend(v3, "hf_parentService");
  [v4 setIsChildService:v5 != 0];

  [v4 setAllowsNullResettableName:0];
  objc_msgSend(v4, "setIsTelevision:", objc_msgSend(v3, "hf_isTelevision"));
  uint64_t v6 = objc_msgSend(v3, "hf_isTelevision");

  [v4 setAllowsEmptyNameTextField:v6];
  return v4;
}

- (HFNamingComponents)initWithHomeKitObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFNamingComponents;
  uint64_t v6 = [(HFNamingComponents *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_homeKitObject, a3);
    [(HFNamingComponents *)v7 setAllowsEmptyNameTextField:0];
    [(HFNamingComponents *)v7 setAllowsNullResettableName:0];
    [(HFNamingComponents *)v7 setIsAccessory:0];
    [(HFNamingComponents *)v7 setIsDiscoveredAccessory:0];
    [(HFNamingComponents *)v7 setIsService:0];
    [(HFNamingComponents *)v7 setIsChildService:0];
    [(HFNamingComponents *)v7 setIsServiceGroup:0];
    [(HFNamingComponents *)v7 setIsMediaAccessoryOrStereoPair:0];
    [(HFNamingComponents *)v7 setIsTelevision:0];
  }

  return v7;
}

- (void)setIsTelevision:(BOOL)a3
{
  self->_isTelevision = a3;
}

- (void)setAllowsNullResettableName:(BOOL)a3
{
  self->_allowsNullResettableName = a3;
}

- (void)setAllowsEmptyNameTextField:(BOOL)a3
{
  self->_allowsEmptyNameTextField = a3;
}

- (void)setIsService:(BOOL)a3
{
  self->_isService = a3;
}

- (void)setIsChildService:(BOOL)a3
{
  self->_isChildService = a3;
}

- (void)setIsMediaAccessoryOrStereoPair:(BOOL)a3
{
  self->_isMediaAccessoryOrStereoPair = a3;
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (void)setIsServiceGroup:(BOOL)a3
{
  self->_isServiceGroup = a3;
}

- (void)setIsDiscoveredAccessory:(BOOL)a3
{
  self->_isDiscoveredAccessory = a3;
}

+ (id)namingComponentFromAccessory:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeKitObject:v3];
  uint64_t v5 = 1;
  [v4 setIsAccessory:1];
  objc_msgSend(v4, "setIsMediaAccessoryOrStereoPair:", objc_msgSend(v3, "hf_isMediaAccessory"));
  objc_msgSend(v4, "setIsTelevision:", objc_msgSend(v3, "hf_isTelevision"));
  objc_msgSend(v4, "setAllowsNullResettableName:", objc_msgSend(v3, "hf_isMediaAccessory"));
  if ((objc_msgSend(v3, "hf_isMediaAccessory") & 1) == 0) {
    uint64_t v5 = objc_msgSend(v3, "hf_isTelevision");
  }
  [v4 setAllowsEmptyNameTextField:v5];

  return v4;
}

+ (id)namingComponentFromServiceGroup:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeKitObject:v3];

  [v4 setIsServiceGroup:1];
  [v4 setAllowsNullResettableName:0];
  return v4;
}

+ (id)namingComponentFromMediaProfile:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [v3 accessory];

  uint64_t v6 = (void *)[v4 initWithHomeKitObject:v5];
  [v6 setIsAccessory:1];
  [v6 setIsMediaAccessoryOrStereoPair:1];
  [v6 setIsTelevision:0];
  [v6 setAllowsNullResettableName:1];
  [v6 setAllowsEmptyNameTextField:1];
  return v6;
}

+ (id)namingComponentFromMediaSystem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeKitObject:v3];

  [v4 setIsMediaAccessoryOrStereoPair:1];
  [v4 setAllowsNullResettableName:1];
  [v4 setAllowsEmptyNameTextField:1];
  return v4;
}

+ (id)namingComponentFromDiscoveredAccessory:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeKitObject:v3];
  [v4 setIsDiscoveredAccessory:1];
  uint64_t v5 = [v3 accessory];
  objc_msgSend(v4, "setIsMediaAccessoryOrStereoPair:", objc_msgSend(v5, "hf_isMediaAccessory"));

  uint64_t v6 = [v3 accessory];

  objc_msgSend(v4, "setIsTelevision:", objc_msgSend(v6, "hf_isTelevision"));
  return v4;
}

+ (id)namingComponentFromHomeKitObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(id)objc_opt_class() namingComponentFromService:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [(id)objc_opt_class() namingComponentFromAccessory:v3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [(id)objc_opt_class() namingComponentFromMediaProfile:v3];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v4 = [(id)objc_opt_class() namingComponentFromMediaSystem:v3];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v6 = objc_opt_class();
          if (isKindOfClass)
          {
            uint64_t v4 = [v6 namingComponentFromServiceGroup:v3];
          }
          else
          {
            uint64_t v4 = [objc_alloc((Class)v6) initWithHomeKitObject:v3];
          }
        }
      }
    }
  }
  v7 = (void *)v4;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = [(HFNamingComponents *)self name];
  id v5 = (id)[v3 appendObject:v4 withName:@"name"];

  uint64_t v6 = [(HFNamingComponents *)self placeholderText];
  id v7 = (id)[v3 appendObject:v6 withName:@"placeholder text"];

  int v8 = [(HFNamingComponents *)self textFieldDisplayText];
  id v9 = (id)[v3 appendObject:v8 withName:@"text field text"];

  v10 = [v3 build];

  return v10;
}

- (NSString)placeholderText
{
  if ([(HFNamingComponents *)self isTelevision])
  {
    id v3 = [(HFNamingComponents *)self categoryName];
  }
  else
  {
    uint64_t v4 = [(HFNamingComponents *)self defaultName];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(HFNamingComponents *)self name];
    }
    id v3 = v6;
  }
  return (NSString *)v3;
}

- (NSString)textFieldDisplayText
{
  if ([(HFNamingComponents *)self allowsEmptyNameTextField])
  {
    if ([(HFNamingComponents *)self isMediaAccessoryOrStereoPair])
    {
      id v3 = [(HFNamingComponents *)self defaultName];

      uint64_t v4 = [(HFNamingComponents *)self name];
      id v5 = self;
      if (!v3)
      {
        uint64_t v6 = [(HFNamingComponents *)self roomName];
LABEL_9:
        int v8 = (void *)v6;
        if ([v4 isEqualToString:v6])
        {
          id v9 = 0;
        }
        else
        {
          id v9 = [(HFNamingComponents *)self name];
        }

        goto LABEL_14;
      }
LABEL_8:
      uint64_t v6 = [(HFNamingComponents *)v5 defaultName];
      goto LABEL_9;
    }
    if ([(HFNamingComponents *)self isTelevision])
    {
      id v7 = [(HFNamingComponents *)self defaultName];

      if (v7)
      {
        uint64_t v4 = [(HFNamingComponents *)self configuredName];
        id v5 = self;
        goto LABEL_8;
      }
    }
  }
  id v9 = [(HFNamingComponents *)self name];
LABEL_14:
  return (NSString *)v9;
}

- (id)homeKitSafeStringForString:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = [(HFNamingComponents *)self textFieldDisplayText];
    goto LABEL_15;
  }
  id v5 = +[HFUtilities sanitizeUserEnteredHomeKitName:v4];
  if ([v4 length])
  {
    id v6 = v5;
  }
  else
  {
    if ([(HFNamingComponents *)self allowsEmptyNameTextField])
    {
      id v7 = 0;
      goto LABEL_14;
    }
    if ([(HFNamingComponents *)self isChildService])
    {
      int v8 = [(HFNamingComponents *)self defaultName];
      id v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(HFNamingComponents *)self name];
      }
      id v7 = v10;

      goto LABEL_14;
    }
    id v6 = [(HFNamingComponents *)self textFieldDisplayText];
  }
  id v7 = v6;
LABEL_14:

LABEL_15:
  return v7;
}

- (id)commitableNameForString:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    goto LABEL_2;
  }
  if ([(HFNamingComponents *)self allowsNullResettableName])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(HFNamingComponents *)self defaultName];

    if (!v6)
    {
LABEL_2:
      id v5 = [(HFNamingComponents *)self homeKitSafeStringForString:v4];
      goto LABEL_7;
    }
    id v5 = [(HFNamingComponents *)self defaultName];
  }
LABEL_7:
  id v7 = v5;

  return v7;
}

- (id)roomName
{
  id v3 = [(HFNamingComponents *)self homeKitObject];
  int v4 = [v3 conformsToProtocol:&unk_26C1347C8];

  if (v4)
  {
    id v5 = [(HFNamingComponents *)self homeKitObject];
    id v6 = objc_msgSend(v5, "hf_parentRoom");
    id v7 = [v6 name];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (NSString)defaultName
{
  if ([(HFNamingComponents *)self isService])
  {
    objc_opt_class();
    id v3 = [(HFNamingComponents *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    if ([(HFNamingComponents *)self isMediaAccessoryOrStereoPair])
    {
      id v7 = [(HFNamingComponents *)self categoryName];
      id v5 = v7;
      if (v7)
      {
        id v6 = v7;
      }
      else
      {
        id v6 = [(HFNamingComponents *)self roomName];
      }
      goto LABEL_17;
    }
    if (![(HFNamingComponents *)self isTelevision])
    {
      char v11 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    int v8 = [(HFNamingComponents *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    objc_msgSend(v10, "hf_primaryService");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = [v5 defaultName];
LABEL_17:
  char v11 = v6;

LABEL_18:
  return (NSString *)v11;
}

- (id)configuredName
{
  id v3 = [(HFNamingComponents *)self homeKitObject];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HFNamingComponents *)self homeKitObject];
    id v6 = [v5 configuredName];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)categoryName
{
  if ([(HFNamingComponents *)self isAccessory])
  {
    objc_opt_class();
    id v3 = [(HFNamingComponents *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      char v4 = v3;
    }
    else {
      char v4 = 0;
    }
    id v5 = v4;

LABEL_12:
    id v9 = objc_msgSend(v5, "hf_userFriendlyLocalizedCapitalizedDescription");
LABEL_18:

    goto LABEL_19;
  }
  if ([(HFNamingComponents *)self isDiscoveredAccessory]) {
    goto LABEL_14;
  }
  if ([(HFNamingComponents *)self isService])
  {
    objc_opt_class();
    id v6 = [(HFNamingComponents *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v5 = [v8 accessory];

    goto LABEL_12;
  }
  if ([(HFNamingComponents *)self isMediaAccessoryOrStereoPair])
  {
LABEL_14:
    objc_opt_class();
    id v10 = [(HFNamingComponents *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      char v11 = v10;
    }
    else {
      char v11 = 0;
    }
    id v12 = v11;

    v13 = (void *)MEMORY[0x263F0DF00];
    id v5 = [v12 category];

    v14 = [v5 categoryType];
    id v9 = objc_msgSend(v13, "hf_userFriendlyLocalizedCapitalizedDescription:", v14);

    goto LABEL_18;
  }
  id v9 = 0;
LABEL_19:
  return v9;
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (BOOL)isDiscoveredAccessory
{
  return self->_isDiscoveredAccessory;
}

- (BOOL)isService
{
  return self->_isService;
}

- (BOOL)isChildService
{
  return self->_isChildService;
}

- (BOOL)isServiceGroup
{
  return self->_isServiceGroup;
}

- (BOOL)allowsEmptyNameTextField
{
  return self->_allowsEmptyNameTextField;
}

- (BOOL)allowsNullResettableName
{
  return self->_allowsNullResettableName;
}

@end