@interface AXDetermineRequestingClient
@end

@implementation AXDetermineRequestingClient

void ___AXDetermineRequestingClient_block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  pid_t v0 = getpid();
  memset(v24, 0, sizeof(v24));
  proc_name(v0, v24, 0x100u);
  if (LODWORD(v24[0]) == 7630710)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 3;
    goto LABEL_82;
  }
  BOOL v1 = *(void *)&v24[0] == 0x7265747069726373 && WORD4(v24[0]) == 50;
  if (v1
    || (*(void *)&v24[0] == 0x616D6F7475616975
      ? (BOOL v2 = *(void *)((char *)v24 + 6) == 0x646E6F6974616DLL)
      : (BOOL v2 = 0),
        v2 || (*(void *)&v24[0] == 0x6F626E7532616975 ? (BOOL v3 = DWORD2(v24[0]) == 6579576) : (BOOL v3 = 0), v3)))
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 1;
    goto LABEL_82;
  }
  if (*(void *)&v24[0] == 0x7669747369737361 && *((void *)&v24[0] + 1) == 0x646863756F7465)
  {
    if (_AXSAssistiveTouchScannerEnabled())
    {
      v22 = &OBJC_IVAR___AXElementFetcher__delegate;
      uint64_t v23 = 4;
    }
    else
    {
      if (!_AXSDwellControlEnabled()) {
        return;
      }
      v22 = &OBJC_IVAR___AXElementFetcher__delegate;
      uint64_t v23 = 17;
    }
LABEL_82:
    *((void *)v22 + 290) = v23;
    return;
  }
  if (*(void *)&v24[0] == 0x616E616D74736574 && *(void *)((char *)v24 + 5) == 0x64726567616E61)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 2;
    goto LABEL_82;
  }
  if (!(*(void *)&v24[0] ^ 0x6474696475617861 | BYTE8(v24[0])))
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 12;
    goto LABEL_82;
  }
  if (*(void *)&v24[0] == 0x41646E616D6D6F43
    && *((void *)&v24[0] + 1) == 0x6F72746E6F43646ELL
    && LOWORD(v24[1]) == 108)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 5;
    goto LABEL_82;
  }
  if (*(void *)&v24[0] == 0x6279654B6C6C7546
    && *((void *)&v24[0] + 1) == 0x656363416472616FLL
    && *(void *)((char *)v24 + 11) == 0x73736563634164)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 10;
    goto LABEL_82;
  }
  if (*(void *)&v24[0] == 0x6F42686374656B53 && DWORD2(v24[0]) == 6582881)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 6;
    goto LABEL_82;
  }
  if (LODWORD(v24[0]) == 1768978772 && *(_DWORD *)((char *)v24 + 3) == 7631721)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 8;
    goto LABEL_82;
  }
  if (LODWORD(v24[0]) == 1952675937 && WORD2(v24[0]) == 108)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 13;
    goto LABEL_82;
  }
  if (*(void *)&v24[0] == 0x6F436E6565726353
    && *((void *)&v24[0] + 1) == 0x797469756E69746ELL
    && *(void *)((char *)v24 + 14) == 0x6C6C6568537974)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 16;
    goto LABEL_82;
  }
  BOOL v17 = *(void *)&v24[0] == 0x6C7070612E6D6F63
     && *((void *)&v24[0] + 1) == 0x7373656363612E65
     && *(void *)&v24[1] == 0x2E7974696C696269
     && *((void *)&v24[1] + 1) == 0x69737365636341;
  if (v17
    || (*(void *)&v24[0] == 0x6269737365636341
      ? (BOOL v18 = *((void *)&v24[0] + 1) == 0x5349557974696C69)
      : (BOOL v18 = 0),
        v18 ? (BOOL v19 = *(void *)((char *)v24 + 14) == 0x72657672655349) : (BOOL v19 = 0),
        v19))
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 9999;
    goto LABEL_82;
  }
  if (*(void *)&v24[0] == 0x6E6F436863746157 && *(void *)((char *)v24 + 5) == 0x6C6F72746E6F43)
  {
    v22 = &OBJC_IVAR___AXElementFetcher__delegate;
    uint64_t v23 = 14;
    goto LABEL_82;
  }
  v21 = AXRuntimeLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    ___AXDetermineRequestingClient_block_invoke_cold_1((uint64_t)v24, v21);
  }
}

void ___AXDetermineRequestingClient_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Unknown client: %s", (uint8_t *)&v2, 0xCu);
}

@end