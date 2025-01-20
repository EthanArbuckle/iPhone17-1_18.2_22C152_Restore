@interface NEInternetNexus
- (BOOL)setDefaultInputHandler:(nw_protocol *)a3;
- (BOOL)setUseFlowswitch:(BOOL)a3;
- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4;
- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5;
- (NWRemotePacketProxy)packetProxy;
- (void)dealloc;
- (void)setPacketProxy:(id)a3;
- (void)setRemotePacketProxy:(id)a3;
@end

@implementation NEInternetNexus

- (void).cxx_destruct
{
}

- (void)setPacketProxy:(id)a3
{
}

- (NWRemotePacketProxy)packetProxy
{
  return (NWRemotePacketProxy *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)setUseFlowswitch:(BOOL)a3
{
  return NEVirtualInterfaceEnableFlowswitch((uint64_t)[(NENexus *)self virtualInterface], a3);
}

- (void)setRemotePacketProxy:(id)a3
{
  id v6 = a3;
  [(NEInternetNexus *)self setPacketProxy:v6];
  v4 = v6;
  if (v6)
  {
    -[NEInternetNexus setDefaultInputHandler:](self, "setDefaultInputHandler:", [v6 protocol]);
    if (self) {
      utunProtocol = self->_utunProtocol;
    }
    else {
      utunProtocol = 0;
    }
    [v6 setDefaultOutputProtocolHandler:utunProtocol];
    v4 = v6;
  }
}

- (BOOL)setDefaultInputHandler:(nw_protocol *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    int v17 = 136315138;
    v18 = "-[NEInternetNexus setDefaultInputHandler:]";
    v13 = "%s called with null inputHandler";
    v14 = v4;
    uint32_t v15 = 12;
    goto LABEL_16;
  }
  if (self && self->_utunProtocol)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      return 0;
    }
    LOWORD(v17) = 0;
    v16 = "Already have default interface input handler set";
LABEL_20:
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v17, 2u);
    goto LABEL_5;
  }
  if (nw_utun_protocol_identifier_packetProtocolOnceToken != -1) {
    dispatch_once(&nw_utun_protocol_identifier_packetProtocolOnceToken, &__block_literal_global_25118);
  }
  id v6 = (nw_protocol *)nw_protocol_create();
  if (!self || (self->_utunProtocol = v6) == 0)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    LOWORD(v17) = 0;
    v13 = "nw_protocol_create(utun) failed";
    v14 = v4;
    uint32_t v15 = 2;
LABEL_16:
    _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v17, v15);
    goto LABEL_5;
  }
  id Property = objc_getProperty(self, v7, 112, 1);
  v10 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v9, 8, 1);
  }
  id v11 = Property;
  uint64_t protocol_handler = nw_channel_get_protocol_handler();

  if (!protocol_handler)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    LOWORD(v17) = 0;
    v16 = "Could not get kernel channel protocol";
    goto LABEL_20;
  }
  (*(void (**)(void))self->_utunProtocol->callbacks)();
  (**(void (***)(uint64_t, nw_protocol *))(protocol_handler + 24))(protocol_handler, self->_utunProtocol);
  return 1;
}

- (void)dealloc
{
  if (self)
  {
    utunProtocol = self->_utunProtocol;
    if (utunProtocol)
    {
      free(utunProtocol);
      self->_utunProtocol = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NEInternetNexus;
  [(NENexus *)&v4 dealloc];
}

- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4
{
  return [(NEInternetNexus *)self initWithName:a3 delegate:a4 shouldCreateKernelChannel:1];
}

- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NEInternetNexus;
  id v6 = [(NENexus *)&v19 initWithLevel:2 name:a3 virtualInterfaceType:1 delegate:a4 channelCount:0];
  v7 = v6;
  if (!v6)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)v18 = 0;
    int v17 = "[super initWithLevel:name:delegate:] failed";
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t Channel = NEVirtualInterfaceCreateChannel((uint64_t)[(NENexus *)v6 virtualInterface]);
    if (Channel)
    {
      v10 = (void *)Channel;
      id v11 = objc_getProperty(v7, v9, 112, 1);
      v13 = v11;
      if (v11) {
        objc_setProperty_atomic(v11, v12, v10, 8);
      }

      goto LABEL_7;
    }
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v14 = 0;
      goto LABEL_8;
    }
    *(_WORD *)v18 = 0;
    int v17 = "NEVirtualInterfaceCreateChannel failed";
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_10;
  }
LABEL_7:
  v14 = v7;
LABEL_8:

  return v14;
}

@end