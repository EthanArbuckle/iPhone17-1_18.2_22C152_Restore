@interface BTAudioSmartRouteDevice
- (BOOL)isFormatChangeMapEmpty;
- (BTAudioSmartRouteDevice)init;
- (BTAudioSmartRouteDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4;
- (id).cxx_construct;
- (int)ownership;
- (unsigned)updateFormatChangeMap:(unsigned int)a3 newformat:(unsigned int)a4 processID:(int)a5;
- (void)clearFormatChangeMap;
- (void)dealloc;
- (void)setOwnership:(int)a3;
- (void)updateSession:(id)a3 isStart:(BOOL)a4 isInput:(BOOL)a5;
@end

@implementation BTAudioSmartRouteDevice

- (void)dealloc
{
  mFormatDict = self->_mFormatDict;
  if (mFormatDict) {

  }
  v4.receiver = self;
  v4.super_class = (Class)BTAudioSmartRouteDevice;
  [(BTAudioSmartRouteDevice *)&v4 dealloc];
}

- (BTAudioSmartRouteDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)BTAudioSmartRouteDevice;
  return [(BTAudioSmartRouteDevice *)&v3 init];
}

- (BTAudioSmartRouteDevice)initWithBluetoothInfo:(unsigned int)a3 deviceAddr:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BTAudioSmartRouteDevice;
  v6 = [(BTAudioSmartRouteDevice *)&v9 init];
  v6->_deviceID = a3;
  v6->_bdAddr = (NSString *)[objc_alloc((Class)NSString) initWithString:a4];
  v6->_session = 0;
  v6->_mFormatDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v7 = qword_A1AE8;
  if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Initialize Bluetooth Audio device in Route Manager %@ ", buf, 0xCu);
  }
  return v6;
}

- (void)clearFormatChangeMap
{
  mFormatDict = self->_mFormatDict;
  objc_super v4 = qword_A1AE8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT);
  if (mFormatDict)
  {
    if (v5)
    {
      int v6 = 138412290;
      v7 = mFormatDict;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "kBluetoothAudioDevicePropertyFormat removeAllObjects %@", (uint8_t *)&v6, 0xCu);
      mFormatDict = self->_mFormatDict;
    }
    [(NSMutableDictionary *)mFormatDict removeAllObjects];
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "kBluetoothAudioDevicePropertyFormat skip removeAllObjects", (uint8_t *)&v6, 2u);
  }
}

- (BOOL)isFormatChangeMapEmpty
{
  objc_super v3 = qword_A1AE8;
  if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
  {
    mFormatDict = self->_mFormatDict;
    int v6 = 138412290;
    v7 = mFormatDict;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "HFPStereo check FormatDict %@", (uint8_t *)&v6, 0xCu);
  }
  return [(NSMutableDictionary *)self->_mFormatDict count] == 0;
}

- (unsigned)updateFormatChangeMap:(unsigned int)a3 newformat:(unsigned int)a4 processID:(int)a5
{
  if (self->_mFormatDict)
  {
    uint64_t v5 = *(void *)&a4;
    if (a3 != 1 && a4 == 1)
    {
      id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%u", *(void *)&a5);
      v8 = +[NSNumber numberWithUnsignedInt:1];
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9)
      {
        [(NSMutableDictionary *)self->_mFormatDict setObject:v8 forKeyedSubscript:v7];

        v10 = qword_A1AE8;
        if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
        {
          mFormatDict = self->_mFormatDict;
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = mFormatDict;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "kBluetoothAudioDevicePropertyFormat dict add %@", (uint8_t *)&buf, 0xCu);
        }
      }
      return 2;
    }
    if (a3 == 1 && (a4 & 0xFFFFFFFD) == 0)
    {
      id v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%u", *(void *)&a5);
      v21 = +[NSNumber numberWithUnsignedInt:v5];
      if (v20)
      {
        if (v21)
        {
          [(NSMutableDictionary *)self->_mFormatDict setObject:v21 forKeyedSubscript:v20];

          v22 = qword_A1AE8;
          if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
          {
            v23 = self->_mFormatDict;
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v23;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "kBluetoothAudioDevicePropertyFormat dict remove %@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v30 = 0x2020000000;
      int v31 = 1;
      v24 = self->_mFormatDict;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_2FBCC;
      v28[3] = &unk_8E2F0;
      v28[4] = &buf;
      [(NSMutableDictionary *)v24 enumerateKeysAndObjectsUsingBlock:v28];
      unsigned int v25 = *(_DWORD *)(*((void *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      return v25;
    }
  }
  else
  {
    v12 = qword_A1AE8;
    if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_ERROR)) {
      sub_670FC(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v26 = qword_A1AE8;
  if (!os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT)) {
    return 2;
  }
  LOWORD(buf) = 0;
  unsigned int v25 = 2;
  _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "kBluetoothAudioDevicePropertyFormat per process check ignore", (uint8_t *)&buf, 2u);
  return v25;
}

- (void)setOwnership:(int)a3
{
  if (self->_ownership == a3) {
    goto LABEL_9;
  }
  if ((a3 & 0xFFFFFFFD) == 0) {
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    int v6 = qword_A1AE8;
    if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_ERROR)) {
      sub_67134(v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_7:
    char v5 = 0;
    goto LABEL_8;
  }
  char v5 = 1;
LABEL_8:
  self->_int ownership = a3;
  unsigned int deviceID = self->_deviceID;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2FD78;
  v18[3] = &unk_8DF48;
  v18[4] = self;
  char v19 = v5;
  sub_44BA4(qword_A2350, deviceID, v18);
LABEL_9:
  uint64_t v15 = qword_A1AE8;
  if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
  {
    bdAddr = self->_bdAddr;
    int ownership = self->_ownership;
    *(_DWORD *)long long buf = 138412546;
    v21 = bdAddr;
    __int16 v22 = 1024;
    int v23 = ownership;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Update Ownership on  %@ -> %d", buf, 0x12u);
  }
}

- (void)updateSession:(id)a3 isStart:(BOOL)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  session = self->_session;
  if (a4)
  {
    if (!session)
    {
      uint64_t v9 = qword_A1AE8;
      if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v23 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "updateSession Create Session", v23, 2u);
      }
      uint64_t v10 = [[BTAudioSmartRouteSession alloc] initWithbundleID:a3];
      self->_session = v10;
      [(BTAudioSmartRouteSession *)v10 setIsOutput:0];
      [(BTAudioSmartRouteSession *)self->_session setIsInput:0];
    }
    uint64_t v11 = self->_session;
    if (v5) {
      [(BTAudioSmartRouteSession *)v11 setIsInput:1];
    }
    else {
      [(BTAudioSmartRouteSession *)v11 setIsOutput:1];
    }
    uint64_t v12 = qword_A1AE8;
    if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        CFStringRef v13 = @"Input";
      }
      else {
        CFStringRef v13 = @"Output";
      }
      if ([(BTAudioSmartRouteSession *)self->_session isInput]) {
        CFStringRef v14 = @"true";
      }
      else {
        CFStringRef v14 = @"false";
      }
      unsigned int v15 = [(BTAudioSmartRouteSession *)self->_session isOutput];
      *(_DWORD *)int v23 = 138413314;
      if (v15) {
        CFStringRef v16 = @"true";
      }
      else {
        CFStringRef v16 = @"false";
      }
      *(void *)&v23[4] = a3;
      __int16 v24 = 1024;
      int v25 = 1;
      __int16 v26 = 2112;
      CFStringRef v27 = v13;
      __int16 v28 = 2112;
      CFStringRef v29 = v14;
      __int16 v30 = 2112;
      CFStringRef v31 = v16;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "updateSession startIO %@ isStart %d isInput %@ SInput %@, SOutput %@", v23, 0x30u);
    }
  }
  else
  {
    if (a5) {
      [(BTAudioSmartRouteSession *)session setIsInput:0];
    }
    else {
      [(BTAudioSmartRouteSession *)session setIsOutput:0];
    }
    uint64_t v17 = qword_A1AE8;
    if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        CFStringRef v18 = @"Input";
      }
      else {
        CFStringRef v18 = @"Output";
      }
      if ([(BTAudioSmartRouteSession *)self->_session isInput]) {
        CFStringRef v19 = @"true";
      }
      else {
        CFStringRef v19 = @"false";
      }
      unsigned int v20 = [(BTAudioSmartRouteSession *)self->_session isOutput];
      *(_DWORD *)int v23 = 138413314;
      if (v20) {
        CFStringRef v21 = @"true";
      }
      else {
        CFStringRef v21 = @"false";
      }
      *(void *)&v23[4] = a3;
      __int16 v24 = 1024;
      int v25 = 0;
      __int16 v26 = 2112;
      CFStringRef v27 = v18;
      __int16 v28 = 2112;
      CFStringRef v29 = v19;
      __int16 v30 = 2112;
      CFStringRef v31 = v21;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "updateSession stopIO %@ isStart %d isInput %@ SInput %@, SOutput %@", v23, 0x30u);
    }
    if (![(BTAudioSmartRouteSession *)self->_session isInput]
      && ![(BTAudioSmartRouteSession *)self->_session isOutput])
    {

      __int16 v22 = qword_A1AE8;
      if (os_log_type_enabled((os_log_t)qword_A1AE8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v23 = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "updateSession Release Session", v23, 2u);
      }
      self->_session = 0;
    }
  }
}

- (int)ownership
{
  return self->_ownership;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end