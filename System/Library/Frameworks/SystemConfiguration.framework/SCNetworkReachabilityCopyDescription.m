@interface SCNetworkReachabilityCopyDescription
@end

@implementation SCNetworkReachabilityCopyDescription

uint64_t ____SCNetworkReachabilityCopyDescription_block_invoke(uint64_t a1, int a2, nw_endpoint_t endpoint)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t type = nw_endpoint_get_type(endpoint);
  if (type == 2)
  {
    v7 = *(__CFString **)(a1 + 32);
    hostname = nw_endpoint_get_hostname(endpoint);
    CFStringAppendFormat(v7, 0, @", %s", hostname);
  }
  else if (type == 1)
  {
    address = nw_endpoint_get_address(endpoint);
    _SC_sockaddr_to_string((uint64_t)address, v10, 0x40uLL);
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @", %s", v10);
  }
  else
  {
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, @", unexpected nw_endpoint type: %u", type);
  }
  return 1;
}

@end