@interface CopyProperty
@end

@implementation CopyProperty

void __stream_CopyProperty_block_invoke(void *a1)
{
  v3 = (const void *)a1[6];
  uint64_t v2 = a1[7];
  v4 = (uint64_t *)a1[8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef cf = 0;
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    int v20 = -16617;
    goto LABEL_25;
  }
  uint64_t v6 = DerivedStorage;
  int v7 = CFEqual(v3, @"LastDeliveredMessage");
  uint64_t v8 = *(void *)(v6 + 40);
  if (!v7)
  {
    uint64_t CMBaseObject = APTransportConnectionGetCMBaseObject(v8);
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    v21 = *(uint64_t (**)(uint64_t, const void *, uint64_t, uint64_t *))(v14 + 48);
    if (v21)
    {
      int v20 = v21(CMBaseObject, v3, v2, v4);
      if (!v20) {
        goto LABEL_25;
      }
    }
    else
    {
      int v20 = -12782;
    }
    goto LABEL_19;
  }
  uint64_t v9 = APTransportConnectionGetCMBaseObject(v8);
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v15 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t, CFTypeRef *))(v11 + 48);
  if (!v15)
  {
    int v20 = -12782;
LABEL_19:
    APSLogErrorAt();
    goto LABEL_25;
  }
  int v16 = v15(v9, @"LastDeliveredPackage", v2, &cf);
  if (v16)
  {
    int v20 = v16;
    goto LABEL_19;
  }
  CFTypeRef v17 = cf;
  if (cf
    && ((uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0 ? (v19 = 0) : (v19 = v18),
        (v22 = *(uint64_t (**)(CFTypeRef))(v19 + 8)) != 0))
  {
    uint64_t v23 = v22(v17);
  }
  else
  {
    uint64_t v23 = 0;
  }
  int v20 = 0;
  uint64_t *v4 = v23;
LABEL_25:
  if (cf) {
    CFRelease(cf);
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v20;
}

@end