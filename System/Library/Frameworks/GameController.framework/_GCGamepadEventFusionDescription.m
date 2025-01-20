@interface _GCGamepadEventFusionDescription
+ (BOOL)supportsSecureCoding;
- (_GCGamepadEventFusionDescription)init;
- (_GCGamepadEventFusionDescription)initWithCoder:(id)a3;
- (_GCGamepadEventFusionDescription)initWithConfiguration:(id)a3 sources:(id)a4;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCGamepadEventFusionDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventFusionDescription)initWithConfiguration:(id)a3 sources:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCGamepadEventFusionDescription;
  v9 = [(_GCGamepadEventFusionDescription *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    uint64_t v11 = [v8 copy];
    sourcesDescription = v10->_sourcesDescription;
    v10->_sourcesDescription = (NSArray *)v11;
  }
  return v10;
}

- (_GCGamepadEventFusionDescription)init
{
  return self;
}

- (_GCGamepadEventFusionDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GCGamepadEventFusionDescription;
  v5 = [(_GCGamepadEventFusionDescription *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];
    config = v5->_config;
    v5->_config = (_GCGamepadEventFusionConfig *)v6;

    id v8 = _GCGamepadEventSourceDescription_Classes();
    v9 = [v8 setByAddingObject:objc_opt_class()];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sources"];
    sourcesDescription = v5->_sourcesDescription;
    v5->_sourcesDescription = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourcesDescription = self->_sourcesDescription;
  id v5 = a3;
  [v5 encodeObject:sourcesDescription forKey:@"sources"];
  [v5 encodeObject:self->_config forKey:@"config"];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedObject = self->_materializedObject;
  if (!materializedObject)
  {
    id v7 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_sourcesDescription, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = self->_sourcesDescription;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "materializeWithContext:", v4, (void)v18);
          if (!v13)
          {

            uint64_t v6 = 0;
            goto LABEL_13;
          }
          objc_super v14 = (void *)v13;
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v15 = [[_GCGamepadEventFusion alloc] initWithConfiguration:self->_config sources:v7];
    v16 = self->_materializedObject;
    self->_materializedObject = v15;

    materializedObject = self->_materializedObject;
  }
  uint64_t v6 = materializedObject;
LABEL_13:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_sourcesDescription, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end