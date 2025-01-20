@interface CSAudioInjectionXPC
- (AudioStreamBasicDescription)_outASBDWithNumChannels:(SEL)a3;
- (CSAudioInjectionXPC)init;
- (void)connectDeviceWithUUID:(id)a3 completion:(id)a4;
- (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 completion:(id)a7;
- (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4;
- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withScaleFactor:(float)a5 completion:(id)a6;
- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withScaleFactor:(float)a5 withNumChannels:(int)a6 completion:(id)a7;
- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withScaleFactor:(float)a5 withNumChannels:(int)a6 withUserIntentOptions:(id)a7 completion:(id)a8;
- (void)pingpong:(id)a3 completion:(id)a4;
- (void)primaryInputDeviceUUIDWithCompletion:(id)a3;
@end

@implementation CSAudioInjectionXPC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectionProviderExclave, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceMapTable, 0);
}

- (AudioStreamBasicDescription)_outASBDWithNumChannels:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate];
  result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", v4);
  long long v7 = v9;
  *(_OWORD *)&retstr->mSampleRate = v8;
  *(_OWORD *)&retstr->mBytesPerPacket = v7;
  *(void *)&retstr->mBitsPerChannel = v10;
  return result;
}

- (void)primaryInputDeviceUUIDWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[CSAudioInjectionXPC primaryInputDeviceUUIDWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Request fetching primary input device", (uint8_t *)&v9, 0xCu);
  }
  v5 = +[CSAudioInjectionProvider defaultInjectionProvider];
  v6 = [v5 primaryInputDevice];

  if (!v6)
  {
    long long v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSAudioInjectionXPC primaryInputDeviceUUIDWithCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Error fetching primary device!", (uint8_t *)&v9, 0xCu);
      if (!v3) {
        goto LABEL_10;
      }
    }
    else if (!v3)
    {
      goto LABEL_10;
    }
    long long v7 = +[NSError errorWithDomain:CSErrorDomain code:1504 userInfo:0];
    (*((void (**)(id, void, void *, void))v3 + 2))(v3, 0, v7, 0);
    goto LABEL_9;
  }
  if (v3)
  {
    long long v7 = [v6 deviceUID];
    (*((void (**)(id, uint64_t, void, void *))v3 + 2))(v3, 1, 0, v7);
LABEL_9:
  }
LABEL_10:
}

- (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  long long v7 = (void (**)(id, void, void *))a4;
  long long v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSAudioInjectionXPC disconnectDeviceWithUUID:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Request disconnect device with UUID %@", buf, 0x16u);
  }
  if (!v6)
  {
    uint64_t v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAudioInjectionXPC disconnectDeviceWithUUID:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s input device uuid is nil", buf, 0xCu);
      if (!v7) {
        goto LABEL_8;
      }
    }
    else if (!v7)
    {
      goto LABEL_8;
    }
    v11 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    v7[2](v7, 0, v11);

    goto LABEL_8;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009F52C;
  block[3] = &unk_100253280;
  block[4] = self;
  id v13 = v6;
  v14 = v7;
  dispatch_async(queue, block);

LABEL_8:
}

- (void)connectDeviceWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  long long v7 = (void (**)(id, void, void *))a4;
  long long v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSAudioInjectionXPC connectDeviceWithUUID:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Request connect device with UUID %@", buf, 0x16u);
  }
  if (!v6)
  {
    uint64_t v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAudioInjectionXPC connectDeviceWithUUID:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s input device uuid is nil", buf, 0xCu);
      if (!v7) {
        goto LABEL_8;
      }
    }
    else if (!v7)
    {
      goto LABEL_8;
    }
    v11 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    v7[2](v7, 0, v11);

    goto LABEL_8;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009F8B8;
  block[3] = &unk_100253280;
  block[4] = self;
  id v13 = v6;
  v14 = v7;
  dispatch_async(queue, block);

LABEL_8:
}

- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withScaleFactor:(float)a5 withNumChannels:(int)a6 withUserIntentOptions:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[CSAudioInjectionXPC injectAudio:toDeviceWithUUID:withScaleFactor:withNumChannels:withUserIntentOptions:completion:]";
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2048;
    double v39 = a5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Request inject audio %@ into device with UUID %@ and scale factor %f", buf, 0x2Au);
  }
  if (!v14
    || (+[NSFileManager defaultManager],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v14 path],
        v20 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v21 = [v19 fileExistsAtPath:v20],
        v20,
        v19,
        (v21 & 1) == 0))
  {
    v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSAudioInjectionXPC injectAudio:toDeviceWithUUID:withScaleFactor:withNumChannels:withUserIntentOptions:completion:]";
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Audio url %@ is nil, or url not existing in path", buf, 0x16u);
      if (!v17) {
        goto LABEL_9;
      }
    }
    else if (!v17)
    {
      goto LABEL_9;
    }
    v24 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, void, void *, void, void))v17 + 2))(v17, 0, v24, 0, 0);

    goto LABEL_9;
  }
  queue = self->_queue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10009FC1C;
  v25[3] = &unk_100252230;
  v25[4] = self;
  id v26 = v14;
  id v29 = v17;
  id v27 = v15;
  float v30 = a5;
  int v31 = a6;
  id v28 = v16;
  dispatch_async(queue, v25);

LABEL_9:
}

- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withScaleFactor:(float)a5 withNumChannels:(int)a6 completion:(id)a7
{
}

- (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withScaleFactor:(float)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v26 = "-[CSAudioInjectionXPC injectAudio:toDeviceWithUUID:withScaleFactor:completion:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2048;
    double v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Request inject audio %@ into device with UUID %@ and scale factor %f", buf, 0x2Au);
  }
  if (!v10
    || (+[NSFileManager defaultManager],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v10 path],
        id v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v14 fileExistsAtPath:v15],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    id v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[CSAudioInjectionXPC injectAudio:toDeviceWithUUID:withScaleFactor:completion:]";
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Audio url %@ is nil, or url not existing in path", buf, 0x16u);
      if (!v12) {
        goto LABEL_9;
      }
    }
    else if (!v12)
    {
      goto LABEL_9;
    }
    v19 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, void, void *, void, void))v12 + 2))(v12, 0, v19, 0, 0);

    goto LABEL_9;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A02EC;
  block[3] = &unk_100250498;
  block[4] = self;
  id v21 = v11;
  id v23 = v12;
  id v22 = v10;
  float v24 = a5;
  dispatch_async(queue, block);

LABEL_9:
}

- (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, uint64_t, void, void *))a7;
  unsigned __int8 v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    float v24 = "-[CSAudioInjectionXPC createAudioInjectionDeviceWithType:deviceName:deviceID:productID:completion:]";
    __int16 v25 = 2048;
    int64_t v26 = a3;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Request to init device with deviceType : %ld, deviceName : %@, deviceId : %@, productId : %@", buf, 0x34u);
  }
  id v17 = [[CSAudioInjectionDevice alloc] initWithDeviceType:a3 deviceName:v12 deviceID:v13 productID:v14];
  id v18 = v17;
  if (v17)
  {
    queue = self->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000A0854;
    v21[3] = &unk_100253B08;
    v21[4] = self;
    id v22 = v17;
    dispatch_async(queue, v21);
  }
  if (v15)
  {
    v20 = [(CSAudioInjectionDevice *)v18 deviceUID];
    v15[2](v15, 1, 0, v20);
  }
}

- (void)pingpong:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [a3 copy];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (CSAudioInjectionXPC)init
{
  v16.receiver = self;
  v16.super_class = (Class)CSAudioInjectionXPC;
  v2 = [(CSAudioInjectionXPC *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioInjectionXPC Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    if (+[CSUtils isExclaveHardware])
    {
      v5 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = "-[CSAudioInjectionXPC init]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s starting the injection provider for exclave", buf, 0xCu);
      }
      id v6 = objc_alloc_init(CSAudioInjectionProviderExclave);
      injectionProviderExclave = v2->_injectionProviderExclave;
      v2->_injectionProviderExclave = v6;

      [(CSAudioInjectionProviderExclave *)v2->_injectionProviderExclave start];
    }
    else
    {
      uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
      deviceMapTable = v2->_deviceMapTable;
      v2->_deviceMapTable = (NSMapTable *)v8;

      id v10 = +[CSAudioInjectionProvider defaultInjectionProvider];
      id v11 = [v10 primaryInputDevice];

      if (v11)
      {
        if (CSHasAOP())
        {
          [v11 setEnableAlwaysOnVoiceTrigger:1];
          id v12 = +[CSAudioInjectionProvider defaultInjectionProvider];
          [v12 start];
        }
        id v13 = v2->_deviceMapTable;
        id v14 = [v11 deviceUID];
        [(NSMapTable *)v13 setObject:v11 forKey:v14];
      }
    }
  }
  return v2;
}

@end