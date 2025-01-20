@interface _GCGamepadEventGamepadHIDAdapterDescription
+ (BOOL)supportsSecureCoding;
- (_GCGamepadEventGamepadHIDAdapterDescription)init;
- (_GCGamepadEventGamepadHIDAdapterDescription)initWithCoder:(id)a3;
- (_GCGamepadEventGamepadHIDAdapterDescription)initWithSource:(id)a3 service:(id)a4;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCGamepadEventGamepadHIDAdapterDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventGamepadHIDAdapterDescription)initWithSource:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventGamepadHIDAdapterDescription;
  v9 = [(_GCGamepadEventGamepadHIDAdapterDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceDescription, a3);
    objc_storeStrong((id *)&v10->_serviceDescription, a4);
  }

  return v10;
}

- (_GCGamepadEventGamepadHIDAdapterDescription)init
{
  return self;
}

- (_GCGamepadEventGamepadHIDAdapterDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventGamepadHIDAdapterDescription;
  v5 = [(_GCGamepadEventGamepadHIDAdapterDescription *)&v12 init];
  if (v5)
  {
    v6 = _GCHIDEventSourceDescription_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"source"];
    sourceDescription = v5->_sourceDescription;
    v5->_sourceDescription = (_GCHIDEventSourceDescription *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    serviceDescription = v5->_serviceDescription;
    v5->_serviceDescription = (_GCCControllerHIDServiceInfoDescription *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serviceDescription = self->_serviceDescription;
  id v5 = a3;
  [v5 encodeObject:serviceDescription forKey:@"service"];
  [v5 encodeObject:self->_sourceDescription forKey:@"source"];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedObject = self->_materializedObject;
  if (materializedObject) {
    goto LABEL_2;
  }
  uint64_t v7 = [(_GCHIDEventSourceDescription *)self->_sourceDescription materializeWithContext:v4];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(_GCCControllerHIDServiceInfoDescription *)self->_serviceDescription materializeWithContext:v4];
    v10 = (void *)v9;
    if (!self->_serviceDescription || v9)
    {
      objc_super v12 = [[_GCGamepadEventGamepadHIDAdapter alloc] initWithSource:v8 service:v9];
      v13 = self->_materializedObject;
      self->_materializedObject = v12;

      materializedObject = self->_materializedObject;
LABEL_2:
      v6 = materializedObject;
      goto LABEL_8;
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);

  objc_storeStrong((id *)&self->_sourceDescription, 0);
}

@end