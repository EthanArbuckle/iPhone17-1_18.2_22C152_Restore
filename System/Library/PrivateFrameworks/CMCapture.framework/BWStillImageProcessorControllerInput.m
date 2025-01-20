@interface BWStillImageProcessorControllerInput
- (BOOL)isMaster;
- (BWStillImageCaptureSettings)captureSettings;
- (BWStillImageCaptureStreamSettings)captureStreamSettings;
- (BWStillImageProcessingSettings)processingSettings;
- (BWStillImageProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWStillImageProcessorControllerInputUpdatesDelegate)delegate;
- (BWStillImageSettings)stillImageSettings;
- (FigCaptureStillImageSettings)settings;
- (NSString)portType;
- (id)description;
- (id)outputSampleBufferRouterForBufferType:(unint64_t)a3;
- (void)addBypassedProcessorType:(unint64_t)a3 forBufferTypes:(id)a4;
- (void)addOutputSampleBufferRouter:(id)a3 forBufferTypes:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation BWStillImageProcessorControllerInput

- (BWStillImageProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageProcessorControllerInput;
  v6 = [(BWStillImageProcessorControllerInput *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureStreamSettingsForPortType:", a4);
    if (v7)
    {
      v8 = (void *)v7;
      v6->_settings = (BWStillImageSettings *)a3;
      v6->_captureStreamSettings = (BWStillImageCaptureStreamSettings *)v8;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerInput;
  [(BWStillImageProcessorControllerInput *)&v3 dealloc];
}

- (BWStillImageSettings)stillImageSettings
{
  return self->_settings;
}

- (FigCaptureStillImageSettings)settings
{
  return [(BWStillImageSettings *)self->_settings requestedSettings];
}

- (BWStillImageCaptureSettings)captureSettings
{
  return [(BWStillImageSettings *)self->_settings captureSettings];
}

- (BWStillImageCaptureStreamSettings)captureStreamSettings
{
  return self->_captureStreamSettings;
}

- (BWStillImageProcessingSettings)processingSettings
{
  return [(BWStillImageSettings *)self->_settings processingSettings];
}

- (BOOL)isMaster
{
  objc_super v3 = [(BWStillImageCaptureStreamSettings *)self->_captureStreamSettings portType];
  v4 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_settings captureSettings] masterPortType];
  return [(NSString *)v3 isEqualToString:v4];
}

- (NSString)portType
{
  return [(BWStillImageCaptureStreamSettings *)self->_captureStreamSettings portType];
}

- (void)addOutputSampleBufferRouter:(id)a3 forBufferTypes:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v7 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(a4);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          if (![v11 intValue]) {
            break;
          }
          if (!self->_outputSampleBufferRoutersByBufferType) {
            self->_outputSampleBufferRoutersByBufferType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          v12 = [[BWStillImageProcessorControllerOutputRouter alloc] initWithOutputSampleBufferRouter:a3];
          [(NSMutableDictionary *)self->_outputSampleBufferRoutersByBufferType setObject:v12 forKeyedSubscript:v11];

          if (v8 == ++v10)
          {
            uint64_t v8 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
            if (v8) {
              goto LABEL_5;
            }
            return;
          }
        }
      }
    }
  }
}

- (id)outputSampleBufferRouterForBufferType:(unint64_t)a3
{
  id v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputSampleBufferRoutersByBufferType, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a3]);
  return v3;
}

- (void)addBypassedProcessorType:(unint64_t)a3 forBufferTypes:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a4);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (![v11 intValue]) {
          break;
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputSampleBufferRoutersByBufferType, "objectForKeyedSubscript:", v11), "addBypassedProcessorType:", a3);
        if (v8 == ++v10)
        {
          uint64_t v8 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v8) {
            goto LABEL_4;
          }
          return;
        }
      }
    }
  }
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_settings captureSettings] settingsID];
  uint64_t v6 = BWPhotoEncoderStringFromEncodingScheme([(BWStillImageCaptureStreamSettings *)self->_captureStreamSettings captureType]);
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, captureFlags=%@, %@, captureRequestIdentifier:%@", v4, self, v5, v6, BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureStreamSettings captureFlags](self->_captureStreamSettings, "captureFlags")), -[BWStillImageCaptureStreamSettings portType](self->_captureStreamSettings, "portType"), -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageSettings requestedSettings](self->_settings, "requestedSettings"), "captureRequestIdentifier")];
}

- (BWStillImageProcessorControllerInputUpdatesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

@end