id sub_1000034C8()
{
  void *v0;
  uint64_t vars8;

  if (qword_10002C260 != -1) {
    dispatch_once(&qword_10002C260, &stru_100024458);
  }
  v0 = (void *)qword_10002C268;

  return v0;
}

id sub_100003718(id result, uint64_t a2)
{
  if (result)
  {
    if (a2) {
      return +[IOKitNotificationPort callbackWithContext:result iterator:a2];
    }
  }
  return result;
}

CFMutableDictionaryRef sub_100003EE8(uint64_t a1)
{
  CFMutableDictionaryRef v1 = IORegistryEntryIDMatching(a1);

  return v1;
}

uint64_t sub_100003F10(void *a1)
{
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID((io_registry_entry_t)[a1 holder], &entryID))
  {
    CFMutableDictionaryRef v1 = sub_1000034C8();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100016604();
    }
  }
  return entryID;
}

IOKitObjectHolder *sub_100003F74(void *a1, unsigned int a2)
{
  id v3 = a1;
  v4 = [IOKitObjectHolder alloc];
  CFDictionaryRef v5 = (const __CFDictionary *)v3;
  v6 = [(IOKitObjectHolder *)v4 initWithRetainedObject:IOServiceGetMatchingService(kIOMainPortDefault, v5)];
  v7 = v6;
  if (a2 > 0x18 || v6)
  {
    if (!v6)
    {
      v10 = sub_1000034C8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000166AC();
      }
    }
    v9 = v7;
  }
  else
  {
    v8 = sub_1000034C8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100016638();
    }

    +[NSThread sleepForTimeInterval:0.01];
    sub_100003F74(v5, a2 + 1);
    v9 = (IOKitObjectHolder *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

IOKitObjectHolder *sub_100004098(void *a1)
{
  return sub_100003F74(a1, 0);
}

void sub_1000040A0(id a1)
{
  qword_10002C268 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

void sub_1000040E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004100(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void start()
{
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100024498);
  dispatch_main();
}

void sub_100004180(id a1, OS_xpc_object *a2)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "IOMatchLaunchServiceID");
  id v3 = sub_100004290();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001678C(uint64, v3);
  }

  v4 = sub_100003EE8(uint64);
  CFDictionaryRef v5 = sub_100004290();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016714((uint64_t)v4, v5);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000042E4;
  v7[3] = &unk_1000244C0;
  id v8 = v4;
  id v6 = v4;
  +[Synchronize sync:v7];
}

id sub_100004290()
{
  if (qword_10002C270 != -1) {
    dispatch_once(&qword_10002C270, &stru_1000244E0);
  }
  v0 = (void *)qword_10002C278;

  return v0;
}

void sub_1000042E4(uint64_t a1)
{
  sub_100004098(*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  +[Device registerService:v1];
}

void sub_100004334(id a1)
{
  qword_10002C278 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

id sub_100004704(uint64_t a1)
{
  v9[0] = @"productId";
  v2 = [*(id *)(a1 + 32) device];
  id v3 = [v2 productId];
  v10[0] = v3;
  v9[1] = @"vendorId";
  v4 = [*(id *)(a1 + 32) device];
  CFDictionaryRef v5 = [v4 vendorId];
  v9[2] = @"failureType";
  uint64_t v6 = *(void *)(a1 + 40);
  v10[1] = v5;
  v10[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id sub_1000049C0()
{
  if (qword_10002C280 != -1) {
    dispatch_once(&qword_10002C280, &stru_100024700);
  }
  v0 = (void *)qword_10002C288;

  return v0;
}

void sub_100005270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005288(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005298(uint64_t a1)
{
}

void sub_1000052A0(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100016D0C();
  }

  if ([*(id *)(a1 + 32) cardPresent])
  {
    id v3 = *(void **)(a1 + 32);
    if (v3[9]) {
      [v3 warmResetCard];
    }
    else {
    uint64_t v4 = [v3 coldResetCard];
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    CFDictionaryRef v5 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v4;
  }
  else
  {
    CFDictionaryRef v5 = sub_1000049C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100016CD8();
    }
  }
}

int64_t sub_10000562C(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a3;
  LODWORD(a2) = [(NSNumber *)a2 unsignedIntValue];
  unsigned int v5 = [(NSNumber *)v4 unsignedIntValue];

  return a2 < v5;
}

int64_t sub_100005958(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a3;
  LODWORD(a2) = [(NSNumber *)a2 unsignedIntValue];
  unsigned int v5 = [(NSNumber *)v4 unsignedIntValue];

  return a2 < v5;
}

void sub_100005BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005BDC(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100016F88(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  if ([*(id *)(a1 + 32) cardPresent])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v10 = +[CCIDMessageView create:99];
    v11 = [v9 transmitAndReceive:v10 maxPayload:10 transmitted:0];

    +[NSThread sleepForTimeInterval:0.01];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 72);
    *(void *)(v12 + 72) = 0;

    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) cardNotify:0];
    }
    if ([v11 messageType] == 129
      || ([v11 status],
          v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 bmCommandStatus],
          v14,
          !v15))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    v11 = sub_1000049C0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100016CD8();
    }
  }
}

void sub_1000081E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008200(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000179AC(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t v9 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) cardPresent])
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if ((v10 & 2) != 0)
    {
      v11 = [*v9 device];
      uint64_t v12 = [v11 CCIDDescriptor];
      uint64_t v13 = 2;
      unsigned __int8 v14 = [v12 isSupported:2];

      if (v14)
      {
LABEL_9:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) setProtocol:v13];
        return;
      }
      uint64_t v10 = *(void *)(a1 + 48);
    }
    if (v10)
    {
      unsigned int v15 = [*v9 device];
      v16 = [v15 CCIDDescriptor];
      uint64_t v13 = 1;
      unsigned __int8 v17 = [v16 isSupported:1];

      if (v17) {
        goto LABEL_9;
      }
    }
    v18 = sub_1000049C0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000178BC(v9, v18);
    }
  }
  else
  {
    v18 = sub_1000049C0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100016CD8();
    }
  }
}

void sub_1000084A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000084B8(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100017A1C();
  }

  if ([*(id *)(a1 + 32) cardPresent])
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) transmit:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(NSObject **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v5 = sub_1000049C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100016CD8();
    }
  }
}

void sub_1000086A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000086C0(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100017A50();
  }

  uint64_t v3 = [*(id *)(a1 + 32) escapeCommand:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_1000087B0(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100017A84();
  }

  return [*(id *)(a1 + 32) cardNotify:0];
}

void sub_10000888C(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100017AB8();
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = +[CCIDMessageView create:101];
  uint64_t v5 = [v3 transmitAndReceive:v4 maxPayload:10 transmitted:0];

  if ([v5 messageType] == 129)
  {
    uint64_t v6 = [v5 status];
    if ([v6 bmCommandStatus])
    {
      unsigned int v7 = [v5 bError];

      if (v7 != -2) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 status];
    objc_msgSend(v8, "cardNotify:", objc_msgSend(v9, "bmICCStatus") != 2);
  }
LABEL_9:
}

void sub_100008ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008AF4(uint64_t a1)
{
  v2 = sub_1000049C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100017B88();
  }

  if ([*(id *)(a1 + 32) cardPresent])
  {
    uint64_t v3 = a1 + 40;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [*(id *)(a1 + 32) verifyPINSecure:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
LABEL_10:
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = *(NSObject **)(v6 + 40);
      *(void *)(v6 + 40) = v4;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [*(id *)(a1 + 32) changePINSecure:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
      goto LABEL_10;
    }
    if (*(void *)(a1 + 56))
    {
      **(void **)(a1 + 56) = +[NSError errorWithDomain:TKErrorDomain code:-1 userInfo:0];
    }
    uint64_t v5 = sub_1000049C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100017AEC(v3, v5);
    }
  }
  else
  {
    uint64_t v5 = sub_1000049C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100016CD8();
    }
  }
LABEL_15:
}

int64_t sub_100009450(id a1, CCIDFiAndDi *a2, CCIDFiAndDi *a3)
{
  uint64_t v4 = a3;
  LODWORD(a2) = [(CCIDFiAndDi *)a2 bpsMax];
  unsigned int v5 = [(CCIDFiAndDi *)v4 bpsMax];

  return a2 < v5;
}

int64_t sub_10000994C(id a1, CCIDFiAndDi *a2, CCIDFiAndDi *a3)
{
  uint64_t v4 = a3;
  LODWORD(a2) = [(CCIDFiAndDi *)a2 bpsMax];
  unsigned int v5 = [(CCIDFiAndDi *)v4 bpsMax];

  return a2 < v5;
}

id sub_100009E74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  if (v2)
  {
    uint64_t v3 = sub_1000049C0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000180FC();
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) device];
    unsigned int v5 = [v4 CCIDDescriptor];
    uint64_t v2 = [v5 dwMaxCCIDMessageLength];

    uint64_t v3 = sub_1000049C0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100018094();
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setBSlot:", objc_msgSend(*(id *)(a1 + 32), "slotNumber"));
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = [v6 unsignedCharValue];
    [*(id *)(a1 + 40) setBSeq:v7];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) device];
    id v7 = [v8 messageSequenceNumber];
    [*(id *)(a1 + 40) setBSeq:v7];
  }
  uint64_t v9 = sub_1000049C0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100018024(a1 + 40, v9, v10, v11, v12, v13, v14, v15);
  }

  v16 = *(void **)(*(void *)(a1 + 32) + 64);
  unsigned __int8 v17 = [*(id *)(a1 + 40) buffer];
  id v18 = [v16 send:v17 timeout:*(void *)(a1 + 56)];

  v19 = [*(id *)(a1 + 40) buffer];
  id v20 = [v19 length];

  if (v18 == v20)
  {
    uint64_t v21 = *(void *)(a1 + 72);
    if (v21) {
      (*(void (**)(void))(v21 + 16))();
    }
    v22 = [*(id *)(a1 + 32) receiveMessageWitMaxPayload:v2 sequenceNumber:v7 duplicateMessage:0 timeout:*(void *)(a1 + 64)];
    v23 = sub_1000049C0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100017F88();
    }
  }
  else
  {
    v24 = sub_1000049C0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100017FF0();
    }

    [*(id *)(a1 + 32) sendAnalyticsFailure:2];
    v22 = 0;
  }

  return v22;
}

void sub_10000A430(id a1)
{
  qword_10002C288 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

void sub_10000A474(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000A490(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000A4AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10000A4C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10000A4F8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10000A518(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

double sub_10000A538@<D0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 8) = a2;
  return (double)a1;
}

id sub_10000AB84()
{
  if (qword_10002C290 != -1) {
    dispatch_once(&qword_10002C290, &stru_1000247A0);
  }
  v0 = (void *)qword_10002C298;

  return v0;
}

id sub_10000CF04(uint64_t a1)
{
  [*(id *)(a1 + 32) setLength:0];
  [*(id *)(a1 + 40) dequeueAllBlocks];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = v2[25];

  return [v2 fillQueue:v3 request:v4 ifs:v5];
}

id sub_10000CF5C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 23) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 21) = 0;
  id result = [*(id *)(a1 + 40) resetSequence];
  *(unsigned char *)(*(void *)(a1 + 32) + 20) = (_BYTE)result;
  return result;
}

uint64_t sub_10000CFB4(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) uint8Value];
    return (uint64_t)[v3 waitingTime:v4];
  }
  return result;
}

void sub_10000D370(id a1)
{
  qword_10002C298 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

void sub_10000D3B4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

unsigned char *sub_10000D3D0(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void sub_10000D4B0(id a1)
{
  qword_10002C2A8 = (uint64_t)dispatch_queue_create("", 0);

  _objc_release_x1();
}

uint64_t sub_10000D59C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000D658(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000D714(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000D7D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000DF3C()
{
  if (qword_10002C2B0 != -1) {
    dispatch_once(&qword_10002C2B0, &stru_100024840);
  }
  v0 = (void *)qword_10002C2B8;

  return v0;
}

void sub_10000F124(id a1)
{
  qword_10002C2B8 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

void sub_10000F168(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_10000F564()
{
  if (qword_10002C2E0 != -1) {
    dispatch_once(&qword_10002C2E0, &stru_100024A10);
  }
  v0 = (void *)qword_10002C2E8;

  return v0;
}

void sub_10000F6A8(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v2 = sub_10000F564();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100018CCC(v1, v2);
    }

    [*(id *)(*(void *)v1 + 24) terminate];
    uint64_t v3 = *(void **)(*(void *)v1 + 24);
    *(void *)(*(void *)v1 + 24) = 0;
  }
}

void sub_10000F9AC(id a1)
{
  qword_10002C2C0 = objc_opt_new();

  _objc_release_x1();
}

void sub_10000FA3C(id a1)
{
  qword_10002C2D0 = [[Synchronize alloc] initWithQueueName:@"com.apple.ctk.ccid.device"];

  _objc_release_x1();
}

void sub_10000FD64(uint64_t a1)
{
  if ((int)a1 > -536870353)
  {
    if ((int)a1 > -536870257)
    {
      if ((int)a1 <= -536870113)
      {
        switch(a1)
        {
          case 0xE0000290:
            uint64_t v1 = @"kIOMessageSystemWillNotSleep";
            goto LABEL_69;
          case 0xE0000300:
            uint64_t v1 = @"kIOMessageSystemHasPoweredOn";
            goto LABEL_69;
          case 0xE0000310:
            uint64_t v1 = @"kIOMessageSystemWillRestart";
            goto LABEL_69;
        }
      }
      else if ((int)a1 > -536870081)
      {
        if (a1 == -536870080)
        {
          uint64_t v1 = @"kIOMessageSystemCapabilityChange";
          goto LABEL_69;
        }
        if (a1 == -536870064)
        {
          uint64_t v1 = @"kIOMessageDeviceSignaledWakeup";
          goto LABEL_69;
        }
      }
      else
      {
        if (a1 == -536870112)
        {
          uint64_t v1 = @"kIOMessageSystemWillPowerOn";
          goto LABEL_69;
        }
        if (a1 == -536870096)
        {
          uint64_t v1 = @"kIOMessageCopyClientID";
          goto LABEL_69;
        }
      }
    }
    else if ((int)a1 <= -536870316)
    {
      switch(a1)
      {
        case 0xE0000230:
          uint64_t v1 = @"kIOMessageDeviceHasPoweredOn";
          goto LABEL_69;
        case 0xE0000240:
          uint64_t v1 = @"kIOMessageCanSystemPowerOff";
          goto LABEL_69;
        case 0xE0000250:
          uint64_t v1 = @"kIOMessageSystemWillPowerOff";
          goto LABEL_69;
      }
    }
    else if ((int)a1 > -536870289)
    {
      if (a1 == -536870288)
      {
        uint64_t v1 = @"kIOMessageCanSystemSleep";
        goto LABEL_69;
      }
      if (a1 == -536870272)
      {
        uint64_t v1 = @"kIOMessageSystemWillSleep";
        goto LABEL_69;
      }
    }
    else
    {
      if (a1 == -536870315)
      {
        uint64_t v1 = @"kIOMessageSystemPagingOff";
        goto LABEL_69;
      }
      if (a1 == -536870304)
      {
        uint64_t v1 = @"kIOMessageSystemWillNotPowerOff";
        goto LABEL_69;
      }
    }
  }
  else if ((int)a1 > -536870617)
  {
    if ((int)a1 <= -536870385)
    {
      switch(a1)
      {
        case 0xE0000128:
          uint64_t v1 = @"kIOMessageConsoleSecurityChange";
          goto LABEL_69;
        case 0xE0000130:
          uint64_t v1 = @"kIOMessageServicePropertyChange";
          goto LABEL_69;
        case 0xE0000200:
          uint64_t v1 = @"kIOMessageCanDevicePowerOff";
          goto LABEL_69;
      }
    }
    else if ((int)a1 > -536870369)
    {
      if (a1 == -536870368)
      {
        uint64_t v1 = @"kIOMessageDeviceWillNotPowerOff";
        goto LABEL_69;
      }
      if (a1 == -536870363)
      {
        uint64_t v1 = @"kIOMessageDeviceHasPoweredOff";
        goto LABEL_69;
      }
    }
    else
    {
      if (a1 == -536870384)
      {
        uint64_t v1 = @"kIOMessageDeviceWillPowerOff";
        goto LABEL_69;
      }
      if (a1 == -536870379)
      {
        uint64_t v1 = @"kIOMessageDeviceWillPowerOn";
        goto LABEL_69;
      }
    }
  }
  else if ((int)a1 <= -536870657)
  {
    switch(a1)
    {
      case 0xE0000010:
        uint64_t v1 = @"kIOMessageServiceIsTerminated";
        goto LABEL_69;
      case 0xE0000020:
        uint64_t v1 = @"kIOMessageServiceIsSuspended";
        goto LABEL_69;
      case 0xE0000030:
        uint64_t v1 = @"kIOMessageServiceIsResumed";
        goto LABEL_69;
    }
  }
  else if ((int)a1 > -536870641)
  {
    if (a1 == -536870640)
    {
      uint64_t v1 = @"kIOMessageServiceWasClosed";
      goto LABEL_69;
    }
    if (a1 == -536870624)
    {
      uint64_t v1 = @"kIOMessageServiceBusyStateChange";
      goto LABEL_69;
    }
  }
  else
  {
    if (a1 == -536870656)
    {
      uint64_t v1 = @"kIOMessageServiceIsRequestingClose";
      goto LABEL_69;
    }
    if (a1 == -536870655)
    {
      uint64_t v1 = @"kIOMessageServiceIsAttemptingOpen";
      goto LABEL_69;
    }
  }
  uint64_t v1 = +[NSString stringWithFormat:@"unknown message: %x", a1];
LABEL_69:
  uint64_t v2 = sub_10000F564();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100018E10((uint64_t)v1, v2);
  }
}

void sub_10001074C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_100010770(uint64_t a1)
{
  uint64_t state64 = 0;
  if (notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 48), &state64))
  {
    uint64_t v1 = sub_10000F564();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100018FC4();
    }
  }
  if (!state64) {
    return 0;
  }
  uint64_t v2 = sub_10000F564();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100018F90();
  }

  return state64;
}

void sub_100010810(uint64_t a1)
{
  uint64_t v2 = sub_10000F564();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received kACCEASessionStatusChangedNotification", v4, 2u);
  }

  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained terminate];
  }
}

void sub_1000112C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

NSDictionary *__cdecl sub_100011328(id a1)
{
  return (NSDictionary *)&off_1000273B8;
}

void sub_100011334(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  sub_10000FD64(a3);
  if (a3 == -536870640)
  {
    uint64_t v6 = +[Device synchronize];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100011420;
    v7[3] = &unk_100024978;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    [v6 sync:v7];

    objc_destroyWeak(&v8);
  }
}

void sub_10001140C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100011420(uint64_t a1)
{
  uint64_t v2 = sub_10000F564();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000192D0();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained terminate];
}

void sub_100011574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100011588(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained CCIDDescriptor];
  unsigned int v5 = [v4 bMaxSlotIndex] >> 2;

  if (v5 <= 3) {
    int v6 = 3;
  }
  else {
    int v6 = v5;
  }
  id v7 = [*(id *)(a1 + 32) receive:(v6 + 1) timeout:&off_1000272C8];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(v2);
    [v8 watchInterruptPipe:*(void *)(a1 + 32)];

    if ((unint64_t)[v7 length] >= 2)
    {
      id v9 = v7;
      if (*(unsigned char *)[v9 bytes] == 80)
      {
        if ([*(id *)(*(void *)(a1 + 40) + 24) count])
        {
          char v10 = 0;
          unint64_t v11 = 0;
          do
          {
            unint64_t v12 = (v11 >> 2) + 1;
            if (v12 >= (unint64_t)[v9 length]) {
              break;
            }
            uint64_t v13 = (*((unsigned __int8 *)[v9 bytes] + v12) >> (v10 & 6)) & 3;
            if (v13 >= 2)
            {
              uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 24) objectAtIndexedSubscript:v11];
              uint64_t v15 = [v14 synchronize];
              v16 = [v15 queue];
              v18[0] = _NSConcreteStackBlock;
              v18[1] = 3221225472;
              v18[2] = sub_10001178C;
              v18[3] = &unk_1000249C8;
              id v19 = v14;
              uint64_t v20 = v13;
              id v17 = v14;
              dispatch_async(v16, v18);
            }
            ++v11;
            v10 += 2;
          }
          while (v11 < (unint64_t)[*(id *)(*(void *)(a1 + 40) + 24) count]);
        }
      }
    }
  }
}

id sub_10001178C(uint64_t a1)
{
  return [*(id *)(a1 + 32) cardNotify:*(_DWORD *)(a1 + 40) & 1];
}

void sub_10001184C(uint64_t a1)
{
  uint64_t v1 = [[Device alloc] initWithService:*(void *)(a1 + 32)];
  if (v1)
  {
    uint64_t v2 = +[Device devices];
    uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:[(Device *)v1 entryID]];
    [v2 setObject:v1 forKeyedSubscript:v3];
  }
  else
  {
    uint64_t v2 = sub_10000F564();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_100019304();
    }
  }
}

void sub_100011A30(id a1)
{
  qword_10002C2E8 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

void sub_100011A74(id a1)
{
  id v1 = (id)CFPreferencesCopyValue(@"SlotNameWithUSBLocation", @"com.apple.security.smartcard", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      byte_10002C2F0 = [v1 BOOLValue];
    }
  }
}

void sub_100011B04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100014520(id a1)
{
  v3[0] = &off_100026F10;
  v3[1] = &off_100026F58;
  v4[0] = &off_1000273E0;
  v4[1] = &off_1000273F8;
  v3[2] = &off_100026F88;
  v3[3] = &off_100026FD0;
  v4[2] = &off_100027410;
  v4[3] = &off_100027428;
  v3[4] = &off_100027018;
  v3[5] = &off_100027060;
  v4[4] = &off_100027440;
  v4[5] = &off_100027458;
  v3[6] = &off_1000270A8;
  v3[7] = &off_1000270F0;
  v4[6] = &off_100027470;
  v4[7] = &off_100027488;
  v3[8] = &off_100027120;
  v3[9] = &off_100027168;
  v4[8] = &off_1000274A0;
  v4[9] = &off_1000274B8;
  v3[10] = &off_1000271B0;
  v3[11] = &off_1000271F8;
  v4[10] = &off_1000274D0;
  v4[11] = &off_1000274E8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
  uint64_t v2 = (void *)qword_10002C300;
  qword_10002C300 = v1;
}

void sub_1000146D8(id a1)
{
  v3[0] = &off_100026F58;
  v3[1] = &off_100026F88;
  v4[0] = &off_100026F58;
  v4[1] = &off_100026F88;
  v3[2] = &off_100026FD0;
  v3[3] = &off_100027018;
  v4[2] = &off_100027018;
  v4[3] = &off_100027228;
  v3[4] = &off_100027060;
  v3[5] = &off_1000270A8;
  v4[4] = &off_100027240;
  v4[5] = &off_100027258;
  v3[6] = &off_100027270;
  v3[7] = &off_100027228;
  v4[6] = &off_100027288;
  v4[7] = &off_1000271B0;
  v3[8] = &off_1000270F0;
  v4[8] = &off_1000272A0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:9];
  uint64_t v2 = (void *)qword_10002C310;
  qword_10002C310 = v1;
}

id sub_1000149AC()
{
  if (qword_10002C320 != -1) {
    dispatch_once(&qword_10002C320, &stru_100024A90);
  }
  v0 = (void *)qword_10002C328;

  return v0;
}

void sub_1000162F8(id a1)
{
  qword_10002C328 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ccid");

  _objc_release_x1();
}

void sub_10001633C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100016368()
{
  sub_100004134();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "IOObjectRetain failed with: %d", v1, 8u);
}

void sub_1000163DC(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification failed with: %d %{public}@", (uint8_t *)v3, 0x12u);
}

void sub_100016464()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "CCID USB Interface does not have descriptor 0x21", v2, v3, v4, v5, v6);
}

void sub_100016498()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "CCID USB Interface does not have proper descriptor 0x21", v2, v3, v4, v5, v6);
}

void sub_1000164CC()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Failed to copy IOUSBHostPipe %{public}@", v2, v3, v4, v5, v6);
}

void sub_100016534()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "IOUSBHostPipe::send failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001659C()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "IOUSBHostPipe::receive failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100016604()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to get entry ID for a service.", v2, v3, v4, v5, v6);
}

void sub_100016638()
{
  sub_100004134();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "serviceForMatching try: %d", v1, 8u);
}

void sub_1000166AC()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "serviceForMatching failed for :%{public}@", v2, v3, v4, v5, v6);
}

void sub_100016714(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Matching: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001678C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "IOKit matching EntryId: %llx", (uint8_t *)&v2, 0xCu);
}

void sub_100016804(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 bytes];
  uint64_t v4 = [v3 hexString];
  sub_100004128();
  sub_10000A4AC((void *)&_mh_execute_header, a2, v5, "Warm ATR: %{public}@", v6);
}

void sub_1000168AC()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Card failed to power on", v2, v3, v4, v5, v6);
}

void sub_1000168E0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Warm reset", v2, v3, v4, v5, v6);
}

void sub_100016914()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "The automaticICCVoltageSelection failed", v2, v3, v4, v5, v6);
}

void sub_100016948(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bytes];
  uint64_t v4 = [v3 hexString];
  sub_100004128();
  sub_10000A4AC((void *)&_mh_execute_header, a2, v5, "Cold ATR: %{public}@", v6);
}

void sub_1000169EC(uint8_t *a1, void *a2, unsigned int *a3, NSObject *a4)
{
  unsigned int v7 = [a2 bPowerSelect];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Failed to select voltage: %d", a1, 8u);
}

void sub_100016A58()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to power off card", v2, v3, v4, v5, v6);
}

void sub_100016A8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016AFC()
{
  sub_100004134();
  sub_10000A4C4((void *)&_mh_execute_header, v0, v1, "ICC Classes supported by ICC and CCID: %d", v2, v3, v4, v5, v6);
}

void sub_100016B64()
{
  sub_100004134();
  sub_10000A4C4((void *)&_mh_execute_header, v0, v1, "ICC Classes from ATR: %d", v2, v3, v4, v5, v6);
}

void sub_100016BCC()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "The automaticICCActivation failed", v2, v3, v4, v5, v6);
}

void sub_100016C00(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 aPayload];
  uint64_t v4 = [v3 hexString];
  sub_100004128();
  sub_10000A4AC((void *)&_mh_execute_header, a2, v5, "Cold ATR: %{public}@", v6);
}

void sub_100016CA4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Cold reset", v2, v3, v4, v5, v6);
}

void sub_100016CD8()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "The slot has no card!", v2, v3, v4, v5, v6);
}

void sub_100016D0C()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "engineResetCard", v2, v3, v4, v5, v6);
}

void sub_100016D40()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Failed to send device request: %@", v2, v3, v4, v5, v6);
}

void sub_100016DA8(void *a1)
{
  uint64_t v1 = [a1 device];
  uint64_t v2 = [v1 CCIDDescriptor];
  [v2 bNumDataRatesSupported];
  sub_100004134();
  sub_10000A4F8((void *)&_mh_execute_header, v3, v4, "getDataRates: %d", v5, v6, v7, v8, v9);
}

void sub_100016E48(void *a1)
{
  uint64_t v1 = [a1 device];
  uint64_t v2 = [v1 CCIDDescriptor];
  [v2 bNumClockSupported];
  sub_100004134();
  sub_10000A4F8((void *)&_mh_execute_header, v3, v4, "getClockFrequencies: %d", v5, v6, v7, v8, v9);
}

void sub_100016EE8(unsigned __int8 a1, void *a2, NSObject *a3)
{
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  unsigned int v6 = [a2 slotNumber];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "abortSequence: %d slotNumber: %d", (uint8_t *)v4, 0xEu);
}

void sub_100016F88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016FF8()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "getParameters: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100017060(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 slotName];
  sub_100004128();
  sub_10000A4AC((void *)&_mh_execute_header, a2, v4, "The %{public}@ does not implement 'GetParameters'", v5);
}

void sub_1000170EC()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "setParameters returns: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100017154()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to set parameters.", v2, v3, v4, v5, v6);
}

void sub_100017188(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 buffer];
  uint64_t v5 = [v4 hexString];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "setParameters: %{public}@ buffer: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100017248()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "resetParameters returns: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000172B0()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to reset parameters.", v2, v3, v4, v5, v6);
}

void sub_1000172E4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "resetParameters", v2, v3, v4, v5, v6);
}

void sub_100017318()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to escape command.", v2, v3, v4, v5, v6);
}

void sub_10001734C()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "escape: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000173B4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "card in default state, PPS skipped", v2, v3, v4, v5, v6);
}

void sub_1000173E8()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void sub_100017450()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Wrong FIndexDIndex from T0: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000174B8()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "setProtocol return %lu", v2, v3, v4, v5, v6);
}

void sub_100017520()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Wrong FIndexDIndex from T1: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100017588()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Failed to set parameters: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000175F0(void *a1, NSObject *a2)
{
  [a1 fIndexDIndex];
  sub_100004134();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Card rejected FIndexDIndex: 0x%.2x", v3, 8u);
}

void sub_100017678()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "setProtocol %lu", v2, v3, v4, v5, v6);
}

void sub_1000176E0()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "failed to Negotiate transmission parameters", v2, v3, v4, v5, v6);
}

void sub_100017714()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "card card in specific mode", v2, v3, v4, v5, v6);
}

void sub_100017748()
{
  sub_100004128();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to set frequency and data rate: %{public}@(%{public}@)", v2, 0x16u);
}

double sub_1000177CC(unsigned int a1)
{
  sub_10000A538(a1, __stack_chk_guard);
  sub_10000A490((void *)&_mh_execute_header, v1, v2, "Set reader data rate to: %.3f kbps", v3, v4, v5, v6, 0);
  return result;
}

double sub_100017844(unsigned int a1)
{
  sub_10000A538(a1, __stack_chk_guard);
  sub_10000A490((void *)&_mh_execute_header, v1, v2, "Set reader frequency to: %.1fMHz", v3, v4, v5, v6, 0);
  return result;
}

void sub_1000178BC(id *a1, NSObject *a2)
{
  uint64_t v4 = [*a1 device];
  uint64_t v5 = [v4 vendorName];
  uint64_t v6 = [*a1 device];
  uint64_t v7 = [v6 productName];
  int v8 = 138543618;
  uint8_t v9 = v5;
  __int16 v10 = 2114;
  unint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "The reader %{public}@ %{public}@ dose not support suggested protocol", (uint8_t *)&v8, 0x16u);
}

void sub_1000179AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017A1C()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "engine transmit", v2, v3, v4, v5, v6);
}

void sub_100017A50()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "engine escape", v2, v3, v4, v5, v6);
}

void sub_100017A84()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "system will sleep", v2, v3, v4, v5, v6);
}

void sub_100017AB8()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "system waking up", v2, v3, v4, v5, v6);
}

void sub_100017AEC(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  sub_100004128();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unsupported user interaction: %{public}@", v5, 0xCu);
}

void sub_100017B88()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "engine runUserInteraction", v2, v3, v4, v5, v6);
}

void sub_100017BBC()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Reader does not support secure PIN verification", v2, v3, v4, v5, v6);
}

void sub_100017BF0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "verifyPINSecure", v2, v3, v4, v5, v6);
}

void sub_100017C24()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Reader does not support secure PIN change", v2, v3, v4, v5, v6);
}

void sub_100017C58()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "changePINSecure", v2, v3, v4, v5, v6);
}

void sub_100017C8C()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "selected FIndexDIndex: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100017CF4(unsigned int a1)
{
  sub_10000A538(a1, __stack_chk_guard);
  sub_10000A4E0();
  sub_10000A518((void *)&_mh_execute_header, v1, v2, "reader fMax %.1f MHz bpsMax %d bits/s", v3, v4);
}

void sub_100017D68()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "card FIndexDIndex %{public}@)", v2, v3, v4, v5, v6);
}

void sub_100017DD0()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Commnication error", v2, v3, v4, v5, v6);
}

void sub_100017E04()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Time extension received", v2, v3, v4, v5, v6);
}

void sub_100017E38()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Received message with wrong slot sequence number: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100017EA0()
{
  sub_100004128();
  sub_1000040E4((void *)&_mh_execute_header, v0, v1, "Received message with wrong slot number: %{private}@", v2, v3, v4, v5, v6);
}

void sub_100017F08(void *a1, NSObject *a2)
{
  [a1 length];
  sub_100004128();
  sub_10000A4AC((void *)&_mh_execute_header, a2, v3, "Maximum responde length exceeded (%lu)!", v4);
}

void sub_100017F88()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "received %{public}@", v2, v3, v4, v5, v6);
}

void sub_100017FF0()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to send message", v2, v3, v4, v5, v6);
}

void sub_100018024(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018094()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "transmitAndReceive maxPayload set to maxCCIDMessageLength (%lu)", v2, v3, v4, v5, v6);
}

void sub_1000180FC()
{
  sub_100004128();
  sub_10000A490((void *)&_mh_execute_header, v0, v1, "transmitAndReceive maxPayload:%lu", v2, v3, v4, v5, v6);
}

void sub_100018164(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "APDU %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000181DC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to decode APDU: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100018258()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Unexpected message type", v2, v3, v4, v5, v6);
}

void sub_10001828C()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "APDU Mapping transmit", v2, v3, v4, v5, v6);
}

void sub_1000182C0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "APDU Mapping secure", v2, v3, v4, v5, v6);
}

void sub_1000182F4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Requesting next I-Block sequence", v2, v3, v4, v5, v6);
}

void sub_100018328()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Card acknowledged I-Block request", v2, v3, v4, v5, v6);
}

void sub_10001835C()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Detected card sequence error", v2, v3, v4, v5, v6);
}

void sub_100018390()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Handling I-Block response", v2, v3, v4, v5, v6);
}

void sub_1000183C4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Card acknowledged I-Block sequence", v2, v3, v4, v5, v6);
}

void sub_1000183F8()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Resend I-Block acknowledgment requested", v2, v3, v4, v5, v6);
}

void sub_10001842C()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Handling R-Block response", v2, v3, v4, v5, v6);
}

void sub_100018460(void *a1)
{
  [a1 uint8Value];
  sub_10000A4F8((void *)&_mh_execute_header, v1, v2, "WTX requested by card %d", v3, v4, v5, v6, 0);
}

void sub_1000184DC(void *a1)
{
  [a1 uint8Value];
  sub_10000A4F8((void *)&_mh_execute_header, v1, v2, "New IFS requested by card %d", v3, v4, v5, v6, 0);
}

void sub_100018558()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Abort requested by card", v2, v3, v4, v5, v6);
}

void sub_10001858C()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Resynch requested by card!", v2, v3, v4, v5, v6);
}

void sub_1000185C0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Card acknowledged IFS request", v2, v3, v4, v5, v6);
}

void sub_1000185F4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Card acknowledged ABORT request", v2, v3, v4, v5, v6);
}

void sub_100018628()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Card acknowledged RESYNCH request", v2, v3, v4, v5, v6);
}

void sub_10001865C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unhadled S-Block response: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000186D4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Handlin S-Block response", v2, v3, v4, v5, v6);
}

void sub_100018708(unsigned char *a1, unsigned char *a2)
{
  sub_10000D3D0(a1, a2);
  sub_10000D3B4((void *)&_mh_execute_header, v2, v3, "Three failures at start of the transmission protocol, card deactivated", v4);
}

void sub_100018734(unsigned char *a1, unsigned char *a2)
{
  sub_10000D3D0(a1, a2);
  sub_10000D3B4((void *)&_mh_execute_header, v2, v3, "Requesting RESYNCH", v4);
}

void sub_100018760(unsigned char *a1, unsigned char *a2)
{
  sub_10000D3D0(a1, a2);
  sub_10000D3B4((void *)&_mh_execute_header, v2, v3, "RESYNCH failed three times in row, card deactivated", v4);
}

void sub_10001878C()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Card is deactivated, because is unresponsive", v2, v3, v4, v5, v6);
}

void sub_1000187C0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "T1 APDU Mapping transmit", v2, v3, v4, v5, v6);
}

void sub_1000187F4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "T1 APDU Mapping secure", v2, v3, v4, v5, v6);
}

void sub_100018828(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Minimum length of T1 TPDU block data is 4 bytes", v1, 2u);
}

void sub_10001886C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to verify redundancy code.", v1, 2u);
}

void sub_1000188B0(void *a1)
{
  [a1 status];
  sub_100004134();
  sub_10000F168((void *)&_mh_execute_header, v1, v2, "Invalid R-Block status %d", v3, v4, v5, v6, v7);
}

void sub_100018928(void *a1)
{
  [a1 lengthByte];
  sub_100004134();
  sub_10000F168((void *)&_mh_execute_header, v1, v2, "Invalid R-Block, inf field shall be absent (%d))", v3, v4, v5, v6, v7);
}

void sub_1000189A0(void *a1)
{
  [a1 operation];
  sub_100004134();
  sub_10000A4F8((void *)&_mh_execute_header, v1, v2, "Invalid S-Block operation %d", v3, v4, v5, v6, v7);
}

void sub_100018A18(void *a1)
{
  [a1 lengthByte];
  sub_100004134();
  sub_10000A4F8((void *)&_mh_execute_header, v1, v2, "Invalid S-Block, inf field shall be absent in an S-Block managing chain abortion or resynchronization (%d)", v3, v4, v5, v6, v7);
}

void sub_100018A90(void *a1)
{
  [a1 lengthByte];
  sub_100004134();
  sub_10000A4F8((void *)&_mh_execute_header, v1, v2, "Invalid S-Block, inf field shall be present with a single byte for adjusting IFS and WTX (%d)", v3, v4, v5, v6, v7);
}

void sub_100018B08(unsigned __int8 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Slot %d successfully registered.", (uint8_t *)v2, 8u);
}

void sub_100018B84(unsigned __int8 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to register slot : %d", (uint8_t *)v2, 8u);
}

void sub_100018C00(id *a1)
{
  uint64_t v2 = [*a1 slotParameters];
  [v2 maxOutputLength];
  uint64_t v3 = [*a1 slotParameters];
  [v3 maxInputLength];
  sub_100011B20();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x16u);
}

void sub_100018CCC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 48);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Slot '%{public}@': terminated", (uint8_t *)&v3, 0xCu);
}

void sub_100018D4C(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 16);
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "slot %d: card status changed: present=%d", (uint8_t *)v5, 0xEu);
}

void sub_100018DDC()
{
  sub_10000411C();
  sub_100011B04((void *)&_mh_execute_header, v0, v1, "must be overridden", v2, v3, v4, v5, v6);
}

void sub_100018E10(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSString stringWithFormat:@"IOService interest message: %@", a1];
  *(_DWORD *)buf = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
}

void sub_100018EC0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Aborting all pipes", v2, v3, v4, v5, v6);
}

void sub_100018EF4()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Cancelling notification token", v2, v3, v4, v5, v6);
}

void sub_100018F28()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Cancelling notification dispatch token", v2, v3, v4, v5, v6);
}

void sub_100018F5C()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to register notification check", v2, v3, v4, v5, v6);
}

void sub_100018F90()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Detected active EA session", v2, v3, v4, v5, v6);
}

void sub_100018FC4()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed check notification state", v2, v3, v4, v5, v6);
}

void sub_100018FF8(void *a1)
{
  uint8_t v6 = [a1 CCIDDescriptor];
  sub_100011B20();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);
}

void sub_10001908C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Device: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100019104(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to initialize IOUSBHostInterface: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10001917C()
{
  sub_10000411C();
  sub_100011B04((void *)&_mh_execute_header, v0, v1, "Reader without a slot", v2, v3, v4, v5, v6);
}

void sub_1000191B0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Unsupported pipe type.", buf, 2u);
}

void sub_1000191F0()
{
  sub_10000411C();
  sub_100004100((void *)&_mh_execute_header, v0, v1, "Failed to create slot semaphore", v2, v3, v4, v5, v6);
}

void sub_100019224(void *a1, void *a2)
{
  [a1 unsignedIntValue];
  [a2 unsignedIntValue];
  sub_100011B20();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xEu);
}

void sub_1000192D0()
{
  sub_10000411C();
  sub_10000A474((void *)&_mh_execute_header, v0, v1, "Service was closed, releasing it", v2, v3, v4, v5, v6);
}

void sub_100019304()
{
  sub_10000411C();
  sub_100011B04((void *)&_mh_execute_header, v0, v1, "Failed to instantiate a Device.", v2, v3, v4, v5, v6);
}

void sub_100019338()
{
  sub_100016358();
  sub_10001633C((void *)&_mh_execute_header, v0, v1, "Wrong FIndex %d", v2, v3, v4, v5, v6);
}

void sub_1000193A0()
{
  sub_100016358();
  sub_10001633C((void *)&_mh_execute_header, v0, v1, "Wrong DIndex %d", v2, v3, v4, v5, v6);
}

void sub_100019408(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019474()
{
  sub_100016358();
  sub_10001633C((void *)&_mh_execute_header, v0, v1, "Wrong Findex %d", v2, v3, v4, v5, v6);
}

void sub_1000194DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The 'PINByteOffset' is ignored by CCID and should be set to 0", v1, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint8_t IOUSBGetEndpointDirection(const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointDirection(descriptor);
}

uint8_t IOUSBGetEndpointType(const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointType(descriptor);
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextAssociatedDescriptorWithType(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, const IOUSBDescriptorHeader *currentDescriptor, const uint8_t type)
{
  return _IOUSBGetNextAssociatedDescriptorWithType(configurationDescriptor, parentDescriptor, currentDescriptor, type);
}

const IOUSBEndpointDescriptor *__cdecl IOUSBGetNextEndpointDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *interfaceDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return _IOUSBGetNextEndpointDescriptor(configurationDescriptor, interfaceDescriptor, currentDescriptor);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double ldexp(long double __x, int __e)
{
  return _ldexp(__x, __e);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_APDU(void *a1, const char *a2, ...)
{
  return [a1 APDU];
}

id objc_msgSend_APDUCase(void *a1, const char *a2, ...)
{
  return [a1 APDUCase];
}

id objc_msgSend_C5(void *a1, const char *a2, ...)
{
  return [a1 C5];
}

id objc_msgSend_C6C7(void *a1, const char *a2, ...)
{
  return [a1 C6C7];
}

id objc_msgSend_CCIDDescriptor(void *a1, const char *a2, ...)
{
  return [a1 CCIDDescriptor];
}

id objc_msgSend_CLA(void *a1, const char *a2, ...)
{
  return [a1 CLA];
}

id objc_msgSend_DIndexes(void *a1, const char *a2, ...)
{
  return [a1 DIndexes];
}

id objc_msgSend_Di(void *a1, const char *a2, ...)
{
  return [a1 Di];
}

id objc_msgSend_FIndexes(void *a1, const char *a2, ...)
{
  return [a1 FIndexes];
}

id objc_msgSend_Fi(void *a1, const char *a2, ...)
{
  return [a1 Fi];
}

id objc_msgSend_INS(void *a1, const char *a2, ...)
{
  return [a1 INS];
}

id objc_msgSend_Lc(void *a1, const char *a2, ...)
{
  return [a1 Lc];
}

id objc_msgSend_Le(void *a1, const char *a2, ...)
{
  return [a1 Le];
}

id objc_msgSend_P1(void *a1, const char *a2, ...)
{
  return [a1 P1];
}

id objc_msgSend_P2(void *a1, const char *a2, ...)
{
  return [a1 P2];
}

id objc_msgSend_PINBlockString(void *a1, const char *a2, ...)
{
  return [a1 PINBlockString];
}

id objc_msgSend_PINByteOffset(void *a1, const char *a2, ...)
{
  return [a1 PINByteOffset];
}

id objc_msgSend_PINCompletion(void *a1, const char *a2, ...)
{
  return [a1 PINCompletion];
}

id objc_msgSend_PINConfirmation(void *a1, const char *a2, ...)
{
  return [a1 PINConfirmation];
}

id objc_msgSend_PINFormat(void *a1, const char *a2, ...)
{
  return [a1 PINFormat];
}

id objc_msgSend_PINMaxExtraDigit(void *a1, const char *a2, ...)
{
  return [a1 PINMaxExtraDigit];
}

id objc_msgSend_PINMessageIndices(void *a1, const char *a2, ...)
{
  return [a1 PINMessageIndices];
}

id objc_msgSend_PPSVersion(void *a1, const char *a2, ...)
{
  return [a1 PPSVersion];
}

id objc_msgSend_SW1(void *a1, const char *a2, ...)
{
  return [a1 SW1];
}

id objc_msgSend_SW2(void *a1, const char *a2, ...)
{
  return [a1 SW2];
}

id objc_msgSend_TA(void *a1, const char *a2, ...)
{
  return [a1 TA];
}

id objc_msgSend_TB(void *a1, const char *a2, ...)
{
  return [a1 TB];
}

id objc_msgSend_TC(void *a1, const char *a2, ...)
{
  return [a1 TC];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_aPayload(void *a1, const char *a2, ...)
{
  return [a1 aPayload];
}

id objc_msgSend_acceptedNAD(void *a1, const char *a2, ...)
{
  return [a1 acceptedNAD];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowAlternativeFiDi(void *a1, const char *a2, ...)
{
  return [a1 allowAlternativeFiDi];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_automaticBaudRateChange(void *a1, const char *a2, ...)
{
  return [a1 automaticBaudRateChange];
}

id objc_msgSend_automaticICCActivation(void *a1, const char *a2, ...)
{
  return [a1 automaticICCActivation];
}

id objc_msgSend_automaticICCClockFrequency(void *a1, const char *a2, ...)
{
  return [a1 automaticICCClockFrequency];
}

id objc_msgSend_automaticICCVoltageSelection(void *a1, const char *a2, ...)
{
  return [a1 automaticICCVoltageSelection];
}

id objc_msgSend_automaticIFSD(void *a1, const char *a2, ...)
{
  return [a1 automaticIFSD];
}

id objc_msgSend_automaticPPS(void *a1, const char *a2, ...)
{
  return [a1 automaticPPS];
}

id objc_msgSend_automaticParameterConfigurationBasedOnATR(void *a1, const char *a2, ...)
{
  return [a1 automaticParameterConfigurationBasedOnATR];
}

id objc_msgSend_automaticParametersNegotation(void *a1, const char *a2, ...)
{
  return [a1 automaticParametersNegotation];
}

id objc_msgSend_bChainParameter(void *a1, const char *a2, ...)
{
  return [a1 bChainParameter];
}

id objc_msgSend_bClassEnvelope(void *a1, const char *a2, ...)
{
  return [a1 bClassEnvelope];
}

id objc_msgSend_bClassGetResponse(void *a1, const char *a2, ...)
{
  return [a1 bClassGetResponse];
}

id objc_msgSend_bClockStop(void *a1, const char *a2, ...)
{
  return [a1 bClockStop];
}

id objc_msgSend_bConfirmPIN(void *a1, const char *a2, ...)
{
  return [a1 bConfirmPIN];
}

id objc_msgSend_bDescriptorType(void *a1, const char *a2, ...)
{
  return [a1 bDescriptorType];
}

id objc_msgSend_bEntryValidationCondition(void *a1, const char *a2, ...)
{
  return [a1 bEntryValidationCondition];
}

id objc_msgSend_bError(void *a1, const char *a2, ...)
{
  return [a1 bError];
}

id objc_msgSend_bGuardTime(void *a1, const char *a2, ...)
{
  return [a1 bGuardTime];
}

id objc_msgSend_bIFSC(void *a1, const char *a2, ...)
{
  return [a1 bIFSC];
}

id objc_msgSend_bInsertionOffsetNew(void *a1, const char *a2, ...)
{
  return [a1 bInsertionOffsetNew];
}

id objc_msgSend_bInsertionOffsetOld(void *a1, const char *a2, ...)
{
  return [a1 bInsertionOffsetOld];
}

id objc_msgSend_bLength(void *a1, const char *a2, ...)
{
  return [a1 bLength];
}

id objc_msgSend_bMaxCCIDBusySlots(void *a1, const char *a2, ...)
{
  return [a1 bMaxCCIDBusySlots];
}

id objc_msgSend_bMaxSlotIndex(void *a1, const char *a2, ...)
{
  return [a1 bMaxSlotIndex];
}

id objc_msgSend_bMsgIndex(void *a1, const char *a2, ...)
{
  return [a1 bMsgIndex];
}

id objc_msgSend_bMsgIndex1(void *a1, const char *a2, ...)
{
  return [a1 bMsgIndex1];
}

id objc_msgSend_bMsgIndex2(void *a1, const char *a2, ...)
{
  return [a1 bMsgIndex2];
}

id objc_msgSend_bMsgIndex3(void *a1, const char *a2, ...)
{
  return [a1 bMsgIndex3];
}

id objc_msgSend_bNadValue(void *a1, const char *a2, ...)
{
  return [a1 bNadValue];
}

id objc_msgSend_bNumClockSupported(void *a1, const char *a2, ...)
{
  return [a1 bNumClockSupported];
}

id objc_msgSend_bNumDataRatesSupported(void *a1, const char *a2, ...)
{
  return [a1 bNumDataRatesSupported];
}

id objc_msgSend_bNumberMessage(void *a1, const char *a2, ...)
{
  return [a1 bNumberMessage];
}

id objc_msgSend_bPINSupport(void *a1, const char *a2, ...)
{
  return [a1 bPINSupport];
}

id objc_msgSend_bPowerSelect(void *a1, const char *a2, ...)
{
  return [a1 bPowerSelect];
}

id objc_msgSend_bSeq(void *a1, const char *a2, ...)
{
  return [a1 bSeq];
}

id objc_msgSend_bSlot(void *a1, const char *a2, ...)
{
  return [a1 bSlot];
}

id objc_msgSend_bTimeOut(void *a1, const char *a2, ...)
{
  return [a1 bTimeOut];
}

id objc_msgSend_bVoltageSupport(void *a1, const char *a2, ...)
{
  return [a1 bVoltageSupport];
}

id objc_msgSend_bWaitingInteger(void *a1, const char *a2, ...)
{
  return [a1 bWaitingInteger];
}

id objc_msgSend_baseBps(void *a1, const char *a2, ...)
{
  return [a1 baseBps];
}

id objc_msgSend_bcdCCID(void *a1, const char *a2, ...)
{
  return [a1 bcdCCID];
}

id objc_msgSend_blockSequenceStr(void *a1, const char *a2, ...)
{
  return [a1 blockSequenceStr];
}

id objc_msgSend_blockType(void *a1, const char *a2, ...)
{
  return [a1 blockType];
}

id objc_msgSend_blockTypeStr(void *a1, const char *a2, ...)
{
  return [a1 blockTypeStr];
}

id objc_msgSend_bmCommandStatus(void *a1, const char *a2, ...)
{
  return [a1 bmCommandStatus];
}

id objc_msgSend_bmFindexDindex(void *a1, const char *a2, ...)
{
  return [a1 bmFindexDindex];
}

id objc_msgSend_bmFormatString(void *a1, const char *a2, ...)
{
  return [a1 bmFormatString];
}

id objc_msgSend_bmICCStatus(void *a1, const char *a2, ...)
{
  return [a1 bmICCStatus];
}

id objc_msgSend_bmPINBlockString(void *a1, const char *a2, ...)
{
  return [a1 bmPINBlockString];
}

id objc_msgSend_bmPINLengthFormat(void *a1, const char *a2, ...)
{
  return [a1 bmPINLengthFormat];
}

id objc_msgSend_bmTCCKS(void *a1, const char *a2, ...)
{
  return [a1 bmTCCKS];
}

id objc_msgSend_bmWaitingIntegers(void *a1, const char *a2, ...)
{
  return [a1 bmWaitingIntegers];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bpsMax(void *a1, const char *a2, ...)
{
  return [a1 bpsMax];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canSetClockStop(void *a1, const char *a2, ...)
{
  return [a1 canSetClockStop];
}

id objc_msgSend_cardPresent(void *a1, const char *a2, ...)
{
  return [a1 cardPresent];
}

id objc_msgSend_coldResetCard(void *a1, const char *a2, ...)
{
  return [a1 coldResetCard];
}

id objc_msgSend_configurationDescriptor(void *a1, const char *a2, ...)
{
  return [a1 configurationDescriptor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPINByteOffset(void *a1, const char *a2, ...)
{
  return [a1 currentPINByteOffset];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataField(void *a1, const char *a2, ...)
{
  return [a1 dataField];
}

id objc_msgSend_dequeueAllBlocks(void *a1, const char *a2, ...)
{
  return [a1 dequeueAllBlocks];
}

id objc_msgSend_dequeueBlock(void *a1, const char *a2, ...)
{
  return [a1 dequeueBlock];
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return [a1 descriptors];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dwDataRate(void *a1, const char *a2, ...)
{
  return [a1 dwDataRate];
}

id objc_msgSend_dwDefaultClock(void *a1, const char *a2, ...)
{
  return [a1 dwDefaultClock];
}

id objc_msgSend_dwFeatures(void *a1, const char *a2, ...)
{
  return [a1 dwFeatures];
}

id objc_msgSend_dwLength(void *a1, const char *a2, ...)
{
  return [a1 dwLength];
}

id objc_msgSend_dwMaxCCIDMessageLength(void *a1, const char *a2, ...)
{
  return [a1 dwMaxCCIDMessageLength];
}

id objc_msgSend_dwMaxDataRate(void *a1, const char *a2, ...)
{
  return [a1 dwMaxDataRate];
}

id objc_msgSend_dwMaxIFSD(void *a1, const char *a2, ...)
{
  return [a1 dwMaxIFSD];
}

id objc_msgSend_dwMaximumClock(void *a1, const char *a2, ...)
{
  return [a1 dwMaximumClock];
}

id objc_msgSend_dwMechanical(void *a1, const char *a2, ...)
{
  return [a1 dwMechanical];
}

id objc_msgSend_dwProtocols(void *a1, const char *a2, ...)
{
  return [a1 dwProtocols];
}

id objc_msgSend_dwSynchProtocols(void *a1, const char *a2, ...)
{
  return [a1 dwSynchProtocols];
}

id objc_msgSend_endpointDirection(void *a1, const char *a2, ...)
{
  return [a1 endpointDirection];
}

id objc_msgSend_endpointType(void *a1, const char *a2, ...)
{
  return [a1 endpointType];
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return [a1 entryID];
}

id objc_msgSend_fIndex(void *a1, const char *a2, ...)
{
  return [a1 fIndex];
}

id objc_msgSend_fIndexDIndex(void *a1, const char *a2, ...)
{
  return [a1 fIndexDIndex];
}

id objc_msgSend_fMax(void *a1, const char *a2, ...)
{
  return [a1 fMax];
}

id objc_msgSend_firstBlock(void *a1, const char *a2, ...)
{
  return [a1 firstBlock];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getCardsNeedsBaseFiDi(void *a1, const char *a2, ...)
{
  return [a1 getCardsNeedsBaseFiDi];
}

id objc_msgSend_getClockFrequencies(void *a1, const char *a2, ...)
{
  return [a1 getClockFrequencies];
}

id objc_msgSend_getDTable(void *a1, const char *a2, ...)
{
  return [a1 getDTable];
}

id objc_msgSend_getDataRates(void *a1, const char *a2, ...)
{
  return [a1 getDataRates];
}

id objc_msgSend_getFTable(void *a1, const char *a2, ...)
{
  return [a1 getFTable];
}

id objc_msgSend_getParameters(void *a1, const char *a2, ...)
{
  return [a1 getParameters];
}

id objc_msgSend_handleEANotification(void *a1, const char *a2, ...)
{
  return [a1 handleEANotification];
}

id objc_msgSend_hexString(void *a1, const char *a2, ...)
{
  return [a1 hexString];
}

id objc_msgSend_holder(void *a1, const char *a2, ...)
{
  return [a1 holder];
}

id objc_msgSend_holderPtr(void *a1, const char *a2, ...)
{
  return [a1 holderPtr];
}

id objc_msgSend_informationField(void *a1, const char *a2, ...)
{
  return [a1 informationField];
}

id objc_msgSend_initialTimeout(void *a1, const char *a2, ...)
{
  return [a1 initialTimeout];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_interfaceDescriptor(void *a1, const char *a2, ...)
{
  return [a1 interfaceDescriptor];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_interruptionSync(void *a1, const char *a2, ...)
{
  return [a1 interruptionSync];
}

id objc_msgSend_ioService(void *a1, const char *a2, ...)
{
  return [a1 ioService];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lengthByte(void *a1, const char *a2, ...)
{
  return [a1 lengthByte];
}

id objc_msgSend_levelOfExchange(void *a1, const char *a2, ...)
{
  return [a1 levelOfExchange];
}

id objc_msgSend_localeID(void *a1, const char *a2, ...)
{
  return [a1 localeID];
}

id objc_msgSend_locationId(void *a1, const char *a2, ...)
{
  return [a1 locationId];
}

id objc_msgSend_maxInputLength(void *a1, const char *a2, ...)
{
  return [a1 maxInputLength];
}

id objc_msgSend_maxOutputLength(void *a1, const char *a2, ...)
{
  return [a1 maxOutputLength];
}

id objc_msgSend_maxPayload(void *a1, const char *a2, ...)
{
  return [a1 maxPayload];
}

id objc_msgSend_messageSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 messageSequenceNumber];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_moreData(void *a1, const char *a2, ...)
{
  return [a1 moreData];
}

id objc_msgSend_mutableBuffer(void *a1, const char *a2, ...)
{
  return [a1 mutableBuffer];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needAck(void *a1, const char *a2, ...)
{
  return [a1 needAck];
}

id objc_msgSend_newPINByteOffset(void *a1, const char *a2, ...)
{
  return [a1 newPINByteOffset];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nodeAddressByte(void *a1, const char *a2, ...)
{
  return [a1 nodeAddressByte];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_operationStr(void *a1, const char *a2, ...)
{
  return [a1 operationStr];
}

id objc_msgSend_pipes(void *a1, const char *a2, ...)
{
  return [a1 pipes];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_protocolControlByte(void *a1, const char *a2, ...)
{
  return [a1 protocolControlByte];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_redundancyCode(void *a1, const char *a2, ...)
{
  return [a1 redundancyCode];
}

id objc_msgSend_redundancyCodeType(void *a1, const char *a2, ...)
{
  return [a1 redundancyCodeType];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_resetSequence(void *a1, const char *a2, ...)
{
  return [a1 resetSequence];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_securePINChangeSupported(void *a1, const char *a2, ...)
{
  return [a1 securePINChangeSupported];
}

id objc_msgSend_securePINVerificationSupported(void *a1, const char *a2, ...)
{
  return [a1 securePINVerificationSupported];
}

id objc_msgSend_sequence(void *a1, const char *a2, ...)
{
  return [a1 sequence];
}

id objc_msgSend_slotName(void *a1, const char *a2, ...)
{
  return [a1 slotName];
}

id objc_msgSend_slotNumber(void *a1, const char *a2, ...)
{
  return [a1 slotNumber];
}

id objc_msgSend_slotParameters(void *a1, const char *a2, ...)
{
  return [a1 slotParameters];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusPtr(void *a1, const char *a2, ...)
{
  return [a1 statusPtr];
}

id objc_msgSend_statusStr(void *a1, const char *a2, ...)
{
  return [a1 statusStr];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportedProtocols(void *a1, const char *a2, ...)
{
  return [a1 supportedProtocols];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeStr(void *a1, const char *a2, ...)
{
  return [a1 typeStr];
}

id objc_msgSend_uint8Value(void *a1, const char *a2, ...)
{
  return [a1 uint8Value];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_vendorId(void *a1, const char *a2, ...)
{
  return [a1 vendorId];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return [a1 vendorName];
}

id objc_msgSend_voltageSupport(void *a1, const char *a2, ...)
{
  return [a1 voltageSupport];
}

id objc_msgSend_wLangId(void *a1, const char *a2, ...)
{
  return [a1 wLangId];
}

id objc_msgSend_wLcdLayout(void *a1, const char *a2, ...)
{
  return [a1 wLcdLayout];
}

id objc_msgSend_wPINMaxExtraDigit(void *a1, const char *a2, ...)
{
  return [a1 wPINMaxExtraDigit];
}

id objc_msgSend_warmResetCard(void *a1, const char *a2, ...)
{
  return [a1 warmResetCard];
}

id objc_msgSend_watchInterruptPipe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchInterruptPipe:");
}