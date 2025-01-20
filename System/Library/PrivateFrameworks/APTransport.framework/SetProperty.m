@interface SetProperty
@end

@implementation SetProperty

void __httpconnection_SetProperty_block_invoke(void *a1)
{
  v2 = (const void *)a1[6];
  v3 = (const void *)a1[7];
  int v19 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(v2, @"TransportDevice"))
  {
    if (!*(unsigned char *)(DerivedStorage + 224))
    {
      if (v3)
      {
        CFTypeID v5 = CFGetTypeID(v3);
        if (v5 == APTransportDeviceGetTypeID())
        {
          *(void *)(DerivedStorage + 248) = CFRetain(v3);
          goto LABEL_33;
        }
      }
      goto LABEL_31;
    }
LABEL_30:
    APSLogErrorAt();
    int v9 = -72321;
LABEL_32:
    int v19 = v9;
    goto LABEL_33;
  }
  if (CFEqual(v2, @"RemoteNetworkIPAddress"))
  {
    if (v3)
    {
      CFTypeID v6 = CFGetTypeID(v3);
      if (v6 == APSNetworkAddressGetTypeID())
      {
        APSNetworkAddressGetSocketAddr();
        *(_OWORD *)(DerivedStorage + 164) = *(_OWORD *)v18;
        *(_OWORD *)(DerivedStorage + 176) = *(_OWORD *)&v18[12];
        goto LABEL_33;
      }
    }
    goto LABEL_31;
  }
  if (CFEqual(v2, @"RemoteNetworkPort"))
  {
    *(_DWORD *)(DerivedStorage + 192) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, @"BoundInterfaceIndex"))
  {
    *(_DWORD *)(DerivedStorage + 196) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, @"ConnectedSocket"))
  {
    if (!*(unsigned char *)(DerivedStorage + 224)) {
      goto LABEL_30;
    }
    if (v3)
    {
      CFTypeID v7 = CFGetTypeID(v3);
      if (v7 == APTransportSocketGetTypeID())
      {
        *(_DWORD *)(DerivedStorage + 248) = APTransportSocketGetSocket((uint64_t)v3);
        goto LABEL_33;
      }
    }
LABEL_31:
    APSLogErrorAt();
    int v9 = -72322;
    goto LABEL_32;
  }
  if (CFEqual(v2, @"DACPID"))
  {
    *(void *)(DerivedStorage + 328) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, @"DACPRemoteID"))
  {
    *(_DWORD *)(DerivedStorage + 336) = CFGetInt64();
    goto LABEL_33;
  }
  if (CFEqual(v2, @"DoNotWakeDevice"))
  {
    *(unsigned char *)(DerivedStorage + 340) = CFGetInt64() != 0;
    goto LABEL_33;
  }
  if (CFEqual(v2, @"PackageSendTimeout"))
  {
    *(_DWORD *)(DerivedStorage + 344) = CFGetInt64Ranged();
    uint64_t v8 = *(void *)(DerivedStorage + 264);
    if (*(unsigned char *)(DerivedStorage + 256))
    {
      if (v8) {
        HTTPConnectionSetTimeout();
      }
    }
    else if (v8)
    {
      HTTPClientSetTimeout();
    }
    if (gLogCategory_APTransportConnectionHTTP <= 40
      && (gLogCategory_APTransportConnectionHTTP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_33;
  }
  if (CFEqual(v2, @"SessionUUID"))
  {
    if (v3)
    {
      CFTypeID v10 = CFGetTypeID(v3);
      if (v10 == CFUUIDGetTypeID())
      {
        *(void *)(DerivedStorage + 128) = CFRetain(v3);
        goto LABEL_33;
      }
    }
    goto LABEL_31;
  }
  if (CFEqual(v2, @"UserName"))
  {
    if (v3)
    {
      CFTypeID v11 = CFGetTypeID(v3);
      if (v11 != CFStringGetTypeID()) {
        goto LABEL_31;
      }
      v12 = *(const void **)(DerivedStorage + 352);
      *(void *)(DerivedStorage + 352) = v3;
      goto LABEL_53;
    }
    v12 = *(const void **)(DerivedStorage + 352);
    *(void *)(DerivedStorage + 352) = 0;
    goto LABEL_60;
  }
  if (CFEqual(v2, @"Password"))
  {
    if (v3)
    {
      CFTypeID v13 = CFGetTypeID(v3);
      if (v13 != CFStringGetTypeID()) {
        goto LABEL_31;
      }
      v12 = *(const void **)(DerivedStorage + 360);
      *(void *)(DerivedStorage + 360) = v3;
LABEL_53:
      CFRetain(v3);
      goto LABEL_60;
    }
    v12 = *(const void **)(DerivedStorage + 360);
    *(void *)(DerivedStorage + 360) = 0;
LABEL_60:
    if (v12) {
      CFRelease(v12);
    }
    goto LABEL_33;
  }
  if (CFEqual(v2, @"UseRFC2617DigestAuth"))
  {
    *(unsigned char *)(DerivedStorage + 368) = CFGetInt64() != 0;
    goto LABEL_33;
  }
  if (!CFEqual(v2, @"UserAgent"))
  {
    int v9 = -12784;
    goto LABEL_32;
  }
  if (v3)
  {
    CFTypeID v14 = CFGetTypeID(v3);
    if (v14 != CFStringGetTypeID()) {
      goto LABEL_31;
    }
  }
  v17 = *(void **)(DerivedStorage + 32);
  v16 = (void *)(DerivedStorage + 32);
  v15 = v17;
  if (v17)
  {
    free(v15);
    void *v16 = 0;
  }
  if (v3) {
    ASPrintF();
  }
LABEL_33:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v19;
}

uint64_t __tcpconnection_SetProperty_block_invoke(void *a1)
{
  v2 = (const void *)a1[6];
  v3 = (const void *)a1[7];
  int v10 = 0;
  uint64_t DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    APSLogErrorAt();
    int v10 = -12785;
  }
  else
  {
    CFTypeID v5 = DerivedStorage;
    if (CFEqual(v2, @"PackageType"))
    {
      if (FigCFEqual())
      {
        *((void *)v5 + 26) = APTransportPackageTCPGetPayloadSize;
        *((void *)v5 + 27) = APTransportPackageTCPCreateWithBBuf;
        *((void *)v5 + 28) = APTransportPackageTCPCreate;
        *((void *)v5 + 29) = APTransportPackageTCPCreateWithMessageSize;
        APTransportPackageTCPGetHeaderSize((_DWORD *)v5 + 50);
        goto LABEL_16;
      }
      if (FigCFEqual())
      {
        *((void *)v5 + 26) = APTPackageMusicDataGetPayloadSize;
        *((void *)v5 + 27) = APTPackageMusicDataCreateWithBBuf;
        *((void *)v5 + 28) = APTPackageMusicDataCreate;
        *((void *)v5 + 29) = APTPackageMusicDataCreateWithMessageSize;
        APTPackageMusicDataGetHeaderSize((_DWORD *)v5 + 50);
        goto LABEL_16;
      }
      if (FigCFEqual())
      {
        *((void *)v5 + 26) = 0;
        *((void *)v5 + 27) = 0;
        *((void *)v5 + 28) = APTransportPackageRTPCreate;
        *((void *)v5 + 29) = APTransportPackageRTPCreateWithMessageSize;
        goto LABEL_16;
      }
      if (gLogCategory_APTransportConnectionTCP <= 90
        && (gLogCategory_APTransportConnectionTCP != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int v8 = -12780;
      goto LABEL_30;
    }
    if (CFEqual(v2, @"RemoteNetworkIPAddress"))
    {
      if (!*((void *)v5 + 19))
      {
        if (v3)
        {
          CFTypeID v6 = CFGetTypeID(v3);
          if (v6 == APSNetworkAddressGetTypeID())
          {
            APSNetworkAddressGetSocketAddr();
            *(_OWORD *)(v5 + 92) = *(_OWORD *)v9;
            *(_OWORD *)(v5 + 104) = *(_OWORD *)&v9[12];
LABEL_15:
            SockAddrSetPort();
            goto LABEL_16;
          }
        }
      }
    }
    else if (CFEqual(v2, @"RemoteNetworkPort"))
    {
      if (!*((void *)v5 + 19))
      {
        *((_DWORD *)v5 + 30) = CFGetInt64();
        goto LABEL_15;
      }
    }
    else
    {
      if (!CFEqual(v2, @"BoundInterfaceIndex"))
      {
        int v8 = -12784;
LABEL_30:
        int v10 = v8;
        goto LABEL_16;
      }
      if (!*((void *)v5 + 19))
      {
        *((_DWORD *)v5 + 31) = CFGetInt64();
        goto LABEL_16;
      }
    }
    APSLogErrorAt();
    int v10 = -72322;
  }
  APSSignalErrorAt();
LABEL_16:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v10;
  uint64_t result = FigCFEqual();
  if (!result) {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 0;
  }
  return result;
}

uint64_t __stream_SetProperty_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[7];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    uint64_t result = APSLogErrorAt();
    int v10 = -16617;
    goto LABEL_10;
  }
  uint64_t CMBaseObject = APTransportConnectionGetCMBaseObject(*(void *)(DerivedStorage + 40));
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (!v8)
  {
    int v10 = -12782;
LABEL_9:
    uint64_t result = APSLogErrorAt();
    goto LABEL_10;
  }
  uint64_t result = v8(CMBaseObject, v2, v3);
  int v10 = result;
  if (result) {
    goto LABEL_9;
  }
LABEL_10:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v10;
  return result;
}

void __tcpunbufnw_SetProperty_block_invoke(uint64_t a1)
{
  tcpunbufnwGuts_connectionReceivePackages(*(CFTypeRef *)(a1 + 32));
  uint64_t v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

@end