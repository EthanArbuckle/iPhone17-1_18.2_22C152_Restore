@interface CopyProperty
@end

@implementation CopyProperty

CFTypeRef __dataSource_CopyProperty_block_invoke(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"PSGDataSource::DevicePSGInfos"))
  {
    CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 56) + 16);
    if (!result)
    {
LABEL_4:
      **(void **)(a1 + 48) = result;
      return result;
    }
LABEL_3:
    CFTypeRef result = CFRetain(result);
    goto LABEL_4;
  }
  CFTypeRef result = (CFTypeRef)CFEqual(*(CFTypeRef *)(a1 + 40), @"PSGDataSource::LocalPSGInfo");
  if (result)
  {
    CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 56) + 24);
    if (!result) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12787;
  return result;
}

@end