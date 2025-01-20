@interface AsyncConnection
@end

@implementation AsyncConnection

void ___AsyncConnection_StartNANDataSession_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9 = *(int **)(*(void *)(a1 + 40) + 144);
  int v10 = *v9;
  if (a2)
  {
    if (v10 <= 90)
    {
      if (v10 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(*(void *)(a1 + 40) + 144), 0x5Au)) {
          goto LABEL_9;
        }
        v9 = *(int **)(*(void *)(a1 + 40) + 144);
      }
      uint64_t v12 = [*(id *)(a1 + 32) peerEndpoint];
      LogPrintF((uint64_t)v9, (uint64_t)"OSStatus _AsyncConnection_StartNANDataSession(AsyncConnectionRef, CFTypeRef)_block_invoke", 0x5Au, (uint64_t)"### NAN data session failed: %@, %{error}\n", v13, v14, v15, v16, v12);
    }
LABEL_9:
    uint64_t v17 = *(void *)(a1 + 48);
    unsigned int v18 = [a2 code];
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 4294960596;
    }
    _AsyncConnection_ErrorHandler(v17, v19);
    v20 = *(_DWORD **)(a1 + 48);
    _AsyncConnection_ReleaseOperation(v20);
    return;
  }
  if (v10 <= 50)
  {
    if (v10 == -1)
    {
      if (!_LogCategory_Initialize(*(void *)(*(void *)(a1 + 40) + 144), 0x32u)) {
        goto LABEL_16;
      }
      v9 = *(int **)(*(void *)(a1 + 40) + 144);
    }
    LogPrintF((uint64_t)v9, (uint64_t)"OSStatus _AsyncConnection_StartNANDataSession(AsyncConnectionRef, CFTypeRef)_block_invoke", 0x32u, (uint64_t)"NAN data session started: %@\n", a5, a6, a7, a8, *(void *)(a1 + 32));
  }
LABEL_16:
  memset(v22, 0, sizeof(v22));
  int v23 = 0;
  v21 = *(void **)(a1 + 32);
  if (v21)
  {
    [v21 peerAddress];
    v21 = *(void **)(a1 + 32);
  }
  _AsyncConnection_StartConnectNow(*(void *)(a1 + 40), *(void *)(a1 + 48), (uint64_t)v22, [v21 localInterfaceIndex], *(_DWORD *)(*(void *)(a1 + 40) + 16));
  _AsyncConnection_ReleaseOperation(*(_DWORD **)(a1 + 48));
}

@end