@interface MXRoutingContextCallbackHelper
+ (id)_sharedLock;
- (BOOL)_didRouteChangeFinish:(__CFString *)a3;
- (MXRoutingContextCallbackHelper)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 routeConfigUpdateID:(id)a4 callback:(void *)a5 context:(void *)a6;
- (void)_routeConfigUpdated:(id)a3;
- (void)dealloc;
@end

@implementation MXRoutingContextCallbackHelper

- (MXRoutingContextCallbackHelper)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 routeConfigUpdateID:(id)a4 callback:(void *)a5 context:(void *)a6
{
  v16.receiver = self;
  v16.super_class = (Class)MXRoutingContextCallbackHelper;
  v10 = [(MXRoutingContextCallbackHelper *)&v16 init];
  v10->mRouteConfigUpdateID = (NSString *)a4;
  v10->mCallback = a5;
  v10->mContext = a6;
  v10->mCreationTime = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  objc_initWeak(&location, v10);
  v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__MXRoutingContextCallbackHelper_initWithRoutingContext_routeConfigUpdateID_callback_context___block_invoke;
  v13[3] = &unk_1E57CA210;
  objc_copyWeak(&v14, &location);
  v10->mFigRoutingContextToken = (id)[v11 addObserverForName:@"routeConfigUpdated" object:a3 queue:0 usingBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

uint64_t __94__MXRoutingContextCallbackHelper_initWithRoutingContext_routeConfigUpdateID_callback_context___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(+[MXRoutingContextCallbackHelper _sharedLock](MXRoutingContextCallbackHelper, "_sharedLock"), "lock");
  [objc_loadWeak((id *)(a1 + 32)) _routeConfigUpdated:a2];
  id v4 = +[MXRoutingContextCallbackHelper _sharedLock];
  return [v4 unlock];
}

+ (id)_sharedLock
{
  if (_sharedLock_onceToken != -1) {
    dispatch_once(&_sharedLock_onceToken, &__block_literal_global_47);
  }
  return (id)_sharedLock_sharedLock;
}

id __45__MXRoutingContextCallbackHelper__sharedLock__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  _sharedLock_sharedLock = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->mFigRoutingContextToken);
  v3.receiver = self;
  v3.super_class = (Class)MXRoutingContextCallbackHelper;
  [(MXRoutingContextCallbackHelper *)&v3 dealloc];
}

- (BOOL)_didRouteChangeFinish:(__CFString *)a3
{
  return FigCFEqual()
      || FigCFEqual()
      || FigCFEqual()
      || FigCFEqual()
      || FigCFEqual()
      || FigCFEqual()
      || FigCFEqual() != 0;
}

- (void)_routeConfigUpdated:(id)a3
{
  id v4 = (void *)[a3 userInfo];
  v5 = (void *)[v4 objectForKey:@"routeConfigUpdateID"];
  uint64_t v6 = [v4 objectForKey:@"routeConfigUpdateReason"];
  if ([v5 isEqualToString:self->mRouteConfigUpdateID])
  {
    if ([(MXRoutingContextCallbackHelper *)self _didRouteChangeFinish:v6])
    {
      p_mCallback = &self->mCallback;
      mCallback = (void (*)(void *, uint64_t))self->mCallback;
      if (mCallback)
      {
        if (dword_1E9359DA0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          mCallback = (void (*)(void *, uint64_t))*p_mCallback;
        }
        mCallback(self->mContext, v6);
        *p_mCallback = 0;
        self->mContext = 0;
      }
    }
  }
}

@end