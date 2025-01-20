@interface CLSContextProviderServiceFinder
- (CLSContextProviderServiceFinder)init;
- (CLSContextProviderServiceFinder)initWithDelegate:(id)a3;
- (NSArray)availableServices;
- (void)start;
- (void)stop;
@end

@implementation CLSContextProviderServiceFinder

- (CLSContextProviderServiceFinder)init
{
  return 0;
}

- (CLSContextProviderServiceFinder)initWithDelegate:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSContextProviderServiceFinder;
  v5 = [(CLSContextProviderServiceFinder *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v20 = *MEMORY[0x1E4F282B0];
    v21[0] = 0x1F37A2A10;
    uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v21, &v20, 1);
    extensionAttributes = v6->_extensionAttributes;
    v6->_extensionAttributes = (NSDictionary *)v8;

    uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11);
    mutableAvailableServices = v6->_mutableAvailableServices;
    v6->_mutableAvailableServices = (NSMutableArray *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.ClassKit.CLSContextProviderServiceFinder", v15);
    servicesQueue = v6->_servicesQueue;
    v6->_servicesQueue = (OS_dispatch_queue *)v16;
  }
  return v6;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_extensionsFinderContext)
  {
    uint64_t extensionAttributes = (uint64_t)v2->_extensionAttributes;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1DC641A7C;
    v7[3] = &unk_1E6C96508;
    v7[4] = v2;
    uint64_t v5 = objc_msgSend_beginMatchingExtensionsWithAttributes_completion_(MEMORY[0x1E4F28C70], v3, extensionAttributes, v7);
    id extensionsFinderContext = v2->_extensionsFinderContext;
    v2->_id extensionsFinderContext = (id)v5;
  }
  objc_sync_exit(v2);
}

- (void)stop
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t extensionsFinderContext = (uint64_t)v2->_extensionsFinderContext;
  if (extensionsFinderContext)
  {
    objc_msgSend_endMatchingExtensions_(MEMORY[0x1E4F28C70], v3, extensionsFinderContext);
    id v5 = v2->_extensionsFinderContext;
    v2->_uint64_t extensionsFinderContext = 0;

    servicesQueue = v2->_servicesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC641FC4;
    block[3] = &unk_1E6C96348;
    block[4] = v2;
    dispatch_barrier_async(servicesQueue, block);
  }
  objc_sync_exit(v2);
}

- (NSArray)availableServices
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1DC6420C0;
  v10 = sub_1DC6420D0;
  id v11 = 0;
  servicesQueue = self->_servicesQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DC6420D8;
  v5[3] = &unk_1E6C96530;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(servicesQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAvailableServices, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_servicesQueue, 0);
  objc_storeStrong(&self->_extensionsFinderContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end