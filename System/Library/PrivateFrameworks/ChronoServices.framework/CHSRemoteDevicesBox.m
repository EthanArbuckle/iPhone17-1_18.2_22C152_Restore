@interface CHSRemoteDevicesBox
+ (BOOL)supportsSecureCoding;
- (CHSRemoteDevicesBox)initWithCoder:(id)a3;
- (CHSRemoteDevicesBox)initWithDevices:(id)a3;
- (NSArray)devices;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForEncoding;
@end

@implementation CHSRemoteDevicesBox

- (CHSRemoteDevicesBox)initWithDevices:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSRemoteDevicesBox;
  v5 = [(CHSRemoteDevicesBox *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;
  }
  return v5;
}

- (void)prepareForEncoding
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v3 = [MEMORY[0x1E4F960F8] encodeObject:self error:&v9];
  id v4 = v9;
  archivedData = self->_archivedData;
  self->_archivedData = v3;

  if (v4)
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      [(CHSWidgetExtensionsBox *)v8 prepareForEncoding];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSRemoteDevicesBox)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHSRemoteDevicesBox;
  v5 = [(CHSRemoteDevicesBox *)&v14 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"data"])
    {
      devices = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
      id v13 = 0;
      v7 = [MEMORY[0x1E4F960F8] decodeObjectOfClass:objc_opt_class() fromData:devices error:&v13];
      id v8 = v13;
      if (v8)
      {
        [v4 failWithError:v8];
      }
      else if (v7)
      {
        objc_storeStrong((id *)&v5->_devices, v7[2]);
      }
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"devices"];
      devices = v5->_devices;
      v5->_devices = (NSArray *)v11;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  archivedData = self->_archivedData;
  id v6 = v4;
  if (archivedData) {
    [v4 encodeObject:archivedData forKey:@"data"];
  }
  else {
    [v4 encodeObject:self->_devices forKey:@"devices"];
  }
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_archivedData, 0);
}

@end