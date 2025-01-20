@interface MRAPInputDevice
- (AVAudioFormat)format;
- (MRAPInputDevice)initWithInputDevice:(void *)a3;
- (NSArray)supportedFormats;
- (NSString)description;
- (NSString)deviceIdentifier;
- (id)audioInputBlock;
- (unsigned)mediaRemoteDeviceID;
- (void)_setRecordingState:(unsigned int)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)inputDevice;
- (void)processVoiceDataWithBuffer:(void *)a3 time:(id)a4 gain:(float)a5;
- (void)setAudioInputBlock:(id)a3;
- (void)setFormat:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation MRAPInputDevice

- (MRAPInputDevice)initWithInputDevice:(void *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MRAPInputDevice;
  v4 = [(MRAPInputDevice *)&v23 init];
  if (v4)
  {
    v4->_inputDevice = (void *)CFRetain(a3);
    if (MRVirtualVoiceInputDeviceGetDescriptor())
    {
      v5 = (void *)MRVirtualVoiceInputDeviceDescriptorCopySupportedFormats();
      id v6 = objc_alloc_init((Class)NSMutableArray);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
            id v13 = objc_alloc((Class)AVAudioFormat);
            id v14 = objc_msgSend(v13, "initWithSettings:", v12, (void)v19);
            [v6 addObject:v14];

            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }

      objc_storeStrong((id *)&v4->_supportedFormats, v6);
      v15 = (void *)MRVirtualVoiceInputDeviceDescriptorCopyDefaultFormat();
      if (v15)
      {
        v16 = (AVAudioFormat *)[objc_alloc((Class)AVAudioFormat) initWithSettings:v15];
        format = v4->_format;
        v4->_format = v16;
      }
    }
  }
  return v4;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p inputDevice = %@>", v4, self, self->_inputDevice];

  return (NSString *)v5;
}

- (void)dealloc
{
  inputDevice = self->_inputDevice;
  if (inputDevice) {
    CFRelease(inputDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)MRAPInputDevice;
  [(MRAPInputDevice *)&v4 dealloc];
}

- (id)audioInputBlock
{
  id v2 = objc_retainBlock(self->_audioInputBlock);

  return v2;
}

- (void)setAudioInputBlock:(id)a3
{
  self->_audioInputBlock = [a3 copy];

  _objc_release_x1();
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
  self->_supportedFormats = (NSArray *)[a3 copy];

  _objc_release_x1();
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return +[NSString stringWithFormat:@"%llu", [(MRAPInputDevice *)self mediaRemoteDeviceID]];
}

- (unsigned)mediaRemoteDeviceID
{
  inputDevice = self->_inputDevice;
  if (inputDevice) {
    LODWORD(inputDevice) = MRVirtualVoiceInputDeviceGetUniqueIdentifier();
  }
  return inputDevice;
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_6124((uint64_t)self, v5);
  }

  [(MRAPInputDevice *)self _setRecordingState:1 withCompletion:v4];
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_619C((uint64_t)self, v5);
  }

  [(MRAPInputDevice *)self _setRecordingState:2 withCompletion:v4];
}

- (void)processVoiceDataWithBuffer:(void *)a3 time:(id)a4 gain:(float)a5
{
  if (self->_audioInputBlock)
  {
    double var1 = a4.var1;
    double var0 = a4.var0;
    if (a3)
    {
      id v9 = [a3 buffer];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = objc_msgSend(objc_alloc((Class)AVAudioTime), "initWithHostTime:sampleTime:atRate:", +[AVAudioTime hostTimeForSeconds:](AVAudioTime, "hostTimeForSeconds:", var0), 0, var1);
    CFStringRef v14 = @"Gain";
    *(float *)&double v11 = a5;
    uint64_t v12 = +[NSNumber numberWithFloat:v11];
    v15 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    (*((void (**)(void))self->_audioInputBlock + 2))();
  }
  else
  {
    id v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_6214(v9);
    }
  }
}

- (void)_setRecordingState:(unsigned int)a3 withCompletion:(id)a4
{
  id v5 = a4;
  if (self->_inputDevice)
  {
    MRVirtualVoiceInputDeviceGetUniqueIdentifier();
    id v7 = v5;
    MRVirtualVoiceInputSetRecordingState();
  }
  else
  {
    id v6 = +[NSError mrap_errorWithCode:1];
    (*((void (**)(id, void *))v5 + 2))(v5, v6);
  }
}

- (void)inputDevice
{
  return self->_inputDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_supportedFormats, 0);

  objc_storeStrong(&self->_audioInputBlock, 0);
}

@end