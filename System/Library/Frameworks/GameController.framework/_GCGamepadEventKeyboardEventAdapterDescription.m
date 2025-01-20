@interface _GCGamepadEventKeyboardEventAdapterDescription
+ (BOOL)supportsSecureCoding;
- (_GCGamepadEventKeyboardEventAdapterDescription)init;
- (_GCGamepadEventKeyboardEventAdapterDescription)initWithCoder:(id)a3;
- (_GCGamepadEventKeyboardEventAdapterDescription)initWithConfiguration:(id)a3 source:(id)a4;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCGamepadEventKeyboardEventAdapterDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventKeyboardEventAdapterDescription)initWithConfiguration:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventKeyboardEventAdapterDescription;
  v9 = [(_GCGamepadEventKeyboardEventAdapterDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeStrong((id *)&v10->_sourceDescription, a4);
  }

  return v10;
}

- (_GCGamepadEventKeyboardEventAdapterDescription)init
{
  return self;
}

- (_GCGamepadEventKeyboardEventAdapterDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventKeyboardEventAdapterDescription;
  v5 = [(_GCGamepadEventKeyboardEventAdapterDescription *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];
    config = v5->_config;
    v5->_config = (_GCGamepadEventKeyboardEventAdapterConfig *)v6;

    id v8 = _GCKeyboardEventSourceDescription_Classes();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"source"];
    sourceDescription = v5->_sourceDescription;
    v5->_sourceDescription = (_GCKeyboardEventSourceDescription *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceDescription = self->_sourceDescription;
  id v5 = a3;
  [v5 encodeObject:sourceDescription forKey:@"source"];
  [v5 encodeObject:self->_config forKey:@"config"];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedObject = self->_materializedObject;
  if (materializedObject) {
    goto LABEL_4;
  }
  uint64_t v6 = [(_GCKeyboardEventSourceDescription *)self->_sourceDescription materializeWithContext:v4];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [[_GCGamepadEventKeyboardEventAdapter alloc] initWithConfiguration:self->_config source:v6];
    uint64_t v9 = self->_materializedObject;
    self->_materializedObject = v8;

    materializedObject = self->_materializedObject;
LABEL_4:
    v10 = materializedObject;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end