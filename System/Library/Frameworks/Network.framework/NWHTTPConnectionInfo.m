@interface NWHTTPConnectionInfo
@end

@implementation NWHTTPConnectionInfo

void __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v4) {
      uint64_t v6 = *(void *)(v4 + 16);
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3;
    v12[3] = &unk_1E5249D98;
    v8 = (id *)v13;
    v13[0] = *(id *)(a1 + 40);
    v13[1] = a3;
    if (!v6) {
      goto LABEL_15;
    }
LABEL_14:
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(void **)(v6 + 48), v7);
    goto LABEL_15;
  }
  if (v4) {
    v9 = *(void **)(v4 + 8);
  }
  else {
    v9 = 0;
  }
  if (nw_http_connection_metadata_get_is_closed(v9)) {
    int v10 = 57;
  }
  else {
    int v10 = 45;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v6 = *(void *)(v11 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = v14;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2;
  v14[3] = &unk_1E524B020;
  v8 = &v15;
  id v15 = *(id *)(a1 + 40);
  int v16 = v10;
  if (v6) {
    goto LABEL_14;
  }
LABEL_15:
}

void __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:0];
  (*(void (**)(uint64_t, id, double))(v1 + 16))(v1, v2, 0.0);
}

uint64_t __52___NWHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3(uint64_t a1, __n128 a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  unsigned int v4 = dword_1EB267624;
  if (!dword_1EB267624)
  {
    mach_timebase_info((mach_timebase_info_t)&time_base);
    unsigned int v4 = dword_1EB267624;
  }
  a2.n128_f64[0] = (double)(v3 * (unint64_t)time_base / v4) * 0.000000001;
  v5 = *(uint64_t (**)(uint64_t, void, __n128))(v2 + 16);

  return v5(v2, 0, a2);
}

@end