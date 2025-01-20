@interface AVAudioSessionXPCClientRelay
- (AVAudioSessionXPCClientRelay)initWithConnection:(id)a3 token:(ProcessToken)a4;
- (id).cxx_construct;
- (void)sendControlValueChanged:(const void *)a3;
- (void)sendDeferredMessages;
- (void)sendInterruptionMessageForSession:(unsigned int)a3 userInfo:(id)a4;
- (void)sendServerConfigurationChange:(const void *)a3;
- (void)sendServerDefaultRouteChange:(const void *)a3;
- (void)sendSession:(unsigned int)a3 hasProxies:(BOOL)a4;
- (void)sendSessionNeedsStateSync:(unsigned int)a3;
- (void)sendSessionStoppedForAppStateChange:(unsigned int)a3;
- (void)setBarrierBlock;
@end

@implementation AVAudioSessionXPCClientRelay

- (AVAudioSessionXPCClientRelay)initWithConnection:(id)a3 token:(ProcessToken)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioSessionXPCClientRelay;
  v7 = [(AVAudioSessionXPCClientRelay *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->connection, v6);
    v8->token = a4;
    os_unfair_lock_lock(&v8->guarded_impl.mMutex.m_lock);
    uint64_t v9 = [v6 remoteObjectProxy];
    proxy = v8->guarded_impl.mObject.proxy;
    v8->guarded_impl.mObject.proxy = (SessionManagerXPCServerCallbackProtocol *)v9;

    v8->guarded_impl.mObject.mToken = a4;
    os_unfair_lock_unlock(&v8->guarded_impl.mMutex.m_lock);
  }

  return v8;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 66) = 0;
  return self;
}

- (void)sendDeferredMessages
{
  p_guarded_impl = &self->guarded_impl;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  if (!self->guarded_impl.mObject.mMessagePending)
  {
    uint64_t v4 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v4);
  }
  if (as::server::DeferredMessageState::SendDeferredMessages((as::server::DeferredMessageState *)&self->guarded_impl.mObject)) {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
}

- (void)setBarrierBlock
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->connection);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AVAudioSessionXPCClientRelay_setBarrierBlock__block_invoke;
  v4[3] = &unk_1E6875A70;
  objc_copyWeak(&v5, &location);
  [WeakRetained scheduleSendBarrierBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__AVAudioSessionXPCClientRelay_setBarrierBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained sendDeferredMessages];
  }
}

- (void)sendServerDefaultRouteChange:(const void *)a3
{
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  as::server::DeferredMessageState::EnqueueDefaultRouteChange((as::server::DeferredMessageState *)p_mObject, (const as::RouteIdentifier *)a3);
  LODWORD(p_mObject) = as::server::DeferredMessageState::SendSingleMessage((as::server::DeferredMessageState *)p_mObject);
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (p_mObject)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void)sendInterruptionMessageForSession:(unsigned int)a3 userInfo:(id)a4
{
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  v8 = (NSDictionary *)a4;
  os_unfair_lock_lock(&p_guarded_impl->mMutex.m_lock);
  BOOL v9 = as::server::DeferredMessageState::SendInterruptionMessage((as::server::DeferredMessageState *)p_mObject, a3, v8);

  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (v9)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void)sendSessionStoppedForAppStateChange:(unsigned int)a3
{
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  as::server::DeferredMessageState::EnqueueStoppedForAppStateChange((as::server::DeferredMessageState *)p_mObject, a3);
  LODWORD(p_mObject) = as::server::DeferredMessageState::SendSingleMessage((as::server::DeferredMessageState *)p_mObject);
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (p_mObject)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void)sendSession:(unsigned int)a3 hasProxies:(BOOL)a4
{
  BOOL v4 = a4;
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  as::server::DeferredMessageState::EnqueueHasProxies((as::server::DeferredMessageState *)p_mObject, a3, v4);
  LODWORD(p_mObject) = as::server::DeferredMessageState::SendSingleMessage((as::server::DeferredMessageState *)p_mObject);
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (p_mObject)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void)sendSessionNeedsStateSync:(unsigned int)a3
{
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  as::server::DeferredMessageState::EnqueueNeedsStateSync((as::server::DeferredMessageState *)p_mObject, a3);
  LODWORD(p_mObject) = as::server::DeferredMessageState::SendSingleMessage((as::server::DeferredMessageState *)p_mObject);
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (p_mObject)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void)sendServerConfigurationChange:(const void *)a3
{
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  as::server::DeferredMessageState::EnqueueConfigurationChange((as::server::DeferredMessageState *)p_mObject, (const as::server::ConfigChangeSummary *)a3);
  LODWORD(p_mObject) = as::server::DeferredMessageState::SendSingleMessage((as::server::DeferredMessageState *)p_mObject);
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (p_mObject)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void)sendControlValueChanged:(const void *)a3
{
  p_guarded_impl = &self->guarded_impl;
  p_mObject = &self->guarded_impl.mObject;
  os_unfair_lock_lock(&self->guarded_impl.mMutex.m_lock);
  as::server::DeferredMessageState::EnqueueControlValueChanged((as::server::DeferredMessageState *)p_mObject, (ControlValue *)a3);
  LODWORD(p_mObject) = as::server::DeferredMessageState::SendSingleMessage((as::server::DeferredMessageState *)p_mObject);
  os_unfair_lock_unlock(&p_guarded_impl->mMutex.m_lock);
  if (p_mObject)
  {
    [(AVAudioSessionXPCClientRelay *)self setBarrierBlock];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->connection);
  as::server::DeferredMessageState::~DeferredMessageState((as::server::DeferredMessageState *)&self->guarded_impl.mObject);
}

@end