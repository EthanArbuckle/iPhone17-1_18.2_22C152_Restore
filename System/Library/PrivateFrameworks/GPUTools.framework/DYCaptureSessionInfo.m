@interface DYCaptureSessionInfo
+ (id)symbolicatorSignatureFromCaptureStore:(id)a3;
+ (int)platformOfCaptureStore:(id)a3;
+ (unsigned)graphicsAPIOfCaptureStore:(id)a3;
- (BOOL)_isBackwardsCompatible:(id)a3 isInternal:(BOOL)a4;
- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5;
- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5 withBlock:(id)a6;
- (BOOL)guestAppWasLinkedOnApexOrLater;
- (BOOL)harvestStateAtEnd;
- (BOOL)isAlmond;
- (BOOL)lockGraphicsAfterCompletion;
- (BOOL)suspendAfterCompletion;
- (BOOL)triggerOnNextGraphicsCommand;
- (DYCaptureSessionInfo)init;
- (DYCaptureSessionInfo)initWithCaptureStore:(id)a3;
- (DYDeviceInfo)controlDeviceInfo;
- (DYDeviceInfo)deviceInfo;
- (DYInterposeVersion)interposerVersion;
- (NSArray)guestAppArguments;
- (NSDictionary)configurationDictionary;
- (NSDictionary)guestAppEnvironment;
- (NSDictionary)guestAppInfoPlist;
- (NSDictionary)launchDictionary;
- (NSString)guestAppBundleIdentifier;
- (NSString)guestAppCurrentDirectory;
- (NSString)guestAppPath;
- (NSString)guestAppTitle;
- (id)labelForQueueID:(unint64_t)a3;
- (id)labelForThreadID:(unint64_t)a3;
- (int)linkTimeVersionForLibrary:(id)a3;
- (unint64_t)capturedFramesCount;
- (unsigned)frameLimit;
- (unsigned)graphicsApi;
- (unsigned)isBoundaryLess;
- (unsigned)nativePointerSize;
- (unsigned)triggerFrame;
- (void)dealloc;
- (void)setInterposerVersion:(DYInterposeVersion *)a3;
@end

@implementation DYCaptureSessionInfo

+ (unsigned)graphicsAPIOfCaptureStore:(id)a3
{
  v3 = (void *)[a3 metadataValueForKey:*MEMORY[0x263F3FA88]];
  if (v3)
  {
    LODWORD(v3) = [v3 unsignedIntValue];
  }
  return v3;
}

+ (id)symbolicatorSignatureFromCaptureStore:(id)a3
{
  v3 = (void *)[a3 copyAdjunctDataForFilename:@"(cs-sig)" error:0];
  return v3;
}

+ (int)platformOfCaptureStore:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", @"(device info)", 0), "decodeArchivedObject");
  return [v3 platform];
}

- (DYCaptureSessionInfo)init
{
  return 0;
}

- (DYCaptureSessionInfo)initWithCaptureStore:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)DYCaptureSessionInfo;
  v4 = [(DYCaptureSessionInfo *)&v16 init];
  if (v4)
  {
    v5 = (void *)[a3 metadataValueForKey:*MEMORY[0x263F3FA78]];
    if (!v5) {
      v5 = objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", @"kDYCaptureArchiveCaptureSessionInfoMetadataKey"), "objectForKey:", @"kDysonCapturedFrameCountKey");
    }
    v4->_launchDictionary = (NSDictionary *)(id)[a3 metadataValueForKey:*MEMORY[0x263F3FAA0]];
    v4->_configurationDictionary = (NSDictionary *)(id)[a3 metadataValueForKey:*MEMORY[0x263F3FA80]];
    v4->_capturedFramesCount = [v5 unsignedIntegerValue];
    v4->_guestAppWasLinkedOnApexOrLater = objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x263F3FAA8]), "BOOLValue");
    v4->_guestAppInfoPlist = (NSDictionary *)(id)[a3 metadataValueForKey:*MEMORY[0x263F3FAB0]];
    v4->_libraryLinkTimeVersions = (NSDictionary *)(id)[a3 metadataValueForKey:*MEMORY[0x263F3FAB8]];
    v4->_graphicsApi = +[DYCaptureSessionInfo graphicsAPIOfCaptureStore:a3];
    v6 = (char *)[a3 metadataValueForKey:*MEMORY[0x263F3FA90]];
    if (v6)
    {
      v4->_version.version = [v6 intValue];
      v7 = (NSString *)[a3 metadataValueForKey:*MEMORY[0x263F3FA98]];
      v4->_patchVersion = v7;
      v6 = [(NSString *)v7 UTF8String];
    }
    else
    {
      v4->_version.version = 0;
    }
    v4->_version.patch = v6;
    v4->_interposerVersion = &v4->_version;
    v8 = (void *)[a3 metadataValueForKey:*MEMORY[0x263F3FAC0]];
    if (v8) {
      unsigned int v9 = [v8 unsignedIntValue];
    }
    else {
      unsigned int v9 = +[DYDeviceInfo defaultNativePointerSize];
    }
    v4->_nativePointerSize = v9;
    v10 = (void *)[a3 metadataValueForKey:*MEMORY[0x263F3FA70]];
    if (v10) {
      v4->_isBoundaryLess = [v10 BOOLValue];
    }
    if ([a3 resolveFilename:@"(control device info)" error:0]) {
      v4->_controlDeviceInfo = (DYDeviceInfo *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", @"(control device info)", 0), "decodeArchivedObject");
    }
    if ([a3 resolveFilename:@"is_almond" error:0]) {
      v4->_isAlmond = 1;
    }
    v11 = objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", @"(queue/thread labels)", 0), "decodeArchivedObject");
    v4->_queueLabels = (NSDictionary *)(id)[v11 objectForKey:@"queues"];
    v4->_threadLabels = (NSDictionary *)(id)[v11 objectForKey:@"threads"];
    if (![a3 resolveFilename:@"(device info)" error:0])
    {
      v4->_deviceInfo = objc_alloc_init(DYDeviceInfo);
      v12 = objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", @"kDYCaptureArchiveCaptureSessionInfoMetadataKey"), "objectForKey:", @"kDYPArchiveType");
      if ([v12 isEqualToString:@"kDYEmbeddedArchiveType"])
      {
        deviceInfo = v4->_deviceInfo;
        uint64_t v14 = 2;
      }
      else
      {
        if (![v12 isEqualToString:@"kDYDesktopArchiveType"]) {
          return v4;
        }
        deviceInfo = v4->_deviceInfo;
        uint64_t v14 = 1;
      }
      [(DYDeviceInfo *)deviceInfo setPlatform:v14];
      return v4;
    }
    v4->_deviceInfo = (DYDeviceInfo *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", @"(device info)", 0), "decodeArchivedObject");
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYCaptureSessionInfo;
  [(DYCaptureSessionInfo *)&v3 dealloc];
}

- (NSString)guestAppTitle
{
  id v2 = [(NSDictionary *)self->_launchDictionary objectForKey:*MEMORY[0x263F3FC18]];
  return (NSString *)v2;
}

- (NSString)guestAppBundleIdentifier
{
  id v2 = [(NSDictionary *)self->_launchDictionary objectForKey:*MEMORY[0x263F3FBE0]];
  return (NSString *)v2;
}

- (NSString)guestAppPath
{
  id v2 = [(NSDictionary *)self->_launchDictionary objectForKey:*MEMORY[0x263F3FC08]];
  return (NSString *)v2;
}

- (NSString)guestAppCurrentDirectory
{
  id v2 = [(NSDictionary *)self->_launchDictionary objectForKey:*MEMORY[0x263F3FBF0]];
  return (NSString *)v2;
}

- (NSArray)guestAppArguments
{
  id v2 = [(NSDictionary *)self->_launchDictionary objectForKey:*MEMORY[0x263F3FBD8]];
  return (NSArray *)v2;
}

- (NSDictionary)guestAppEnvironment
{
  id v2 = [(NSDictionary *)self->_launchDictionary objectForKey:*MEMORY[0x263F3FC00]];
  return (NSDictionary *)v2;
}

- (unsigned)triggerFrame
{
  id v2 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"TriggerFrame"];
  return [v2 unsignedIntValue];
}

- (unsigned)frameLimit
{
  id v2 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"FrameLimit"];
  return [v2 unsignedIntValue];
}

- (BOOL)triggerOnNextGraphicsCommand
{
  id v2 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"TriggerOnNextGLCommand"];
  return [v2 BOOLValue];
}

- (BOOL)harvestStateAtEnd
{
  id v2 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"HarvestStateAtEnd"];
  return [v2 BOOLValue];
}

- (BOOL)suspendAfterCompletion
{
  id v2 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"SuspendAfterCompletion"];
  return [v2 BOOLValue];
}

- (BOOL)lockGraphicsAfterCompletion
{
  id v2 = [(NSDictionary *)self->_configurationDictionary objectForKey:@"LockOpenGLAfterCompletion"];
  return [v2 BOOLValue];
}

- (int)linkTimeVersionForLibrary:(id)a3
{
  id v3 = [(NSDictionary *)self->_libraryLinkTimeVersions objectForKey:a3];
  if (!v3) {
    return -1;
  }
  return [v3 intValue];
}

- (id)labelForQueueID:(unint64_t)a3
{
  queueLabels = self->_queueLabels;
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:a3];
  return [(NSDictionary *)queueLabels objectForKey:v4];
}

- (id)labelForThreadID:(unint64_t)a3
{
  threadLabels = self->_threadLabels;
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:a3];
  return [(NSDictionary *)threadLabels objectForKey:v4];
}

- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5 withBlock:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  if (objc_msgSend((id)objc_msgSend(a3, "supportedGraphicsAPIInfos"), "count"))
  {
    if (((*((uint64_t (**)(id))a6 + 2))(a6) & 1) == 0)
    {
      LOBYTE(v11) = 0;
      return v11;
    }
LABEL_6:
    LOBYTE(v11) = 1;
    return v11;
  }
  if (!v8) {
    goto LABEL_6;
  }
  BOOL v11 = [(DYCaptureSessionInfo *)self _isBackwardsCompatible:a3 isInternal:v7];
  if (v11) {
    goto LABEL_6;
  }
  return v11;
}

- (BOOL)_isBackwardsCompatible:(id)a3 isInternal:(BOOL)a4
{
  deviceInfo = self->_deviceInfo;
  return objc_msgSend((id)objc_msgSend(a3, "version"), "compare:options:", -[DYDeviceInfo version](deviceInfo, "version"), 64) != -1&& objc_msgSend((id)objc_msgSend(a3, "build"), "compare:options:", -[DYDeviceInfo build](deviceInfo, "build"), 64) != -1;
}

- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5
{
  return 0;
}

- (DYDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (DYDeviceInfo)controlDeviceInfo
{
  return self->_controlDeviceInfo;
}

- (DYInterposeVersion)interposerVersion
{
  return self->_interposerVersion;
}

- (void)setInterposerVersion:(DYInterposeVersion *)a3
{
  self->_interposerVersion = a3;
}

- (unsigned)nativePointerSize
{
  return self->_nativePointerSize;
}

- (BOOL)isAlmond
{
  return self->_isAlmond;
}

- (unint64_t)capturedFramesCount
{
  return self->_capturedFramesCount;
}

- (BOOL)guestAppWasLinkedOnApexOrLater
{
  return self->_guestAppWasLinkedOnApexOrLater;
}

- (NSDictionary)guestAppInfoPlist
{
  return self->_guestAppInfoPlist;
}

- (NSDictionary)launchDictionary
{
  return self->_launchDictionary;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (unsigned)isBoundaryLess
{
  return self->_isBoundaryLess;
}

- (unsigned)graphicsApi
{
  return self->_graphicsApi;
}

@end