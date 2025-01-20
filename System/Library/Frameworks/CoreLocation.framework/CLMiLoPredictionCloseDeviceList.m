@interface CLMiLoPredictionCloseDeviceList
+ (BOOL)supportsSecureCoding;
- (CLMiLoPredictionCloseDeviceList)initWithCloseDeviceList:(id)a3;
- (CLMiLoPredictionCloseDeviceList)initWithCoder:(id)a3;
- (NSArray)devices;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoPredictionCloseDeviceList

- (CLMiLoPredictionCloseDeviceList)initWithCloseDeviceList:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLMiLoPredictionCloseDeviceList;
  v4 = [(CLMiLoPredictionCloseDeviceList *)&v6 init];
  if (v4) {
    v4->_devices = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPredictionCloseDeviceList;
  [(CLMiLoPredictionCloseDeviceList *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithCloseDeviceList_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPredictionCloseDeviceList)initWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyPredictionCloseDeviceListDevices");

  return (CLMiLoPredictionCloseDeviceList *)MEMORY[0x1F4181798](self, sel_initWithCloseDeviceList_);
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

@end