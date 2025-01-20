uint64_t sub_1D10(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t Init(uint64_t a1)
{
  qword_8000 = *(void *)(a1 + 48);
  qword_8008 = *(void *)(a1 + 16);
  CFTypeRef v2 = CFRetain((CFTypeRef)qword_8008);
  nullsub_1(v2);
  if (!*(unsigned char *)(a1 + 2)) {
    operator new();
  }
  return 1;
}

uint64_t Dispose(uint64_t a1)
{
  if (a1) {
    a1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
  }
  nullsub_1(a1);
  if (byte_8010 == 1) {
    sub_31B8();
  }
  return 0;
}

uint64_t Process(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

uint64_t Free()
{
  return 0;
}

uint64_t GetAttribute(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

uint64_t InteractiveUI(_DWORD *a1, int a2, void *a3, _DWORD *a4)
{
  a1[48] = 0;
  if (byte_8010 != 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0;
  switch(*a1)
  {
    case 2:
      sub_31F4((uint64_t)a1, a2, a3, a4);
      goto LABEL_9;
    case 4:
      sub_32A0((uint64_t)a1, a2, a3, a4);
      goto LABEL_9;
    case 5:
      sub_3658((uint64_t)a1, a2, a3, a4);
      goto LABEL_9;
    case 6:
      sub_393C((uint64_t)a1, a2, a3, a4);
      goto LABEL_9;
    case 7:
      sub_39C8((uint64_t)a1, a2, a3, a4);
LABEL_9:
      uint64_t v4 = 0;
      break;
    default:
      return v4;
  }
  return v4;
}

double sub_1F08(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)a1 = off_41A0;
  *(void *)(a1 + 8) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 92) = 0u;
  return result;
}

uint64_t sub_1F44(uint64_t a1)
{
  *(void *)a1 = off_41A0;
  CFTypeRef v2 = *(_CCCryptor **)(a1 + 24);
  if (v2) {
    CCCryptorRelease(v2);
  }
  v3 = *(_CCCryptor **)(a1 + 32);
  if (v3) {
    CCCryptorRelease(v3);
  }
  if (*(void *)(a1 + 40)) {
    SecDHDestroy();
  }
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    bzero(v4, *(unsigned int *)(a1 + 16));
    free(*(void **)(a1 + 8));
  }
  return a1;
}

void sub_1FC4(uint64_t a1)
{
  sub_1F44(a1);

  operator delete();
}

uint64_t sub_1FFC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _SecDHCreateFromAlgorithmId(a2, a3, a1 + 40);
}

void *sub_2010(uint64_t a1, void *__dst, _DWORD *a3)
{
  *a3 = *(_DWORD *)(a1 + 56);
  return memcpy(__dst, *(const void **)(a1 + 48), *(unsigned int *)(a1 + 56));
}

void *sub_202C(uint64_t a1, const void *a2, unsigned int *a3)
{
  size_t v5 = *a3;
  *(_DWORD *)(a1 + 72) = v5;
  v6 = malloc_type_malloc(v5, 0xF8108D08uLL);
  *(void *)(a1 + 64) = v6;
  size_t v7 = *(unsigned int *)(a1 + 72);

  return memcpy(v6, a2, v7);
}

uint64_t sub_2080(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unsigned int v3 = SecDHGetMaxKeyLength();
    *(_DWORD *)(a1 + 56) = v3;
    unsigned int v4 = v3;
    *(void *)(a1 + 48) = malloc_type_malloc(v3, 0x7F4858B6uLL);
    uint64_t result = SecDHGenerateKeypair();
    *(_DWORD *)(a1 + 56) = v4;
  }
  return result;
}

uint64_t sub_20E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unsigned int v3 = SecDHGetMaxKeyLength();
    *(_DWORD *)(a1 + 16) = v3;
    *(void *)(a1 + 8) = malloc_type_malloc(v3, 0x68D76347uLL);
    uint64_t result = SecDHComputeKey();
    *(_DWORD *)(a1 + 16) = v3;
  }
  return result;
}

uint64_t sub_2158(uint64_t a1)
{
  CCCryptorCreate(1u, 4u, 0, *(const void **)(a1 + 8), *(unsigned int *)(a1 + 16), 0, (CCCryptorRef *)(a1 + 24));
  CFTypeRef v2 = *(const void **)(a1 + 8);
  size_t v3 = *(unsigned int *)(a1 + 16);

  return CCCryptorCreate(0, 4u, 0, v2, v3, 0, (CCCryptorRef *)(a1 + 32));
}

_CCCryptor *sub_21C4(uint64_t a1, void *dataOut, _DWORD *a3)
{
  size_t dataOutMoved = 0;
  uint64_t result = *(_CCCryptor **)(a1 + 32);
  if (result)
  {
    uint64_t result = (_CCCryptor *)CCCryptorUpdate(result, dataOut, *a3, dataOut, *a3, &dataOutMoved);
    int v5 = dataOutMoved;
  }
  else
  {
    int v5 = 0;
  }
  *a3 = v5;
  return result;
}

_CCCryptor *sub_221C(uint64_t a1, void *dataOut, _DWORD *a3)
{
  size_t dataOutMoved = 0;
  uint64_t result = *(_CCCryptor **)(a1 + 24);
  if (result)
  {
    uint64_t result = (_CCCryptor *)CCCryptorUpdate(result, dataOut, *a3, dataOut, *a3, &dataOutMoved);
    int v5 = dataOutMoved;
  }
  else
  {
    int v5 = 0;
  }
  *a3 = v5;
  return result;
}

uint64_t sub_2274(uint64_t result, void *a2, _WORD *a3)
{
  *a2 = result + 76;
  *a3 = 32 * (*(unsigned char *)(result + 76) != 0);
  return result;
}

uint64_t sub_2294(uint64_t result, void *a2, _WORD *a3)
{
  *a2 = result + 108;
  *a3 = 32 * (*(unsigned char *)(result + 108) != 0);
  return result;
}

uint64_t sub_22B4(uint64_t a1, const char *a2, const char *a3, int a4)
{
  v8 = (CC_MD5_CTX *)malloc_type_calloc(1uLL, 0xA0uLL, 0x1000040F887743AuLL);
  if (v8)
  {
    v9 = v8;
    CC_MD5_Init(v8);
    CC_MD5_Final((unsigned __int8 *)&v9[1].data[2], v9);
    CC_MD5_Init(v9);
    HIBYTE(v9[1].data[5]) |= 1u;
    *(void *)&v9[1].C = 0;
    *(void *)&v9[1].A = 0;
    *(void *)&v9[1].data[7] = 0;
    LOBYTE(v9[1].data[9]) = 0;
    CC_MD5_Update(v9, *(const void **)(a1 + 8), *(_DWORD *)(a1 + 16));
    LOBYTE(v9[1].data[9]) = 1;
    CC_LONG v10 = strlen(a3);
    CC_MD5_Update(v9, a3, v10);
    LOBYTE(v9[1].data[9]) = 1;
    CC_LONG v11 = strlen(a2);
    CC_MD5_Update(v9, a2, v11);
    LOBYTE(v9[1].data[9]) = 1;
    if (a4) {
      v12 = (char *)(a1 + 76);
    }
    else {
      v12 = (char *)(a1 + 108);
    }
    if (a4) {
      v13 = (char *)(a1 + 108);
    }
    else {
      v13 = (char *)(a1 + 76);
    }
    sub_23CC(v9, v12);
    sub_23CC(v9, v13);
    free(v9);
  }
  return 0;
}

void *sub_23CC(CC_MD5_CTX *c, char *a2)
{
  if (LOBYTE(c[1].data[9]))
  {
    CC_MD5_Final((unsigned __int8 *)&c[1], c);
    CC_MD5_Init(c);
    uint64_t v4 = 0;
    LOBYTE(c[1].data[9]) = 0;
    *(void *)&c[1].data[7] = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&c[1].data[7];
    if (v4 > 31)
    {
      int64_t v6 = 32;
      goto LABEL_10;
    }
  }
  size_t v5 = v4;
  int64_t v6 = 32;
  uint64_t v4 = 16;
  do
  {
    memcpy(a2, (char *)&c[1].data[2] - v5, v5);
    a2 += v5;
    CC_MD5_Update(c, &c[1], 0x10u);
    CC_MD5_Final((unsigned __int8 *)&c[1].Nl, c);
    CC_MD5_Init(c);
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    do
    {
      unsigned int v8 = *((unsigned __int8 *)&c[1].D + v7 + 3) + (v8 >> 8) + *((unsigned __int8 *)&c[1].data[5] + v7 + 3);
      *((unsigned char *)&c[1].D + v7-- + 3) = v8;
    }
    while (v7 != -16);
    v6 -= v5;
    size_t v5 = 16;
  }
  while (v6 >= 17);
LABEL_10:
  uint64_t result = memcpy(a2, (char *)&c[1].data[2] - v4, v6);
  *(void *)&c[1].data[7] = v4 - v6;
  return result;
}

uint64_t sub_24F0(uint64_t a1, uint64_t a2)
{
  *(void *)sub_2FD0(a1, a2) = off_41C0;
  nullsub_1("CSdClientBuf");
  bzero((void *)(a1 + 188), 0x4BCuLL);
  *(_WORD *)(a1 + 192) = 1;
  size_t v3 = *(const char **)(a1 + 16);
  if (!v3 || (strncpy((char *)(a1 + 216), v3, 0x22uLL), !*(unsigned char *)(a1 + 216))) {
    *(_WORD *)(a1 + 194) = 1;
  }
  sub_30E0(a1, 2);
  sub_3150(a1, 0);
  return a1;
}

void *sub_2590(void *a1)
{
  *a1 = off_41C0;
  nullsub_1("~CSdClientBuf");

  return sub_306C(a1);
}

void sub_25EC(void *a1)
{
  *a1 = off_41C0;
  nullsub_1("~CSdClientBuf");
  sub_306C(a1);

  operator delete();
}

uint64_t sub_265C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  nullsub_1("CSdClientBuf::Process");
  int v6 = sub_3148(a1);
  if (v6 == 1)
  {
    if (*(_WORD *)(a2 + 6) != 5)
    {
      uint64_t result = 0;
      *(_WORD *)(a3 + 2) = 0;
      return result;
    }
    memcpy((void *)(a1 + 188), *(const void **)(a2 + 16), 0x4BCuLL);
    if (*(_DWORD *)(a1 + 380))
    {
      uint64_t result = 0;
      *(_WORD *)(a3 + 2) = 7;
      return result;
    }
    if (sub_3158(a1) == 7)
    {
      if (*(_DWORD *)(a1 + 384))
      {
        __int16 v13 = 4;
      }
      else
      {
        sub_22B4(a1 + 32, (const char *)(a1 + 216), (const char *)(a1 + 250), 0);
        __int16 v13 = 3;
      }
    }
    else
    {
      sub_2970(a1, a3);
      __int16 v13 = 1;
    }
    *(_WORD *)(a3 + 2) = v13;
    sub_30E0(a1, 2);
    return 0;
  }
  if (v6 == 2)
  {
    int v7 = *(unsigned __int16 *)(a2 + 6);
    if (v7 == 3)
    {
      uint64_t v11 = a1;
      int v10 = 3;
      goto LABEL_13;
    }
    if (v7 == 4)
    {
      unsigned int v8 = *(unsigned __int8 **)(a2 + 16);
      nullsub_1("CSdClientBuf::Process rcvcode= %d", *v8);
      int v9 = *v8;
      if ((v9 - 3) < 2)
      {
        if (sub_3168(a1) == v8[1])
        {
          int v10 = *v8;
          uint64_t v11 = a1;
LABEL_13:
          sub_2C0C(v11, v10, a3);
          return 0;
        }
LABEL_26:
        *(_WORD *)(a3 + 2) = 0;
        return 2;
      }
      if (v9 != 1) {
        goto LABEL_26;
      }
      sub_2FCC(&v19, v8, a1 + 32);
      int v14 = sub_3158(a1);
      int v15 = v19;
      if (v14 == v19)
      {
        if (sub_3168(a1) == v8[1])
        {
LABEL_25:
          sub_2970(a1, a3);
          __int16 v17 = 1;
LABEL_35:
          *(_WORD *)(a3 + 2) = v17;
          return 0;
        }
        int v15 = v19;
      }
      sub_3150(a1, v15);
      nullsub_1("MakeMessage packetstate=%d", v19);
      unsigned int v16 = v19;
      if (v19 > 7)
      {
        nullsub_1("Invalid Auth State (%d)", v19);
        return 0;
      }
      if (((1 << v19) & 0xF0) == 0)
      {
        if (((1 << v19) & 0xB) != 0)
        {
          sub_2AE8(a1, &v19);
          sub_3160(a1, v8[1]);
          goto LABEL_25;
        }
        sub_2AE8(a1, &v19);
        strncpy((char *)(a1 + 396), v22, 0x3E9uLL);
        unsigned int v16 = v19;
      }
      *(_DWORD *)(a1 + 188) = v16;
      *(void *)(a3 + 8) = a1 + 188;
      *(_WORD *)(a3 + 4) = 1212;
      *(_DWORD *)(a1 + 380) = 0;
      int v18 = v20;
      *(_DWORD *)(a1 + 208) = v21;
      *(_DWORD *)(a1 + 212) = v18;
      nullsub_1("ACM return value (%d)", *(_DWORD *)(a1 + 384));
      if (*(_DWORD *)(a1 + 188) == 5)
      {
        *(_OWORD *)(a1 + 358) = *(_OWORD *)v22;
        *(void *)(a1 + 372) = *(void *)&v22[14];
      }
      sub_3160(a1, v8[1]);
      sub_30E0(a1, 1);
      __int16 v17 = 2;
      goto LABEL_35;
    }
  }
  return 0;
}

uint64_t sub_2970(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) = &byte_8011;
  byte_8011 = 2;
  byte_8012 = sub_3168(a1);
  int v4 = 0;
  switch(sub_3158(a1))
  {
    case 0u:
      int v5 = sub_2C8C(a1, (uint64_t)&byte_8015);
      goto LABEL_9;
    case 1u:
      nullsub_1("Make3PhaseCPacket");
      goto LABEL_5;
    case 2u:
      nullsub_1("MakeInitPacket");
LABEL_5:
      byte_8015 = 15;
      byte_8016 = sub_3158(a1);
      int v4 = 4;
      break;
    case 4u:
      int v5 = sub_2D0C(a1, (uint64_t)&byte_8015);
      goto LABEL_9;
    case 5u:
      int v5 = sub_2DC8(a1, (uint64_t)&byte_8015);
      goto LABEL_9;
    case 6u:
      int v5 = sub_2E58(a1, (uint64_t)&byte_8015);
LABEL_9:
      int v4 = v5;
      break;
    default:
      break;
  }
  int v6 = byte_8012;
  int v7 = sub_3158(a1);
  uint64_t result = nullsub_1("MakeResponseMessage: id(%d) len(%d) state(%d)", v6, v4, v7);
  *(_WORD *)(a2 + 4) = v4 + 4;
  unk_8013 = bswap32(v4 + 4) >> 16;
  return result;
}

uint64_t sub_2AE8(uint64_t a1, _DWORD *a2)
{
  nullsub_1("ProcessRequest: State(%d)", *a2);
  switch(*a2)
  {
    case 0:
      nullsub_1("ProcessRequest: STATE_KeyEx");
      unsigned int v4 = bswap32(sub_1D10(a2[2]));
      a2[2] = v4;
      uint64_t v5 = a1 + 32;
      sub_1FFC(v5, (uint64_t)(a2 + 3), v4);
      sub_2080(v5);
      break;
    case 1:
      nullsub_1("ProcessRequest: STATE_3Phase");
      unsigned int v7 = a2[2];
      int v6 = a2 + 2;
      unsigned int *v6 = bswap32(sub_1D10(v7));
      uint64_t v8 = a1 + 32;
      sub_202C(v8, v6 + 1, v6);
      sub_20E8(v8);
      break;
    case 2:
      nullsub_1("ProcessRequest: STATE_Init");
      sub_2158(a1 + 32);
      break;
    case 3:
      nullsub_1("ProcessRequest: STATE_Password");
      break;
    default:
      nullsub_1("ProcessRequest: Invalid Auth State");
      break;
  }
  return 0;
}

uint64_t sub_2C0C(uint64_t a1, int a2, uint64_t a3)
{
  nullsub_1("ProcessFinal");
  *(void *)(a3 + 8) = a1 + 188;
  *(_WORD *)(a3 + 4) = 1212;
  sub_3150(a1, 7);
  *(_DWORD *)(a1 + 188) = 7;
  *(_DWORD *)(a1 + 384) = a2 != 3;
  uint64_t result = sub_30E0(a1, 1);
  *(_WORD *)(a3 + 2) = 2;
  return result;
}

uint64_t sub_2C8C(uint64_t a1, uint64_t a2)
{
  nullsub_1("MakeKeyExCPacket");
  *(unsigned char *)a2 = 15;
  *(unsigned char *)(a2 + 1) = sub_3158(a1);
  sub_2010(a1 + 32, (void *)(a2 + 8), (_DWORD *)(a2 + 4));
  unsigned int v4 = *(_DWORD *)(a2 + 4);
  unsigned int v5 = bswap32(v4);
  *(_DWORD *)(a2 + 4) = v5;
  *(_DWORD *)(a2 + 4) = sub_1D10(v5);
  return (unsigned __int16)(v4 + 8);
}

uint64_t sub_2D0C(uint64_t a1, uint64_t a2)
{
  nullsub_1("MakeCheckPacket");
  *(unsigned char *)a2 = 15;
  *(unsigned char *)(a2 + 1) = sub_3158(a1);
  __int16 v4 = *(_WORD *)(a1 + 266);
  *(_OWORD *)(a2 + 4) = *(_OWORD *)(a1 + 250);
  *(_WORD *)(a2 + 20) = v4;
  long long v5 = *(_OWORD *)(a1 + 232);
  long long v6 = *(_OWORD *)(a1 + 216);
  *(unsigned char *)(a2 + 54) = *(unsigned char *)(a1 + 248);
  *(_OWORD *)(a2 + 22) = v6;
  *(_OWORD *)(a2 + 38) = v5;
  nullsub_1("MakeCheckPacket name %s", (const char *)(a2 + 22));
  int v8 = 51;
  sub_21C4(a1 + 32, (void *)(a2 + 4), &v8);
  return (unsigned __int16)(v8 + 4);
}

uint64_t sub_2DC8(uint64_t a1, uint64_t a2)
{
  nullsub_1("MakePinPacket");
  *(unsigned char *)a2 = 15;
  *(unsigned char *)(a2 + 1) = sub_3158(a1);
  __int16 v4 = *(_WORD *)(a1 + 320);
  *(_OWORD *)(a2 + 4) = *(_OWORD *)(a1 + 304);
  *(_WORD *)(a2 + 20) = v4;
  int v6 = 18;
  sub_21C4(a1 + 32, (void *)(a2 + 4), &v6);
  return (unsigned __int16)(v6 + 4);
}

uint64_t sub_2E58(uint64_t a1, uint64_t a2)
{
  nullsub_1("MakeNextPacket");
  *(unsigned char *)a2 = 15;
  *(unsigned char *)(a2 + 1) = sub_3158(a1);
  __int16 v4 = *(_WORD *)(a1 + 284);
  *(_OWORD *)(a2 + 4) = *(_OWORD *)(a1 + 268);
  *(_WORD *)(a2 + 20) = v4;
  int v6 = 18;
  sub_21C4(a1 + 32, (void *)(a2 + 4), &v6);
  return (unsigned __int16)(v6 + 4);
}

uint64_t sub_2EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (const void *)(a2 + 4);
  unsigned int v7 = (bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16) - 4;
  unsigned int v11 = 0;
  nullsub_1("CSdEapSPacket: authState = %d, packetLen = %d", *(unsigned __int8 *)(a2 + 5), v7);
  if (*(unsigned __int8 *)(a2 + 5) - 4 > 2)
  {
    unsigned int v9 = 0;
  }
  else
  {
    int v8 = (void *)(a2 + 8);
    unsigned int v11 = v6 + v7 - v8;
    sub_221C(a3, v8, &v11);
    unsigned int v9 = v11;
    unsigned int v7 = v8 + v11 - v6;
  }
  nullsub_1("SPacket decryptLen = %d adj packetLen = %d", v9, v7);
  memcpy((void *)(a1 + 4), v6, v7);
  *(_DWORD *)a1 = *(unsigned __int8 *)(a1 + 5);
  return a1;
}

uint64_t sub_2FD0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_41F0;
  sub_1F08(a1 + 32);
  *(_DWORD *)(a1 + 180) = 0;
  *(_DWORD *)(a1 + 184) = 0;
  char v4 = *(unsigned char *)(a2 + 3);
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 176) = v4;
  *(unsigned char *)(a1 + 177) = v4;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  long long v5 = *(const char **)(a2 + 24);
  if (v5) {
    *(void *)(a1 + 8) = strdup(v5);
  }
  int v6 = *(const char **)(a2 + 32);
  if (v6) {
    *(void *)(a1 + 16) = strdup(v6);
  }
  unsigned int v7 = *(const char **)(a2 + 40);
  if (v7) {
    *(void *)(a1 + 24) = strdup(v7);
  }
  return a1;
}

void *sub_306C(void *a1)
{
  *a1 = off_41F0;
  CFTypeRef v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  size_t v3 = (void *)a1[2];
  if (v3) {
    free(v3);
  }
  char v4 = (void *)a1[3];
  if (v4) {
    free(v4);
  }
  sub_1FC0((uint64_t)(a1 + 4));
  return a1;
}

uint64_t sub_30E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 180) = a2;
  return result;
}

uint64_t sub_30E8(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  if (v2 == 2)
  {
    sub_2294(a1 + 32, (void *)a2 + 1, a2 + 1);
    return 0;
  }
  if (v2 == 1)
  {
    sub_2274(a1 + 32, (void *)a2 + 1, a2 + 1);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_3148(uint64_t a1)
{
  return *(unsigned int *)(a1 + 180);
}

uint64_t sub_3150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 184) = a2;
  return result;
}

uint64_t sub_3158(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

uint64_t sub_3160(uint64_t result, char a2)
{
  *(unsigned char *)(result + 176) = a2;
  return result;
}

uint64_t sub_3168(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 176);
}

uint64_t sub_3170(__CFBundle *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  qword_87E8 = (uint64_t)CFBundleCopyBundleURL(a1);
  if (!qword_87E8) {
    return 1;
  }
  uint64_t result = 0;
  qword_87F0 = 0;
  return result;
}

void sub_31B8()
{
  if (qword_87F0) {
    CFUserNotificationCancel((CFUserNotificationRef)qword_87F0);
  }
  CFRelease((CFTypeRef)qword_87E8);
  qword_87E8 = 0;
}

uint64_t sub_31F4(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  if (*(unsigned char *)(a1 + 208))
  {
    CFStringRef v8 = CFStringCreateWithCString(0, (const char *)(a1 + 208), 0);
    if (v8)
    {
      CFStringRef v9 = v8;
      sub_332C((const void *)qword_87E8, v8, 0, 120, 0, 0, 0, 0, 0, 0, 0);
      CFRelease(v9);
    }
  }
  *(_DWORD *)(a1 + 192) = 0;
  *a3 = a1;
  *a4 = a2;
  return 0;
}

uint64_t sub_32A0(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  *(unsigned char *)(a1 + 62) = 0;
  *(_DWORD *)(a1 + 192) = sub_332C((const void *)qword_87E8, @"Please enter your passcode.", @"Cancel", 120, &stru_4290, (char *)(a1 + 62), 0x12u, 1, 0, 0, 0);
  *a3 = a1;
  *a4 = a2;
  return 0;
}

uint64_t sub_332C(const void *a1, const void *a2, const void *a3, int a4, const void *a5, char *a6, unsigned int a7, int a8, void *value, char *a10, CFIndex a11)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 1;
  }
  unsigned __int8 v20 = Mutable;
  unsigned int bufferSize = a7;
  int v21 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (v21)
  {
    v22 = v21;
    if (a5) {
      CFArrayAppendValue(v21, a5);
    }
    if (value) {
      CFArrayAppendValue(v22, value);
    }
    CFDictionaryAddValue(v20, kCFUserNotificationTextFieldTitlesKey, v22);
    CFRelease(v22);
  }
  CFMutableArrayRef v23 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (v23)
  {
    v24 = v23;
    if (a6)
    {
      if (*a6)
      {
        CFStringRef v25 = CFStringCreateWithCString(0, a6, 0);
        if (v25)
        {
          CFStringRef v26 = v25;
          CFArrayAppendValue(v24, v25);
          CFRelease(v26);
        }
      }
    }
    if (a10)
    {
      if (*a10)
      {
        CFStringRef v27 = CFStringCreateWithCString(0, a10, 0);
        if (v27)
        {
          CFStringRef v28 = v27;
          CFArrayAppendValue(v24, v27);
          CFRelease(v28);
        }
      }
    }
    CFDictionaryAddValue(v20, kCFUserNotificationTextFieldValuesKey, v24);
    CFRelease(v24);
  }
  CFDictionaryAddValue(v20, kCFUserNotificationLocalizationURLKey, a1);
  CFDictionaryAddValue(v20, kCFUserNotificationAlertHeaderKey, @"RSA SecurID Authentication");
  CFDictionaryAddValue(v20, kCFUserNotificationAlertMessageKey, a2);
  CFDictionaryAddValue(v20, kCFUserNotificationDefaultButtonTitleKey, @"OK");
  if (a3) {
    CFDictionaryAddValue(v20, kCFUserNotificationAlternateButtonTitleKey, a3);
  }
  SInt32 error = 0;
  CFOptionFlags responseFlags = ((unint64_t)(a8 != 0) << 16) | ((unint64_t)(HIDWORD(a11) != 0) << 17);
  v29 = CFUserNotificationCreate(0, (double)a4, responseFlags, &error, v20);
  qword_87F0 = (uint64_t)v29;
  if (v29)
  {
    CFUserNotificationReceiveResponse(v29, 0.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      uint64_t v30 = 1;
    }
    else
    {
      if (a6)
      {
        CFStringRef ResponseValue = CFUserNotificationGetResponseValue((CFUserNotificationRef)qword_87F0, kCFUserNotificationTextFieldValuesKey, 0);
        if (ResponseValue) {
          CFStringGetCString(ResponseValue, a6, bufferSize, 0x8000100u);
        }
      }
      if (a10)
      {
        CFStringRef v32 = CFUserNotificationGetResponseValue((CFUserNotificationRef)qword_87F0, kCFUserNotificationTextFieldValuesKey, 1);
        if (v32) {
          CFStringGetCString(v32, a10, a11, 0x8000100u);
        }
      }
      uint64_t v30 = 0;
    }
    CFRelease((CFTypeRef)qword_87F0);
    qword_87F0 = 0;
  }
  else
  {
    uint64_t v30 = 1;
  }
  CFRelease(v20);
  return v30;
}

uint64_t sub_3658(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  char v4 = a4;
  long long v5 = a3;
  int v6 = a2;
  *(unsigned char *)(a1 + 116) = 0;
  CFStringRef v8 = (char *)(a1 + 116);
  *(_DWORD *)(a1 + 192) = 0;
  if ((*(char *)(a1 + 172) - 1) < 2)
  {
    __dst = (char *)(a1 + 116);
    while (1)
    {
      __s2[0] = 0;
      __s[0] = 0;
      int v9 = 1;
      if (sub_332C((const void *)qword_87E8, @"Please enter a new PIN.", @"Cancel", 120, @"PIN:", __s, 0x11u, 1, @"Confirm:", __s2, 0x100000011))break; {
      LODWORD(v10) = strlen(__s);
      }
      if (!strcmp(__s, __s2) && (int)v10 >= *(char *)(a1 + 170) && (int)v10 <= *(char *)(a1 + 171))
      {
        if (*(unsigned char *)(a1 + 173))
        {
          if ((int)v10 < 1) {
            goto LABEL_22;
          }
          uint64_t v10 = v10;
          unsigned int v11 = __s;
          while (1)
          {
            __darwin_ct_rune_t v13 = *v11++;
            __darwin_ct_rune_t v12 = v13;
            if (!(v13 < 0 ? __maskrune(v12, 0x500uLL) : _DefaultRuneLocale.__runetype[v12] & 0x500)) {
              break;
            }
            if (!--v10) {
              goto LABEL_22;
            }
          }
        }
        else
        {
          if ((int)v10 < 1)
          {
LABEL_22:
            strcpy(__dst, __s);
            int v9 = 0;
            break;
          }
          uint64_t v15 = v10;
          unsigned int v16 = __s;
          while (1)
          {
            int v18 = *v16++;
            unsigned __int8 v17 = v18;
            if (v18 < 0 || (_DefaultRuneLocale.__runetype[v17] & 0x400) == 0) {
              break;
            }
            if (!--v15) {
              goto LABEL_22;
            }
          }
        }
      }
      sub_332C((const void *)qword_87E8, @"The PIN you entered is invalid.", 0, 120, 0, 0, 0, 0, 0, 0, 0);
    }
    char v4 = a4;
    int v6 = a2;
    long long v5 = a3;
    goto LABEL_29;
  }
  if (*(unsigned char *)(a1 + 172))
  {
    int v9 = 1;
    goto LABEL_29;
  }
  int v9 = sub_332C((const void *)qword_87E8, @"A new PIN is required! Your new PIN will be displayed for 10 seconds.", @"Cancel", 120, 0, 0, 0, 0, 0, 0, 0);
  if (v9)
  {
LABEL_29:
    *(_DWORD *)(a1 + 192) = v9;
    goto LABEL_30;
  }
  CFStringRef v19 = CFStringCreateWithCString(0, (const char *)(a1 + 174), 0);
  if (v19)
  {
    CFStringRef v20 = v19;
    sub_332C((const void *)qword_87E8, v19, 0, 10, 0, 0, 0, 0, 0, 0, 0);
    CFRelease(v20);
    strcpy(v8, (const char *)(a1 + 174));
    goto LABEL_29;
  }
LABEL_30:
  *long long v5 = a1;
  *char v4 = v6;
  return 0;
}

uint64_t sub_393C(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  *(unsigned char *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 192) = sub_332C((const void *)qword_87E8, @"Please enter the next code displayed by your token.", @"Cancel", 120, @"Next Tokencode:", (char *)(a1 + 80), 0x12u, 1, 0, 0, 0);
  *a3 = a1;
  *a4 = a2;
  return 0;
}

uint64_t sub_39C8(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  *(_DWORD *)(a1 + 192) = 0;
  *a3 = a1;
  *a4 = a2;
  return 0;
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreate(op, alg, options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return _CCCryptorRelease(cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return _CFBundleCopyBundleURL(bundle);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return _CFUserNotificationGetResponseValue(userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t SecDHComputeKey()
{
  return _SecDHComputeKey();
}

uint64_t SecDHDestroy()
{
  return _SecDHDestroy();
}

uint64_t SecDHGenerateKeypair()
{
  return _SecDHGenerateKeypair();
}

uint64_t SecDHGetMaxKeyLength()
{
  return _SecDHGetMaxKeyLength();
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}