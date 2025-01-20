@interface LNAppShortcutActionData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAction)action;
- (LNAppShortcutActionData)initWithAction:(id)a3 typeMap:(id)a4;
- (LNAppShortcutActionData)initWithCoder:(id)a3;
- (NSDictionary)identifiersByTypeMap;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutActionData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersByTypeMap, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (NSDictionary)identifiersByTypeMap
{
  return self->_identifiersByTypeMap;
}

- (LNAction)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAppShortcutActionData *)self action];
  [v4 encodeObject:v5 forKey:@"action"];

  id v6 = [(LNAppShortcutActionData *)self identifiersByTypeMap];
  [v4 encodeObject:v6 forKey:@"identifiersByTypeMap"];
}

- (LNAppShortcutActionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifiersByTypeMap"];

  v7 = [(LNAppShortcutActionData *)self initWithAction:v5 typeMap:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNAppShortcutActionData *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNAppShortcutActionData *)self action];
    v8 = [(LNAppShortcutActionData *)v6 action];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNAppShortcutActionData *)self identifiersByTypeMap];
    v16 = [(LNAppShortcutActionData *)v6 identifiersByTypeMap];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNAppShortcutActionData)initWithAction:(id)a3 typeMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNAppShortcutActionData.m", 18, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNAppShortcutActionData.m", 19, @"Invalid parameter not satisfying: %@", @"typeMap" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAppShortcutActionData;
  id v10 = [(LNAppShortcutActionData *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    action = v10->_action;
    v10->_action = (LNAction *)v11;

    uint64_t v13 = [v9 copy];
    identifiersByTypeMap = v10->_identifiersByTypeMap;
    v10->_identifiersByTypeMap = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end