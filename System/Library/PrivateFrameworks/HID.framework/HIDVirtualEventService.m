@interface HIDVirtualEventService
- (BOOL)dispatchEvent:(id)a3;
- (HIDEventSystemClient)client;
- (HIDServiceClient)serviceClient;
- (HIDVirtualEventService)init;
- (HIDVirtualEventServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)description;
- (unint64_t)serviceID;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceClient:(id)a3;
@end

@implementation HIDVirtualEventService

- (void)cancel
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

- (void)setDispatchQueue:(id)a3
{
  id v5 = a3;
  v4 = [(HIDVirtualEventService *)self client];
  [v4 setDispatchQueue:v5];

  [(HIDVirtualEventService *)self setQueue:v5];
}

- (void)setQueue:(id)a3
{
}

- (HIDVirtualEventService)init
{
  v6.receiver = self;
  v6.super_class = (Class)HIDVirtualEventService;
  v2 = [(HIDVirtualEventService *)&v6 init];
  if (v2)
  {
    v3 = [[HIDEventSystemClient alloc] initWithType:4];
    [(HIDVirtualEventService *)v2 setClient:v3];

    v4 = [(HIDVirtualEventService *)v2 client];

    if (v4) {
      v4 = v2;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCancelHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDVirtualEventService *)self client];
  [v5 setCancelHandler:v4];
}

- (void)activate
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

- (HIDEventSystemClient)client
{
  return (HIDEventSystemClient *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)dispatchEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDVirtualEventService *)self serviceClient];

  if (v5)
  {
    objc_super v6 = [(HIDVirtualEventService *)self serviceClient];
    BOOL v7 = IOHIDVirtualServiceClientDispatchEvent() != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (HIDServiceClient)serviceClient
{
  return (HIDServiceClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceClient:(id)a3
{
}

- (HIDVirtualEventServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HIDVirtualEventServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<HIDVirtualEventService serviceID:0x%llx>", -[HIDVirtualEventService serviceID](self, "serviceID"));
}

void __34__HIDVirtualEventService_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 notification:11 withProperty:0 forService:v3];

    id WeakRetained = v3;
  }
}

- (unint64_t)serviceID
{
  id v3 = [(HIDVirtualEventService *)self serviceClient];

  if (!v3) {
    return 0;
  }
  id v4 = [(HIDVirtualEventService *)self serviceClient];
  id v5 = IOHIDServiceClientGetRegistryID(v4);

  unint64_t v6 = [v5 unsignedLongLongValue];
  return v6;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

@end