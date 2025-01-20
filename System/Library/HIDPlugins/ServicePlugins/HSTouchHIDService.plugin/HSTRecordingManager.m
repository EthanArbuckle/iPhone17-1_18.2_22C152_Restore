@interface HSTRecordingManager
+ (Class)hsProxyClass;
- (BOOL)saveRecording:(id)a3;
- (BOOL)writeRecordingToPath:(id)a3;
- (HSTRecordingManager)initWithPlaybackQueue:(id)a3;
- (id).cxx_construct;
- (id)HSTRecordingManagerProxy_saveRecording:(id)a3;
- (id)_recordingNameWithSuffix:(id)a3;
- (id)_recordingsDir;
- (id)preferenceValueForKey:(id)a3;
- (id)preferences;
- (void)setPreferenceValue:(id)a3 forKey:(id)a4;
- (void)stage:(id)a3 postedNotification:(id)a4;
@end

@implementation HSTRecordingManager

- (HSTRecordingManager)initWithPlaybackQueue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HSTRecordingManager;
  v5 = [(HSRecordingPlaybackStage *)&v10 initWithPlaybackQueue:v4];
  v6 = v5;
  if (v5)
  {
    [(HSStage *)v5 addStageObserver:v5];
    v9[0] = (id)0xAAAAAAAAAAAAAAAALL;
    v9[1] = (id)0xAAAAAAAAAAAAAAAALL;
    HSUtil::ObjectLock::ObjectLock((uint64_t)v9, v6);
    [(HSRecordingPlaybackStage *)v6 recordingSetMaxSize:v6->_state.maxSizeMB << 20];
    v7 = v6;
    HSUtil::ObjectLock::~ObjectLock(v9);
  }

  return v6;
}

- (BOOL)writeRecordingToPath:(id)a3
{
  id v4 = a3;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = v5;
  long long v11 = v5;
  long long v9 = v5;
  id v6 = v4;
  HSUtil::File::File((HSUtil::File *)&v9, (const char *)objc_msgSend(v6, "UTF8String", v9, v10, v11), 0x1A4u);
  if (!(_BYTE)v12)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTRecordingManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTRecordingManager writeRecordingToPath:]();
    }
    goto LABEL_8;
  }
  if (![(HSRecordingPlaybackStage *)self recordingCopyDataTo:(char *)&v9 + 8])
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTRecordingManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTRecordingManager writeRecordingToPath:]();
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  BOOL v7 = 1;
LABEL_9:
  HSUtil::File::~File((HSUtil::File *)&v9);

  return v7;
}

- (id)_recordingsDir
{
  return +[NSString stringWithUTF8String:"/var/mobile/Library/Logs/Touch/Recordings"];
}

- (id)_recordingNameWithSuffix:(id)a3
{
  v3 = +[NSString stringWithFormat:@"TouchRecording-%@.hscoder", a3];

  return v3;
}

- (BOOL)saveRecording:(id)a3
{
  long long v5 = (NSString *)a3;
  if (!v5)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HSTRecordingManager.mm", 57, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v6 = +[NSFileManager defaultManager];
  BOOL v7 = +[NSString stringWithUTF8String:"/private/var/tmp/com.apple.hid.HIDSensing.Recordings"];
  NSFileAttributeKey v21 = NSFilePosixPermissions;
  v22 = &off_149AF0;
  v8 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  unsigned __int8 v9 = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v8 error:0];

  if ((v9 & 1) == 0)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTRecordingManager.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTRecordingManager saveRecording:].cold.4();
    }
    goto LABEL_11;
  }
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "%s/recording.XXX", "/private/var/tmp/com.apple.hid.HIDSensing.Recordings");
  int v10 = mkstemp(__b);
  if (v10 < 0)
  {
    memset(v19, 170, sizeof(v19));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTRecordingManager.mm", v19);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTRecordingManager saveRecording:]();
    }
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[1] = v11;
  v17[2] = v11;
  v17[0] = v11;
  HSUtil::File::File((HSUtil::File *)v17, v10);
  if ([(HSRecordingPlaybackStage *)self recordingCopyDataTo:(char *)v17 + 8])
  {
    HSUtil::File::flush((HSUtil::File *)v17);
    unint64_t v12 = +[NSString stringWithUTF8String:__b];
    HSAccessProvider::MoveFile(v12, v5, v13);

    BOOL v14 = 1;
  }
  else
  {
    memset(v19, 170, sizeof(v19));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTRecordingManager.mm", v19);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTRecordingManager saveRecording:]();
    }
    BOOL v14 = 0;
  }
  HSUtil::File::~File((HSUtil::File *)v17);
LABEL_16:

  return v14;
}

- (void)stage:(id)a3 postedNotification:(id)a4
{
  long long v5 = (HSTRecordingManager *)a3;
  id v8 = (id)0xAAAAAAAAAAAAAAAALL;
  id v9 = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)&v8, self);
  if (v5 == self && (BOOL v6 = [(HSRecordingPlaybackStage *)v5 mode] == 1, v5->_state.recording != v6))
  {
    v5->_state.recording = v6;
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  [v9 unlock];
  LOBYTE(v8) = 0;
  if (v7) {
    -[HSStage postNotification:](self, "postNotification:", HSPreferenceChangedNotification, v8);
  }
  HSUtil::ObjectLock::~ObjectLock(&v8);
}

- (id)preferences
{
  {
    id v4 = [[HSPreference alloc] initWithKey:@"recordingEnabled" name:@"Record" description:@"Record the input and state of the Touch pipeline"];
    v6[0] = v4;
    long long v5 = [[HSPreference alloc] initWithKey:@"maxSize" name:@"Max Size (MB)" description:@"Maximum size of recording"];
    v6[1] = v5;
    -[HSTRecordingManager preferences]::prefs = +[NSArray arrayWithObjects:v6 count:2];
  }
  v2 = (void *)-[HSTRecordingManager preferences]::prefs;

  return v2;
}

- (id)preferenceValueForKey:(id)a3
{
  id v4 = a3;
  v8[0] = (id)0xAAAAAAAAAAAAAAAALL;
  v8[1] = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v8, self);
  if ([v4 isEqualToString:@"recordingEnabled"])
  {
    uint64_t v5 = +[NSNumber numberWithBool:self->_state.recording];
LABEL_5:
    BOOL v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"maxSize"])
  {
    uint64_t v5 = +[NSNumber numberWithUnsignedLong:self->_state.maxSizeMB];
    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_7:
  HSUtil::ObjectLock::~ObjectLock(v8);

  return v6;
}

- (void)setPreferenceValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v13 = (id)0xAAAAAAAAAAAAAAAALL;
  HSUtil::ObjectLock::ObjectLock((uint64_t)&v12, self);
  if ([v7 isEqualToString:@"recordingEnabled"])
  {
    id v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v8)
      {
        id v9 = [v8 BOOLValue];
        self->_state.recording = (char)v9;
        [(HSRecordingPlaybackStage *)self setMode:v9];
LABEL_9:
        int v11 = 1;
LABEL_12:

        goto LABEL_14;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"maxSize"])
  {
    id v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v8)
      {
        unint64_t v10 = (unint64_t)[v8 unsignedIntegerValue];
        self->_state.maxSizeMB = v10;
        [(HSRecordingPlaybackStage *)self recordingSetMaxSize:v10 << 20];
        goto LABEL_9;
      }
LABEL_11:
      int v11 = 0;
      goto LABEL_12;
    }
LABEL_10:

    id v8 = 0;
    goto LABEL_11;
  }
  int v11 = 0;
LABEL_14:
  [v13 unlock];
  LOBYTE(v12) = 0;
  if (v11) {
    -[HSStage postNotification:](self, "postNotification:", HSPreferenceChangedNotification, v12);
  }
  HSUtil::ObjectLock::~ObjectLock(&v12);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 168) = 0;
  *((void *)self + 22) = 1;
  return self;
}

+ (Class)hsProxyClass
{
  return (Class)objc_opt_class();
}

- (id)HSTRecordingManagerProxy_saveRecording:(id)a3
{
  v3 = HSProxySynth::HSTRecordingManagerProxy_saveRecording_call1<BOOL>(self, a3);

  return v3;
}

- (void)writeRecordingToPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)writeRecordingToPath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)saveRecording:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136446210;
  uint64_t v5 = v3;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "HSAccessProvider::MoveFile failed: %{public}s", (uint8_t *)&v4, 0xCu);
}

- (void)saveRecording:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)saveRecording:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)saveRecording:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end