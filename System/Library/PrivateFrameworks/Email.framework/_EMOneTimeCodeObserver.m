@interface _EMOneTimeCodeObserver
- (_EMOneTimeCodeObserver)initWithObserver:(id)a3;
- (void)_performWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4;
- (void)cancel;
- (void)dealloc;
- (void)performWithRemoteConnection:(id)a3;
- (void)recoverWithRemoteConnection:(id)a3;
@end

@implementation _EMOneTimeCodeObserver

- (_EMOneTimeCodeObserver)initWithObserver:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EMOneTimeCodeObserver;
  v5 = [(_EMOneTimeCodeObserver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v7 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    token = v6->_token;
    v6->_token = v7;
  }
  return v6;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_token cancel];
  v3.receiver = self;
  v3.super_class = (Class)_EMOneTimeCodeObserver;
  [(_EMOneTimeCodeObserver *)&v3 dealloc];
}

- (void)cancel
{
}

- (void)performWithRemoteConnection:(id)a3
{
}

- (void)recoverWithRemoteConnection:(id)a3
{
}

- (void)_performWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = self->_token;
  if (([(EFCancelationToken *)v7 isCanceled] & 1) == 0)
  {
    if (v4)
    {
      v8 = +[EMMessageRepository log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        __int16 v15 = 2114;
        id v16 = WeakRetained;
        _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] Recovering one-time code observer: %{public}@", buf, 0x16u);
      }
      [(EFCancelationToken *)v7 removeAllCancelationBlocks];
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    objc_super v10 = [v6 remoteObjectProxy];
    id v11 = objc_loadWeakRetained((id *)&self->_observer);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67___EMOneTimeCodeObserver__performWithRemoteConnection_forRecovery___block_invoke;
    v12[3] = &unk_1E63E59E8;
    objc_copyWeak(&v13, (id *)buf);
    [v10 startObservingOneTimeCode:v11 completionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end