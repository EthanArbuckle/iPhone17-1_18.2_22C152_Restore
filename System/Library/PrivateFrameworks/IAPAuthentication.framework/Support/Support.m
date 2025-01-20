uint64_t start()
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v2;

  mach_service = xpc_connection_create_mach_service("com.apple.iapauthd.xpc", 0, 1uLL);
  if (mach_service)
  {
    v2 = mach_service;
    xpc_connection_set_event_handler(mach_service, &stru_100018100);
    xpc_connection_resume(v2);
    dispatch_main();
  }
  NSLog(@"listener is not valid!\n");
  return 1;
}

void sub_100001CB8(id a1, OS_xpc_object *a2)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001D54;
  handler[3] = &unk_100018128;
  handler[4] = a2;
  xpc_connection_set_event_handler(a2, handler);
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error) {
    xpc_connection_resume(a2);
  }
}

void sub_100001D54(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  string = xpc_dictionary_get_string(object, "requestType");
  if (string) {
    v5 = string;
  }
  else {
    v5 = "<nil>";
  }
  if (!strcmp(v5, "cert"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    if (!reply)
    {
      NSLog(@"ERROR: Client sent kXPCCertStr xpc message without a reply context");
      return;
    }
    v7 = reply;
    uint64_t uint64 = xpc_dictionary_get_uint64(object, "application");
    if (uint64 >= 3)
    {
      NSLog(@"Unknown app ID %d\n", uint64);
      xpc_dictionary_set_BOOL(v7, "isValid", 0);
    }
    else
    {
      uint64_t v11 = 318767107 - uint64;
      xpc_dictionary_set_BOOL(v7, "isValid", 0);
      sub_100007B54((uint64_t)kCFAllocatorDefault, v11);
      if (v12)
      {
        v13 = v12;
        CFDataRef v14 = SecCertificateCopyData(v12);
        BytePtr = CFDataGetBytePtr(v14);
        size_t v16 = CFDataGetLength(v14);
        xpc_dictionary_set_data(v7, "certData", BytePtr, v16);
        xpc_dictionary_set_BOOL(v7, "isValid", 1);
        CFRelease(v13);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v7);
        if (v14) {
          CFRelease(v14);
        }
        goto LABEL_32;
      }
      NSLog(@"cert: cert %ld not found\n", v11);
    }
LABEL_31:
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v7);
LABEL_32:
    xpc_release(v7);
    return;
  }
  if (strcmp(v5, "key"))
  {
    if (strcmp(v5, "test")) {
      return;
    }
    xpc_object_t v6 = xpc_dictionary_create_reply(object);
    if (!v6)
    {
      NSLog(@"ERROR: Client sent kXPCTestStr xpc message without a reply context");
      return;
    }
    v7 = v6;
    uint64_t v8 = xpc_dictionary_get_uint64(object, "testCounter");
    NSLog(@"%s:%s-%d testCounter=%llu\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapauthd/iapauthd.m", "_xpc_auth_handle_connection_block_invoke", 247, v8);
    xpc_dictionary_set_uint64(v7, "testCounterReply", v8);
    goto LABEL_31;
  }
  xpc_object_t v17 = xpc_dictionary_create_reply(object);
  if (v17)
  {
    v18 = v17;
    v19 = (__SecKey *)sub_1000062E4((uint64_t)kCFAllocatorDefault, 318767105);
    if (!v19) {
      NSLog(@"key: key %d not found\n", 318767105);
    }
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v40 = v20;
    long long v41 = v20;
    long long v38 = v20;
    long long v39 = v20;
    long long v36 = v20;
    long long v37 = v20;
    long long v34 = v20;
    long long v35 = v20;
    long long v32 = v20;
    long long v33 = v20;
    long long v30 = v20;
    long long v31 = v20;
    long long v28 = v20;
    long long v29 = v20;
    *(_OWORD *)sig = v20;
    long long v27 = v20;
    size_t length = 0;
    size_t sigLen = 256;
    data = (const uint8_t *)xpc_dictionary_get_data(object, "inData", &length);
    uint64_t v22 = SecKeyRawSign(v19, 0x8002u, data, length, sig, &sigLen);
    int v23 = v22;
    if (v22) {
      NSLog(@"key: SecKeyRawSign failed, status=%d\n", v22);
    }
    else {
      xpc_dictionary_set_data(v18, "outData", sig, sigLen);
    }
    xpc_dictionary_set_BOOL(v18, "isValid", v23 == 0);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v18);
    if (v19) {
      CFRelease(v19);
    }
    xpc_release(v18);
  }
  else
  {
    NSLog(@"ERROR: Client sent kXPCKeyStr xpc message without a reply context");
  }
}

void sub_100002128(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v1 + 1916468129 < 0) {
    int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  }
  else {
    int v2 = 462031038 - v1;
  }
  __asm { BRAA            X11, X13 }
}

uint64_t sub_10000223C@<X0>(uint64_t a1@<X2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  int v15 = v13 + 948253587;
  *((_DWORD *)&a11 + v11 + a2) = *(_DWORD *)(*(void *)(a1 + 8) + 4 * (v11 + a2));
  BOOL v16 = v11 + 726240035 < v15;
  if (v15 < -968214542 != v11 + 726240035 < -968214542) {
    BOOL v16 = v15 < -968214542;
  }
  return (*(uint64_t (**)(void))(v14 + 8 * (v16 + v12)))();
}

void sub_1000022B4()
{
}

uint64_t sub_1000022C0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 + 1458300621 < -458167508 != v4 + 1236287068 < -458167508) {
    BOOL v7 = a4 + 1458300621 < -458167508;
  }
  else {
    BOOL v7 = v4 + 1236287068 < a4 + 1458300621;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * (v7 + v5)))();
}

uint64_t sub_10000232C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v16 = v12 < v10;
  *(_DWORD *)(a9 + 4 * (v9 + a1)) = v14;
  int v17 = v11 + v9 + 1;
  int v18 = v16 ^ (v17 < v10);
  BOOL v19 = v17 < v12;
  if (!v18) {
    BOOL v16 = v19;
  }
  return (*(uint64_t (**)(void))(v15 + 8 * (v16 + v13)))();
}

uint64_t sub_100002388(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 + a2) <= 0x80000000) {
    int v6 = v4;
  }
  else {
    int v6 = v4 + 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8 * v6))(a1, a2);
}

uint64_t sub_1000023C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, _DWORD *a17)
{
  int v20 = (*(_DWORD *)(*(void *)(a12 + 32) + 16) - 1262982400) * (*a17 - 897970625);
  int v21 = 704005591 * ((v19 - 128) ^ 0xF7D78CF0);
  *(_DWORD *)(v19 - 112) = (v18 + 3) ^ v21;
  *(_DWORD *)(v19 - 108) = (v20 ^ 0xE7DE97B5) - v21 + ((2 * v20) & 0xCFBD2F6A) + 1602222208;
  *(void *)(v19 - 120) = &a16;
  *(_DWORD *)(v19 - 128) = 231015519 - v21;
  *(void *)(v19 - 104) = a13;
  uint64_t v22 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v18 + 22))(v19 - 128);
  BOOL v23 = a11 + 1242427381 > 1473442901;
  if (a11 + 1242427381 < -674040748) {
    BOOL v23 = 1;
  }
  return (*(uint64_t (**)(uint64_t))(v17 + 8 * (v18 + 8 * !v23)))(v22);
}

uint64_t sub_1000025FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v16 - 112) = v15 + 523995289 * ((v16 - 128) ^ 0x98567068) - 10;
  *(void *)(v16 - 128) = a12;
  *(void *)(v16 - 120) = &a13;
  ((void (*)(uint64_t))*(&off_100019330 + v15 + 51))(v16 - 128);
  *(void *)(v16 - 128) = a12;
  *(void *)(v16 - 120) = v13;
  *(_DWORD *)(v16 - 112) = v15 - 1638185881 * ((v16 - 128) ^ 0x11FD620) - 11;
  uint64_t v17 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v15 + 24))(v16 - 128);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * (int)(((*(_DWORD *)(v16 - 108) + 556127643) >> 31) + v15)))(v17);
}

uint64_t sub_1000026F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v19 = a16;
  if (a16 + v17 >= 0) {
    int v19 = 462031038 - a16;
  }
  return (*(uint64_t (**)(void))(v16 + 8 * (int)(((v17 + v19 - 1) >> 31) + v18 + 8)))();
}

uint64_t sub_100002754()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (v2 + 8 * (*(_DWORD *)(v1 + 4 * (v0 - 231015520)) != v3))))();
}

uint64_t sub_10000278C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((v3 + v0 - 1 - 1) >> 31) + v1)))();
}

uint64_t sub_1000027C4@<X0>(unsigned int a1@<W8>)
{
  uint64_t v6 = *(void *)(v9 + 16);
  if (a1 <= 0x80000000) {
    int v7 = v3 - v1;
  }
  else {
    int v7 = v1;
  }
  v10[1] = v7;
  *(void *)(v5 - 128) = v10;
  *(void *)(v5 - 120) = v6;
  *(_DWORD *)(v5 - 112) = v2 + 523995289 * ((v5 - 128) ^ 0x98567068) - 4;
  return (*(uint64_t (**)(uint64_t))(v4 + 8 * (v2 + 57)))(v5 - 128);
}

uint64_t sub_10000286C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  int v23 = 520147679 * ((v22 - 128) ^ 0xD061A127);
  *(_DWORD *)(v22 - 112) = v17 - v23 - 13;
  *(void *)(v22 - 120) = &a13;
  *(_DWORD *)(v22 - 128) = ((v15 ^ 0x5DF9FFF2) + ((2 * v15) & 0xBBF3FFE4) - 404771650) ^ v23;
  (*(void (**)(uint64_t))(v19 + 8 * (v17 + 12)))(v22 - 128);
  *(_DWORD *)(v22 - 112) = v17 - 2 - ((v22 - 128) ^ v21) * v20 - 11;
  *(void *)(v22 - 128) = a12;
  *(void *)(v22 - 120) = &a15;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v17 + 22)))(v22 - 128);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * (int)(((*(_DWORD *)(v22 - 108) + v16) >> 31) + v17 - 2)))(v24);
}

uint64_t sub_100002960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  *(void *)(v21 - 128) = &a13;
  *(void *)(v21 - 120) = &a15;
  *(_DWORD *)(v21 - 112) = v18 - ((v21 - 128) ^ v20) * v19 - 3;
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v18 + 32)))(v21 - 128);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8 * (int)(v18 + ((*(_DWORD *)(v21 - 108) + v15) >> 31))))(v22);
}

uint64_t sub_1000029C8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v10 = a1 + 11;
  *(void *)(v9 - 120) = &a6;
  *(void *)(v9 - 112) = v7;
  *(_DWORD *)(v9 - 128) = (a1 - 1) ^ (56516261 * ((v9 - 128) ^ 0x15EBF17D));
  uint64_t v11 = ((uint64_t (*)(uint64_t))*(&off_100019330 + a1 + 47))(v9 - 128);
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * (v10 + 2 * (v6 != 1))))(v11);
}

uint64_t sub_100002A5C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 + 2)))();
}

uint64_t sub_100002A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v19 - 112) = v15 - ((v19 - 128) ^ v18) * v17 - 13;
  *(void *)(v19 - 128) = a12;
  *(void *)(v19 - 120) = &a13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v15 + 22)))(v19 - 128);
  if ((*(_DWORD *)(v19 - 108) + v13) <= 0x80000000) {
    int v21 = v15;
  }
  else {
    int v21 = v15 + 1;
  }
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * v21))(v20);
}

uint64_t sub_100002B0C(uint64_t a1)
{
  int v1 = 1638185881 * (a1 ^ 0x11FD620);
  int v2 = *(_DWORD *)(a1 + 12) + v1;
  int v3 = *(_DWORD *)(a1 + 16) ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v4 + 1916468129 >= 0) {
    int v4 = 462031038 - v4;
  }
  return (*(uint64_t (**)(void))((char *)*(&off_100019530 + v2 + 23)
                              + 32
                              * ((v3 - 158609094) >= 4 * (unint64_t)(v4 - 231015519))
                              + 8 * v2
                              - 6))();
}

uint64_t sub_100002BA8()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + ((v0 != 158609094) | (4 * (v0 != 158609094))))))();
}

uint64_t sub_100002BD8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8 * (v3 - v4 + 3)))(a1, 897970625, v1);
}

uint64_t sub_100002C14@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  *(unsigned char *)(*a1 + (a3 + a4)) = (a2 - 897970625) >> v6;
  if (a3 - 1 == v5) {
    int v8 = v7 + 1;
  }
  else {
    int v8 = v7;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * v8))();
}

uint64_t sub_100002C50(uint64_t a1, uint64_t a2, char a3, int a4)
{
  int v8 = (a4 & 0xFFFFFFFD | (2 * (a3 & 1))) + v7;
  if (v6 == 24) {
    int v9 = v8 + 1;
  }
  else {
    int v9 = v8;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8 * v9))(a1, a2, v4);
}

uint64_t sub_100002C7C(uint64_t a1)
{
  if (v1 + 755559108 < -1160909021 != v4 + 494530915 < -1160909021) {
    BOOL v6 = v1 + 755559108 < -1160909021;
  }
  else {
    BOOL v6 = v4 + 494530915 < v1 + 755559108;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 8 * (v5 + 2 * v6)))(a1, 897970625, v2);
}

uint64_t sub_100002CEC@<X0>(void *a1@<X0>, int a2@<W8>)
{
  return sub_100002C14(a1, *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v4 - 492043712)), v3, a2);
}

uint64_t sub_100002D14(uint64_t result)
{
  *(_DWORD *)(result + 8) = v1;
  return result;
}

uint64_t sub_100002D1C()
{
  return sub_10000C974();
}

uint64_t sub_100002DD4(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  if (v1 + 1916468129 >= 0) {
    int v1 = 462031038 - v1;
  }
  if ((v1 + 1916468129) <= 0x80000000) {
    int v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 3;
  }
  else {
    int v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 2;
  }
  return (*(uint64_t (**)(void))((char *)*(&off_100019530 + (int)(*(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 1))
                              + 8 * v2
                              - 10))();
}

uint64_t sub_100002E74@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W8>)
{
  return (*(uint64_t (**)(void))(v6 + 8
                                   * (3 * a3 + v5 + 2 * (*(_DWORD *)(*(void *)(v4 + 8) + 4 * (a4 + a1)) != a2))))();
}

void sub_100002EAC()
{
}

_DWORD *sub_100002EB4(_DWORD *result)
{
  *result = 1657939070;
  return result;
}

uint64_t sub_100002EC4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5 + 8 * (int)(2 * ((a4 - 897970625) >> 31) + v4)))();
}

uint64_t sub_100002EFC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(2 * ((v0 >> v1) & 1) + v3)))();
}

_DWORD *sub_100002F24@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *result = v2 + 32 * a2 - 1439590273;
  return result;
}

void sub_100002F3C()
{
  uint64_t v0 = __chkstk_darwin();
  int v1 = *(_DWORD *)(v0 + 8) ^ (601157143 * (v0 ^ 0x5103A544));
  if (*(_DWORD *)(*(void *)(v0 + 32) + 4) == 231015519) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)(v0 + 8) ^ (601157143 * (v0 ^ 0x5103A544));
  }
  __asm { BRAA            X10, X11 }
}

uint64_t sub_10000306C()
{
  *(_DWORD *)(v3 + 4) = v0;
  *(void *)(v6 - 144) = &v8;
  *(void *)(v6 - 136) = v3;
  *(_DWORD *)(v6 - 128) = v4 + 1 + ((v6 - 144) ^ v2) * v1 - 14;
  return (*(uint64_t (**)(uint64_t))(v5 + 8 * (v4 + 48)))(v6 - 144);
}

void sub_100004154(_DWORD *a1)
{
  unsigned int v1 = a1[2] ^ (2145031067 * (a1 ^ 0x1E282685));
  uint64_t v2 = *(void *)a1;
  int v3 = *(_DWORD *)(*(void *)a1 + 4);
  if (v3 + 1916468129 < 0) {
    int v4 = *(_DWORD *)(*(void *)a1 + 4);
  }
  else {
    int v4 = 462031038 - v3;
  }
  unsigned int v7 = v1 - 1748787863 * (&v6 ^ 0x81BAC106) - 2;
  uint64_t v6 = v2;
  ((void (*)(uint64_t *))*(&off_100019330 + (int)(v1 + 12)))(&v6);
  if ((v4 + 1916468129) <= 0x80000000) {
    unsigned int v5 = v1;
  }
  else {
    unsigned int v5 = v1 + 1;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_100004254@<X0>(uint64_t a1@<X8>)
{
  int v5 = v2 + 10 * v1;
  if (((v4 + v3) & 0x1F) != 0xC) {
    int v6 = v5;
  }
  else {
    int v6 = v5 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v6))();
}

uint64_t sub_1000042C4@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v4 + 8) + 4 * (v6 + v2 + v1 + 1917526983)) = *(_DWORD *)(*(void *)(v4 + 8)
                                                                                   + 4 * (v6 - 231015520));
  if ((v5 + v6 - 1) >= 0x80000001) {
    int v7 = v3;
  }
  else {
    int v7 = v3 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v7))();
}

uint64_t sub_100004328@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v6 + 8) + 4 * v5) = *(_DWORD *)(*(void *)(v6 + 8) + 4 * v4);
  if (v1 >= v3) {
    int v7 = v2;
  }
  else {
    int v7 = v2 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v7))();
}

uint64_t sub_10000435C@<X0>(uint64_t a1@<X8>)
{
  if ((v1 + 1058855) <= 0x80000000) {
    int v3 = v2;
  }
  else {
    int v3 = v2 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v3))();
}

uint64_t sub_1000043A0@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v6 + 8) + 4 * (v4 + v1)) = 897970625;
  return (*(uint64_t (**)(void))(a1 + 8 * (v2 - 4 * v3 + 2 * (v4 + 1626351798 > v5) + 4)))();
}

uint64_t sub_1000043E4@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v6 + 8) + 4 * (v5 + v1)) = v3;
  return (*(uint64_t (**)(void))(a1 + 8 * (v2 + 2 * ((v5 + v4) > 0x80000000) + 4)))();
}

void sub_10000441C()
{
  int v5 = *(_DWORD *)(v3 + 4);
  int v6 = -1627410654 - v0;
  if (v5 + v4 < 0) {
    int v6 = v2;
  }
  *(_DWORD *)(v3 + 4) = v1 + v5 + v6 + 1;
}

uint64_t sub_100004448@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (int)(v1 + ((v2 + v3 - 1) >> 31))))();
}

uint64_t sub_1000044B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = *(void *)(v5 + 8);
  unsigned int v9 = *(_DWORD *)(v8 + 4 * (v7 - 231015520)) - 897970625;
  *(_DWORD *)(v8 + 4 * (v2 + v1)) = ((v9 >> (32 - v3)) ^ 0x3D9FF1F5)
                                    + ((2 * (v9 >> (32 - v3))) & 0x7B3FE3EA)
                                    - 135921716;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)((((v6 + v7 - 2) >> 31) | (4 * ((v6 + v7 - 2) >> 31)))
                                    + v4
                                    - 5)))();
}

void sub_100004584()
{
}

uint64_t sub_10000458C@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v4 + 8) + 4 * (v2 + v1)) = v5;
  return (*(uint64_t (**)(void))(a1 + 8 * (int)(v3 + ((v2 + 1222336575) >> 31))))(((~(v2 + 1222336575) >> 30) & 2) + v3);
}

void sub_100004684(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5));
  if (*(void *)(a1 + 24)) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5));
  }
  __asm { BRAA            X12, X13 }
}

uint64_t sub_10000475C()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((*(_DWORD *)(v3 + 40) + v0 == 2060361180) | (*(void *)(v3 + 32) == 0x18F01F70FA2C9FA2) & (*(void *)(v3 + 8) == 0x250197BA3C001668))
                               + v1
                               - v2)))();
}

uint64_t sub_1000047C8()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((v1 ^ 1)
                               + v0
                               + v1
                               + 6 * ((v2[6] != 0) & (v2[2] != 0 || v2[8] != 0x79046D8DC0A979F1)))))();
}

uint64_t sub_100004824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (v15 == 0x250197BA3C001668) {
    int v20 = v16 + 4 * v17 + 1;
  }
  else {
    int v20 = v16 + 4 * v17;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8 * v20))(a1, a2, a3, a4, a5, a6, a7, a8, v18, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1000048A8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char *a17, char *a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,char a28)
{
  int v35 = a1 + 7;
  int v36 = 1836812333 * ((v34 - 144) ^ 0x4065F266);
  *(_DWORD *)(v34 - 128) = v36 + v29 - 526058002;
  *(void *)(v34 - 136) = v28;
  *(_DWORD *)(v34 - 112) = v36 + a1 + 9;
  *(void *)(v34 - 120) = &a20;
  (*(void (**)(uint64_t))(v30 + 8 * (a1 + 16)))(v34 - 144);
  a17 = &a28;
  a18 = &a22;
  *(void *)(v34 - 128) = v32;
  *(void *)(v34 - 144) = &a17;
  int v48 = v35 - 5 + 520147679 * ((v34 - 144) ^ 0xD061A127);
  *(_DWORD *)(v34 - 136) = v48;
  v47 = *(void (**)(uint64_t))(v30 + 8 * (v35 + 45));
  v47(v34 - 144);
  int v46 = (v35 - 2) ^ (940831517 * ((v34 - 144) ^ 0xA299CC3C));
  *(_DWORD *)(v34 - 144) = v46;
  *(void *)(v34 - 136) = v32;
  *(void *)(v34 - 128) = &a24;
  *(void *)(v34 - 120) = &a20;
  *(void *)(v34 - 112) = &a17;
  v45 = *(void (**)(uint64_t))(v30 + 8 * (v35 + 5));
  v45(v34 - 144);
  long long v37 = a18;
  *(void *)(v34 - 120) = v32;
  *(void *)(v34 - 112) = v37;
  *(void *)(v34 - 136) = &a24;
  *(void *)(v34 - 128) = &a24;
  int v44 = v35 - 704005591 * ((v34 - 144) ^ 0xF7D78CF0) + 17;
  *(_DWORD *)(v34 - 104) = v44;
  *(void *)(v34 - 144) = &a17;
  v43 = (void (*)(uint64_t))*(&off_100019330 + v35 + 37);
  v43(v34 - 144);
  *(void *)(v34 - 128) = &a24;
  *(void *)(v34 - 120) = a13;
  *(void *)(v34 - 144) = v32;
  *(void *)(v34 - 112) = &a24;
  *(void *)(v34 - 104) = &a17;
  int v42 = (v35 + 8) ^ (601157143 * ((v34 - 144) ^ 0x5103A544));
  *(_DWORD *)(v34 - 136) = v42;
  long long v38 = (void (*)(uint64_t))*(&off_100019330 + v35 + 14);
  v38(v34 - 144);
  *(void *)(v34 - 128) = v33;
  *(_DWORD *)(v34 - 136) = v48;
  *(void *)(v34 - 144) = &a17;
  v47(v34 - 144);
  *(void *)(v34 - 136) = v33;
  *(void *)(v34 - 128) = &a26;
  *(_DWORD *)(v34 - 144) = v46;
  *(void *)(v34 - 120) = &a20;
  *(void *)(v34 - 112) = &a17;
  v45(v34 - 144);
  long long v39 = a18;
  *(void *)(v34 - 144) = &a17;
  *(void *)(v34 - 136) = &a26;
  *(_DWORD *)(v34 - 104) = v44;
  *(void *)(v34 - 120) = v33;
  *(void *)(v34 - 112) = v39;
  *(void *)(v34 - 128) = &a26;
  v43(v34 - 144);
  *(void *)(v34 - 128) = &a26;
  *(void *)(v34 - 120) = a11;
  *(void *)(v34 - 144) = v33;
  *(void *)(v34 - 112) = &a26;
  *(void *)(v34 - 104) = &a17;
  *(_DWORD *)(v34 - 136) = v42;
  v38(v34 - 144);
  *(void *)(v34 - 136) = &a24;
  *(void *)(v34 - 128) = &a26;
  *(_DWORD *)(v34 - 144) = (v35 - 5) ^ (56516261 * ((v34 - 144) ^ 0x15EBF17D));
  ((void (*)(uint64_t))*(&off_100019330 + v35 + 43))(v34 - 144);
  *(_DWORD *)(v34 - 132) = v35 - 1748787863 * ((v34 - 144) ^ 0x81BAC106) - 7;
  *(void *)(v34 - 144) = &a26;
  uint64_t v40 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v35 + 7))(v34 - 144);
  return (*(uint64_t (**)(uint64_t))(v31 + 8 * ((*(_DWORD *)(v34 - 136) + 1406450678 >= 0) + v35)))(v40);
}

uint64_t sub_100004C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33)
{
  *(void *)(v38 - 136) = v37;
  *(void *)(v38 - 128) = v36;
  *(_DWORD *)(v38 - 144) = (v34 - 3) ^ (191237807 * ((v38 - 144) ^ 0xDBC9B6B1));
  (*(void (**)(uint64_t))(v33 + 8 * (v34 + 36)))(v38 - 144);
  uint64_t v39 = a25;
  int v40 = v34 - 704005591 * ((v38 - 144) ^ 0xF7D78CF0) + 19;
  *(_DWORD *)(v38 - 104) = v40;
  *(void *)(v38 - 120) = v37;
  *(void *)(v38 - 112) = v39;
  *(void *)(v38 - 136) = &a33;
  *(void *)(v38 - 128) = &a33;
  *(void *)(v38 - 144) = &a24;
  long long v41 = *(void (**)(uint64_t))(v33 + 8 * (v34 + 39));
  v41(v38 - 144);
  *(void *)(v38 - 128) = a19;
  *(void *)(v38 - 120) = v37;
  *(_DWORD *)(v38 - 104) = v40;
  *(void *)(v38 - 144) = &a24;
  *(void *)(v38 - 136) = &a33;
  *(void *)(v38 - 112) = &a33;
  v41(v38 - 144);
  *(void *)(v38 - 144) = a20;
  *(void *)(v38 - 128) = &a33;
  *(_DWORD *)(v38 - 136) = (v34 - 191875503) ^ (520147679 * ((v38 - 144) ^ 0xD061A127));
  ((void (*)(uint64_t))*(&off_100019330 + v34 + 42))(v38 - 144);
  *(_DWORD *)(v38 - 144) = (v34 - 3) ^ (191237807 * ((v38 - 144) ^ 0xDBC9B6B1));
  *(void *)(v38 - 136) = &a31;
  *(void *)(v38 - 128) = &a33;
  ((void (*)(uint64_t))*(&off_100019330 + v34 + 36))(v38 - 144);
  *(void *)(v38 - 144) = &a33;
  *(void *)(v38 - 136) = &a31;
  *(_DWORD *)(v38 - 128) = v34 - 4 + 523995289 * ((v38 - 144) ^ 0x98567068);
  uint64_t v42 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v34 + 57))(v38 - 144);
  if (a21 == 0x79046D8DC0A979F1) {
    int v43 = v34 - 3;
  }
  else {
    int v43 = v34 - 4;
  }
  return (*(uint64_t (**)(uint64_t))(v35 + 8 * v43))(v42);
}

uint64_t sub_100004EB8@<X0>(int a1@<W8>)
{
  int v5 = 1638185881 * ((v4 - 144) ^ 0x11FD620);
  *(void *)(v4 - 144) = v7;
  *(void *)(v4 - 120) = v3;
  *(_DWORD *)(v4 - 132) = a1 - v5 - 2;
  *(_DWORD *)(v4 - 128) = (v9 - 1901752086) ^ v5;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 + 14)))(v4 - 144);
  *uint64_t v8 = v9;
  *int v1 = 344250259;
  return result;
}

void sub_100004FC8(_DWORD *a1)
{
  unsigned int v1 = 523995289 * (a1 ^ 0x98567068);
  int v2 = a1[4] ^ v1;
  if (*a1 - v1 + 1623440039 <= 0x80000000) {
    int v3 = a1[4] ^ v1;
  }
  else {
    int v3 = v2 + 1;
  }
  __asm { BRAA            X12, X13 }
}

uint64_t sub_10000506C@<X0>(int a1@<W8>)
{
  unsigned int v4 = 520147679 * (&v6 ^ 0xD061A127);
  int v8 = v4 + a1 + 1;
  int v6 = v2 + v4 - ((v3 + 1099396430) & 0x50B9411A) + 153115444;
  uint64_t v7 = v1;
  return ((uint64_t (*)(int *))*(&off_100019330 + a1 + 25))(&v6);
}

void sub_100005188(uint64_t a1)
{
  __asm { BRAA            X9, X10 }
}

uint64_t sub_1000051C4@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v3 = 1383034093 * a2;
  int v4 = ((uint64_t (*)(void))*(&off_100019330 + 1383034093 * a2 + 10))();
  if (v4 == 16) {
    unsigned int v5 = -42029;
  }
  else {
    unsigned int v5 = -42030;
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  ((void (*)(uint64_t))*(&off_100019330 + v3))(a1);
  return v6;
}

void sub_10000524C(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000) {
    int v2 = 8;
  }
  else {
    int v2 = 7;
  }
  __asm { BRAA            X10, X9 }
}

uint64_t sub_1000052E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9
                                                                                                  + 8 * (v8 - 16 + (((((2 * (int)a2) & 0x8A6FBE | 0x2000000) + (a2 & 0xFFFFFF ^ 0x7C4537DF) + 45795361) & 0x3000000) == 0x1000000) * a8)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1000053A0()
{
  return v0();
}

uint64_t sub_100005404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  uint64_t v18 = (*(uint64_t (**)(void))(v16 + 8 * (v15 - 6)))(a15);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17
                                                                                                  + 8 * (v15 + 13 * (v18 != 0))))(v18, v19, v20, v21, v22, v23, v24);
}

uint64_t sub_100005464@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v1 + (v2 == 0x1000000) * a1)))();
}

uint64_t sub_1000054A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, unsigned int a20)
{
  uint64_t v32 = v21;
  a20 = (v20 - 769513846) ^ (704005591 * (&a19 ^ 0xF7D78CF0));
  (*(void (**)(char *))(v23 + 8 * (v22 + v20 + 745267747 + 53)))(&a19);
  if (SHIDWORD(a11) > 1291933660)
  {
    if (SHIDWORD(a11) <= 1593915355)
    {
      if (HIDWORD(a11) != 1291933661 && HIDWORD(a11) != 1291933662) {
        return sub_10000590C(v24, v25, v26, v27, v28, v29, v30, 0, a9, a10, a11, a12, v32, a14, a15, 0x4DA57D9900000000, 0);
      }
    }
    else if (HIDWORD(a11) != 1593915356 && HIDWORD(a11) != 1593915357 && HIDWORD(a11) != 1593915358)
    {
      return sub_10000590C(v24, v25, v26, v27, v28, v29, v30, 0, a9, a10, a11, a12, v32, a14, a15, 0x4DA57D9900000000, 0);
    }
    return sub_100005784();
  }
  if (SHIDWORD(a11) <= 1291925469)
  {
    if (HIDWORD(a11) != 1291925468 && HIDWORD(a11) != 1291925469) {
      return sub_10000590C(v24, v25, v26, v27, v28, v29, v30, 0, a9, a10, a11, a12, v32, a14, a15, 0x4DA57D9900000000, 0);
    }
    return sub_100005784();
  }
  if (HIDWORD(a11) == 1291925470 || HIDWORD(a11) == 1291929564 || HIDWORD(a11) == 1291929565) {
    return sub_100005784();
  }
  return sub_10000590C(v24, v25, v26, v27, v28, v29, v30, 0, a9, a10, a11, a12, v32, a14, a15, 0x4DA57D9900000000, 0);
}

uint64_t sub_100005784()
{
  if (malloc((*((_DWORD *)&unk_1000190F8 + 6 * v1 + 4) - 1302691225))) {
    int v2 = 7;
  }
  else {
    int v2 = 8;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * (v2 + 14)))();
}

uint64_t sub_100005828()
{
  unsigned int v4 = v3 + 56108922 - ((2 * v3 + 1689584846) & 0xA1FB4A2E) + 4;
  unsigned int v5 = (v4 ^ 0xAF0718A8) + 2111666040 + ((2 * v4) & 0xFFF57B7E ^ 0xA1F14A2E);
  return (*(uint64_t (**)(void))(v2 + 8 * (v0 + ((v5 != v1) | (4 * (v5 != v1))))))();
}

uint64_t sub_1000058D0@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + (v3 + v4)) = *(unsigned char *)(v1 + (v3 + v4));
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 - 1 != v5) | (4 * (v3 - 1 != v5))) + v2)))();
}

uint64_t sub_10000590C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v20 = a17;
  if (a8)
  {
    int v21 = 1321577070;
  }
  else
  {
    a8 = a17;
    int v21 = 1321535018;
  }
  if (v18 == 1321577070)
  {
    uint64_t v20 = a8;
    int v22 = v21;
  }
  else
  {
    int v22 = v18;
  }
  if (v22 == 1321577070) {
    int v23 = v17 - 745267754;
  }
  else {
    int v23 = v17 - 745267755;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8 * (v23 + 9)))(v20, a1, a2, a3, a4, a5, a6, a7, a9);
}

uint64_t sub_10000598C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15, uint64_t a16, int a17)
{
  return (*(uint64_t (**)(void))(v19
                              + 8
                              * (v17
                               + ((a16 != 0 && a17 - 1302691229 + v18 <= a15) | (2
                                                                               * (a16 != 0
                                                                               && a17 - 1302691229 + v18 <= a15))))))();
}

uint64_t sub_1000059EC@<X0>(int a1@<W8>)
{
  unsigned int v4 = v1 + 56108922 - ((2 * v1 + 1689584838) & 0xA1FB4A2E);
  if ((v4 ^ 0xAF0718A8) + 2111666040 + ((2 * v4) & 0xFFF57B7E ^ 0xA1F14A2E) == v2) {
    ++a1;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * a1))();
}

uint64_t sub_100005AEC@<X0>(int a1@<W8>)
{
  if (v3 == v1) {
    ++a1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * a1))();
}

uint64_t sub_100005B08()
{
  return sub_1000053A0();
}

uint64_t sub_100005B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if ((*(uint64_t (**)(uint64_t, uint64_t, char *))(v11 + 8 * (v10 - 9)))(a10, 3, (char *)*(&off_100019530 + v10 + 14) - 7))
  {
    int v13 = v10;
  }
  else
  {
    int v13 = v10 + 1;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * v13))();
}

uint64_t sub_100005BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  return (*(uint64_t (**)(void))(v16 + 8 * (v15 + 22 * (a15 > 0xA19D0DA3 || a15 + 1583542876 > 0x5E62F25C))))();
}

uint64_t sub_100005C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (*(unsigned char *)(a15 + (v17 - 867209358)) == 48) {
    int v18 = v15 + 1;
  }
  else {
    int v18 = v15;
  }
  return (*(uint64_t (**)(void))(v16 + 8 * v18))();
}

void sub_100005CC4()
{
}

uint64_t sub_100005CF0@<X0>(uint64_t a1@<X1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 130)
  {
    uint64_t v12 = (*(unsigned __int8 *)(a9 + (v11 - 867209355)) | (*(unsigned __int8 *)(a9
                                                                                            + (v11 - 867209356)) << 8))
        + 4;
    goto LABEL_5;
  }
  if (a2 == 129)
  {
    uint64_t v12 = *(unsigned __int8 *)(a9 + (v11 - 867209356)) + 3;
LABEL_5:
    BOOL v13 = SecCertificateCreateWithBytes(a4, a1, v12) != 0;
    return (*(uint64_t (**)(void))(v10 + 8 * (4 * v13 + 25)))();
  }
  _CFRelease(v9);
  return sub_100005EDC();
}

uint64_t sub_100005DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  ((void (*)(uint64_t, uint64_t))*(&off_100019330 + v20 - 8))(v15, a1);
  uint64_t v22 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v20 - 7))(a1);
  unsigned int v23 = v16 + v19 + 716333518;
  int v24 = (a15 > 0xA19D0DA3) ^ (v23 < 0x5E62F25C);
  BOOL v25 = v23 < v17;
  if (v24) {
    BOOL v25 = a15 > 0xA19D0DA3;
  }
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * (v20 + 22 * v25)))(v22);
}

uint64_t sub_100005EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v15 - 7)))(a15);
  return sub_100005F00(v17);
}

uint64_t sub_100005F00()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (15 * (v1 != 0) + v0)))();
}

uint64_t sub_100005F24@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  int v14 = v11 + 745267749 * a1 + 10 * v10;
  if ((*(uint64_t (**)(uint64_t, char *, char *, uint64_t, uint64_t))(v12 + 8 * (v14 - 17)))(a3, (char *)*(&off_100019530 + v14 + 31) - 14, va, 8, 100))
  {
    int v15 = v14;
  }
  else
  {
    int v15 = v14 + 1;
  }
  return (*(uint64_t (**)(void))(v13 + 8 * v15))();
}

uint64_t sub_100005FCC()
{
  return 0;
}

uint64_t sub_100006134(uint64_t a1, char a2)
{
  return ((uint64_t (*)(void))*(&off_100019330
                             + (((((char)(((16 * a2 * a2) ^ 0x30) + 32) >> 6) % 0x19u + 37) >> 1) & 0x30 | 0x44)
                             - 27))();
}

uint64_t sub_1000061AC()
{
  return sub_10000AE7C();
}

uint64_t sub_100006214(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) ^ (520147679 * (a1 ^ 0xD061A127));
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)a1;
  uint64_t v4 = v2;
  unsigned int v5 = v1 + 191875505 - 191237807 * (&v4 ^ 0xDBC9B6B1);
  return ((uint64_t (*)(uint64_t *))*(&off_100019330 + v1 + 191875529))(&v4);
}

uint64_t sub_1000062E4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a2;
  BOOL v2 = (((char)a2 >> 5) * a2) > 0xB7u;
  int v3 = (32
                       * ((((char)(((-2114445439 * (unint64_t)(v2 | 0x20u)) >> 37)
                                                                + (-2114445439 * (v2 | 0x20u) < 0)) >> 5) ^ 0x94u) > 0xC0)
                       / -76) >> 1;
  uint64_t v4 = (uint64_t (*)(uint64_t, char *, uint64_t *, uint64_t, uint64_t))*(&off_100019330
                                                                             + (int)((((4 * v3 + 83) ^ 0x88888888) & 0xFD)
                                                                                   - 211));
  unsigned int v5 = -((((((v3 + 45) >> 7) ^ 0x3D) + 18) / 0x53) & ((((v3 + 45) >> 7) ^ 0x3D) + 18));
  return v4(a1, (char *)*(&off_100019530+ (((((((v5 & 0x40) - 72 * ((v5 & 0xC0) / 0x48)) & 0x10 | 0xA0) % 0xA9 % 0x1B) ^ 0xB9) / 0x6F - 97) & 0xBF)- 106)- 14, &v7, 8, 100);
}

void sub_1000064C0(uint64_t a1)
{
  if (a1) {
    int v1 = 2;
  }
  else {
    int v1 = 1;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_100006510@<X0>(int a1@<W8>)
{
  unsigned int v2 = 235968479 * a1 + 1;
  uint64_t v3 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v2))(200);
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + 2 * (v3 != 0))))();
}

uint64_t sub_100006578@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v9 = (*(uint64_t (**)(uint64_t, void))(v5 + 8 * (v7 + a2 * v6 - 235968469)))(a1, 0);
  if (v9 == 16)
  {
    int v3 = 1398708801;
    goto LABEL_7;
  }
  if (v9 == 12)
  {
LABEL_7:
    (*(void (**)(uint64_t))(v5 + 8 * (v4 - 235968480)))(a1);
    return (1293967099 * v3 - 1334165480);
  }
  if (v9)
  {
    int v3 = 1234411022;
    goto LABEL_7;
  }
  *unsigned int v2 = a1;
  int v3 = 362650424;
  return (1293967099 * v3 - 1334165480);
}

void sub_100006640(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D));
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4) == 231015519) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D));
  }
  __asm { BRAA            X15, X16 }
}

uint64_t sub_1000066C0(uint64_t a1)
{
  int v5 = v3 - 2 * v4;
  if (*(_DWORD *)(*(void *)(a1 + 16) + 4) == v2) {
    ++v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * v5))();
}

uint64_t sub_1000066F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = v2;
  unsigned int v6 = v1 + 523995289 * (&v4 ^ 0x98567068) - 2;
  uint64_t result = ((uint64_t (*)(uint64_t *))*(&off_100019330 + v1 + 59))(&v4);
  *(_DWORD *)(v2 + 4) = 462031038 - *(_DWORD *)(v2 + 4);
  return result;
}

uint64_t sub_100006860(uint64_t a1)
{
  int v1 = 523995289 * (a1 ^ 0x98567068);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  int v3 = *(_DWORD *)(a1 + 12) ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v4 + 1916468129 >= 0) {
    int v4 = 462031038 - v4;
  }
  if ((v3 - 1430439603) < 4 * (unint64_t)(v4 - 231015519)) {
    int v5 = v2;
  }
  else {
    int v5 = v2 + 1;
  }
  return (*(uint64_t (**)(void))((char *)*(&off_100019530 + v2 + 37) + 8 * v5 - 6))();
}

uint64_t sub_1000068F8()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (v2 + 4 * (v1 != 1430439603))))();
}

uint64_t sub_100006920(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 8 * (v3 - v4 + 4)))(a1, (v3 - v4 + 3), 897970625, v2);
}

uint64_t sub_10000697C@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W8>)
{
  *(unsigned char *)(v6 + (a3 + a4)) = ((a2 - 897970625) >> v7)
                                           - ((2 * ((a2 - 897970625) >> v7)) & 0xC0)
                                           + 96;
  if (a3 - 1 == v5) {
    int v8 = a1 + 1;
  }
  else {
    int v8 = a1;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * v8))();
}

uint64_t sub_1000069C8(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v7 = v6 + 8;
  int v8 = a4 + a2;
  if (v7 == 32) {
    int v9 = v8 + 1;
  }
  else {
    int v9 = v8;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 8 * v9))(a1, -3 * (v7 != 32) + v8, a3, v5);
}

uint64_t sub_1000069F4(uint64_t a1, int a2)
{
  if (v2 + 780866798 < -1135601331 != v5 - 198671456 < -1135601331) {
    BOOL v6 = v2 + 780866798 < -1135601331;
  }
  else {
    BOOL v6 = v5 - 198671456 < v2 + 780866798;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v3
                                                                      + 8 * (int)(a2 + (v6 & 0xFFFFFFFD | (2 * v6)))))(a1, a2 - 3 * !v6, 897970625, v4);
}

uint64_t sub_100006A6C@<X0>(int a1@<W4>, int a2@<W8>)
{
  return sub_10000697C(a1 - 3, *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v4 - 1210553773)), v3, a2);
}

uint64_t sub_100006A94(uint64_t result)
{
  *(_DWORD *)(result + 16) = v1;
  return result;
}

void sub_100006A9C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 520147679 * (a1 ^ 0xD061A127);
  __asm { BRAA            X11, X2 }
}

void sub_100006BC8()
{
}

uint64_t sub_100006BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v19 = 32 * v13 + 1197437984;
  *(_DWORD *)(a10 + 16) = -898526670 - v14;
  int v20 = 1638185881 * ((v18 - 136) ^ 0x11FD620);
  *(_DWORD *)(v18 - 136) = (v15 - 21985947) ^ v20;
  *(_DWORD *)(v18 - 132) = v20 + 1311422028;
  *(void *)(v18 - 128) = v17;
  ((void (*)(uint64_t))*(&off_100019330 + v15 + 31))(v18 - 136);
  int v21 = 520147679 * ((v18 - 136) ^ 0xD061A127);
  *(_DWORD *)(v18 - 120) = v15 - 5 - v21;
  *(_DWORD *)(v18 - 136) = ((v19 ^ 0xCDDDFEFD) + ((2 * v19) & 0x9BBBFDC0) + 2012982707) ^ v21;
  *(void *)(v18 - 128) = v17;
  ((void (*)(uint64_t))*(&off_100019330 + v15 + 20))(v18 - 136);
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = &a13;
  *(_DWORD *)(v18 - 120) = v15 + 523995289 * ((v18 - 136) ^ 0x98567068) - 4;
  ((void (*)(uint64_t))*(&off_100019330 + v15 + 57))(v18 - 136);
  *(_DWORD *)(v18 - 120) = v15 - 5 - v20;
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = v17;
  uint64_t v22 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v15 + 30))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (int)(((*(_DWORD *)(v18 - 116) + 556127643) >> 31) + v15)))(v22);
}

uint64_t sub_100006DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  *(_DWORD *)(v15 - 120) = v13 + 523995289 * ((v15 - 136) ^ 0x98567068) - 1;
  *(void *)(v15 - 136) = v12;
  *(void *)(v15 - 128) = v10;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v14 + 8 * (v13 + 60)))(v15 - 136);
  return (*(uint64_t (**)(uint64_t))(v11 + 8 * (v13 + ((a10 < 1) | (4 * (a10 < 1))) + 20)))(v16);
}

uint64_t sub_100006E50@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 + ((a1 > v1) | (4 * (a1 > v1))) + 20)))();
}

uint64_t sub_100006E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)(v17 - 136) = a12;
  *(void *)(v17 - 128) = &a13;
  *(_DWORD *)(v17 - 120) = v13 + 523995289 * ((v17 - 136) ^ 0x98567068) - 10;
  (*(void (**)(uint64_t))(v16 + 8 * (v13 + 51)))(v17 - 136);
  int v18 = 520147679 * ((v17 - 136) ^ 0xD061A127);
  *(_DWORD *)(v17 - 120) = v13 - 11 - v18;
  *(_DWORD *)(v17 - 136) = v18 ^ 0x45D9ACB1;
  *(void *)(v17 - 128) = v14;
  (*(void (**)(uint64_t))(v16 + 8 * (v13 + 14)))(v17 - 136);
  *(_DWORD *)(v17 - 120) = v13 - 11 - 1638185881 * ((v17 - 136) ^ 0x11FD620);
  *(void *)(v17 - 136) = a12;
  *(void *)(v17 - 128) = v14;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v13 + 24)))(v17 - 136);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * (int)(((*(_DWORD *)(v17 - 116) + 556127643) >> 31) + v13)))(v19);
}

uint64_t sub_100006FC8()
{
  if (v1 >= 0) {
    int v3 = v1;
  }
  else {
    int v3 = v1 + 1;
  }
  if (((v3 >> 1) ^ 0x7FEFFEBC) + (v3 & 0xFFDFFD78) + 1048900 <= 0x80000001) {
    int v4 = v2;
  }
  else {
    int v4 = v2 + 1;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * v4))();
}

uint64_t sub_10000707C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  if ((a11 - 1866192792) <= 0x80000001) {
    int v13 = v12;
  }
  else {
    int v13 = v12 + 1;
  }
  return (*(uint64_t (**)(void))(v11 + 8 * v13))();
}

uint64_t sub_1000070C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(v18 - 112) = a13;
  *(void *)(v18 - 104) = v15;
  *(_DWORD *)(v18 - 120) = v14 + 1836812333 * ((v18 - 136) ^ 0x4065F266) + 29;
  *(void *)(v18 - 136) = v15;
  *(void *)(v18 - 128) = a11;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v14 + 18)))(v18 - 136);
  int v20 = v13 - 1865143816;
  if (v13 - 1865143816 < 0) {
    int v20 = v13 - 1865143815;
  }
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (v14
                                             + 19
                                             * ((((v20 & 0xDE77AF30) + ((v20 >> 1) ^ 0xEF3BD798) + 281290856) & a10) != 0))))(v19);
}

uint64_t sub_1000071C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v18 - v21;
  *(_DWORD *)(v20 - 136) = v21 ^ 0x45D9ACB1;
  *(void *)(v20 - 128) = v16;
  (*(void (**)(uint64_t))(v19 + 8 * (v18 + 25)))(v20 - 136);
  *(void *)(v20 - 136) = a12;
  *(void *)(v20 - 128) = &a13;
  *(_DWORD *)(v20 - 120) = v18 + 523995289 * ((v20 - 136) ^ 0x98567068) + 1;
  (*(void (**)(uint64_t))(v19 + 8 * (v18 + 62)))(v20 - 136);
  *(void *)(v20 - 136) = a12;
  *(void *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 120) = v18 - ((v20 - 136) ^ v14) * v15;
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 35)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * (int)(((*(_DWORD *)(v20 - 116) + v13) >> 31) + v18)))(v22);
}

uint64_t sub_1000072EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v19 = 520147679 * ((v18 - 136) ^ 0xD061A127);
  *(_DWORD *)(v18 - 120) = v17 - 7 - v19;
  *(_DWORD *)(v18 - 136) = ((v15 ^ 0xF5DFADF2) + ((2 * v15) & 0xEBBF5BE4) + 1341783742) ^ v19;
  *(void *)(v18 - 128) = &a13;
  (*(void (**)(uint64_t))(v16 + 8 * (v17 + 18)))(v18 - 136);
  *(_DWORD *)(v18 - 120) = v17 - 7 - 1638185881 * ((v18 - 136) ^ 0x11FD620);
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = v13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v17 + 28)))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * (int)(((*(_DWORD *)(v18 - 116) + 556127643) >> 31) + v17 - 7)))(v20);
}

uint64_t sub_100007408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v20 - 120) = v18 - ((v20 - 136) ^ v14) * v15 - 20;
  *(void *)(v20 - 136) = &a13;
  *(void *)(v20 - 128) = v16;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 15)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * (int)(v18 + ((*(_DWORD *)(v20 - 116) + v13) >> 31))))(v21);
}

uint64_t sub_10000748C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v11 = a1 - 12;
  *(void *)(v10 - 128) = &a6;
  *(void *)(v10 - 120) = v6;
  *(_DWORD *)(v10 - 136) = (a1 - 18) ^ (56516261 * ((v10 - 136) ^ 0x15EBF17D));
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(v9 + 8 * (a1 + 30)))(v10 - 136);
  if (v8 == 1) {
    int v13 = v11 + 1;
  }
  else {
    int v13 = v11;
  }
  return (*(uint64_t (**)(uint64_t))(v7 + 8 * v13))(v12);
}

uint64_t sub_100007514@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_100007544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v19 - 120) = v17 - ((v19 - 136) ^ v13) * v15 - 7;
  *(void *)(v19 - 136) = a12;
  *(void *)(v19 - 128) = &a13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v17 + 28)))(v19 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (v17 + 2 * ((*(_DWORD *)(v19 - 116) + v14) > 0x80000000))))(v20);
}

uint64_t sub_1000075C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v19 - v21 - 25;
  *(void *)(v20 - 128) = &a13;
  *(_DWORD *)(v20 - 136) = ((v13 ^ 0x47DDBFF2) + ((2 * v13) & 0x8FBB7FE4) - 33821506) ^ v21;
  (*(void (**)(uint64_t))(v18 + 8 * v19))(v20 - 136);
  int v22 = v19 - 20;
  *(_DWORD *)(v20 - 120) = v22 - ((v20 - 136) ^ 0x11FD620) * v14 - 5;
  *(void *)(v20 - 136) = a12;
  *(void *)(v20 - 128) = v17;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v22 + 30)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8 * (int)(((*(_DWORD *)(v20 - 116) + v15) >> 31) + v22)))(v23);
}

uint64_t sub_1000076C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v20 - 120) = v18 - ((v20 - 136) ^ v13) * v14 - 3;
  *(void *)(v20 - 136) = &a13;
  *(void *)(v20 - 128) = v17;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 32)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8 * (int)(((*(_DWORD *)(v20 - 116) + v15) >> 31) + v18)))(v21);
}

uint64_t sub_10000772C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)(v18 - 128) = &a13;
  *(void *)(v18 - 120) = v15;
  *(_DWORD *)(v18 - 136) = v17 ^ (56516261 * ((v18 - 136) ^ 0x15EBF17D));
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v17 + 48)))(v18 - 136);
  if (v13 == 1) {
    int v20 = v17 + 1;
  }
  else {
    int v20 = v17;
  }
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * (v20 + 11)))(v19);
}

uint64_t sub_1000077B4()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (v1 + 11)))();
}

uint64_t sub_1000077EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v19 - 120) = v17 - ((v19 - 136) ^ v13) * v14 - 14;
  *(void *)(v19 - 136) = a12;
  *(void *)(v19 - 128) = &a13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v17 + 21)))(v19 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (v17 + 11 * ((*(_DWORD *)(v19 - 116) + v15) < 0x80000001))))(v20);
}

uint64_t sub_100007870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v19 = 520147679 * ((v18 - 136) ^ 0xD061A127);
  *(_DWORD *)(v18 - 136) = ((v13 ^ 0xDFF9AFBC) + ((2 * v13) & 0xBFF35F78) + 1709178100) ^ v19;
  *(void *)(v18 - 128) = &a13;
  *(_DWORD *)(v18 - 120) = v16 - v19 - 10;
  (*(void (**)(uint64_t))(v17 + 8 * (v16 + 15)))(v18 - 136);
  *(_DWORD *)(v18 - 120) = v16 + 1 - 1638185881 * ((v18 - 136) ^ 0x11FD620) - 11;
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = v14;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v16 + 25)))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * (int)(((*(_DWORD *)(v18 - 116) + 556127643) >> 31) + v16 + 1)))(v20);
}

uint64_t sub_100007990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)(v20 - 136) = &a13;
  *(void *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 120) = v19 - ((v20 - 136) ^ v13) * v15 - 17;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v19 + 18)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * (int)(v19 + ((*(_DWORD *)(v20 - 116) + v14) >> 31))))(v21);
}

uint64_t sub_100007A04@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v11 = a1 + 6;
  *(_DWORD *)(v10 - 136) = (a1 - 15) ^ (56516261 * ((v10 - 136) ^ 0x15EBF17D));
  *(void *)(v10 - 128) = &a6;
  *(void *)(v10 - 120) = v7;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(v9 + 8 * (a1 + 33)))(v10 - 136);
  if (v6 == 1) {
    int v13 = v11 + 1;
  }
  else {
    int v13 = v11;
  }
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * v13))(v12);
}

uint64_t sub_100007A94@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_100007AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = &a13;
  *(_DWORD *)(v18 - 120) = v17 - ((v18 - 136) ^ 0x11FD620) * v13 - 10;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v17 + 25)))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * (v17 + 14 * ((*(_DWORD *)(v18 - 116) + v14) > 0x80000000))))(v19);
}

void sub_100007B54(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000) {
    int v2 = 4;
  }
  else {
    int v2 = 3;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_100007BC8@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3)
{
  int v4 = (-1936509884 * a2) | 3;
  int v5 = a1 & 0xFFFFFF | 0x1000000;
  HIDWORD(a3) = (v4 + 1166996050) ^ (704005591 * (&a3 ^ 0xF7D78CF0));
  uint64_t v6 = ((uint64_t (*)(uint64_t *))*(&off_100019330 + v4 + 1936509941))(&a3);
  if (v5 <= 16781312)
  {
    switch(v5)
    {
      case 16777217:
        uint64_t v7 = 5;
        goto LABEL_17;
      case 16777218:
        uint64_t v7 = 7;
        goto LABEL_17;
      case 16777219:
        uint64_t v7 = 9;
        goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v3 + 24))(v6);
  }
  if (v5 > 16785409)
  {
    if (v5 == 16785410)
    {
      uint64_t v7 = 2;
      goto LABEL_17;
    }
    if (v5 == 16785411)
    {
      uint64_t v7 = 3;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v3 + 24))(v6);
  }
  uint64_t v7 = 0;
  if (v5 != 16781313)
  {
    if (v5 == 16781314)
    {
      uint64_t v7 = 1;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v3 + 24))(v6);
  }
LABEL_17:
  uint64_t v8 = malloc((*((_DWORD *)&unk_1000190F8 + 6 * v7 + 4) - 1302691225));
  return (*(uint64_t (**)(void *))(v3 + 8 * (4 * (v8 != 0) + 8)))(v8);
}

uint64_t sub_100007EDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  int v11 = a3 + v4 * (v9 + 14);
  unsigned int v12 = v10 - 1302691229;
  if (!v3) {
    unsigned int v12 = -4;
  }
  if (v5 == v8) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 4294967292;
  }
  if (v6 + 4 <= v6) {
    int v14 = v11;
  }
  else {
    int v14 = v11 + 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8 * v14))(a1, a2, v13);
}

uint64_t sub_100007F50()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v0 + ((v2 != v1) | (4 * (v2 != v1))))))();
}

uint64_t sub_100007F80()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + 8 * (v0 > 0x1F))))();
}

uint64_t sub_100007FB4()
{
  long long v4 = *(_OWORD *)((char *)v2 + 20);
  *int v2 = *(_OWORD *)((char *)v2 + 4);
  v2[1] = v4;
  if ((v0 & 0xFFFFFFE0) == 0x20) {
    ++v1;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v1))();
}

uint64_t sub_100007FEC()
{
  long long v4 = *(_OWORD *)((char *)v1 + 4);
  *(v1 - 1) = *(_OWORD *)((char *)v1 - 12);
  *int v1 = v4;
  if (v2) {
    int v5 = v0;
  }
  else {
    int v5 = v0 + 1;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v5))();
}

uint64_t sub_10000801C()
{
  if (v1 == v0) {
    int v4 = v2 + 1;
  }
  else {
    int v4 = v2;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v4))();
}

uint64_t sub_100008044@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(v3 + v2) = *(unsigned char *)(a1 + v2);
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 + 1 != v1) | (2 * (v2 + 1 != v1))) + v5 - 3)))();
}

uint64_t sub_100008080@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(v4 + v2) = *(unsigned char *)(a1 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 + 1 != v1) | (2 * (v2 + 1 != v1))) + v3)))();
}

uint64_t sub_1000080B8()
{
  return 0;
}

uint64_t sub_10000820C(uint64_t a1, uint64_t a2, char a3)
{
  signed int v3 = ((char)((((char)((a3 - 83) * (a3 - 112)
                                                  - 110
                                                  * (((unint64_t)(156180629 * (char)((a3 - 83) * (a3 - 112))) >> 34)
                                                   + (156180629 * (char)((a3 - 83) * (a3 - 112)) < 0))) >> 2) & 0xE0)
                           - 64) >> 3) & 0x70 | 0xFFFFFF80;
  return ((uint64_t (*)(void))*(&off_100019330
                             + ((((char)(((int)(((unint64_t)(2004318071 * v3) >> 32) - v3) >> 5)
                                                     + ((int)(((unint64_t)(2004318071 * v3) >> 32) - v3) < 0)
                                                     - 28)
                                              % 88) >> 2) & 3 | 0xBC)
                             - 151))();
}

uint64_t sub_100008364(uint64_t a1)
{
  return sub_10000DD54(a1);
}

uint64_t sub_10000842C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068);
  if (*(void *)a1 == *(void *)(a1 + 8)) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068);
  }
  return (*(uint64_t (**)(void))((char *)*(&off_100019530 + v1 + 57) + 8 * v2 - 2))();
}

uint64_t sub_100008478@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(a1 + 4);
  if (v4 + 1916468129 < 0) {
    int v5 = *(_DWORD *)(a1 + 4);
  }
  else {
    int v5 = 462031038 - v4;
  }
  *(_DWORD *)(v1 + 4) = v4;
  if (v5 == 231015519) {
    int v6 = v3;
  }
  else {
    int v6 = v3 + 1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * v6))();
}

uint64_t sub_1000084C4@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 + 8) + 4 * (v6 - 231015520)) = *(_DWORD *)(*(void *)(a1 + 8) + 4 * (v6 - 231015520));
  return (*(uint64_t (**)(void))(v2 + 8 * (v4 - v7 - 2 * v5 + 2 * (v6 - 1 == v3))))();
}

uint64_t sub_10000850C@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 + 8) + 4 * (v5 + v4)) = *(_DWORD *)(*(void *)(a1 + 8) + 4 * (v5 + v4));
  return (*(uint64_t (**)(void))(v2 + 8 * (v6 + 2 * (v5 - 1 == v3))))();
}

void sub_100008548(uint64_t a1, int a2)
{
  __asm { BRAA            X8, X9 }
}

uint64_t sub_1000085DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, unsigned int a12)
{
  int v16 = a2 & 0xFFFFFF | 0x1000000;
  a12 = (v15 - 1036443534) ^ (704005591 * (&a11 ^ 0xF7D78CF0));
  uint64_t v17 = (*(uint64_t (**)(char *))(v12 + 8 * (v15 - 266929643)))(&a11);
  if (v16 <= 16781312)
  {
    switch(v16)
    {
      case 16777217:
        uint64_t v18 = 5;
        goto LABEL_17;
      case 16777218:
        uint64_t v18 = 7;
        goto LABEL_17;
      case 16777219:
        uint64_t v18 = 9;
        goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v13 + 136))(v17);
  }
  if (v16 > 16785409)
  {
    if (v16 == 16785410)
    {
      uint64_t v18 = 2;
      goto LABEL_17;
    }
    if (v16 == 16785411)
    {
      uint64_t v18 = 3;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v13 + 136))(v17);
  }
  uint64_t v18 = 0;
  if (v16 != 16781313)
  {
    if (v16 == 16781314)
    {
      uint64_t v18 = 1;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v13 + 136))(v17);
  }
LABEL_17:
  uint64_t v19 = (*(uint64_t (**)(void))(v12 + 8 * (v14 - 266929702)))((*(_DWORD *)((char *)*(&off_100019530 + v14 - 266929642) + 24 * v18 + 5)
                                                                                         - 1302691225));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13
                                                              + 8
                                                              * (v14 - 266929702 + ((v19 != 0) | (2 * (v19 != 0))) + 14)))(v19, v20, v21);
}

void sub_100008CD8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 1748787863 * (a1 ^ 0x81BAC106);
  uint64_t v4 = *(void *)a1;
  v3[0] = (523995289 * (v3 ^ 0x98567068)) ^ (v1 + 1);
  ((void (*)(_DWORD *))*(&off_100019330 + v1 + 39))(v3);
  if (v3[1] == 851002806) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1;
  }
  __asm { BRAA            X8, X9 }
}

void sub_100008DB4()
{
  if ((*(_DWORD *)(v2 + 4) + 1916468129) <= 0x80000000) {
    int v3 = v1;
  }
  else {
    int v3 = v1 + 2;
  }
  *(_DWORD *)(v0 + 8) = v3;
}

void sub_100008E14(uint64_t a1)
{
  __asm { BRAA            X11, X13 }
}

uint64_t sub_100008E80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  if (v9 == 1534303178) {
    int v10 = v7 - 6 * v8 + 1;
  }
  else {
    int v10 = v7 - 6 * v8;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 8 * v10))(a1, a2, a3, a4, a5, a6, 897970625, 231015519);
}

uint64_t sub_100008EE8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (v1 - 5)))();
}

uint64_t sub_100008FDC@<X0>(int a1@<W4>, int a2@<W7>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(void))(a3 + 8 * (a2 + (v4 != v3) * a1)))();
}

uint64_t sub_100009004@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (v1 + 4 * (v2 != 0))))();
}

void sub_100009028(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  int v6 = a2 + v4;
  int v7 = a2 + 1;
  *(_DWORD *)(*(void *)(v3 + 8) + 4 * v6) = a1;
  int v8 = v5 - 8;
  *(_DWORD *)(v3 + 4) = v7;
  int v9 = 462031038 - v7;
  if (v7 + 1916468129 < 0) {
    int v9 = v7;
  }
  __asm { BRAA            X2, X3 }
}

uint64_t sub_1000090A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v8 = *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v3 + v5 - 1));
  return (*(uint64_t (**)(uint64_t, void))(a2 + 8 * (v7 + 2 * (v8 == v4))))(a1, v7 + (v8 != v4) * v6);
}

uint64_t sub_1000090D0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (int)(a2 + ((v3 - 1 + v4) >> 31))))(a1, a2 + 6 * (v3 - 1 + v4 >= 0));
}

uint64_t sub_1000090FC@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  if (v2 <= 0x80000000) {
    int v3 = a1;
  }
  else {
    int v3 = a1 + 1;
  }
  return (*(uint64_t (**)(void))(a2 + 8 * v3))();
}

_DWORD *sub_10000911C(_DWORD *result)
{
  *(_DWORD *)(v1 + 4) = v3;
  *uint64_t result = v2;
  return result;
}

void sub_100009128()
{
  *(_DWORD *)(v0 + 4) = v1 - v2;
  JUMPOUT(0x100009130);
}

void sub_100009140(_DWORD *a1)
{
  unsigned int v1 = a1[4] - 1836812333 * (a1 ^ 0x4065F266);
  if (*(_DWORD *)(*(void *)a1 + 4) == 231015519) {
    unsigned int v2 = v1 + 1;
  }
  else {
    unsigned int v2 = a1[4] - 1836812333 * (a1 ^ 0x4065F266);
  }
  __asm { BRAA            X13, X14 }
}

void sub_10000921C()
{
  *(_DWORD *)(v1 + 4) = v0;
}

void sub_100009FDC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (704005591 * (a1 ^ 0xF7D78CF0));
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  int v3 = 462031038 - v2;
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  }
  uint64_t v4 = (uint64_t)*(&off_100019530 + v1 + 37);
  if ((v3 + 1916468129) > 0x80000000) {
    ++v1;
  }
  __asm { BRAA            X10, X2 }
}

uint64_t sub_10000A0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v14 = v13 - 7;
  int v15 = a11 + 1709098632;
  if (a11 + 1709098632 < -207369497 != v11 + 1709098632 < -207369497) {
    BOOL v16 = v15 < -207369497;
  }
  else {
    BOOL v16 = v11 + 1709098632 < v15;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (v14 + 8 * v16)))();
}

uint64_t sub_10000A1E4(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  int v21 = v20 + 1;
  BOOL v22 = a3 < a8;
  int v23 = v11 + a2 + *(_DWORD *)(v12 + 4 * v8) + v9 + (*(_DWORD *)(*(void *)(v13 + 8) + 4 * v17) + v9) * a6;
  *(_DWORD *)(v12 + 4 * v8) = (v23 ^ v14) + (v15 & (2 * v23)) + v16;
  if (v22 == v17 + 1 > v19) {
    BOOL v22 = v17 + v18 < a3;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * (v21 + 6 * v22)))();
}

void sub_10000A284()
{
}

uint64_t sub_10000A28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6
                                                                                                 + 8
                                                                                                 * (7 * (v7 != 0x3054D7EAF180A5CELL)
                                                                                                  + v8)))(a1, a2, a3, a4, a5, a6, ((v7 == 0x3054D7EAF180A5CELL) | (4 * (v7 == 0x3054D7EAF180A5CELL)))+ v8- (v7 != 0x3054D7EAF180A5CELL));
}

uint64_t sub_10000A2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v13 = a7 + 5;
  BOOL v14 = a11 + 403333195 < -1513134934;
  if (v14 == v11 + 403333195 < -1513134934) {
    BOOL v14 = v11 + 403333195 < a11 + 403333195;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (v13 + 6 * v14)))();
}

uint64_t sub_10000A388(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  int v17 = v14 - 5;
  int v18 = *(_DWORD *)(v8 + 4 * v15);
  *(_DWORD *)(v8 + 4 * v15) = ((v11 + 243227186 + v18 + v9) ^ a4) + (a5 & (2 * (v11 + 243227186 + v18 + v9))) + a6;
  if ((a8 ^ ((v11 - 0x3054D7EAF180A5CELL + (unint64_t)(v18 + v9)) >> 32))
     + (v12 & ((v11 - 0x3054D7EAF180A5CELL + (unint64_t)(v18 + v9)) >> 31))
     + v13 == v16)
    int v19 = v17 + 1;
  else {
    int v19 = v17;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * v19))();
}

uint64_t sub_10000A408@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  int v4 = *(_DWORD *)(a2 + 4) + 813804453;
  int v5 = (v2 + 813804453 < -1102663676) ^ (v4 < -1102663676);
  BOOL v6 = v2 + 813804453 > v4;
  if (v5) {
    BOOL v6 = v2 + 813804453 < -1102663676;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (v6 + a1)))();
}

void sub_10000A480(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 + 1638185881 * (a1 ^ 0x11FD620);
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  }
  else {
    int v3 = 462031038 - v2;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  if (v4 + 1916468129 < 0) {
    int v5 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  }
  else {
    int v5 = 462031038 - v4;
  }
  uint64_t v8 = *(void *)(a1 + 24);
  unsigned int v9 = v1 - 1748787863 * (&v8 ^ 0x81BAC106) - 6;
  ((void (*)(uint64_t *))*(&off_100019330 + v1 + 8))(&v8);
  BOOL v6 = v3 + 1283520354 < v5 + 1283520354;
  if (v3 + 1283520354 < -632947775 != v5 + 1283520354 < -632947775) {
    BOOL v6 = v5 + 1283520354 < -632947775;
  }
  if (v6) {
    int v7 = v3;
  }
  else {
    int v7 = v5;
  }
  __asm { BRAA            X13, X15 }
}

uint64_t sub_10000A630()
{
  int v8 = v2 + 1564212715;
  int v9 = v3 - 1;
  BOOL v10 = v8 < -352255414;
  uint64_t v11 = 4 * (v5 + v4);
  int v12 = *(_DWORD *)(*(void *)(v7 + 8) + v11) - *(_DWORD *)(*(void *)(v6 + 8) + v11);
  *(_DWORD *)(*(void *)(v0 + 8) + v11) = (v12 ^ 0xBF8FFBF5) + ((2 * v12) & 0x7F1FF7EA) + 1979053516;
  if (v10 == v5 + 514330435 < -352255414) {
    BOOL v10 = v5 + 514330435 < v8;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (v10 + v9)))(3213884405, 2132801514, 1979053516, 0xB3FFFF7FE99EEFEBLL, 0x1D33DDFD6, 0x5D578FCB9EFFFBF8, 514330435);
}

uint64_t sub_10000A758()
{
  BOOL v4 = v3 - 60981110 < -1977449239;
  if (v4 == v2 - 1110863391 < -1977449239) {
    BOOL v4 = v2 - 1110863391 < v3 - 60981110;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * (v4 + v1)))();
}

uint64_t sub_10000A7C0(uint64_t a1, uint64_t a2, int a3)
{
  int v14 = v6 & ~__ROR4__(v10, 18);
  int v15 = a3 - 14;
  int v16 = *(_DWORD *)(*(void *)(v13 + 8) + 4 * (v12 + v11));
  *(_DWORD *)(*(void *)(v3 + 8) + 4 * (v12 + v11)) = ((v6 + 2002850844 + v16 - 897970625) ^ 0x7DDDF3E9)
                                                       + ((2 * (v6 + 2002850844 + v16 - 897970625)) & 0xFBBBE7D2)
                                                       - 1213727272;
  int v17 = v5 + v12 + 1;
  int v18 = (v14 < v7) ^ (v17 < v7);
  BOOL v19 = v17 < v14;
  if (v18) {
    BOOL v19 = v14 < v7;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v4 + 8 * (v15 + v19 * v8)))(3396996671, 2111697897, v15 + !v19 * v9, 4223395794, 3081240024, 0x3B7F8FEBAE9EEFF7, 0x15D3DDFEELL, 0xD5D7FF5FD9FFFBECLL);
}

uint64_t sub_10000A8B4(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v6 = v4 - 943241842 < v5 + 106640439;
  if (v5 + 106640439 < -1809827690 != v4 - 943241842 < -1809827690) {
    BOOL v6 = v5 + 106640439 < -1809827690;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (a3 + 4 * v6)))();
}

uint64_t sub_10000A91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  __asm { SUBG            X29, X12, #0x2E0, #5 }
  int v22 = a7 - 1;
  int v23 = *(_DWORD *)(*(void *)(v16 + 8) + 4 * (v15 + v14));
  *(_DWORD *)(*(void *)(v7 + 8) + 4 * (v15 + v14)) = ((_X12 + v9 - v23 + 2002850845) ^ 0xF7CFFBF5)
                                                       + ((2 * (_X12 + v9 - v23 + 2002850845)) & 0xEF9FF7EA)
                                                       + 1035335116;
  int v24 = v11 + v15 + 1;
  int v25 = (v13 < v12) ^ (v24 < v12);
  BOOL v26 = v24 < v13;
  if (v25) {
    BOOL v26 = v13 < v12;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v8 + 8 * (v26 + v22)))(4020238314, 1035335116, 0x757FBFDBF89EFFEFLL, 0x1F13DFFDELL, 0x9BD7CF6F8FFFEBF4);
}

uint64_t sub_10000AA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  if (v8 == v9 - 1) {
    int v10 = a7 + 1;
  }
  else {
    int v10 = a7;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * v10))();
}

uint64_t sub_10000AA3C()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (v2 + 8 * ((v3 + v1) > 0x80000000))))();
}

uint64_t sub_10000AA74()
{
  BOOL v5 = v4 + 729328119 < -137257729;
  if (v4 + 729328119 >= -137257729) {
    BOOL v5 = v4 + 729328119 > 2010225920;
  }
  **(_DWORD **)(v0 + 8) = ((v2 - **(_DWORD **)(v0 + 8) + 1) ^ 0x7FF7FBE1)
                        + ((2 * (v2 - **(_DWORD **)(v0 + 8) + 1)) & 0xFFEFF7C2)
                        - 1248987680;
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * (v3 + 6 * !v5 - 2)))(619545431);
}

uint64_t sub_10000AB44()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (v2
                               + (((v3 + v1) > 0x80000000) | (2 * ((v3 + v1) > 0x80000000)))
                               - 4)))();
}

void sub_10000ACB8(_DWORD *a1)
{
  unsigned int v1 = 520147679 * (a1 ^ 0xD061A127);
  unsigned int v2 = a1[4] + v1;
  if ((*a1 ^ v1) + 975590224 <= 0x80000000) {
    unsigned int v3 = a1[4] + v1;
  }
  else {
    unsigned int v3 = v2 + 1;
  }
  __asm { BRAA            X13, X14 }
}

uint64_t sub_10000AD5C@<X0>(int a1@<W8>)
{
  int v4 = (v3 + 1951180448) & 0x6D359F58;
  unsigned int v5 = 2145031067 * (&v7 ^ 0x1E282685);
  int v8 = a1 ^ v5;
  int v9 = v2 - v5 - v4 - 255778052;
  uint64_t v7 = v1;
  return ((uint64_t (*)(uint64_t *))*(&off_100019330 + a1 + 22))(&v7);
}

uint64_t sub_10000AE7C()
{
  return 128;
}

void sub_10000AE84(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 520147679 * (a1 ^ 0xD061A127);
  uint64_t v2 = *(void *)(a1 + 8);
  v4[0] = (523995289 * (v4 ^ 0x98567068)) ^ (v1 - 2);
  uint64_t v5 = v2;
  ((void (*)(_DWORD *))*(&off_100019330 + v1 + 36))(v4);
  if (v4[1] == 851002806) {
    int v3 = v1 + 1;
  }
  else {
    int v3 = v1;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_10000AF8C@<X0>(uint64_t a1@<X8>)
{
  signed int v6 = (((v5 - v4) >> 4) & 0xE6DBAFA ^ 0x2058A08)
     + (((v5 - v4) >> 5) ^ 0xEE743879)
     - 1931757750;
  if (v2 + 1850577000 < -65891129 != v6 < -65891129) {
    BOOL v7 = v2 + 1850577000 < -65891129;
  }
  else {
    BOOL v7 = v2 + 1850577000 > v6;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * (v3 + 6 * v1 + v7)))();
}

uint64_t sub_10000B014@<X0>(uint64_t a1@<X8>)
{
  int v4 = -6 * (v3 ^ 1) - 2 * v3 + v2;
  if ((v1 & 0x1F) != 0xD) {
    int v5 = v4;
  }
  else {
    int v5 = v4 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v5))();
}

uint64_t sub_10000B070@<X0>(uint64_t a1@<X8>)
{
  int v6 = v1 + 1005582247;
  int v7 = *(_DWORD *)(v4 + 4);
  if (v7 + v5 < 0) {
    int v6 = 442348193 - v1;
  }
  *(_DWORD *)(v4 + 4) = v7 + v6 - 723965220;
  int v8 = v2 + 923521478;
  BOOL v9 = v8 < -992946651;
  **(_DWORD **)(v4 + 8) = *(_DWORD *)(*(void *)(v4 + 8) + 4 * (v1 + 281617027));
  if (v8 >= -992946651) {
    BOOL v9 = v8 > 1154536998;
  }
  return (*(uint64_t (**)(BOOL))(a1 + 8 * (!v9 + v3)))(v8 > 1154536998);
}

void sub_10000B134()
{
}

void sub_10000B13C()
{
  *(_DWORD *)(v0 + 4) = 231015519;
}

void sub_10000B33C(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000) {
    int v2 = 10;
  }
  else {
    int v2 = 9;
  }
  __asm { BRAA            X10, X11 }
}

uint64_t sub_10000B3B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8
                                                                                         + 8
                                                                                         * (11 * v7
                                                                                          + 1602850950 * a7
                                                                                          + 1
                                                                                          + 15
                                                                                          * (((((2 * (int)a2) & 0xE27FB6 | 0x2000000)
                                                                                             + (a2 & 0xFFFFFF ^ 0x4C713FDB)
                                                                                             + 42909733) & 0x3000000) == 0x1000000))))(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10000B494()
{
  return v0();
}

uint64_t sub_10000B4CC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, unsigned int a7)
{
  int v10 = v8 + a1 * v7;
  uint64_t v11 = ((uint64_t (*)(void))*(&off_100019330 + v10 - 8))(a7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9
                                                                                         + 8 * (v10 + 11 * (v11 != 0))))(v11, v12, v13, v14, v15, v16);
}

uint64_t sub_10000B52C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8 * (int)(v2 + a1 * v3 + (v1 & 0xFFFFFFFD | (2 * (v1 & 1))) + 15 * (v5 == 0x1000000))))();
}

uint64_t sub_10000B584@<X0>(int a1@<W8>, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, unsigned int a11)
{
  int v14 = v12 + a1 - 4;
  a11 = (v14 + 1922602506) ^ (704005591 * (&a10 ^ 0xF7D78CF0));
  ((void (*)(char *))*(&off_100019330 + v11 + v14 + 51))(&a10);
  if (a3 > 1291933660)
  {
    if (a3 <= 1593915355)
    {
      if (a3 == 1291933661)
      {
        uint64_t v22 = 2;
        goto LABEL_19;
      }
      if (a3 == 1291933662)
      {
        uint64_t v22 = 3;
        goto LABEL_18;
      }
    }
    else
    {
      switch(a3)
      {
        case 1593915356:
          uint64_t v22 = 4;
          goto LABEL_19;
        case 1593915357:
          uint64_t v22 = 6;
          goto LABEL_19;
        case 1593915358:
          uint64_t v22 = 8;
          goto LABEL_18;
      }
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 152))(0, v15, v16, v17, v18, v19, v20, v21, a2);
  }
  if (a3 <= 1291925469)
  {
    if (a3 == 1291925468)
    {
      uint64_t v22 = 5;
      goto LABEL_19;
    }
    if (a3 == 1291925469)
    {
      uint64_t v22 = 7;
      goto LABEL_18;
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 152))(0, v15, v16, v17, v18, v19, v20, v21, a2);
  }
  if (a3 == 1291925470)
  {
    uint64_t v22 = 9;
    goto LABEL_19;
  }
  uint64_t v22 = 0;
  if (a3 != 1291929564)
  {
    if (a3 == 1291929565)
    {
      uint64_t v22 = 1;
LABEL_18:
      int v11 = -1602850950;
      goto LABEL_19;
    }
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 152))(0, v15, v16, v17, v18, v19, v20, v21, a2);
  }
LABEL_19:
  uint64_t v23 = ((uint64_t (*)(void))*(&off_100019330 + v11 + 1602850951))((*(_DWORD *)((char *)*(&off_100019530 + v11 + 1602851011) + 24 * v22 + 5)
                                                                                            - 1302691225));
  if (v23) {
    int v31 = v11 + 1602850959;
  }
  else {
    int v31 = v11 + 1602850960;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8 * (v31 - 4)))(v23, v24, v25, v26, v27, v28, v29, v30, a2);
}

uint64_t sub_10000B970@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + (v3 + v4)) = *(unsigned char *)(v1 + (v3 + v4));
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 - 1 != v6) | (4 * (v3 - 1 != v6))) + v2)))();
}

uint64_t sub_10000BA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14, uint64_t a15, int a16, int a17)
{
  return (*(uint64_t (**)(void))(v19 + 8 * (v17 + (a15 == 0 || a17 - 1302691229 + v18 > a14))))();
}

uint64_t sub_10000BB04@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + (v3 + v5)) = *(unsigned char *)(v1 + (v3 + v5));
  return (*(uint64_t (**)(void))(v6 + 8 * (v2 + (v3 - 1 != v7) * v4)))();
}

uint64_t sub_10000BB3C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v2 == v1) & (v4 != 1275148251)) + v0)))();
}

uint64_t sub_10000BBC8()
{
  return sub_10000B494();
}

uint64_t sub_10000BC38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = ((uint64_t (*)(uint64_t, uint64_t, char *))*(&off_100019330 + v9 - 5))(a9, 3, (char *)*(&off_100019530 + v9 + 18) - 7);
  return (*(uint64_t (**)(void))(v10 + 8 * (7 * (v11 != 0) + v9)))();
}

uint64_t sub_10000BCA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14
                                                                                                  + 8 * (a8 + (a14 > 0x81583BD7 || a14 + 2124923944 > 0x7EA7C428))))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10000BD54@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (*(char *)(a7 + (a1 - 1)) < 0) {
    int v9 = v8;
  }
  else {
    int v9 = v8 + 1;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * v9))();
}

uint64_t sub_10000BD80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_10000BE24(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_10000BDA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int w8_0@<W8>, uint64_t a9)
{
  if (w8_0 == 130 || w8_0 == 129) {
    return sub_10000BE24(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else {
    return sub_10000BF50();
  }
}

uint64_t sub_10000BE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (((uint64_t (*)(uint64_t, uint64_t, uint64_t))*(&off_100019330 + v11 - 13))(a9, a2, v9)) {
    int v12 = v11;
  }
  else {
    int v12 = v11 + 1;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * v12))();
}

uint64_t sub_10000BE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14, uint64_t a15, uint64_t a16, unsigned int a17)
{
  ((void (*)(uint64_t, uint64_t))*(&off_100019330 + v21 - 3))(v17, a1);
  uint64_t v23 = ((uint64_t (*)(uint64_t))*(&off_100019330 + v21 - 2))(a1);
  unsigned int v24 = v18 + v20 + 1417158016;
  int v25 = (a14 > 0x81583BD7) ^ (v24 < 0x7EA7C428);
  BOOL v26 = v24 < a17;
  if (v25) {
    BOOL v26 = a14 > 0x81583BD7;
  }
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * (v21 + v26)))(v23);
}

uint64_t sub_10000BF50()
{
  ((void (*)(uint64_t))*(&off_100019330 + v1 - 1602850954))(v0);
  ((void (*)())*(&off_100019330 + v1 - 1602850959))();
  return 0;
}

void sub_10000BFF4(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  }
  else {
    int v3 = 462031038 - v2;
  }
  int v4 = *(_DWORD *)(*(void *)a1 + 4);
  if (v4 + 1916468129 < 0) {
    int v5 = *(_DWORD *)(*(void *)a1 + 4);
  }
  else {
    int v5 = 462031038 - v4;
  }
  int v1 = *(_DWORD *)(a1 + 8) + 191237807 * (a1 ^ 0xDBC9B6B1);
  __asm { BRAA            X14, X16 }
}

void sub_10000C0D8()
{
  *(_DWORD *)(v1 + 4) = v0;
}

uint64_t sub_10000C4C4@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  if (*(_DWORD *)(*(void *)(a2 + 8) + 4 * (v5 + 1 + v4)) != v3) {
    ++a1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * a1))();
}

uint64_t sub_10000C500(uint64_t a1, int a2)
{
  if ((v3 + v4) <= 0x80000000) {
    int v5 = a2;
  }
  else {
    int v5 = a2 + 1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * v5))();
}

uint64_t sub_10000C53C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17 = 4 * (v15 + v14);
  int v18 = (**(_DWORD **)(v16 + 8) - 897970625) * (a4 - 897970625) + *(_DWORD *)(a12 + v17) - 897970625;
  *(_DWORD *)(a12 + v17) = (v18 ^ 0xF7EFFBDB) + ((2 * v18) & 0xEFDFF7B6) + 1033237990;
  BOOL v19 = v13 + 260720805 > 491736325;
  if (v13 + 260720805 < -1655747324) {
    BOOL v19 = 1;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (v19 + a5 - 1)))();
}

void sub_10000C618()
{
}

void sub_10000C628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(a12 + 4 * a1) = 897970625;
  JUMPOUT(0x10000C67CLL);
}

void sub_10000C6D0(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) + 4) + 980327533;
  int v3 = *(_DWORD *)(*(void *)a1 + 4) + 980327533;
  int v4 = (v2 < -936140596) ^ (v3 < -936140596);
  BOOL v5 = v2 > v3;
  if (v4) {
    BOOL v6 = v2 < -936140596;
  }
  else {
    BOOL v6 = v5;
  }
  int v1 = *(_DWORD *)(a1 + 16) + 1638185881 * (a1 ^ 0x11FD620);
  __asm { BRAA            X15, X16 }
}

uint64_t sub_10000C768(uint64_t a1, int a2)
{
  int v6 = (v5 ^ 1) + v3;
  int v7 = v4 + 222474386;
  BOOL v8 = v7 < -1693993743;
  BOOL v9 = a2 + 222474386 < v7;
  if (a2 + 222474386 < -1693993743 != v8) {
    BOOL v9 = v8;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(v6 + (!v9 & 0xFFFFFFFB | (4 * !v9)))))();
}

uint64_t sub_10000C7D0(uint64_t a1, int a2)
{
  if (a2 + 1916468129 < 0) {
    int v6 = a2;
  }
  else {
    int v6 = 462031038 - a2;
  }
  return (*(uint64_t (**)(uint64_t, void, void))(v2
                                                            + 8
                                                            * (int)(2 * v5
                                                                  - v4
                                                                  + v3
                                                                  - 2
                                                                  + ((v6 + 1916468128) >> 31))))(a1, (v6 - 1), (2 * v5 - v4 + v3 - 2 + (~(v6 + 1916468128) >> 31)));
}

uint64_t sub_10000C850(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v9 = 4 * (a4 - 231015520);
  unsigned int v10 = *(_DWORD *)(*(void *)(v5 + 8) + v9) + v8;
  unsigned int v11 = *(_DWORD *)(*(void *)(v4 + 8) + v9) + v8;
  BOOL v12 = v10 < v7;
  BOOL v13 = v10 > v11;
  if (v12 != v11 < v7) {
    BOOL v14 = v12;
  }
  else {
    BOOL v14 = v13;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * (int)((!v14 & 0xFFFFFFFD | (2 * !v14)) + a3)))();
}

uint64_t sub_10000C8BC(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  int v11 = a3 - a7 + 2 * a8;
  unsigned int v12 = a4 + v10;
  unsigned int v13 = a6 + v10;
  BOOL v14 = a6 + v10 < v9;
  int v15 = (v12 < v9) ^ v14;
  BOOL v16 = v12 < v13;
  if (v15) {
    BOOL v16 = v14;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * (v11 + 2 * v16)))();
}

uint64_t sub_10000C904@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  return (*(uint64_t (**)(uint64_t, void, void, uint64_t, void))(v5
                                                                             + 8
                                                                             * (int)(a3
                                                                                   - 2 * (a4 + (a4 ^ 1))
                                                                                   + ((a2 + v6) >> 31))))(a1, (a2 - 1), a3 - 2 * (a4 + (a4 ^ 1u)) + (~((int)a2 + v6) >> 31), a2, (a5 + 1));
}

uint64_t sub_10000C938(uint64_t result)
{
  *(_DWORD *)(result + 20) = -1112255286 - v1;
  return result;
}

uint64_t sub_10000C950(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  **(_DWORD **)(v1 + 8) = 897970626;
  *(_DWORD *)(v1 + 4) = 231015520;
  return result;
}

uint64_t sub_10000C974()
{
  return 1;
}

uint64_t sub_10000C97C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return off_100018B68[(a2 != 0 && a3 == 8) & (a4 == 100)]();
}

uint64_t sub_10000C9B4(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 0;
  **(_DWORD **)(a1 + 24) = *a2 - ((2 * *a2) & 0x8224C6E8) + 1091724148;
  return result;
}

uint64_t sub_10000C9E8()
{
  return 4294967246;
}

uint64_t sub_10000C9F0(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  }
  else {
    int v3 = 462031038 - v2;
  }
  int v1 = (*(_DWORD *)a1 ^ (523995289 * (a1 ^ 0x98567068))) - 1;
  return (*(uint64_t (**)(void))((char *)*(&off_100019530 + v1 + 34)
                              + 16 * ((v3 + 1916468129) > 0x80000000)
                              + 8 * v1
                              - 10))();
}

uint64_t sub_10000CA94()
{
  if (*(_DWORD *)(*(void *)(v0 + 8) + 4 * v1) == 897970625) {
    ++v2;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v2))();
}

uint64_t sub_10000CAC4()
{
  return (*(uint64_t (**)(void))(*(void *)(v1 + 8 * (v2 + 34))
                              - 10
                              + 8 * (v2 + 2 * ((v0 - 1) > 0x80000000))))();
}

uint64_t sub_10000CB04(uint64_t result)
{
  *(_DWORD *)(result + 4) = v1;
  return result;
}

void sub_10000CB10(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1));
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4) == 231015519) {
    int v2 = *(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1));
  }
  else {
    int v2 = v1 + 1;
  }
  __asm { BRAA            X14, X15 }
}

uint64_t sub_10000CB8C(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 16) + 4) == v3) {
    int v5 = v1 + 2 * v4 + 1;
  }
  else {
    int v5 = v1 + 2 * v4;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * v5))();
}

uint64_t sub_10000CBBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = v1;
  unsigned int v6 = v2 + 523995289 * (&v4 ^ 0x98567068) - 1;
  return ((uint64_t (*)(uint64_t *))*(&off_100019330 + v2 + 60))(&v4);
}

uint64_t sub_10000CCFC(_DWORD *a1)
{
  unsigned int v1 = 1748787863 * (a1 ^ 0x81BAC106);
  unsigned int v2 = a1[2] - v1;
  int v3 = a1[3] ^ v1;
  if (v3 + 1219647055 >= 0) {
    int v3 = 1855673186 - v3;
  }
  int v4 = *(_DWORD *)(*(void *)a1 + 4);
  if (v4 + 1916468129 >= 0) {
    int v4 = 462031038 - v4;
  }
  return (*(uint64_t (**)(void))((char *)*(&off_100019530 + (int)(v2 + 41))
                              + 8
                              * (int)((v4 + 1498491483 < -417976646
                                    || (int)(((v3 - 927836593) >> 5) + 1729507002) < v4 + 1498491483)
                                    + v2)
                              - 7))();
}

uint64_t sub_10000CDD0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(result + 16) = (((*(_DWORD *)(*(void *)(a2 + 8) + 4 * v3) - 897970625) >> (v2 + 15)) & 1 | 0x43DF7EBC)
                           - 1132724272;
  return result;
}

uint64_t sub_10000CE0C(uint64_t result)
{
  *(_DWORD *)(result + 16) = 5996172;
  return result;
}

void sub_10000CE20(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0);
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 4) - 231015519) * (*(_DWORD *)(*(void *)(a1 + 16) + 4) - 231015519)) {
    int v2 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0);
  }
  else {
    int v2 = v1 + 1;
  }
  __asm { BRAA            X17, X1 }
}

void sub_10000CF10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a4 + 4) = v4;
}

uint64_t sub_10000DD54(uint64_t result)
{
  **(_DWORD **)(result + 24) = 1091724148;
  return result;
}

int *sub_10000DD68(int *result)
{
  if (((result[2] ^ (520147679 * (result ^ 0x5061A127))) & 0x40000000) != 0) {
    int v1 = 335071851;
  }
  else {
    int v1 = 335071852;
  }
  *uint64_t result = v1;
  return result;
}

void sub_10000DDA0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) + 56516261 * (a1 ^ 0x15EBF17D);
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(_DWORD *)(v2 + 4);
  if (v3 + 1916468129 < 0) {
    int v4 = *(_DWORD *)(v2 + 4);
  }
  else {
    int v4 = 462031038 - v3;
  }
  int v5 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  if (v5 + 1916468129 < 0) {
    int v6 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  }
  else {
    int v6 = 462031038 - v5;
  }
  int v11 = v1 - 1748787863 * (&v10 ^ 0x81BAC106);
  uint64_t v10 = v2;
  ((void (*)(uint64_t *))*(&off_100019330 + v1 + 14))(&v10);
  BOOL v7 = v4 + 1832243934 < v6 + 1832243934;
  if (v4 + 1832243934 < -84224195 != v6 + 1832243934 < -84224195) {
    BOOL v7 = v6 + 1832243934 < -84224195;
  }
  if (v7) {
    int v8 = v4;
  }
  else {
    int v8 = v6;
  }
  if ((v8 + 1916468129) <= 0x80000000) {
    int v9 = v1;
  }
  else {
    int v9 = v1 + 1;
  }
  __asm { BRAA            X13, X15 }
}

uint64_t sub_10000DF58()
{
  int v11 = v3 + 494334512;
  int v12 = v4 - 6;
  BOOL v13 = v11 < -1422133617;
  uint64_t v14 = 4 * (v9 + v5);
  int v15 = v6 - 1954314156 + *(_DWORD *)(*(void *)(v10 + 8) + v14) + v7 + *(_DWORD *)(*(void *)(v8 + 8) + v14) + v7;
  *(_DWORD *)(*(void *)(v0 + 8) + v14) = (v15 ^ 0x3587F7E5) + ((2 * v15) & 0x6B0FEFCA) - 132644;
  if (v13 == v9 - 889120180 < -1422133617) {
    BOOL v13 = v9 - 889120180 < v11;
  }
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (v12 + v13 * v2)))(4294834652, 0xDFFFEF2E9FC3BE5ELL, 0x13F877CBCLL, 0x23D29DDDEBBFC9F6, 3405847116);
}

void sub_10000E064()
{
  atomic_load_explicit((atomic_uint *volatile)(v0 - 116), memory_order_acquire);
  JUMPOUT(0x10000DFD0);
}

uint64_t sub_10000E06C()
{
  if (v3 + 1611036276 < -305431853 != v2 + 227581583 < -305431853) {
    BOOL v4 = v3 + 1611036276 < -305431853;
  }
  else {
    BOOL v4 = v2 + 227581583 < v3 + 1611036276;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * (v1 + 8 * v4)))();
}

uint64_t sub_10000E0CC()
{
  BOOL v12 = v6 < v4;
  int v13 = v5 + v10 + 1;
  int v14 = v12 ^ (v13 < v4);
  BOOL v15 = v13 < v6;
  if (!v14) {
    BOOL v12 = v15;
  }
  uint64_t v16 = 4 * (v10 + v7);
  int v17 = v2 + v8 + *(_DWORD *)(*(void *)(v11 + 8) + v16) + v9;
  *(_DWORD *)(*(void *)(v0 + 8) + v16) = (v17 ^ 0xFD9FF9C3) + ((2 * v17) & 0xFB3FF386) + 937818110;
  return (*(uint64_t (**)(void))(v1 + 8 * (v3 + v12 + 2)))();
}

uint64_t sub_10000E1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8 = v6 - 1250431509 < v7 + 133023184;
  if (v7 + 133023184 < -1783444945 != v6 - 1250431509 < -1783444945) {
    BOOL v8 = v7 + 133023184 < -1783444945;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(v4
                                                                              + 8
                                                                              * (int)((v8 & 0xFFFFFFFD | (2 * v8)) + v5)))((v8 + v5), a2, a3, a4, v8 + v5 + 4 * !v8);
}

uint64_t sub_10000E208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v16 = a5 - 1;
  int v17 = *(_DWORD *)(*(void *)(v14 + 8) + 4 * (v15 + v11));
  *(_DWORD *)(*(void *)(v5 + 8) + 4 * (v15 + v11)) = ((v7 + v12 + v17 + v13) ^ 0x7FD5FDC1)
                                                       + ((2 * (v7 + v12 + v17 + v13)) & 0xFFABFB82)
                                                       - 1246759936;
  int v18 = v8 + v15 + 1;
  int v19 = (v10 < v9) ^ (v18 < v9);
  BOOL v20 = v18 < v10;
  if (v19) {
    BOOL v20 = v10 < v9;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v6 + 8 * (v20 + v16)))(0x17F78FEF9F87C957, 0x13F0F92AELL, 0xEBDAFD1CEBFBBEFDLL);
}

uint64_t sub_10000E2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (v6 == 0x3D28D0C8B838854) {
    int v7 = a5 + 1;
  }
  else {
    int v7 = a5;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * v7))();
}

void sub_10000E304(int a1@<W8>)
{
  *(_DWORD *)(v1 + 4) = (((v3 + v2) * (a1 - 741032970)) ^ 0x2DC51DFF)
                      + ((2 * (v3 + v2) * (a1 - 741032970)) & 0x5B8A3BFE)
                      - 536877472;
}

void sub_10000E3C8(uint64_t a1)
{
  __asm { BRAA            X11, X13 }
}

uint64_t sub_10000E434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if (v8 == 1281732227) {
    signed int v9 = (v7 & 0xFFFFFFF7 | (8 * (v7 & 1))) + v6;
  }
  else {
    signed int v9 = (v7 & 0xFFFFFFF7 | (8 * (v7 & 1))) + v6 + 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8 * v9))(a1, a2, a3, a4, a5, 897970625, 231015519);
}

uint64_t sub_10000E494@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (v1 - 2)))();
}

uint64_t sub_10000E58C@<X0>(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(void))(a3 + 8 * (a1 + ((a2 == v3) | (2 * (a2 == v3))))))();
}

uint64_t sub_10000E5B8@<X0>(uint64_t a1@<X8>)
{
  if (v2) {
    int v3 = v1 + 1;
  }
  else {
    int v3 = v1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v3))();
}

void sub_10000E5D4(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v6 = a2 + v4;
  int v7 = a2 + 1;
  *(_DWORD *)(*(void *)(v3 + 8) + 4 * v6) = a1;
  int v8 = v5 - 6;
  *(_DWORD *)(v3 + 4) = v7;
  int v9 = 462031038 - v7;
  if (v7 + 1916468129 < 0) {
    int v9 = v7;
  }
  __asm { BRAA            X2, X3 }
}

uint64_t sub_10000E64C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v8 = *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v3 + v5 - 1));
  return (*(uint64_t (**)(uint64_t, void))(a2 + 8 * (v7 + 2 * (v8 == v4))))(a1, v7 + (v8 != v4) * v6);
}

uint64_t sub_10000E67C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (int)(a2 + ((v3 - 1 + v4) >> 31))))(a1, a2 + 10 * (v3 - 1 + v4 >= 0));
}

uint64_t sub_10000E6A8@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  if (v2 <= 0x80000000) {
    int v3 = a1;
  }
  else {
    int v3 = a1 + 1;
  }
  return (*(uint64_t (**)(void))(a2 + 8 * v3))();
}

_DWORD *sub_10000E6C8(_DWORD *result)
{
  *(_DWORD *)(v1 + 4) = v3;
  *uint64_t result = v2;
  return result;
}

void sub_10000E6D0()
{
  *(_DWORD *)(v0 + 4) = v1 - v2;
  JUMPOUT(0x10000E6D8);
}

void sub_10000E6E8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a4;
  int v12 = a2;
  uint64_t v4 = (((unint64_t)&v9[0xFE0588DFA92FB4DFLL] + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  uint64_t v14 = 16
      * (void)((char *)&v9[0xFE0588DFA92FB4DFLL]
               - 7 * ((v4 + (((unint64_t)&v9[0xFE0588DFA92FB4DFLL] - v4 + 6) >> 1)) >> 2)
               + 6);
  int v5 = **(_DWORD **)(a1 + 24);
  if ((v5 & 0x3E000000 | 0x1000000) != 0x13000000) {
    JUMPOUT(0x100012D88);
  }
  v9[40] = 0x250197BA3C001668;
  LODWORD(v10) = 1302691225;
  v15[1] = (704005591 * (v15 ^ 0xF7D78CF0)) ^ 0xD2222699;
  nullsub_1(v15);
  int v6 = v5 ^ 0x41126374;
  int v13 = v5;
  if ((v5 ^ 0x41126374) > 16785409)
  {
    if (v6 <= 318767104)
    {
      if (v6 == 16785410)
      {
        uint64_t v7 = 2;
      }
      else
      {
        if (v6 != 16785411) {
          goto LABEL_27;
        }
        uint64_t v7 = 3;
      }
    }
    else
    {
      switch(v6)
      {
        case 318767105:
          uint64_t v7 = 4;
          break;
        case 318767106:
          uint64_t v7 = 6;
          break;
        case 318767107:
          uint64_t v7 = 8;
          break;
        default:
          goto LABEL_27;
      }
    }
  }
  else if (v6 <= 16777218)
  {
    if (v6 == 16777217)
    {
      uint64_t v7 = 5;
    }
    else
    {
      if (v6 != 16777218) {
        goto LABEL_27;
      }
      uint64_t v7 = 7;
    }
  }
  else
  {
    switch(v6)
    {
      case 16777219:
        uint64_t v7 = 9;
        break;
      case 16781313:
        uint64_t v7 = 0;
        break;
      case 16781314:
        uint64_t v7 = 1;
        break;
      default:
LABEL_27:
        JUMPOUT(0x100012670);
    }
  }
  uint64_t v8 = (uint64_t)*(&off_100018CB0
                + 35 * (malloc((*((_DWORD *)&unk_1000190F8 + 6 * v7 + 4) - 1302691225)) != 0)
                + 23);
  __asm { BRAA            X8, X11 }
}

uint64_t sub_100012698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55)
{
  int v60 = v55 + v56 * (v59 - 1);
  if (*v57 < (unint64_t)(((2 * (8 * a55 - 1848124152)) & 0xF5DD3FF0)
                               + ((8 * a55 - 1848124152) ^ 0x7AEE9FFE)
                               - 2062458878))
    ++v60;
  return (*(uint64_t (**)(void))(v58 + 8 * v60))();
}

uint64_t sub_100012C00(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5 + 8 * (a3 + 60 * (v3 != v4))))();
}

uint64_t sub_100012DCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v1 + 28 * (a1 != v2))))();
}

uint64_t sub_100012E04(uint64_t a1, int a2)
{
  *(unsigned char *)(v7 + a1) = (31 * (a1 & 0xF)) ^ *(unsigned char *)(v4 + (a1 & 0xF)) ^ *(unsigned char *)((a1 & 0xF) + v3 + 4) ^ *(unsigned char *)((a1 & 0xF) + v5 + 1) ^ ((*(unsigned char *)(v2 + a1) ^ 0x82) + ((2 * *(unsigned char *)(v2 + a1)) & 4) + 14);
  return (*(uint64_t (**)(void))(v8 + 8 * (a2 - 67 + 67 * (a1 + 1 != v6))))();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFRelease(CFTypeRef cf)
{
}

void NSLog(NSString *format, ...)
{
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return _SecKeyRawSign(key, padding, dataToSign, dataToSignLen, sig, sigLen);
}

void dispatch_main(void)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}