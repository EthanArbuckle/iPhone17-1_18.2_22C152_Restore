@interface AVAudioSessionManager
+ (id)defaultManager;
- (AVAudioSessionManager)init;
- (BOOL)isProcessAudioMuted;
- (BOOL)trackDaemonPID:(int)a3;
- (id).cxx_construct;
- (void)triggerMediaServicesResetNotifications:(int)a3 daemonName:(id)a4;
@end

@implementation AVAudioSessionManager

- (AVAudioSessionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioSessionManager;
  v2 = [(AVAudioSessionManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    os_unfair_lock_lock(&v2->_state.mMutex.m_lock);
    boost::circular_buffer<int,std::allocator<int>>::set_capacity((char **)&v3->_state.mObject, 0x10uLL);
    os_unfair_lock_unlock(&v3->_state.mMutex.m_lock);
  }
  return v3;
}

+ (id)defaultManager
{
  {
    +[AVAudioSessionManager defaultManager]::gManager = objc_opt_new();
  }
  v2 = (void *)+[AVAudioSessionManager defaultManager]::gManager;
  return v2;
}

- (BOOL)trackDaemonPID:(int)a3
{
  int v10 = a3;
  p_state = &self->_state;
  p_mObject = &self->_state.mObject;
  os_unfair_lock_lock(&self->_state.mMutex.m_lock);
  if (self->_state.mObject.mServerPIDs.m_size && (m_buff = self->_state.mObject.mServerPIDs.m_first) != 0)
  {
    while (*m_buff != a3)
    {
      if (++m_buff == self->_state.mObject.mServerPIDs.m_end) {
        m_buff = p_mObject->mServerPIDs.m_buff;
      }
      if (!m_buff || m_buff == self->_state.mObject.mServerPIDs.m_last) {
        goto LABEL_8;
      }
    }
    BOOL v8 = 0;
  }
  else
  {
LABEL_8:
    boost::circular_buffer<int,std::allocator<int>>::push_back_impl<int const&>(p_mObject, &v10);
    BOOL v8 = 1;
  }
  os_unfair_lock_unlock(&p_state->mMutex.m_lock);
  return v8;
}

- (void)triggerMediaServicesResetNotifications:(int)a3 daemonName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(AVAudioSessionManager *)self trackDaemonPID:v4])
  {
    v7 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
    avfaudio::SessionMap::ValidSessions(v7);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "handleMediaDaemonTerminationEvent:daemonName:", v4, v6, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)isProcessAudioMuted
{
  return self->_processAudioMuted;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 6) = 0;
  return self;
}

@end