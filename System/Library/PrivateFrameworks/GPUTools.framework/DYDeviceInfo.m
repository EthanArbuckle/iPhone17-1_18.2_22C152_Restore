@interface DYDeviceInfo
+ (BOOL)isSimulatorPlatform:(int)a3;
+ (BOOL)supportsSecureCoding;
+ (unsigned)defaultNativePointerSize;
- ($16123236EB3C150F368AB57B9BCDCA0E)mainScreenDescriptor;
- (BOOL)isEmbeddedPlatform;
- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3 allowedClass:(Class)a4;
- (BOOL)versionIsOlderThan:(id)a3;
- (DYDeviceInfo)initWithCoder:(id)a3;
- (NSArray)supportedGraphicsAPIInfos;
- (NSString)build;
- (NSString)descriptionForBugReport;
- (NSString)hostProductType;
- (NSString)hostVersion;
- (NSString)metalVersion;
- (NSString)name;
- (NSString)permanentIdentifier;
- (NSString)productType;
- (NSString)summaryForBugReport;
- (NSString)version;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithProfileName:(id)a3 showingProductType:(BOOL)a4 showingPermanentIdentifier:(BOOL)a5;
- (int)platform;
- (unint64_t)runtimeIdentifier;
- (unsigned)nativePointerSize;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
- (void)setHostProductType:(id)a3;
- (void)setHostVersion:(id)a3;
- (void)setMainScreenDescriptor:(id *)a3;
- (void)setMetalVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setNativePointerSize:(unsigned int)a3;
- (void)setPermanentIdentifier:(id)a3;
- (void)setPlatform:(int)a3;
- (void)setProductType:(id)a3;
- (void)setRuntimeIdentifier:(unint64_t)a3;
- (void)setSupportedGraphicsAPIInfos:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DYDeviceInfo

+ (BOOL)isSimulatorPlatform:(int)a3
{
  return (a3 < 0xB) & (0x448u >> a3);
}

+ (unsigned)defaultNativePointerSize
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYDeviceInfo)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DYDeviceInfo;
  v4 = [(DYDeviceInfo *)&v10 init];
  if (v4)
  {
    v4->_permanentIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v4->_runtimeIdentifier = [a3 decodeInt64ForKey:@"runtimeIdentifier"];
    v4->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    v4->_productType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    v4->_version = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    v4->_build = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    v4->_int platform = [a3 decodeInt32ForKey:@"platform"];
    v4->_metalVersion = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"metalVersion"];
    v4->_mainScreenDescriptor.width = [a3 decodeInt32ForKey:@"mainScreenResolution.width"];
    v4->_mainScreenDescriptor.height = [a3 decodeInt32ForKey:@"mainScreenResolution.height"];
    v4->_mainScreenDescriptor.scale = [a3 decodeInt32ForKey:@"mainScreenResolution.scale"];
    [a3 decodeDoubleForKey:@"mainScreenDescriptor.orientation"];
    v4->_mainScreenDescriptor.orientation = v5;
    v4->_mainScreenDescriptor.type = [a3 decodeInt32ForKey:@"mainScreenDescriptor.type"];
    v4->_supportedGraphicsAPIInfos = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x263F3F9E0], "graphicsAPIInfosClassSet"), @"supportedGLProfileContextsInfo");
    if ([a3 containsValueForKey:@"nativePointerSize"]) {
      unsigned int v6 = [a3 decodeInt32ForKey:@"nativePointerSize"];
    }
    else {
      unsigned int v6 = +[DYDeviceInfo defaultNativePointerSize];
    }
    v4->_nativePointerSize = v6;
    int platform = v4->_platform;
    if (platform == 7)
    {
      int v8 = 9;
      goto LABEL_9;
    }
    if (platform == 8)
    {
      int v8 = 10;
LABEL_9:
      v4->_int platform = v8;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYDeviceInfo;
  [(DYDeviceInfo *)&v3 dealloc];
}

- (id)descriptionWithProfileName:(id)a3 showingProductType:(BOOL)a4 showingPermanentIdentifier:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = (void *)[MEMORY[0x263EFF980] array];
  objc_super v10 = v9;
  if (self->_name) {
    objc_msgSend(v9, "addObject:");
  }
  if (!v6)
  {
    if (!self->_name) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([(NSString *)self->_productType length]) {
    [v10 addObject:objc_msgSend(NSString, "stringWithFormat:", @"(%@)", self->_productType)];
  }
  if (self->_name || [(NSString *)self->_productType length]) {
LABEL_10:
  }
    [v10 addObject:@"-"];
LABEL_11:
  if (a3)
  {
    [v10 addObject:a3];
    [v10 addObject:@"-"];
  }
  unsigned int v11 = self->_platform - 1;
  if (v11 <= 9 && ((0x33Fu >> v11) & 1) != 0) {
    [v10 addObject:off_265333BE0[v11]];
  }
  if (self->_version) {
    objc_msgSend(v10, "addObject:");
  }
  if (self->_build) {
    [v10 addObject:objc_msgSend(NSString, "stringWithFormat:", @"(%@)", self->_build)];
  }
  if (v5 && [(NSString *)self->_permanentIdentifier length])
  {
    [v10 addObject:@"-"];
    [v10 addObject:self->_permanentIdentifier];
  }
  return (id)[v10 componentsJoinedByString:@" "];
}

- (id)description
{
  return [(DYDeviceInfo *)self descriptionWithProfileName:0 showingProductType:1 showingPermanentIdentifier:1];
}

- (NSString)summaryForBugReport
{
  unsigned int v2 = self->_platform - 1;
  if (v2 > 9) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = off_265333C30[v2];
  }
  return (NSString *)[NSString stringWithFormat:@"%@ - %@ %@ (%@)", self->_productType, v3, self->_version, self->_build];
}

- (NSString)descriptionForBugReport
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@\n", -[DYDeviceInfo description](self, "description")];
  if (self->_hostProductType) {
    [v3 appendFormat:@"Simulator host device: %@ - %@\n", self->_hostProductType, self->_hostVersion];
  }
  [v3 appendFormat:@"Metal version: %@\n", self->_metalVersion];
  if ([(NSArray *)self->_supportedGraphicsAPIInfos count])
  {
    [v3 appendString:@"Supported graphics APIs:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    supportedGraphicsAPIInfos = self->_supportedGraphicsAPIInfos;
    uint64_t v5 = [(NSArray *)supportedGraphicsAPIInfos countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(supportedGraphicsAPIInfos);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            uint64_t v10 = [v9 descriptionForBugReport];
          }
          else {
            uint64_t v10 = [v9 description];
          }
          [v3 appendFormat:@"  %@\n", v10];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)supportedGraphicsAPIInfos countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  return (NSString *)v3;
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)DYDeviceInfo;
  return (id)[NSString stringWithFormat:@"%@\n\trid=%llu\n\tpid=%@\n\tname=%@\n\tproductType=%@\nhostProductType=%@\tplatform=%d\n\tmetalVersion=%@\n\tversion=%@\n\thostVersion=%@\n\tbuild=%@\n\tnativePointerSize=%u\n\t_supportedGraphicsAPIInfos=%@", -[DYDeviceInfo debugDescription](&v3, sel_debugDescription), self->_runtimeIdentifier, -[NSString debugDescription](self->_permanentIdentifier, "debugDescription"), -[NSString debugDescription](self->_name, "debugDescription"), -[NSString debugDescription](self->_productType, "debugDescription"), -[NSString debugDescription](self->_hostProductType, "debugDescription"), self->_platform, -[NSString debugDescription](self->_metalVersion, "debugDescription"), -[NSString debugDescription](self->_version, "debugDescription"), -[NSString debugDescription](self->_hostVersion, "debugDescription"), -[NSString debugDescription](self->_build, "debugDescription"), self->_nativePointerSize, -[NSArray debugDescription](self->_supportedGraphicsAPIInfos, "debugDescription")];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_permanentIdentifier forKey:@"identifier"];
  [a3 encodeInt64:self->_runtimeIdentifier forKey:@"runtimeIdentifier"];
  [a3 encodeObject:self->_name forKey:@"name"];
  [a3 encodeObject:self->_productType forKey:@"productType"];
  [a3 encodeObject:self->_version forKey:@"version"];
  [a3 encodeObject:self->_build forKey:@"build"];
  [a3 encodeInt32:self->_platform forKey:@"platform"];
  [a3 encodeObject:self->_metalVersion forKey:@"metalVersion"];
  [a3 encodeInt32:self->_mainScreenDescriptor.width forKey:@"mainScreenResolution.width"];
  [a3 encodeInt32:self->_mainScreenDescriptor.height forKey:@"mainScreenResolution.height"];
  [a3 encodeInt32:self->_mainScreenDescriptor.scale forKey:@"mainScreenResolution.scale"];
  [a3 encodeDouble:@"mainScreenDescriptor.orientation" forKey:self->_mainScreenDescriptor.orientation];
  [a3 encodeInt32:self->_mainScreenDescriptor.type forKey:@"mainScreenDescriptor.type"];
  [a3 encodeObject:self->_supportedGraphicsAPIInfos forKey:@"supportedGLProfileContextsInfo"];
  uint64_t nativePointerSize = self->_nativePointerSize;
  [a3 encodeInt32:nativePointerSize forKey:@"nativePointerSize"];
}

- (BOOL)isEmbeddedPlatform
{
  return [(DYDeviceInfo *)self platform] != 1;
}

- (BOOL)versionIsOlderThan:(id)a3
{
  return [(NSString *)self->_version dy_versionIsOlderThan:a3];
}

- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3 allowedClass:(Class)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3) {
    -[DYDeviceInfo supportsCapabilitiesOfGraphicsAPI:allowedClass:]();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(DYDeviceInfo *)self supportedGraphicsAPIInfos];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v10 supportsCapabilitiesOfGraphicsAPI:a3] & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_int platform = a3;
}

- (unint64_t)runtimeIdentifier
{
  return self->_runtimeIdentifier;
}

- (void)setRuntimeIdentifier:(unint64_t)a3
{
  self->_runtimeIdentifier = a3;
}

- (NSString)permanentIdentifier
{
  return self->_permanentIdentifier;
}

- (void)setPermanentIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)hostProductType
{
  return self->_hostProductType;
}

- (void)setHostProductType:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)hostVersion
{
  return self->_hostVersion;
}

- (void)setHostVersion:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)metalVersion
{
  return self->_metalVersion;
}

- (void)setMetalVersion:(id)a3
{
}

- (unsigned)nativePointerSize
{
  return self->_nativePointerSize;
}

- (void)setNativePointerSize:(unsigned int)a3
{
  self->_uint64_t nativePointerSize = a3;
}

- ($16123236EB3C150F368AB57B9BCDCA0E)mainScreenDescriptor
{
  *($F47FE06625FC0D634ED89CCC9D0BEEDA *)retstr = ($F47FE06625FC0D634ED89CCC9D0BEEDA)self[4];
  return self;
}

- (void)setMainScreenDescriptor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_mainScreenDescriptor.scale = *(void *)&a3->var3;
  *(_OWORD *)&self->_mainScreenDescriptor.orientation = v3;
}

- (NSArray)supportedGraphicsAPIInfos
{
  return self->_supportedGraphicsAPIInfos;
}

- (void)setSupportedGraphicsAPIInfos:(id)a3
{
}

- (void)supportsCapabilitiesOfGraphicsAPI:allowedClass:.cold.1()
{
}

@end