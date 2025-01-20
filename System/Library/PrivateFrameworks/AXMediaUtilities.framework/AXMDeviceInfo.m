@interface AXMDeviceInfo
+ (id)sharedInstance;
- (NSDictionary)displayZoomSizes;
- (NSNumber)hasAmbientLightSensor;
- (NSNumber)hasDualLensCamera;
- (NSNumber)mainScreenOrientation;
- (NSNumber)mainScreenScale;
- (NSNumber)physicalMemory;
- (NSNumber)processorCount;
- (NSNumber)supports1080pPlayback;
- (NSNumber)supports720pPlayback;
- (NSNumber)supportsARM64;
- (NSNumber)supportsARMv6;
- (NSNumber)supportsARMv7;
- (NSNumber)supportsARMv7s;
- (NSString)buildVersion;
- (NSString)computerName;
- (NSString)cpuArchitecture;
- (NSString)deviceClass;
- (NSString)deviceModelNumber;
- (NSString)deviceName;
- (NSString)deviceNameClassic;
- (NSString)deviceNameGS;
- (NSString)deviceNameLocalized;
- (NSString)deviceVariant;
- (NSString)hardwareModel;
- (NSString)marketingName;
- (NSString)marketingProductName;
- (NSString)marketingVersion;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSValue)mainScreenSizeHeight;
- (NSValue)mainScreenSizeWidth;
- (id)_init;
- (id)_jetsamInfo;
- (id)privilegedSystemReport;
- (id)systemReport;
- (void)setBuildVersion:(id)a3;
- (void)setComputerName:(id)a3;
- (void)setCpuArchitecture:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceModelNumber:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceNameClassic:(id)a3;
- (void)setDeviceNameGS:(id)a3;
- (void)setDeviceNameLocalized:(id)a3;
- (void)setDeviceVariant:(id)a3;
- (void)setDisplayZoomSizes:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setHasAmbientLightSensor:(id)a3;
- (void)setHasDualLensCamera:(id)a3;
- (void)setMainScreenOrientation:(id)a3;
- (void)setMainScreenScale:(id)a3;
- (void)setMainScreenSizeHeight:(id)a3;
- (void)setMainScreenSizeWidth:(id)a3;
- (void)setMarketingName:(id)a3;
- (void)setMarketingProductName:(id)a3;
- (void)setMarketingVersion:(id)a3;
- (void)setPhysicalMemory:(id)a3;
- (void)setProcessorCount:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setSupports1080pPlayback:(id)a3;
- (void)setSupports720pPlayback:(id)a3;
- (void)setSupportsARM64:(id)a3;
- (void)setSupportsARMv6:(id)a3;
- (void)setSupportsARMv7:(id)a3;
- (void)setSupportsARMv7s:(id)a3;
@end

@implementation AXMDeviceInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_36);
  }
  v2 = (void *)sharedInstance_Info;

  return v2;
}

void __31__AXMDeviceInfo_sharedInstance__block_invoke()
{
  id v0 = [[AXMDeviceInfo alloc] _init];
  v1 = (void *)sharedInstance_Info;
  sharedInstance_Info = (uint64_t)v0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)AXMDeviceInfo;
  v2 = [(AXMDeviceInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__AXMDeviceInfo__init__block_invoke;
    block[3] = &unk_1E6117090;
    v6 = v2;
    if (_init__AXIsInternalInstallOnceToken != -1) {
      dispatch_once(&_init__AXIsInternalInstallOnceToken, block);
    }
  }
  return v3;
}

void __22__AXMDeviceInfo__init__block_invoke(uint64_t a1)
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (v2)
  {
    CFBooleanRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFBooleanGetTypeID()) {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = CFBooleanGetValue(v3) != 0;
    }
    CFRelease(v3);
  }
}

- (NSNumber)supportsARM64
{
  if (!self->_supportsARM64)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    supportsARM64 = self->_supportsARM64;
    self->_supportsARM64 = v3;
  }
  v5 = self->_supportsARM64;

  return v5;
}

- (NSNumber)supportsARMv6
{
  if (!self->_supportsARMv6)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    supportsARMv6 = self->_supportsARMv6;
    self->_supportsARMv6 = v3;
  }
  v5 = self->_supportsARMv6;

  return v5;
}

- (NSNumber)supportsARMv7
{
  if (!self->_supportsARMv7)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    supportsARMobjc_super v7 = self->_supportsARMv7;
    self->_supportsARMobjc_super v7 = v3;
  }
  v5 = self->_supportsARMv7;

  return v5;
}

- (NSNumber)supportsARMv7s
{
  if (!self->_supportsARMv7s)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    supportsARMv7s = self->_supportsARMv7s;
    self->_supportsARMv7s = v3;
  }
  v5 = self->_supportsARMv7s;

  return v5;
}

- (NSString)cpuArchitecture
{
  if (!self->_cpuArchitecture)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    cpuArchitecture = self->_cpuArchitecture;
    self->_cpuArchitecture = &v3->isa;
  }
  v5 = self->_cpuArchitecture;

  return v5;
}

- (NSNumber)processorCount
{
  processorCount = self->_processorCount;
  if (!processorCount)
  {
    if (self->_isInternalInstall)
    {
      CFTypeID v4 = NSNumber;
      processorCount = [MEMORY[0x1E4F28F80] processInfo];
      objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(processorCount, "processorCount"));
      v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v6 = self->_processorCount;
      self->_processorCount = v5;
    }
    else
    {
      self->_processorCount = (NSNumber *)&unk_1F0E93E68;
    }
  }
  objc_super v7 = self->_processorCount;

  return v7;
}

- (NSNumber)physicalMemory
{
  physicalMemory = self->_physicalMemory;
  if (!physicalMemory)
  {
    if (self->_isInternalInstall)
    {
      CFTypeID v4 = NSNumber;
      physicalMemory = [MEMORY[0x1E4F28F80] processInfo];
      objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(physicalMemory, "physicalMemory"));
      v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v6 = self->_physicalMemory;
      self->_physicalMemory = v5;
    }
    else
    {
      self->_physicalMemory = (NSNumber *)&unk_1F0E93E68;
    }
  }
  objc_super v7 = self->_physicalMemory;

  return v7;
}

- (NSNumber)supports720pPlayback
{
  if (!self->_supports720pPlayback)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    supports720pPlayback = self->_supports720pPlayback;
    self->_supports720pPlayback = v3;
  }
  v5 = self->_supports720pPlayback;

  return v5;
}

- (NSNumber)supports1080pPlayback
{
  if (!self->_supports1080pPlayback)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    supports1080pPlayback = self->_supports1080pPlayback;
    self->_supports1080pPlayback = v3;
  }
  v5 = self->_supports1080pPlayback;

  return v5;
}

- (NSNumber)hasAmbientLightSensor
{
  if (!self->_hasAmbientLightSensor)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    hasAmbientLightSensor = self->_hasAmbientLightSensor;
    self->_hasAmbientLightSensor = v3;
  }
  v5 = self->_hasAmbientLightSensor;

  return v5;
}

- (NSNumber)hasDualLensCamera
{
  if (!self->_hasDualLensCamera)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithBool:MGGetBoolAnswer()];
    }
    else
    {
      CFBooleanRef v3 = (NSNumber *)&unk_1F0E93E68;
    }
    hasDualLensCamera = self->_hasDualLensCamera;
    self->_hasDualLensCamera = v3;
  }
  v5 = self->_hasDualLensCamera;

  return v5;
}

- (NSDictionary)displayZoomSizes
{
  if (!self->_displayZoomSizes)
  {
    if (self->_isInternalInstall) {
      CFBooleanRef v3 = (NSDictionary *)MGCopyAnswer();
    }
    else {
      CFBooleanRef v3 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    displayZoomSizes = self->_displayZoomSizes;
    self->_displayZoomSizes = v3;
  }
  v5 = self->_displayZoomSizes;

  return v5;
}

- (NSString)buildVersion
{
  if (!self->_buildVersion)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    buildVersion = self->_buildVersion;
    self->_buildVersion = &v3->isa;
  }
  v5 = self->_buildVersion;

  return v5;
}

- (NSString)computerName
{
  if (!self->_computerName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    computerName = self->_computerName;
    self->_computerName = &v3->isa;
  }
  v5 = self->_computerName;

  return v5;
}

- (NSString)deviceName
{
  if (!self->_deviceName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceName = self->_deviceName;
    self->_deviceName = &v3->isa;
  }
  v5 = self->_deviceName;

  return v5;
}

- (NSString)deviceNameClassic
{
  if (!self->_deviceNameClassic)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceNameClassic = self->_deviceNameClassic;
    self->_deviceNameClassic = &v3->isa;
  }
  v5 = self->_deviceNameClassic;

  return v5;
}

- (NSString)deviceNameGS
{
  if (!self->_deviceNameGS)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceNameGS = self->_deviceNameGS;
    self->_deviceNameGS = &v3->isa;
  }
  v5 = self->_deviceNameGS;

  return v5;
}

- (NSString)deviceNameLocalized
{
  if (!self->_deviceNameLocalized)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceNameLocalized = self->_deviceNameLocalized;
    self->_deviceNameLocalized = &v3->isa;
  }
  v5 = self->_deviceNameLocalized;

  return v5;
}

- (NSString)deviceClass
{
  if (!self->_deviceClass)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceClass = self->_deviceClass;
    self->_deviceClass = &v3->isa;
  }
  v5 = self->_deviceClass;

  return v5;
}

- (NSString)deviceVariant
{
  if (!self->_deviceVariant)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceVariant = self->_deviceVariant;
    self->_deviceVariant = &v3->isa;
  }
  v5 = self->_deviceVariant;

  return v5;
}

- (NSString)hardwareModel
{
  if (!self->_hardwareModel)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    hardwareModel = self->_hardwareModel;
    self->_hardwareModel = &v3->isa;
  }
  v5 = self->_hardwareModel;

  return v5;
}

- (NSString)deviceModelNumber
{
  if (!self->_deviceModelNumber)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    deviceModelNumber = self->_deviceModelNumber;
    self->_deviceModelNumber = &v3->isa;
  }
  v5 = self->_deviceModelNumber;

  return v5;
}

- (NSString)marketingName
{
  if (!self->_marketingName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    marketingName = self->_marketingName;
    self->_marketingName = &v3->isa;
  }
  v5 = self->_marketingName;

  return v5;
}

- (NSString)marketingProductName
{
  if (!self->_marketingProductName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    marketingProductName = self->_marketingProductName;
    self->_marketingProductName = &v3->isa;
  }
  v5 = self->_marketingProductName;

  return v5;
}

- (NSString)marketingVersion
{
  if (!self->_marketingVersion)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    marketingVersion = self->_marketingVersion;
    self->_marketingVersion = &v3->isa;
  }
  v5 = self->_marketingVersion;

  return v5;
}

- (NSString)productName
{
  if (!self->_productName)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    productName = self->_productName;
    self->_productName = &v3->isa;
  }
  v5 = self->_productName;

  return v5;
}

- (NSString)productType
{
  if (!self->_productType)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    productType = self->_productType;
    self->_productType = &v3->isa;
  }
  v5 = self->_productType;

  return v5;
}

- (NSString)productVersion
{
  if (!self->_productVersion)
  {
    if (self->_isInternalInstall)
    {
      MGGetStringAnswer();
      CFBooleanRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFBooleanRef v3 = &stru_1F0E72D10;
    }
    productVersion = self->_productVersion;
    self->_productVersion = &v3->isa;
  }
  v5 = self->_productVersion;

  return v5;
}

- (NSValue)mainScreenSizeWidth
{
  if (!self->_mainScreenSizeWidth)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithInt:MGGetSInt32Answer()];
    }
    else
    {
      CFBooleanRef v3 = (NSValue *)&unk_1F0E93E68;
    }
    mainScreenSizeWidth = self->_mainScreenSizeWidth;
    self->_mainScreenSizeWidth = v3;
  }
  v5 = self->_mainScreenSizeWidth;

  return v5;
}

- (NSValue)mainScreenSizeHeight
{
  if (!self->_mainScreenSizeHeight)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = [NSNumber numberWithInt:MGGetSInt32Answer()];
    }
    else
    {
      CFBooleanRef v3 = (NSValue *)&unk_1F0E93E68;
    }
    mainScreenSizeHeight = self->_mainScreenSizeHeight;
    self->_mainScreenSizeHeight = v3;
  }
  v5 = self->_mainScreenSizeHeight;

  return v5;
}

- (NSNumber)mainScreenScale
{
  if (!self->_mainScreenScale)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = NSNumber;
      MGGetFloat32Answer();
      objc_msgSend(v3, "numberWithFloat:");
      CFTypeID v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFTypeID v4 = (NSNumber *)&unk_1F0E93E68;
    }
    mainScreenScale = self->_mainScreenScale;
    self->_mainScreenScale = v4;
  }
  v6 = self->_mainScreenScale;

  return v6;
}

- (NSNumber)mainScreenOrientation
{
  if (!self->_mainScreenOrientation)
  {
    if (self->_isInternalInstall)
    {
      CFBooleanRef v3 = NSNumber;
      MGGetFloat32Answer();
      objc_msgSend(v3, "numberWithFloat:");
      CFTypeID v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFTypeID v4 = (NSNumber *)&unk_1F0E93E68;
    }
    mainScreenOrientation = self->_mainScreenOrientation;
    self->_mainScreenOrientation = v4;
  }
  v6 = self->_mainScreenOrientation;

  return v6;
}

- (id)_jetsamInfo
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  CFBooleanRef v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  CFBooleanRef v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/LaunchDaemons"];
  id v26 = 0;
  CFTypeID v4 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v26];
  id v5 = v26;
  if (!v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    uint64_t v8 = v7;
    v18 = v4;
    v19 = v3;
    v20 = v2;
    uint64_t v9 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 pathExtension];
        if ([v12 isEqualToString:@"plist"])
        {
          v13 = [v11 path];
          int v14 = [v13 containsString:@"com.apple.jetsamproperties"];

          if (!v14) {
            continue;
          }
          id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          v16 = [v11 path];
          v12 = (void *)[v15 initWithContentsOfFile:v16];

          if (v12) {
            [v21 setObject:v12 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (!v8)
      {
        CFBooleanRef v3 = v19;
        CFBooleanRef v2 = v20;
        CFTypeID v4 = v18;
        id v5 = 0;
        goto LABEL_17;
      }
    }
  }
  v6 = AXMediaLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v5, v6);
  }
LABEL_17:

  return v21;
}

- (id)systemReport
{
  if (self->_isInternalInstall)
  {
    long long v23 = (void *)MEMORY[0x1E4F28E78];
    v37 = [(AXMDeviceInfo *)self deviceName];
    v36 = [(AXMDeviceInfo *)self deviceNameClassic];
    v35 = [(AXMDeviceInfo *)self deviceNameGS];
    v32 = [(AXMDeviceInfo *)self deviceNameLocalized];
    v34 = [(AXMDeviceInfo *)self computerName];
    v31 = [(AXMDeviceInfo *)self hardwareModel];
    v33 = [(AXMDeviceInfo *)self deviceClass];
    v20 = [(AXMDeviceInfo *)self deviceModelNumber];
    v30 = [(AXMDeviceInfo *)self deviceVariant];
    v19 = [(AXMDeviceInfo *)self cpuArchitecture];
    v29 = [(AXMDeviceInfo *)self processorCount];
    v18 = [(AXMDeviceInfo *)self physicalMemory];
    long long v22 = [(AXMDeviceInfo *)self physicalMemory];
    [v22 doubleValue];
    double v4 = v3 / 1000000.0;
    id v21 = [(AXMDeviceInfo *)self physicalMemory];
    [v21 doubleValue];
    double v6 = v5 / 1000000000.0;
    uint64_t v28 = [(AXMDeviceInfo *)self mainScreenSizeWidth];
    v27 = [(AXMDeviceInfo *)self mainScreenSizeHeight];
    id v26 = [(AXMDeviceInfo *)self mainScreenScale];
    long long v25 = [(AXMDeviceInfo *)self mainScreenOrientation];
    v17 = [(AXMDeviceInfo *)self hasAmbientLightSensor];
    uint64_t v7 = [(AXMDeviceInfo *)self hasDualLensCamera];
    v16 = [(AXMDeviceInfo *)self marketingName];
    uint64_t v8 = [(AXMDeviceInfo *)self marketingProductName];
    uint64_t v9 = [(AXMDeviceInfo *)self marketingVersion];
    v10 = [(AXMDeviceInfo *)self productName];
    v11 = [(AXMDeviceInfo *)self productType];
    v12 = [(AXMDeviceInfo *)self productVersion];
    v13 = [(AXMDeviceInfo *)self buildVersion];
    objc_msgSend(v23, "stringWithFormat:", @"----------------------------------\nAXMedia Utilities System Report:\n----------------------------------\n  Device:\n    Name: '%@' (classic:'%@') (GS:'%@') (Loc:'%@') (Computer:'%@')\n    Hardware Model: %@\n    Class: %@\n    Model Number: %@\n    Variant: %@\n  CPU:\n    Architecture: %@\n    # of Cores: %@\n  Memory:\n    Physical Memory: %@ (%.2f MB) (%.2f GB)\n  Display:\n    Size: %@ x %@\n    Scale: %@\n    Orientation: %@\n  Capabilities:\n    Has Ambient Light Sensor: %@\n    Has Dual Lens Camera: %@\n  Marketing:\n    Name: %@\n    Product Name: %@\n    Version: %@\n  Product:\n    Name: %@\n    Type: %@\n    Version: %@\n  Build:\n    Version: %@\n----------------------------------\n", v37, v36, v35, v32, v34, v31, v33, v20, v30, v19, v29, v18, *(void *)&v4, *(void *)&v6, v28, v27,
      v26,
      v25,
      v17,
      v7,
      v16,
      v8,
      v9,
      v10,
      v11,
      v12,
    uint64_t v24 = v13);

    int v14 = (__CFString *)v24;
  }
  else
  {
    int v14 = @"AXMedia Utilities System Report: <Redacted>";
  }

  return v14;
}

- (id)privilegedSystemReport
{
  double v3 = [(AXMDeviceInfo *)self systemReport];
  double v4 = [MEMORY[0x1E4F28E78] stringWithString:@"  Jetsam Info:\n"];
  double v5 = [(AXMDeviceInfo *)self _jetsamInfo];
  double v6 = [v5 allKeys];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__AXMDeviceInfo_privilegedSystemReport__block_invoke;
    v10[3] = &unk_1E6118E80;
    id v11 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@\n%@----------------------------------\n", v3, v4];

  return v8;
}

void __39__AXMDeviceInfo_privilegedSystemReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 URLByDeletingPathExtension];
  uint64_t v8 = [v7 path];
  [v5 appendFormat:@"    %@:\n", v8];

  uint64_t v9 = [v6 objectForKey:@"Version4"];

  v10 = [v9 objectForKey:@"SystemXPCService"];
  id v11 = [v10 objectForKey:@"Override"];

  v12 = [v11 objectForKey:@"com.apple.accessibility.AccessibilityUIServer"];
  if (v12)
  {
    [*(id *)(a1 + 32) appendString:@"      com.apple.accessibility.AccessibilityUIServer:\n"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_2;
    v16[3] = &unk_1E6118E58;
    id v17 = *(id *)(a1 + 32);
    [v12 enumerateKeysAndObjectsUsingBlock:v16];
  }
  v13 = [v11 objectForKey:@"com.apple.AXMediaUtilitiesService"];
  if (v13)
  {
    [*(id *)(a1 + 32) appendString:@"      com.apple.AXMediaUtilitiesService:\n"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_3;
    v14[3] = &unk_1E6118E58;
    id v15 = *(id *)(a1 + 32);
    [v13 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

uint64_t __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"        %@ -> %@\n", a2, a3];
}

uint64_t __39__AXMDeviceInfo_privilegedSystemReport__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"        %@ -> %@\n", a2, a3];
}

- (void)setSupportsARM64:(id)a3
{
}

- (void)setSupportsARMv6:(id)a3
{
}

- (void)setSupportsARMv7:(id)a3
{
}

- (void)setSupportsARMv7s:(id)a3
{
}

- (void)setSupports720pPlayback:(id)a3
{
}

- (void)setSupports1080pPlayback:(id)a3
{
}

- (void)setCpuArchitecture:(id)a3
{
}

- (void)setProcessorCount:(id)a3
{
}

- (void)setPhysicalMemory:(id)a3
{
}

- (void)setHasAmbientLightSensor:(id)a3
{
}

- (void)setHasDualLensCamera:(id)a3
{
}

- (void)setDisplayZoomSizes:(id)a3
{
}

- (void)setBuildVersion:(id)a3
{
}

- (void)setComputerName:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (void)setDeviceNameClassic:(id)a3
{
}

- (void)setDeviceNameGS:(id)a3
{
}

- (void)setDeviceNameLocalized:(id)a3
{
}

- (void)setDeviceClass:(id)a3
{
}

- (void)setDeviceVariant:(id)a3
{
}

- (void)setHardwareModel:(id)a3
{
}

- (void)setDeviceModelNumber:(id)a3
{
}

- (void)setMarketingName:(id)a3
{
}

- (void)setMarketingProductName:(id)a3
{
}

- (void)setMarketingVersion:(id)a3
{
}

- (void)setProductName:(id)a3
{
}

- (void)setProductType:(id)a3
{
}

- (void)setProductVersion:(id)a3
{
}

- (void)setMainScreenSizeWidth:(id)a3
{
}

- (void)setMainScreenSizeHeight:(id)a3
{
}

- (void)setMainScreenOrientation:(id)a3
{
}

- (void)setMainScreenScale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainScreenScale, 0);
  objc_storeStrong((id *)&self->_mainScreenOrientation, 0);
  objc_storeStrong((id *)&self->_mainScreenSizeHeight, 0);
  objc_storeStrong((id *)&self->_mainScreenSizeWidth, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_marketingVersion, 0);
  objc_storeStrong((id *)&self->_marketingProductName, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_deviceVariant, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceNameLocalized, 0);
  objc_storeStrong((id *)&self->_deviceNameGS, 0);
  objc_storeStrong((id *)&self->_deviceNameClassic, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_displayZoomSizes, 0);
  objc_storeStrong((id *)&self->_hasDualLensCamera, 0);
  objc_storeStrong((id *)&self->_hasAmbientLightSensor, 0);
  objc_storeStrong((id *)&self->_physicalMemory, 0);
  objc_storeStrong((id *)&self->_processorCount, 0);
  objc_storeStrong((id *)&self->_cpuArchitecture, 0);
  objc_storeStrong((id *)&self->_supports1080pPlayback, 0);
  objc_storeStrong((id *)&self->_supports720pPlayback, 0);
  objc_storeStrong((id *)&self->_supportsARMv7s, 0);
  objc_storeStrong((id *)&self->_supportsARMv7, 0);
  objc_storeStrong((id *)&self->_supportsARMv6, 0);

  objc_storeStrong((id *)&self->_supportsARM64, 0);
}

@end