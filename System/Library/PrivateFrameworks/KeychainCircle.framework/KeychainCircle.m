uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_173);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_152);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], path);
  v5 = (task_port_t *)MEMORY[0x263EF8960];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x263EF8960], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  dispatch_queue_t result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t aks_create_bag(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t _create_bag(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  input[6] = *MEMORY[0x263EF8340];
  uint64_t v14 = 3758097084;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(aks_client_connection, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v14) {
        *a7 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_create_bag", ":", 187, "", 0, "", "");
  }
  return v14;
}

uint64_t aks_unload_bag(int a1)
{
  input[1] = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_bag", ":", 612, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t aks_save_bag()
{
  int v0 = MEMORY[0x270FA5388]();
  v2 = v1;
  io_service_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v7 = aks_client_connection;
    uint64_t result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v5;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!result)
        {
          v9 = calloc(__count, 1uLL);
          *io_service_t v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0;
            _DWORD *v2 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_save_bag", ":", 646, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  input[3] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_hold", ":", 1654, "", 0, "", "");
  return 3758097084;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_drop", ":", 1672, "", 0, "", "");
  return 3758097084;
}

void sub_218277504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2182783A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21827891C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

void sub_218278C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppleAccountLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264314A78;
    uint64_t v6 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AppleAccountLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ACAccountStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getACAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_218279D00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21827A2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CloudServicesLibraryCore()
{
  if (!CloudServicesLibraryCore_frameworkLibrary) {
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CloudServicesLibraryCore_frameworkLibrary;
}

uint64_t getSecureBackupIsGuitarfishEnabledSymbolLoc()
{
  uint64_t v3 = 0;
  io_service_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr;
  uint64_t v6 = getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr;
  if (!getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getSecureBackupIsGuitarfishEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_2643150C8;
    v2[4] = &v3;
    __getSecureBackupIsGuitarfishEnabledSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21827A474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_SecureBackupIsGuitarfishEnabled()
{
  IsGuitarfishEnabledSymbolLoc = (uint64_t (*)(void))getSecureBackupIsGuitarfishEnabledSymbolLoc();
  if (IsGuitarfishEnabledSymbolLoc)
  {
    return IsGuitarfishEnabledSymbolLoc();
  }
  else
  {
    dlerror();
    uint64_t v2 = abort_report_np();
    return __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_281(v2);
  }
}

void *__getSecureBackupIsGuitarfishEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CloudServicesLibraryCore();
  if (!v2)
  {
    io_service_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "SecureBackupIsGuitarfishEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21827AF1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Block_object_dispose((const void *)(v2 - 168), 8);
  _Block_object_dispose((const void *)(v2 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_21827B440(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21827BC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  objc_destroyWeak(v58);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Block_object_dispose((const void *)(v59 - 232), 8);
  objc_destroyWeak((id *)(v59 - 200));
  _Unwind_Resume(a1);
}

void sub_21827C668(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21827D094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21827D45C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21827E470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v70 - 192), 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  objc_destroyWeak((id *)(v70 - 232));
  _Unwind_Resume(a1);
}

void sub_21827EFB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2182805A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id location)
{
  objc_destroyWeak(v56);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218280E34(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_2182815E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218282430(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 216));
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2182831D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2182835E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v35 - 168), 8);
  _Block_object_dispose((const void *)(v35 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_218283E7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21828465C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v26);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v27 - 120), 8);
  objc_destroyWeak((id *)(v27 - 88));
  _Unwind_Resume(a1);
}

void sub_218284AC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218284F10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_21828543C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218285CDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_2182877EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218287DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2182882C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

uint64_t OTSupportOctagonMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  io_service_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL OTSponsorToApplicantRound2M2ReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  io_service_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21828BCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAAFAnalyticsTransportRTCClass_block_invoke(uint64_t a1)
{
  AAAFoundationLibrary();
  Class result = objc_getClass("AAFAnalyticsTransportRTC");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAFAnalyticsTransportRTCClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getAAFAnalyticsReporterClass_block_invoke(v3);
  }
  return result;
}

void __getAAFAnalyticsReporterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AAFAnalyticsReporter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAFAnalyticsReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    AAAFoundationLibrary();
  }
}

void AAAFoundationLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AAAFoundationLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AAAFoundationLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264314AE8;
    uint64_t v3 = 0;
    AAAFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (AAAFoundationLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __AAAFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AAAFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void derive_and_init(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF990] dataWithLength:*(void *)ccsha256_di()];
  [v6 length];
  id v8 = v6;
  [v8 bytes];

  [v5 length];
  id v9 = v5;
  [v9 bytes];

  [v7 length];
  id v12 = v7;
  uint64_t v11 = [v12 mutableBytes];
  if (!cchkdf())
  {
    id v10 = v12;
    objc_msgSend(v10, "bytes", v11);
    ccgcm_init();
    [v10 length];
    [v10 mutableBytes];
    cc_clear();
  }
}

void sub_21828DAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__362(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__363(uint64_t a1)
{
}

void sub_21828E2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t MetricsEnable()
{
  metricsAreEnabled = 0;
  return 1;
}

uint64_t MetricsDisable()
{
  metricsAreEnabled = 1;
  return 0;
}

uint64_t MetricsOverrideTestsAreEnabled()
{
  return metricsAreEnabled;
}

unint64_t decode_seq_string_data(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a4) {
    return 0;
  }
  uint64_t v9 = ccder_decode_constructed_tl();
  if (!v9 || a5)
  {
    KCJoiningErrorCreate(1, a3, @"decode failed", v10, v11, v12, v13, v14, v17);
    return 0;
  }
  else
  {
    unint64_t v15 = kcder_decode_string(a1, a3, v9, 0);
    return kcder_decode_data_internal(a2, 1, a3, v15, 0);
  }
}

unint64_t decode_seq_data_data(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a4) {
    return 0;
  }
  uint64_t v9 = ccder_decode_constructed_tl();
  if (!v9 || a5)
  {
    KCJoiningErrorCreate(1, a3, @"decode failed", v10, v11, v12, v13, v14, v17);
    return 0;
  }
  else
  {
    unint64_t v15 = kcder_decode_data_internal(a1, 1, a3, v9, 0);
    return kcder_decode_data_internal(a2, 1, a3, v15, 0);
  }
}

uint64_t sizeof_seq_string_data(void *a1, void *a2)
{
  id v3 = a2;
  [a1 lengthOfBytesUsingEncoding:4];
  uint64_t v4 = ccder_sizeof();
  if (v4)
  {
    [v3 length];
    if (ccder_sizeof_raw_octet_string()) {
      uint64_t v4 = ccder_sizeof();
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

uint64_t encode_seq_string_data(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  uint64_t v8 = kcder_encode_data(a2);
  kcder_encode_string(v7, a3, a4, v8);

  return ccder_encode_constructed_tl();
}

uint64_t sizeof_seq_data_data(void *a1, void *a2)
{
  id v3 = a2;
  [a1 length];
  uint64_t v4 = ccder_sizeof_raw_octet_string();
  if (v4)
  {
    [v3 length];
    if (ccder_sizeof_raw_octet_string()) {
      uint64_t v4 = ccder_sizeof();
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

uint64_t encode_seq_data_data(void *a1, void *a2)
{
  id v3 = a1;
  kcder_encode_data(a2);
  kcder_encode_data(v3);

  return ccder_encode_constructed_tl();
}

id extractStartFromInitialMessage(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a1;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = [v9 length];

  unint64_t v12 = v10 + v11;
  id v31 = 0;
  unint64_t v13 = decode_initialmessage(&v31, a5, v10, v12);
  id v14 = v31;
  unint64_t v15 = v14;
  if (!v13)
  {
    id v22 = 0;
    goto LABEL_17;
  }
  if (v13 != v12)
  {
    id v29 = 0;
    uint64_t v30 = 0;
    id v28 = 0;
    unint64_t v16 = decode_version2((uint64_t)v14, (uint64_t)&v29, &v28, &v30, a5, v13, v12);
    id v17 = v29;
    id v18 = v28;
    uint64_t v19 = v18;
    if (v16)
    {
      uint64_t v20 = v30;
      switch(v30)
      {
        case 0:
          *a2 = 0;
          goto LABEL_15;
        case 1:
LABEL_8:
          unint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", objc_msgSend(v17, "bytes"));
          *a3 = [v21 UUIDString];
          *a2 = v20;

LABEL_15:
          goto LABEL_16;
        case 2:
          *a4 = v18;
          goto LABEL_8;
      }
      v23 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      v24 = "unsupported version";
      v25 = v23;
      uint32_t v26 = 2;
    }
    else
    {
      v23 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v30;
      v24 = "decoding piggybacking message failed for version (%llu)";
      v25 = v23;
      uint32_t v26 = 12;
    }
    _os_log_impl(&dword_218274000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_14;
  }
LABEL_16:
  id v22 = v15;
LABEL_17:

  return v22;
}

unint64_t decode_initialmessage(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (!a3) {
    return 0;
  }
  if (!ccder_decode_constructed_tl() || a4)
  {
    unint64_t v13 = @"Decoding failed";
  }
  else
  {
    uint64_t v12 = ccder_decode_uint64();
    if (v12) {
      return kcder_decode_data_internal(a1, 1, a2, v12, a4);
    }
    unint64_t v13 = @"Version mising";
  }
  KCJoiningErrorCreate(1, a2, v13, v7, v8, v9, v10, v11, v15);
  return 0;
}

unint64_t decode_version2(uint64_t a1, uint64_t a2, id *a3, void *a4, void *a5, uint64_t a6, unint64_t a7)
{
  uint64_t v11 = decode_version1(a1, a2, (uint64_t)a4, a5, a6);
  if (!v11)
  {
    unint64_t v13 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      id v14 = "error parsing version 1";
      uint64_t v15 = (uint8_t *)&v21;
LABEL_16:
      _os_log_impl(&dword_218274000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_17:

    return 0;
  }
  if (v11 != a7)
  {
    unint64_t v12 = kcder_decode_data_internal(a3, 1, a5, v11, a7);
    if (v12)
    {
      a7 = v12;
      if (*a3 && [*a3 length])
      {
        *a4 = 2;
        return a7;
      }
      unint64_t v13 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        id v14 = "no octagon version set";
        uint64_t v15 = (uint8_t *)&v18;
        goto LABEL_16;
      }
    }
    else
    {
      unint64_t v13 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v19 = 0;
        id v14 = "failed to decode v2";
        uint64_t v15 = v19;
        goto LABEL_16;
      }
    }
    goto LABEL_17;
  }
  unint64_t v16 = secLogObjForScope("octagon");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v16, OS_LOG_TYPE_DEFAULT, "first message is piggybacking v1, no more data", buf, 2u);
  }

  return a7;
}

uint64_t decode_version1(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a5) {
    return 0;
  }
  if (ccder_decode_uint64())
  {
    uint64_t v14 = 0;
    unint64_t v12 = @"Bad version: %llu";
    uint64_t v13 = 8;
  }
  else
  {
    unint64_t v12 = @"Version mising";
    uint64_t v13 = 1;
  }
  KCJoiningErrorCreate(v13, a4, v12, v6, v7, v8, v9, v10, v14);
  return 0;
}

uint64_t sizeof_initialmessage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = ccder_sizeof_uint64();
  if (v2)
  {
    [v1 length];
    if (ccder_sizeof_raw_octet_string()) {
      uint64_t v2 = ccder_sizeof();
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

uint64_t encode_initialmessage(void *a1)
{
  kcder_encode_data(a1);
  ccder_encode_uint64();
  return ccder_encode_constructed_tl();
}

uint64_t sizeof_initialmessage_version2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a1;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = ccder_sizeof_uint64();
  if (v9)
  {
    [v6 length];
    if (ccder_sizeof_raw_octet_string()
      && ccder_sizeof_uint64()
      && ([v7 length], ccder_sizeof_raw_octet_string())
      && ([v8 length], ccder_sizeof_raw_octet_string()))
    {
      uint64_t v9 = ccder_sizeof();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t sizeof_initialmessage_version1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  if (!ccder_sizeof_uint64()) {
    goto LABEL_6;
  }
  [v4 length];
  if (!ccder_sizeof_raw_octet_string()) {
    goto LABEL_6;
  }
  uint64_t v6 = ccder_sizeof_uint64();
  if (v6)
  {
    [v5 length];
    if (ccder_sizeof_raw_octet_string())
    {
      uint64_t v6 = ccder_sizeof();
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v6 = 0;
  }
LABEL_7:

  return v6;
}

uint64_t encode_initialmessage_version1(void *a1, void *a2)
{
  id v3 = a1;
  kcder_encode_data(a2);
  ccder_encode_uint64();
  kcder_encode_data(v3);

  ccder_encode_uint64();
  return ccder_encode_constructed_tl();
}

uint64_t encode_initialmessage_version2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  kcder_encode_data(a3);
  kcder_encode_data(v5);

  ccder_encode_uint64();
  kcder_encode_data(v6);

  ccder_encode_uint64();
  return ccder_encode_constructed_tl();
}

uint64_t KCInitialMessageDataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        __int16 v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTSponsorToApplicantRound1M2ReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

unint64_t kcder_decode_data_nocopy(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  return kcder_decode_data_internal(a1, 0, a2, a3, a4);
}

unint64_t kcder_decode_data_internal(void *a1, char a2, void *a3, uint64_t a4, unint64_t a5)
{
  if (!a4) {
    return 0;
  }
  unint64_t v9 = ccder_decode_tl();
  uint64_t v14 = 0;
  unint64_t v16 = v9;
  if (!v9 || v9 > a5)
  {
    char v17 = @"Unknown data encoding";
    uint64_t v18 = 1;
LABEL_9:
    KCJoiningErrorCreate(v18, a3, v17, v14, v10, v11, v12, v13, v20);
    return 0;
  }
  if (a2) {
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v9);
  }
  else {
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v9);
  }
  id v19 = objc_claimAutoreleasedReturnValue();
  *a1 = v19;

  if (!*a1)
  {
    char v17 = @"Allocation failure!";
    uint64_t v18 = 0;
    goto LABEL_9;
  }
  return v16;
}

unint64_t kcder_decode_data(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  return kcder_decode_data_internal(a1, 1, a2, a3, a4);
}

uint64_t kcder_sizeof_data(void *a1)
{
  [a1 length];
  return ccder_sizeof_raw_octet_string();
}

uint64_t kcder_encode_data_optional(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    return kcder_encode_data(a1);
  }
  else {
    return a4;
  }
}

uint64_t kcder_encode_data(void *a1)
{
  id v1 = a1;
  [v1 length];
  [v1 length];
  id v2 = v1;
  [v2 bytes];

  ccder_encode_body();
  return ccder_encode_tl();
}

unint64_t kcder_decode_string(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (!a3) {
    return 0;
  }
  unint64_t v7 = ccder_decode_tl();
  unint64_t v14 = v7;
  if (v7 && v7 <= a4)
  {
    uint64_t v15 = (uint64_t)(id)[[NSString alloc] initWithBytes:v7 length:0 encoding:4];
    *a1 = v15;
    if (v15) {
      return v14;
    }
    unint64_t v16 = @"Allocation failure!";
  }
  else
  {
    unint64_t v16 = @"Unknown string encoding";
    uint64_t v15 = 1;
  }
  KCJoiningErrorCreate(v15, a2, v16, v8, v9, v10, v11, v12, v17);
  return 0;
}

uint64_t kcder_sizeof_string(void *a1)
{
  [a1 lengthOfBytesUsingEncoding:4];
  return ccder_sizeof();
}

uint64_t kcder_encode_string(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  uint64_t v6 = a4 - a3;
  uint64_t v14 = 0;
  id v7 = a1;
  [v7 length];
  LOBYTE(v6) = objc_msgSend(v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a3, v6, &v14, 4, 0);

  if (v6)
  {
    ccder_encode_body();
    return ccder_encode_tl();
  }
  else
  {
    KCJoiningErrorCreate(2, a2, @"String encoding failed", v8, v9, v10, v11, v12, 0);
    return 0;
  }
}

uint64_t kcder_encode_raw_octet_space(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = ccder_encode_body_nocopy();
  if (a2 && v3) {
    *a2 = v3;
  }
  return ccder_encode_tl();
}

void sub_218291E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__866(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__867(uint64_t a1)
{
}

void sub_218293360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21829367C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void KCJoiningErrorCreate(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (a2 && !*a2)
  {
    *a2 = [MEMORY[0x263F087E8] errorWithJoiningError:a1 format:v11 arguments:&a9];
  }
}

uint64_t OTSupportSOSMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_218295060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

Class __getAAFAnalyticsEventClass_block_invoke(uint64_t a1)
{
  AAAFoundationLibrary_1113();
  Class result = objc_getClass("AAFAnalyticsEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAAFAnalyticsEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getkAAFFlowIdSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getkAAFFlowIdSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AAAFoundationLibrary_1113();
  Class result = dlsym(v2, "kAAFFlowId");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAAFFlowIdSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AAAFoundationLibrary_1113()
{
  uint64_t v0 = AAAFoundationLibraryCore();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getkAAFDeviceSessionId()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkAAFDeviceSessionIdSymbolLoc_ptr;
  uint64_t v8 = getkAAFDeviceSessionIdSymbolLoc_ptr;
  if (!getkAAFDeviceSessionIdSymbolLoc_ptr)
  {
    id v1 = (void *)AAAFoundationLibrary_1113();
    v6[3] = (uint64_t)dlsym(v1, "kAAFDeviceSessionId");
    getkAAFDeviceSessionIdSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    id v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void *__getkAAFDeviceSessionIdSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AAAFoundationLibrary_1113();
  Class result = dlsym(v2, "kAAFDeviceSessionId");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAAFDeviceSessionIdSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AAAFoundationLibraryCore()
{
  if (!AAAFoundationLibraryCore_frameworkLibrary_1115) {
    AAAFoundationLibraryCore_frameworkLibrary_1115 = _sl_dlopen();
  }
  return AAAFoundationLibraryCore_frameworkLibrary_1115;
}

uint64_t __AAAFoundationLibraryCore_block_invoke_1116()
{
  uint64_t result = _sl_dlopen();
  AAAFoundationLibraryCore_frameworkLibrary_1115 = result;
  return result;
}

void sub_2182956B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  if (!AuthKitLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("AKAccountManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAccountManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AuthKitLibraryCore();
  }
  return result;
}

uint64_t AuthKitLibraryCore()
{
  if (!AuthKitLibraryCore_frameworkLibrary) {
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AuthKitLibraryCore_frameworkLibrary;
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL OTApplicantToSponsorRound2M1ReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40;
LABEL_24:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id UserInfoFromVA(void *a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F08320];
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a1;
  uint64_t v5 = (void *)[[v3 alloc] initWithFormat:v4 arguments:a2];

  v9[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

BOOL CoreCryptoError(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (a1 && a2 && !*a2)
  {
    *a2 = [MEMORY[0x263F087E8] errorWithCoreCryptoStatus:a1 description:v11 args:&a9];
  }

  return a1 == 0;
}

BOOL OSStatusError(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (a1 && a2 && !*a2)
  {
    *a2 = [MEMORY[0x263F087E8] errorWithOSStatus:a1 description:v11 args:&a9];
  }

  return a1 == 0;
}

uint64_t RequirementError(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (a2 && (a1 & 1) == 0 && !*a2)
  {
    *a2 = [MEMORY[0x263F087E8] errorWithOSStatus:4294967246 description:v11 args:&a9];
  }

  return a1;
}

BOOL ExactDataSizeRequirement(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  BOOL v9 = [v8 length] == a2;
  [v8 length];

  RequirementError(v9, a3, @"%@ incorrect size, Expected %ld, got %ld", v10, v11, v12, v13, v14, (uint64_t)v7);
  return v9;
}

CFURLRef SecCopyHomeURL()
{
  uint64_t v0 = sCustomHomeURL;
  if (sCustomHomeURL)
  {
    CFRetain((CFTypeRef)sCustomHomeURL);
    return (CFURLRef)v0;
  }
  else
  {
    return CFCopyHomeDirectoryURL();
  }
}

CFURLRef SecCopyBaseFilesURL(int a1)
{
  uint64_t v1 = sCustomHomeURL;
  if (sCustomHomeURL)
  {
    CFRetain((CFTypeRef)sCustomHomeURL);
    return (CFURLRef)v1;
  }
  else if (a1)
  {
    return CFURLCreateWithFileSystemPath(0, @"/", kCFURLPOSIXPathStyle, 1u);
  }
  else
  {
    return SecCopyHomeURL();
  }
}

CFTypeRef SecSetCustomHomeURL(CFTypeRef cf)
{
  uint64_t v1 = (uint64_t)cf;
  if (cf) {
    cf = CFRetain(cf);
  }
  sCustomHomeURL = v1;
  return cf;
}

void SecSetCustomHomeURLString(CFStringRef filePath)
{
  id v2 = (const void *)sCustomHomeURL;
  if (sCustomHomeURL)
  {
    sCustomHomeURL = 0;
    CFRelease(v2);
  }
  if (filePath) {
    sCustomHomeURL = (uint64_t)CFURLCreateWithFileSystemPath(0, filePath, kCFURLPOSIXPathStyle, 1u);
  }
}

uint64_t IsScopeActive(int a1, uint64_t a2)
{
  int valuePtr = a1;
  if (!a2) {
    return 1;
  }
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = __IsScopeActive_block_invoke;
  v6[3] = &unk_264315130;
  v6[4] = &v7;
  v6[5] = v3;
  v6[6] = a2;
  with_scopes_read(v6);
  if (v3) {
    CFRelease(v3);
  }
  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __IsScopeActive_block_invoke(uint64_t a1)
{
  CFArrayRef v1 = (const __CFArray *)sLogSettings;
  if (sLogSettings)
  {
    context[0] = MEMORY[0x263EF8330];
    context[1] = 0x40000000;
    context[2] = __IsScopeActive_block_invoke_2;
    context[3] = &unk_264315108;
    long long v3 = *(_OWORD *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    v5.length = CFArrayGetCount((CFArrayRef)sLogSettings);
    v5.location = 0;
    CFArrayApplyFunction(v1, v5, (CFArrayApplierFunction)apply_block_1, context);
  }
}

void with_scopes_read(dispatch_block_t block)
{
  if (GetDispatchControlQueue_onceToken != -1) {
    dispatch_once(&GetDispatchControlQueue_onceToken, &__block_literal_global_34);
  }
  id v2 = GetDispatchControlQueue_sLoggingScopeControlQueue;
  dispatch_sync(v2, block);
}

dispatch_queue_t __GetDispatchControlQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("security scope control", MEMORY[0x263EF83A8]);
  GetDispatchControlQueue_sLoggingScopeControlQueue = (uint64_t)result;
  return result;
}

uint64_t __IsScopeActive_block_invoke_2(uint64_t result, const __CFSet *cf)
{
  if (cf)
  {
    CFSetRef v2 = cf;
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(cf);
    dispatch_queue_t result = CFSetGetTypeID();
    if (v4 == result
      || (v6 = CFGetTypeID(v2), dispatch_queue_t result = CFDictionaryGetTypeID(), v6 == result)
      && (dispatch_queue_t result = (uint64_t)CFDictionaryGetValue(v2, *(const void **)(v3 + 40))) != 0
      && (v2 = (const __CFSet *)result, v7 = CFGetTypeID((CFTypeRef)result), dispatch_queue_t result = CFSetGetTypeID(), v7 == result))
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24))
      {
        BOOL v5 = CFSetContainsValue(v2, @"-") != 0;
        dispatch_queue_t result = CFSetContainsValue(v2, *(const void **)(v3 + 48));
        *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = v5 ^ (result != 0);
      }
    }
  }
  return result;
}

uint64_t apply_block_1(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t IsScopeActiveC(int a1, char *__s)
{
  size_t v4 = strlen(__s);
  CFStringRef v5 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)__s, v4, 0x8000100u, 0);
  uint64_t v6 = IsScopeActive(a1, (uint64_t)v5);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

CFMutableArrayRef CopyCurrentScopePlist()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFMutableArrayRef v1 = Mutable;
  if (sLogSettings)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __CopyCurrentScopePlist_block_invoke;
    block[3] = &__block_descriptor_tmp_14;
    block[4] = Mutable;
    with_scopes_read(block);
  }
  return v1;
}

void __CopyCurrentScopePlist_block_invoke(uint64_t a1)
{
  CFArrayRef v1 = (const __CFArray *)sLogSettings;
  context[0] = MEMORY[0x263EF8330];
  context[1] = 0x40000000;
  context[2] = __CopyCurrentScopePlist_block_invoke_2;
  context[3] = &__block_descriptor_tmp_13;
  void context[4] = *(void *)(a1 + 32);
  v3.length = CFArrayGetCount((CFArrayRef)sLogSettings);
  v3.location = 0;
  CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)apply_block_1, context);
}

void __CopyCurrentScopePlist_block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFSetGetTypeID())
    {
      CFMutableArrayRef v5 = CFSetOfCFObjectsCopyValues((const __CFSet *)cf);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v5);
      if (v5)
      {
        CFRelease(v5);
      }
      return;
    }
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      context[0] = MEMORY[0x263EF8330];
      context[1] = 0x40000000;
      context[2] = __CopyCurrentScopePlist_block_invoke_3;
      context[3] = &__block_descriptor_tmp_12;
      void context[4] = Mutable;
      CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)apply_block_2, context);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), Mutable);
      return;
    }
  }
  id v8 = *(__CFArray **)(a1 + 32);
  uint64_t v9 = (const void *)*MEMORY[0x263EFFD08];
  CFArrayAppendValue(v8, v9);
}

CFMutableArrayRef CFSetOfCFObjectsCopyValues(const __CFSet *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  context[0] = MEMORY[0x263EF8330];
  context[1] = 0x40000000;
  context[2] = __CFSetOfCFObjectsCopyValues_block_invoke;
  context[3] = &__block_descriptor_tmp_36;
  void context[4] = Mutable;
  CFSetApplyFunction(a1, (CFSetApplierFunction)apply_block_1, context);
  return Mutable;
}

void __CopyCurrentScopePlist_block_invoke_3(uint64_t a1, const void *a2, CFTypeRef cf)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFSetGetTypeID())
    {
      CFMutableArrayRef v7 = CFSetOfCFObjectsCopyValues((const __CFSet *)cf);
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, v7);
      if (v7)
      {
        CFRelease(v7);
      }
    }
  }
}

uint64_t apply_block_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void __CFSetOfCFObjectsCopyValues_block_invoke(uint64_t a1, const void *a2)
{
}

void ApplyScopeDictionaryForID(const __CFDictionary *a1, int a2)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  context[0] = MEMORY[0x263EF8330];
  context[1] = 0x40000000;
  context[2] = __ApplyScopeDictionaryForID_block_invoke;
  context[3] = &__block_descriptor_tmp_15;
  void context[4] = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)apply_block_2, context);
  if (CFDictionaryGetCount(Mutable) >= 1) {
    SetNthScopeSet(a2, (uint64_t)Mutable);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __ApplyScopeDictionaryForID_block_invoke(uint64_t a1, const __CFNumber *cf, const __CFString *a3)
{
  CFNumberRef v4 = cf;
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
    {
      if (CFEqual(v4, @"Emergency"))
      {
        int v7 = 0;
LABEL_22:
        int valuePtr = v7;
        CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
        goto LABEL_23;
      }
      if (CFEqual(v4, @"Alert"))
      {
        int v7 = 1;
        goto LABEL_22;
      }
      if (CFEqual(v4, @"Critical"))
      {
        int v7 = 2;
        goto LABEL_22;
      }
      if (CFEqual(v4, @"Error"))
      {
        int v7 = 3;
        goto LABEL_22;
      }
      if (CFEqual(v4, @"Warning"))
      {
        int v7 = 4;
        goto LABEL_22;
      }
      if (CFEqual(v4, @"Notice"))
      {
        int v7 = 5;
        goto LABEL_22;
      }
      if (CFEqual(v4, @"Info"))
      {
        int v7 = 6;
        goto LABEL_22;
      }
      if (CFEqual(v4, @"Debug"))
      {
        int v7 = 7;
        goto LABEL_22;
      }
    }
    else
    {
      CFTypeID v8 = CFGetTypeID(v4);
      if (v8 == CFNumberGetTypeID())
      {
        CFRetain(v4);
        if (a3) {
          goto LABEL_24;
        }
        goto LABEL_29;
      }
    }
    CFNumberRef v4 = 0;
    if (a3) {
      goto LABEL_24;
    }
LABEL_29:
    if (!v4) {
      return;
    }
    goto LABEL_30;
  }
LABEL_23:
  if (!a3) {
    goto LABEL_29;
  }
LABEL_24:
  CFTypeID v9 = CFGetTypeID(a3);
  if (v9 != CFStringGetTypeID()) {
    goto LABEL_29;
  }
  char v10 = CopyScopesFromScopeList(a3);
  uint64_t v11 = v10;
  if (v4 && v10)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), v4, v10);
    CFRelease(v4);
    CFNumberRef v4 = v11;
LABEL_30:
    CFRelease(v4);
    return;
  }
  if (v4) {
    CFRelease(v4);
  }
  CFNumberRef v4 = v11;
  if (v11) {
    goto LABEL_30;
  }
}

void SetNthScopeSet(int a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = __SetNthScopeSet_block_invoke;
  v2[3] = &__block_descriptor_tmp_71;
  int v3 = a1;
  v2[4] = a2;
  if (GetDispatchControlQueue_onceToken != -1) {
    dispatch_once(&GetDispatchControlQueue_onceToken, &__block_literal_global_34);
  }
  dispatch_barrier_sync((dispatch_queue_t)GetDispatchControlQueue_sLoggingScopeControlQueue, v2);
}

void __SetNthScopeSet_block_invoke(uint64_t a1)
{
  CFDictionaryRef Mutable = (__CFArray *)sLogSettings;
  if (sLogSettings)
  {
    int v3 = (const void *)*MEMORY[0x263EFFD08];
  }
  else
  {
    CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4, MEMORY[0x263EFFF70]);
    int v3 = (const void *)*MEMORY[0x263EFFD08];
    int v4 = 5;
    do
    {
      CFArrayAppendValue(Mutable, v3);
      --v4;
    }
    while (v4);
    sLogSettings = (uint64_t)Mutable;
  }
  CFArraySetValueAtIndex(Mutable, *(int *)(a1 + 40), *(const void **)(a1 + 32));
  CFArrayRef v5 = (const __CFArray *)sLogSettings;
  v9.length = CFArrayGetCount((CFArrayRef)sLogSettings);
  v9.location = 0;
  CFIndex CountOfValue = CFArrayGetCountOfValue(v5, v9, v3);
  if (CountOfValue == CFArrayGetCount(v5))
  {
    int v7 = (const void *)sLogSettings;
    if (sLogSettings)
    {
      sLogSettings = 0;
      CFRelease(v7);
    }
  }
}

__CFSet *CopyScopesFromScopeList(const __CFString *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFFA0]);
  int HasPrefix = CFStringHasPrefix(a1, @"-");
  if (HasPrefix)
  {
    CFIndex Length = CFStringGetLength(@"-");
    v12.length = CFStringGetLength(a1) - 1;
    v12.location = Length;
    CFStringRef v6 = CFStringCreateWithSubstring(v2, a1, v12);
    a1 = v6;
  }
  else
  {
    CFStringRef v6 = 0;
  }
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v2, a1, @",");
  CFArrayRef v8 = ArrayBySeparatingStrings;
  if (ArrayBySeparatingStrings)
  {
    context[0] = MEMORY[0x263EF8330];
    context[1] = 0x40000000;
    context[2] = __CopyScopesFromScopeList_block_invoke;
    context[3] = &__block_descriptor_tmp_64;
    void context[4] = Mutable;
    v11.length = CFArrayGetCount(ArrayBySeparatingStrings);
    v11.location = 0;
    CFArrayApplyFunction(v8, v11, (CFArrayApplierFunction)apply_block_1, context);
  }
  CFSetRemoveValue(Mutable, @"none");
  CFSetRemoveValue(Mutable, &stru_26C972770);
  if (CFSetContainsValue(Mutable, @"all"))
  {
    CFSetRemoveAllValues(Mutable);
    if (HasPrefix) {
      goto LABEL_11;
    }
  }
  else if (!HasPrefix)
  {
    goto LABEL_11;
  }
  CFSetSetValue(Mutable, @"-");
LABEL_11:
  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  return Mutable;
}

void __CopyScopesFromScopeList_block_invoke(uint64_t a1, const __CFString *cf)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFStringGetTypeID())
    {
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, cf);
      CFStringTrimWhitespace(MutableCopy);
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 32), MutableCopy);
      if (MutableCopy)
      {
        CFRelease(MutableCopy);
      }
    }
  }
}

void ApplyScopeListForID(const __CFString *a1, int a2)
{
  int v3 = CopyScopesFromScopeList(a1);
  SetNthScopeSet(a2, (uint64_t)v3);
  if (v3)
  {
    CFRelease(v3);
  }
}

void ApplyScopeListForIDC(char *cStr, int a2)
{
  CFStringRef v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  ApplyScopeListForID(v3, a2);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __security_debug_init()
{
  if (__security_debug_init_sdOnceToken != -1) {
    dispatch_once(&__security_debug_init_sdOnceToken, &__block_literal_global_1378);
  }
}

void ____security_debug_init_block_invoke()
{
  uint64_t v0 = getenv("DEBUGSCOPE");
  if (!v0) {
    uint64_t v0 = "";
  }
  ApplyScopeListForIDC(v0, 0);
  CFURLRef v1 = SecCopyURLForFileInManagedPreferencesDirectory(@".GlobalPreferences.plist");
  if (v1)
  {
    CFURLRef v2 = v1;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFTypeID v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], v1);
    if (v4)
    {
      CFArrayRef v5 = v4;
      if (!CFReadStreamOpen(v4))
      {
LABEL_8:
        CFRelease(v5);
        goto LABEL_9;
      }
      CFDictionaryRef v6 = (const __CFDictionary *)CFPropertyListCreateWithStream(v3, v5, 0, 0, 0, 0);
      CFRelease(v5);
      if (v6)
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v6, @"SecLogging");
        ApplyScopeByTypeForID(Value, 2);
        CFArrayRef v5 = v6;
        goto LABEL_8;
      }
    }
LABEL_9:
    CFRelease(v2);
  }
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFStringRef v10 = (const __CFString *)CFPreferencesCopyValue(@"Logging", @"com.apple.security", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE68]);
  ApplyScopeByTypeForID(v10, 1);
  if (v10) {
    CFRelease(v10);
  }
  CFStringRef v11 = (const __CFString *)CFPreferencesCopyValue(@"Circle-Logging", @"com.apple.security", v8, v9);
  ApplyScopeByTypeForID(v11, 1);
  if (v11)
  {
    CFRelease(v11);
  }
}

void ApplyScopeByTypeForID(const __CFString *a1, int a2)
{
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      ApplyScopeDictionaryForID((const __CFDictionary *)a1, a2);
    }
    else
    {
      CFTypeID v5 = CFGetTypeID(a1);
      if (v5 == CFStringGetTypeID())
      {
        ApplyScopeListForID(a1, a2);
      }
    }
  }
}

const void *secLogObjForCFScope(__CFString *a1)
{
  if (a1) {
    CFURLRef v1 = a1;
  }
  else {
    CFURLRef v1 = @"logging";
  }
  os_unfair_lock_lock_with_options();
  CFDictionaryRef Mutable = (const __CFDictionary *)secLogObjForCFScope_scopeMap;
  if (!secLogObjForCFScope_scopeMap)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], 0);
    secLogObjForCFScope_scopeMap = (uint64_t)Mutable;
  }
  CFStringRef Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __secLogObjForCFScope_block_invoke;
    v5[3] = &__block_descriptor_tmp_22;
    v5[4] = v1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = __CFStringPerformWithCString_block_invoke;
    v6[3] = &unk_2643152E8;
    v6[4] = v5;
    CFStringPerformWithCStringAndLength(v1, (uint64_t)v6);
    CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)secLogObjForCFScope_scopeMap, v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&secLogObjForCFScope_lock);
  return Value;
}

void __secLogObjForCFScope_block_invoke(uint64_t a1, const char *a2)
{
  CFURLRef v2 = (__CFDictionary *)secLogObjForCFScope_scopeMap;
  CFAllocatorRef v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);
  CFDictionaryAddValue(v2, v3, v4);
}

BOOL secLogEnabled()
{
  pthread_mutex_lock(&loggingMutex);
  char v0 = loggingEnabled;
  pthread_mutex_unlock(&loggingMutex);
  return (v0 & 1) == 0;
}

uint64_t secLogDisable()
{
  pthread_mutex_lock(&loggingMutex);
  loggingEnabled = 1;
  return pthread_mutex_unlock(&loggingMutex);
}

uint64_t secLogEnable()
{
  pthread_mutex_lock(&loggingMutex);
  loggingEnabled = 0;
  return pthread_mutex_unlock(&loggingMutex);
}

const void *secLogObjForScope(const char *a1)
{
  pthread_mutex_lock(&loggingMutex);
  char v2 = loggingEnabled;
  pthread_mutex_unlock(&loggingMutex);
  if (v2) {
    return (const void *)MEMORY[0x263EF8440];
  }
  if (a1)
  {
    os_log_t v4 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, 0x600u);
    CFAllocatorRef v3 = secLogObjForCFScope(v4);
    if (v4) {
      CFRelease(v4);
    }
    return v3;
  }
  return secLogObjForCFScope(0);
}

__CFString *SecLogAPICreate(int a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v14 = Mutable;
  if (a1) {
    int v15 = "ENTER";
  }
  else {
    int v15 = "RETURN";
  }
  CFStringAppend(Mutable, @"SecAPITrace ");
  CFStringAppendCString(v14, a2, 0x600u);
  CFStringAppendCString(v14, v15, 0x600u);
  if (a3)
  {
    CFStringRef v16 = CFStringCreateWithFormatAndArguments(v12, 0, a3, &a9);
    CFStringAppend(v14, v16);
    if (v16) {
      CFRelease(v16);
    }
  }
  if (a1)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v17;
    long long v23 = v17;
    long long v20 = v17;
    long long v21 = v17;
    *(_OWORD *)__str = v17;
    snprintf(__str, 0x50uLL, "C%p F%p", vars0[1], *vars0);
    CFStringAppend(v14, @"CALLER ");
    CFStringAppendCString(v14, __str, 0x600u);
  }
  return v14;
}

uint64_t SecGetDebugDescriptionFormatOptions()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __SecGetDebugDescriptionFormatOptions_block_invoke;
  block[3] = &__block_descriptor_tmp_1415;
  block[4] = &SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsSingleton;
  if (SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsOnce != -1) {
    dispatch_once(&SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsOnce, block);
  }
  return SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsSingleton;
}

CFDictionaryRef __SecGetDebugDescriptionFormatOptions_block_invoke(uint64_t a1)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  values = (void *)*MEMORY[0x263EFFB40];
  keys[0] = (void *)kSecDebugFormatOption;
  CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  **(void **)(a1 + 32) = result;
  return result;
}

void CFStringArrayPerformWithDescription(const __CFArray *a1, uint64_t a2)
{
}

void CFStringArrayPerformWithDelimiterWithDescription(const __CFArray *a1, CFStringRef theString, const __CFString *a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v11 = 0;
    CFAllocatorRef v12 = &v11;
    uint64_t v13 = 0x2000000000;
    CFMutableStringRef MutableCopy = (CFMutableStringRef)0xAAAAAAAAAAAAAAAALL;
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theString);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2000000000;
    v10[3] = &stru_26C972770;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    void v9[2] = __CFStringArrayPerformWithDelimiterWithDescription_block_invoke;
    v9[3] = &unk_2643153F0;
    v9[4] = &v11;
    v9[5] = v10;
    v16.length = CFArrayGetCount(a1);
    v16.location = 0;
    CFArrayApplyFunction(a1, v16, (CFArrayApplierFunction)apply_block_1_1422, v9);
    CFStringAppend((CFMutableStringRef)v12[3], a3);
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v12[3]);
    int v7 = (const void *)v12[3];
    if (v7)
    {
      v12[3] = 0;
      CFRelease(v7);
    }
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    CFStringRef v8 = *(void (**)(uint64_t, __CFString *))(a4 + 16);
    v8(a4, @"null");
  }
}

void __CFStringArrayPerformWithDelimiterWithDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = @", ";
}

uint64_t apply_block_1_1422(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void CFStringSetPerformWithDescription(const __CFSet *a1, uint64_t a2)
{
  if (a1)
  {
    CFIndex Count = CFSetGetCount(a1);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
    CFSetApplyFunction(a1, (CFSetApplierFunction)appendDescriptionToArray, Mutable);
    v8.length = CFArrayGetCount(Mutable);
    v8.location = 0;
    CFArraySortValues(Mutable, v8, MEMORY[0x263EFF3C0], 0);
    CFStringArrayPerformWithDelimiterWithDescription(Mutable, @"{("), CFSTR(")}", a2);
    if (Mutable)
    {
      CFRelease(Mutable);
    }
  }
  else
  {
    CFDictionaryRef v6 = *(void (**)(uint64_t, __CFString *))(a2 + 16);
    v6(a2, @"null");
  }
}

void appendDescriptionToArray(__CFString *a1, __CFArray *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID())
  {
    CFTypeID v5 = a2;
    CFDictionaryRef v6 = a1;
LABEL_8:
    CFArrayAppendValue(v5, v6);
    return;
  }
  CFStringRef v7 = CFCopyDescription(a1);
  if (!v7)
  {
    CFDictionaryRef v6 = @"null";
    CFTypeID v5 = a2;
    goto LABEL_8;
  }
  CFStringRef v8 = v7;
  CFArrayAppendValue(a2, v7);
  CFRelease(v8);
}

void SecCFCalendarDoWithZuluCalendar(uint64_t a1)
{
  if (SecCFCalendarGetZuluQueue_onceToken != -1) {
    dispatch_once(&SecCFCalendarGetZuluQueue_onceToken, &__block_literal_global_1444);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __SecCFCalendarDoWithZuluCalendar_block_invoke;
  block[3] = &unk_264315298;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)fqueue_cf, block);
}

uint64_t __SecCFCalendarDoWithZuluCalendar_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (SecCFCalendarGetZulu_onceToken != -1) {
    dispatch_once(&SecCFCalendarGetZulu_onceToken, &__block_literal_global_67);
  }
  uint64_t v2 = sZuluCalendar;
  CFAllocatorRef v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

void __SecCFCalendarGetZulu_block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  sZuluCalendar = (uint64_t)CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFCalendarIdentifier)*MEMORY[0x263EFFC90]);
  CFTimeZoneRef v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(v0, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)sZuluCalendar, v1);
  if (v1)
  {
    CFRelease(v1);
  }
}

dispatch_queue_t __SecCFCalendarGetZuluQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("ZuluCalendar", 0);
  fqueue_cf = (uint64_t)result;
  return result;
}

void CFStringPerformWithCStringAndLength(const __CFString *a1, uint64_t a2)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    CFTypeID v5 = CStringPtr;
    size_t v6 = strlen(CStringPtr);
    CFStringRef v7 = *(void (**)(uint64_t, const char *, size_t))(a2 + 16);
    v7(a2, v5, v6);
  }
  else
  {
    CFIndex usedBufLen = 0;
    CFIndex Length = CFStringGetLength(a1);
    v12.location = 0;
    v12.length = Length;
    CFStringGetBytes(a1, v12, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    void v9[2] = __CFStringPerformWithCStringAndLength_block_invoke;
    v9[3] = &unk_2643152C0;
    void v9[6] = 0;
    v9[7] = Length;
    v9[8] = usedBufLen;
    v9[4] = a2;
    v9[5] = a1;
    PerformWithBuffer(usedBufLen + 1, (uint64_t)v9);
  }
}

uint64_t __CFStringPerformWithCStringAndLength_block_invoke(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFStringRef v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16))();
  }
  return result;
}

void CFStringPerformWithCString(const __CFString *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = __CFStringPerformWithCString_block_invoke;
  v2[3] = &unk_2643152E8;
  v2[4] = a2;
  CFStringPerformWithCStringAndLength(a1, (uint64_t)v2);
}

uint64_t __CFStringPerformWithCString_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void CFStringPerformWithUTF8CFData(const __CFString *a1, uint64_t a2)
{
  CFIndex maxBufLen = 0;
  CFIndex Length = CFStringGetLength(a1);
  v10.location = 0;
  v10.length = Length;
  CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  CFIndex v5 = maxBufLen;
  CFMutableArrayRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFDataSetLength(Mutable, v5);
  CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v11.location = 0;
  v11.length = Length;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, 0, MutableBytePtr, maxBufLen, &usedBufLen);
  (*(void (**)(uint64_t, __CFData *))(a2 + 16))(a2, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

CFStringRef CFStringCreateByTrimmingCharactersInSet(const __CFString *a1, const __CFCharacterSet *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFStringRef theString = a1;
  uint64_t v37 = 0;
  CFIndex v38 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  uint64_t v35 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  CFIndex v39 = 0;
  CFIndex v40 = 0;
  v36 = CStringPtr;
  if (Length < 1) {
    return &stru_26C972770;
  }
  uint64_t v7 = 0;
  CFIndex v8 = 0;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[6] = v9;
  v33[7] = v9;
  v33[4] = v9;
  v33[5] = v9;
  v33[2] = v9;
  v33[3] = v9;
  uint64_t v10 = 64;
  CFRange v11 = &stru_26C972770;
  v33[0] = v9;
  v33[1] = v9;
  while (1)
  {
    uint64_t v12 = (unint64_t)v8 >= 4 ? 4 : v8;
    CFIndex v13 = v38;
    if (v38 <= v8)
    {
      UniChar v14 = 0;
    }
    else if (v35)
    {
      UniChar v14 = v35[v8 + v37];
    }
    else if (v36)
    {
      UniChar v14 = v36[v37 + v8];
    }
    else
    {
      CFIndex v15 = v39;
      if (v40 <= v8 || v39 > v8)
      {
        uint64_t v17 = v12 + v7;
        uint64_t v18 = v10 - v12;
        CFIndex v19 = v8 - v12;
        CFIndex v20 = v19 + 64;
        if (v19 + 64 >= v38) {
          CFIndex v20 = v38;
        }
        CFIndex v39 = v19;
        CFIndex v40 = v20;
        if (v38 >= v18) {
          CFIndex v13 = v18;
        }
        v41.length = v13 + v17;
        v41.location = v19 + v37;
        CFStringGetCharacters(theString, v41, (UniChar *)v33);
        CFIndex v15 = v39;
      }
      UniChar v14 = *((_WORD *)v33 + v8 - v15);
    }
    if (!CFCharacterSetIsCharacterMember(a2, v14)) {
      break;
    }
    ++v8;
    --v7;
    ++v10;
    if (Length == v8) {
      return v11;
    }
  }
  CFIndex v21 = -Length;
  CFIndex v22 = Length + 64;
  uint64_t v23 = 1;
  while (1)
  {
    uint64_t v24 = (unint64_t)Length >= 5 ? 5 : Length;
    if (Length < 2) {
      break;
    }
    CFIndex v25 = v38;
    if (v38 >= Length)
    {
      if (v35)
      {
        UniChar v26 = v35[Length - 1 + v37];
      }
      else if (v36)
      {
        UniChar v26 = v36[v37 - 1 + Length];
      }
      else
      {
        if (v40 < Length || (CFIndex v27 = v39, v39 >= Length))
        {
          uint64_t v28 = v24 + v21;
          CFIndex v29 = v22 - v24;
          CFIndex v30 = Length - v24;
          CFIndex v31 = v30 + 64;
          if (v30 + 64 >= v38) {
            CFIndex v31 = v38;
          }
          CFIndex v39 = v30;
          CFIndex v40 = v31;
          if (v38 >= v29) {
            CFIndex v25 = v29;
          }
          v42.length = v25 + v28;
          v42.location = v30 + v37;
          CFStringGetCharacters(theString, v42, (UniChar *)v33);
          CFIndex v27 = v39;
        }
        UniChar v26 = *((_WORD *)&v33[-1] + Length - v27 + 7);
      }
    }
    else
    {
      UniChar v26 = 0;
    }
    ++v21;
    --v22;
    --Length;
    if (!CFCharacterSetIsCharacterMember(a2, v26))
    {
      uint64_t v23 = Length + 1;
      break;
    }
  }
  v43.length = v23 - v8;
  v43.location = v8;
  return CFStringCreateWithSubstring(0, a1, v43);
}

CFStringRef CFDictionaryCopyCompactDescription(const __CFDictionary *a1)
{
  if (a1)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"{");
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2000000000;
    v6[3] = &stru_26C972770;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __CFDictionaryCopyCompactDescription_block_invoke;
    v5[3] = &unk_264315310;
    v5[4] = v6;
    void v5[5] = MutableCopy;
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)apply_block_2_1453, v5);
    CFStringAppendFormat(MutableCopy, 0, @"}");
    _Block_object_dispose(v6, 8);
    return MutableCopy;
  }
  else
  {
    uint64_t v4 = (const void *)*MEMORY[0x263EFFD08];
    return CFCopyDescription(v4);
  }
}

void __CFDictionaryCopyCompactDescription_block_invoke(uint64_t a1, uint64_t a2, const __CFData *cf)
{
  if (cf && (CFTypeID v6 = CFGetTypeID(cf), v6 == CFDataGetTypeID()))
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"0x");
    BytePtr = CFDataGetBytePtr(cf);
    CFIndex Length = CFDataGetLength(cf);
    if (Length >= 1)
    {
      CFIndex v10 = Length;
      do
      {
        unsigned int v11 = *BytePtr++;
        CFStringAppendFormat(MutableCopy, 0, @"%02X", v11);
        --v10;
      }
      while (v10);
    }
  }
  else
  {
    CFMutableStringRef MutableCopy = 0;
  }
  if (MutableCopy) {
    CFDataRef v12 = (const __CFData *)MutableCopy;
  }
  else {
    CFDataRef v12 = cf;
  }
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, @"%@%@:%@", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2, v12);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = @", ";
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
  }
}

uint64_t apply_block_2_1453(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFStringRef CFDictionaryCopySuperCompactDescription(const __CFDictionary *a1)
{
  if (a1)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"{");
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2000000000;
    v6[3] = &stru_26C972770;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __CFDictionaryCopySuperCompactDescription_block_invoke;
    v5[3] = &unk_264315338;
    v5[4] = v6;
    void v5[5] = MutableCopy;
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)apply_block_2_1453, v5);
    CFStringAppendFormat(MutableCopy, 0, @"}");
    _Block_object_dispose(v6, 8);
    return MutableCopy;
  }
  else
  {
    uint64_t v4 = (const void *)*MEMORY[0x263EFFD08];
    return CFCopyDescription(v4);
  }
}

void __CFDictionaryCopySuperCompactDescription_block_invoke(uint64_t a1, const __CFString *a2, const __CFString *cf)
{
  if (!cf) {
    goto LABEL_12;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"0x");
    BytePtr = CFDataGetBytePtr((CFDataRef)cf);
    CFIndex Length = CFDataGetLength((CFDataRef)cf);
    if (Length >= 1)
    {
      CFIndex v10 = Length;
      do
      {
        unsigned int v11 = *BytePtr++;
        CFStringAppendFormat(MutableCopy, 0, @"%02X", v11);
        --v10;
      }
      while (v10);
    }
    v21.location = 0;
    v21.length = 5;
    CFStringDelete(MutableCopy, v21);
    goto LABEL_16;
  }
  CFTypeID v12 = CFGetTypeID(cf);
  if (v12 != CFStringGetTypeID())
  {
    CFTypeID v16 = CFGetTypeID(cf);
    if (v16 == CFNumberGetTypeID())
    {
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef Copy = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@", cf);
      goto LABEL_14;
    }
LABEL_12:
    CFMutableStringRef MutableCopy = 0;
    goto LABEL_16;
  }
  CFIndex v13 = CFStringGetLength(cf);
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v13 > 5)
  {
    v22.location = 0;
    v22.length = 6;
    CFStringRef Copy = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], cf, v22);
  }
  else
  {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], cf);
  }
LABEL_14:
  CFStringRef v17 = Copy;
  CFIndex v18 = CFStringGetLength(Copy);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v14, v18, v17);
  if (v17) {
    CFRelease(v17);
  }
LABEL_16:
  unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, @"%c:%@ ", CharacterAtIndex, MutableCopy);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = @", ";
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
  }
}

uint64_t CFDataCreateWithRandomBytes(size_t a1)
{
  uint64_t v4 = 0;
  CFIndex v5 = &v4;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = __CFDataCreateWithRandomBytes_block_invoke;
  v3[3] = &unk_264315360;
  v3[4] = &v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __PerformWithBufferAndClear_block_invoke;
  v8[3] = &unk_264315628;
  v8[4] = v3;
  PerformWithBuffer(a1, (uint64_t)v8);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

CFDataRef __CFDataCreateWithRandomBytes_block_invoke(uint64_t a1, size_t a2, void *bytes)
{
  CCRandomGenerateBytes(bytes, a2);
  CFDataRef result = CFDataCreate(0, (const UInt8 *)bytes, a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t GetShortDateFormatter()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __GetShortDateFormatter_block_invoke;
  block[3] = &__block_descriptor_tmp_53;
  block[4] = &GetShortDateFormatter_sGetShortDateFormatterSingleton;
  if (GetShortDateFormatter_sGetShortDateFormatterOnce != -1) {
    dispatch_once(&GetShortDateFormatter_sGetShortDateFormatterOnce, block);
  }
  return GetShortDateFormatter_sGetShortDateFormatterSingleton;
}

void __GetShortDateFormatter_block_invoke(uint64_t a1)
{
  CFLocaleRef v2 = CFLocaleCopyCurrent();
  **(void **)(a1 + 32) = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetFormat(**(CFDateFormatterRef **)(a1 + 32), @"yyyy-MM-dd HH:mm");
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t GetShortDateFormatterQueue()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __GetShortDateFormatterQueue_block_invoke;
  block[3] = &__block_descriptor_tmp_55;
  block[4] = &GetShortDateFormatterQueue_sGetShortDateFormatterQueueSingleton;
  if (GetShortDateFormatterQueue_sGetShortDateFormatterQueueOnce != -1) {
    dispatch_once(&GetShortDateFormatterQueue_sGetShortDateFormatterQueueOnce, block);
  }
  return GetShortDateFormatterQueue_sGetShortDateFormatterQueueSingleton;
}

dispatch_queue_t __GetShortDateFormatterQueue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result = dispatch_queue_create("Date Formatting", 0);
  **(void **)(a1 + 32) = result;
  return result;
}

void withStringOfAbsoluteTime(uint64_t a1, double a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __withStringOfAbsoluteTime_block_invoke;
  v5[3] = &unk_2643153C8;
  v5[4] = &v6;
  *(double *)&void v5[5] = a2;
  ShortDateFormatterQueue = GetShortDateFormatterQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __withShortDateFormatter_block_invoke;
  block[3] = &unk_264315458;
  block[4] = v5;
  dispatch_sync(ShortDateFormatterQueue, block);
  (*(void (**)(uint64_t, uint64_t))(a1 + 16))(a1, v7[3]);
  uint64_t v4 = (const void *)v7[3];
  if (v4)
  {
    v7[3] = 0;
    CFRelease(v4);
  }
  _Block_object_dispose(&v6, 8);
}

CFStringRef __withStringOfAbsoluteTime_block_invoke(uint64_t a1, __CFDateFormatter *a2)
{
  CFStringRef result = CFDateFormatterCreateStringWithAbsoluteTime((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, *(CFAbsoluteTime *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __withShortDateFormatter_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t ShortDateFormatter = GetShortDateFormatter();
  CFAllocatorRef v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, ShortDateFormatter);
}

BOOL SecKernError(int a1, CFTypeRef *a2, CFStringRef format, ...)
{
  va_start(va, format);
  if (a1 && a2)
  {
    CFIndex v5 = (__CFError *)*a2;
    *a2 = 0;
    SecCFCreateErrorWithFormatAndArguments(a1, (const __CFString *)*MEMORY[0x263EFFC50], v5, a2, 0, format, va);
  }
  return a1 == 0;
}

uint64_t SecCFCreateErrorWithFormatAndArguments(CFIndex a1, const __CFString *a2, __CFError *cf, CFTypeRef *a4, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return 0;
  }
  if (*a4)
  {
    if (!cf || *a4 == cf) {
      return 0;
    }
    goto LABEL_41;
  }
  CFStringRef v11 = CFStringCreateWithFormatAndArguments(0, formatOptions, format, arguments);
  uint64_t v32 = 0;
  CFTypeID v12 = (const void **)MEMORY[0x263EFFC48];
  if (cf)
  {
    CFDictionaryRef v13 = CFErrorCopyUserInfo(cf);
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v13, *v12);
    if (Value)
    {
      BOOL v15 = CFEqual(v11, Value);
      if (!v13) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v15 = 0;
      if (!v13)
      {
LABEL_10:
        CFIndex Code = CFErrorGetCode(cf);
        CFStringRef Domain = CFErrorGetDomain(cf);
        CFComparisonResult v18 = CFStringCompare(a2, Domain, 0);
        BOOL v20 = Code == a1 && v18 == kCFCompareEqualTo && v15;
        CFRange v21 = cf;
        if (v20) {
          goto LABEL_17;
        }
        CFDictionaryRef v23 = CFErrorCopyUserInfo(cf);
        if (v23)
        {
          CFDictionaryRef v24 = v23;
          CFIndex v25 = (const void *)*MEMORY[0x263F16E18];
          if (CFDictionaryContainsKey(v23, (const void *)*MEMORY[0x263F16E18]) == 1)
          {
            CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(v24, v25);
            if (v26)
            {
              uint64_t valuePtr = 0;
              CFNumberGetValue(v26, kCFNumberLongType, &valuePtr);
              if (valuePtr > 199)
              {
                CFRelease(v24);
                CFRange v21 = cf;
LABEL_17:
                CFRetain(v21);
                *a4 = cf;
                CFRelease(cf);
                if (!v11) {
                  return 0;
                }
                CFRange v22 = (__CFError *)v11;
LABEL_42:
                CFRelease(v22);
                return 0;
              }
              uint64_t v32 = valuePtr + 1;
            }
          }
          CFRelease(v24);
        }
        goto LABEL_28;
      }
    }
    CFRelease(v13);
    goto LABEL_10;
  }
LABEL_28:
  CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v28 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongType, &v32);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v27, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFIndex v30 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC88], cf);
  }
  if (v28) {
    CFDictionaryAddValue(v30, (const void *)*MEMORY[0x263F16E18], v28);
  }
  if (v11) {
    CFDictionaryAddValue(v30, *v12, v11);
  }
  *a4 = CFErrorCreate(v27, a2, a1, v30);
  if (v28) {
    CFRelease(v28);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v30) {
    CFRelease(v30);
  }
  if (cf)
  {
LABEL_41:
    CFRange v22 = cf;
    goto LABEL_42;
  }
  return 0;
}

BOOL SecCheckErrno(int a1, CFTypeRef *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    if (a2)
    {
      CFIndex v12 = *__error();
      CFDictionaryRef v13 = (__CFError *)*a2;
      *a2 = 0;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3, &a9);
      CFStringRef v15 = (const __CFString *)*MEMORY[0x263EFFC60];
      strerror(v12);
      SecCFCreateErrorWithFormat(v12, v15, v13, a2, 0, @"%@: [%d] %s", v16, v17, (char)v14);
      if (v14) {
        CFRelease(v14);
      }
    }
  }
  return a1 == 0;
}

uint64_t SecCFCreateErrorWithFormat(CFIndex a1, const __CFString *a2, __CFError *a3, CFTypeRef *a4, const __CFDictionary *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  return 0;
}

BOOL SecError(int a1, __CFError **a2, CFStringRef format, ...)
{
  va_start(va, format);
  if (a1)
  {
    CFTypeRef cf = 0;
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFC58];
    if (a2)
    {
      SecCFCreateErrorWithFormatAndArguments(a1, v5, *a2, &cf, 0, format, va);
      *a2 = (__CFError *)cf;
    }
    else
    {
      SecCFCreateErrorWithFormatAndArguments(a1, v5, 0, &cf, 0, format, va);
      CFTypeRef v6 = cf;
      if (cf)
      {
        CFTypeRef cf = 0;
        CFRelease(v6);
      }
    }
  }
  return a1 == 0;
}

uint64_t SecRequirementError(uint64_t a1, CFTypeRef *a2, CFStringRef format, ...)
{
  va_start(va, format);
  if (a2 && (a1 & 1) == 0)
  {
    CFStringRef v5 = (__CFError *)*a2;
    *a2 = 0;
    SecCFCreateErrorWithFormatAndArguments(-50, (const __CFString *)*MEMORY[0x263EFFC58], v5, a2, 0, format, va);
  }
  return a1;
}

BOOL SecAllocationError(uint64_t a1, CFTypeRef *a2, CFStringRef format, ...)
{
  va_start(va, format);
  if (!a1 && a2)
  {
    CFStringRef v5 = (__CFError *)*a2;
    *a2 = 0;
    SecCFCreateErrorWithFormatAndArguments(-108, (const __CFString *)*MEMORY[0x263EFFC58], v5, a2, 0, format, va);
  }
  return a1 != 0;
}

uint64_t GetKeybagAssertionQueue()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __GetKeybagAssertionQueue_block_invoke;
  block[3] = &__block_descriptor_tmp_1475;
  block[4] = &GetKeybagAssertionQueue_sGetKeybagAssertionQueueSingleton;
  if (GetKeybagAssertionQueue_sGetKeybagAssertionQueueOnce != -1) {
    dispatch_once(&GetKeybagAssertionQueue_sGetKeybagAssertionQueueOnce, block);
  }
  return GetKeybagAssertionQueue_sGetKeybagAssertionQueueSingleton;
}

dispatch_queue_t __GetKeybagAssertionQueue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result = dispatch_queue_create("AKS Lock Assertion Queue", 0);
  **(void **)(a1 + 32) = result;
  return result;
}

BOOL SecAKSKeybagHoldLockAssertion(int a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v11 = 0;
  CFIndex v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = 0;
  KeybagAssertionQueue = GetKeybagAssertionQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __SecAKSKeybagHoldLockAssertion_block_invoke;
  block[3] = &unk_2643154A8;
  block[4] = &v11;
  void block[5] = a2;
  int v10 = a1;
  dispatch_sync(KeybagAssertionQueue, block);
  BOOL v7 = SecKernError(*((_DWORD *)v12 + 6), a3, @"Kern return error");
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __SecAKSKeybagHoldLockAssertion_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!count)
  {
    CFLocaleRef v2 = secLogObjForScope("lockassertions");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 40);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_218274000, v2, OS_LOG_TYPE_DEFAULT, "Requesting lock assertion for %lld seconds", (uint8_t *)&v4, 0xCu);
    }
    dispatch_queue_t result = aks_assert_hold(*(_DWORD *)(v1 + 48), 0, *(void *)(v1 + 40));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24)) {
    ++count;
  }
  return result;
}

BOOL SecAKSKeybagDropLockAssertion(int a1, CFTypeRef *a2)
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  KeybagAssertionQueue = GetKeybagAssertionQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  v7[2] = __SecAKSKeybagDropLockAssertion_block_invoke;
  v7[3] = &unk_2643154D0;
  v7[4] = &v9;
  int v8 = a1;
  dispatch_sync(KeybagAssertionQueue, v7);
  BOOL v5 = SecKernError(*((_DWORD *)v10 + 6), a2, @"Kern return error");
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __SecAKSKeybagDropLockAssertion_block_invoke(uint64_t result)
{
  int v1 = count;
  if (count)
  {
    --count;
    if (v1 == 1)
    {
      uint64_t v2 = result;
      uint64_t v3 = secLogObjForScope("lockassertions");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl(&dword_218274000, v3, OS_LOG_TYPE_DEFAULT, "Dropping lock assertion", v4, 2u);
      }
      dispatch_queue_t result = aks_assert_drop(*(_DWORD *)(v2 + 40), 0);
      *(_DWORD *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

BOOL SecAKSDoWithKeybagLockAssertion(int a1, CFTypeRef *a2, uint64_t a3)
{
  BOOL result = SecAKSKeybagHoldLockAssertion(a1, 60, a2);
  if (result)
  {
    (*(void (**)(uint64_t))(a3 + 16))(a3);
    return SecAKSKeybagDropLockAssertion(a1, a2);
  }
  return result;
}

uint64_t SecAKSDoWithKeybagLockAssertionSoftly(int a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (SecAKSKeybagHoldLockAssertion(a1, 60, &cf))
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    SecAKSKeybagDropLockAssertion(a1, &cf);
    CFTypeRef v4 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v4);
    }
  }
  else
  {
    BOOL v5 = secLogObjForScope("secaks");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v10 = a1;
      __int16 v11 = 2112;
      CFTypeRef v12 = cf;
      _os_log_impl(&dword_218274000, v5, OS_LOG_TYPE_DEFAULT, "SecAKSDoWithKeybagLockAssertionSoftly: failed to get assertion for %d proceeding bravely: %@", buf, 0x12u);
    }
    CFTypeRef v6 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v6);
    }
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
  return 1;
}

CFDataRef SecAKSCopyBackupBagWithSecret(unint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  int v5 = a1;
  uint64_t v17 = *MEMORY[0x263EF8340];
  LODWORD(v14[0]) = -1;
  memset((char *)v14 + 4, 0, 12);
  unint64_t v6 = a1 >> 31;
  SecRequirementError(a1 >> 31 == 0, a3, @"Invalid size: %zu", a1);
  if (!v6
    && (uint64_t bag = aks_create_bag(a2, v5, 4u, v14), SecKernError(bag, a3, @"bag allocation failed: %d", bag))
    && (uint64_t v8 = aks_save_bag(), SecKernError(v8, a3, @"save bag failed: %d", v8)))
  {
    int v9 = aks_unload_bag((int)v14[0]);
    if (v9)
    {
      int v10 = v9;
      __int16 v11 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v16 = v10;
        _os_log_impl(&dword_218274000, v11, OS_LOG_TYPE_DEFAULT, "unload bag failed: %d", buf, 8u);
      }
    }
    CFDataRef v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v14[1], SHIDWORD(v14[0]));
    SecAllocationError((uint64_t)v12, a3, @"Bag CFData Allocation Failed");
  }
  else
  {
    CFDataRef v12 = 0;
  }
  if (v14[1]) {
    free((void *)v14[1]);
  }
  return v12;
}

uint64_t SecAKSSanitizedKeyclass(uint64_t a1)
{
  int v1 = a1;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((int)a1 < 32) {
    return a1;
  }
  uint64_t v2 = a1 & 0x1F;
  uint64_t v3 = secLogObjForScope("SanitizeKeyclass");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109376;
    v5[1] = v1;
    __int16 v6 = 1024;
    int v7 = v2;
    _os_log_debug_impl(&dword_218274000, v3, OS_LOG_TYPE_DEBUG, "sanitizing request for keyclass %d to keyclass %d", (uint8_t *)v5, 0xEu);
  }
  return v2;
}

uint64_t SecSupportsEnhancedApfs()
{
  if (DeviceTree_SupportsEnhancedApfs_onceToken != -1) {
    dispatch_once(&DeviceTree_SupportsEnhancedApfs_onceToken, &__block_literal_global_29);
  }
  if (DeviceTree_SupportsEnhancedApfs_supported) {
    return 1;
  }
  if (SecSharedDataVolumeBootArgSet_onceToken != -1) {
    dispatch_once(&SecSharedDataVolumeBootArgSet_onceToken, &__block_literal_global_37);
  }
  return SecSharedDataVolumeBootArgSet_boot_arg_set;
}

void __SecSharedDataVolumeBootArgSet_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  size_t __len = 1023;
  bzero(__big, 0x400uLL);
  if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
    SecSharedDataVolumeBootArgSet_boot_arg_set = 1;
  }
  CFAllocatorRef v0 = secLogObjForScope("eapfs");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v3 = SecSharedDataVolumeBootArgSet_boot_arg_set;
    _os_log_impl(&dword_218274000, v0, OS_LOG_TYPE_DEFAULT, "eapfs boot-arg set to %{BOOL}d", buf, 8u);
  }
}

uint64_t SecIsEduMode()
{
  if (SecIsEduMode_once != -1) {
    dispatch_once(&SecIsEduMode_once, &__block_literal_global_1514);
  }
  return SecIsEduMode_result;
}

void __SecIsEduMode_block_invoke()
{
  uint64_t v18 = 0;
  CFIndex v19 = &v18;
  uint64_t v20 = 0x2000000000;
  CFAllocatorRef v0 = getMKBUserTypeDeviceModeSymbolLoc_ptr;
  CFRange v21 = getMKBUserTypeDeviceModeSymbolLoc_ptr;
  if (!getMKBUserTypeDeviceModeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v14 = 0x40000000;
    CFStringRef v15 = __getMKBUserTypeDeviceModeSymbolLoc_block_invoke;
    int v16 = &unk_264315578;
    uint64_t v17 = &v18;
    int v1 = (void *)MobileKeyBagLibrary();
    v19[3] = (uint64_t)dlsym(v1, "MKBUserTypeDeviceMode");
    getMKBUserTypeDeviceModeSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
    CFAllocatorRef v0 = (void *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v0)
  {
LABEL_18:
    dlerror();
    uint64_t v11 = abort_report_np();
    __getMKBUserTypeDeviceModeSymbolLoc_block_invoke(v11);
    return;
  }
  uint64_t v2 = ((uint64_t (*)(void, void))v0)(0, 0);
  if (v2)
  {
    int v3 = (const void *)v2;
    value = 0;
    uint64_t v18 = 0;
    CFIndex v19 = &v18;
    uint64_t v20 = 0x2000000000;
    CFTypeRef v4 = (const void **)getkMKBDeviceModeKeySymbolLoc_ptr;
    CFRange v21 = (void *)getkMKBDeviceModeKeySymbolLoc_ptr;
    if (!getkMKBDeviceModeKeySymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v14 = 0x40000000;
      CFStringRef v15 = __getkMKBDeviceModeKeySymbolLoc_block_invoke;
      int v16 = &unk_2643155D8;
      uint64_t v17 = &v18;
      uint64_t v5 = (void *)MobileKeyBagLibrary();
      v19[3] = (uint64_t)dlsym(v5, "kMKBDeviceModeKey");
      getkMKBDeviceModeKeySymbolLoc_ptr = *(void *)(v17[1] + 24);
      CFTypeRef v4 = (const void **)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (v4)
    {
      if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, *v4, (const void **)&value))
      {
LABEL_14:
        CFRelease(v3);
        return;
      }
      __int16 v6 = value;
      uint64_t v18 = 0;
      CFIndex v19 = &v18;
      uint64_t v20 = 0x2000000000;
      int v7 = (CFTypeRef *)getkMKBDeviceModeSharedIPadSymbolLoc_ptr;
      CFRange v21 = (void *)getkMKBDeviceModeSharedIPadSymbolLoc_ptr;
      if (!getkMKBDeviceModeSharedIPadSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v14 = 0x40000000;
        CFStringRef v15 = __getkMKBDeviceModeSharedIPadSymbolLoc_block_invoke;
        int v16 = &unk_264315600;
        uint64_t v17 = &v18;
        uint64_t v8 = (void *)MobileKeyBagLibrary();
        int v9 = dlsym(v8, "kMKBDeviceModeSharedIPad");
        *(void *)(v17[1] + 24) = v9;
        getkMKBDeviceModeSharedIPadSymbolLoc_ptr = *(void *)(v17[1] + 24);
        int v7 = (CFTypeRef *)v19[3];
      }
      _Block_object_dispose(&v18, 8);
      if (v7)
      {
        if (CFEqual(v6, *v7)) {
          SecIsEduMode_BOOL result = 1;
        }
        goto LABEL_14;
      }
    }
    goto LABEL_18;
  }
  int v10 = secLogObjForScope("edumode");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "Cannot determine because deviceMode is NULL", buf, 2u);
  }
}

void *__getMKBUserTypeDeviceModeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  BOOL result = dlsym(v2, "MKBUserTypeDeviceMode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBUserTypeDeviceModeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 0x40000000;
    v3[3] = __MobileKeyBagLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_tmp_43;
    void v3[5] = v3;
    long long v4 = xmmword_264315598;
    uint64_t v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    int v1 = (void *)v3[0];
    uint64_t v0 = MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      int v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return MobileKeyBagLibraryCore_frameworkLibrary;
}

void *__getkMKBDeviceModeKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  BOOL result = dlsym(v2, "kMKBDeviceModeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMKBDeviceModeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMKBDeviceModeSharedIPadSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  BOOL result = dlsym(v2, "kMKBDeviceModeSharedIPad");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMKBDeviceModeSharedIPadSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SecSeparateUserKeychain()
{
  if (SecSeparateUserKeychain_onceToken != -1) {
    dispatch_once(&SecSeparateUserKeychain_onceToken, &__block_literal_global_4);
  }
  return SecSeparateUserKeychain_ffSeparateUserKeychain;
}

void __SecSeparateUserKeychain_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  SecSeparateUserKeychain_ffSeparateUserKeychain = _os_feature_enabled_impl();
  uint64_t v0 = secLogObjForScope("keychain");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (SecSeparateUserKeychain_ffSeparateUserKeychain) {
      int v1 = "enabled";
    }
    else {
      int v1 = "disabled";
    }
    int v2 = 136315138;
    int v3 = v1;
    _os_log_impl(&dword_218274000, v0, OS_LOG_TYPE_DEFAULT, "SeparateUserKeychain set via feature flag to %s", (uint8_t *)&v2, 0xCu);
  }
}

CFURLRef SecCopyURLForFileInBaseDirectory(int a1, const __CFString *a2, uint64_t a3)
{
  CFURLRef v5 = SecCopyBaseFilesURL(a1);
  if (a3)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef Copy = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@/%@", a2, a3);
  }
  else
  {
    if (!a2) {
      goto LABEL_10;
    }
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2);
  }
  CFStringRef v8 = Copy;
  if (v5 && Copy)
  {
    CFURLRef v9 = CFURLCreateCopyAppendingPathComponent(v6, v5, Copy, a3 == 0);
    CFRelease(v8);
LABEL_11:
    CFRelease(v5);
    return v9;
  }
  if (Copy) {
    CFRelease(Copy);
  }
LABEL_10:
  CFURLRef v9 = 0;
  if (v5) {
    goto LABEL_11;
  }
  return v9;
}

CFURLRef SecCopyURLForFileInUserScopedKeychainDirectory(uint64_t a1)
{
  if (SecSeparateUserKeychain_onceToken != -1) {
    dispatch_once(&SecSeparateUserKeychain_onceToken, &__block_literal_global_4);
  }
  BOOL v2 = SecSeparateUserKeychain_ffSeparateUserKeychain == 0;
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", SecSeparateUserKeychain_ffSeparateUserKeychain);
  return SecCopyURLForFileInBaseDirectory(v2, @"Library/Keychains", a1);
}

CFURLRef SecCopyURLForFileInKeychainDirectory(uint64_t a1)
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
}

CFURLRef SecCopyURLForFileInSystemKeychainDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
}

CFURLRef SecCopyURLForFileInUserCacheDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Caches", a1);
}

CFURLRef SecCopyURLForFileInPreferencesDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(0, @"Library/Preferences", a1);
}

CFURLRef SecCopyURLForFileInManagedPreferencesDirectory(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "mobile", 0x600u);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFStringRef v5 = CFStringCreateWithFormat(v2, 0, @"/Library/Managed Preferences/%@/%@", v3, a1);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFURLRef v7 = CFURLCreateWithFileSystemPath(v2, v5, kCFURLPOSIXPathStyle, 0);
    CFRelease(v6);
  }
  else
  {
    CFURLRef v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

CFURLRef SecCopyURLForFileInProtectedDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"private/var/protected/", a1);
}

void WithPathInDirectory(const __CFURL *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    CFURLGetFileSystemRepresentation(a1, 0, __b, 1024);
    (*(void (**)(uint64_t, UInt8 *))(a2 + 16))(a2, __b);
    CFRelease(a1);
  }
}

void WithPathInKeychainDirectory(uint64_t a1, uint64_t a2)
{
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v4 = SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
  WithPathInDirectory(v4, a2);
}

void WithPathInUserCacheDirectory(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = SecCopyURLForFileInBaseDirectory(1, @"Library/Caches", a1);
  WithPathInDirectory(v3, a2);
}

void WithPathInProtectedDirectory(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = SecCopyURLForFileInBaseDirectory(1, @"private/var/protected/", a1);
  WithPathInDirectory(v3, a2);
}

void SetCustomHomePath(char *cStr)
{
  if (cStr)
  {
    CFStringRef v1 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    SecSetCustomHomeURLString(v1);
    if (!v1) {
      return;
    }
  }
  else
  {
    CFStringRef v1 = (const __CFString *)sCustomHomeURL;
    if (!sCustomHomeURL) {
      return;
    }
    sCustomHomeURL = 0;
  }
  CFRelease(v1);
}

void PerformWithBuffer(size_t size, uint64_t a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (size)
  {
    if (size > 0x800)
    {
      uint64_t v5 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v5);
      if (v5)
      {
        free(v5);
      }
    }
    else
    {
      MEMORY[0x270FA5388]();
      memset((char *)v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    CFURLRef v4 = *(void (**)(uint64_t, void, void))(a2 + 16);
    v4(a2, 0, 0);
  }
}

void PerformWithBufferAndClear(size_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = __PerformWithBufferAndClear_block_invoke;
  v2[3] = &unk_264315628;
  v2[4] = a2;
  PerformWithBuffer(a1, (uint64_t)v2);
}

void __PerformWithBufferAndClear_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  bzero(a3, a2);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4330](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x270EE46C8](allocator, identifier);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x270EE4790]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x270EE4F78]();
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52F8](allocator, ti);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
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

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t SOSCCCopyApplication()
{
  return MEMORY[0x270EFD3F0]();
}

uint64_t SOSCCCopyCircleJoiningBlob()
{
  return MEMORY[0x270EFD3F8]();
}

uint64_t SOSCCCopyInitialSyncData()
{
  return MEMORY[0x270EFD400]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x270EFD430]();
}

uint64_t SOSCCJoinWithCircleJoiningBlob()
{
  return MEMORY[0x270EFD438]();
}

uint64_t SOSPeerInfoCopyEncodedData()
{
  return MEMORY[0x270EFD4E0]();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return MEMORY[0x270EFD4E8]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _OctagonSignpostCreate()
{
  return MEMORY[0x270EFDE40]();
}

uint64_t _OctagonSignpostGetNanoseconds()
{
  return MEMORY[0x270EFDE48]();
}

uint64_t _OctagonSignpostLogSystem()
{
  return MEMORY[0x270EFDE50]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x270ED8800]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x270ED8808]();
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x270ED88F8]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x270ED8930]();
}

uint64_t ccder_decode_uint64()
{
  return MEMORY[0x270ED8938]();
}

uint64_t ccder_encode_body()
{
  return MEMORY[0x270ED8940]();
}

uint64_t ccder_encode_body_nocopy()
{
  return MEMORY[0x270ED8948]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x270ED8950]();
}

uint64_t ccder_encode_tl()
{
  return MEMORY[0x270ED8970]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x270ED8978]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x270ED8980]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x270ED89B0]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x270ED89C0]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x270ED89D8]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x270ED8A10]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x270ED8B58]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x270ED8B60]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x270ED8B78]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x270ED8B90]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x270ED8B98]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x270ED8BA0]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x270ED8D98]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x270ED8DA8]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x270ED8DB0]();
}

uint64_t ccsrp_ctx_init()
{
  return MEMORY[0x270ED8DB8]();
}

uint64_t ccsrp_exchange_size()
{
  return MEMORY[0x270ED8DC8]();
}

uint64_t ccsrp_generate_salt_and_verification()
{
  return MEMORY[0x270ED8DD0]();
}

uint64_t ccsrp_get_session_key()
{
  return MEMORY[0x270ED8DE0]();
}

uint64_t ccsrp_gp_rfc5054_3072()
{
  return MEMORY[0x270ED8E00]();
}

uint64_t ccsrp_server_start_authentication()
{
  return MEMORY[0x270ED8E20]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x270ED8E28]();
}

uint64_t ccsrp_session_size()
{
  return MEMORY[0x270ED8E30]();
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F50](*(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F60](*(void *)&algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}