@interface NWConcrete_nw_protocol_instance_registrar
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_instance_registrar

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (NSString)description
{
  v2 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_protocol_instance_registrar %p %s>", self, (char *)self + 24);

  return (NSString *)v2;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (gLogDatapath)
  {
    v3 = __nwlog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v6 = "-[NWConcrete_nw_protocol_instance_registrar dealloc]";
      __int16 v7 = 2048;
      v8 = self;
      _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEBUG, "%{public}s <nw_protocol_instance_registrar %p> dealloc", buf, 0x16u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_protocol_instance_registrar;
  [(NWConcrete_nw_protocol_instance_registrar *)&v4 dealloc];
}

@end