@interface WFDisplay(VariableSerialization)
- (id)initWithSerializedRepresentation:()VariableSerialization variableProvider:parameter:;
- (id)serializedRepresentation;
@end

@implementation WFDisplay(VariableSerialization)

- (id)serializedRepresentation
{
  v2 = objc_opt_new();
  v3 = [a1 serializationUUID];
  [v2 setValue:v3 forKey:@"serializationUUID"];

  v4 = [a1 name];
  [v2 setValue:v4 forKey:@"name"];

  v5 = [a1 deviceName];
  [v2 setValue:v5 forKey:@"deviceName"];

  return v2;
}

- (id)initWithSerializedRepresentation:()VariableSerialization variableProvider:parameter:
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);

  if (!v6)
  {
    id v19 = 0;
    goto LABEL_9;
  }
  v7 = [v6 objectForKey:@"serializationUUID"];
  uint64_t v8 = objc_opt_class();
  v9 = WFEnforceClass(v7, v8);

  v10 = v9;
  v11 = v10;
  if (v10 == @"PrimaryDisplay") {
    goto LABEL_5;
  }
  if (v10)
  {
    int v12 = [(__CFString *)v10 isEqualToString:@"PrimaryDisplay"];

    if (v12)
    {
LABEL_5:

      v11 = @"MainDisplay";
      goto LABEL_6;
    }
    v21 = v11;
    if (v21 == @"CurrentDisplay")
    {
      id v19 = 0;
      v11 = @"CurrentDisplay";
      goto LABEL_7;
    }
    v11 = v21;
    char v22 = [(__CFString *)v21 isEqualToString:@"CurrentDisplay"];

    if (v22)
    {
      id v19 = 0;
      goto LABEL_7;
    }
  }
LABEL_6:
  v13 = [v6 objectForKey:@"name"];
  uint64_t v14 = objc_opt_class();
  v15 = WFEnforceClass(v13, v14);

  v16 = [v6 objectForKey:@"deviceName"];
  uint64_t v17 = objc_opt_class();
  v18 = WFEnforceClass(v16, v17);

  a1 = (id)[a1 initWithDisplayUUID:v11 deviceName:v18 name:v15];
  id v19 = a1;
LABEL_7:

LABEL_9:
  return v19;
}

@end