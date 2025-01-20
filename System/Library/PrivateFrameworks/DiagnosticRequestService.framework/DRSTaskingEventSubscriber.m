@interface DRSTaskingEventSubscriber
- (BOOL)isEqual:(id)a3;
- (DRSTaskingEventSubscriber)initWithTeamID:(id)a3 token:(unint64_t)a4;
- (NSString)teamID;
- (unint64_t)token;
- (void)dealloc;
@end

@implementation DRSTaskingEventSubscriber

- (DRSTaskingEventSubscriber)initWithTeamID:(id)a3 token:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DRSTaskingEventSubscriber;
  v8 = [(DRSTaskingEventSubscriber *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_teamID, a3);
    v9->_token = a4;
    v10 = DPLogHandle_ServiceEventPublisher();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v7;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventSubscriberInit", "TeamID: %{public}@ token: %#llx", buf, 0x16u);
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = DPLogHandle_ServiceEventPublisher();
  if (os_signpost_enabled(v3))
  {
    v4 = [(DRSTaskingEventSubscriber *)self teamID];
    *(_DWORD *)buf = 138543618;
    id v7 = v4;
    __int16 v8 = 2048;
    unint64_t v9 = [(DRSTaskingEventSubscriber *)self token];
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventSubscriberDealloc", "TeamID: %{public}@ token: %#llx", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)DRSTaskingEventSubscriber;
  [(DRSTaskingEventSubscriber *)&v5 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DRSTaskingEventSubscriber *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(DRSTaskingEventSubscriber *)self token];
      if (v6 == [(DRSTaskingEventSubscriber *)v5 token])
      {
        id v7 = [(DRSTaskingEventSubscriber *)self teamID];
        __int16 v8 = [(DRSTaskingEventSubscriber *)v5 teamID];
        char v9 = [v7 isEqualToString:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)token
{
  return self->_token;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void).cxx_destruct
{
}

@end