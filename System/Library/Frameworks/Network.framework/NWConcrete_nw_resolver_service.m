@interface NWConcrete_nw_resolver_service
- (NSString)description;
@end

@implementation NWConcrete_nw_resolver_service

- (NSString)description
{
  v2 = self;
  v10 = 0;
  if (v2)
  {
    v3 = (unsigned __int16 *)v2;
    int priority = v2->priority;
    service_host = v2->service_host;
    if (priority)
    {
      logging_description = nw_endpoint_get_logging_description(service_host);
      asprintf(&v10, "(Service for %s, priority=%u)", logging_description, v3[16]);
    }
    else
    {
      v7 = nw_endpoint_get_logging_description(service_host);
      asprintf(&v10, "(Service Alias for %s)", v7);
    }
    v8 = v10;

    if (v8) {
      v2 = (NWConcrete_nw_resolver_service *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
    }
    else {
      v2 = 0;
    }
  }

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ech_config, 0);
  objc_storeStrong((id *)&self->gai, 0);
  objc_storeStrong((id *)&self->alternative_origin, 0);

  objc_storeStrong((id *)&self->service_host, 0);
}

@end