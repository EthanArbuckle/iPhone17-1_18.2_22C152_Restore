@interface ATAudioSessionClientImpl
- (ATAudioSessionClientImpl)initWithSession:(id)a3;
- (ATAudioSessionClientImpl)initWithStrongSession:(id)a3;
- (AVAudioSession)avas;
- (BOOL)isConfigured;
- (BOOL)isValid;
- (id).cxx_construct;
- (int)AudioSessionAddPropertyListenerImpl:(unsigned int)a3 userProc:(void *)a4 userData:(void *)a5;
- (int)AudioSessionGetPropertyImpl:(unsigned int)a3 size:(unsigned int *)a4 data:(void *)a5;
- (int)AudioSessionGetPropertySizeImpl:(unsigned int)a3 size:(unsigned int *)a4;
- (int)AudioSessionRemovePropertyListenerImpl:(unsigned int)a3;
- (int)AudioSessionRemovePropertyListenerWithUserDataImpl:(unsigned int)a3 userProc:(void *)a4 userData:(void *)a5;
- (int)AudioSessionSetActiveImpl:(unsigned __int8)a3 flags:(unsigned int)a4;
- (int)AudioSessionSetPropertyImpl:(unsigned int)a3 size:(unsigned int)a4 data:(const void *)a5;
- (int)resetClientConfiguration;
- (int)setClientConfiguration:(__CFRunLoop *)a3 runLoopMode:(__CFString *)a4 listenerProc:(void *)a5 userData:(void *)a6;
- (unsigned)interruptionType;
- (void)addAVAudioSessionKVOObservers:(unsigned int)a3 session:(id)a4;
- (void)addNSNotificationListenerFor:(id)a3 session:(id)a4 block:(id)a5;
- (void)addNSNotificationListenerFor:(id)a3 session:(id)a4 selector:(SEL)a5;
- (void)callPropertyListeners:(unsigned int)a3 data:(id)a4;
- (void)clientInterruptionListenerProc;
- (void)clientUserData;
- (void)handleInterruption:(id)a3;
- (void)handleRouteChange:(id)a3;
- (void)handleServerDeath:(id)a3;
- (void)handleServerReset:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAVAudioSessionKVOObservers:(unsigned int)a3;
- (void)setClientInterruptionListenerProc:(void *)a3;
- (void)setClientUserData:(void *)a3;
- (void)setInterruptionType:(unsigned int)a3;
- (void)setIsConfigured:(BOOL)a3;
@end

@implementation ATAudioSessionClientImpl

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = (char *)self + 48;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = (char *)self + 72;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  mCFObject = self->_clientRunLoopMode.mObject.mCFObject;
  if (mCFObject) {
    CFRelease(mCFObject);
  }
  v4 = self->_clientRunLoop.mCFObject;
  if (v4) {
    CFRelease(v4);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>>>::destroy((void *)self->_newNotificationCenterObservers.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>>>::destroy((void *)self->_oldNotificationCenterObservers.__tree_.__pair1_.__value_.__left_);
  value = self->_propertyListeners.__ptr_.__value_;
  self->_propertyListeners.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<AudioSessionPropertyListeners>::operator()[abi:ne180100]((uint64_t)value);
  }
  objc_storeStrong((id *)&self->_propertyManager, 0);
  objc_storeStrong((id *)&self->_strongSession, 0);

  objc_destroyWeak((id *)&self->_weakSession);
}

- (void)setIsConfigured:(BOOL)a3
{
  self->_isConfigured = a3;
}

- (BOOL)isConfigured
{
  return self->_isConfigured;
}

- (void)setClientUserData:(void *)a3
{
  self->_clientUserData = a3;
}

- (void)clientUserData
{
  return self->_clientUserData;
}

- (void)setClientInterruptionListenerProc:(void *)a3
{
  self->_clientInterruptionListenerProc = a3;
}

- (void)clientInterruptionListenerProc
{
  return self->_clientInterruptionListenerProc;
}

- (void)setInterruptionType:(unsigned int)a3
{
  self->_interruptionType = a3;
}

- (unsigned)interruptionType
{
  return self->_interruptionType;
}

- (void)callPropertyListeners:(unsigned int)a3 data:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!self->_clientRunLoop.mCFObject || !self->_clientRunLoopMode.mObject.mCFObject)
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v9) {
        goto LABEL_12;
      }
    }
    else
    {
      v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "ATAudioSessionClientImpl.mm";
      __int16 v18 = 1024;
      int v19 = 702;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to call property listener: Either clientRunLoop or clientRunLoopMode is invalid", location, 0x12u);
    }
    goto LABEL_11;
  }
  if (!self->_propertyListeners.__ptr_.__value_)
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v9) {
        goto LABEL_12;
      }
    }
    else
    {
      v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "ATAudioSessionClientImpl.mm";
      __int16 v18 = 1024;
      int v19 = 708;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: 'propertyListener' is invalid", location, 0x12u);
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_initWeak((id *)location, self);
  mCFObject = self->_clientRunLoop.mCFObject;
  v8 = self->_clientRunLoopMode.mObject.mCFObject;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__ATAudioSessionClientImpl_callPropertyListeners_data___block_invoke;
  v12[3] = &unk_1E5B13B70;
  objc_copyWeak(&v15, (id *)location);
  unsigned int v16 = a3;
  id v13 = v6;
  v14 = self;
  CFRunLoopPerformBlock(mCFObject, v8, v12);
  CFRunLoopWakeUp(self->_clientRunLoop.mCFObject);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);
LABEL_12:
}

void __55__ATAudioSessionClientImpl_callPropertyListeners_data___block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  WeakRetained = (AudioSessionPropertyListeners **)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_18;
  }
  int v4 = *(_DWORD *)(a1 + 56);
  if (v4 <= 1684628835)
  {
    if (v4 > 1667788642)
    {
      if (v4 != 1667788643)
      {
        if (v4 != 1667788662) {
          goto LABEL_18;
        }
LABEL_16:
        [*(id *)(a1 + 32) floatValue];
        int v15 = v6;
        AudioSessionPropertyListeners::CallPropertyListeners(v3[4], *(unsigned int *)(a1 + 56), (const void *)4, (uint64_t)&v15);
        goto LABEL_18;
      }
    }
    else if (v4 != 1634296182)
    {
      int v5 = 1667787107;
LABEL_12:
      if (v4 != v5) {
        goto LABEL_18;
      }
    }
    int v15 = [*(id *)(a1 + 32) unsignedIntValue];
    AudioSessionPropertyListeners::CallPropertyListeners(v3[4], *(unsigned int *)(a1 + 56), (const void *)4, (uint64_t)&v15);
    goto LABEL_18;
  }
  if (v4 <= 1768387426)
  {
    if (v4 == 1684628836)
    {
      AudioSessionPropertyListeners::CallPropertyListeners(WeakRetained[4], 1684628836, (const void *)4, 0);
      goto LABEL_18;
    }
    int v5 = 1768382838;
    goto LABEL_12;
  }
  if (v4 == 1768387427) {
    goto LABEL_16;
  }
  if (v4 != 1919902568)
  {
    int v5 = 1768846450;
    goto LABEL_12;
  }
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  if (v7)
  {
    v8 = v7;
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F4E9C0]];
    id v10 = +[ATAudioSessionUtils getRouteDescriptionFromAVASRouteDescription:v9];

    id v11 = [v8 currentRoute];
    v12 = +[ATAudioSessionUtils getRouteDescriptionFromAVASRouteDescription:v11];

    v16[0] = @"OutputDeviceDidChange_Reason";
    id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F4E9C8]];
    v17[0] = v13;
    v17[1] = v10;
    v16[1] = @"ActiveAudioRouteDidChange_OldDetailedRoute";
    v16[2] = @"ActiveAudioRouteDidChange_NewDetailedRoute";
    v17[2] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    AudioSessionPropertyListeners::CallPropertyListeners(v3[4], *(unsigned int *)(a1 + 56), (const void *)8, (uint64_t)v14);
  }
LABEL_18:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v13 = +[ATAudioSessionUtils getAudioSessionProperty:v15];
    v14 = [v10 objectForKey:*MEMORY[0x1E4F284C8]];
    [(ATAudioSessionClientImpl *)self callPropertyListeners:v13 data:v14];
  }
}

- (void)handleServerReset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    int v4 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    int v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "ATAudioSessionClientImpl.mm";
    __int16 v8 = 1024;
    int v9 = 683;
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server reset notification received", (uint8_t *)&v6, 0x12u);
  }

LABEL_8:
}

- (void)handleServerDeath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    id v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "ATAudioSessionClientImpl.mm";
    __int16 v9 = 1024;
    int v10 = 675;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server death notification received", (uint8_t *)&v7, 0x12u);
  }

LABEL_8:
  [(ATAudioSessionClientImpl *)self callPropertyListeners:1684628836 data:0];
  [(ATAudioSessionClientImpl *)self resetClientConfiguration];
}

- (void)handleRouteChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    id v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  int v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [v4 userInfo];
    int v17 = 136315650;
    __int16 v18 = "ATAudioSessionClientImpl.mm";
    __int16 v19 = 1024;
    int v20 = 649;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Route change received %@", (uint8_t *)&v17, 0x1Cu);
  }
LABEL_8:
  if (v4)
  {
    __int16 v9 = [v4 userInfo];
    int v10 = v9;
    if (!v9)
    {
      if (kAudioSessionClientLogSubsystem)
      {
        v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14) {
          goto LABEL_26;
        }
      }
      else
      {
        v14 = MEMORY[0x1E4F14500];
        id v15 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        __int16 v18 = "ATAudioSessionClientImpl.mm";
        __int16 v19 = 1024;
        int v20 = 660;
        _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to post route change:Invalid notification info", (uint8_t *)&v17, 0x12u);
      }

      goto LABEL_26;
    }
    uint64_t v11 = [v9 objectForKey:*MEMORY[0x1E4F4E9C8]];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      if (kAudioSessionClientLogSubsystem)
      {
        uint64_t v13 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v13) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        __int16 v18 = "ATAudioSessionClientImpl.mm";
        __int16 v19 = 1024;
        int v20 = 666;
        _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d nil route change reason", (uint8_t *)&v17, 0x12u);
      }
    }
LABEL_25:
    [(ATAudioSessionClientImpl *)self callPropertyListeners:1919902568 data:v10];
LABEL_26:
  }
}

- (void)handleInterruption:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    id v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  int v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [v4 userInfo];
    *(_DWORD *)buf = 136315650;
    v26 = "ATAudioSessionClientImpl.mm";
    __int16 v27 = 1024;
    int v28 = 595;
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption received %@", buf, 0x1Cu);
  }
LABEL_8:
  if (v4)
  {
    __int16 v9 = [v4 userInfo];
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectForKey:*MEMORY[0x1E4F4E860]];
      uint64_t v12 = [v11 unsignedLongValue];
      if (v12)
      {
        BOOL v13 = v12 == 1;
      }
      else
      {
        v14 = [v10 objectForKey:*MEMORY[0x1E4F4E840]];
        -[ATAudioSessionClientImpl setInterruptionType:](self, "setInterruptionType:", [v14 unsignedIntValue]);

        BOOL v13 = 0;
      }
      objc_initWeak((id *)buf, self);
      if ([(ATAudioSessionClientImpl *)self clientInterruptionListenerProc])
      {
        mCFObject = self->_clientRunLoop.mCFObject;
        id v16 = self->_clientRunLoopMode.mObject.mCFObject;
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        __int16 v21 = __47__ATAudioSessionClientImpl_handleInterruption___block_invoke;
        v22 = &unk_1E5B13B48;
        objc_copyWeak(&v23, (id *)buf);
        BOOL v24 = v13;
        CFRunLoopPerformBlock(mCFObject, v16, &v19);
        objc_destroyWeak(&v23);
      }
      int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13, v19, v20, v21, v22);
      [(ATAudioSessionClientImpl *)self callPropertyListeners:1768846450 data:v17];

      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (kAudioSessionClientLogSubsystem)
      {
        uint64_t v11 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v11) {
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v11 = MEMORY[0x1E4F14500];
        id v18 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "ATAudioSessionClientImpl.mm";
        __int16 v27 = 1024;
        int v28 = 606;
        _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to post interruption:Invalid notification info", buf, 0x12u);
      }
    }

LABEL_20:
  }
}

void __47__ATAudioSessionClientImpl_handleInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    (*((void (**)(void, void))WeakRetained + 14))(*((void *)WeakRetained + 15), *(unsigned int *)(a1 + 40));
  }
}

- (void)removeAVAudioSessionKVOObservers:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    id v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    BOOL v13 = "ATAudioSessionClientImpl.mm";
    __int16 v14 = 1024;
    int v15 = 568;
    __int16 v16 = 1024;
    int v17 = v3;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Removing KVO for %d", (uint8_t *)&v12, 0x18u);
  }

LABEL_8:
  int v7 = +[ATAudioSessionUtils getAVASProperty:v3];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
    __int16 v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained removeObserver:self forKeyPath:v7 context:0];
    }
  }
  else
  {
    if (kAudioSessionClientLogSubsystem)
    {
      int v10 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v10) {
        goto LABEL_18;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      BOOL v13 = "ATAudioSessionClientImpl.mm";
      __int16 v14 = 1024;
      int v15 = 572;
      __int16 v16 = 1024;
      int v17 = v3;
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attempt to remove KVO for unsupported property %d", (uint8_t *)&v12, 0x18u);
    }
  }
LABEL_18:
}

- (void)addAVAudioSessionKVOObservers:(unsigned int)a3 session:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kAudioSessionClientLogSubsystem)
  {
    int v7 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    BOOL v13 = "ATAudioSessionClientImpl.mm";
    __int16 v14 = 1024;
    int v15 = 555;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Adding KVO for %d", (uint8_t *)&v12, 0x18u);
  }

LABEL_8:
  __int16 v9 = +[ATAudioSessionUtils getAVASProperty:v4];
  if (v9)
  {
    [v6 addObserver:self forKeyPath:v9 options:3 context:0];
  }
  else
  {
    if (kAudioSessionClientLogSubsystem)
    {
      int v10 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v10) {
        goto LABEL_17;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      BOOL v13 = "ATAudioSessionClientImpl.mm";
      __int16 v14 = 1024;
      int v15 = 559;
      __int16 v16 = 1024;
      int v17 = v4;
      _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempt to add KVO for unsupported property %d", (uint8_t *)&v12, 0x18u);
    }
  }
LABEL_17:
}

- (void)addNSNotificationListenerFor:(id)a3 session:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v11 UTF8String]);
  p_pair1 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)self->_newNotificationCenterObservers.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_11;
  }
  __int16 v14 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
  do
  {
    char v15 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&left[4].__value_.__left_, &__p);
    if (v15 >= 0) {
      __int16 v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> **)left;
    }
    else {
      __int16 v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> **)&left[1];
    }
    if (v15 >= 0) {
      __int16 v14 = left;
    }
    left = *v16;
  }
  while (*v16);
  if (v14 == p_pair1
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, &v14[4].__value_.__left_) & 0x80) != 0)
  {
LABEL_11:
    id v32 = v9;
    int v17 = (char *)operator new(0x30uLL);
    *((void *)v17 + 1) = 0;
    *((void *)v17 + 2) = 0;
    *(void *)int v17 = &unk_1EF7263B0;
    id v18 = v11;
    id v19 = v9;
    id v20 = v10;
    *((void *)v17 + 3) = 0;
    id v21 = v18;
    *((void *)v17 + 4) = v21;
    objc_initWeak((id *)v17 + 5, v19);
    uint64_t v22 = [v19 addObserverForType:1 name:*((void *)v17 + 4) block:v20];
    id v23 = (void *)*((void *)v17 + 3);
    *((void *)v17 + 3) = v22;

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v33, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else {
      std::string v33 = __p;
    }
    *(void *)&long long v34 = v17 + 24;
    *((void *)&v34 + 1) = v17;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v17 + 1, 1uLL, memory_order_relaxed);
    BOOL v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)p_pair1->__value_.__left_;
    v25 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
    v26 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
    if (p_pair1->__value_.__left_)
    {
      while (1)
      {
        while (1)
        {
          v25 = v24;
          __int16 v27 = v24 + 4;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v33, &v24[4].__value_.__left_) & 0x80) == 0)break; {
          BOOL v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)v25->__value_.__left_;
          }
          v26 = v25;
          if (!v25->__value_.__left_) {
            goto LABEL_20;
          }
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v27, &v33) & 0x80) == 0) {
          break;
        }
        v26 = v25 + 1;
        BOOL v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)v25[1].__value_.__left_;
        if (!v24) {
          goto LABEL_20;
        }
      }
      uint64_t v31 = (std::__shared_weak_count *)v17;
    }
    else
    {
LABEL_20:
      int v28 = (char *)operator new(0x48uLL);
      v36[0] = v28;
      v36[1] = &self->_newNotificationCenterObservers.__tree_.__pair1_;
      char v37 = 0;
      __int16 v29 = (std::string *)(v28 + 32);
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v29, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v29->__r_.__value_.__l.__data_ = *(_OWORD *)&v33.__r_.__value_.__l.__data_;
        *((void *)v28 + 6) = *((void *)&v33.__r_.__value_.__l + 2);
      }
      *(_OWORD *)(v28 + 56) = v34;
      long long v34 = 0uLL;
      char v37 = 1;
      *(void *)int v28 = 0;
      *((void *)v28 + 1) = 0;
      *((void *)v28 + 2) = v25;
      v26->__value_.__left_ = v28;
      v30 = *(void **)self->_newNotificationCenterObservers.__tree_.__begin_node_;
      if (v30)
      {
        self->_newNotificationCenterObservers.__tree_.__begin_node_ = v30;
        int v28 = (char *)v26->__value_.__left_;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_newNotificationCenterObservers.__tree_.__pair1_.__value_.__left_, (uint64_t *)v28);
      ++self->_newNotificationCenterObservers.__tree_.__pair3_.__value_;
      v36[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>>>>::reset[abi:ne180100]((uint64_t)v36);
      uint64_t v31 = (std::__shared_weak_count *)*((void *)&v34 + 1);
      if (!*((void *)&v34 + 1)) {
        goto LABEL_29;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
LABEL_29:
    id v9 = v32;
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)addNSNotificationListenerFor:(id)a3 session:(id)a4 selector:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  std::string::basic_string[abi:ne180100]<0>(&v34, (char *)[v10 UTF8String]);
  p_pair1 = (uint64_t **)&self->_oldNotificationCenterObservers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> *)self->_oldNotificationCenterObservers.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_11;
  }
  BOOL v13 = &self->_oldNotificationCenterObservers.__tree_.__pair1_;
  do
  {
    char v14 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&left[4].__value_.__left_, &v34);
    if (v14 >= 0) {
      char v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> **)left;
    }
    else {
      char v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> **)&left[1];
    }
    if (v14 >= 0) {
      BOOL v13 = left;
    }
    left = *v15;
  }
  while (*v15);
  if (v13 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> *)p_pair1
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v34, &v13[4].__value_.__left_) & 0x80) != 0)
  {
LABEL_11:
    __int16 v16 = (std::__shared_weak_count *)operator new(0x30uLL);
    v16->__shared_owners_ = 0;
    v16->__shared_weak_owners_ = 0;
    v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF726378;
    int v17 = self;
    id v18 = v10;
    id v19 = v9;
    id v20 = v17;
    v16[1].__vftable = (std::__shared_weak_count_vtbl *)v20;
    id v21 = v18;
    v16[1].__shared_owners_ = (uint64_t)v21;
    id v22 = v19;
    v16[1].__shared_weak_owners_ = (uint64_t)v22;
    id v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v16[1].__vftable selector:a5 name:v16[1].__shared_owners_ object:v16[1].__shared_weak_owners_];

    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v34;
    }
    *(void *)&long long v33 = v16 + 1;
    *((void *)&v33 + 1) = v16;
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    BOOL v24 = *p_pair1;
    v25 = p_pair1;
    v26 = p_pair1;
    if (*p_pair1)
    {
      while (1)
      {
        while (1)
        {
          v25 = (uint64_t **)v24;
          __int16 v27 = v24 + 4;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, v24 + 4) & 0x80) == 0) {
            break;
          }
          BOOL v24 = *v25;
          v26 = v25;
          if (!*v25) {
            goto LABEL_20;
          }
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v27, &__p) & 0x80) == 0) {
          break;
        }
        v26 = v25 + 1;
        BOOL v24 = v25[1];
        if (!v24) {
          goto LABEL_20;
        }
      }
      uint64_t v31 = v16;
    }
    else
    {
LABEL_20:
      int v28 = (char *)operator new(0x48uLL);
      v35[0] = v28;
      v35[1] = p_pair1;
      char v36 = 0;
      __int16 v29 = (std::string *)(v28 + 32);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v29, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v29->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((void *)v28 + 6) = *((void *)&__p.__r_.__value_.__l + 2);
      }
      *(_OWORD *)(v28 + 56) = v33;
      long long v33 = 0uLL;
      char v36 = 1;
      *(void *)int v28 = 0;
      *((void *)v28 + 1) = 0;
      *((void *)v28 + 2) = v25;
      __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *v26 = (uint64_t *)v28;
      v30 = *(void **)v20->_oldNotificationCenterObservers.__tree_.__begin_node_;
      if (v30)
      {
        v20->_oldNotificationCenterObservers.__tree_.__begin_node_ = v30;
        int v28 = (char *)*v26;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*p_pair1, (uint64_t *)v28);
      ++v20->_oldNotificationCenterObservers.__tree_.__pair3_.__value_;
      v35[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>>>>::reset[abi:ne180100]((uint64_t)v35);
      uint64_t v31 = (std::__shared_weak_count *)*((void *)&v33 + 1);
      if (!*((void *)&v33 + 1)) {
        goto LABEL_29;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
LABEL_29:
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
}

- (int)AudioSessionRemovePropertyListenerWithUserDataImpl:(unsigned int)a3 userProc:(void *)a4 userData:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    id v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "ATAudioSessionClientImpl.mm";
    __int16 v30 = 1024;
    int v31 = 491;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionRemovePropertyListenerWithUserData", buf, 0x12u);
  }

LABEL_8:
  PropertyInfo = asPropertyInfo::GetPropertyInfo((char *)buf, v7);
  if (buf[0])
  {
    value = self->_propertyListeners.__ptr_.__value_;
    *(void *)id v23 = AudioSessionPropertyListeners::GetStateMutex((AudioSessionPropertyListeners *)PropertyInfo);
    v23[8] = (*(uint64_t (**)(void))(**(void **)v23 + 16))(*(void *)v23);
    if (v7 == -1)
    {
      AudioSessionPropertyListeners::RemovePropertyListenersForAllPropertiesImp(value);
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v23);
    }
    else
    {
      AudioSessionPropertyListeners::RemovePropertyListenerImp(value, v7, (void (*)(void *, unsigned int, unsigned int, const void *))a4, a5);
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v23);
      int v12 = 0;
      if (v7 == 1684628836 || v7 == 1768846450 || v7 == 1919902568) {
        return v12;
      }
    }
    int v17 = self->_propertyListeners.__ptr_.__value_;
    *(void *)id v23 = AudioSessionPropertyListeners::GetStateMutex(v15);
    v23[8] = (*(uint64_t (**)(void))(**(void **)v23 + 16))(*(void *)v23);
    id v18 = *(int **)v17;
    id v19 = (int *)*((void *)v17 + 1);
    if (*(int **)v17 == v19)
    {
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v23);
    }
    else
    {
      int v20 = 0;
      do
      {
        int v21 = *v18;
        v18 += 6;
        if (v21 == v7) {
          ++v20;
        }
      }
      while (v18 != v19);
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v23);
      if (v20) {
        return 0;
      }
    }
    [(ATAudioSessionClientImpl *)self removeAVAudioSessionKVOObservers:v7];
    return 0;
  }
  int v12 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    BOOL v13 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v13) {
      return v12;
    }
  }
  else
  {
    BOOL v13 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v23 = 136315650;
    *(void *)&v23[4] = "ATAudioSessionClientImpl.mm";
    __int16 v24 = 1024;
    int v25 = 499;
    __int16 v26 = 1024;
    int v27 = v7;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: property %d does not support listening", v23, 0x18u);
  }

  return v12;
}

- (int)AudioSessionRemovePropertyListenerImpl:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    id v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    int v21 = "ATAudioSessionClientImpl.mm";
    __int16 v22 = 1024;
    int v23 = 449;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionRemovePropertyListener", buf, 0x12u);
  }

LABEL_8:
  PropertyInfo = asPropertyInfo::GetPropertyInfo((char *)buf, v3);
  if (buf[0])
  {
    value = self->_propertyListeners.__ptr_.__value_;
    if (value)
    {
      *(void *)char v15 = AudioSessionPropertyListeners::GetStateMutex((AudioSessionPropertyListeners *)PropertyInfo);
      v15[8] = (*(uint64_t (**)(void))(**(void **)v15 + 16))(*(void *)v15);
      AudioSessionPropertyListeners::RemoveAllPropertyListenersImp(value, v3);
      CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)v15);
      int v8 = 0;
      if (v3 != 1684628836 && v3 != 1768846450 && v3 != 1919902568)
      {
        [(ATAudioSessionClientImpl *)self removeAVAudioSessionKVOObservers:v3];
        return 0;
      }
    }
    else
    {
      int v8 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        int v12 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v12) {
          return v8;
        }
      }
      else
      {
        int v12 = MEMORY[0x1E4F14500];
        id v13 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)char v15 = 136315394;
        *(void *)&v15[4] = "ATAudioSessionClientImpl.mm";
        __int16 v16 = 1024;
        int v17 = 463;
        _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: 'propertyListener' is invalid", v15, 0x12u);
      }
    }
  }
  else
  {
    int v8 = 2003329396;
    if (kAudioSessionClientLogSubsystem)
    {
      id v9 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v9) {
        return v8;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)char v15 = 136315650;
      *(void *)&v15[4] = "ATAudioSessionClientImpl.mm";
      __int16 v16 = 1024;
      int v17 = 457;
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: property %d does not support listening", v15, 0x18u);
    }
  }
  return v8;
}

- (int)AudioSessionAddPropertyListenerImpl:(unsigned int)a3 userProc:(void *)a4 userData:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    id v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "ATAudioSessionClientImpl.mm";
    __int16 v42 = 1024;
    int v43 = 333;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionAddPropertyListener", buf, 0x12u);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  if (!WeakRetained)
  {
    int v13 = 560557673;
    if (kAudioSessionClientLogSubsystem)
    {
      char v15 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v15) {
        goto LABEL_62;
      }
    }
    else
    {
      char v15 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "ATAudioSessionClientImpl.mm";
      __int16 v42 = 1024;
      int v43 = 339;
      _os_log_impl(&dword_1A3931000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: session no longer valid", buf, 0x12u);
    }

    goto LABEL_62;
  }
  PropertyInfo = asPropertyInfo::GetPropertyInfo((char *)buf, v7);
  if (buf[0])
  {
    if (a4)
    {
      value = self->_propertyListeners.__ptr_.__value_;
      if (value)
      {
        *(void *)location = AudioSessionPropertyListeners::GetStateMutex((AudioSessionPropertyListeners *)PropertyInfo);
        location[8] = (*(uint64_t (**)(void))(**(void **)location + 16))(*(void *)location);
        AudioSessionPropertyListeners::AddPropertyListenerImp(value, v7, (void (*)(void *, unsigned int, unsigned int, const void *))a4, (void (*)(void *, unsigned int, unsigned int, const void *))a5);
        CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)location);
        objc_initWeak((id *)location, self);
        switch(v7)
        {
          case 0x64696564:
            if (UseNewNotifications(void)::once != -1) {
              dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_160);
            }
            uint64_t v23 = *MEMORY[0x1E4F4E888];
            if (UseNewNotifications(void)::sUseNewNotifications)
            {
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_3;
              v29[3] = &unk_1E5B13B20;
              __int16 v18 = &v30;
              objc_copyWeak(&v30, (id *)location);
              [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:v23 session:WeakRetained block:v29];
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_4;
              v27[3] = &unk_1E5B13B20;
              objc_copyWeak(&v28, (id *)location);
              [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:*MEMORY[0x1E4F4E898] session:WeakRetained block:v27];
              objc_destroyWeak(&v28);
              goto LABEL_51;
            }
            [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:v23 session:WeakRetained selector:sel_handleServerDeath_];
            uint64_t v17 = *MEMORY[0x1E4F4E898];
            int v25 = &selRef_handleServerReset_;
            break;
          case 0x696E7472:
            if (UseNewNotifications(void)::once != -1) {
              dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_160);
            }
            uint64_t v17 = *MEMORY[0x1E4F4E838];
            if (UseNewNotifications(void)::sUseNewNotifications)
            {
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_2;
              v31[3] = &unk_1E5B13B20;
              __int16 v18 = &v32;
              objc_copyWeak(&v32, (id *)location);
              [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:v17 session:WeakRetained block:v31];
              goto LABEL_51;
            }
            int v25 = &selRef_handleInterruption_;
            break;
          case 0x726F6368:
            if (UseNewNotifications(void)::once != -1) {
              dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_160);
            }
            uint64_t v17 = *MEMORY[0x1E4F4E9B0];
            if (UseNewNotifications(void)::sUseNewNotifications)
            {
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke;
              v33[3] = &unk_1E5B13B20;
              __int16 v18 = &v34;
              objc_copyWeak(&v34, (id *)location);
              [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:v17 session:WeakRetained block:v33];
LABEL_51:
              objc_destroyWeak(v18);
LABEL_61:
              objc_destroyWeak((id *)location);
              int v13 = 0;
              goto LABEL_62;
            }
            int v25 = &selRef_handleRouteChange_;
            break;
          default:
            [(ATAudioSessionClientImpl *)self addAVAudioSessionKVOObservers:v7 session:WeakRetained];
            goto LABEL_61;
        }
        [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:v17 session:WeakRetained selector:*v25];
        goto LABEL_61;
      }
      int v13 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        int v21 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v21) {
          goto LABEL_62;
        }
      }
      else
      {
        int v21 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "ATAudioSessionClientImpl.mm";
        __int16 v36 = 1024;
        int v37 = 359;
        _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: 'propertyListener' is invalid", location, 0x12u);
      }
    }
    else
    {
      int v13 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        int v21 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v21) {
          goto LABEL_62;
        }
      }
      else
      {
        int v21 = MEMORY[0x1E4F14500];
        id v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "ATAudioSessionClientImpl.mm";
        __int16 v36 = 1024;
        int v37 = 353;
        _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: nil client proc", location, 0x12u);
      }
    }

    goto LABEL_62;
  }
  int v13 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    char v14 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v14) {
      goto LABEL_62;
    }
  }
  else
  {
    char v14 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315650;
    *(void *)&location[4] = "ATAudioSessionClientImpl.mm";
    __int16 v36 = 1024;
    int v37 = 347;
    __int16 v38 = 1024;
    int v39 = v7;
    _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: property %d does not support listening", location, 0x18u);
  }

LABEL_62:
  return v13;
}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleRouteChange:v5];
  }
}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleInterruption:v5];
  }
}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleServerDeath:v5];
  }
}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleServerReset:v5];
  }
}

- (int)AudioSessionGetPropertySizeImpl:(unsigned int)a3 size:(unsigned int *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    id v6 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    id v10 = "ATAudioSessionClientImpl.mm";
    __int16 v11 = 1024;
    int v12 = 322;
    _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioSessionGetPropertySizeImpl", (uint8_t *)&v9, 0x12u);
  }

LABEL_8:
  asPropertyInfo::GetPropertyInfo((char *)&v9, a3);
  *a4 = v10;
  return 0;
}

- (int)AudioSessionSetPropertyImpl:(unsigned int)a3 size:(unsigned int)a4 data:(const void *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!kAudioSessionClientLogSubsystem)
  {
    int v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_6:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315394;
      __int16 v16 = "ATAudioSessionClientImpl.mm";
      __int16 v17 = 1024;
      int v18 = 310;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionSetProperty", (uint8_t *)&v15, 0x12u);
    }

    if (a5) {
      return [(ATAudioSessionPropertyManager *)self->_propertyManager SetProperty:v7 size:v6 data:a5];
    }
    goto LABEL_9;
  }
  int v9 = *(id *)kAudioSessionClientLogSubsystem;
  if (v9) {
    goto LABEL_6;
  }
  if (a5) {
    return [(ATAudioSessionPropertyManager *)self->_propertyManager SetProperty:v7 size:v6 data:a5];
  }
LABEL_9:
  int v10 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    int v12 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v12) {
      return v10;
    }
  }
  else
  {
    int v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    __int16 v16 = "ATAudioSessionClientImpl.mm";
    __int16 v17 = 1024;
    int v18 = 313;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid data input", (uint8_t *)&v15, 0x12u);
  }

  return v10;
}

- (int)AudioSessionGetPropertyImpl:(unsigned int)a3 size:(unsigned int *)a4 data:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!kAudioSessionClientLogSubsystem)
  {
    int v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_6:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315394;
      __int16 v16 = "ATAudioSessionClientImpl.mm";
      __int16 v17 = 1024;
      int v18 = 295;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionGetProperty", (uint8_t *)&v15, 0x12u);
    }

    if (a5) {
      return [(ATAudioSessionPropertyManager *)self->_propertyManager GetProperty:v7 size:a4 data:a5];
    }
    goto LABEL_9;
  }
  int v9 = *(id *)kAudioSessionClientLogSubsystem;
  if (v9) {
    goto LABEL_6;
  }
  if (a5) {
    return [(ATAudioSessionPropertyManager *)self->_propertyManager GetProperty:v7 size:a4 data:a5];
  }
LABEL_9:
  int v10 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    int v12 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v12) {
      return v10;
    }
  }
  else
  {
    int v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    __int16 v16 = "ATAudioSessionClientImpl.mm";
    __int16 v17 = 1024;
    int v18 = 299;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid data", (uint8_t *)&v15, 0x12u);
  }

  return v10;
}

- (int)AudioSessionSetActiveImpl:(unsigned __int8)a3 flags:(unsigned int)a4
{
  int v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    uint64_t v7 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "ATAudioSessionClientImpl.mm";
    __int16 v23 = 1024;
    int v24 = 260;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioSessionSetActiveImpl", buf, 0x12u);
  }

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    id v20 = 0;
    char v11 = [WeakRetained setActive:v5 == 1 withOptions:a4 error:&v20];
    id v12 = v20;
    id v13 = v12;
    if (v11)
    {
      if (kAudioSessionClientLogSubsystem)
      {
        char v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14)
        {
          int v15 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {
        char v14 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = @"Activated";
        id v22 = "ATAudioSessionClientImpl.mm";
        *(_DWORD *)buf = 136315650;
        if (!v5) {
          __int16 v17 = @"Deactivated";
        }
        __int16 v23 = 1024;
        int v24 = 285;
        __int16 v25 = 2112;
        __int16 v26 = v17;
        _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d Session %@ !", buf, 0x1Cu);
      }
      int v15 = 0;
    }
    else
    {
      int v15 = 2003329396;
      if (v12 && [v12 code]) {
        int v15 = [v13 code];
      }
      if (kAudioSessionClientLogSubsystem)
      {
        char v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14) {
          goto LABEL_30;
        }
      }
      else
      {
        char v14 = MEMORY[0x1E4F14500];
        id v18 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v22 = "ATAudioSessionClientImpl.mm";
        __int16 v23 = 1024;
        int v24 = 281;
        __int16 v25 = 1024;
        LODWORD(v26) = v15;
        _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d activation failed. status = %d", buf, 0x18u);
      }
    }

    goto LABEL_30;
  }
  int v15 = 560557673;
LABEL_31:

  return v15;
}

- (AVAudioSession)avas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);

  return (AVAudioSession *)WeakRetained;
}

- (int)resetClientConfiguration
{
  self->_isConfigured = 0;
  self->_clientUserData = 0;
  self->_interruptionType = 0;
  CFRunLoopRef Main = CFRunLoopGetMain();
  uint64_t v4 = Main;
  if (Main) {
    CFRetain(Main);
  }
  mCFObject = self->_clientRunLoop.mCFObject;
  self->_clientRunLoop.mCFObject = v4;
  if (mCFObject) {
    CFRelease(mCFObject);
  }
  uint64_t v6 = (const void *)*MEMORY[0x1E4F1D418];
  if (*MEMORY[0x1E4F1D418])
  {
    CFRetain((CFTypeRef)*MEMORY[0x1E4F1D418]);
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&StateMutex, v7);
  id v8 = (AudioSessionPropertyListeners *)self->_clientRunLoopMode.mObject.mCFObject;
  self->_clientRunLoopMode.mObject.mCFObject = StateMutex;
  StateMutex = (__CFString *)v8;
  if (v8) {
    CFRelease(v8);
  }
  self->_clientInterruptionListenerProc = 0;
  value = self->_propertyListeners.__ptr_.__value_;
  StateMutex = (__CFString *)AudioSessionPropertyListeners::GetStateMutex(v8);
  char v12 = (*((uint64_t (**)(__CFString *))StateMutex->isa + 2))(StateMutex);
  AudioSessionPropertyListeners::RemovePropertyListenersForAllPropertiesImp(value);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&StateMutex);
  return 0;
}

- (int)setClientConfiguration:(__CFRunLoop *)a3 runLoopMode:(__CFString *)a4 listenerProc:(void *)a5 userData:(void *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (kAudioSessionClientLogSubsystem)
  {
    char v11 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {
    char v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "ATAudioSessionClientImpl.mm";
    __int16 v25 = 1024;
    int v26 = 172;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setClientConfiguration", buf, 0x12u);
  }

LABEL_8:
  if (!self->_isConfigured)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
    if (!WeakRetained)
    {
      int v13 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        __int16 v17 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v17)
        {
LABEL_41:

          return v13;
        }
      }
      else
      {
        __int16 v17 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "ATAudioSessionClientImpl.mm";
        __int16 v25 = 1024;
        int v26 = 228;
        _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AVAudioSession shared instance.", buf, 0x12u);
      }

      goto LABEL_41;
    }
    if (a3)
    {
      CFRetain(a3);
      mCFObject = self->_clientRunLoop.mCFObject;
      self->_clientRunLoop.mCFObject = a3;
      if (mCFObject) {
        CFRelease(mCFObject);
      }
    }
    if (a4)
    {
      CFRetain(a4);
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)buf, a4);
      id v16 = self->_clientRunLoopMode.mObject.mCFObject;
      self->_clientRunLoopMode.mObject.mCFObject = *(__CFString **)buf;
      *(void *)buf = v16;
      if (v16) {
        CFRelease(v16);
      }
    }
    if (a5)
    {
      self->_clientInterruptionListenerProc = a5;
LABEL_33:
      if (a6) {
        self->_clientUserData = a6;
      }
      [(ATAudioSessionClientImpl *)self setInterruptionType:0];
      if (UseNewNotifications(void)::once != -1) {
        dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_160);
      }
      if (UseNewNotifications(void)::sUseNewNotifications)
      {
        objc_initWeak((id *)buf, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __85__ATAudioSessionClientImpl_setClientConfiguration_runLoopMode_listenerProc_userData___block_invoke;
        v22[3] = &unk_1E5B13B20;
        objc_copyWeak(&v23, (id *)buf);
        [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:*MEMORY[0x1E4F4E838] session:WeakRetained block:v22];
        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(ATAudioSessionClientImpl *)self addNSNotificationListenerFor:*MEMORY[0x1E4F4E838] session:WeakRetained selector:sel_handleInterruption_];
      }
      int v13 = 0;
      self->_isConfigured = 1;
      goto LABEL_41;
    }
    if (kAudioSessionClientLogSubsystem)
    {
      id v18 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v18) {
        goto LABEL_33;
      }
    }
    else
    {
      id v18 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "ATAudioSessionClientImpl.mm";
      __int16 v25 = 1024;
      int v26 = 193;
      _os_log_impl(&dword_1A3931000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No Interruption listener provided", buf, 0x12u);
    }

    goto LABEL_33;
  }
  return 1768843636;
}

void __85__ATAudioSessionClientImpl_setClientConfiguration_runLoopMode_listenerProc_userData___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleInterruption:v5];
  }
}

- (BOOL)isValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (ATAudioSessionClientImpl)initWithStrongSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(ATAudioSessionClientImpl *)self initWithSession:v5];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_strongSession, a3);
  }

  return v7;
}

- (ATAudioSessionClientImpl)initWithSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    id v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "ATAudioSessionClientImpl.mm";
    __int16 v17 = 1024;
    int v18 = 136;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d initWithSession", buf, 0x12u);
  }

LABEL_8:
  v15.receiver = self;
  v15.super_class = (Class)ATAudioSessionClientImpl;
  uint64_t v7 = [(ATAudioSessionClientImpl *)&v15 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_weakSession, v4);
    v8->_isConfigured = 0;
    v8->_clientUserData = 0;
    CFRunLoopRef Main = CFRunLoopGetMain();
    CFRunLoopRef v10 = Main;
    if (Main) {
      CFRetain(Main);
    }
    mCFObject = v8->_clientRunLoop.mCFObject;
    v8->_clientRunLoop.mCFObject = v10;
    if (mCFObject) {
      CFRelease(mCFObject);
    }
    id v12 = (const void *)*MEMORY[0x1E4F1D418];
    if (*MEMORY[0x1E4F1D418]) {
      CFRetain((CFTypeRef)*MEMORY[0x1E4F1D418]);
    }
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)buf, v12);
    int v13 = v8->_clientRunLoopMode.mObject.mCFObject;
    v8->_clientRunLoopMode.mObject.mCFObject = *(__CFString **)buf;
    *(void *)buf = v13;
    if (v13) {
      CFRelease(v13);
    }
    v8->_clientInterruptionListenerProc = 0;
    v8->_interruptionType = 0;
    operator new();
  }

  return 0;
}

@end