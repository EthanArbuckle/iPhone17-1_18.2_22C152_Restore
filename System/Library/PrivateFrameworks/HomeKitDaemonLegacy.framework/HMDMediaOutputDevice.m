@interface HMDMediaOutputDevice
- (AVOutputDevice)av_OutputDevice;
- (BOOL)isAppleMediaAccessory;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsHAP;
- (BOOL)supportsWHA;
- (HMDMediaOutputDevice)initWithOutputDevice:(void *)a3;
- (NSString)modelID;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (id)description;
- (unint64_t)hash;
- (unsigned)deviceSubtype;
- (void)dealloc;
- (void)outputDevice;
- (void)setOutputDevice:(void *)a3;
@end

@implementation HMDMediaOutputDevice

- (AVOutputDevice)av_OutputDevice
{
  v2 = [(HMDMediaOutputDevice *)self outputDevice];
  return (AVOutputDevice *)MEMORY[0x1F412DC98](v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setOutputDevice:(void *)a3
{
  self->_outputDevice = a3;
}

- (void)outputDevice
{
  return self->_outputDevice;
}

- (BOOL)isAppleMediaAccessory
{
  v2 = [(HMDMediaOutputDevice *)self modelID];
  uint64_t v3 = HMFProductClassFromString();

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(HMDMediaOutputDevice *)self uniqueIdentifier];
  v5 = [v3 stringWithFormat:@"Output device(%@/%@)", v4, -[HMDMediaOutputDevice outputDevice](self, "outputDevice")];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDMediaOutputDevice *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6
      && ([(HMDMediaOutputDevice *)self uniqueIdentifier],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(HMDMediaOutputDevice *)v6 uniqueIdentifier],
          v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 isEqual:v8],
          v8,
          v7,
          (v9 & 1) == 0))
    {
      v11 = [(HMDMediaOutputDevice *)self outputDevice];
      BOOL v10 = v11 == [(HMDMediaOutputDevice *)v6 outputDevice];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueIdentifier hash];
}

- (void)dealloc
{
  outputDevice = self->_outputDevice;
  if (outputDevice) {
    CFRelease(outputDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaOutputDevice;
  [(HMDMediaOutputDevice *)&v4 dealloc];
}

- (BOOL)supportsHAP
{
  [(HMDMediaOutputDevice *)self outputDevice];
  JUMPOUT(0x1D9450C80);
}

- (BOOL)supportsWHA
{
  v2 = [(HMDMediaOutputDevice *)self outputDevice];
  return MEMORY[0x1F412DD10](v2);
}

- (NSString)modelID
{
  [(HMDMediaOutputDevice *)self outputDevice];
  v2 = (void *)MRAVOutputDeviceCopyModelID();
  CFTypeID TypeID = CFStringGetTypeID();
  objc_opt_class();
  if (v2 && CFGetTypeID(v2) != TypeID)
  {
    CFRelease(v2);
    v2 = 0;
  }
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v2;
  }
  else {
    objc_super v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (unsigned)deviceSubtype
{
  v2 = [(HMDMediaOutputDevice *)self outputDevice];
  return MEMORY[0x1F412DCA8](v2);
}

- (HMDMediaOutputDevice)initWithOutputDevice:(void *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaOutputDevice;
  objc_super v4 = [(HMDMediaOutputDevice *)&v16 init];
  if (!v4)
  {
LABEL_18:
    a3 = v4;
    goto LABEL_20;
  }
  if (a3)
  {
    CFRetain(a3);
    v5 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
    CFTypeID TypeID = CFStringGetTypeID();
    objc_opt_class();
    if (v5 && CFGetTypeID(v5) != TypeID)
    {
      CFRelease(v5);
      v5 = 0;
    }
    if (objc_opt_isKindOfClass()) {
      v7 = v5;
    }
    else {
      v7 = 0;
    }
    v8 = v7;

    uniqueIdentifier = v4->_uniqueIdentifier;
    v4->_uniqueIdentifier = v8;

    BOOL v10 = (void *)MRAVOutputDeviceCopyName();
    CFTypeID v11 = CFStringGetTypeID();
    objc_opt_class();
    if (v10 && CFGetTypeID(v10) != v11)
    {
      CFRelease(v10);
      BOOL v10 = 0;
    }
    if (objc_opt_isKindOfClass()) {
      v12 = v10;
    }
    else {
      v12 = 0;
    }
    v13 = v12;

    name = v4->_name;
    v4->_name = v13;

    if (!v4->_name || !v4->_uniqueIdentifier)
    {
      CFRelease(a3);
      a3 = 0;
      goto LABEL_20;
    }
    v4->_outputDevice = a3;
    goto LABEL_18;
  }
LABEL_20:

  return (HMDMediaOutputDevice *)a3;
}

@end