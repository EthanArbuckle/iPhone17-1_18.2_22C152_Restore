@interface _HMFNetworkBrowser
+ (id)logCategory;
- (NSString)domain;
- (NSString)serviceType;
- (OS_dispatch_queue)workQueue;
- (OS_nw_browser)nw_browser;
- (_HMFNetworkBrowser)initWithQueue:(id)a3 domain:(id)a4 serviceType:(id)a5 updateBlock:(id)a6;
- (id)shortDescription;
- (id)startBrowsing;
- (id)stopBrowsing;
- (id)updateBlock;
- (id)workContext;
- (void)setDomain:(id)a3;
- (void)setNw_browser:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)stop;
@end

@implementation _HMFNetworkBrowser

- (_HMFNetworkBrowser)initWithQueue:(id)a3 domain:(id)a4 serviceType:(id)a5 updateBlock:(id)a6
{
  v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_HMFNetworkBrowser;
  v14 = [(_HMFNetworkBrowser *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_domain, a4);
    objc_storeStrong((id *)&v15->_serviceType, a5);
    uint64_t v16 = MEMORY[0x19F3A8A20](v13);
    id updateBlock = v15->_updateBlock;
    v15->_id updateBlock = (id)v16;

    dispatch_queue_t v18 = v10;
    if (!v10)
    {
      v19 = (const char *)HMFDispatchQueueName(v15, 0);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      a5 = (id)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v18 = dispatch_queue_create(v19, (dispatch_queue_attr_t)a5);
    }
    objc_storeStrong((id *)&v15->_workQueue, v18);
    if (!v10)
    {
    }
  }

  return v15;
}

- (id)workContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___HMFNetworkBrowser_workContext__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  if (_MergedGlobals_3_10 != -1) {
    dispatch_once(&_MergedGlobals_3_10, block);
  }
  return (id)qword_1EB4EEB10;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(_HMFNetworkBrowser *)self serviceType];
  v5 = [(_HMFNetworkBrowser *)self domain];
  v6 = [v3 stringWithFormat:@"Browser(%@.%@)", v4, v5];

  return v6;
}

- (id)startBrowsing
{
  v29[1] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(_HMFNetworkBrowser *)self nw_browser];

  if (v3)
  {
    v4 = (void *)MEMORY[0x19F3A87A0]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier(v5);
      v8 = [(_HMFNetworkBrowser *)v5 serviceType];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Browser already started for %@", buf, 0x16u);

LABEL_7:
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = [(_HMFNetworkBrowser *)self serviceType];
  v10 = [(_HMFNetworkBrowser *)self domain];
  id v11 = [(_HMFNetworkBrowser *)self workQueue];
  objc_initWeak(&location, self);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __browse_result_changed_handler_block_invoke;
  v28 = &unk_1E59581E8;
  objc_copyWeak(v29, &location);
  id v12 = (void *)MEMORY[0x19F3A8A20](buf);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  id v13 = v9;
  id v14 = v10;
  v15 = v11;
  id v16 = v12;
  v17 = (const char *)[v13 UTF8String];
  id v18 = v14;
  v19 = (const char *)[v18 UTF8String];

  bonjour_service = nw_browse_descriptor_create_bonjour_service(v17, v19);
  nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
  objc_super v21 = nw_browser_create(bonjour_service, 0);
  nw_browser_set_queue(v21, v15);

  nw_browser_set_browse_results_changed_handler(v21, v16);
  nw_browser_start(v21);

  [(_HMFNetworkBrowser *)self setNw_browser:v21];
  v22 = [(_HMFNetworkBrowser *)self nw_browser];

  if (v22)
  {
    v4 = (void *)MEMORY[0x19F3A87A0]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = HMFGetLogIdentifier(v5);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Browser started", buf, 0xCu);
      goto LABEL_7;
    }
LABEL_8:

    v23 = +[HMFFuture futureWithNoValue];
    goto LABEL_9;
  }
  v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:6];
  v23 = +[HMFFuture futureWithError:v25];

LABEL_9:
  return v23;
}

- (void)stop
{
  v3 = [(_HMFNetworkBrowser *)self nw_browser];

  if (v3)
  {
    v4 = [(_HMFNetworkBrowser *)self nw_browser];
    nw_browser_cancel(v4);

    [(_HMFNetworkBrowser *)self setNw_browser:0];
  }
}

- (id)stopBrowsing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A87A0]([(_HMFNetworkBrowser *)self stop]);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier(v4);
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Browser stopped", (uint8_t *)&v9, 0xCu);
  }
  v7 = +[HMFFuture futureWithNoValue];
  return v7;
}

+ (id)logCategory
{
  if (qword_1EB4EEB18 != -1) {
    dispatch_once(&qword_1EB4EEB18, &__block_literal_global_28);
  }
  v2 = (void *)qword_1EB4EEB20;
  return v2;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_nw_browser)nw_browser
{
  return self->_nw_browser;
}

- (void)setNw_browser:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_nw_browser, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end