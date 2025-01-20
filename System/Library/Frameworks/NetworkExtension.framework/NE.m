@interface NE
@end

@implementation NE

void ___NE_DNSMessageExtractDomainNameString_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = dlopen("/usr/lib/libmdns.dylib", 5);
  _NE_DNSMessageExtractDomainNameString_mdnsImage = (uint64_t)v0;
  if (v0)
  {
    _NE_DNSMessageExtractDomainNameString__mdns_DNSMessageExtractDomainNameString = dlsym(v0, "DNSMessageExtractDomainNameString");
    if (_NE_DNSMessageExtractDomainNameString__mdns_DNSMessageExtractDomainNameString) {
      return;
    }
    v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v6) = 0;
      v2 = "dlsym libmdns DNSMessageExtractDomainNameString";
      v3 = v1;
      uint32_t v4 = 2;
LABEL_9:
      _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, v2, (uint8_t *)&v6, v4);
    }
  }
  else
  {
    v5 = dlerror();
    v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      v7 = v5;
      v2 = "dlopen libmdns failed: %s";
      v3 = v1;
      uint32_t v4 = 12;
      goto LABEL_9;
    }
  }
}

@end