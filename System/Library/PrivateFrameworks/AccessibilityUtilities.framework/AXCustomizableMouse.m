@interface AXCustomizableMouse
+ (BOOL)supportsSecureCoding;
+ (id)_existingMouseForIdentifier:(id)a3 vendorId:(int64_t)a4 productId:(int64_t)a5;
+ (id)_newOrExistingMouseForIdentifier:(id)a3 name:(id)a4 vendorId:(id)a5 productId:(id)a6;
+ (id)deserialize:(id)a3;
+ (id)mouseForHIDDevice:(__IOHIDDevice *)a3;
+ (id)mouseForHIDServiceClient:(__IOHIDServiceClient *)a3;
+ (id)serialize:(id)a3;
- (AXCustomizableMouse)initWithCoder:(id)a3;
- (AXCustomizableMouse)initWithIdentifier:(id)a3 name:(id)a4 vendorId:(int64_t)a5 productId:(int64_t)a6;
- (BOOL)customActionsRequireAssistiveTouch;
- (BOOL)hasCustomActions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentifier:(id)a3 vendorId:(int64_t)a4 productId:(int64_t)a5;
- (BOOL)isEqualToMouse:(id)a3;
- (NSArray)buttonsWithCustomActions;
- (NSMutableDictionary)buttonMap;
- (NSString)identifier;
- (NSString)name;
- (id)customActionForButtonNumber:(int64_t)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)productId;
- (int64_t)vendorId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonMap:(id)a3;
- (void)setCustomAction:(id)a3 forButtonNumber:(int64_t)a4;
- (void)setDefaultActionForButtonNumber:(int64_t)a3;
@end

@implementation AXCustomizableMouse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXCustomizableMouse)initWithCoder:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXCustomizableMouse;
  v5 = [(AXCustomizableMouse *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorId"];
    v5->_vendorId = [v10 integerValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productId"];
    v5->_productId = [v11 integerValue];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    v14 = [v12 setWithArray:v13];

    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"buttonMap"];
    v16 = (void *)[v15 mutableCopy];
    [(AXCustomizableMouse *)v5 setButtonMap:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXCustomizableMouse *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(AXCustomizableMouse *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXCustomizableMouse vendorId](self, "vendorId"));
  [v4 encodeObject:v7 forKey:@"vendorId"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXCustomizableMouse productId](self, "productId"));
  [v4 encodeObject:v8 forKey:@"productId"];

  id v9 = [(AXCustomizableMouse *)self buttonMap];
  [v4 encodeObject:v9 forKey:@"buttonMap"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AXCustomizableMouse *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p name=%@>", v4, self, v5];

  return v6;
}

+ (id)deserialize:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    id v24 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (!v5) {
      goto LABEL_20;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    unint64_t v8 = 0x1E4F28000uLL;
    unint64_t v9 = 0x1E5584000uLL;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [*(id *)(v8 + 3520) unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
          if (v12) {
            [v24 addObject:v12];
          }
        }
        else
        {
          v13 = [MEMORY[0x1E4F48338] sharedInstance];
          char v14 = [v13 ignoreLogging];

          if (v14) {
            continue;
          }
          id v15 = v4;
          unint64_t v16 = v9;
          unint64_t v17 = v8;
          objc_super v18 = [MEMORY[0x1E4F48338] identifier];
          v12 = AXLoggerForFacility();

          os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v12, v19))
          {
            v20 = AXColorizeFormatLog();
            v21 = _AXStringForArgs();
            if (os_log_type_enabled(v12, v19))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v21;
              _os_log_impl(&dword_18D308000, v12, v19, "%{public}@", buf, 0xCu);
            }
          }
          unint64_t v8 = v17;
          unint64_t v9 = v16;
          id v4 = v15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (!v6)
      {
LABEL_20:

        id v3 = v23;
        goto LABEL_22;
      }
    }
  }
  id v24 = (id)MEMORY[0x1E4F1CBF0];
LABEL_22:

  return v24;
}

+ (id)serialize:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 1, 0, (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)mouseForHIDDevice:(__IOHIDDevice *)a3
{
  if (a3)
  {
    id v5 = IOHIDDeviceGetProperty(a3, @"Product");
    uint64_t v6 = IOHIDDeviceGetProperty(a3, @"PhysicalDeviceUniqueID");
    uint64_t v7 = IOHIDDeviceGetProperty(a3, @"VendorID");
    uint64_t v8 = IOHIDDeviceGetProperty(a3, @"ProductID");
    unint64_t v9 = (void *)[a1 _newOrExistingMouseForIdentifier:v6 name:v5 vendorId:v7 productId:v8];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)mouseForHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (a3)
  {
    id v5 = (void *)IOHIDServiceClientCopyProperty(a3, @"Product");
    uint64_t v6 = (void *)IOHIDServiceClientCopyProperty(a3, @"PhysicalDeviceUniqueID");
    uint64_t v7 = (void *)IOHIDServiceClientCopyProperty(a3, @"VendorID");
    uint64_t v8 = (void *)IOHIDServiceClientCopyProperty(a3, @"ProductID");
    unint64_t v9 = (void *)[a1 _newOrExistingMouseForIdentifier:v6 name:v5 vendorId:v7 productId:v8];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)_existingMouseForIdentifier:(id)a3 vendorId:(int64_t)a4 productId:(int64_t)a5
{
  id v7 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  long long v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  if ([v7 length])
  {
    uint64_t v8 = +[AXSettings sharedInstance];
    unint64_t v9 = [v8 assistiveTouchMouseCustomizedClickActions];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke;
    v16[3] = &unk_1E5586300;
    int64_t v19 = a4;
    int64_t v20 = a5;
    id v17 = v7;
    objc_super v18 = &v21;
    [v9 enumerateObjectsUsingBlock:v16];
  }
  v10 = (void *)v22[5];
  if (!v10)
  {
    uint64_t v11 = +[AXSettings sharedInstance];
    long long v12 = [v11 assistiveTouchMouseCustomizedClickActions];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke_2;
    v15[3] = &unk_1E5586328;
    v15[5] = a4;
    v15[6] = a5;
    v15[4] = &v21;
    [v12 enumerateObjectsUsingBlock:v15];

    v10 = (void *)v22[5];
  }
  id v13 = v10;
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqualToIdentifier:a1[4] vendorId:a1[6] productId:a1[7]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *a4 = 1;
  }
}

void __70__AXCustomizableMouse__existingMouseForIdentifier_vendorId_productId___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 vendorId] == a1[5] && objc_msgSend(v7, "productId") == a1[6])
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)_newOrExistingMouseForIdentifier:(id)a3 name:(id)a4 vendorId:(id)a5 productId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 length] || (long long v14 = 0, v12) && v13)
  {
    objc_msgSend(a1, "_existingMouseForIdentifier:vendorId:productId:", v10, objc_msgSend(v12, "integerValue"), objc_msgSend(v13, "integerValue"));
    long long v14 = (AXCustomizableMouse *)objc_claimAutoreleasedReturnValue();
    if (!v14) {
      long long v14 = -[AXCustomizableMouse initWithIdentifier:name:vendorId:productId:]([AXCustomizableMouse alloc], "initWithIdentifier:name:vendorId:productId:", v10, v11, [v12 integerValue], objc_msgSend(v13, "integerValue"));
    }
  }

  return v14;
}

- (AXCustomizableMouse)initWithIdentifier:(id)a3 name:(id)a4 vendorId:(int64_t)a5 productId:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AXCustomizableMouse;
  id v13 = [(AXCustomizableMouse *)&v20 init];
  long long v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a4);
    p_identifier = (void **)&v14->_identifier;
    objc_storeStrong((id *)&v14->_identifier, a3);
    v14->_vendorId = a5;
    v14->_productId = a6;
    if (![(NSString *)v14->_identifier length])
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%li-%li", a5, a6);
      id v17 = *p_identifier;
      *p_identifier = (void *)v16;
    }
    objc_super v18 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXCustomizableMouse *)v14 setButtonMap:v18];
  }
  return v14;
}

- (void)setDefaultActionForButtonNumber:(int64_t)a3
{
  id v5 = +[AXSettings sharedInstance];
  int v6 = [v5 laserEnabled];

  if (v6) {
    AXAssistiveTouchDefaultLaserIconTypeForMouseButton(a3);
  }
  else {
    AXAssistiveTouchDefaultIconTypeForMouseButton(a3);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(AXCustomizableMouse *)self setCustomAction:v7 forButtonNumber:a3];
}

- (void)setCustomAction:(id)a3 forButtonNumber:(int64_t)a4
{
  id v9 = a3;
  uint64_t v6 = [v9 length];
  id v7 = [(AXCustomizableMouse *)self buttonMap];
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  if (v6) {
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
  else {
    [v7 removeObjectForKey:v8];
  }
}

- (BOOL)hasCustomActions
{
  v2 = [(AXCustomizableMouse *)self buttonMap];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)customActionsRequireAssistiveTouch
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AXCustomizableMouse *)self buttonMap];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(AXCustomizableMouse *)self buttonMap];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [(AXCustomizableMouse *)self buttonMap];
        id v12 = [v11 objectForKeyedSubscript:v10];

        if ([v12 length])
        {
          if (([v12 isEqualToString:@"__NONE__"] & 1) == 0)
          {
            id v13 = AXAssistiveTouchDefaultLaserIconTypeForMouseButton([v10 integerValue]);
            int v14 = [v12 isEqualToString:v13];

            if (!v14)
            {

              BOOL v15 = 1;
              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (NSArray)buttonsWithCustomActions
{
  v2 = [(AXCustomizableMouse *)self buttonMap];
  BOOL v3 = [v2 allKeys];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v4;
}

- (id)customActionForButtonNumber:(int64_t)a3
{
  uint64_t v4 = [(AXCustomizableMouse *)self buttonMap];
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (unint64_t)hash
{
  BOOL v3 = [(AXCustomizableMouse *)self identifier];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(AXCustomizableMouse *)self vendorId];
  unint64_t v6 = v5 ^ [(AXCustomizableMouse *)self productId] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AXCustomizableMouse *)self isEqualToMouse:v4];

  return v5;
}

- (BOOL)isEqualToMouse:(id)a3
{
  if (self == a3) {
    return 1;
  }
  BOOL v3 = self;
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  uint64_t v6 = [v4 vendorId];
  uint64_t v7 = [v4 productId];

  LOBYTE(v3) = [(AXCustomizableMouse *)v3 isEqualToIdentifier:v5 vendorId:v6 productId:v7];
  return (char)v3;
}

- (BOOL)isEqualToIdentifier:(id)a3 vendorId:(int64_t)a4 productId:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(AXCustomizableMouse *)self identifier];
  int v10 = [v9 isEqualToString:v8];

  BOOL v11 = v10
     && [(AXCustomizableMouse *)self vendorId] == a4
     && [(AXCustomizableMouse *)self productId] == a5;

  return v11;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)AXCustomizableMouse;
  id v4 = [(AXCustomizableMouse *)&v12 debugDescription];
  BOOL v5 = [(AXCustomizableMouse *)self name];
  uint64_t v6 = [(AXCustomizableMouse *)self identifier];
  int64_t v7 = [(AXCustomizableMouse *)self vendorId];
  int64_t v8 = [(AXCustomizableMouse *)self productId];
  id v9 = [(AXCustomizableMouse *)self buttonMap];
  int v10 = [v3 stringWithFormat:@"%@, name: %@, identifier: %@, vendorId: %d, productId: %d, buttonMap: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (int64_t)productId
{
  return self->_productId;
}

- (NSMutableDictionary)buttonMap
{
  return self->_buttonMap;
}

- (void)setButtonMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end