@interface AXSSMotionTrackingHIDInput
+ (BOOL)supportsSecureCoding;
+ (id)motionTrackingHIDInputWithDevice:(id)a3;
- (AXSSMotionTrackingHIDInput)initWithCoder:(id)a3;
- (AXSSMotionTrackingHIDInput)initWithDeviceUniqueID:(id)a3 productID:(id)a4 vendorID:(id)a5 deviceName:(id)a6 mfiAuthenticated:(BOOL)a7;
- (AXSSMotionTrackingHIDInput)initWithPlistDictionary:(id)a3;
- (BOOL)isHIDDevice;
- (BOOL)mfiAuthenticated;
- (BOOL)supportsExpressions;
- (NSDictionary)hidMatchingDictionary;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)deviceName;
- (NSString)deviceUniqueID;
- (id)description;
- (id)plistDictionary;
- (id)uniqueIdentifier;
- (unint64_t)trackingType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setMfiAuthenticated:(BOOL)a3;
- (void)setProductID:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation AXSSMotionTrackingHIDInput

+ (id)motionTrackingHIDInputWithDevice:(id)a3
{
  id v3 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke;
  v20[3] = &unk_1E606CEE0;
  id v4 = v3;
  id v21 = v4;
  v5 = (void (**)(void, void))MEMORY[0x1B3EC2350](v20);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke_2;
  v18 = &unk_1E606CF08;
  id v6 = v4;
  id v19 = v6;
  v7 = (void (**)(void, void))MEMORY[0x1B3EC2350](&v15);
  v8 = ((void (**)(void, __CFString *))v5)[2](v5, @"PhysicalDeviceUniqueID");
  v9 = ((void (**)(void, __CFString *))v7)[2](v7, @"ProductID");
  v10 = ((void (**)(void, __CFString *))v7)[2](v7, @"VendorID");
  v11 = ((void (**)(void, __CFString *))v5)[2](v5, @"Product");
  BOOL v12 = +[AXSSMotionTrackingUtilities axss_HIDDeviceIsMFiAuthenticated:](AXSSMotionTrackingUtilities, "axss_HIDDeviceIsMFiAuthenticated:", v6, v15, v16, v17, v18);
  if ([v8 length] || v9 || v10 || objc_msgSend(v11, "length")) {
    v13 = [[AXSSMotionTrackingHIDInput alloc] initWithDeviceUniqueID:v8 productID:v9 vendorID:v10 deviceName:v11 mfiAuthenticated:v12];
  }
  else {
    v13 = 0;
  }

  return v13;
}

id __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) propertyForKey:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __63__AXSSMotionTrackingHIDInput_motionTrackingHIDInputWithDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) propertyForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (AXSSMotionTrackingHIDInput)initWithDeviceUniqueID:(id)a3 productID:(id)a4 vendorID:(id)a5 deviceName:(id)a6 mfiAuthenticated:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v12 length];
  if (v13 || v14 || v16 || [v15 length])
  {
    v28.receiver = self;
    v28.super_class = (Class)AXSSMotionTrackingHIDInput;
    v17 = [(AXSSMotionTrackingInput *)&v28 init];
    if (v17)
    {
      uint64_t v18 = [v12 copy];
      deviceUniqueID = v17->_deviceUniqueID;
      v17->_deviceUniqueID = (NSString *)v18;

      uint64_t v20 = [v13 copy];
      productID = v17->_productID;
      v17->_productID = (NSNumber *)v20;

      uint64_t v22 = [v14 copy];
      vendorID = v17->_vendorID;
      v17->_vendorID = (NSNumber *)v22;

      uint64_t v24 = [v15 copy];
      deviceName = v17->_deviceName;
      v17->_deviceName = (NSString *)v24;

      v17->_mfiAuthenticated = a7;
    }
    self = v17;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)uniqueIdentifier
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(AXSSMotionTrackingHIDInput *)self productID];

  if (v4)
  {
    v5 = NSString;
    id v6 = [(AXSSMotionTrackingHIDInput *)self productID];
    v7 = [v5 stringWithFormat:@"%@", v6];
    [v3 addObject:v7];
  }
  v8 = [(AXSSMotionTrackingHIDInput *)self vendorID];

  if (v8)
  {
    v9 = NSString;
    v10 = [(AXSSMotionTrackingHIDInput *)self vendorID];
    v11 = [v9 stringWithFormat:@"%@", v10];
    [v3 addObject:v11];
  }
  id v12 = [(AXSSMotionTrackingHIDInput *)self deviceName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = [(AXSSMotionTrackingHIDInput *)self deviceName];
    [v3 addObject:v14];
  }
  id v15 = NSString;
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v17 = [v15 stringWithFormat:@"%@", v16];
  [v3 addObject:v17];

  if ([v3 count])
  {
    uint64_t v18 = [v3 componentsJoinedByString:@"-"];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (NSDictionary)hidMatchingDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke;
  v19[3] = &unk_1E606CF30;
  id v4 = v3;
  id v20 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x1B3EC2350](v19);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke_2;
  v17 = &unk_1E606CF58;
  id v18 = v4;
  id v6 = v4;
  v7 = (void (**)(void, void, void))MEMORY[0x1B3EC2350](&v14);
  v8 = [(AXSSMotionTrackingHIDInput *)self deviceUniqueID];
  ((void (**)(void, void *, const char *))v5)[2](v5, v8, "PhysicalDeviceUniqueID");

  v9 = [(AXSSMotionTrackingHIDInput *)self productID];
  ((void (**)(void, void *, const char *))v7)[2](v7, v9, "ProductID");

  v10 = [(AXSSMotionTrackingHIDInput *)self vendorID];
  ((void (**)(void, void *, const char *))v7)[2](v7, v10, "VendorID");

  v11 = [(AXSSMotionTrackingHIDInput *)self deviceName];
  ((void (**)(void, void *, const char *))v5)[2](v5, v11, "Product");

  id v12 = (void *)[v6 copy];

  return (NSDictionary *)v12;
}

uint64_t __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v9 = v5;
    if ([v5 length])
    {
      id v6 = *(void **)(a1 + 32);
      v7 = [NSString stringWithUTF8String:a3];
      [v6 setObject:v9 forKeyedSubscript:v7];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __51__AXSSMotionTrackingHIDInput_hidMatchingDictionary__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = NSString;
    id v6 = a2;
    id v7 = [v5 stringWithUTF8String:a3];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  id v4 = [(AXSSMotionTrackingHIDInput *)self deviceUniqueID];

  if (v4)
  {
    id v5 = [(AXSSMotionTrackingHIDInput *)self deviceUniqueID];
    id v6 = NSStringFromSelector(sel_deviceUniqueID);
    [v18 encodeObject:v5 forKey:v6];
  }
  id v7 = [(AXSSMotionTrackingHIDInput *)self productID];

  if (v7)
  {
    v8 = [(AXSSMotionTrackingHIDInput *)self productID];
    id v9 = NSStringFromSelector(sel_productID);
    [v18 encodeObject:v8 forKey:v9];
  }
  v10 = [(AXSSMotionTrackingHIDInput *)self vendorID];

  if (v10)
  {
    v11 = [(AXSSMotionTrackingHIDInput *)self vendorID];
    id v12 = NSStringFromSelector(sel_vendorID);
    [v18 encodeObject:v11 forKey:v12];
  }
  uint64_t v13 = [(AXSSMotionTrackingHIDInput *)self deviceName];

  if (v13)
  {
    uint64_t v14 = [(AXSSMotionTrackingHIDInput *)self deviceName];
    uint64_t v15 = NSStringFromSelector(sel_deviceName);
    [v18 encodeObject:v14 forKey:v15];
  }
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v17 = NSStringFromSelector(sel_mfiAuthenticated);
  [v18 encodeObject:v16 forKey:v17];
}

- (AXSSMotionTrackingHIDInput)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_deviceUniqueID);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_productID);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_vendorID);
  uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = NSStringFromSelector(sel_deviceName);
  uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = objc_opt_class();
  id v18 = NSStringFromSelector(sel_mfiAuthenticated);
  id v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

  uint64_t v20 = [v19 BOOLValue];
  id v21 = [(AXSSMotionTrackingHIDInput *)self initWithDeviceUniqueID:v7 productID:v10 vendorID:v13 deviceName:v16 mfiAuthenticated:v20];

  return v21;
}

- (id)description
{
  id v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)AXSSMotionTrackingHIDInput;
  id v4 = [(AXSSMotionTrackingHIDInput *)&v12 description];
  uint64_t v5 = [(AXSSMotionTrackingHIDInput *)self deviceUniqueID];
  id v6 = [(AXSSMotionTrackingHIDInput *)self productID];
  id v7 = [(AXSSMotionTrackingHIDInput *)self vendorID];
  uint64_t v8 = [(AXSSMotionTrackingHIDInput *)self deviceName];
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  v10 = [v3 stringWithFormat:@"%@ <deviceUniqueID: %@, productID: %@, vendorID: %@, deviceName: %@, MFi authenticated: %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)plistDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v21.receiver = self;
  v21.super_class = (Class)AXSSMotionTrackingHIDInput;
  id v4 = [(AXSSMotionTrackingInput *)&v21 plistDictionary];
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }
  uint64_t v5 = [(AXSSMotionTrackingHIDInput *)self deviceUniqueID];

  if (v5)
  {
    id v6 = [(AXSSMotionTrackingHIDInput *)self deviceUniqueID];
    id v7 = NSStringFromSelector(sel_deviceUniqueID);
    [v3 setObject:v6 forKeyedSubscript:v7];
  }
  uint64_t v8 = [(AXSSMotionTrackingHIDInput *)self productID];

  if (v8)
  {
    id v9 = [(AXSSMotionTrackingHIDInput *)self productID];
    v10 = NSStringFromSelector(sel_productID);
    [v3 setObject:v9 forKeyedSubscript:v10];
  }
  uint64_t v11 = [(AXSSMotionTrackingHIDInput *)self vendorID];

  if (v11)
  {
    objc_super v12 = [(AXSSMotionTrackingHIDInput *)self vendorID];
    uint64_t v13 = NSStringFromSelector(sel_vendorID);
    [v3 setObject:v12 forKeyedSubscript:v13];
  }
  uint64_t v14 = [(AXSSMotionTrackingHIDInput *)self deviceName];

  if (v14)
  {
    uint64_t v15 = [(AXSSMotionTrackingHIDInput *)self deviceName];
    uint64_t v16 = NSStringFromSelector(sel_deviceName);
    [v3 setObject:v15 forKeyedSubscript:v16];
  }
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingHIDInput mfiAuthenticated](self, "mfiAuthenticated"));
  id v18 = NSStringFromSelector(sel_mfiAuthenticated);
  [v3 setObject:v17 forKeyedSubscript:v18];

  id v19 = (void *)[v3 copy];

  return v19;
}

- (AXSSMotionTrackingHIDInput)initWithPlistDictionary:(id)a3
{
  id v3 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke;
  v23[3] = &unk_1E606CEE0;
  id v4 = v3;
  id v24 = v4;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x1B3EC2350](v23);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke_2;
  v21[3] = &unk_1E606CF08;
  id v22 = v4;
  id v20 = v4;
  id v6 = (void (**)(void, void))MEMORY[0x1B3EC2350](v21);
  uint64_t v17 = NSStringFromSelector(sel_deviceUniqueID);
  id v7 = ((void (**)(void, void *))v5)[2](v5, v17);
  uint64_t v16 = NSStringFromSelector(sel_productID);
  uint64_t v8 = ((void (**)(void, void *))v6)[2](v6, v16);
  id v9 = NSStringFromSelector(sel_vendorID);
  v10 = ((void (**)(void, void *))v6)[2](v6, v9);
  uint64_t v11 = NSStringFromSelector(sel_deviceName);
  objc_super v12 = ((void (**)(void, void *))v5)[2](v5, v11);
  uint64_t v13 = NSStringFromSelector(sel_mfiAuthenticated);
  uint64_t v14 = ((void (**)(void, void *))v6)[2](v6, v13);
  id v19 = -[AXSSMotionTrackingHIDInput initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:](self, "initWithDeviceUniqueID:productID:vendorID:deviceName:mfiAuthenticated:", v7, v8, v10, v12, [v14 BOOLValue]);

  return v19;
}

id __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __54__AXSSMotionTrackingHIDInput_initWithPlistDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (unint64_t)trackingType
{
  return 2;
}

- (BOOL)supportsExpressions
{
  return 0;
}

- (BOOL)isHIDDevice
{
  return 1;
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)mfiAuthenticated
{
  return self->_mfiAuthenticated;
}

- (void)setMfiAuthenticated:(BOOL)a3
{
  self->_mfiAuthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
}

@end