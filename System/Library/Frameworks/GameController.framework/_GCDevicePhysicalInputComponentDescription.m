@interface _GCDevicePhysicalInputComponentDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)update:(id)a3 withContext:(id)a4;
- (NSArray)elementDescriptions;
- (NSObject)identifier;
- (_GCDevicePhysicalInputComponentDescription)init;
- (_GCDevicePhysicalInputComponentDescription)initWithCoder:(id)a3;
- (_GCDevicePhysicalInputComponentDescription)initWithIdentifier:(id)a3 elements:(id)a4 bindings:(id)a5;
- (id)createWithContext:(id)a3;
- (id)materializeWithContext:(id)a3;
- (void)_applyBinding:(id)a3 toComponent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCDevicePhysicalInputComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCDevicePhysicalInputComponentDescription)initWithIdentifier:(id)a3 elements:(id)a4 bindings:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputComponentDescription;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(_GCDevicePhysicalInputComponentDescription *)&v18 init];
  uint64_t v11 = objc_msgSend(v9, "copyWithZone:", 0, v18.receiver, v18.super_class);

  identifier = v10->_identifier;
  v10->_identifier = v11;

  uint64_t v13 = [v8 copy];
  elementDescriptions = v10->_elementDescriptions;
  v10->_elementDescriptions = (NSArray *)v13;

  uint64_t v15 = [v7 copy];
  bindingDescriptions = v10->_bindingDescriptions;
  v10->_bindingDescriptions = (NSArray *)v15;

  return v10;
}

- (_GCDevicePhysicalInputComponentDescription)init
{
  return 0;
}

- (_GCDevicePhysicalInputComponentDescription)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__onceToken_1;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_50);
  }
  v6 = GCIPCObjectIdentifier_Classes();
  id v7 = [v5 decodeObjectOfClasses:v6 forKey:@"identifier"];

  uint64_t v8 = objc_opt_class();
  id v9 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"elements"];

  uint64_t v11 = [v5 decodeObjectOfClasses:initWithCoder__BindingClasses_1 forKey:@"bindings"];

  v12 = [(_GCDevicePhysicalInputComponentDescription *)self initWithIdentifier:v7 elements:v10 bindings:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_elementDescriptions forKey:@"elements"];
  [v5 encodeObject:self->_bindingDescriptions forKey:@"bindings"];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedInputProfile = self->_materializedInputProfile;
  if (materializedInputProfile) {
    goto LABEL_2;
  }
  id v7 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_bindingDescriptions;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "materializeWithContext:", v4, (void)v19);
      if (!v13) {
        break;
      }
      v14 = (void *)v13;
      [v7 addObject:v13];

      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  uint64_t v15 = [v7 count];
  if (v15 == [(NSArray *)self->_bindingDescriptions count])
  {
    v16 = [(_GCDevicePhysicalInputComponentDescription *)self createWithContext:v4];
    v17 = self->_materializedInputProfile;
    self->_materializedInputProfile = v16;

    if (self->_materializedInputProfile)
    {
      -[_GCDevicePhysicalInputComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v7);

      materializedInputProfile = self->_materializedInputProfile;
LABEL_2:
      v6 = materializedInputProfile;
      goto LABEL_15;
    }
  }

  v6 = 0;
LABEL_15:

  return v6;
}

- (id)createWithContext:(id)a3
{
  id v4 = [GCPhysicalInputProfile alloc];
  id v5 = [(_GCDevicePhysicalInputComponentDescription *)self identifier];
  v6 = [(GCPhysicalInputProfile *)v4 initWithIdentifier:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_elementDescriptions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = -[GCPhysicalInputProfile _directionPadWithDescription:](v6, "_directionPadWithDescription:", v12, (void)v16);
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)update:(id)a3 withContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  uint64_t v10 = [(_GCDevicePhysicalInputComponentDescription *)self identifier];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v23 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v23 handleFailureInMethod:a2 object:self file:@"GCPhysicalInputProfile.m" lineNumber:1522 description:&stru_26D27BBB8];
  }
  uint64_t v12 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = self->_bindingDescriptions;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
LABEL_5:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v25 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v17), "materializeWithContext:", v8, (void)v24);
      if (!v18) {
        break;
      }
      long long v19 = (void *)v18;
      [v12 addObject:v18];

      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  uint64_t v20 = [v12 count];
  NSUInteger v21 = [(NSArray *)self->_bindingDescriptions count];
  if (v20 == v21) {
    [(_GCDevicePhysicalInputComponentDescription *)self _applyBinding:v12 toComponent:v7];
  }

  return v20 == v21;
}

- (void)_applyBinding:(id)a3 toComponent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_26D28E4D8])
  {
    [(GCPhysicalInputProfile *)self->_materializedInputProfile setGamepadEventSource:0];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v13 conformsToProtocol:&unk_26D290130]) {
            [(GCPhysicalInputProfile *)self->_materializedInputProfile setGamepadEventSource:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }
  }
  if ([v7 conformsToProtocol:&unk_26D2A0018])
  {
    [(GCPhysicalInputProfile *)self->_materializedInputProfile setKeyboardEventSource:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_26D289678, (void)v20)) {
            [(GCPhysicalInputProfile *)self->_materializedInputProfile setKeyboardEventSource:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }
  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSArray)elementDescriptions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedInputProfile, 0);
  objc_storeStrong((id *)&self->_bindingDescriptions, 0);

  objc_storeStrong((id *)&self->_elementDescriptions, 0);
}

@end