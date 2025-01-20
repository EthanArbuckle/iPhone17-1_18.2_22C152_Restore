@interface Invalidate
@end

@implementation Invalidate

void __apsession_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (!*DerivedStorage)
  {
    v4 = DerivedStorage;
    unsigned char *DerivedStorage = 1;
    apsession_stopSenderNetworkClockIfNeeded(v2);
    MEMORY[0x1D25EB370](*((void *)v4 + 32));
    v5 = (const void *)*((void *)v4 + 35);
    if (v5) {
      CFTypeRef v6 = CFRetain(v5);
    }
    else {
      CFTypeRef v6 = 0;
    }
    v7 = (const void *)*((void *)v4 + 44);
    if (v7)
    {
      CFRelease(v7);
      *((void *)v4 + 44) = 0;
    }
    v8 = (const void *)*((void *)v4 + 46);
    if (v8)
    {
      CFRelease(v8);
      *((void *)v4 + 46) = 0;
    }
    v9 = (const void *)*((void *)v4 + 47);
    if (v9)
    {
      CFRelease(v9);
      *((void *)v4 + 47) = 0;
    }
    v10 = (const void *)*((void *)v4 + 48);
    if (v10)
    {
      CFRelease(v10);
      *((void *)v4 + 48) = 0;
    }
    MEMORY[0x1D25EB390](*((void *)v4 + 32));
    if (v4[176])
    {
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      v13 = *(void (**)(CFTypeRef))(v12 + 56);
      if (v13) {
        v13(v6);
      }
      v4[176] = 0;
    }
    MEMORY[0x1D25EB370](*((void *)v4 + 32));
    if (*((void *)v4 + 35))
    {
      uint64_t CMBaseObject = FigTransportSessionGetCMBaseObject();
      if (CMBaseObject)
      {
        uint64_t v15 = CMBaseObject;
        uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v17 = v16 ? v16 : 0;
        v18 = *(void (**)(uint64_t))(v17 + 24);
        if (v18) {
          v18(v15);
        }
      }
    }
    MEMORY[0x1D25EB390](*((void *)v4 + 32));
    v19 = (const void *)*((void *)v4 + 6);
    if (v19)
    {
      CFRelease(v19);
      *((void *)v4 + 6) = 0;
    }
    v20 = (const void *)*((void *)v4 + 7);
    if (v20)
    {
      CFRelease(v20);
      *((void *)v4 + 7) = 0;
    }
    v21 = (const void *)*((void *)v4 + 24);
    if (v21)
    {
      CFRelease(v21);
      *((void *)v4 + 24) = 0;
    }
    v22 = (const void *)*((void *)v4 + 25);
    if (v22)
    {
      CFRelease(v22);
      *((void *)v4 + 25) = 0;
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

@end