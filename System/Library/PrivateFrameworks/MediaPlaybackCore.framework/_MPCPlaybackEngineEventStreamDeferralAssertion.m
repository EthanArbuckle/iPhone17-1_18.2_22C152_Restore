@interface _MPCPlaybackEngineEventStreamDeferralAssertion
- (BOOL)invalidated;
- (MPCPlaybackEngineEventStream)eventStream;
- (MSVBlockGuard)timeoutGuard;
- (NSString)description;
- (NSString)identifier;
- (NSString)reason;
- (_MPCPlaybackEngineEventStreamDeferralAssertion)initWithEventStream:(id)a3 type:(int64_t)a4 reason:(id)a5 timeout:(double)a6;
- (int64_t)type;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _MPCPlaybackEngineEventStreamDeferralAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutGuard, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_eventStream);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)dealloc
{
  [(_MPCPlaybackEngineEventStreamDeferralAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_MPCPlaybackEngineEventStreamDeferralAssertion;
  [(_MPCPlaybackEngineEventStreamDeferralAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);
    v5 = self;
    if (WeakRetained)
    {
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
      [*((id *)WeakRetained + 6) removeObject:v5];
      v6 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *((void *)WeakRetained + 3);
        v8 = [(_MPCPlaybackEngineEventStreamDeferralAssertion *)v5 identifier];
        v9 = [(_MPCPlaybackEngineEventStreamDeferralAssertion *)v5 reason];
        *(_DWORD *)v12 = 138543874;
        *(void *)&v12[4] = v7;
        *(_WORD *)&v12[12] = 2114;
        *(void *)&v12[14] = v8;
        *(_WORD *)&v12[22] = 2114;
        v13 = v9;
        _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] _invalidateAssertion:%{public}@ | invalidating [] assertion.reason=%{public}@", v12, 0x20u);
      }
      uint64_t v10 = [*((id *)WeakRetained + 6) count];
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      if (!v10)
      {
        v11 = *((void *)WeakRetained + 10);
        *(void *)v12 = MEMORY[0x263EF8330];
        *(void *)&v12[8] = 3221225472;
        *(void *)&v12[16] = __53__MPCPlaybackEngineEventStream__invalidateAssertion___block_invoke;
        v13 = &unk_2643C5FC8;
        id v14 = WeakRetained;
        dispatch_async(v11, v12);
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_MPCPlaybackEngineEventStreamDeferralAssertion)initWithEventStream:(id)a3 type:(int64_t)a4 reason:(id)a5 timeout:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_MPCPlaybackEngineEventStreamDeferralAssertion;
  v12 = [(_MPCPlaybackEngineEventStreamDeferralAssertion *)&v25 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v12->_eventStream, v10);
    v13->_type = a4;
    uint64_t v14 = [v11 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    uint64_t v16 = MSVNanoIDCreateTaggedPointer();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    if (a6 > 0.0)
    {
      objc_initWeak(&location, v13);
      id v18 = objc_alloc(MEMORY[0x263F54ED0]);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __90___MPCPlaybackEngineEventStreamDeferralAssertion_initWithEventStream_type_reason_timeout___block_invoke;
      v22[3] = &unk_2643C3A78;
      objc_copyWeak(&v23, &location);
      uint64_t v19 = [v18 initWithTimeout:v22 interruptionHandler:a6];
      timeoutGuard = v13->_timeoutGuard;
      v13->_timeoutGuard = (MSVBlockGuard *)v19;

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

- (MSVBlockGuard)timeoutGuard
{
  return self->_timeoutGuard;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (int64_t)type
{
  return self->_type;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);

  return (MPCPlaybackEngineEventStream *)WeakRetained;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p reason=%@ invalidated=%d>", objc_opt_class(), self, self->_reason, self->_invalidated];
}

@end