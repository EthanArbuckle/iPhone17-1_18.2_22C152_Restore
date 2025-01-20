@interface APAdvertiserBTLEEventHandler
@end

@implementation APAdvertiserBTLEEventHandler

void ___APAdvertiserBTLEEventHandler_block_invoke(uint64_t a1)
{
  switch(*(_DWORD *)(a1 + 40))
  {
    case 0:
      uint64_t v1 = *(void *)(a1 + 32);
      char v2 = 1;
      goto LABEL_7;
    case 1:
      uint64_t v1 = *(void *)(a1 + 32);
      char v2 = 0;
LABEL_7:
      _APAdvertiserHandleSourceDeviceNearbyEvent(v1, v2);
      return;
    case 2:
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 1;
      goto LABEL_12;
    case 3:
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = 0;
LABEL_12:
      _APAdvertiserSetNeedsNIRangingSession(v3, v4);
      break;
    default:
      if (gLogCategory_APAdvertiser <= 60
        && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
}

@end