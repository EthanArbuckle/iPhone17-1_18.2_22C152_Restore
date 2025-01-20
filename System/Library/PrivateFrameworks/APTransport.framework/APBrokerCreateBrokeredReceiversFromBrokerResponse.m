@interface APBrokerCreateBrokeredReceiversFromBrokerResponse
@end

@implementation APBrokerCreateBrokeredReceiversFromBrokerResponse

CFArrayRef __APBrokerCreateBrokeredReceiversFromBrokerResponse_block_invoke(const __CFArray *result, CFTypeRef cf)
{
  if (cf)
  {
    uint64_t v2 = (uint64_t)result;
    CFTypeID v3 = CFGetTypeID(cf);
    result = (const __CFArray *)CFDictionaryGetTypeID();
    if ((const __CFArray *)v3 == result)
    {
      CFStringGetTypeID();
      result = (const __CFArray *)CFDictionaryGetTypedValue();
      if (result)
      {
        CFArrayGetTypeID();
        result = (const __CFArray *)CFDictionaryGetTypedValue();
        if (result)
        {
          CFArrayRef v4 = result;
          unint64_t Int64 = CFDictionaryGetInt64();
          uint64_t v6 = *(void *)(*(void *)(v2 + 32) + 8);
          unint64_t v7 = *(void *)(v6 + 24);
          if (!v7 || Int64 && Int64 < v7) {
            *(void *)(v6 + 24) = Int64;
          }
          CFArrayGetCount(v4);
          return (const __CFArray *)CFArrayApplyBlock();
        }
      }
    }
  }
  return result;
}

@end