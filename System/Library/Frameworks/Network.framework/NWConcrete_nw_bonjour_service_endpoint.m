@interface NWConcrete_nw_bonjour_service_endpoint
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (const)domainForPolicy;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)type;
- (void)dealloc;
@end

@implementation NWConcrete_nw_bonjour_service_endpoint

- (unint64_t)getHash
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  service_composite = self->service_composite;
  CC_LONG v4 = strlen(service_composite);
  CC_SHA256_Update(&v7, service_composite, v4);
  CC_SHA256_Final(md, &v7);
  int8x16_t v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (id)copyEndpoint
{
  return nw_endpoint_create_bonjour_service(self->service_name, self->service_type, self->service_domain);
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v6 = (const char **)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_bonjour_service_endpoint;
  BOOL v7 = [(NWConcrete_nw_endpoint *)&v9 isEqualToEndpoint:v6 matchFlags:v4]
    && strcmp(self->service_composite, v6[32]) == 0;

  return v7;
}

- (char)createDescription:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  service_composite = self->service_composite;
  if (a3)
  {
    char v13 = 0;
    v12 = 0;
    size_t v5 = strlen(service_composite);
    __nwlog_salted_hash(service_composite, v5, (char *)&v12);
    service_composite = __str;
    snprintf(__str, 0x11uLL, "%s%s", "Bonjour#", (const char *)&v12);
  }
  v6 = self;
  BOOL v7 = v6->super.interface;

  v8 = v7 + 104;
  objc_super v9 = "@";
  if (!v7)
  {
    objc_super v9 = "";
    v8 = "";
  }
  v12 = 0;
  asprintf(&v12, "%s%s%s", service_composite, v9, v8);
  uint64_t v10 = v12;

  return v10;
}

- (const)domainForPolicy
{
  return self->service_composite;
}

- (id)copyDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)NWConcrete_nw_bonjour_service_endpoint;
  id v3 = [(NWConcrete_nw_endpoint *)&v10 copyDictionary];
  uint64_t v4 = v3;
  if (v3)
  {
    service_name = self->service_name;
    if (service_name) {
      xpc_dictionary_set_string(v3, "bonjour_name", service_name);
    }
    service_type = self->service_type;
    if (service_type) {
      xpc_dictionary_set_string(v4, "bonjour_type", service_type);
    }
    service_domain = self->service_domain;
    if (service_domain) {
      xpc_dictionary_set_string(v4, "bonjour_domain", service_domain);
    }
    id v8 = v4;
  }

  return v4;
}

- (unsigned)type
{
  return 3;
}

- (void)dealloc
{
  service_name = self->service_name;
  if (service_name)
  {
    free(service_name);
    self->service_name = 0;
  }
  service_type = self->service_type;
  if (service_type)
  {
    free(service_type);
    self->service_type = 0;
  }
  service_domain = self->service_domain;
  if (service_domain)
  {
    free(service_domain);
    self->service_domain = 0;
  }
  service_composite = self->service_composite;
  if (service_composite)
  {
    free(service_composite);
    self->service_composite = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NWConcrete_nw_bonjour_service_endpoint;
  [(NWConcrete_nw_endpoint *)&v7 dealloc];
}

@end