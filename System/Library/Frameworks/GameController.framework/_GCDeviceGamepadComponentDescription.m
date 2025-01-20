@interface _GCDeviceGamepadComponentDescription
+ (BOOL)supportsSecureCoding;
- (id)createWithContext:(id)a3;
@end

@implementation _GCDeviceGamepadComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createWithContext:(id)a3
{
  v4 = [GCGamepad alloc];
  v5 = [(_GCDevicePhysicalInputComponentDescription *)self identifier];
  v6 = -[GCGamepad _initWithIdentifier:createDefaultElements:](v4, (uint64_t)v5, 0);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(_GCDevicePhysicalInputComponentDescription *)self elementDescriptions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          id v13 = (id)[v6 _buttonWithDescription:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = (id)[v6 _directionPadWithDescription:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

@end