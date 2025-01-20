@interface APBrokerGroupCallNextBroker
@end

@implementation APBrokerGroupCallNextBroker

void ___APBrokerGroupCallNextBroker_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (gLogCategory_APBrokerGroup <= 30 && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v4 = (void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (!v4)
  {
    *(unsigned char *)(v2 + 40) = 1;
    *(_DWORD *)(v2 + 44) = -71148;
    if (gLogCategory_APBrokerGroup <= 30
      && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (*(unsigned char *)(v2 + 40))
  {
    if (!*(_DWORD *)(v2 + 44))
    {
      if (v3)
      {
        uint64_t v5 = FigCFWeakReferenceHolderCopyReferencedObject();
        if (v5)
        {
          v6 = (const void *)v5;
          if (gLogCategory_APBrokerGroup <= 50
            && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7 = (const void *)v4[6];
          GroupID = (const void *)APBrokerGroupGetGroupID((uint64_t)v6);
          v4[6] = GroupID;
          if (GroupID) {
            CFRetain(GroupID);
          }
          if (v7) {
            CFRelease(v7);
          }
          CFRelease(v6);
        }
        else if (gLogCategory_APBrokerGroup <= 30 {
               && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
        }
        {
          LogPrintF();
        }
      }
      else
      {
        APSLogErrorAt();
      }
    }
    _APBrokerGroupDoneCallingBrokers((uint64_t)v4, v2);
    if (v4) {
      goto LABEL_26;
    }
  }
  else
  {
    _APBrokerGroupCallNextBroker(v4, v2);
    if (v4) {
LABEL_26:
    }
      CFRelease(v4);
  }
  v9 = *(const void **)(a1 + 32);
  if (v9)
  {
    CFRelease(v9);
  }
}

@end