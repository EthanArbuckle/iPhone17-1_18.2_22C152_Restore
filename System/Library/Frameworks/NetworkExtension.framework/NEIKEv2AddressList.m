@interface NEIKEv2AddressList
+ (CFStringRef)normalizeServerAddress:(void *)a3 path:;
+ (__CFString)getSynthesizedIPv6Address:(uint64_t)a1 outgoingIf:(void *)a2 nat64Prefixes:(uint64_t)a3 numNat64Prefixes:(int)a4;
@end

@implementation NEIKEv2AddressList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv4AddressList, 0);

  objc_storeStrong((id *)&self->_ipv6AddressList, 0);
}

+ (__CFString)getSynthesizedIPv6Address:(uint64_t)a1 outgoingIf:(void *)a2 nat64Prefixes:(uint64_t)a3 numNat64Prefixes:(int)a4
{
  LODWORD(v4) = a4;
  v6 = a2;
  self;
  if (NEGetAddressFamilyFromString(v6) == 30) {
    goto LABEL_11;
  }
  if (!NECreateAddressStructFromString(v6, 0, 0))
  {
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10.isa) = 0;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to synthesize IPv6 address with IPv4 IKEv2 server address", (uint8_t *)&v10, 2u);
    }

    goto LABEL_11;
  }
  if ((int)v4 < 1)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  uint64_t v4 = v4;
  while (1)
  {
    memset(&v10.info, 0, 20);
    v10.isa = (void *)7708;
    if (nw_nat64_synthesize_v6()) {
      break;
    }
    a3 += 16;
    if (!--v4) {
      goto LABEL_11;
    }
  }
  v8 = (__CFString *)NECreateAddressString(&v10);
LABEL_12:

  return v8;
}

+ (CFStringRef)normalizeServerAddress:(void *)a3 path:
{
  v15.data = (char *)*MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  id v5 = a3;
  self;
  if (!v4)
  {
    CFStringRef v7 = 0;
    goto LABEL_6;
  }
  if (NEGetAddressFamilyFromString(v4) == 30)
  {
    v9 = NECreateAddressStructFromString(v4, 0, 0);
    __CFString v10 = [v5 scopedInterface];
    if (v10) {
      [v5 scopedInterface];
    }
    else {
    v11 = [v5 interface];
    }
    [v11 interfaceIndex];

    if (v9)
    {
      int v12 = nw_nat64_copy_prefixes();
      if (v12 >= 1)
      {
        uint64_t v13 = 0;
        v15.info = 0;
        v15.isa = (void *)528;
        uint64_t v14 = 16 * v12;
        while ((nw_nat64_extract_v4() & 1) == 0)
        {
          v13 += 16;
          if (v14 == v13)
          {
            free(0);
            goto LABEL_16;
          }
        }
        CFStringRef v6 = NECreateAddressString(&v15);
        goto LABEL_4;
      }
LABEL_16:
      free(v9);
    }
  }
  CFStringRef v6 = v4;
LABEL_4:
  CFStringRef v7 = v6;
LABEL_6:

  return v7;
}

@end