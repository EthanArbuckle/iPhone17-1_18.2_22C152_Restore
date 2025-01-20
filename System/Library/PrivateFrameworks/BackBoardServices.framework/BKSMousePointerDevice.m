@interface BKSMousePointerDevice
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (BKSHIDEventSenderDescriptor)senderDescriptor;
- (BKSMousePointerDevice)init;
- (BKSMousePointerDevice)initWithCoder:(id)a3;
- (BKSMousePointerDevice)initWithSenderDescriptor:(id)a3;
- (BOOL)hasVirtualMouseButtons;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsDragLock;
- (BOOL)supportsLightClick;
- (BOOL)supportsSystemHaptics;
- (NSString)description;
- (NSString)manufacturerName;
- (NSString)preferenceKey;
- (NSString)productName;
- (id)initForProtobufDecoding;
- (id)preferences;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasVirtualMouseButtons:(BOOL)a3;
- (void)setManufacturerName:(id)a3;
- (void)setPreferenceKey:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setProductName:(id)a3;
- (void)setSupportsDragLock:(BOOL)a3;
- (void)setSupportsLightClick:(BOOL)a3;
- (void)setSupportsSystemHaptics:(BOOL)a3;
@end

@implementation BKSMousePointerDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceKey, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
}

- (void)setPreferenceKey:(id)a3
{
}

- (NSString)preferenceKey
{
  return self->_preferenceKey;
}

- (void)setSupportsSystemHaptics:(BOOL)a3
{
  self->_supportsSystemHaptics = a3;
}

- (BOOL)supportsSystemHaptics
{
  return self->_supportsSystemHaptics;
}

- (void)setSupportsLightClick:(BOOL)a3
{
  self->_supportsLightClick = a3;
}

- (BOOL)supportsLightClick
{
  return self->_supportsLightClick;
}

- (void)setSupportsDragLock:(BOOL)a3
{
  self->_supportsDragLock = a3;
}

- (BOOL)supportsDragLock
{
  return self->_supportsDragLock;
}

- (void)setHasVirtualMouseButtons:(BOOL)a3
{
  self->_hasVirtualMouseButtons = a3;
}

- (BOOL)hasVirtualMouseButtons
{
  return self->_hasVirtualMouseButtons;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (BKSHIDEventSenderDescriptor)senderDescriptor
{
  return self->_senderDescriptor;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)BKSMousePointerDevice;
  v4 = [(BKSMousePointerDevice *)&v7 description];
  v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@" %@ -- product:%@ manufacturer:%@ pref:%@ virtalButtons:%d supportsDragLock:%d", self->_senderDescriptor, self->_productName, self->_manufacturerName, self->_preferenceKey, self->_hasVirtualMouseButtons, self->_supportsDragLock];
  objc_msgSend(v5, "appendFormat:", @" supportsLightClick:%d supportsSystemHaptics:%d", self->_supportsLightClick, self->_supportsSystemHaptics);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BKSMousePointerDevice *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && [(BKSHIDEventSenderDescriptor *)self->_senderDescriptor isEqual:v4->_senderDescriptor]
      && [(NSString *)self->_preferenceKey isEqual:v4->_preferenceKey]
      && [(NSString *)self->_productName isEqual:v4->_productName]
      && [(NSString *)self->_manufacturerName isEqual:v4->_manufacturerName]
      && self->_hasVirtualMouseButtons == v4->_hasVirtualMouseButtons
      && self->_supportsDragLock == v4->_supportsDragLock
      && self->_supportsLightClick == v4->_supportsLightClick
      && self->_supportsSystemHaptics == v4->_supportsSystemHaptics;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(BKSHIDEventSenderDescriptor *)self->_senderDescriptor hash];
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSMousePointerDevice;
  return [(BKSMousePointerDevice *)&v3 init];
}

- (BKSMousePointerDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t:1"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t:2"];
  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t:3"];
  productName = self->_productName;
  self->_productName = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t:4"];
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v9;

  self->_hasVirtualMouseButtons = [v4 decodeBoolForKey:@"t:5"];
  self->_supportsDragLock = [v4 decodeBoolForKey:@"t:6"];
  self->_supportsLightClick = [v4 decodeBoolForKey:@"t:7"];
  char v11 = [v4 decodeBoolForKey:@"t:8"];

  self->_supportsSystemHaptics = v11;
  v12 = [(BKSMousePointerDevice *)self initWithSenderDescriptor:v5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_preferenceKey, v6);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  senderDescriptor = self->_senderDescriptor;
  id v5 = a3;
  [v5 encodeObject:senderDescriptor forKey:@"t:1"];
  [v5 encodeObject:self->_preferenceKey forKey:@"t:2"];
  [v5 encodeObject:self->_productName forKey:@"t:3"];
  [v5 encodeObject:self->_manufacturerName forKey:@"t:4"];
  [v5 encodeBool:self->_hasVirtualMouseButtons forKey:@"t:5"];
  [v5 encodeBool:self->_supportsDragLock forKey:@"t:6"];
  [v5 encodeBool:self->_supportsLightClick forKey:@"t:7"];
  [v5 encodeBool:self->_supportsSystemHaptics forKey:@"t:8"];
}

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSMousePointerService sharedInstance];
  [v5 setPreferences:v4 forDevice:self];
}

- (id)preferences
{
  objc_super v3 = +[BKSMousePointerService sharedInstance];
  id v4 = [v3 preferencesForDevice:self];

  return v4;
}

- (BKSMousePointerDevice)initWithSenderDescriptor:(id)a3
{
  id v5 = a3;
  BOOL v6 = objc_opt_class();
  if (([v6 isEqual:objc_opt_class()] & 1) == 0)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"BKSMousePointerDevice.m" lineNumber:27 description:@"subclassing BKSMousePointerDevice is not supported"];
  }
  v12.receiver = self;
  v12.super_class = (Class)BKSMousePointerDevice;
  objc_super v7 = [(BKSMousePointerDevice *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v5 copy];
    senderDescriptor = v7->_senderDescriptor;
    v7->_senderDescriptor = (BKSHIDEventSenderDescriptor *)v8;
  }
  return v7;
}

- (BKSMousePointerDevice)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"BKSMousePointerDevice.m", 22, @"-init is not allowed on %@", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BKSMousePointerDevice_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_2877 != -1) {
    dispatch_once(&protobufSchema_onceToken_2877, block);
  }
  v2 = (void *)protobufSchema_schema_2878;
  return v2;
}

uint64_t __39__BKSMousePointerDevice_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_2880];
  uint64_t v2 = protobufSchema_schema_2878;
  protobufSchema_schema_2878 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __39__BKSMousePointerDevice_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_senderDescriptor"];
  [v2 addField:"_preferenceKey"];
  [v2 addField:"_productName"];
  [v2 addField:"_manufacturerName"];
  [v2 addField:"_hasVirtualMouseButtons"];
  [v2 addField:"_supportsDragLock"];
  [v2 addField:"_supportsLightClick"];
  [v2 addField:"_supportsSystemHaptics"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end