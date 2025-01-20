@interface _GCControllerComponentDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)update:(id)a3 withContext:(id)a4;
- (NSObject)identifier;
- (NSString)debugDescription;
- (NSString)description;
- (_GCControllerComponentDescription)init;
- (_GCControllerComponentDescription)initWithCoder:(id)a3;
- (_GCControllerComponentDescription)initWithComponent:(id)a3;
- (_GCControllerComponentDescription)initWithComponent:(id)a3 bindings:(id)a4;
- (id)materializeWithContext:(id)a3;
- (id)redactedDescription;
- (void)_applyBinding:(id)a3 toComponent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCControllerComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCControllerComponentDescription)initWithComponent:(id)a3 bindings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCControllerComponentDescription;
  v9 = [(_GCControllerComponentDescription *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    uint64_t v11 = [v8 copy];
    bindingDescriptions = v10->_bindingDescriptions;
    v10->_bindingDescriptions = (NSArray *)v11;
  }
  return v10;
}

- (_GCControllerComponentDescription)initWithComponent:(id)a3
{
  return [(_GCControllerComponentDescription *)self initWithComponent:a3 bindings:0];
}

- (_GCControllerComponentDescription)init
{
  return 0;
}

- (_GCControllerComponentDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GCControllerComponentDescription;
  v5 = [(_GCControllerComponentDescription *)&v13 init];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_17);
    }
    v6 = GCControllerComponent_Classes();
    id v7 = [v6 setByAddingObject:objc_opt_class()];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"component"];
    component = v5->_component;
    v5->_component = (GCControllerComponent *)v8;

    uint64_t v10 = [v4 decodeObjectOfClasses:initWithCoder__BindingClasses forKey:@"bindings"];
    bindingDescriptions = v5->_bindingDescriptions;
    v5->_bindingDescriptions = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bindingDescriptions = self->_bindingDescriptions;
  id v5 = a3;
  [v5 encodeObject:bindingDescriptions forKey:@"bindings"];
  [v5 encodeObject:self->_component forKey:@"component"];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(_GCControllerComponentDescription *)self identifier];
  v6 = +[NSString stringWithFormat:@"<%@ '%@'>", v4, v5];

  return (NSString *)v6;
}

- (id)redactedDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(_GCControllerComponentDescription *)self identifier];
  v6 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<%@ '#%llx'>", v4, [v5 hash]);

  return v6;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(_GCControllerComponentDescription *)self identifier];
  v6 = [(GCControllerComponent *)self->_component debugDescription];
  id v7 = [(NSArray *)self->_bindingDescriptions debugDescription];
  uint64_t v8 = +[NSString stringWithFormat:@"<%@ %p '%@'> {\n\tcomponent: %@\n\tbindings: %@\n}", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (NSObject)identifier
{
  return [(GCControllerComponent *)self->_component identifier];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedComponent = self->_materializedComponent;
  if (materializedComponent) {
    goto LABEL_12;
  }
  v6 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_bindingDescriptions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "materializeWithContext:", v4, (void)v17);
      if (!v12) {
        break;
      }
      objc_super v13 = (void *)v12;
      [v6 addObject:v12];

      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  uint64_t v14 = [v6 count];
  if (v14 == [(NSArray *)self->_bindingDescriptions count])
  {
    [(_GCControllerComponentDescription *)self _applyBinding:v6 toComponent:self->_component];
    objc_storeStrong((id *)&self->_materializedComponent, self->_component);

    materializedComponent = self->_materializedComponent;
LABEL_12:
    v15 = materializedComponent;
    goto LABEL_13;
  }

  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)update:(id)a3 withContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  uint64_t v10 = [(_GCControllerComponentDescription *)self identifier];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v23 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v23 handleFailureInMethod:a2 object:self file:@"GCControllerComponent.m" lineNumber:145 description:&stru_26D27BBB8];
  }
  uint64_t v12 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_super v13 = self->_bindingDescriptions;
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
    [(_GCControllerComponentDescription *)self _applyBinding:v12 toComponent:v7];
  }

  return v20 == v21;
}

- (void)_applyBinding:(id)a3 toComponent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_26D2B4198])
  {
    [(GCControllerComponent *)self->_component setHIDEventSource:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v13 conformsToProtocol:&unk_26D289B48]) {
            [(GCControllerComponent *)self->_component setHIDEventSource:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v10);
    }
  }
  if ([v7 conformsToProtocol:&unk_26D28E4D8])
  {
    [(GCControllerComponent *)self->_component setGamepadEventSource:0];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          if ([v19 conformsToProtocol:&unk_26D290130]) {
            [(GCControllerComponent *)self->_component setGamepadEventSource:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v16);
    }
  }
  if ([v7 conformsToProtocol:&unk_26D2A0018])
  {
    [(GCControllerComponent *)self->_component setKeyboardEventSource:0];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v36 + 1) + 8 * k);
          if ([v25 conformsToProtocol:&unk_26D289678]) {
            [(GCControllerComponent *)self->_component setKeyboardEventSource:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
      }
      while (v22);
    }
  }
  if ([v7 conformsToProtocol:&unk_26D295048])
  {
    [(GCControllerComponent *)self->_component setMotionEventSource:0];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v6;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v32 + 1) + 8 * m);
          if (objc_msgSend(v31, "conformsToProtocol:", &unk_26D29CA40, (void)v32)) {
            [(GCControllerComponent *)self->_component setMotionEventSource:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
      }
      while (v28);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedComponent, 0);
  objc_storeStrong((id *)&self->_bindingDescriptions, 0);

  objc_storeStrong((id *)&self->_component, 0);
}

@end