@interface OS_tcp_listener
- (void)dealloc;
@end

@implementation OS_tcp_listener

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = gLogObj;
  if (os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "tcp_listener_dispose";
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %p", buf, 0x16u);
  }
  Class isa = self[2].super.super.isa;
  if (isa)
  {
    xpc_release(isa);
    self[2].super.super.Class isa = 0;
  }
  Class v5 = self[3].super.super.isa;
  if (v5)
  {
    xpc_release(v5);
    self[3].super.super.Class isa = 0;
  }
  Class v6 = self[4].super.super.isa;
  if (v6)
  {
    xpc_release(v6);
    self[4].super.super.Class isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)OS_tcp_listener;
  [(OS_tcp_listener *)&v7 dealloc];
}

@end