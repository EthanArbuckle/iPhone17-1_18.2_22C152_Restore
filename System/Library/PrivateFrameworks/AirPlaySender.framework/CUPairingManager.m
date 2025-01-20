@interface CUPairingManager
@end

@implementation CUPairingManager

uint64_t __80__CUPairingManager_APPairingClientCoreUtils__pairingGroupInfoForPairingGroupID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 groupInfo];
  if (result)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [a2 groupInfo];
    return [v5 addEntriesFromDictionary:v6];
  }
  return result;
}

intptr_t __74__CUPairingManager_APPairingClientCoreUtils__peersMatchingPairingGroupID___block_invoke(void *a1, void *a2)
{
  if (NSErrorToOSStatus())
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      if (a1[4]) {
        IsAppleInternalBuild();
      }
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_APPairingClientCoreUtils <= 50
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      [a2 count];
      if (a1[4]) {
        IsAppleInternalBuild();
      }
      LogPrintF();
    }
    *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
  }
  v4 = a1[5];
  return dispatch_semaphore_signal(v4);
}

intptr_t __87__CUPairingManager_APPairingClientCoreUtils__updatePairingGroupInfo_forPairingGroupID___block_invoke(void *a1)
{
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = NSErrorToOSStatus();
  if (*(_DWORD *)(*(void *)(a1[6] + 8) + 24))
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      if (!a1[4]) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }
  }
  else if (gLogCategory_APPairingClientCoreUtils <= 50 {
         && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  }
  {
    if (!a1[4])
    {
LABEL_8:
      LogPrintF();
      goto LABEL_9;
    }
LABEL_5:
    IsAppleInternalBuild();
    goto LABEL_8;
  }
LABEL_9:
  v2 = a1[5];
  return dispatch_semaphore_signal(v2);
}

intptr_t __61__CUPairingManager_APPairingClientCoreUtils__savePairedPeer___block_invoke(void *a1)
{
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = NSErrorToOSStatus();
  if (*(_DWORD *)(*(void *)(a1[6] + 8) + 24))
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_APPairingClientCoreUtils <= 50 {
         && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  }
  {
    if (a1[4]) {
      IsAppleInternalBuild();
    }
    goto LABEL_8;
  }
  v2 = a1[5];
  return dispatch_semaphore_signal(v2);
}

@end