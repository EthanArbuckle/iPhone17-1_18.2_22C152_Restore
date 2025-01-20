uint64_t ggctl_connect(io_object_t *a1)
{
  mach_port_t v2;
  CFDictionaryRef v3;
  io_service_t MatchingService;
  io_object_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t result;
  io_connect_t connect;

  connect = 0;
  v2 = *MEMORY[0x263F0EC88];
  v3 = IOServiceMatching("AppleHDQGasGaugeControl");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
    if (v6)
    {
      v7 = v6;
      v8 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        ggctl_connect_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      connect = 0;
    }
    if (a1) {
      *a1 = v5;
    }
    else {
      IOObjectRelease(v5);
    }
    return connect;
  }
  else
  {
    v15 = logger;
    result = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ggctl_connect_cold_1(v15);
      return 0;
    }
  }
  return result;
}

uint64_t ggctl_disconnect(uint64_t connect)
{
  if (connect) {
    return IOServiceClose(connect);
  }
  return connect;
}

void ggctl_reset(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  NSObject *v3;
  uint8_t buf[8];
  uint64_t input;

  input = a2;
  v2 = IOConnectCallMethod(a1, 0, &input, 1u, 0, 0, 0, 0, 0, 0);
  v3 = logger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_reset_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2406CC000, v3, OS_LOG_TYPE_DEFAULT, "gas gauge: reset", buf, 2u);
    }
    ++gauge_reset_count;
  }
}

uint64_t ggctl_get_hdq_state(mach_port_t a1)
{
  kern_return_t v1;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v1 = IOConnectCallMethod(a1, 1u, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v1 == -536870183) {
    return 4294967294;
  }
  if (v1) {
    return 0xFFFFFFFFLL;
  }
  return output != 0;
}

uint64_t ggctl_get_device_configuration(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t ggctl_enable_currentlog(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t ggctl_map_currentlog(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = MEMORY[0x2455F5110](a1, 0, *MEMORY[0x263EF8960], &v6, &v5, 1);
  uint64_t v4 = v6;
  if (result) {
    uint64_t v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t ggctl_open_device(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1;
  if (!a3) {
    return v3;
  }
  int hdq_state = ggctl_get_hdq_state(a1);
  if (hdq_state < 0)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_open_device_cold_2();
    }
  }
  else
  {
    if (hdq_state)
    {
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0)
        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        ggctl_open_device_cold_4();
      }
      return v3;
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_open_device_cold_3();
    }
    ggctl_reset(v3, 1u);
  }
  uint64_t v5 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    ggctl_open_device_cold_1(v5);
  }
  return 0xFFFFFFFFLL;
}

uint64_t hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183) {
    v2 = -2;
  }
  else {
    v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183) {
    v2 = -2;
  }
  else {
    v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_hdqRead8(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint64_t input = a2;
  int64x2_t v5 = vdupq_n_s64(8uLL);
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(a1, 7u, &input, 3u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_hdqRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  long long v5 = xmmword_2406D8030;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_controlRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_controlWrite16(mach_port_t a1, int a2, int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_readBlock(mach_port_t a1, int a2, int a3, void *outputStruct, unsigned char *a5)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  size_t v7 = 32;
  if (IOConnectCallMethod(a1, 9u, input, 2u, 0, 0, &output, &outputCnt, outputStruct, &v7)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = output;
  }
  return result;
}

uint64_t ggctl_writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_gaugeInterrupts(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  unsigned int v3;
  uint64_t input;

  uint64_t input = a2;
  v2 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v2 == -536870183) {
    uint64_t v3 = -2;
  }
  else {
    uint64_t v3 = -1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

CFDictionaryRef pmps_service()
{
  keys = @"built-in";
  CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&keys, MEMORY[0x263EFFB40], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (result)
  {
    CFDictionaryRef v1 = result;
    v2 = IOServiceMatching("IOPMPowerSource");
    CFDictionarySetValue(v2, @"IOPropertyMatch", v1);
    CFRelease(v1);
    return (CFDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
  }
  return result;
}

uint64_t uart_open_device(uint64_t a1, uint64_t a2, int a3)
{
  return ggctl_open_device(a1, 0, a3);
}

uint64_t hdqRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  long long v5 = xmmword_2406D8030;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t controlOp16(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  if (IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t controlRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t controlWrite16(mach_port_t a1, int a2, int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t gaugeEnableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  uint64_t input = 1;
  CFDictionaryRef v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183) {
    v2 = -2;
  }
  else {
    v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t gaugeDisableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  uint64_t input = 0;
  CFDictionaryRef v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183) {
    v2 = -2;
  }
  else {
    v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t gaugeDisconnect(mach_port_t connection)
{
  int v2 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t input = 23;
    if (IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt)) {
      int v3 = -1;
    }
    else {
      int v3 = output;
    }
    if (!v3) {
      break;
    }
    uint64_t v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      LODWORD(output) = 67109376;
      HIDWORD(output) = v2;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_error_impl(&dword_2406CC000, v4, OS_LOG_TYPE_ERROR, "%d: retry OpenProtector (%d)", (uint8_t *)&output, 0xEu);
    }
    usleep(0xF4240u);
    ++v2;
  }
  while (v2 != 3);
  __int16 v7 = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t input = 32;
  IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt);
  if (controlReadU16(connection, 0, &v7)) {
    return 4294967291;
  }
  if (v3) {
    unsigned int v6 = -36;
  }
  else {
    unsigned int v6 = 0;
  }
  if ((v7 & 0x2000) != 0) {
    return v6;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t controlReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadS8(mach_port_t a1, int a2, unsigned char *a3)
{
  uint64_t result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadU8(mach_port_t a1, int a2, unsigned char *a3)
{
  uint64_t result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t controlReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v4 = a2;
    do
    {
      int v5 = *a1++;
      printf(" %02x", v5);
      --v4;
    }
    while (v4);
  }
  return putchar(10);
}

uint64_t registerName(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x600)
  {
    if (a2 - 1281 > 1 || (*(_DWORD *)a1 | 4) != 0x1E) {
      goto LABEL_8;
    }
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 0xE) {
    return 0;
  }
LABEL_8:
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2
    && (a2 < 0x600 || (uint64_t v2 = *(void *)(a1 + 48)) == 0)
    && (a2 < 0x501 || (uint64_t v2 = *(void *)(a1 + 40)) == 0)
    && (a2 < 0x313 || (uint64_t v2 = *(void *)(a1 + 32)) == 0)
    && (a2 < 0x132 || (uint64_t v2 = *(void *)(a1 + 24)) == 0))
  {
    if (a2 < 0x119) {
      return *(void *)(a1 + 8);
    }
    uint64_t v2 = *(void *)(a1 + 16);
    if (!v2) {
      return *(void *)(a1 + 8);
    }
  }
  return v2;
}

uint64_t readRegister(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  int v4 = *(_DWORD *)(a2 + 4);
  uint64_t result = 0xFFFFFFFFLL;
  if (v4 <= 1)
  {
    if (v4)
    {
      if (v4 == 1)
      {
        int v6 = *(_DWORD *)a2;
        return hdqReadU16(a3, v6, a1);
      }
    }
    else
    {
      int v9 = *(_DWORD *)a2;
      return hdqReadS16(a3, v9, a1);
    }
  }
  else
  {
    switch(v4)
    {
      case 100:
        __int16 v7 = *(uint64_t (**)(_WORD *))(a2 + 64);
        if (v7)
        {
          return v7(a1);
        }
        break;
      case 10:
        int v8 = *(_DWORD *)a2;
        return controlReadU16(a3, v8, a1);
      case 2:
        uint64_t result = ggctl_hdqRead8(a3, *(_DWORD *)a2);
        if ((result & 0x80000000) == 0)
        {
          if (a1) {
            *(unsigned char *)a1 = result;
          }
          return 0;
        }
        break;
    }
  }
  return result;
}

uint64_t getFWVersion(mach_port_t a1, __int16 *a2)
{
  __int16 v3 = getFWVersion_gFWVersion;
  if (getFWVersion_gFWVersion) {
    goto LABEL_2;
  }
  if (!controlReadU16(a1, 2, &getFWVersion_gFWVersion))
  {
    __int16 v3 = getFWVersion_gFWVersion;
    if (getFWVersion_gFWVersion == 256)
    {
      __int16 v3 = 1536;
      getFWVersion_gFWVersion = 1536;
    }
LABEL_2:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double readLifetimeData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned __int16 v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) == 0
    && v8 >= 0x313u
    && !ggctl_readBlock(a3, -1, 4, &outputStruct, 0))
  {
    long long v6 = v10;
    *a1 = outputStruct;
    a1[1] = v6;
    if (!ggctl_readBlock(a3, -1, 6, &outputStruct, 0))
    {
      double result = *(double *)&outputStruct;
      long long v7 = v10;
      a1[2] = outputStruct;
      a1[3] = v7;
    }
  }
  return result;
}

double readRaTableData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned __int16 v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 7, outputStruct, 0))
  {
    double result = *(double *)outputStruct;
    long long v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

double readIMAXAndSOCSmoothData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned __int16 v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 8, outputStruct, 0))
  {
    double result = *(double *)outputStruct;
    long long v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

uint64_t findRaWeightMulitplier(int a1)
{
  uint64_t v1 = 0;
  while ((unsigned __int16)battery_health_metric_config[v1] != a1)
  {
    v1 += 4;
    if (v1 == 68) {
      return 0;
    }
  }
  return *(unsigned int *)&battery_health_metric_config[v1 + 2];
}

float calculateWra(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9)
{
  return (double)a2 * 0.137995
       + (double)a1 * 0.0693069
       + (double)a3 * 0.137376
       + (double)a4 * 0.137376
       + (double)a5 * 0.137376
       + (double)a6 * 0.137376
       + (double)a7 * 0.137376
       + (double)a8 * 0.0872525
       + (double)a9 * 0.0185644;
}

float calculateChemicalWeightedRa(unsigned int a1, float a2)
{
  return (float)((float)a1 * a2) / 1000.0;
}

CFDictionaryRef readShutdownReasonData(mach_port_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = 0;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v12, 0, sizeof(v12));
  if (ggctl_logShutdownReason(a1, (uint64_t)v5, 1u))
  {
    uint64_t v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "readShutdownReasonData";
    __int16 v10 = 1024;
    int v11 = 2502;
    __int16 v3 = "%s:%d cannot read data";
LABEL_4:
    _os_log_impl(&dword_2406CC000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
    return 0;
  }
  if (!*((void *)&v6 + 1))
  {
    uint64_t v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "readShutdownReasonData";
    __int16 v10 = 1024;
    int v11 = 2506;
    __int16 v3 = "%s:%d invalid timestamp";
    goto LABEL_4;
  }
  return parseShutdownReason((__int16 *)v5, (const UInt8 *)v12, a1);
}

uint64_t ggctl_logShutdownReason(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  long long v5;
  long long v7;
  uint64_t input;
  uint64_t v9;
  size_t v10;
  long long outputStruct;
  long long v12;
  long long v13;
  long long v14;
  _OWORD inputStruct[3];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x263EF8340];
  __int16 v10 = 64;
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    uint64_t v13 = 0u;
    v14 = 0u;
    long long outputStruct = 0u;
    int v12 = 0u;
    uint64_t input = a3;
    int v4 = IOConnectCallMethod(a1, 0x11u, &input, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
    if (!v4)
    {
      int v5 = v12;
      *(_OWORD *)a2 = outputStruct;
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = v13;
      *(_DWORD *)(a2 + 48) = v14;
    }
  }
  else
  {
    int v7 = *(_OWORD *)(a2 + 16);
    inputStruct[0] = *(_OWORD *)a2;
    inputStruct[1] = v7;
    inputStruct[2] = *(_OWORD *)(a2 + 32);
    v16 = *(_DWORD *)(a2 + 48);
    uint64_t v9 = a3;
    int v4 = IOConnectCallMethod(a1, 0x11u, &v9, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
  }
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

CFDictionaryRef parseShutdownReason(__int16 *a1, const UInt8 *a2, mach_port_t a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v39 = 0;
  keys[0] = @"ShutDownTimestamp";
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t valuePtr = *((void *)a1 + 5);
  values[0] = CFNumberCreate(v6, kCFNumberLongType, &valuePtr);
  keys[1] = @"ShutDownUISoc";
  int v34 = *((_DWORD *)a1 + 12);
  values[1] = CFNumberCreate(v6, kCFNumberFloatType, &v34);
  keys[2] = @"ShutDownTemperature";
  int v33 = *a1;
  values[2] = CFNumberCreate(v6, kCFNumberIntType, &v33);
  keys[3] = @"ShutDownPresentDOD";
  int v32 = a1[1];
  values[3] = CFNumberCreate(v6, kCFNumberIntType, &v32);
  keys[4] = @"ShutDownMaxRa08";
  int v31 = a1[2];
  values[4] = CFNumberCreate(v6, kCFNumberIntType, &v31);
  keys[5] = @"ShutDownNominalChargeCapacity";
  int v30 = (unsigned __int16)a1[3];
  values[5] = CFNumberCreate(v6, kCFNumberIntType, &v30);
  keys[6] = @"ShutDownPrevNominalChargeCapacity";
  int v29 = (unsigned __int16)a1[4];
  values[6] = CFNumberCreate(v6, kCFNumberIntType, &v29);
  keys[7] = @"ShutDownFullChargeCapacity";
  int v28 = a1[5];
  values[7] = CFNumberCreate(v6, kCFNumberIntType, &v28);
  keys[8] = @"ShutDownPrevFullChargeCapacity";
  int v27 = a1[6];
  values[8] = CFNumberCreate(v6, kCFNumberIntType, &v27);
  keys[9] = @"ShutDownRemainingCapacity";
  int v26 = a1[7];
  values[9] = CFNumberCreate(v6, kCFNumberIntType, &v26);
  keys[10] = @"ShutDownPrevRemainingCapacity";
  int v25 = a1[8];
  values[10] = CFNumberCreate(v6, kCFNumberIntType, &v25);
  keys[11] = @"ShutDownCycleCount";
  int v24 = (unsigned __int16)a1[9];
  values[11] = CFNumberCreate(v6, kCFNumberIntType, &v24);
  keys[12] = @"ShutDownMaxDischargeCurrent";
  int v23 = a1[10];
  values[12] = CFNumberCreate(v6, kCFNumberIntType, &v23);
  keys[13] = @"ShutDownTimeAbove95";
  int v22 = *((unsigned __int8 *)a1 + 22);
  values[13] = CFNumberCreate(v6, kCFNumberIntType, &v22);
  keys[14] = @"ShutDownVoltage";
  int v21 = *(__int16 *)((char *)a1 + 23);
  values[14] = CFNumberCreate(v6, kCFNumberIntType, &v21);
  keys[15] = @"ShutDownPrevVoltage";
  int v20 = *(__int16 *)((char *)a1 + 25);
  values[15] = CFNumberCreate(v6, kCFNumberIntType, &v20);
  keys[16] = @"ShutDownAverageCurrent";
  int v19 = *(__int16 *)((char *)a1 + 27);
  values[16] = CFNumberCreate(v6, kCFNumberIntType, &v19);
  keys[17] = @"ShutDownPrevAverageCurrent";
  int v18 = *(__int16 *)((char *)a1 + 29);
  values[17] = CFNumberCreate(v6, kCFNumberIntType, &v18);
  keys[18] = @"ShutDownCycleCountLastQmax";
  int v17 = *((unsigned __int8 *)a1 + 31);
  values[18] = CFNumberCreate(v6, kCFNumberIntType, &v17);
  keys[19] = @"ShutDownResScale";
  int v16 = (unsigned __int16)a1[16];
  values[19] = CFNumberCreate(v6, kCFNumberIntType, &v16);
  keys[20] = @"ShutDownQstart";
  int v15 = a1[17];
  values[20] = CFNumberCreate(v6, kCFNumberIntType, &v15);
  keys[21] = @"ShutDownPassedCharge";
  int v14 = a1[18];
  values[21] = CFNumberCreate(v6, kCFNumberIntType, &v14);
  keys[22] = @"ShutDownDOD0";
  int v13 = (unsigned __int16)a1[19];
  *(void *)&long long v41 = CFNumberCreate(v6, kCFNumberIntType, &v13);
  *(void *)&long long v37 = @"Raw";
  *((void *)&v41 + 1) = CFDataCreate(v6, (const UInt8 *)a1, 52);
  uint64_t v46 = 0;
  *(_OWORD *)bytes = 0u;
  long long v45 = 0u;
  ggctl_logShutdownDLog(a3, (uint64_t)bytes, 1u);
  *((void *)&v37 + 1) = @"ShutDownDLog";
  *(void *)&long long v42 = CFDataCreate(v6, bytes, 40);
  *(void *)&long long v38 = @"timeSinceAwake";
  uint64_t v12 = *(void *)a2;
  *((void *)&v42 + 1) = CFNumberCreate(v6, kCFNumberLongType, &v12);
  *((void *)&v38 + 1) = @"ShutDownRaTableRaw";
  *(void *)&long long v43 = CFDataCreate(v6, a2 + 8, 32);
  v39 = @"ShutDownRSS";
  uint64_t v11 = *((unsigned __int16 *)a2 + 20);
  *((void *)&v43 + 1) = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CFDictionaryRef v7 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 28, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v8 = 27;
  do
  {
    CFRelease(values[v8]);
    unint64_t v9 = v8-- + 1;
  }
  while (v9 > 1);
  return v7;
}

void writeBatteryDiagnosticData(uint64_t a1, int a2)
{
  v7[44] = *MEMORY[0x263EF8340];
  bzero(v5, 0x258uLL);
  size_t outputStructCnt = 352;
  IOConnectCallStructMethod(a1, 2u, 0, 0, v7, &outputStructCnt);
  __int16 v6 = 4000;
  logBatteryDiagnosticData((uint64_t)v5, a1, a2);
}

void logBatteryDiagnosticData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v42 = 0;
  CFDictionaryRef v6 = IOServiceMatching("IOPMPowerSource");
  service = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v6);
  if (service)
  {
    if ((getSInt32ForKey(@"CurrentCapacity", (_DWORD *)&v14 + 1) & 0x80000000) != 0)
    {
      IOObjectRelease(service);
    }
    else
    {
      int SInt32ForKey = getSInt32ForKey(@"MaxCapacity", &v14);
      IOObjectRelease(service);
      if ((SInt32ForKey & 0x80000000) == 0)
      {
        float v8 = (float)(100 * HIDWORD(v14)) / (float)(int)v14;
        setUPOData(@"IOPMUBootUPOState", v8 > 10.0);
        if (*(_DWORD *)(a1 + 596) && v8 > 10.0 && *(__int16 *)(a1 + 48) >= 2742) {
          setUPOData(@"IOPMUBootUPOCounter", 1);
        }
        int v9 = (__int16)(*(unsigned __int8 *)(a1 + 104) << 8) | *(unsigned __int8 *)(a1 + 105);
        int v10 = (__int16)(*(unsigned __int8 *)(a1 + 126) << 8) | *(unsigned __int8 *)(a1 + 127);
        int v11 = *(unsigned __int8 *)(a1 + 142);
        int v12 = *(unsigned __int8 *)(a1 + 139);
        if (a3)
        {
          time_t v38 = time(0);
          float v39 = v8;
          *(_WORD *)__str = *(_WORD *)(a1 + 48);
          __int16 v21 = *(_WORD *)(a1 + 58);
          __int16 v22 = v10;
          __int16 v23 = *(_WORD *)(a1 + 46);
          __int16 v24 = *(_WORD *)(a1 + 228);
          __int16 v25 = *(_WORD *)(a1 + 44);
          __int16 v26 = *(_WORD *)(a1 + 226);
          __int16 v27 = *(_WORD *)(a1 + 52);
          __int16 v28 = *(_WORD *)(a1 + 230);
          __int16 v29 = *(_WORD *)(a1 + 84);
          __int16 v30 = v9;
          char v31 = v11;
          __int16 v32 = *(_WORD *)(a1 + 42);
          __int16 v33 = *(_WORD *)(a1 + 222);
          __int16 v34 = *(_WORD *)(a1 + 50);
          __int16 v35 = *(_WORD *)(a1 + 224);
          char v36 = v12;
          uint64_t v37 = *(void *)(a1 + 60);
          uint64_t v19 = 0;
          *(void *)int v17 = v38 - *(void *)(a1 + 232);
          *(_OWORD *)&v17[8] = *(_OWORD *)(a1 + 158);
          long long v18 = *(_OWORD *)(a1 + 174);
          LOWORD(v19) = bswap32(*(unsigned __int16 *)(a1 + 191)) >> 16;
          ggctl_logShutdownReason(a2, (uint64_t)__str, 0);
          ggctl_logShutdownDLog(a2, (uint64_t)&v40, 0);
          ggctl_logShutdownReason2(a2, v17, 0);
        }
        *(_OWORD *)int v17 = *(_OWORD *)a1;
        *(_WORD *)&v17[16] = *(_WORD *)(a1 + 16);
        snprintf(__str, 0x200uLL, "%s,%5.2f,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d"
          ",%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d",
          v17,
          v8,
          *(__int16 *)(a1 + 48),
          *(__int16 *)(a1 + 58),
          v10,
          *(unsigned __int16 *)(a1 + 46),
          *(unsigned __int16 *)(a1 + 228),
          *(__int16 *)(a1 + 44),
          *(__int16 *)(a1 + 226),
          *(__int16 *)(a1 + 52),
          *(__int16 *)(a1 + 230),
          *(unsigned __int16 *)(a1 + 84),
          v9,
          v11,
          *(__int16 *)(a1 + 42),
          *(__int16 *)(a1 + 222),
          *(__int16 *)(a1 + 50),
          *(__int16 *)(a1 + 224),
          v12,
          *(unsigned __int16 *)(a1 + 60),
          __rev16(*(unsigned __int16 *)(a1 + 191)),
          __rev16(*(unsigned __int16 *)(a1 + 158)),
          __rev16(*(unsigned __int16 *)(a1 + 160)),
          __rev16(*(unsigned __int16 *)(a1 + 162)),
          __rev16(*(unsigned __int16 *)(a1 + 164)),
          __rev16(*(unsigned __int16 *)(a1 + 166)),
          __rev16(*(unsigned __int16 *)(a1 + 168)),
          __rev16(*(unsigned __int16 *)(a1 + 170)),
          __rev16(*(unsigned __int16 *)(a1 + 172)),
          __rev16(*(unsigned __int16 *)(a1 + 174)),
          __rev16(*(unsigned __int16 *)(a1 + 176)),
          __rev16(*(unsigned __int16 *)(a1 + 178)),
          __rev16(*(unsigned __int16 *)(a1 + 180)),
          __rev16(*(unsigned __int16 *)(a1 + 182)),
          __rev16(*(unsigned __int16 *)(a1 + 184)),
          __rev16(*(unsigned __int16 *)(a1 + 186)),
          (unsigned __int16)v40,
          WORD1(v40),
          WORD2(v40),
          WORD3(v40),
          WORD4(v40),
          WORD5(v40),
          WORD6(v40),
          HIWORD(v40),
          (unsigned __int16)v41,
          WORD1(v41),
          WORD2(v41),
          WORD3(v41),
          WORD4(v41),
          WORD5(v41),
          WORD6(v41),
          HIWORD(v41),
          (unsigned __int16)v42,
          WORD1(v42),
          WORD2(v42),
          HIWORD(v42));
        CFAbsoluteTimeGetCurrent();
        logLineForAppleCare();
        int v13 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          int v16 = __str;
          _os_log_impl(&dword_2406CC000, v13, OS_LOG_TYPE_DEFAULT, "Battery Diagnostic Data:: %s", buf, 0xCu);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    logBatteryDiagnosticData_cold_1();
  }
}

BOOL okToLoad()
{
  memset(&v1, 0, sizeof(v1));
  return stat("/dev/cu.gas-gauge", &v1) == 0;
}

uint64_t startUpdateThread(unsigned int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  if (stat("/dev/cu.gas-gauge", &v7)) {
    return 0xFFFFFFFFLL;
  }
  pthread_t v6 = 0;
  memset(&v7, 0, 64);
  pthread_attr_init((pthread_attr_t *)&v7);
  pthread_attr_setdetachstate((pthread_attr_t *)&v7, 2);
  logger = (uint64_t)os_log_create("com.apple.AppleHDQGasGauge", "battery");
  if (!logger) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = pthread_create(&v6, (const pthread_attr_t *)&v7, (void *(__cdecl *)(void *))updateThread, (void *)a1);
  if (v2)
  {
    int v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl(&dword_2406CC000, v4, OS_LOG_TYPE_ERROR, "pthread_create", v5, 2u);
      int v4 = logger;
    }
    os_release(v4);
  }
  else
  {
    pthread_attr_destroy((pthread_attr_t *)&v7);
  }
  return v2;
}

uint64_t updateThread(uint64_t a1)
{
  kern_return_t v66;
  int v67;
  NSObject *v68;
  int v69;
  int v70;
  NSObject *v71;
  CFAbsoluteTime v72;
  BOOL v73;
  BOOL v74;
  char v75;
  double v76;
  double v77;
  NSObject *v78;
  NSObject *v79;
  int v80;
  int v81;
  int v82;
  NSObject *v83;
  int v84;
  NSObject *v85;
  int v86;
  CFTypeRef CFProperty;
  CFTypeRef v88;
  CFTypeID v89;
  int v90;
  unsigned __int8 v91;
  NSObject *v92;
  int v93;
  int hdq_state;
  CFPropertyListRef v95;
  BOOL v96;
  mach_port_t v97;
  int v98;
  unint64_t v99;
  int v100;
  NSObject *v101;
  unsigned int v102;
  int v103;
  int v104;
  NSObject *v105;
  NSObject *v106;
  int v107;
  BOOL v108;
  uint64_t v109;
  int v110;
  int v111;
  CFNumberRef v112;
  CFNumberRef v113;
  int v114;
  BOOL v115;
  NSObject *v116;
  int v117;
  int Block;
  NSObject *v119;
  __darwin_time_t v120;
  unint64_t v121;
  NSObject *v122;
  __darwin_time_t v123;
  int v124;
  NSObject *v125;
  __darwin_time_t v126;
  unint64_t v127;
  NSObject *v128;
  NSObject *v129;
  __darwin_time_t v130;
  char v131;
  NSObject *v132;
  unint64_t v133;
  BOOL v134;
  BOOL v135;
  unint64_t v136;
  BOOL v137;
  NSObject *v138;
  int v139;
  int v140;
  NSObject *v141;
  NSObject *v142;
  int v143;
  NSObject *v144;
  uint64_t v145;
  int BatteryData;
  CFDictionaryRef ChargerData;
  BOOL v148;
  int v149;
  int v150;
  BOOL v151;
  int v152;
  int v153;
  __int16 v154;
  NSObject *v155;
  BOOL v156;
  __int16 v157;
  int v158;
  unsigned int v159;
  NSObject *v160;
  NSObject *v161;
  BOOL v162;
  int v163;
  BOOL v164;
  NSObject *v165;
  NSObject *v166;
  BOOL v167;
  CFDictionaryRef v168;
  NSObject *v169;
  CFAllocatorRef v170;
  int v171;
  __CFString *v172;
  int v173;
  int v174;
  NSObject *v175;
  BOOL v176;
  unsigned int v177;
  int v179;
  CFNumberRef v180;
  uint64_t v181;
  uint64_t v182;
  int U16;
  BOOL v184;
  NSObject *v185;
  unint64_t v186;
  NSObject *v187;
  CFNumberRef v188;
  uint64_t v189;
  uint64_t v190;
  CFNumberRef v191;
  uint64_t v192;
  CFNumberRef v193;
  uint64_t v194;
  CFNumberRef v195;
  uint64_t v196;
  CFNumberRef v197;
  uint64_t v198;
  unsigned int v199;
  CFNumberRef v200;
  uint64_t v201;
  const void *v202;
  uint64_t v203;
  CFNumberRef v204;
  uint64_t v205;
  char *v206;
  CFNumberRef v207;
  uint64_t v208;
  CFNumberRef v209;
  uint64_t v210;
  CFNumberRef v211;
  uint64_t v212;
  CFNumberRef v213;
  uint64_t v214;
  CFDictionaryRef v215;
  CFDictionaryRef v216;
  CFDictionaryRef v217;
  NSObject *v218;
  CFDictionaryRef v219;
  CFDictionaryRef v220;
  NSObject *v221;
  CFDictionaryRef v222;
  NSObject *v223;
  int S16;
  int v226;
  NSObject *v227;
  time_t v228;
  uint64_t v229;
  NSObject *v230;
  const char *v231;
  char v232;
  time_t v233;
  char v234;
  uint64_t v235;
  BOOL v236;
  NSObject *v237;
  const char *v238;
  int v239;
  int v240;
  NSObject *v241;
  __int16 v242;
  BOOL v243;
  NSObject *v244;
  int v245;
  int v246;
  int v247;
  NSObject *v248;
  char v249;
  NSObject *v250;
  int v251;
  NSObject *v252;
  int v253;
  int v254;
  int v255;
  NSObject *v256;
  NSObject *v257;
  uint64_t v258;
  BOOL v259;
  NSObject *v260;
  const char *v261;
  uint32_t v262;
  CFAbsoluteTime v263;
  NSObject *v264;
  NSObject *v265;
  int v266;
  BOOL v267;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  int v272;
  int v273;
  BOOL v274;
  int v275;
  int v276;
  int v277;
  uint64_t v278;
  os_log_t v279;
  BOOL v280;
  NSObject *v281;
  time_t v282;
  BOOL v283;
  char v284;
  BOOL v285;
  int v286;
  uint64_t v287;
  BOOL v288;
  int v289;
  int v290;
  int v291;
  uint64_t v292;
  int v293;
  CFPropertyListRef v294;
  int v295;
  BOOL *v296;
  unsigned int v297;
  BOOL v298;
  BOOL v299;
  CFStringRef v300;
  CFStringRef v301;
  CFStringRef mode;
  io_connect_t v303;
  BOOL v304;
  BOOL v305;
  CFAllocatorRef allocator;
  io_connect_t kernelPort;
  CFTypeRef v308;
  BOOL v309;
  int v310;
  char v311;
  char v312;
  char v313[7];
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  BOOL v330;
  int v331;
  char v332;
  char v333[15];
  char v334;
  char v335[15];
  char v336;
  char v337[15];
  size_t v338;
  int valuePtr;
  uint64_t refCon;
  intptr_t notificationID;
  io_object_t notifier;
  IONotificationPortRef thePortRef;
  unsigned __int16 v344;
  int v345;
  io_object_t notification[2];
  uint8_t v347[4];
  int v348[3];
  uint8_t v349[4];
  const char *v350;
  __int16 v351;
  int v352;
  void *keys[2];
  long long v354;
  long long v355;
  unsigned char input[52];
  double v357;
  int v358;
  void *v359[2];
  long long v360;
  long long v361;
  long long v362;
  long long v363;
  long long v364;
  long long v365;
  long long v366;
  long long v367;
  long long v368;
  long long v369;
  long long v370;
  long long v371;
  long long v372;
  long long v373;
  long long v374;
  long long v375;
  long long v376;
  long long v377;
  long long v378;
  long long v379;
  long long v380;
  uint8_t buf[32];
  long long v382;
  long long v383;
  long long v384;
  long long v385;
  long long v386;
  long long v387;
  long long v388;
  long long v389;
  long long v390;
  long long v391;
  long long v392;
  long long v393;
  long long v394;
  long long v395;
  long long v396;
  long long v397;
  long long v398;
  long long v399;
  long long v400;
  long long v401;
  char v402[64];
  uint64_t v403;

  v403 = *MEMORY[0x263EF8340];
  *(void *)notification = 0;
  v345 = 0;
  v344 = 0;
  thePortRef = 0;
  notifier = 0;
  notificationID = 0;
  refCon = 0;
  pthread_setname_np("GasGauge-updateThread");
  unint64_t v2 = 0x26AFC8000uLL;
  gRestrictLogMessagesCounter = 0;
  unint64_t v3 = 0x268C8E000uLL;
  int v4 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2406CC000, v4, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread start", buf, 2u);
  }
  unsigned int v5 = pmps_service();
  if (v5)
  {
    io_service_t v6 = v5;
    mach_port_t v7 = *MEMORY[0x263F0EC88];
    uint64_t v8 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    if (IOServiceAddInterestNotification(v8, v6, "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        updateThread_cold_10();
      }
      return 0;
    }
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v8);
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE88];
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    kernelPort = IORegisterForSystemPower(&refCon, &thePortRef, (IOServiceInterestCallback)iokit_callback, &notifier);
    if (kernelPort && thePortRef)
    {
      int v12 = CFRunLoopGetCurrent();
      int v13 = IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopAddSource(v12, v13, v11);
      uint64_t v14 = ggctl_connect(&notification[1]);
      if (!v14) {
        return 0;
      }
      io_connect_t v15 = v14;
      *(void *)buf = 0;
      v359[0] = 0;
      mach_error_t v16 = MEMORY[0x2455F5110](v14, 0, *MEMORY[0x263EF8960], buf, v359, 1);
      if (v16) {
        int v17 = 0;
      }
      else {
        int v17 = *(BOOL **)buf;
      }
      if (v16)
      {
        mach_error_t v18 = v16;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
          updateThread_cold_9(v18);
        }
        IOServiceClose(v15);
        return 0;
      }
      v292 = *(void *)buf;
      v296 = v17;
      mode = v11;
      *(void *)buf = 352;
      IOConnectCallStructMethod(v15, 2u, 0, 0, &dword_268C8E9D8, (size_t *)buf);
      byte_268C8E924 = dword_268C8EA7C != 0;
      v344 = word_268C8EA66;
      v289 = dword_268C8EB30;
      uint64_t valuePtr = dword_268C8EA6C;
      v300 = (const __CFString *)*MEMORY[0x263EFFE68];
      v301 = (const __CFString *)*MEMORY[0x263EFFE70];
      CFNumberRef v20 = (const __CFNumber *)CFPreferencesCopyValue(@"UpdateSampleConfig", @"com.apple.gasgauge", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
      if (v20)
      {
        CFNumberRef v21 = v20;
        CFTypeID v22 = CFGetTypeID(v20);
        if (v22 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
          __int16 v23 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = valuePtr;
            _os_log_impl(&dword_2406CC000, v23, OS_LOG_TYPE_DEFAULT, "changed updateSampleConfig=%#x", buf, 8u);
          }
        }
        CFRelease(v21);
      }
      v297 = valuePtr;
      CFNumberRef v24 = (const __CFNumber *)CFPreferencesCopyValue(@"CriticalBattery", @"com.apple.gasgauge", v301, v300);
      if (v24)
      {
        CFNumberRef v25 = v24;
        CFTypeID v26 = CFGetTypeID(v24);
        if (v26 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v25, kCFNumberSInt32Type, &word_268C8EA64);
          CFRelease(v25);
        }
        else
        {
          int Value = CFBooleanGetValue(v25);
          CFRelease(v25);
          if (!Value)
          {
            v265 = logger;
            v295 = 0;
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2406CC000, v265, OS_LOG_TYPE_DEFAULT, "Critical battery shutdown disabled", buf, 2u);
              v295 = 0;
            }
            goto LABEL_30;
          }
        }
      }
      v295 = 1;
LABEL_30:
      CFBooleanRef v28 = (const __CFBoolean *)CFPreferencesCopyValue(@"UserMode", @"com.apple.gasgauge", v301, v300);
      if (v28)
      {
        CFBooleanRef v29 = v28;
        CFTypeID v30 = CFGetTypeID(v28);
        v298 = v30 == CFBooleanGetTypeID() && CFBooleanGetValue(v29) != 0;
        CFRelease(v29);
        char v31 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v298;
          _os_log_impl(&dword_2406CC000, v31, OS_LOG_TYPE_DEFAULT, "gas gauge: userModeEnabled=%d", buf, 8u);
        }
      }
      else
      {
        v298 = 0;
      }
      CFNumberRef v32 = (const __CFNumber *)CFPreferencesCopyValue(@"CriticalFlagDelay", @"com.apple.gasgauge", v301, v300);
      if (v32)
      {
        CFNumberRef v33 = v32;
        CFTypeID v34 = CFGetTypeID(v32);
        if (v34 == CFNumberGetTypeID()) {
          CFNumberGetValue(v33, kCFNumberSInt32Type, &v344);
        }
        CFRelease(v33);
        __int16 v35 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v344;
          _os_log_impl(&dword_2406CC000, v35, OS_LOG_TYPE_DEFAULT, "gas gauge: critical flag delay %d", buf, 8u);
        }
      }
      CFBooleanRef v36 = (const __CFBoolean *)CFPreferencesCopyValue(@"DebugPolling", @"com.apple.gasgauge", v301, v300);
      if (v36)
      {
        CFBooleanRef v37 = v36;
        CFTypeID v38 = CFGetTypeID(v36);
        if (v38 == CFBooleanGetTypeID()) {
          debug_polling = CFBooleanGetValue(v37) != 0;
        }
        CFRelease(v37);
        float v39 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = debug_polling;
          _os_log_impl(&dword_2406CC000, v39, OS_LOG_TYPE_DEFAULT, "gas gauge: debug_polling=%d", buf, 8u);
        }
      }
      CFNumberRef v40 = (const __CFNumber *)CFPreferencesCopyValue(@"RestricLogCounter", @"com.apple.gasgauge", v301, v300);
      if (v40)
      {
        CFNumberRef v41 = v40;
        CFTypeID v42 = CFGetTypeID(v40);
        if (v42 == CFNumberGetTypeID()) {
          CFNumberGetValue(v41, kCFNumberSInt32Type, &gRestrictLogCounter);
        }
        CFRelease(v41);
        uint64_t v43 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = gRestrictLogCounter;
          _os_log_impl(&dword_2406CC000, v43, OS_LOG_TYPE_DEFAULT, "gas gauge: log counter %d", buf, 8u);
        }
      }
      v310 = dword_268C8EA70;
      if (dword_268C8EA70)
      {
        v44 = IONotificationPortCreate(v7);
        uint64_t v45 = IOServiceAddInterestNotification(v44, notification[1], "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification);
        uint64_t v46 = logger;
        if (v45)
        {
          uint64_t v47 = v45;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
            updateThread_cold_8(v47, v46, v48, v49, v50, v51, v52, v53);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2406CC000, v46, OS_LOG_TYPE_DEFAULT, "gasgauge: listening for battery interrupts", buf, 2u);
          }
          v54 = CFRunLoopGetCurrent();
          v55 = IONotificationPortGetRunLoopSource(v44);
          CFRunLoopAddSource(v54, v55, v11);
        }
      }
      v345 = 0;
      getUPOData(@"IOPMUBootUPOState", &v345);
      v304 = v345 != 0;
      getUPOData(@"IOPMUBootBatteryHealthMetric", &dword_268C8E9D0);
      v338 = 64;
      if (sysctlbyname("hw.model", v402, &v338, 0, 0) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        updateThread_cold_7();
      }
      v303 = v15;
      __darwin_time_t v56 = UpSeconds();
      v57 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(void *)&uint8_t buf[4] = v56;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v295;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (unsigned __int16)word_268C8EA64;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = valuePtr;
        *(_WORD *)&buf[30] = 1024;
        LODWORD(v382) = byte_268C8E924;
        WORD2(v382) = 1024;
        *(_DWORD *)((char *)&v382 + 6) = v344;
        WORD5(v382) = 1024;
        HIDWORD(v382) = dword_268C8EA68;
        LOWORD(v383) = 1024;
        *(_DWORD *)((char *)&v383 + 2) = v345;
        _os_log_impl(&dword_2406CC000, v57, OS_LOG_TYPE_DEFAULT, "gasgauge: %llu updateThread critical(%d, 0x%x), uscfg=0x%x, dyn=%d cfd=%d cfd-voltage=%d, upos=%x", buf, 0x36u);
      }
      v287 = a1;
      v283 = a1 != 0;
      LOBYTE(v58) = 0;
      v288 = 0;
      v309 = 0;
      v305 = 0;
      v299 = 0;
      char v59 = 0;
      v311 = 0;
      v284 = 0;
      v282 = 0;
      int v60 = 0;
      v293 = 0;
      int v61 = 0;
      qword_268C8E9C8 = time(0);
      v285 = (dword_268C8EA80 | dword_268C8EAC4) != 0;
      v291 = (v297 >> 2) & 1;
      v290 = (v297 >> 3) & 1;
      allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      v308 = (CFTypeRef)*MEMORY[0x263EFFB40];
      v294 = (CFPropertyListRef)*MEMORY[0x263EFFB38];
      double v62 = 0.0;
      double v63 = 0.0;
      LOBYTE(v286) = 1;
      int v64 = -1;
      mach_port_t v65 = -1;
      while (1)
      {
        v401 = 0u;
        v400 = 0u;
        v399 = 0u;
        v398 = 0u;
        v397 = 0u;
        v396 = 0u;
        v395 = 0u;
        v394 = 0u;
        v393 = 0u;
        v392 = 0u;
        v391 = 0u;
        v390 = 0u;
        v389 = 0u;
        v388 = 0u;
        v387 = 0u;
        v386 = 0u;
        v385 = 0u;
        v384 = 0u;
        v383 = 0u;
        v382 = 0u;
        memset(buf, 0, sizeof(buf));
        v380 = 0u;
        v379 = 0u;
        v378 = 0u;
        v377 = 0u;
        v376 = 0u;
        v375 = 0u;
        v374 = 0u;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        v368 = 0u;
        v369 = 0u;
        v366 = 0u;
        v367 = 0u;
        v364 = 0u;
        v365 = 0u;
        v362 = 0u;
        v363 = 0u;
        v360 = 0u;
        v361 = 0u;
        *(_OWORD *)v359 = 0u;
        if (v310 && v65 != -1)
        {
          *(void *)uint64_t input = 1;
          v66 = IOConnectCallScalarMethod(v65, 0x10u, (const uint64_t *)input, 1u, 0, 0);
          v67 = v66 == -536870183 ? -2 : -1;
          if (v66)
          {
            v68 = *(NSObject **)(v3 + 1688);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t input = 67109120;
              *(_DWORD *)&input[4] = v67;
              _os_log_impl(&dword_2406CC000, v68, OS_LOG_TYPE_DEFAULT, "cannot enable gauge interrupts (%d)", input, 8u);
            }
          }
        }
        LODWORD(refCon) = 0;
        if (v60)
        {
          v69 = *(_DWORD *)(v2 + 680);
          if (v69)
          {
            v70 = v69 - 1;
          }
          else
          {
            if (v62 == 0.0) {
              goto LABEL_81;
            }
            v71 = *(NSObject **)(v3 + 1688);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              v72 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)uint64_t input = 67109632;
              *(_DWORD *)&input[4] = v60;
              *(_WORD *)&input[8] = 2048;
              *(double *)&input[10] = v72 - v62;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = gRestrictLogCounter;
              _os_log_impl(&dword_2406CC000, v71, OS_LOG_TYPE_DEFAULT, "failure last_update_failed_counter=%d last_success at %g, supressing %d subsequent errors", input, 0x18u);
            }
            v70 = gRestrictLogCounter;
          }
          *(_DWORD *)(v2 + 680) = v70;
        }
LABEL_81:
        v73 = v64 != -1;
        v74 = v64 < 50;
        v75 = v73 && v74;
        if (v73 && v74) {
          v76 = 5.0;
        }
        else {
          v76 = 20.0;
        }
        if (v59)
        {
LABEL_526:
          IOObjectRelease(v6);
          MEMORY[0x2455F5120](v303, 0, *MEMORY[0x263EF8960], v296);
          IOServiceClose(v303);
          *(_DWORD *)(v2 + 680) = 0;
          v264 = *(NSObject **)(v3 + 1688);
          if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2406CC000, v264, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread terminated", buf, 2u);
          }
          return 0;
        }
        if (!(v61 | v60)) {
          goto LABEL_122;
        }
        v77 = CFAbsoluteTimeGetCurrent();
        if (debug_polling && (v78 = *(NSObject **)(v3 + 1688), os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)))
        {
          *(_DWORD *)uint64_t input = 136316418;
          *(void *)&input[4] = "updateThread";
          *(_WORD *)&input[12] = 1024;
          *(_DWORD *)&input[14] = 2802;
          *(_WORD *)&input[18] = 1024;
          *(_DWORD *)&input[20] = v61;
          *(_WORD *)&input[24] = 1024;
          *(_DWORD *)&input[26] = v58 & 1;
          *(_WORD *)&input[30] = 2048;
          *(double *)&input[32] = v77;
          *(_WORD *)&input[40] = 2048;
          *(double *)&input[42] = v63;
          _os_log_debug_impl(&dword_2406CC000, v78, OS_LOG_TYPE_DEBUG, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f *** ", input, 0x32u);
          if ((v58 & 1) == 0)
          {
LABEL_92:
            double v63 = v76 + v77;
            goto LABEL_93;
          }
        }
        else if ((v58 & 1) == 0)
        {
          goto LABEL_92;
        }
        v76 = 0.0;
        if (v77 < v63) {
          v76 = v63 - v77;
        }
LABEL_93:
        if (debug_polling)
        {
          v79 = *(NSObject **)(v3 + 1688);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t input = 136316674;
            *(void *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2860;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v61;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = v58 & 1;
            *(_WORD *)&input[30] = 2048;
            *(double *)&input[32] = v77;
            *(_WORD *)&input[40] = 2048;
            *(double *)&input[42] = v63;
            *(_WORD *)&input[50] = 2048;
            v357 = v76;
            _os_log_error_impl(&dword_2406CC000, v79, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f update_interval=%f *** ", input, 0x3Cu);
          }
        }
        if (v76 == 0.0)
        {
          int v58 = 0;
          LODWORD(refCon) = 0;
LABEL_121:
          LOBYTE(v58) = v58 != 0;
          goto LABEL_122;
        }
        if (CFRunLoopRunInMode(mode, v76, 1u) != kCFRunLoopRunHandledSource)
        {
          int v58 = 0;
          goto LABEL_121;
        }
        int v58 = 0;
        v80 = refCon;
        v81 = 1;
        if ((int)refCon > -536870145)
        {
          if (refCon == -536870144 || refCon == -536723200) {
            goto LABEL_113;
          }
          v82 = -469794560;
        }
        else
        {
          if ((refCon + 536870288) <= 0x20
            && ((1 << (refCon - 112)) & 0x100010001) != 0)
          {
            goto LABEL_113;
          }
          v82 = -536870320;
        }
        if (refCon != v82)
        {
          v81 = debug_polling;
          if (debug_polling)
          {
            v83 = *(NSObject **)(v3 + 1688);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t input = 136315906;
              *(void *)&input[4] = "updateThread";
              *(_WORD *)&input[12] = 1024;
              *(_DWORD *)&input[14] = 2879;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = v61;
              *(_WORD *)&input[24] = 1024;
              *(_DWORD *)&input[26] = v80;
              _os_log_error_impl(&dword_2406CC000, v83, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x  (ign) *** ", input, 0x1Eu);
            }
            v81 = 0;
            int v58 = 1;
          }
          else
          {
            int v58 = 1;
          }
        }
LABEL_113:
        if (v80 > -536870145)
        {
          if (v80 == -536870144 || v80 == -469794560) {
            goto LABEL_121;
          }
          v84 = -536723200;
        }
        else
        {
          if ((v80 + 536870288) <= 0x20 && ((1 << (v80 - 112)) & 0x100010001) != 0) {
            goto LABEL_121;
          }
          v84 = -536870320;
        }
        if (v80 == v84) {
          goto LABEL_121;
        }
        if (v81)
        {
LABEL_122:
          if (debug_polling && (v85 = *(NSObject **)(v3 + 1688), os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)uint64_t input = 136316162;
            *(void *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2897;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v61;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = refCon;
            *(_WORD *)&input[30] = 1024;
            *(_DWORD *)&input[32] = v311 & 1;
            _os_log_error_impl(&dword_2406CC000, v85, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x system_sleep=%d *** ", input, 0x24u);
            if (v61) {
              goto LABEL_125;
            }
LABEL_126:
            CFProperty = IORegistryEntryCreateCFProperty(v6, @"AdapterInfo", allocator, 0);
            v88 = IORegistryEntryCreateCFProperty(v6, @"AppleRawExternalConnected", allocator, 0);
            LODWORD(keys[0]) = 0;
            if (CFProperty)
            {
              v89 = CFGetTypeID(CFProperty);
              if (v89 == CFNumberGetTypeID()) {
                CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, keys);
              }
              CFRelease(CFProperty);
              v90 = (int)keys[0];
              if (v309 != (LODWORD(keys[0]) == 0))
              {
LABEL_132:
                v91 = v305 ^ (v88 != v308);
                goto LABEL_133;
              }
              v91 = 0;
            }
            else
            {
              v90 = 0;
              v91 = 0;
              if (!v309) {
                goto LABEL_132;
              }
            }
LABEL_133:
            if (debug_polling)
            {
              v92 = logger;
              if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t input = 136316418;
                *(void *)&input[4] = "updateThread";
                *(_WORD *)&input[12] = 1024;
                *(_DWORD *)&input[14] = 2921;
                *(_WORD *)&input[18] = 1024;
                *(_DWORD *)&input[20] = v61;
                *(_WORD *)&input[24] = 1024;
                *(_DWORD *)&input[26] = v91 & 1;
                *(_WORD *)&input[30] = 1024;
                *(_DWORD *)&input[32] = v90;
                *(_WORD *)&input[36] = 1024;
                *(_DWORD *)&input[38] = v88 == v308;
                _os_log_impl(&dword_2406CC000, v92, OS_LOG_TYPE_DEFAULT, "*** %s:%d updatesDone=%d same_adaptor=%d adaptor_type=%d external_connected=%d *** ", input, 0x2Au);
              }
            }
            if ((v91 & (v61 != 0)) != 1 || v76 == 0.0)
            {
              v93 = (int)keys[0];
              v309 = LODWORD(keys[0]) != 0;
              v305 = v88 == v308;
              unint64_t v2 = 0x26AFC8000;
              if (v88) {
                CFRelease(v88);
              }
              if (v93 != 0 && v304)
              {
                setUPOData(@"IOPMUBootUPOState", 0);
                v304 = 0;
              }
              ++debug_cnt_ut_recv;
              v86 = refCon;
              unint64_t v3 = 0x268C8E000uLL;
              goto LABEL_147;
            }
            unint64_t v2 = 0x26AFC8000;
            if (v88) {
              CFRelease(v88);
            }
            char v59 = 0;
            mach_port_t v65 = -1;
            LOBYTE(v58) = 1;
LABEL_141:
            unint64_t v3 = 0x268C8E000;
          }
          else
          {
            if (!v61) {
              goto LABEL_126;
            }
LABEL_125:
            v86 = refCon;
            if (refCon == -536723200) {
              goto LABEL_126;
            }
LABEL_147:
            if (v86 == -469794560)
            {
              LOBYTE(v58) = 1;
              if (v76 != 0.0) {
                v75 = 1;
              }
            }
            if ((v311 & (v86 != -536870144)) != 0)
            {
LABEL_156:
              char v59 = 0;
              mach_port_t v65 = -1;
              v311 = 1;
            }
            else if (v86 == -536870288)
            {
              IOAllowPowerChange(kernelPort, notificationID);
              char v59 = 0;
              mach_port_t v65 = -1;
              LOBYTE(v58) = 1;
            }
            else
            {
              if (v60 && v86 == -536870272)
              {
                IOAllowPowerChange(kernelPort, notificationID);
                goto LABEL_156;
              }
              if (v303 == -1)
              {
                char v59 = 0;
                ++v60;
                goto LABEL_166;
              }
              if (v86 == -536870144)
              {
                if (v299) {
                  updateThermalCoolDownState(notification[1], 0);
                }
                v299 = 0;
                if (v311)
                {
                  v311 = 0;
                  qword_268C8E9C8 = time(0);
                }
                else
                {
                  v311 = 0;
                }
              }
              int hdq_state = ggctl_get_hdq_state(v303);
              if (hdq_state == -2)
              {
                char v59 = 1;
                goto LABEL_444;
              }
              if (hdq_state)
              {
                if (hdq_state < 0)
                {
                  if (os_log_type_enabled(*(os_log_t *)(v3 + 1688), OS_LOG_TYPE_ERROR)) {
                    updateThread_cold_2(&v332, v333);
                  }
                  char v59 = 0;
                  goto LABEL_443;
                }
                v98 = hdqBreak(v303);
                if (v98 != -2)
                {
                  if (v98 < 0)
                  {
                    v99 = v3;
                    v100 = ++updateThread_debug_break_failures;
                    v101 = *(NSObject **)(v99 + 1688);
                    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)uint64_t input = 136315906;
                      *(void *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3024;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v100;
                      *(_WORD *)&input[24] = 1024;
                      *(_DWORD *)&input[26] = -1;
                      _os_log_error_impl(&dword_2406CC000, v101, OS_LOG_TYPE_ERROR, "%s:%d break failed break_failures=%d (%d)", input, 0x1Eu);
                      v100 = updateThread_debug_break_failures;
                    }
                    if ((-858993459 * v100) <= 0x33333333)
                    {
                      statsAndLogs(notification[1], 0);
                      unint64_t v3 = 0x268C8E000uLL;
                    }
                    else
                    {
                      v102 = -1227133513 * v100;
                      unint64_t v3 = 0x268C8E000;
                      if (v102 <= 0x24924924) {
                        debugLog(notification[1], 63);
                      }
                    }
                  }
                  else if (updateThread_debug_break_failures)
                  {
                    statsAndLogs(notification[1], 1);
                    debugLog(notification[1], 0);
                    updateThread_debug_break_failures = 0;
                  }
                }
                if (v310)
                {
                  if (v61)
                  {
                    v103 = gaugeDisableInterrupts(v303);
                    if (v103 < 0)
                    {
                      v104 = v103;
                      v105 = *(NSObject **)(v3 + 1688);
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)uint64_t input = 136315650;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3044;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v104;
                        _os_log_error_impl(&dword_2406CC000, v105, OS_LOG_TYPE_ERROR, "%s:%d cannot disable gauge interrupts (%d)", input, 0x18u);
                      }
                    }
                  }
                }
                if (refCon == -536870272)
                {
                  v111 = OSThermalNotificationCurrentLevel();
                  v299 = v111 > 14;
                  unint64_t v2 = 0x26AFC8000;
                  if (v111 >= 15) {
                    updateThermalCoolDownState(notification[1], 1);
                  }
                  IOAllowPowerChange(kernelPort, notificationID);
                  char v59 = 0;
                  v311 = 1;
                  goto LABEL_444;
                }
                unint64_t v2 = 0x26AFC8000;
                if (refCon == -536870320) {
                  goto LABEL_526;
                }
                if (v61)
                {
                  v278 = 0;
                  goto LABEL_203;
                }
                if ((getFWVersion(v303, &word_268C8E906) & 0x80000000) != 0)
                {
                  char v59 = 0;
                  int v61 = 0;
                  ++v60;
                  mach_port_t v65 = v303;
                }
                else
                {
                  v112 = CFNumberCreate(allocator, kCFNumberIntType, &word_268C8E906);
                  if (v112)
                  {
                    v113 = v112;
                    IORegistryEntrySetCFProperty(v6, @"GasGaugeFirmwareVersion", v112);
                    CFRelease(v113);
                  }
                  v114 = (unsigned __int16)word_268C8E906;
                  v115 = (unsigned __int16)word_268C8E906 - 1281 < 2;
                  *v296 = (unsigned __int16)word_268C8E906 > 0x131u;
                  if (v114 == 265)
                  {
                    v116 = logger;
                    v295 = 0;
                    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)uint64_t input = 0;
                      _os_log_impl(&dword_2406CC000, v116, OS_LOG_TYPE_DEFAULT, "gas gauge firmware 1.09: disabling critical battery shutdown", input, 2u);
                      v295 = 0;
                    }
                  }
                  LOBYTE(v291) = v291 | v115;
                  keys[0] = 0;
                  if ((readChargeTable(v303, (__CFData **)keys) & 0x80000000) != 0)
                  {
                    char v59 = 0;
                    int v61 = 0;
                    ++v60;
                    mach_port_t v65 = v303;
                    goto LABEL_141;
                  }
                  unint64_t v3 = 0x268C8E000uLL;
                  if (keys[0])
                  {
                    *(void **)buf = keys[0];
                    v359[0] = @"ChargeTable";
                    v278 = 1;
                  }
                  else
                  {
                    v278 = 0;
                  }
                  if (dword_268C8E9D8) {
                    v117 = dword_268C8E9D8;
                  }
                  else {
                    v117 = 2;
                  }
                  Block = ggctl_readBlock(v303, -1, v117, updateThread_batteryInfo, 0);
                  if (Block < 0) {
                    strcpy((char *)updateThread_batteryInfo, "000000");
                  }
                  if (v290)
                  {
                    byte_268C8E908 = dword_268C8EA78;
                    if ((_BYTE)dword_268C8EA78)
                    {
                      LOBYTE(v290) = 1;
                    }
                    else
                    {
                      v161 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        *(void *)uint64_t input = 67109376;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = Block;
                        _os_log_error_impl(&dword_2406CC000, v161, OS_LOG_TYPE_ERROR, "disabled passedCharge PCFF=%d err=%d", input, 0xEu);
                      }
                      LOBYTE(v290) = 0;
                      unint64_t v2 = 0x26AFC8000;
                    }
                  }
                  else
                  {
                    LOBYTE(v290) = 0;
                  }
                  if (byte_268C8E924) {
                    word_268C8E904 = 136;
                  }
                  if (hdqReadS16(v303, 60, &word_268C8E902)) {
                    word_268C8E902 = 0;
                  }
                  if (controlReadU16(v303, 8, &word_268C8E900))
                  {
                    word_268C8E900 = 0;
                    v274 = 0;
                    v275 = 1;
                    v109 = v278;
LABEL_280:
                    v330 = v61 < 16;
                    *(void *)&buf[8 * v109] = CFNumberCreate(allocator, kCFNumberIntType, &v330);
                    v359[v109] = @"ForceFullGGUpdateOnBoot";
                    HIDWORD(v133) = -1431655764 * v61 + 143165576;
                    LODWORD(v133) = HIDWORD(v133);
                    v134 = (v133 >> 2) < 0x4444445 && v61 < 16;
                    if (v134)
                    {
                      v135 = 1;
                    }
                    else
                    {
                      HIDWORD(v136) = -1813430636 * v61 + 9544368;
                      LODWORD(v136) = HIDWORD(v136);
                      v135 = (v136 >> 4) < 0x123457;
                    }
                    v279 = (os_log_t)v109;
                    if (debug_polling)
                    {
                      v137 = v135;
                      v138 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 136316418;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3254;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v61;
                        *(_WORD *)&input[24] = 1024;
                        *(_DWORD *)&input[26] = v137;
                        *(_WORD *)&input[30] = 1024;
                        *(_DWORD *)&input[32] = v134;
                        *(_WORD *)&input[36] = 1024;
                        *(_DWORD *)&input[38] = v61 < 16;
                        _os_log_impl(&dword_2406CC000, v138, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d, fullUpdate=%d, bootFullUpdate=%d, forceFullUpdate=%d] ", input, 0x2Au);
                        v139 = debug_polling;
                      }
                      else
                      {
                        v139 = 1;
                      }
                      if (v61) {
                        v140 = v137;
                      }
                      else {
                        v140 = 0;
                      }
                      unint64_t v3 = 0x268C8E000uLL;
                      v135 = v137;
                      if (v139)
                      {
                        v109 = (uint64_t)v279;
                        if (v140)
                        {
                          v140 = 1;
                          statsAndLogs(notification[1], 1);
                        }
                      }
                      else
                      {
                        v109 = (uint64_t)v279;
                      }
                    }
                    else
                    {
                      if (v61) {
                        v140 = v135;
                      }
                      else {
                        v140 = 0;
                      }
                      unint64_t v3 = 0x268C8E000;
                    }
                    if (v275)
                    {
LABEL_439:
                      if (*v296 && *(_DWORD *)(v292 + 4)) {
                        ++*(_DWORD *)(v292 + 28);
                      }
                      char v59 = 0;
                      ++debug_cnt_ut_err;
LABEL_443:
                      ++v60;
                      goto LABEL_444;
                    }
                    v267 = v135;
                    if (debug_polling)
                    {
                      v141 = *(NSObject **)(v3 + 1688);
                      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 136315650;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3295;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v61;
                        _os_log_impl(&dword_2406CC000, v141, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d POLLING THE BATTERY", input, 0x18u);
                      }
                    }
                    v142 = (v109 + 1);
                    v143 = !v298;
                    if (!v61) {
                      v143 = 1;
                    }
                    v272 = v143;
                    if (v143 != 1) {
                      goto LABEL_317;
                    }
                    v144 = (v109 + 1);
                    if (v267) {
                      v145 = 18;
                    }
                    else {
                      v145 = 10;
                    }
                    BatteryData = readBatteryData((uint64_t)&updateThread_updates, v145, v303);
                    if (BatteryData == v145)
                    {
                      calculateBatteryHealthMetric();
                      v142 = v144;
                      goto LABEL_317;
                    }
                    v276 = BatteryData;
                    log = *(NSObject **)(v3 + 1688);
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t input = 67109376;
                      *(_DWORD *)&input[4] = v145;
                      *(_WORD *)&input[8] = 1024;
                      *(_DWORD *)&input[10] = v276;
                      _os_log_impl(&dword_2406CC000, log, OS_LOG_TYPE_DEFAULT, "cannot read battery data count=%d (err=%d)", input, 0xEu);
                    }
                    calculateBatteryHealthMetric();
                    v142 = v144;
                    LODWORD(ChargerData) = v276;
                    if (v276)
                    {
                      v148 = 0;
                    }
                    else
                    {
LABEL_317:
                      v149 = word_268C8E90A;
                      v150 = word_268C8E912;
                      if (word_268C8E912) {
                        v151 = 0;
                      }
                      else {
                        v151 = word_268C8E90A == 3600;
                      }
                      v152 = (unsigned __int16)word_268C8E93A;
                      if (v151 || (unsigned __int16)word_268C8E93A == 0xFFFF)
                      {
                        logb = v142;
                        v160 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 67110144;
                          *(_DWORD *)&input[4] = v152;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = word_268C8E914;
                          *(_WORD *)&input[14] = 1024;
                          *(_DWORD *)&input[16] = word_268C8E90C;
                          *(_WORD *)&input[20] = 1024;
                          *(_DWORD *)&input[22] = v149;
                          *(_WORD *)&input[26] = 1024;
                          *(_DWORD *)&input[28] = v150;
                          _os_log_impl(&dword_2406CC000, v160, OS_LOG_TYPE_DEFAULT, "gas gauge reset detected (flags %#x capacity %d/%dmAh voltage %dmV current %dmA)", input, 0x20u);
                        }
                        v148 = 0;
                        LODWORD(ChargerData) = -1;
                        unint64_t v3 = 0x268C8E000;
                        v142 = logb;
                      }
                      else
                      {
                        if (!v61 && v345)
                        {
                          loga = v142;
                          v345 = 0;
                          v153 = word_268C8E90C;
                          v154 = 100 * (word_268C8E90C / 100) + 100;
                          v155 = logger;
                          v156 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                          v157 = v154;
                          v158 = v154;
                          if (v156)
                          {
                            *(void *)uint64_t input = 67110144;
                            v159 = ((26215 * v154) >> 18) + ((26215 * v154) >> 31);
                            *(_WORD *)&input[8] = 1024;
                            *(_DWORD *)&input[10] = v153;
                            *(_WORD *)&input[14] = 1024;
                            *(_DWORD *)&input[16] = word_268C8E914;
                            *(_WORD *)&input[20] = 1024;
                            *(_DWORD *)&input[22] = v158;
                            *(_WORD *)&input[26] = 1024;
                            *(_DWORD *)&input[28] = ((26215 * v158) >> 18) + ((26215 * v158) >> 31);
                            _os_log_impl(&dword_2406CC000, v155, OS_LOG_TYPE_DEFAULT, "mask real UPOState=%x FCC=%d RemCap=%d new FCC=%d new RemCap=%d", input, 0x20u);
                          }
                          else
                          {
                            v159 = ((26215 * v154) >> 18) + ((26215 * v154) >> 31);
                          }
                          word_268C8E90C = v157;
                          word_268C8E914 = v159;
                          v142 = loga;
                        }
                        if ((v272 ^ 1))
                        {
                          LODWORD(ChargerData) = 0;
                          v162 = v305;
                        }
                        else
                        {
                          v162 = v305;
                          if (v305) {
                            v163 = 24;
                          }
                          else {
                            v163 = 22;
                          }
                          LODWORD(ChargerData) = hdqReadS16(v303, v163, &word_268C8E916);
                        }
                        v148 = ChargerData == 0;
                        v164 = ChargerData != 0;
                        if ((v297 & 2) == 0) {
                          v164 = 1;
                        }
                        if ((v164 || !v162) | (v272 ^ 1) & 1)
                        {
                          unint64_t v3 = 0x268C8E000;
                        }
                        else
                        {
                          ChargerData = readChargerData(v291 & 1, v290 & 1, v303);
                          *(void *)&buf[8 * (void)v142] = ChargerData;
                          unint64_t v3 = 0x268C8E000uLL;
                          if (ChargerData)
                          {
                            if (v287) {
                              CFShow(ChargerData);
                            }
                            LODWORD(ChargerData) = 0;
                            v359[(void)v142] = @"ChargerData";
                            v142 = ((char *)&v279->isa + 2);
                          }
                        }
                      }
                    }
                    v277 = (int)ChargerData;
                    v280 = v148;
                    if (v148 && (unsigned __int16)word_268C8E906 >= 0x501u)
                    {
                      v329 = (unsigned __int16)word_268C8E90E;
                      *(void *)&buf[8 * (void)v142] = CFNumberCreate(allocator, kCFNumberIntType, &v329);
                      v359[(void)v142] = @"NominalChargeCapacity";
                      v165 = ((char *)&v142->isa + 1);
                    }
                    else
                    {
                      v165 = v142;
                    }
                    if (debug_polling)
                    {
                      v166 = *(NSObject **)(v3 + 1688);
                      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 67109376;
                        *(_DWORD *)&input[4] = dword_268C8EA80;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = dword_268C8EAC4;
                        _os_log_impl(&dword_2406CC000, v166, OS_LOG_TYPE_DEFAULT, "determineVACVoltage, vacLevelCount=%d, vac95LevelCount=%d", input, 0xEu);
                      }
                    }
                    v167 = v305;
                    v266 = v140;
                    if (!byte_268C8E924 || v61 != 0 && !v305)
                    {
                      if (v285 && (v61 == 0 || v305))
                      {
                        v173 = determineVACVoltage();
                        if (v173 != dword_268C8E928)
                        {
                          v174 = v173;
                          dword_268C8E928 = v173;
                          v175 = *(NSObject **)(v3 + 1688);
                          if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v174;
                            _os_log_impl(&dword_2406CC000, v175, OS_LOG_TYPE_DEFAULT, "Added atvAbsMaxVoltageMV=%u to battery dict", input, 8u);
                            v174 = dword_268C8E928;
                          }
                          v170 = allocator;
                          v328 = v174;
                          v169 = v165;
                          *(void *)&buf[8 * (void)v165] = CFNumberCreate(allocator, kCFNumberIntType, &v328);
                          v172 = @"atvAbsMaxVoltageMV";
                          v167 = v305;
                          v171 = v272;
LABEL_375:
                          v359[(void)v169] = v172;
                          v169 = ((char *)v169 + 1);
                          goto LABEL_376;
                        }
                        v167 = v305;
                      }
                      v170 = allocator;
                      v169 = v165;
                      goto LABEL_371;
                    }
                    v168 = dynamicATV(v303);
                    v169 = v165;
                    *(void *)&buf[8 * (void)v165] = v168;
                    v170 = allocator;
                    if (v168)
                    {
                      v171 = v272;
                      if (v287) {
                        CFShow(v168);
                      }
                      v172 = @"AppleDynamicATV";
                      goto LABEL_375;
                    }
LABEL_371:
                    v171 = v272;
LABEL_376:
                    v176 = v280;
                    if ((v297 & 2) != 0) {
                      v176 = 0;
                    }
                    if ((v171 & (v176 && v167)) == 1)
                    {
                      *(void *)uint64_t input = 0;
                      keys[0] = 0;
                      *(void *)uint64_t input = CFNumberCreate(v170, kCFNumberIntType, &dword_268C8E928);
                      keys[0] = @"ChargingVoltage";
                      *(void *)&buf[8 * (void)v169] = CFDictionaryCreate(v170, (const void **)keys, (const void **)input, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                      v359[(void)v169] = @"ChargerData";
                      v169 = ((char *)v169 + 1);
                      CFRelease(*(CFTypeRef *)input);
                    }
                    if (dword_268C8EB08)
                    {
                      v177 = determinePoSMThreshold();
                      if (v177 != dword_268C8E930) {
                        dword_268C8E930 = v177;
                      }
                      *(_DWORD *)uint64_t input = HIWORD(v177);
                      LODWORD(keys[0]) = (unsigned __int16)v177;
                      if ((unsigned __int16)v177 == 0xFFFF || HIWORD(v177) == 0xFFFF) {
                        v179 = 0;
                      }
                      else {
                        v179 = dword_268C8EB08;
                      }
                      *(_DWORD *)v349 = v179;
                      *(void *)&buf[8 * (void)v169] = CFNumberCreate(v170, kCFNumberIntType, v349);
                      v359[(void)v169] = @"PoSMEnabled";
                      v180 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v181 = 8 * (void)v169 + 8;
                      *(void *)&buf[v181] = v180;
                      *(void **)((char *)v359 + v181) = @"PoSMUpperThreshold";
                      v169 = ((char *)v169 + 2);
                      *(void *)&buf[8 * (void)v169] = CFNumberCreate(allocator, kCFNumberIntType, keys);
                      v359[(void)v169] = @"PoSMLowerThreshold";
                    }
                    else
                    {
                      *(_DWORD *)uint64_t input = 0;
                      *(void *)&buf[8 * (void)v169] = CFNumberCreate(v170, kCFNumberIntType, input);
                      v359[(void)v169] = @"PoSMEnabled";
                    }
                    if ((v280 & v297) != 0) {
                      U16 = 0;
                    }
                    else {
                      U16 = v277;
                    }
                    if ((v171 & v280 & v297) == 1) {
                      U16 = hdqReadU16(v303, 110, &word_268C8E918);
                    }
                    unint64_t v3 = 0x268C8E000uLL;
                    unint64_t v2 = 0x26AFC8000;
                    v184 = v274;
                    v185 = v169;
                    v186 = (unint64_t)&v169->isa + 1;
                    if (!U16)
                    {
                      v187 = v185;
                      logc = v185;
                      v327 = 10 * word_268C8E910 - 27320;
                      *(void *)&buf[8 * v186] = CFNumberCreate(allocator, kCFNumberIntType, &v327);
                      v359[v186] = @"Temperature";
                      v326 = word_268C8E912;
                      v188 = CFNumberCreate(allocator, kCFNumberIntType, &v326);
                      v189 = 8 * (void)v187;
                      v190 = 8 * (void)v187 + 16;
                      *(void *)&buf[v190] = v188;
                      *(void **)((char *)v359 + v190) = @"Amperage";
                      v325 = word_268C8E90A;
                      v191 = CFNumberCreate(allocator, kCFNumberIntType, &v325);
                      v192 = 8 * (void)v187 + 24;
                      *(void *)&buf[v192] = v191;
                      *(void **)((char *)v359 + v192) = @"Voltage";
                      v324 = word_268C8E916;
                      v193 = CFNumberCreate(allocator, kCFNumberIntType, &v324);
                      v194 = 8 * (void)v187 + 32;
                      *(void *)&buf[v194] = v193;
                      *(void **)((char *)v359 + v194) = @"TimeRemaining";
                      int v64 = word_268C8E914;
                      v323 = word_268C8E914;
                      v195 = CFNumberCreate(allocator, kCFNumberIntType, &v323);
                      v196 = v189 + 40;
                      *(void *)&buf[v196] = v195;
                      *(void **)((char *)v359 + v196) = @"CurrentCapacity";
                      v322 = word_268C8E90C;
                      v197 = CFNumberCreate(allocator, kCFNumberIntType, &v322);
                      v198 = v189 + 48;
                      *(void *)&buf[v198] = v197;
                      *(void **)((char *)v359 + v198) = @"MaxCapacity";
                      HIWORD(v199) = -18304;
                      LOWORD(v199) = word_268C8E936;
                      *(_DWORD *)uint64_t input = llroundf((float)((float)((float)word_268C8E91A * -0.000061035) + 1.0) * (float)v199);
                      v200 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v201 = v189 + 56;
                      *(void *)&buf[v201] = v200;
                      *(void **)((char *)v359 + v201) = @"AbsoluteCapacity";
                      v202 = v308;
                      if (!v274) {
                        v202 = v294;
                      }
                      v203 = v189 + 64;
                      *(void *)&buf[v203] = v202;
                      *(void **)((char *)v359 + v203) = @"AtCriticalLevel";
                      v321 = (unsigned __int16)word_268C8E93A;
                      v204 = CFNumberCreate(allocator, kCFNumberIntType, &v321);
                      v205 = v189 + 72;
                      *(void *)&buf[v205] = v204;
                      *(void **)((char *)v359 + v205) = @"AppleRawBatteryFlags";
                      v206 = (char *)&logc[1].isa + 2;
                      if (v297)
                      {
                        v320 = (unsigned __int16)word_268C8E918;
                        *(void *)&buf[8 * (void)v206] = CFNumberCreate(allocator, kCFNumberIntType, &v320);
                        v359[(void)v206] = @"ITMiscStatus";
                        v319 = word_268C8E918 & 3;
                        v207 = CFNumberCreate(allocator, kCFNumberIntType, &v319);
                        v208 = v189 + 88;
                        *(void *)&buf[v208] = v207;
                        *(void **)((char *)v359 + v208) = @"ITSimulationCounter";
                        v318 = ((unsigned __int16)word_268C8E918 >> 2) & 3;
                        v209 = CFNumberCreate(allocator, kCFNumberIntType, &v318);
                        v210 = v189 + 96;
                        *(void *)&buf[v210] = v209;
                        *(void **)((char *)v359 + v210) = @"RaUpdateCounter";
                        v206 = (char *)&logc[1].isa + 5;
                      }
                      v317 = word_268C8E93A & 0x80;
                      *(void *)&buf[8 * (void)v206] = CFNumberCreate(allocator, kCFNumberIntType, &v317);
                      v359[(void)v206] = @"OCVTakenFlag";
                      v316 = word_268C8E93A & 0x200;
                      v211 = CFNumberCreate(allocator, kCFNumberIntType, &v316);
                      v212 = 8 * (void)v206 + 8;
                      *(void *)&buf[v212] = v211;
                      *(void **)((char *)v359 + v212) = @"FCFlag";
                      v186 = (unint64_t)(v206 + 2);
                      if (!v267) {
                        goto LABEL_406;
                      }
                      v315 = (unsigned __int16)word_268C8E934;
                      *(void *)&buf[8 * v186] = CFNumberCreate(allocator, kCFNumberIntType, &v315);
                      v359[v186] = @"CycleCount";
                      v314 = word_268C8E902;
                      v213 = CFNumberCreate(allocator, kCFNumberIntType, &v314);
                      v214 = 8 * (void)v206 + 24;
                      *(void *)&buf[v214] = v213;
                      *(void **)((char *)v359 + v214) = @"DesignCapacity";
                      v186 = (unint64_t)(v206 + 4);
                      v215 = parseBatteryData(v297 & 1, v283);
                      *(void *)&buf[8 * (void)(v206 + 4)] = v215;
                      if (v215)
                      {
                        U16 = 0;
                        if (v287) {
                          CFShow(v215);
                        }
                        v359[v186] = @"BatteryData";
                        v186 = (unint64_t)(v206 + 5);
                        v184 = v274;
                      }
                      else
                      {
LABEL_406:
                        v184 = v274;
                        U16 = 0;
                      }
                      unint64_t v2 = 0x26AFC8000;
                    }
                    if (v289 && (updateThread_oneTime & 1) == 0)
                    {
                      v355 = 0u;
                      memset(input, 0, sizeof(input));
                      *(_OWORD *)keys = 0u;
                      v354 = 0u;
                      if (ggctl_logShutdownReason(v303, (uint64_t)input, 1u) || !*(void *)&input[40])
                      {
                        v218 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v349 = 136315394;
                          v350 = "updateThread";
                          v351 = 1024;
                          v352 = 3577;
                          _os_log_impl(&dword_2406CC000, v218, OS_LOG_TYPE_DEFAULT, "%s:%d  Error Reading Shutdown reason", v349, 0x12u);
                        }
                      }
                      else
                      {
                        ggctl_logShutdownReason2(v303, keys, 1u);
                        v216 = parseShutdownReason((__int16 *)input, (const UInt8 *)keys, v303);
                        if (v216)
                        {
                          v217 = v216;
                          if (v287) {
                            CFShow(v216);
                          }
                          *(void *)&buf[8 * v186] = v217;
                          v359[v186++] = @"BatteryShutdownReason";
                        }
                        memset(input, 0, sizeof(input));
                        ggctl_logShutdownReason(v303, (uint64_t)input, 0);
                        *(_OWORD *)keys = 0u;
                        v354 = 0u;
                        v355 = 0u;
                        ggctl_logShutdownReason2(v303, keys, 0);
                      }
                      unint64_t v2 = 0x26AFC8000;
                      updateThread_oneTime = 1;
                      v184 = v274;
                    }
                    if (v184)
                    {
                      readIMAXAndSOCSmoothData(byte_268C8E99E, v182, v303);
                      logBatteryDiagnosticData((uint64_t)updateThread_batteryInfo, v303, v289 != 0);
                    }
                    if (!U16)
                    {
                      v219 = CFDictionaryCreate(allocator, (const void **)v359, (const void **)buf, v186, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                      if (v219)
                      {
                        v220 = v219;
                        if (v287) {
                          CFShow(v219);
                        }
                        if (debug_polling)
                        {
                          v221 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 136315650;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3600;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v61;
                            _os_log_impl(&dword_2406CC000, v221, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d PUBLISHING BATTERY data", input, 0x18u);
                          }
                        }
                        v222 = v220;
                        U16 = IORegistryEntrySetCFProperties(v6, v220);
                        if (U16)
                        {
                          v281 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = U16;
                            _os_log_error_impl(&dword_2406CC000, v281, OS_LOG_TYPE_ERROR, "IORegistryEntrySetCFProperties(0x%x)", input, 8u);
                          }
                        }
                        CFRelease(v222);
                        ++debug_cnt_ut_sent;
                      }
                      else
                      {
                        v223 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 136315650;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3608;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v61;
                          _os_log_error_impl(&dword_2406CC000, v223, OS_LOG_TYPE_ERROR, "%s:%d  updatesDone=%d dictionary failed", input, 0x18u);
                        }
                        U16 = 0;
                      }
                      unint64_t v2 = 0x26AFC8000;
                    }
                    do
                      CFRelease(*(CFTypeRef *)&buf[8 * v186 - 8]);
                    while (v186-- > 1);
                    if (U16) {
                      goto LABEL_439;
                    }
                    if (v298)
                    {
                      if (v286)
                      {
                        S16 = controlReadS16(v303, 25, 0);
                        if (S16)
                        {
                          v226 = S16;
                          v227 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v226;
                            _os_log_error_impl(&dword_2406CC000, v227, OS_LOG_TYPE_ERROR, "CCA: usermode cannot disable DLOG (%#x)", input, 8u);
                          }
                          LOBYTE(v286) = 1;
                        }
                        else
                        {
                          LOBYTE(v286) = 0;
                          *(_DWORD *)(v292 + 24) = 0;
                          *(_DWORD *)(v292 + 16) = 0;
                          *(void *)(v292 + 8) = 0;
                        }
                        goto LABEL_516;
                      }
                      LOBYTE(v286) = 0;
LABEL_517:
                      if (*(_DWORD *)(v2 + 680))
                      {
                        *(_DWORD *)(v2 + 680) = 0;
                        v258 = logger;
                        v259 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if (v62 == 0.0)
                        {
                          if (v259)
                          {
                            *(_WORD *)uint64_t input = 0;
                            v260 = v258;
                            v261 = "gasgauge success after previous failure";
                            v262 = 2;
                            goto LABEL_523;
                          }
                        }
                        else if (v259)
                        {
                          v263 = CFAbsoluteTimeGetCurrent();
                          *(_DWORD *)uint64_t input = 134217984;
                          *(double *)&input[4] = v263 - v62;
                          v260 = v258;
                          v261 = "gasgauge success after previous %gs failure";
                          v262 = 12;
LABEL_523:
                          _os_log_impl(&dword_2406CC000, v260, OS_LOG_TYPE_DEFAULT, v261, input, v262);
                        }
                      }
                      double v62 = CFAbsoluteTimeGetCurrent();
                      char v59 = 0;
                      int v60 = 0;
                      word_268C8E9BE = word_268C8E90A;
                      word_268C8E9C0 = word_268C8E912;
                      dword_268C8E9C2 = *(_DWORD *)&word_268C8E90C;
                      word_268C8E9C6 = word_268C8E914;
                      ++v61;
                      goto LABEL_444;
                    }
                    if ((unsigned __int16)word_268C8E906 < 0x132u) {
                      goto LABEL_517;
                    }
                    if (v284)
                    {
                      v228 = time(0);
                      if (v228 < v282)
                      {
                        v229 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 134217984;
                          *(void *)&input[4] = v282;
                          v230 = v229;
                          v231 = "CCA: wait for deadline now=%lu";
                          goto LABEL_475;
                        }
                        goto LABEL_476;
                      }
                      v233 = v228;
                      if ((unsigned __int16)word_268C8E906 < 0x600u)
                      {
                        LOWORD(keys[0]) = 0;
                        v239 = controlReadU16(v303, 0, keys);
                        if (v239)
                        {
                          v240 = v239;
                          v241 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v240;
                            _os_log_error_impl(&dword_2406CC000, v241, OS_LOG_TYPE_ERROR, "CCA: cannot read DLOG status (%#x)", input, 8u);
                          }
                          goto LABEL_476;
                        }
                        v242 = (__int16)keys[0];
                        v235 = logger;
                        v243 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v242 & 0x800) != 0)
                        {
                          if (!v243) {
                            goto LABEL_476;
                          }
                          goto LABEL_474;
                        }
                        if (v243)
                        {
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v61;
                          *(_WORD *)&input[8] = 2048;
                          *(void *)&input[10] = v233;
                          v237 = v235;
                          v238 = "CCA: re-enable DLOG updatesDone=%d, now=%lu";
LABEL_471:
                          _os_log_impl(&dword_2406CC000, v237, OS_LOG_TYPE_DEFAULT, v238, input, 0x12u);
                        }
LABEL_472:
                        v232 = 0;
                        v282 = 0;
                      }
                      else
                      {
                        v234 = word_268C8E93A;
                        v235 = logger;
                        v236 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v234 & 0x20) == 0)
                        {
                          if (v236)
                          {
                            *(_DWORD *)uint64_t input = 67109376;
                            *(_DWORD *)&input[4] = v61;
                            *(_WORD *)&input[8] = 2048;
                            *(void *)&input[10] = v233;
                            v237 = v235;
                            v238 = "CCA: re-enable DLOG updatesDone=%u, now=%lu";
                            goto LABEL_471;
                          }
                          goto LABEL_472;
                        }
                        if (!v236) {
                          goto LABEL_476;
                        }
LABEL_474:
                        *(_DWORD *)uint64_t input = 134217984;
                        *(void *)&input[4] = v233;
                        v230 = v235;
                        v231 = "CCA: GasGauge still calibrating now=%lu";
LABEL_475:
                        _os_log_impl(&dword_2406CC000, v230, OS_LOG_TYPE_DEFAULT, v231, input, 0xCu);
LABEL_476:
                        v232 = 1;
                      }
                    }
                    else
                    {
                      v232 = 0;
                    }
                    if (v286)
                    {
                      if (*(_DWORD *)(v292 + 4)) {
                        goto LABEL_484;
                      }
                      v244 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        v245 = *(_DWORD *)(v292 + 4);
                        *(_DWORD *)uint64_t input = 67109120;
                        *(_DWORD *)&input[4] = v245;
                        _os_log_impl(&dword_2406CC000, v244, OS_LOG_TYPE_DEFAULT, "disabling DLOG (num_clients=%i)", input, 8u);
                      }
                      v246 = controlReadS16(v303, 25, 0);
                      if (v246)
                      {
                        v247 = v246;
                        v248 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 67109120;
                          *(_DWORD *)&input[4] = v247;
                          _os_log_error_impl(&dword_2406CC000, v248, OS_LOG_TYPE_ERROR, "cannot disable DLOG (%#x)", input, 8u);
                        }
LABEL_484:
                        v286 = 1;
                      }
                      else
                      {
                        v286 = 0;
                        *(_DWORD *)(v292 + 24) = 0;
                        *(_DWORD *)(v292 + 16) = 0;
                        *(void *)(v292 + 8) = 0;
                      }
                    }
                    else
                    {
                      v286 = 0;
                    }
                    if (*(_DWORD *)(v292 + 4)) {
                      v249 = v232;
                    }
                    else {
                      v249 = 1;
                    }
                    if ((v249 & 1) == 0)
                    {
                      if (!v61 || v286 != 1)
                      {
                        v250 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          v251 = *(_DWORD *)(v292 + 4);
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v61;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = v251;
                          _os_log_impl(&dword_2406CC000, v250, OS_LOG_TYPE_DEFAULT, "gathering data log updatesDone=%d num_clients=%d", input, 0xEu);
                        }
                      }
                      if ((*(_DWORD *)(v292 + 4) & 0x80000000) != 0
                        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        updateThread_cold_4(&v312, v313);
                      }
                      if (drainDataLog(v303))
                      {
                        v252 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
                          updateThread_cold_3(v347, v348, v252);
                        }
                      }
                      v286 = 1;
                    }
                    if (v232)
                    {
                      v253 = 1;
                    }
                    else if ((unsigned __int16)word_268C8E906 < 0x600u)
                    {
                      v253 = v266;
                      if ((unsigned __int16)word_268C8E906 <= 0x501u) {
                        v253 = 0;
                      }
                    }
                    else
                    {
                      v253 = ((unsigned __int16)word_268C8E93A >> 5) & 1;
                    }
                    v284 = v253;
                    if ((v286 & v253) == 1)
                    {
                      v254 = controlReadS16(v303, 25, 0);
                      if (v254)
                      {
                        v255 = v254;
                        v256 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 67109120;
                          *(_DWORD *)&input[4] = v255;
                          _os_log_error_impl(&dword_2406CC000, v256, OS_LOG_TYPE_ERROR, "CCA: cannot disable DLOG (%#x)", input, 8u);
                        }
                        v284 = 0;
                        LOBYTE(v286) = 1;
                      }
                      else
                      {
                        *(_DWORD *)(v292 + 16) = 0;
                        *(void *)(v292 + 8) = 0;
                        v282 = time(0) + 20;
                        v257 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v61;
                          *(_WORD *)&input[8] = 2048;
                          *(void *)&input[10] = v282;
                          _os_log_impl(&dword_2406CC000, v257, OS_LOG_TYPE_DEFAULT, "CCA: disabled DLOG updatesDone=%d ccaDeadline=%lu", input, 0x12u);
                        }
                        LOBYTE(v286) = 0;
                        v284 = 1;
                      }
                    }
                    unint64_t v3 = 0x268C8E000uLL;
LABEL_516:
                    unint64_t v2 = 0x26AFC8000uLL;
                    goto LABEL_517;
                  }
LABEL_203:
                  if (debug_polling)
                  {
                    v106 = *(NSObject **)(v3 + 1688);
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t input = 136315650;
                      *(void *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3146;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v61;
                      _os_log_impl(&dword_2406CC000, v106, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d READING FLAGS", input, 0x18u);
                    }
                  }
                  v107 = hdqReadU16(v303, 10, &word_268C8E93A);
                  v108 = 0;
                  v275 = v107;
                  if (v107 || (unsigned __int16)word_268C8E93A == 0xFFFF)
                  {
                    v109 = v278;
                  }
                  else
                  {
                    v109 = v278;
                    if (((v295 ^ 1) & 1) == 0)
                    {
                      if (word_268C8EA64)
                      {
                        v273 = 0;
                        if ((v297 & 0x20) != 0)
                        {
                          v110 = v288
                              && (unsigned __int16)(word_268C8EA64 & word_268C8E93A) == (unsigned __int16)word_268C8EA64;
                          v288 = (unsigned __int16)(word_268C8EA64 & word_268C8E93A) == (unsigned __int16)word_268C8EA64;
                        }
                        else
                        {
                          v110 = (unsigned __int16)(word_268C8EA64 & word_268C8E93A) == (unsigned __int16)word_268C8EA64;
                        }
                      }
                      else if (v61 && dword_268C8EA68 >= word_268C8E90A)
                      {
                        v273 = 0;
                        v110 = 1;
                      }
                      else
                      {
                        v110 = ((unsigned __int16)word_268C8E93A >> 2) & 1;
                        v273 = 1;
                      }
                      if (debug_polling)
                      {
                        v119 = *(NSObject **)(v3 + 1688);
                        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                        {
                          v120 = UpSeconds();
                          *(_DWORD *)uint64_t input = 136317186;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3178;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v61;
                          *(_WORD *)&input[24] = 1024;
                          *(_DWORD *)&input[26] = v110;
                          *(_WORD *)&input[30] = 1024;
                          *(_DWORD *)&input[32] = v305;
                          unint64_t v3 = 0x268C8E000uLL;
                          *(_WORD *)&input[36] = 2048;
                          *(void *)&input[38] = v120;
                          *(_WORD *)&input[46] = 1024;
                          *(_DWORD *)&input[48] = v344;
                          LOWORD(v357) = 1024;
                          *(_DWORD *)((char *)&v357 + 2) = dword_268C8EA68;
                          HIWORD(v357) = 1024;
                          v358 = word_268C8E90A;
                          _os_log_impl(&dword_2406CC000, v119, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu cfd=%d cfd-voltage=%d batteryInfo.voltage=%d", input, 0x40u);
                        }
                      }
                      if (!v344) {
                        goto LABEL_263;
                      }
                      v121 = UpSeconds();
                      if (v121 <= v344)
                      {
                        if (!v61) {
                          goto LABEL_532;
                        }
                        v124 = word_268C8E90A;
                        if (dword_268C8EA68 >= word_268C8E90A)
                        {
                          v127 = v121;
                          v128 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 136316162;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3201;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v61;
                            *(_WORD *)&input[24] = 2048;
                            *(void *)&input[26] = v127;
                            *(_WORD *)&input[34] = 1024;
                            *(_DWORD *)&input[36] = v124;
                            _os_log_impl(&dword_2406CC000, v128, OS_LOG_TYPE_DEFAULT, "%s:%d updatesDone=%d UpSeconds=%llu voltage=%d (low)", input, 0x28u);
                          }
                          v273 = 0;
                          v110 = 1;
                          unint64_t v3 = 0x268C8E000uLL;
                          goto LABEL_263;
                        }
                        unint64_t v3 = 0x268C8E000uLL;
                        if (v305)
                        {
LABEL_532:
                          if (debug_polling)
                          {
                            if (v110)
                            {
                              v125 = *(NSObject **)(v3 + 1688);
                              if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                              {
                                v126 = UpSeconds();
                                *(_DWORD *)uint64_t input = 136315906;
                                *(void *)&input[4] = "updateThread";
                                *(_WORD *)&input[12] = 1024;
                                *(_DWORD *)&input[14] = 3209;
                                *(_WORD *)&input[18] = 2048;
                                *(void *)&input[20] = v126;
                                *(_WORD *)&input[28] = 1024;
                                *(_DWORD *)&input[30] = v344;
                                _os_log_impl(&dword_2406CC000, v125, OS_LOG_TYPE_DEFAULT, "%s:%d UpSeconds=%llu (cfd = %u) forcing critical to 0", input, 0x22u);
                              }
                            }
                          }
                          if (!v273) {
                            v110 = 0;
                          }
                          v273 = v273 << 31 >> 31;
                        }
                      }
                      else if (debug_polling)
                      {
                        v122 = *(NSObject **)(v3 + 1688);
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                        {
                          v123 = UpSeconds();
                          *(_DWORD *)uint64_t input = 136315906;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3191;
                          *(_WORD *)&input[18] = 2048;
                          *(void *)&input[20] = v123;
                          *(_WORD *)&input[28] = 1024;
                          *(_DWORD *)&input[30] = v344;
                          _os_log_impl(&dword_2406CC000, v122, OS_LOG_TYPE_DEFAULT, "%s:%d deadline expired at UpSeconds=%llu (cfd = %u)", input, 0x22u);
                        }
                      }
LABEL_263:
                      if (!word_268C8EA64)
                      {
                        v331 = v273;
                        *(void *)((unint64_t)buf | (8 * v278)) = CFNumberCreate(allocator, kCFNumberIntType, &v331);
                        *(void *)((unint64_t)v359 & 0xFFFFFFFFFFFFFFF7 | (8 * (v278 & 1))) = @"SOCBasedShutdown";
                        v109 = v278 + 1;
                      }
                      if (debug_polling)
                      {
                        if (v110)
                        {
                          v129 = *(NSObject **)(v3 + 1688);
                          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                          {
                            v130 = UpSeconds();
                            *(_DWORD *)uint64_t input = 136316674;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3227;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v61;
                            *(_WORD *)&input[24] = 1024;
                            *(_DWORD *)&input[26] = 1;
                            *(_WORD *)&input[30] = 1024;
                            *(_DWORD *)&input[32] = v305;
                            unint64_t v3 = 0x268C8E000uLL;
                            *(_WORD *)&input[36] = 2048;
                            *(void *)&input[38] = v130;
                            *(_WORD *)&input[46] = 1024;
                            *(_DWORD *)&input[48] = word_268C8E90A;
                            _os_log_impl(&dword_2406CC000, v129, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu batteryInfo.voltage=%d", input, 0x34u);
                          }
                        }
                      }
                      v108 = v110 != 0;
                      unint64_t v2 = 0x26AFC8000;
                    }
                  }
                  if ((v75 & 1) == 0 || (v293 > 2 ? (v131 = 1) : (v131 = v108), (v131 & 1) != 0 || v60))
                  {
                    v274 = v108;
                    v293 = 0;
                    goto LABEL_280;
                  }
                  ++v293;
                  v132 = *(NSObject **)(v3 + 1688);
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)uint64_t input = 0;
                    _os_log_impl(&dword_2406CC000, v132, OS_LOG_TYPE_INFO, "flags update only", input, 2u);
                  }
                  char v59 = 0;
                  int v60 = 0;
LABEL_444:
                  mach_port_t v65 = v303;
                }
              }
              else
              {
                v95 = CFPreferencesCopyValue(@"ResetEnabled", @"com.apple.gasgauge", v301, v300);
                v96 = os_log_type_enabled(*(os_log_t *)(v3 + 1688), OS_LOG_TYPE_ERROR);
                if (v95 == v294)
                {
                  v97 = v303;
                  if (v96) {
                    updateThread_cold_5(&v336, v337);
                  }
                }
                else
                {
                  if (v96) {
                    updateThread_cold_6(&v334, v335);
                  }
                  v97 = v303;
                  ggctl_reset(v303, 1u);
                }
                char v59 = 0;
                ++v60;
                mach_port_t v65 = v97;
              }
            }
          }
        }
        else
        {
          char v59 = 0;
LABEL_166:
          mach_port_t v65 = -1;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      updateThread_cold_1();
    }
  }
  return 0;
}

uint64_t batteryThread(unsigned int a1)
{
  return 0;
}

void *GGHIDPlugInFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 5u, 0x16u, 0xB5u, 0x63u, 0xB1u, 0x5Bu, 0x11u, 0xDAu, 0x96u, 0xEBu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  int v4 = calloc(1uLL, 0x98uLL);
  *int v4 = &GGHID_IOCFPlugInInterface;
  v4[1] = v4;
  v4[2] = &GGHID_IOHIDServiceInterface2;
  v4[3] = v4;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xABu, 0x58u, 0xEBu, 0x3Eu, 0xA7u, 0x74u, 0x4Fu, 0xCCu, 0xA1u, 0x1Au, 0x5Au, 0xCDu, 0x74u, 0xE7u, 0xDAu, 0x17u);
  v4[4] = CFRetain(v6);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(v5, 0xABu, 0x58u, 0xEBu, 0x3Eu, 0xA7u, 0x74u, 0x4Fu, 0xCCu, 0xA1u, 0x1Au, 0x5Au, 0xCDu, 0x74u, 0xE7u, 0xDAu, 0x17u);
  CFPlugInAddInstanceForFactory(v7);
  v4[5] = 1;
  v4[6] = 0;
  int v11 = 5;
  int valuePtr = 65280;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v4[7] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  v4[8] = CFNumberCreate(v8, kCFNumberSInt32Type, &v11);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  if (!clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp)) {
    v4[16] = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
  }
  return v4;
}

double ggctl_logShutdownDLog(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  double result;
  long long v6;
  uint64_t v7;
  uint64_t input;
  size_t v9;
  long long outputStruct;
  long long v11;
  uint64_t v12;
  uint64_t v13;

  int v13 = *MEMORY[0x263EF8340];
  int v9 = 40;
  if (a3)
  {
    if (!a2) {
      return result;
    }
    int v12 = 0;
    long long outputStruct = 0u;
    int v11 = 0u;
    CFUUIDRef v7 = a3;
    int v4 = IOConnectCallMethod(a1, 0x12u, &v7, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  else
  {
    if (!a2) {
      return result;
    }
    int v12 = 0;
    long long outputStruct = 0u;
    int v11 = 0u;
    uint64_t input = a3;
    int v4 = IOConnectCallMethod(a1, 0x12u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  if (!v4)
  {
    double result = *(double *)&outputStruct;
    CFUUIDRef v6 = v11;
    *(_OWORD *)a2 = outputStruct;
    *(_OWORD *)(a2 + 16) = v6;
    *(void *)(a2 + 32) = v12;
  }
  return result;
}

uint64_t getSInt32ForKey(CFStringRef key, _DWORD *a2)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(service, key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      int Value = CFNumberGetValue(v4, kCFNumberSInt32Type, a2);
      CFRelease(v4);
      if (Value) {
        return 0;
      }
    }
    else
    {
      CFRelease(v4);
    }
  }
  uint64_t result = 0xFFFFFFFFLL;
  *a2 = -1;
  return result;
}

void setUPOData(const __CFString *a1, int a2)
{
  int v14 = a2;
  CFMutableDictionaryRef v3 = IOServiceMatching("IOService");
  if (v3)
  {
    CFNumberRef v4 = v3;
    int valuePtr = 0;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    CFDictionaryRef v6 = CFDictionaryCreate(v5, (const void **)&setUPOData_tmp, (const void **)&v12, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      CFDictionarySetValue(v4, @"IOPropertyMatch", v6);
      CFRelease(v7);
      io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v4);
      if (!MatchingService) {
        return;
      }
      io_registry_entry_t v9 = MatchingService;
      CFNumberRef v10 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
      IORegistryEntrySetCFProperty(v9, a1, v10);
      IOObjectRelease(v9);
      CFNumberRef v11 = v10;
    }
    else
    {
      CFNumberRef v11 = v4;
    }
    CFRelease(v11);
  }
}

uint64_t ggctl_logShutdownReason2(uint64_t result, _OWORD *a2, unsigned int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  size_t v8 = 48;
  if (a2)
  {
    if (a3)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long outputStruct = 0u;
      uint64_t input = a3;
      uint64_t result = IOConnectCallMethod(result, 0x13u, &input, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
      if (!result)
      {
        long long v4 = v10;
        *a2 = outputStruct;
        a2[1] = v4;
        a2[2] = v11;
      }
    }
    else
    {
      long long v5 = a2[1];
      inputStruct[0] = *a2;
      inputStruct[1] = v5;
      inputStruct[2] = a2[2];
      uint64_t v7 = a3;
      return IOConnectCallMethod(result, 0x13u, &v7, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
    }
  }
  return result;
}

uint64_t iokit_callback(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)uint64_t result = a3;
  *(void *)(result + 8) = a4;
  return result;
}

void getUPOData(CFStringRef key, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  io_registry_entry_t v4 = find_pmu_pmu_service;
  long long v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (find_pmu_pmu_service) {
    goto LABEL_7;
  }
  CFMutableDictionaryRef v6 = IOServiceMatching("IOService");
  if (v6)
  {
    uint64_t v7 = v6;
    int v15 = 0;
    CFAllocatorRef v8 = *v5;
    find_pmu_zero_number = (uint64_t)CFNumberCreate(*v5, kCFNumberSInt32Type, &v15);
    CFDictionaryRef v9 = CFDictionaryCreate(v8, (const void **)&find_pmu_tmp, (const void **)&find_pmu_zero_number, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      CFDictionarySetValue(v7, @"IOPropertyMatch", v9);
      CFRelease(v10);
      find_pmu_pmu_service = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v7);
    }
    else
    {
      CFRelease(v7);
    }
  }
  io_registry_entry_t v4 = find_pmu_pmu_service;
  if (find_pmu_pmu_service)
  {
LABEL_7:
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, key, *v5, 0);
    if (CFProperty)
    {
      CFNumberRef v12 = CFProperty;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v12) || !CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt32Type, a2))
      {
        int v14 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315394;
          mach_error_t v16 = "/Library/Caches/com.apple.xbs/Sources/AppleHDQGasGauge/AppleHDQGasGauge.c";
          __int16 v17 = 1024;
          int v18 = 2348;
          _os_log_impl(&dword_2406CC000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d cannot read upo data", (uint8_t *)&v15, 0x12u);
        }
      }
      CFRelease(v12);
    }
  }
}

void updateThermalCoolDownState(io_registry_entry_t a1, int a2)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "ThermalCoolDown", 0x8000100u);
  long long v5 = (void **)MEMORY[0x263EFFB40];
  if (!a2) {
    long long v5 = (void **)MEMORY[0x263EFFB38];
  }
  values = *v5;
  CFDictionaryRef v6 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    IORegistryEntrySetCFProperties(a1, v6);
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    updateThermalCoolDownState_cold_1();
  }
}

void statsAndLogs(io_registry_entry_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFStringRef v12 = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  keys = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "stats", 0x8000100u);
  long long v5 = (const void *)*MEMORY[0x263EFFB38];
  values = (void *)*MEMORY[0x263EFFB38];
  if (a2)
  {
    CFStringRef v12 = CFStringCreateWithCString(v4, "log", 0x8000100u);
    CFTypeRef cf = v5;
    CFIndex v6 = 2;
  }
  else
  {
    CFIndex v6 = 1;
  }
  CFDictionaryRef v7 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    if (IORegistryEntrySetCFProperties(a1, v7) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      statsAndLogs_cold_2();
    }
    CFRelease(v8);
    CFRelease(values);
    if (a2) {
      CFRelease(cf);
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    statsAndLogs_cold_1();
  }
}

void debugLog(io_registry_entry_t a1, int a2)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  int valuePtr = a2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "debug", 0x8000100u);
  values = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    if (IORegistryEntrySetCFProperties(a1, v4))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        debugLog_cold_2();
      }
    }
    CFRelease(v5);
    CFRelease(values);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    debugLog_cold_1();
  }
}

uint64_t readChargeTable(mach_port_t a1, __CFData **a2)
{
  *(void *)&v48[26] = *MEMORY[0x263EF8340];
  *a2 = 0;
  if (!dword_268C8E9DC) {
    return 0;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (!ggctl_readBlock(a1, -1, dword_268C8E9DC, &outputStruct, 0))
  {
    int v4 = v47;
    if (v47 == 255)
    {
      unsigned int v9 = outputStruct;
      unint64_t v10 = (unint64_t)outputStruct >> 4;
      uint64_t v11 = 6 * v10 + 4;
      if (outputStruct <= 0x4FuLL)
      {
        unsigned __int8 v13 = 0;
        unsigned int v37 = v46;
        p_unsigned __int8 outputStruct = (char *)&outputStruct;
        do
        {
          char v15 = *p_outputStruct++;
          v13 += v15;
          --v11;
        }
        while (v11);
        int v16 = v13;
        if (v13)
        {
          uint64_t v17 = logger;
          uint64_t v3 = 0;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            int v39 = v16;
            __int16 v40 = 1024;
            int v41 = v45;
            __int16 v42 = 1024;
            int v43 = 256 - (v16 - v45);
            CFIndex v6 = "gas gauge charge table bad checksum: checksum %#x checksum byte %#x expecting %#x";
            CFDictionaryRef v7 = v17;
            uint32_t v8 = 20;
            goto LABEL_14;
          }
        }
        else
        {
          unint64_t v19 = (unint64_t)v46 >> 4;
          uint64_t v20 = 4 * v19 + 8;
          Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v20 * (unint64_t)v10);
          CFDataSetLength(Mutable, v20 * (unint64_t)v10);
          if (v9 >= 0x10)
          {
            uint64_t v22 = 0;
            if (v19 <= 1) {
              uint64_t v23 = 1;
            }
            else {
              uint64_t v23 = v19;
            }
            uint64_t v36 = v23;
            if (v10 <= 1) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = v10;
            }
            CFNumberRef v25 = v48;
            uint64_t v26 = 10;
            do
            {
              MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
              CFBooleanRef v28 = &MutableBytePtr[v22 * v20];
              CFBooleanRef v29 = (char *)(&outputStruct + 6 * v22);
              *(_WORD *)CFBooleanRef v28 = 100 * v29[4];
              *((_WORD *)v28 + 1) = 100 * v29[5];
              *((_DWORD *)v28 + 1) = v19;
              if (v37 >= 0x10)
              {
                CFTypeID v30 = &MutableBytePtr[v26];
                uint64_t v31 = v19 - 1;
                uint64_t v32 = v36;
                CFNumberRef v33 = v25;
                do
                {
                  if (v31) {
                    int v34 = updateThread_batteryInfo[(*v33 & 0xF) + 64];
                  }
                  else {
                    LOWORD(v34) = -1;
                  }
                  *((_WORD *)v30 - 1) = v34;
                  unsigned int v35 = *v33++;
                  *(_WORD *)CFTypeID v30 = *(int *)((char *)&updateThread_batteryInfo[80] + (((unint64_t)v35 >> 2) & 0x3C));
                  v30 += 4;
                  --v31;
                  --v32;
                }
                while (v32);
              }
              ++v22;
              v26 += v20;
              v25 += 6;
            }
            while (v22 != v24);
          }
          uint64_t v3 = 0;
          *a2 = Mutable;
        }
      }
      else
      {
        uint64_t v12 = logger;
        uint64_t v3 = 0;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v39 = v10;
          __int16 v40 = 1024;
          int v41 = 6 * v10 + 4;
          CFIndex v6 = "gas gauge charge table inconsistent: %d data entries, %d bytes";
          CFDictionaryRef v7 = v12;
          uint32_t v8 = 14;
          goto LABEL_14;
        }
      }
    }
    else
    {
      uint64_t v5 = logger;
      uint64_t v3 = 0;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v39 = v4;
        CFIndex v6 = "gas gauge charge table invalid type: %#x";
        CFDictionaryRef v7 = v5;
        uint32_t v8 = 8;
LABEL_14:
        _os_log_impl(&dword_2406CC000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t readRemainingCapacity__(_WORD *a1, int *a2, mach_port_t a3)
{
  unsigned __int16 v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v8 <= 0x118u) {
    int v6 = *a2;
  }
  else {
    int v6 = 50;
  }

  return hdqReadS16(a3, v6, a1);
}

uint64_t readFAC__(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  __int16 v6 = 0;
  if ((getFWVersion(a3, &v6) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v6 == 1536) {
    return 0;
  }

  return hdqReadU16(a3, 14, a1);
}

uint64_t readBatteryData(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  unsigned __int16 v10 = 0;
  if ((getFWVersion(a3, (__int16 *)&v10) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((int)a2 >= 1)
  {
    uint64_t v6 = 0;
    unsigned int v7 = v10;
    while (1)
    {
      if (*(_DWORD *)(a1 + 4) == -1) {
        return v6;
      }
      if (registerName(a1, v7))
      {
        uint64_t Register = readRegister(*(_WORD **)(a1 + 56), a1, a3);
        if ((Register & 0x80000000) != 0) {
          break;
        }
      }
      ++v6;
      a1 += 80;
      if (a2 == v6) {
        return a2;
      }
    }
    return Register;
  }
  return a2;
}

void calculateBatteryHealthMetric()
{
  if ((unsigned __int16)word_268C8E906 >= 0x600u)
  {
    uint64_t v0 = 0;
    float v1 = (double)(bswap32((unsigned __int16)word_268C8E980) >> 16) * 0.137995
       + (double)(bswap32((unsigned __int16)word_268C8E97E) >> 16) * 0.0693069
       + (double)(bswap32((unsigned __int16)word_268C8E982) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_268C8E984) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_268C8E986) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_268C8E988) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_268C8E98A) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_268C8E98C) >> 16) * 0.0872525
       + (double)(bswap32((unsigned __int16)word_268C8E98E) >> 16) * 0.0185644;
    word_268C8E9D4 = (int)v1;
    while (battery_health_metric_config[v0] != word_268C8E900)
    {
      v0 += 4;
      if (v0 == 68)
      {
        float v2 = 0.0;
        goto LABEL_7;
      }
    }
    float v2 = (float)*(unsigned int *)&battery_health_metric_config[v0 + 2];
LABEL_7:
    float v3 = (float)(v2 * v1) / 1000.0;
    word_268C8E9D6 = (int)v3;
    if (dword_268C8E9D0 < (int)v3)
    {
      dword_268C8E9D0 = (int)v3;
      setUPOData(@"IOPMUBootBatteryHealthMetric", (int)v3);
    }
  }
}

CFDictionaryRef readChargerData(int a1, int a2, mach_port_t a3)
{
  values[8] = *(void **)MEMORY[0x263EF8340];
  if (readBatteryData((uint64_t)&readChargerData_chargerRegs, 5, a3) != 5) {
    return 0;
  }
  memset(&values[2], 0, 48);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt8Type, &readChargerData_notChargingReason);
  keys[0] = @"NotChargingReason";
  values[1] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerAlert);
  keys[1] = @"ChargerAlert";
  if (!a1) {
    goto LABEL_11;
  }
  int v7 = readChargerData_notChargingReason & 0x10;
  if (a2)
  {
    if ((readChargerData_notChargingReason & 0x10) != 0)
    {
      int v7 = (readChargerData_notChargingReason >> 4) & 1;
      LOWORD(v19) = 0;
      if ((hdqReadU16(a3, 52, &v19) & 0x80000000) == 0)
      {
        uint64_t v8 = 1717986919 * byte_268C8E908 * word_268C8E902;
        if ((int)((v8 >> 34) + ((unint64_t)v8 >> 63)) > (unsigned __int16)v19) {
          int v7 = 0;
        }
      }
    }
  }
  if (v7)
  {
    values[2] = *(void **)MEMORY[0x263EFFB40];
    *(void *)&long long v21 = @"ChargerTimeout";
    uint64_t v9 = 3;
  }
  else
  {
LABEL_11:
    uint64_t v9 = 2;
  }
  if ((readChargerData_notChargingReason & 0x20) != 0)
  {
    values[v9] = (void *)*MEMORY[0x263EFFB40];
    keys[v9++] = @"ChargerWatchdogTimeout";
  }
  values[v9] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingCurrent);
  keys[v9] = @"ChargingCurrent";
  CFNumberRef v11 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingVoltage);
  uint64_t v12 = 8 * v9 + 8;
  *(void **)((char *)values + v12) = v11;
  *(void **)((char *)keys + v12) = @"ChargingVoltage";
  CFNumberRef v13 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerStatus);
  uint64_t v14 = 8 * v9 + 16;
  *(void **)((char *)values + v14) = v13;
  *(void **)((char *)keys + v14) = @"ChargerStatus";
  time_t v19 = time(0);
  CFNumberRef v15 = CFNumberCreate(v6, kCFNumberLongType, &v19);
  uint64_t v16 = 8 * v9 + 24;
  *(void **)((char *)values + v16) = v15;
  *(void **)((char *)keys + v16) = @"UpdateTime";
  CFDictionaryRef v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v9 + 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
  {
    CFRelease(values[v9 + 3]);
    unint64_t v17 = v9 + 4;
    --v9;
  }
  while (v17 > 1);
  return v10;
}

CFDictionaryRef dynamicATV(mach_port_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFNumberRef v21 = 0;
  time_t v19 = 0;
  *(_OWORD *)uint64_t input = xmmword_2406D8040;
  uint64_t v23 = 0;
  if (IOConnectCallScalarMethod(a1, 7u, input, 3u, 0, 0))
  {
    float v1 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      dynamicATV_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  unsigned int v9 = word_268C8E904 + (unsigned __int16)word_268C8E90E;
  int v10 = word_268C8E902;
  if (v9 <= (__int16)(v10 + ((unsigned __int16)(v10 & 0x8000) >> 15)) >> 1) {
    int v11 = (__int16)(word_268C8E902 + ((word_268C8E902 & 0x8000u) >> 15)) >> 1;
  }
  else {
    int v11 = word_268C8E904 + (unsigned __int16)word_268C8E90E;
  }
  if (v9 <= word_268C8E902) {
    int v10 = v11;
  }
  dword_268C8E92C = v10;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &dword_268C8E92C);
  int v18 = @"atvBatteryCapacityMA";
  if (dword_268C8EA80)
  {
    int v13 = determineVACVoltage();
    if (v13 != dword_268C8E928) {
      dword_268C8E928 = v13;
    }
    CFNumberRef v21 = CFNumberCreate(v12, kCFNumberIntType, &dword_268C8E928);
    time_t v19 = @"atvAbsMaxVoltageMV";
    unint64_t v14 = 2;
  }
  else
  {
    unint64_t v14 = 1;
  }
  CFDictionaryRef v15 = CFDictionaryCreate(v12, (const void **)&v18, (const void **)&values, v14, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
    CFRelease(*(&v19 + v14));
  while (v14-- > 1);
  return v15;
}

uint64_t determineVACVoltage()
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unsigned int v0 = dword_268C8E928;
  uint64_t v1 = dword_268C8EA80;
  if (dword_268C8EA80)
  {
    if (determineVACVoltage_lastBatteryCycleCount != (unsigned __int16)word_268C8E934 || dword_268C8E928 == 0)
    {
      determineVACVoltage_lastBatteryCycleCount = (unsigned __int16)word_268C8E934;
      uint64_t v3 = &dword_268C8EA84;
      while (1)
      {
        unsigned int v5 = *v3++;
        unsigned __int16 v4 = v5;
        unsigned int v6 = HIWORD(v5);
        if (v5 < 0x10000 || v6 > (unsigned __int16)word_268C8E934) {
          break;
        }
        if (!--v1)
        {
          int v8 = determineVACVoltage_vacBasedVoltageMV;
          if (determineVACVoltage_vacBasedVoltageMV) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      int v8 = v4;
      if (v4) {
        goto LABEL_17;
      }
LABEL_16:
      int v8 = LOWORD(updateThread_batteryInfo[dword_268C8EA80 + 104]);
LABEL_17:
      determineVACVoltage_vacBasedVoltageMV = v8;
      unsigned int v9 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 67109120;
        int v38 = v8;
        _os_log_impl(&dword_2406CC000, v9, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vacBasedVoltageMV=%d", (uint8_t *)&v37, 8u);
        int v8 = determineVACVoltage_vacBasedVoltageMV;
      }
      if (v0) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v8 == 0;
      }
      if (!v10) {
        unsigned int v0 = v8;
      }
    }
  }
  uint64_t v11 = dword_268C8EAC4;
  if (dword_268C8EAC4 && (unsigned __int16)word_268C8E906 >= 0x313u)
  {
    unsigned __int8 v12 = word_268C8E96E;
    if ((unsigned __int16)word_268C8E906 <= 0x500u) {
      __int16 v13 = word_268C8E96E;
    }
    else {
      __int16 v13 = word_268C8E96C;
    }
    unint64_t v14 = (unsigned __int8 *)&word_268C8E96E + 1;
    if ((unsigned __int16)word_268C8E906 > 0x500u) {
      unint64_t v14 = (unsigned __int8 *)&word_268C8E96C + 1;
    }
    unsigned __int16 v15 = *v14 | (unsigned __int16)(v13 << 8);
    if ((unsigned __int16)word_268C8E906 <= 0x500u) {
      unsigned __int8 v12 = byte_268C8E970;
    }
    if (v12 && v15 != 0)
    {
      if (determineVACVoltage_lastTimeAbove95 != v12
        || ((unsigned __int16)determineVACVoltage_lastToT == v15 ? (BOOL v17 = v0 == 0) : (BOOL v17 = 1), v17))
      {
        determineVACVoltage_lastTimeAbove95 = v12;
        determineVACVoltage_lastToT = v15;
        unint64_t v18 = (42949673 * (unint64_t)(v12 * v15)) >> 32;
        time_t v19 = &dword_268C8EAC8;
        while (1)
        {
          unsigned int v21 = *v19++;
          unsigned __int16 v20 = v21;
          unsigned int v22 = HIWORD(v21);
          if (v21 < 0x10000 || v18 < v22) {
            break;
          }
          if (!--v11)
          {
            int v24 = determineVACVoltage_vac95BasedVoltageMV;
            if (determineVACVoltage_vac95BasedVoltageMV) {
              goto LABEL_54;
            }
            goto LABEL_53;
          }
        }
        int v24 = v20;
        if (v20) {
          goto LABEL_54;
        }
LABEL_53:
        int v24 = LOWORD(updateThread_batteryInfo[dword_268C8EAC4 + 121]);
LABEL_54:
        determineVACVoltage_vac95BasedVoltageMV = v24;
        CFNumberRef v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 67109376;
          int v38 = v24;
          __int16 v39 = 1024;
          unsigned int v40 = v0;
          _os_log_impl(&dword_2406CC000, v25, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vac95BasedVoltageMV=%d absMaxVoltageMV=%d", (uint8_t *)&v37, 0xEu);
          int v24 = determineVACVoltage_vac95BasedVoltageMV;
        }
        if (v0) {
          BOOL v26 = 1;
        }
        else {
          BOOL v26 = v24 == 0;
        }
        if (!v26) {
          unsigned int v0 = v24;
        }
      }
    }
  }
  unsigned int v27 = determineVACVoltage_vacBasedVoltageMV;
  if (determineVACVoltage_vacBasedVoltageMV >= v0 || determineVACVoltage_vacBasedVoltageMV == 0) {
    unsigned int v27 = v0;
  }
  if (determineVACVoltage_vac95BasedVoltageMV >= v27 || determineVACVoltage_vac95BasedVoltageMV == 0) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = determineVACVoltage_vac95BasedVoltageMV;
  }
  uint64_t v31 = dword_268C8E928;
  int v32 = word_268C8E90A;
  if (dword_268C8E928) {
    BOOL v33 = v30 >= word_268C8E90A;
  }
  else {
    BOOL v33 = 1;
  }
  if (v33) {
    return v30;
  }
  int v34 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 67109376;
    int v38 = v32;
    __int16 v39 = 1024;
    unsigned int v40 = v30;
    _os_log_impl(&dword_2406CC000, v34, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: waiting for vbat(%d) < vac(%d)", (uint8_t *)&v37, 0xEu);
    return dword_268C8E928;
  }
  return v31;
}

uint64_t determinePoSMThreshold()
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if ((unsigned __int16)word_268C8E906 <= 0x500u)
  {
    if ((unsigned __int16)word_268C8E906 < 0x313u) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v2 = &word_268C8E96E;
    unsigned int v0 = (__int16 *)&byte_268C8E970;
    uint64_t v1 = (unsigned __int8 *)&word_268C8E96E + 1;
  }
  else
  {
    unsigned int v0 = &word_268C8E96E;
    uint64_t v1 = (unsigned __int8 *)&word_268C8E96C + 1;
    uint64_t v2 = &word_268C8E96C;
  }
  unsigned int v3 = *v1 | (*(unsigned __int8 *)v2 << 8);
  unsigned int v4 = *(unsigned __int8 *)v0;
  int v5 = (unsigned __int16)dword_268C8EB0C;
  BOOL v6 = (unsigned __int16)dword_268C8EB0C != 0;
  int v7 = (unsigned __int16)word_268C8EB10;
  BOOL v8 = word_268C8EB10 != 0;
  int v9 = (unsigned __int16)word_268C8EB18;
  BOOL v10 = word_268C8EB18 != 0;
  BOOL v11 = determinePoSMThreshold_lastBatteryCycleCount != (unsigned __int16)word_268C8E934
     && (unsigned __int16)dword_268C8EB0C != 0;
  BOOL v12 = (unsigned __int16)determinePoSMThreshold_lastToT != v3 && word_268C8EB10 != 0;
  BOOL v13 = determinePoSMThreshold_lastAbove95 != v4
     || (unsigned __int16)determinePoSMThreshold_lastToT != v3;
  BOOL v14 = determinePoSMThreshold_lastAbove95 != v4 && word_268C8EB18 != 0;
  BOOL v32 = v11;
  BOOL v33 = v14;
  int v15 = (unsigned __int16)dword_268C8EB14;
  BOOL v31 = (unsigned __int16)dword_268C8EB14 != 0;
  if ((_WORD)dword_268C8EB14) {
    BOOL v16 = v13;
  }
  else {
    BOOL v16 = 0;
  }
  if (v11)
  {
    determinePoSMThreshold_lastBatteryCycleCount = (unsigned __int16)word_268C8E934;
    if ((unsigned __int16)word_268C8E934 <= HIWORD(dword_268C8EB0C)) {
      int v17 = -1;
    }
    else {
      int v17 = dword_268C8EB1C;
    }
    determinePoSMThreshold_vacThreshold = v17;
  }
  if (v12)
  {
    determinePoSMThreshold_lastToT = v3;
    if (v3 <= HIWORD(*(_DWORD *)&word_268C8EB10)) {
      int v18 = -1;
    }
    else {
      int v18 = dword_268C8EB20;
    }
    determinePoSMThreshold_vacpThreshold = v18;
  }
  if (v16)
  {
    determinePoSMThreshold_lastToT = v3;
    determinePoSMThreshold_lastAbove95 = v4;
    if ((42949673 * (unint64_t)(v4 * v3)) >> 32 <= HIWORD(dword_268C8EB14)) {
      int v19 = -1;
    }
    else {
      int v19 = dword_268C8EB24;
    }
    determinePoSMThreshold_vac95Threshold = v19;
  }
  int v34 = (unsigned __int16)word_268C8E934;
  if (word_268C8EB18)
  {
    determinePoSMThreshold_lastAbove95 = v4;
    if (v4 <= HIWORD(*(_DWORD *)&word_268C8EB18))
    {
      unint64_t v21 = 0x268C8E000uLL;
      unsigned int v20 = -1;
    }
    else
    {
      unsigned int v20 = dword_268C8EB28;
      unint64_t v21 = 0x268C8E000;
    }
    *(_DWORD *)(v21 + 2988) = v20;
  }
  else
  {
    unsigned int v20 = determinePoSMThreshold_vac95pThreshold;
  }
  if (determinePoSMThreshold_vacThreshold == -1 || v5 == 0) {
    unsigned int v24 = -1;
  }
  else {
    unsigned int v24 = determinePoSMThreshold_vacThreshold;
  }
  if (determinePoSMThreshold_vacpThreshold >= v24 || v7 == 0) {
    unsigned int v26 = v24;
  }
  else {
    unsigned int v26 = determinePoSMThreshold_vacpThreshold;
  }
  if (determinePoSMThreshold_vac95Threshold < v26 && v15 != 0) {
    unsigned int v26 = determinePoSMThreshold_vac95Threshold;
  }
  if (v20 >= v26 || v9 == 0) {
    uint64_t v22 = v26;
  }
  else {
    uint64_t v22 = v20;
  }
  CFBooleanRef v29 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v36 = v6;
    __int16 v37 = 1024;
    int v38 = v8;
    __int16 v39 = 1024;
    int v40 = v31;
    __int16 v41 = 1024;
    int v42 = v10;
    _os_log_impl(&dword_2406CC000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, enabled:%d %d %d %d ", buf, 0x1Au);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v36 = v32;
    __int16 v37 = 1024;
    int v38 = v12;
    __int16 v39 = 1024;
    int v40 = v16;
    __int16 v41 = 1024;
    int v42 = v33;
    _os_log_impl(&dword_2406CC000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, changed:%d %d %d %d ", buf, 0x1Au);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    BOOL v36 = v34;
    __int16 v37 = 1024;
    int v38 = HIWORD(dword_268C8EB0C);
    __int16 v39 = 1024;
    int v40 = v3;
    __int16 v41 = 1024;
    int v42 = (unsigned __int16)word_268C8EB12;
    __int16 v43 = 1024;
    int v44 = (42949673 * (unint64_t)(v4 * v3)) >> 32;
    __int16 v45 = 1024;
    int v46 = HIWORD(dword_268C8EB14);
    __int16 v47 = 1024;
    unsigned int v48 = v4;
    __int16 v49 = 1024;
    int v50 = (unsigned __int16)word_268C8EB1A;
    _os_log_impl(&dword_2406CC000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, cmp:%d>%u %d>%u %d>%u %d>%u", buf, 0x32u);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    BOOL v36 = v22;
    __int16 v37 = 1024;
    int v38 = determinePoSMThreshold_vacThreshold;
    __int16 v39 = 1024;
    int v40 = determinePoSMThreshold_vacpThreshold;
    __int16 v41 = 1024;
    int v42 = determinePoSMThreshold_vac95Threshold;
    __int16 v43 = 1024;
    int v44 = determinePoSMThreshold_vac95pThreshold;
    _os_log_impl(&dword_2406CC000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold,minThreshold=%u threshold:%u %u %u %u", buf, 0x20u);
  }
  return v22;
}

CFDictionaryRef parseBatteryData(int a1, int a2)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  *(void *)&valuePtr[4] = 0;
  uint64_t v121 = 0;
  long long v120 = 0u;
  long long v119 = 0u;
  long long v118 = 0u;
  long long v117 = 0u;
  long long v116 = 0u;
  long long v115 = 0u;
  long long v114 = 0u;
  long long v113 = 0u;
  long long v112 = 0u;
  long long v111 = 0u;
  long long v110 = 0u;
  long long v109 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v106 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v107 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)updateThread_batteryInfo, 32);
  v93[0] = @"MfgData";
  v108[0] = createStringWithBytes((UInt8 *)updateThread_batteryInfo, 0x12uLL);
  v93[1] = @"Serial";
  *(void *)int valuePtr = word_268C8E902;
  v108[1] = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
  v93[2] = @"DesignCapacity";
  int v64 = (unsigned __int16)word_268C8E936;
  values = CFNumberCreate(v4, kCFNumberIntType, &v64);
  if (values)
  {
    *(void *)&long long v109 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    *(void *)&long long v94 = @"Qmax";
    CFRelease(values);
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 3;
  }
  int v63 = word_268C8E90C;
  v108[v5 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v63);
  v93[v5] = @"MaxCapacity";
  int v62 = (unsigned __int16)word_268C8E934;
  CFNumberRef v6 = CFNumberCreate(v4, kCFNumberIntType, &v62);
  uint64_t v7 = 8 * v5 + 8;
  *(void *)((char *)&v108[-1] + v7) = v6;
  *(void **)((char *)v93 + v7) = @"CycleCount";
  int v61 = (unsigned __int16)word_268C8E938;
  CFNumberRef v8 = CFNumberCreate(v4, kCFNumberIntType, &v61);
  uint64_t v9 = 8 * v5 + 16;
  *(void *)((char *)&v108[-1] + v9) = v8;
  *(void **)((char *)v93 + v9) = @"StateOfCharge";
  int v60 = word_268C8E90A;
  CFNumberRef v10 = CFNumberCreate(v4, kCFNumberIntType, &v60);
  uint64_t v11 = 8 * v5 + 24;
  *(void *)((char *)&v108[-1] + v11) = v10;
  *(void **)((char *)v93 + v11) = @"Voltage";
  int v59 = (unsigned __int16)word_268C8E93A;
  CFNumberRef v12 = CFNumberCreate(v4, kCFNumberIntType, &v59);
  uint64_t v13 = 8 * v5 + 32;
  *(void *)((char *)&v108[-1] + v13) = v12;
  *(void **)((char *)v93 + v13) = @"Flags";
  CFStringRef StringWithBytes = createStringWithBytes((UInt8 *)updateThread_batteryInfo + 2, 4uLL);
  uint64_t v15 = 8 * v5 + 40;
  *(void *)((char *)&v108[-1] + v15) = StringWithBytes;
  *(void **)((char *)v93 + v15) = @"ManufactureDate";
  __int16 v58 = word_268C8E900;
  CFNumberRef v16 = CFNumberCreate(v4, kCFNumberSInt16Type, &v58);
  uint64_t v17 = 8 * v5 + 48;
  *(void *)((char *)&v108[-1] + v17) = v16;
  *(void **)((char *)v93 + v17) = @"ChemID";
  uint64_t v18 = v5 + 7;
  if (word_268C8E906 != 1536)
  {
    int v57 = (unsigned __int16)word_268C8E93C;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v57);
    v93[v18] = @"FullAvailableCapacity";
    uint64_t v18 = v5 | 8;
    if ((unsigned __int16)word_268C8E906 < 0x313u) {
      goto LABEL_20;
    }
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v125 = 0;
  time_t v92 = time(0);
  keys[0] = @"UpdateTime";
  v126[0] = CFNumberCreate(v4, kCFNumberLongType, &v92);
  keys[1] = @"MaximumTemperature";
  int v91 = (__int16)(byte_268C8E93E << 8) | byte_268C8E93F;
  v126[1] = CFNumberCreate(v4, kCFNumberIntType, &v91);
  keys[2] = @"MinimumTemperature";
  int v90 = (__int16)(byte_268C8E940 << 8) | byte_268C8E941;
  v126[2] = CFNumberCreate(v4, kCFNumberIntType, &v90);
  keys[3] = @"MaximumPackVoltage";
  int v89 = (__int16)(byte_268C8E942 << 8) | byte_268C8E943;
  v126[3] = CFNumberCreate(v4, kCFNumberIntType, &v89);
  keys[4] = @"MinimumPackVoltage";
  int v88 = (__int16)(byte_268C8E944 << 8) | byte_268C8E945;
  v126[4] = CFNumberCreate(v4, kCFNumberIntType, &v88);
  keys[5] = @"MaximumChargeCurrent";
  int v87 = (__int16)(byte_268C8E946 << 8) | byte_268C8E947;
  v126[5] = CFNumberCreate(v4, kCFNumberIntType, &v87);
  keys[6] = @"MaximumDischargeCurrent";
  int v86 = (__int16)(byte_268C8E948 << 8) | byte_268C8E949;
  v126[6] = CFNumberCreate(v4, kCFNumberIntType, &v86);
  keys[7] = @"MaximumOverChargedCapacity";
  int v85 = (__int16)(byte_268C8E94A << 8) | byte_268C8E94B;
  v126[7] = CFNumberCreate(v4, kCFNumberIntType, &v85);
  keys[8] = @"MaximumOverDischargedCapacity";
  int v84 = (__int16)(byte_268C8E94C << 8) | byte_268C8E94D;
  v126[8] = CFNumberCreate(v4, kCFNumberIntType, &v84);
  keys[9] = @"MaximumFCC";
  int v83 = (__int16)(byte_268C8E94E << 8) | byte_268C8E94F;
  v126[9] = CFNumberCreate(v4, kCFNumberIntType, &v83);
  keys[10] = @"MinimumFCC";
  int v82 = (__int16)(byte_268C8E950 << 8) | byte_268C8E951;
  v126[10] = CFNumberCreate(v4, kCFNumberIntType, &v82);
  keys[11] = @"MaximumDeltaVoltage";
  int v81 = (__int16)(byte_268C8E952 << 8) | byte_268C8E953;
  v126[11] = CFNumberCreate(v4, kCFNumberIntType, &v81);
  keys[12] = @"MinimumDeltaVoltage";
  int v80 = (__int16)(byte_268C8E954 << 8) | byte_268C8E955;
  v126[12] = CFNumberCreate(v4, kCFNumberIntType, &v80);
  keys[13] = @"LowAvgCurrentLastRun";
  int v79 = (__int16)(byte_268C8E956 << 8) | byte_268C8E957;
  v126[13] = CFNumberCreate(v4, kCFNumberIntType, &v79);
  keys[14] = @"HighAvgCurrentLastRun";
  int v78 = (__int16)(byte_268C8E958 << 8) | byte_268C8E959;
  v126[14] = CFNumberCreate(v4, kCFNumberIntType, &v78);
  keys[15] = @"MaximumQmax";
  int v77 = (__int16)(byte_268C8E95A << 8) | byte_268C8E95B;
  v126[15] = CFNumberCreate(v4, kCFNumberIntType, &v77);
  keys[16] = @"MinimumQmax";
  int v76 = (__int16)(byte_268C8E95C << 8) | byte_268C8E95D;
  v126[16] = CFNumberCreate(v4, kCFNumberIntType, &v76);
  keys[17] = @"MaximumRa0-8";
  int v75 = (__int16)(byte_268C8E95E << 8) | byte_268C8E95F;
  v126[17] = CFNumberCreate(v4, kCFNumberIntType, &v75);
  keys[18] = @"MinimumRa0-8";
  int v74 = (__int16)(byte_268C8E960 << 8) | byte_268C8E961;
  v126[18] = CFNumberCreate(v4, kCFNumberIntType, &v74);
  keys[19] = @"AverageTemperature";
  int v73 = byte_268C8E962;
  v126[19] = CFNumberCreate(v4, kCFNumberIntType, &v73);
  keys[20] = @"TemperatureSamples";
  unsigned int v72 = bswap32(unk_268C8E963);
  v126[20] = CFNumberCreate(v4, kCFNumberIntType, &v72);
  keys[21] = @"FlashWriteCount";
  unsigned int v71 = __rev16(unk_268C8E967);
  *(void *)&long long v127 = CFNumberCreate(v4, kCFNumberIntType, &v71);
  *(void *)&long long v123 = @"RDISCnt";
  unsigned int v70 = __rev16(unk_268C8E969);
  *((void *)&v127 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v70);
  *((void *)&v123 + 1) = @"CycleCountLastQmax";
  int v69 = byte_268C8E96B;
  *(void *)&long long v128 = CFNumberCreate(v4, kCFNumberIntType, &v69);
  if ((unsigned __int16)word_268C8E906 < 0x501u)
  {
    if ((unsigned __int16)word_268C8E906 < 0x313u)
    {
      uint64_t v22 = 24;
      goto LABEL_12;
    }
    int v19 = &word_268C8E96E;
  }
  else
  {
    int v19 = &word_268C8E96C;
  }
  unsigned int v20 = __rev16((unsigned __int16)*v19);
  *(void *)&long long v124 = @"TotalOperatingTime";
  unsigned int v68 = v20;
  *((void *)&v128 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v68);
  int v21 = *((unsigned __int8 *)v19 + 2);
  *((void *)&v124 + 1) = @"TimeAbove95Perc";
  int v67 = v21;
  *(void *)&long long v129 = CFNumberCreate(v4, kCFNumberIntType, &v67);
  uint64_t v22 = 26;
LABEL_12:
  keys[v22] = @"Raw";
  v126[v22] = CFDataCreate(v4, (const UInt8 *)&byte_268C8E93E, 64);
  CFDictionaryRef v23 = CFDictionaryCreate(v4, (const void **)keys, (const void **)v126, v22 | 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
  {
    CFRelease(v126[v22]);
    unint64_t v24 = v22-- + 1;
  }
  while (v24 > 1);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      parseBatteryData_cold_2();
      if (!a1) {
        goto LABEL_22;
      }
LABEL_21:
      int v56 = (unsigned __int16)word_268C8E918;
      v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v56);
      v93[v18] = @"ITMiscStatus";
      int v55 = word_268C8E918 & 3;
      CFNumberRef v25 = CFNumberCreate(v4, kCFNumberIntType, &v55);
      uint64_t v26 = 8 * v18 + 8;
      *(void *)((char *)&v108[-1] + v26) = v25;
      *(void **)((char *)v93 + v26) = @"ITSimulationCounter";
      v18 += 2;
      goto LABEL_22;
    }
LABEL_20:
    if (!a1) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a2) {
    CFShow(v23);
  }
  v108[v18 - 1] = v23;
  v93[v18++] = @"LifetimeData";
  if (a1) {
    goto LABEL_21;
  }
LABEL_22:
  if ((unsigned __int16)word_268C8E906 >= 0x600u)
  {
    *(void *)&valuePtr[4] = CFDataCreate(v4, (const UInt8 *)&word_268C8E97E, 32);
    if (*(void *)&valuePtr[4])
    {
      v108[v18 - 1] = CFArrayCreate(v4, (const void **)&valuePtr[4], 1, MEMORY[0x263EFFF70]);
      v93[v18++] = @"RaTableRaw";
      CFRelease(*(CFTypeRef *)&valuePtr[4]);
    }
    int v54 = (unsigned __int16)word_268C8E9D4;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v54);
    v93[v18] = @"WeightedRa";
    int v53 = (unsigned __int16)word_268C8E9D6;
    CFNumberRef v27 = CFNumberCreate(v4, kCFNumberIntType, &v53);
    uint64_t v28 = 8 * v18 + 8;
    *(void *)((char *)&v108[-1] + v28) = v27;
    *(void **)((char *)v93 + v28) = @"ChemicalWeightedRa";
    int v52 = dword_268C8E9D0;
    CFNumberRef v29 = CFNumberCreate(v4, kCFNumberIntType, &v52);
    uint64_t v30 = 8 * v18 + 16;
    *(void *)((char *)&v108[-1] + v30) = v29;
    *(void **)((char *)v93 + v30) = @"BatteryHealthMetric";
    uint64_t v31 = v18 + 3;
    if ((unsigned __int16)word_268C8E906 < 0x600u)
    {
      v18 += 3;
    }
    else
    {
      v108[v31 - 1] = CFDataCreate(v4, byte_268C8E99E, 32);
      v93[v31] = @"iMaxAndSocSmoothTable";
      unsigned int v51 = __rev16(*(unsigned __int16 *)&byte_268C8E99E[1]);
      CFNumberRef v32 = CFNumberCreate(v4, kCFNumberIntType, &v51);
      uint64_t v33 = 8 * v18 + 32;
      *(void *)((char *)&v108[-1] + v33) = v32;
      *(void **)((char *)v93 + v33) = @"RSS";
      v18 += 5;
    }
  }
  int v50 = (unsigned __int16)word_268C8E91C;
  v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v50);
  v93[v18] = @"ResScale";
  int v49 = word_268C8E91E;
  CFNumberRef v34 = CFNumberCreate(v4, kCFNumberIntType, &v49);
  uint64_t v35 = 8 * v18 + 8;
  *(void *)((char *)&v108[-1] + v35) = v34;
  *(void **)((char *)v93 + v35) = @"Qstart";
  int v48 = word_268C8E920;
  CFNumberRef v36 = CFNumberCreate(v4, kCFNumberIntType, &v48);
  uint64_t v37 = 8 * v18 + 16;
  *(void *)((char *)&v108[-1] + v37) = v36;
  *(void **)((char *)v93 + v37) = @"PassedCharge";
  uint64_t v38 = v18 + 3;
  int v47 = (unsigned __int16)word_268C8E922;
  values = CFNumberCreate(v4, kCFNumberIntType, &v47);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    v93[v38] = @"DOD0";
    uint64_t v38 = v18 + 4;
    CFRelease(values);
  }
  int v46 = word_268C8E91A;
  values = CFNumberCreate(v4, kCFNumberIntType, &v46);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    v93[v38++] = @"PresentDOD";
    CFRelease(values);
  }
  int v45 = (unsigned __int16)word_268C8E93A;
  v108[v38 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v45);
  v93[v38] = @"GaugeFlagRaw";
  uint64_t v44 = gauge_reset_count;
  CFNumberRef v39 = CFNumberCreate(v4, kCFNumberLongLongType, &v44);
  uint64_t v40 = 8 * v38 + 8;
  *(void *)((char *)&v108[-1] + v40) = v39;
  *(void **)((char *)v93 + v40) = @"GaugeResetCounter";
  if (v38 >= 27) {
    parseBatteryData_cold_1();
  }
  CFDictionaryRef v41 = CFDictionaryCreate(v4, (const void **)v93, (const void **)&v107, v38 + 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v38 >= -1)
  {
    do
    {
      CFRelease((CFTypeRef)v108[v38]);
      unint64_t v42 = v38 + 2;
      --v38;
    }
    while (v42 > 1);
  }
  return v41;
}

__darwin_time_t UpSeconds()
{
  if (!UpSeconds_boottime)
  {
    v1.tv_sec = 16;
    sysctlbyname("kern.boottime", &UpSeconds_boottime, (size_t *)&v1, 0, 0);
  }
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec - UpSeconds_boottime;
}

CFStringRef createStringWithBytes(UInt8 *bytes, unint64_t a2)
{
  unint64_t v2 = 0;
  if (a2)
  {
    unsigned int v3 = 1;
    do
    {
      if (!bytes[v2]) {
        break;
      }
      unint64_t v2 = v3++;
    }
    while (v2 < a2);
  }
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
}

uint64_t GGHIDQueryInterface(uint64_t a1, CFUUIDBytes a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  int v8 = CFEqual(v5, v7);
  uint64_t v9 = v4;
  if (!v8)
  {
    CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    int v11 = CFEqual(v5, v10);
    uint64_t v9 = v4;
    if (!v11)
    {
      CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(v6, 0x6Fu, 0xE2u, 0x2Au, 0xBFu, 0x68u, 0xB9u, 0x11u, 0xDBu, 0xA7u, 0x1Fu, 0, 0x16u, 0xCBu, 0xC1u, 0x10u, 0xF7u);
      if (!CFEqual(v5, v12))
      {
        uint64_t v13 = 2147483652;
        goto LABEL_6;
      }
      uint64_t v9 = v4 + 16;
    }
  }
  uint64_t v13 = 0;
  *a3 = v9;
  ++*(_DWORD *)(v4 + 40);
LABEL_6:
  CFRelease(v5);
  return v13;
}

uint64_t GGHIDAddRef(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t result = (*(_DWORD *)(v1 + 40) + 1);
  *(_DWORD *)(v1 + 40) = result;
  return result;
}

uint64_t GGHIDRelease(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  int v2 = *(_DWORD *)(v1 + 40);
  uint64_t v3 = (v2 - 1);
  *(_DWORD *)(v1 + 40) = v3;
  if (v2 == 1)
  {
    CFUUIDRef v4 = *(const __CFUUID **)(v1 + 32);
    GGHIDStop(a1);
    free((void *)v1);
    CFPlugInRemoveInstanceForFactory(v4);
    CFRelease(v4);
  }
  return v3;
}

uint64_t GGHIDProbe(int a1, int a2, io_object_t object)
{
  if (!object) {
    return 3758097090;
  }
  if (!IOObjectConformsTo(object, "AppleHDQGasGaugeControl")) {
    return 3758097090;
  }
  memset(&v4, 0, sizeof(v4));
  uint64_t result = stat("/dev/cu.gas-gauge", &v4);
  if (result) {
    return 3758097090;
  }
  return result;
}

uint64_t GGHIDStart(uint64_t a1, int a2, io_service_t service)
{
  uint64_t v3 = *(void *)(a1 + 8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  stat v4 = (io_connect_t *)(v3 + 44);
  uint64_t v5 = IOServiceOpen(service, *MEMORY[0x263EF8960], 0, (io_connect_t *)(v3 + 44));
  if (v5)
  {
    uint64_t v6 = v5;
LABEL_5:
    *stat v4 = 0;
    return v6;
  }
  mach_port_t v7 = *v4;
  size_t outputStructCnt = 352;
  uint64_t v6 = IOConnectCallStructMethod(v7, 2u, 0, 0, v10, &outputStructCnt);
  if (v6)
  {
    IOServiceClose(*v4);
    goto LABEL_5;
  }
  int v9 = DWORD2(v11);
  if (DWORD2(v11) == -1) {
    int v9 = 1413951554;
  }
  LODWORD(outputStructCnt) = v9;
  *(void *)(v3 + 48) = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &outputStructCnt);
  *(_DWORD *)(v3 + 72) = DWORD2(v12);
  return v6;
}

uint64_t GGHIDStop(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  io_connect_t v2 = *(_DWORD *)(v1 + 44);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(v1 + 44) = 0;
  }
  uint64_t v3 = *(const void **)(v1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(v1 + 48) = 0;
  }
  return 0;
}

CFDictionaryRef GGHIDCopyProperty(uint64_t a1, CFTypeRef cf1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  if (CFEqual(cf1, @"ServicePluginDebug"))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    values[0] = @"AppleHDQGasGaugeHID";
    keys[0] = @"PluginName";
    keys[1] = @"TemperatureEventCnt";
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    values[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, (const void *)(v3 + 88));
    keys[2] = @"TemperatureEventFailCnt";
    values[2] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 96));
    keys[3] = @"TemperatureEventConsFailCnt";
    values[3] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 104));
    keys[4] = @"LastCalledTs";
    values[4] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 112));
    keys[5] = @"LastErrTs";
    values[5] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 120));
    keys[6] = @"LastSuccessTs";
    values[6] = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(v3 + 128));
    uint64_t v5 = *(const void **)(v3 + 136);
    if (v5)
    {
      *(void *)&long long v16 = @"ErrorHistory";
      *(void *)&long long v19 = v5;
      CFRetain(v5);
      uint64_t v6 = 8;
    }
    else
    {
      uint64_t v6 = 7;
    }
    int v8 = *(void **)(v3 + 144);
    if (v8)
    {
      keys[v6] = @"ErrorCounts";
      values[v6] = v8;
      CFRetain(v8);
      ++v6;
    }
    keys[v6] = @"ErrorInjection";
    if (*(unsigned char *)(v3 + 76)) {
      int v9 = (const void **)MEMORY[0x263EFFB40];
    }
    else {
      int v9 = (const void **)MEMORY[0x263EFFB38];
    }
    CFUUIDRef v10 = *v9;
    values[v6] = (void *)*v9;
    CFRetain(v10);
    uint64_t v11 = v6 + 1;
    keys[v6 + 1] = @"ErrorInjectionCode";
    values[v6 + 1] = CFNumberCreate(v4, kCFNumberSInt32Type, (const void *)(v3 + 80));
    CFDictionaryRef v12 = CFDictionaryCreate(v4, (const void **)keys, (const void **)values, v6 + 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    do
    {
      CFRelease(values[v11]);
      unint64_t v13 = v11-- + 1;
    }
    while (v13 > 1);
  }
  else
  {
    if (CFEqual(cf1, @"PrimaryUsagePage")) {
      CFDictionaryRef v7 = *(const __CFDictionary **)(v3 + 56);
    }
    else {
      CFDictionaryRef v7 = 0;
    }
    if (CFEqual(cf1, @"PrimaryUsage")) {
      CFDictionaryRef v7 = *(const __CFDictionary **)(v3 + 64);
    }
    if (CFEqual(cf1, @"LocationID")) {
      CFDictionaryRef v7 = *(const __CFDictionary **)(v3 + 48);
    }
    if (CFEqual(cf1, @"Product")) {
      CFDictionaryRef v12 = (CFDictionaryRef)@"gas gauge battery";
    }
    else {
      CFDictionaryRef v12 = v7;
    }
    if (v12) {
      CFRetain(v12);
    }
  }
  return v12;
}

uint64_t GGHIDSetProperty(uint64_t a1, CFTypeRef cf1, const __CFNumber *a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  if (CFEqual(cf1, @"ErrorInjectionCode"))
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (a3 && CFGetTypeID(a3) == TypeID)
    {
      CFNumberGetValue(a3, kCFNumberSInt32Type, (void *)(v5 + 80));
      return 1;
    }
  }
  else
  {
    uint64_t result = CFEqual(cf1, @"ErrorInjection");
    if (!result) {
      return result;
    }
    CFTypeID v8 = CFBooleanGetTypeID();
    if (a3)
    {
      if (CFGetTypeID(a3) == v8)
      {
        BOOL v9 = *MEMORY[0x263EFFB40] == (void)a3;
      }
      else
      {
        CFTypeID v10 = CFNumberGetTypeID();
        if (CFGetTypeID(a3) != v10) {
          return 0;
        }
        int valuePtr = 0;
        CFNumberGetValue(a3, kCFNumberSInt32Type, &valuePtr);
        BOOL v9 = valuePtr != 0;
      }
      *(unsigned char *)(v5 + 76) = v9;
      return 1;
    }
    CFNumberGetTypeID();
  }
  return 0;
}

uint64_t GGHIDCopyEvent(uint64_t a1, int a2)
{
  kern_return_t v5;
  BOOL v6;
  mach_port_t v7;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  CFAllocatorRef *v11;
  CFArrayRef Mutable;
  CFNumberRef v13;
  CFNumberRef v14;
  uint64_t v15;
  uint64_t v16;
  CFAllocatorRef v17;
  CFStringRef v18;
  CFStringRef v19;
  CFNumberRef Value;
  int v21;
  CFNumberRef v22;
  CFNumberRef v23;
  NSObject *v24;
  NSObject *v25;
  mach_port_t v26;
  kern_return_t v27;
  kern_return_t v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t input;
  timespec __tp;
  uint32_t outputCnt;
  int v42;
  kern_return_t valuePtr;
  uint64_t output;
  unsigned char __str[12];
  __int16 v46;
  unsigned char v47[28];
  uint64_t v48;

  int v48 = *MEMORY[0x263EF8340];
  if (a2 == 15)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    uint32_t outputCnt = 1;
    uint64_t output = 0;
    __tp.tv_sec = 0;
    __tp.tv_nsec = 0;
    if (!clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp)) {
      *(void *)(v2 + 112) = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
    }
    uint64_t v3 = *(void *)(v2 + 88);
    if (v3 != -1) {
      *(void *)(v2 + 88) = v3 + 1;
    }
    if (*(_DWORD *)(v2 + 72))
    {
      mach_port_t v4 = *(_DWORD *)(v2 + 44);
      uint64_t input = 0;
      uint64_t v5 = IOConnectCallScalarMethod(v4, 0x10u, &input, 1u, 0, 0);
      uint64_t v6 = v5 == -536870183 || v5 == 0;
      if (!v6 && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        GGHIDCopyEvent_cold_1();
      }
    }
    CFDictionaryRef v7 = *(_DWORD *)(v2 + 44);
    uint64_t v38 = 6;
    CFTypeID v8 = IOConnectCallScalarMethod(v7, 8u, &v38, 1u, &output, &outputCnt);
    if (*(unsigned char *)(v2 + 76)) {
      BOOL v9 = *(_DWORD *)(v2 + 80);
    }
    else {
      BOOL v9 = v8;
    }
    int valuePtr = v9;
    uint64_t v11 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
    if (v9)
    {
      Mutable = *(const __CFArray **)(v2 + 136);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 10, MEMORY[0x263EFFF70]);
        *(void *)(v2 + 136) = Mutable;
      }
      if (!*(void *)(v2 + 144))
      {
        *(void *)(v2 + 144) = CFDictionaryCreateMutable(*v11, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        Mutable = *(const __CFArray **)(v2 + 136);
      }
      *(void *)(v2 + 120) = *(void *)(v2 + 112);
      if (CFArrayGetCount(Mutable) >= 10) {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 136), 0);
      }
      if (*(void *)(v2 + 136))
      {
        unint64_t v13 = CFNumberCreate(*v11, kCFNumberIntType, &valuePtr);
        if (v13)
        {
          long long v14 = v13;
          CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 136), v13);
          CFRelease(v14);
        }
      }
      long long v15 = *(void *)(v2 + 96);
      if (v15 != -1) {
        *(void *)(v2 + 96) = v15 + 1;
      }
      long long v16 = *(void *)(v2 + 104);
      if (v16 != -1) {
        *(void *)(v2 + 104) = v16 + 1;
      }
      if (*(void *)(v2 + 144))
      {
        *(_DWORD *)&__str[7] = 0;
        *(void *)__str = 0;
        snprintf(__str, 0xBuLL, "%#x", valuePtr);
        long long v17 = *v11;
        long long v18 = CFStringCreateWithCString(*v11, __str, 0x8000100u);
        if (v18)
        {
          long long v19 = v18;
          unint64_t v42 = 0;
          int Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 144), v18);
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberIntType, &v42);
            uint64_t v21 = v42 + 1;
          }
          else
          {
            uint64_t v21 = 1;
          }
          unint64_t v42 = v21;
          long long v22 = CFNumberCreate(v17, kCFNumberIntType, &v42);
          if (v22)
          {
            long long v23 = v22;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2 + 144), v19, v22);
            CFRelease(v23);
          }
          CFRelease(v19);
        }
      }
      long long v24 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(v2 + 96);
        CFNumberRef v32 = *(void *)(v2 + 104);
        *(_DWORD *)__str = 136315906;
        *(void *)&__str[4] = "GGHID_log_error";
        int v46 = 1024;
        *(_DWORD *)int v47 = valuePtr;
        *(_WORD *)&v47[4] = 2048;
        *(void *)&v47[6] = v31;
        *(_WORD *)&v47[14] = 2048;
        *(void *)&v47[16] = v32;
        _os_log_error_impl(&dword_2406CC000, v24, OS_LOG_TYPE_ERROR, "%s: cannot read temperature: rc:%u cnt:%zu ccnt:%zu", __str, 0x26u);
      }
      if (*(void *)(v2 + 112) - *(void *)(v2 + 128) >= 0x9896801uLL)
      {
        CFNumberRef v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_FAULT))
        {
          uint64_t v33 = *(void *)(v2 + 96);
          CFNumberRef v34 = *(void *)(v2 + 104);
          uint64_t v35 = *(void *)(v2 + 136);
          CFNumberRef v36 = *(void *)(v2 + 144);
          *(_DWORD *)__str = 134218754;
          *(void *)&__str[4] = v33;
          int v46 = 2048;
          *(void *)int v47 = v34;
          *(_WORD *)&v47[8] = 2112;
          *(void *)&v47[10] = v35;
          *(_WORD *)&v47[18] = 2112;
          *(void *)&v47[20] = v36;
          _os_log_fault_impl(&dword_2406CC000, v25, OS_LOG_TYPE_FAULT, "cnt:%zu ccnt:%zu errs:%@ errCnts:%@", __str, 0x2Au);
        }
      }
      if (v9 == -536870183) {
        goto LABEL_52;
      }
      if (v9 == -536870163)
      {
LABEL_51:
        CFTypeID v10 = 0;
        gRestrictLogMessagesCounter = gRestrictLogCounter;
        return v10;
      }
    }
    else
    {
      *(void *)(v2 + 104) = 0;
      *(void *)(v2 + 128) = *(void *)(v2 + 112);
    }
    if (*(_DWORD *)(v2 + 72)
      && (uint64_t v26 = *(_DWORD *)(v2 + 44), v37 = 1, (v27 = IOConnectCallScalarMethod(v26, 0x10u, &v37, 1u, 0, 0)) != 0)
      && (uint64_t v28 = v27, v29 = logger, os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)__str = 136315650;
      *(void *)&__str[4] = "GGHID_GetTemperature";
      int v46 = 1024;
      *(_DWORD *)int v47 = 4343;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v28;
      _os_log_error_impl(&dword_2406CC000, v29, OS_LOG_TYPE_ERROR, "%s:%d cannot enable interrupts (%x)", __str, 0x18u);
      if (v9) {
        goto LABEL_51;
      }
    }
    else if (v9)
    {
      goto LABEL_51;
    }
LABEL_52:
    gRestrictLogMessagesCounter = 0;
    mach_absolute_time();
    CFTypeID v10 = IOHIDEventCreate();
    IOHIDEventSetFloatValue();
    return v10;
  }
  return 0;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void ggctl_connect_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "AppleHDQGasGaugeControl";
  _os_log_error_impl(&dword_2406CC000, log, OS_LOG_TYPE_ERROR, "could not find %s service", (uint8_t *)&v1, 0xCu);
}

void ggctl_connect_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ggctl_reset_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_2406CC000, v0, v1, "gas gauge: cannot issue a reset", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_1(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315394;
  uint64_t v5 = "checkreset";
  __int16 v6 = 2080;
  CFDictionaryRef v7 = v3;
  _os_log_error_impl(&dword_2406CC000, a1, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
}

void ggctl_open_device_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_2406CC000, v0, v1, "gas gauge: cannot determine the state of SWI line", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_2406CC000, v0, v1, "gas gauge: SWI line low, issuing reset", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2406CC000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
}

void logBatteryDiagnosticData_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 2373;
  v1[9] = 2080;
  uint64_t v2 = "IOPMPowerSource";
  _os_log_error_impl(&dword_2406CC000, v0, OS_LOG_TYPE_ERROR, "%s:%d cannot find service %s\n", (uint8_t *)v1, 0x1Cu);
}

void updateThread_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_2406CC000, v0, v1, "gasgauge: could not register for system power notifications", v2, v3, v4, v5, v6);
}

void updateThread_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_2406CC000, v2, (uint64_t)v2, "gasgauge: SWI line, cannot determine the state of line", v3);
}

void updateThread_cold_3(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = -1;
  _os_log_error_impl(&dword_2406CC000, log, OS_LOG_TYPE_ERROR, "cannot drain the data log (%d)", buf, 8u);
}

void updateThread_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_2406CC000, v2, (uint64_t)v2, "num_client<0, client error?", v3);
}

void updateThread_cold_5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_2406CC000, v2, (uint64_t)v2, "gasgauge: SWI line low reset disabled, ignoring", v3);
}

void updateThread_cold_6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_2406CC000, v2, (uint64_t)v2, "gasgauge: SWI line low issuing reset", v3);
}

void updateThread_cold_7()
{
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_9(&dword_2406CC000, v1, v2, "could not find hw.model: %s", v3, v4, v5, v6, 2u);
}

void updateThread_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_2406CC000, a2, a3, "gasgauge: could not register for battery events err=%x", a5, a6, a7, a8, 0);
}

void updateThread_cold_9(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_9(&dword_2406CC000, v1, v2, "gasgauge: could not map data log: %s", v3, v4, v5, v6, 2u);
}

void updateThread_cold_10()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_2406CC000, v0, v1, "gasgauge: could not register for power source events", v2, v3, v4, v5, v6);
}

void updateThermalCoolDownState_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_2406CC000, v0, v1, "%s:%d cannot update thermal state", v2, v3, v4, v5, 2u);
}

void statsAndLogs_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_2406CC000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
}

void statsAndLogs_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2406CC000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
}

void debugLog_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_2406CC000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
}

void debugLog_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2406CC000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
}

void dynamicATV_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void parseBatteryData_cold_1()
{
  __assert_rtn("parseBatteryData", "AppleHDQGasGauge.c", 1565, "batteryDataCount<=kNumBatteryDataUpdateKeys");
}

void parseBatteryData_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_2406CC000, v0, v1, "Cannot create the lifetime dictionary", v2, v3, v4, v5, v6);
}

void GGHIDCopyEvent_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2406CC000, v0, v1, "%s:%d cannot disable interrupts (%x)", v2, v3, v4, v5, 2u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50D8](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x270EF41F8]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x270EF43C8]();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x270EF4A58](*(void *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x270ED7C88]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t logLineForAppleCare()
{
  return MEMORY[0x270F24B78]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}