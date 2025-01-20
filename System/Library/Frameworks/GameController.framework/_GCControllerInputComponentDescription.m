@interface _GCControllerInputComponentDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)update:(id)a3 withContext:(id)a4;
- (NSObject)identifier;
- (_GCControllerInputComponentDescription)init;
- (_GCControllerInputComponentDescription)initWithCoder:(id)a3;
- (_GCControllerInputComponentDescription)initWithIdentifier:(id)a3 controllerInputs:(id)a4 bindings:(id)a5;
- (_GCControllerInputDescription)controllerInputDescriptions;
- (id)createWithContext:(id)a3;
- (id)materializeWithContext:(id)a3;
- (void)_applyBinding:(id)a3 toComponent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCControllerInputComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCControllerInputComponentDescription)initWithIdentifier:(id)a3 controllerInputs:(id)a4 bindings:(id)a5
{
  v8 = (_GCControllerInputDescription *)a4;
  v19.receiver = self;
  v19.super_class = (Class)_GCControllerInputComponentDescription;
  id v9 = a5;
  id v10 = a3;
  v11 = [(_GCControllerInputComponentDescription *)&v19 init];
  uint64_t v12 = objc_msgSend(v10, "copyWithZone:", 0, v19.receiver, v19.super_class);

  identifier = v11->_identifier;
  v11->_identifier = v12;

  controllerInputDescriptions = v11->_controllerInputDescriptions;
  v11->_controllerInputDescriptions = v8;
  v15 = v8;

  uint64_t v16 = [v9 copy];
  bindingDescriptions = v11->_bindingDescriptions;
  v11->_bindingDescriptions = (NSArray *)v16;

  return v11;
}

- (_GCControllerInputComponentDescription)init
{
  return 0;
}

- (_GCControllerInputComponentDescription)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__onceToken_0;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_207);
  }
  v6 = GCIPCObjectIdentifier_Classes();
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"identifier"];

  v8 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"input"];

  id v10 = [v5 decodeObjectOfClasses:initWithCoder__BindingClasses_0 forKey:@"bindings"];

  v11 = [(_GCControllerInputComponentDescription *)self initWithIdentifier:v7 controllerInputs:v9 bindings:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_controllerInputDescriptions forKey:@"input"];
  [v5 encodeObject:self->_bindingDescriptions forKey:@"bindings"];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedInputComponent = self->_materializedInputComponent;
  if (materializedInputComponent) {
    goto LABEL_2;
  }
  v7 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = self->_bindingDescriptions;
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
    uint64_t v16 = [(_GCControllerInputComponentDescription *)self createWithContext:v4];
    v17 = self->_materializedInputComponent;
    self->_materializedInputComponent = v16;

    if (self->_materializedInputComponent)
    {
      -[_GCControllerInputComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v7);

      materializedInputComponent = self->_materializedInputComponent;
LABEL_2:
      v6 = materializedInputComponent;
      goto LABEL_15;
    }
  }

  v6 = 0;
LABEL_15:

  return v6;
}

- (id)createWithContext:(id)a3
{
  id v4 = [(GCDevicePhysicalInputDescription *)self->_controllerInputDescriptions makeFacadeParameters];
  id v5 = [(_GCControllerInputDescription *)self->_controllerInputDescriptions elements];
  v6 = objc_msgSend(v5, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_221_0);

  v7 = [[_GCControllerInputComponent alloc] initWithIdentifier:self->_identifier templateFacadeParameters:v4 templateElementParameters:v6];

  return v7;
}

- (BOOL)update:(id)a3 withContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  uint64_t v10 = [(_GCControllerInputComponentDescription *)self identifier];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v23 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v23 handleFailureInMethod:a2 object:self file:@"_GCControllerInputComponent.m" lineNumber:669 description:&stru_26D27BBB8];
  }
  uint64_t v12 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = self->_bindingDescriptions;
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
    [(_GCControllerInputComponentDescription *)self _applyBinding:v12 toComponent:v7];
  }

  return v20 == v21;
}

- (void)_applyBinding:(id)a3 toComponent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 conformsToProtocol:&unk_26D28E4D8])
  {
    [v6 setGamepadEventSource:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_26D290130, (void)v13)) {
            [v6 setGamepadEventSource:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (_GCControllerInputDescription)controllerInputDescriptions
{
  return (_GCControllerInputDescription *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedInputComponent, 0);
  objc_storeStrong((id *)&self->_bindingDescriptions, 0);

  objc_storeStrong((id *)&self->_controllerInputDescriptions, 0);
}

@end