@interface Core_Audio_Driver_Service_Client
+ (id)get_driver_name_list:(int)a3;
- (AMCP::Utility::Dispatch_Queue)queue;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Core_Audio_Driver_Service_Client)init;
- (Core_Audio_Driver_Service_Client_Callback_Delegate)delegate;
- (NSXPCConnection)connection_from_driver_service;
- (NSXPCConnection)connection_to_driver_service;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (id).cxx_construct;
- (id)deferred_driver_loaded:(NSObject  *){objcproto17OS_dispatch_queue} reply:(id)&&;
- (id)get_lazy_connection:(shared_ptr<Driver_File>)a3;
- (id)init_with_driver_service_undertaker:(shared_ptr<std::function<void)(std::shared_ptr<Driver_File>;
- (int)load_driver:(shared_ptr<Driver_File>)a3 driver_endpoint:(id *)a4;
- (shared_ptr<Driver_File>)driver_file;
- (shared_ptr<std::function<void)driver_service_undertaker;
- (uint64_t)connect_to_driver_service:;
- (void)connect_to_driver_service:(shared_ptr<Driver_File>)a3;
- (void)dealloc;
- (void)deferred_driver_loaded:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)send_endpoint_to_driver_service;
- (void)setConnection_from_driver_service:(id)a3;
- (void)setConnection_to_driver_service:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDriver_file:(shared_ptr<Driver_File>)a3;
- (void)setDriver_service_undertaker:(shared_ptr<std::function<void)(std::shared_ptr<Driver_File>;
- (void)setEndpoint:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id *)a3;
- (void)tell_driver_service_to_exit;
@end

@implementation Core_Audio_Driver_Service_Client

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_WORD *)self + 56) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 850045863;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((void *)self + 29) = 850045863;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((void *)self + 40) = 850045863;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((void *)self + 49) = dispatch_semaphore_create(0);
  return self;
}

- (void).cxx_destruct
{
  AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)((char *)self + 80));
  v3 = (std::__shared_weak_count *)*((void *)self + 9);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  v4 = (std::__shared_weak_count *)*((void *)self + 7);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (void)setConnection_from_driver_service:(id)a3
{
}

- (NSXPCConnection)connection_from_driver_service
{
  return (NSXPCConnection *)*((void *)self + 5);
}

- (void)setDriver_file:(shared_ptr<Driver_File>)a3
{
  uint64_t v4 = *(void *)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  v5 = (std::__shared_weak_count *)*((void *)self + 9);
  *((void *)self + 8) = v4;
  *((void *)self + 9) = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (shared_ptr<Driver_File>)driver_file
{
  uint64_t v3 = *((void *)self + 9);
  void *v2 = *((void *)self + 8);
  v2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Driver_File *)self;
  return result;
}

- (void)setDriver_service_undertaker:(shared_ptr<std::function<void)(std::shared_ptr<Driver_File>
{
  uint64_t v4 = *(void *)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  v5 = (std::__shared_weak_count *)*((void *)self + 7);
  *((void *)self + 6) = v4;
  *((void *)self + 7) = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (shared_ptr<std::function<void)driver_service_undertaker
{
  uint64_t v3 = *((void *)self + 7);
  void *v2 = *((void *)self + 6);
  v2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)*((void *)self + 4);
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)*((void *)self + 3);
}

- (void)setDelegate:(id)a3
{
}

- (Core_Audio_Driver_Service_Client_Callback_Delegate)delegate
{
  return (Core_Audio_Driver_Service_Client_Callback_Delegate *)*((void *)self + 2);
}

- (void)setQueue:(id *)a3
{
}

- (AMCP::Utility::Dispatch_Queue)queue
{
  return AMCP::Utility::Dispatch_Queue::Dispatch_Queue(a2, *(dispatch_object_t *)(a1 + 80));
}

- (void)setConnection_to_driver_service:(id)a3
{
}

- (NSXPCConnection)connection_to_driver_service
{
  return (NSXPCConnection *)*((void *)self + 1);
}

- (void)deferred_driver_loaded:(id)a3 reply:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = [(Core_Audio_Driver_Service_Client *)self delegate];
  if (v8)
  {
    [(Core_Audio_Driver_Service_Client *)self queue];
    id v9 = v8;
    id v10 = v6;
    id v11 = v12;
    operator new();
  }
  v7[2](v7, 0);
}

- (id)deferred_driver_loaded:(NSObject  *){objcproto17OS_dispatch_queue} reply:(id)&&
{
  uint64_t v4 = (id *)a1;
  id v2 = *(id *)a1;
  if (v2) {
    objc_msgSend(v2, "deferred_driver_loaded:", *(void *)(a1 + 8));
  }
  return std::unique_ptr<HALS_RemotePlugInRegistrar::CreateExtrinsicDriverEntryPoint(void)::$_0::operator() const(NSString *,NSXPCConnection *)::{lambda(void)#1},std::default_delete<HALS_RemotePlugInRegistrar::CreateExtrinsicDriverEntryPoint(void)::$_0::operator() const(NSString *,NSXPCConnection *)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v4);
}

- (void)invalidate
{
  id v7 = [(Core_Audio_Driver_Service_Client *)self connection_to_driver_service];
  if (v7) {
    [v7 invalidate];
  }
  uint64_t v3 = [(Core_Audio_Driver_Service_Client *)self connection_from_driver_service];
  uint64_t v4 = v3;
  if (v3) {
    [v3 invalidate];
  }
  v5 = [(Core_Audio_Driver_Service_Client *)self listener];
  id v6 = v5;
  if (v5) {
    [v5 invalidate];
  }
}

- (void)tell_driver_service_to_exit
{
  [(Core_Audio_Driver_Service_Client *)self driver_file];
  uint64_t v3 = [(Core_Audio_Driver_Service_Client *)self get_lazy_connection:v6];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = __63__Core_Audio_Driver_Service_Client_tell_driver_service_to_exit__block_invoke;
  v5[3] = &__block_descriptor_33_ea8_32c76_ZTSKZ63__Core_Audio_Driver_Service_Client_tell_driver_service_to_exit_E3__9_e17_v16__0__NSError_8l;
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v5];
  objc_msgSend(v4, "exit_service");
}

- (int)load_driver:(shared_ptr<Driver_File>)a3 driver_endpoint:(id *)a4
{
  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v18 = *(void *)a3.__ptr_;
  v19 = v5;
  cntrl = a3.__cntrl_;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v6 = -[Core_Audio_Driver_Service_Client get_lazy_connection:](self, "get_lazy_connection:", &v18, a3.__cntrl_, a4);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  int v17 = 2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke;
  v15[3] = &__block_descriptor_48_ea8_32c77_ZTSKZ64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint__E3__5_e17_v16__0__NSError_8l;
  id v7 = *(id *)(*(void *)ptr + 8);
  v15[4] = &v17;
  id v8 = v7;
  id v16 = v8;
  id v9 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];

  uint64_t v10 = **(_DWORD **)ptr;
  uint64_t v11 = *(void *)(*(void *)ptr + 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke_27;
  v14[3] = &__block_descriptor_48_ea8_32c77_ZTSKZ64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint__E3__6_e34_v20__0i8__NSXPCListenerEndpoint_12l;
  v14[4] = &v17;
  v14[5] = &cntrl;
  objc_msgSend(v9, "load_driver:driver_name:reply:", v10, v11, v14);
  int v12 = v17;

  return v12;
}

- (id)get_lazy_connection:(shared_ptr<Driver_File>)a3
{
  ptr = a3.__ptr_;
  queue[40] = *(dispatch_queue_t *)MEMORY[0x1E4F143B8];
  [(Core_Audio_Driver_Service_Client *)self queue];
  v5 = self;
  id v7 = *(void **)ptr;
  id v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v10[0] = v5;
  v10[1] = v7;
  uint64_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZ56__Core_Audio_Driver_Service_Client_get_lazy_connection__E3__4EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v10;
  dispatch_sync(queue[0], block);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
  id v8 = [(Core_Audio_Driver_Service_Client *)v5 connection_to_driver_service];

  return v8;
}

- (void)connect_to_driver_service:(shared_ptr<Driver_File>)a3
{
  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v20 = *(void *)a3.__ptr_;
  v21 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  -[Core_Audio_Driver_Service_Client setDriver_file:](self, "setDriver_file:", &v20, a3.__cntrl_);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:*(void *)(*(void *)ptr + 32)];
  [(Core_Audio_Driver_Service_Client *)self setConnection_to_driver_service:v6];

  id v7 = [(Core_Audio_Driver_Service_Client *)self connection_to_driver_service];
  [v7 uniquify];

  id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1494EE0];
  id v9 = [(Core_Audio_Driver_Service_Client *)self connection_to_driver_service];
  [v9 setRemoteObjectInterface:v8];

  uint64_t v10 = [(Core_Audio_Driver_Service_Client *)self connection_to_driver_service];
  [v10 setExportedObject:self];

  uint64_t v11 = self;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3321888768;
  v24 = ___ZZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
  v25 = &__block_descriptor_40_ea8_32c75_ZTSKZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__E3__2_e5_v8__0l;
  int v12 = v11;
  v26 = v12;
  uint64_t v13 = _Block_copy(&aBlock);

  v14 = [(Core_Audio_Driver_Service_Client *)v12 connection_to_driver_service];
  [v14 setInvalidationHandler:v13];

  v15 = [(Core_Audio_Driver_Service_Client *)v12 connection_to_driver_service];
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3321888768;
  v24 = ___ZZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__ENK3__3cvU13block_pointerFvvEEv_block_invoke;
  v25 = &__block_descriptor_40_ea8_32c75_ZTSKZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__E3__3_e5_v8__0l;
  id v16 = v15;
  v26 = v16;
  int v17 = _Block_copy(&aBlock);

  uint64_t v18 = [(Core_Audio_Driver_Service_Client *)v12 connection_to_driver_service];
  [v18 setInterruptionHandler:v17];

  v19 = [(Core_Audio_Driver_Service_Client *)v12 connection_to_driver_service];
  [v19 resume];

  [(Core_Audio_Driver_Service_Client *)v12 send_endpoint_to_driver_service];
}

- (uint64_t)connect_to_driver_service:
{
  uint64_t v1 = *a1;
  uint64_t v3 = a1[2];
  id v2 = (std::__shared_weak_count *)a1[3];
  id v6 = a1;
  uint64_t v7 = v3;
  id v8 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(void *)(v1 + 24);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 48))(v4, &v7);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return std::unique_ptr<-[Core_Audio_Driver_Service_Client connect_to_driver_service:]::$_2::operator() const(void)::{lambda(void)#1},std::default_delete<-[Core_Audio_Driver_Service_Client connect_to_driver_service:]::$_2::operator() const(void)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100]((uint64_t *)&v6);
}

- (void)send_endpoint_to_driver_service
{
  char v8 = 1;
  uint64_t v3 = [(Core_Audio_Driver_Service_Client *)self connection_to_driver_service];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke;
  v7[3] = &__block_descriptor_40_ea8_32c80_ZTSKZ67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service_E3__0_e17_v16__0__NSError_8l;
  v7[4] = &v8;
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v7];

  v5 = [(Core_Audio_Driver_Service_Client *)self endpoint];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke_11;
  v6[3] = &__block_descriptor_40_ea8_32c80_ZTSKZ67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service_E3__1_e8_v12__0B8l;
  v6[4] = &v8;
  objc_msgSend(v4, "set_driver_service_client_endpoint:reply:", v5, v6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1492390];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&__block_literal_global_3392];
  [v5 setInvalidationHandler:&__block_literal_global_8];
  [v5 resume];
  [(Core_Audio_Driver_Service_Client *)self setConnection_from_driver_service:v5];

  return 1;
}

- (void)dealloc
{
  uint64_t v3 = (void *)*((void *)self + 1);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v4 = (void *)*((void *)self + 1);
    *((void *)self + 1) = 0;
  }
  id v5 = (void *)*((void *)self + 3);
  if (v5)
  {
    [v5 invalidate];
    [*((id *)self + 3) setDelegate:0];
    id v6 = (void *)*((void *)self + 3);
    *((void *)self + 3) = 0;
  }
  uint64_t v7 = (void *)*((void *)self + 4);
  if (v7)
  {
    *((void *)self + 4) = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)Core_Audio_Driver_Service_Client;
  [(Core_Audio_Driver_Service_Client *)&v8 dealloc];
}

- (id)init_with_driver_service_undertaker:(shared_ptr<std::function<void)(std::shared_ptr<Driver_File>
{
  ptr = (uint64_t *)a3.__ptr_;
  uint64_t v4 = [(Core_Audio_Driver_Service_Client *)self init];
  id v5 = v4;
  if (v4)
  {
    id v6 = (std::__shared_weak_count *)ptr[1];
    uint64_t v8 = *ptr;
    id v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(Core_Audio_Driver_Service_Client *)v4 setDriver_service_undertaker:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (Core_Audio_Driver_Service_Client)init
{
  obj[40] = *(id *)MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)Core_Audio_Driver_Service_Client;
  id v2 = [(Core_Audio_Driver_Service_Client *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    uint64_t v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    [*((id *)v2 + 3) setDelegate:v2];
    uint64_t v5 = [*((id *)v2 + 3) endpoint];
    id v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    [*((id *)v2 + 3) resume];
    AMCP::Utility::Dispatch_Queue::Dispatch_Queue((uint64_t)obj, "driver host connection queue");
    objc_storeStrong((id *)v2 + 10, obj[0]);
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)obj);
  }
  return (Core_Audio_Driver_Service_Client *)v2;
}

+ (id)get_driver_name_list:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.audio.Core-Audio-Driver-Service.helper"];
  [v4 uniquify];
  uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1494EE0];
  [v4 setRemoteObjectInterface:v5];

  [v4 resume];
  id v11 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  id v10[2] = __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke;
  v10[3] = &__block_descriptor_33_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Service_Client_get_driver_name_list__E3__7_e17_v16__0__NSError_8l;
  id v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke_33;
  v9[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Service_Client_get_driver_name_list__E3__8_e17_v16__0__NSArray_8l;
  v9[4] = &v11;
  objc_msgSend(v6, "get_driver_name_list:reply:", v3, v9);
  objc_msgSend(v6, "exit_service");
  [v4 invalidate];
  id v7 = v11;

  return v7;
}

@end