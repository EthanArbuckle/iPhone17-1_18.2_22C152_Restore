@interface MXRoutingPrewarmingChannel
- (MXRoutingPrewarmingChannel)initWithRoutingContextUUID:(id)a3 endpoint:(OpaqueFigEndpoint *)a4 previousRouteDescriptors:(id)a5;
- (NSArray)previousRouteDescriptors;
- (NSString)routingContextUUID;
- (OpaqueFigEndpoint)endpoint;
- (id)closeChannelBlock;
- (id)persistPrewarmingBlock;
- (void)closeChannel;
- (void)dealloc;
- (void)persistChannel;
- (void)setCloseChannelBlock:(id)a3;
- (void)setPersistPrewarmingBlock:(id)a3;
@end

@implementation MXRoutingPrewarmingChannel

- (MXRoutingPrewarmingChannel)initWithRoutingContextUUID:(id)a3 endpoint:(OpaqueFigEndpoint *)a4 previousRouteDescriptors:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MXRoutingPrewarmingChannel;
  v8 = [(MXRoutingPrewarmingChannel *)&v12 init];
  if (a4) {
    v9 = (OpaqueFigEndpoint *)CFRetain(a4);
  }
  else {
    v9 = 0;
  }
  v8->_endpoint = v9;
  v8->_routingContextUUID = (NSString *)a3;
  v8->_previousRouteDescriptors = (NSArray *)a5;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    int v7 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    CFRelease(endpoint);
    self->_endpoint = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)MXRoutingPrewarmingChannel;
  [(MXRoutingPrewarmingChannel *)&v5 dealloc];
}

- (void)closeChannel
{
  v2 = [(MXRoutingPrewarmingChannel *)self closeChannelBlock];
  if (v2)
  {
    v3 = (void (*)(void))v2[2];
    v3();
  }
}

- (void)persistChannel
{
  v2 = [(MXRoutingPrewarmingChannel *)self persistPrewarmingBlock];
  if (v2)
  {
    v3 = (void (*)(void))v2[2];
    v3();
  }
}

- (id)closeChannelBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCloseChannelBlock:(id)a3
{
}

- (id)persistPrewarmingBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPersistPrewarmingBlock:(id)a3
{
}

- (OpaqueFigEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSString)routingContextUUID
{
  return self->_routingContextUUID;
}

- (NSArray)previousRouteDescriptors
{
  return self->_previousRouteDescriptors;
}

@end