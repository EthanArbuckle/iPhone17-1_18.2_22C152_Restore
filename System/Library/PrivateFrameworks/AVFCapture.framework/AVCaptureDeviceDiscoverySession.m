@interface AVCaptureDeviceDiscoverySession
+ (AVCaptureDeviceDiscoverySession)discoverySessionWithDeviceTypes:(NSArray *)deviceTypes mediaType:(AVMediaType)mediaType position:(AVCaptureDevicePosition)position;
+ (id)allAudioDeviceTypes;
+ (id)allAudioDevices;
+ (id)allDeviceTypes;
+ (id)allDevices;
+ (id)allMetadataCameraDeviceTypes;
+ (id)allMetadataCameraDevices;
+ (id)allPointCloudDeviceTypes;
+ (id)allPointCloudDevices;
+ (id)allSupportedMultiCamDeviceSets;
+ (id)allVideoDeviceTypes;
+ (id)allVideoDevices;
+ (id)allVirtualDeviceTypes;
+ (id)allVirtualDevices;
+ (void)initialize;
- (AVCaptureDeviceDiscoverySession)init;
- (NSArray)devices;
- (NSArray)supportedMultiCamDeviceSets;
- (id)_initWithDeviceTypes:(id)a3 mediaType:(id)a4 position:(int64_t)a5 allowIOSMacEnvironment:(BOOL)a6 prefersUnsuspendedAndAllowsAnyPosition:(BOOL)a7;
- (id)description;
- (void)_handleDeviceConnectedDisconnectedNotification:(id)a3;
- (void)dealloc;
@end

@implementation AVCaptureDeviceDiscoverySession

+ (id)allMetadataCameraDeviceTypes
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera";
  v3[1] = @"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera";
  v3[2] = @"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
}

+ (id)allDeviceTypes
{
  v4[15] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AVCaptureDeviceTypeMicrophone";
  v4[1] = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
  v4[2] = @"AVCaptureDeviceTypeBuiltInTelephotoCamera";
  v4[3] = @"AVCaptureDeviceTypeBuiltInDualCamera";
  v4[4] = @"AVCaptureDeviceTypeBuiltInUltraWideCamera";
  v4[5] = @"AVCaptureDeviceTypeBuiltInDualWideCamera";
  v4[6] = @"AVCaptureDeviceTypeBuiltInTripleCamera";
  v4[7] = @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera";
  v4[8] = @"AVCaptureDeviceTypeBuiltInTrueDepthCamera";
  v4[9] = @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera";
  v4[10] = @"AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera";
  v4[11] = @"AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera";
  v4[12] = @"AVCaptureDeviceTypeBuiltInInfraredMetadataCamera";
  v4[13] = @"AVCaptureDeviceTypeExternal";
  v4[14] = @"AVCaptureDeviceTypeContinuityCamera";
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 15));
  if (AVCaptureClientAllowsDeskViewCamera()) {
    [v2 addObject:@"AVCaptureDeviceTypeDeskViewCamera"];
  }
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v2];
}

+ (id)allVideoDeviceTypes
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AVCaptureDeviceTypeBuiltInWideAngleCamera";
  v4[1] = @"AVCaptureDeviceTypeBuiltInTelephotoCamera";
  v4[2] = @"AVCaptureDeviceTypeBuiltInDualCamera";
  v4[3] = @"AVCaptureDeviceTypeBuiltInUltraWideCamera";
  v4[4] = @"AVCaptureDeviceTypeBuiltInDualWideCamera";
  v4[5] = @"AVCaptureDeviceTypeBuiltInTripleCamera";
  v4[6] = @"AVCaptureDeviceTypeBuiltInTrueDepthCamera";
  v4[7] = @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera";
  v4[8] = @"AVCaptureDeviceTypeExternal";
  v4[9] = @"AVCaptureDeviceTypeContinuityCamera";
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 10));
  if (AVCaptureClientAllowsDeskViewCamera()) {
    [v2 addObject:@"AVCaptureDeviceTypeDeskViewCamera"];
  }
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v2];
}

- (NSArray)devices
{
  return self->_devices;
}

+ (id)allVideoDevices
{
  uint64_t v2 = [a1 allVideoDeviceTypes];
  v3 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v2 mediaType:*MEMORY[0x1E4F47C68] position:0];

  return [(AVCaptureDeviceDiscoverySession *)v3 devices];
}

+ (AVCaptureDeviceDiscoverySession)discoverySessionWithDeviceTypes:(NSArray *)deviceTypes mediaType:(AVMediaType)mediaType position:(AVCaptureDevicePosition)position
{
  id v8 = objc_alloc((Class)objc_opt_class());
  uint64_t IsRunningInMacCatalystEnvironment = AVCaptureIsRunningInMacCatalystEnvironment();
  v10 = (void *)[v8 _initWithDeviceTypes:deviceTypes mediaType:mediaType position:position allowIOSMacEnvironment:IsRunningInMacCatalystEnvironment prefersUnsuspendedAndAllowsAnyPosition:AVGestaltGetBoolAnswer(@"AVGQCaptureDefaultDevicePrefersUnsuspendedAndAllowsAnyPosition")];

  return (AVCaptureDeviceDiscoverySession *)v10;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"AVCaptureDeviceWasConnectedNotification", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"AVCaptureDeviceWasDisconnectedNotification", 0);

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceDiscoverySession;
  [(AVCaptureDeviceDiscoverySession *)&v3 dealloc];
}

- (id)_initWithDeviceTypes:(id)a3 mediaType:(id)a4 position:(int64_t)a5 allowIOSMacEnvironment:(BOOL)a6 prefersUnsuspendedAndAllowsAnyPosition:(BOOL)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureDeviceDiscoverySession;
  v11 = [(AVCaptureDeviceDiscoverySession *)&v15 init];
  if (v11)
  {
    v11->_deviceTypes = (NSArray *)[a3 copy];
    v12 = (NSString *)a4;
    v11->_position = a5;
    v11->_mediaType = v12;
    if (a6 || !AVCaptureIsRunningInMacCatalystEnvironment()) {
      v13 = (NSArray *)+[AVCaptureDevice _devicesWithDeviceTypes:a3 mediaType:a4 position:a5];
    }
    else {
      v13 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v11->_devices = v13;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__handleDeviceConnectedDisconnectedNotification_, @"AVCaptureDeviceWasConnectedNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__handleDeviceConnectedDisconnectedNotification_, @"AVCaptureDeviceWasDisconnectedNotification", 0);
  }
  return v11;
}

+ (id)allVirtualDeviceTypes
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = @"AVCaptureDeviceTypeBuiltInDualCamera";
  v3[1] = @"AVCaptureDeviceTypeBuiltInDualWideCamera";
  v3[2] = @"AVCaptureDeviceTypeBuiltInTripleCamera";
  v3[3] = @"AVCaptureDeviceTypeBuiltInTrueDepthCamera";
  void v3[4] = @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
}

+ (void)initialize
{
}

- (AVCaptureDeviceDiscoverySession)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDeviceDiscoverySession;
  uint64_t v2 = [(AVCaptureDeviceDiscoverySession *)&v5 init];
  if (v2)
  {
    objc_super v3 = v2;
    NSLog(&cfstr_Avcapturedevic_4.isa);
  }
  return 0;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1EF4D21D0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  deviceTypes = self->_deviceTypes;
  uint64_t v5 = [(NSArray *)deviceTypes countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(deviceTypes);
        }
        v9 = AVCaptureDeviceTypeToString(*(void **)(*((void *)&v15 + 1) + 8 * i));
        if ([v3 length]) {
          [v3 appendString:@", "];
        }
        [v3 appendFormat:@"%@", v9];
      }
      uint64_t v6 = [(NSArray *)deviceTypes countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  if (self->_mediaType) {
    mediaType = (__CFString *)self->_mediaType;
  }
  else {
    mediaType = @"Any";
  }
  return (id)[v10 stringWithFormat:@"<%@: %p device types: [%@], media type: %@, position: %@>", v12, self, v3, mediaType, AVCaptureDevicePositionToString(self->_position)];
}

- (void)_handleDeviceConnectedDisconnectedNotification:(id)a3
{
  v4 = (void *)[a3 object];
  if (-[NSArray containsObject:](self->_deviceTypes, "containsObject:", [v4 deviceType])
    && (!self->_mediaType || objc_msgSend(v4, "hasMediaType:")))
  {
    int64_t position = self->_position;
    if (position)
    {
      if (position != [v4 position]) {
        return;
      }
      int64_t v6 = self->_position;
    }
    else
    {
      int64_t v6 = 0;
    }
    id v7 = +[AVCaptureDevice _devicesWithDeviceTypes:self->_deviceTypes mediaType:self->_mediaType position:v6];
    if (![(NSArray *)self->_devices isEqualToArray:v7])
    {
      [(AVCaptureDeviceDiscoverySession *)self willChangeValueForKey:@"supportedMultiCamDeviceSets"];
      [(AVCaptureDeviceDiscoverySession *)self willChangeValueForKey:@"devices"];

      self->_devices = (NSArray *)v7;
      self->_supportedMultiCamDeviceSets = 0;
      [(AVCaptureDeviceDiscoverySession *)self supportedMultiCamDeviceSets];
      [(AVCaptureDeviceDiscoverySession *)self didChangeValueForKey:@"devices"];
      [(AVCaptureDeviceDiscoverySession *)self didChangeValueForKey:@"supportedMultiCamDeviceSets"];
    }
  }
}

- (NSArray)supportedMultiCamDeviceSets
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  result = self->_supportedMultiCamDeviceSets;
  if (!result)
  {
    if (AVGestaltGetBoolAnswer(@"AVGQCaptureSessionSupportsMultiCamCapture"))
    {
      v4 = [(NSArray *)[(AVCaptureDeviceDiscoverySession *)self devices] objectsAtIndexes:[(NSArray *)[(AVCaptureDeviceDiscoverySession *)self devices] indexesOfObjectsPassingTest:&__block_literal_global_3]];
      uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v4);
            }
            v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ((unint64_t)objc_msgSend((id)objc_msgSend(v10, "constituentDevices"), "count") >= 2) {
              objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v10));
            }
          }
          uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v7);
      }
      if ([(NSArray *)v4 count] >= 2)
      {
        unint64_t IntegerAnswer = AVGestaltGetIntegerAnswer(@"AVGQCaptureSessionMaxMultiCamRGBStreamsSupported");
        unint64_t v12 = [(NSArray *)v4 count];
        unint64_t v13 = IntegerAnswer >= v12 ? v12 : IntegerAnswer;
        unint64_t v14 = IntegerAnswer == 0x7FFFFFFFFFFFFFFFLL ? v12 : v13;
        if (v14 >= 2)
        {
          uint64_t v15 = 1;
          uint64_t v16 = 2;
          do
          {
            long long v17 = (void *)[MEMORY[0x1E4F1CA48] array];
            uint64_t v18 = 0;
            do
              objc_msgSend(v17, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), v18++);
            while (v16 != v18);
            avcdds_addValidMultiCamCombinations(v4, ++v15, 0, v17, v5, IntegerAnswer);
          }
          while (v16++ != v14);
        }
      }
      result = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    }
    else
    {
      result = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    self->_supportedMultiCamDeviceSets = result;
  }
  return result;
}

uint64_t __62__AVCaptureDeviceDiscoverySession_supportedMultiCamDeviceSets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasMediaType:*MEMORY[0x1E4F47C68]];
}

+ (id)allDevices
{
  uint64_t v2 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", [a1 allDeviceTypes], 0, 0);

  return [(AVCaptureDeviceDiscoverySession *)v2 devices];
}

+ (id)allPointCloudDeviceTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"AVCaptureDeviceTypeBuiltInTimeOfFlightCamera";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

+ (id)allPointCloudDevices
{
  uint64_t v2 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", [a1 allPointCloudDeviceTypes], @"pcld", 0);

  return [(AVCaptureDeviceDiscoverySession *)v2 devices];
}

+ (id)allMetadataCameraDevices
{
  uint64_t v2 = [a1 allMetadataCameraDeviceTypes];
  objc_super v3 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v2 mediaType:*MEMORY[0x1E4F47C58] position:0];

  return [(AVCaptureDeviceDiscoverySession *)v3 devices];
}

+ (id)allAudioDeviceTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"AVCaptureDeviceTypeMicrophone";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

+ (id)allAudioDevices
{
  uint64_t v2 = [a1 allAudioDeviceTypes];
  objc_super v3 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v2 mediaType:*MEMORY[0x1E4F47C40] position:0];

  return [(AVCaptureDeviceDiscoverySession *)v3 devices];
}

+ (id)allVirtualDevices
{
  uint64_t v2 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", [a1 allVirtualDeviceTypes], 0, 0);

  return [(AVCaptureDeviceDiscoverySession *)v2 devices];
}

+ (id)allSupportedMultiCamDeviceSets
{
  uint64_t v2 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", [a1 allVideoDeviceTypes], 0, 0);

  return [(AVCaptureDeviceDiscoverySession *)v2 supportedMultiCamDeviceSets];
}

@end