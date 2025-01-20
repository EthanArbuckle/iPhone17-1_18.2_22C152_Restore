char *t_serveropenraw(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t i;
  CC_LONG v6;
  uint64_t v7;
  CC_SHA1_CTX v9;
  unsigned __int8 v10[20];
  unsigned __int8 md[20];
  uint64_t v12;

  v12 = *MEMORY[0x263EF8340];
  v4 = (char *)malloc_type_malloc(0x668uLL, 0x103004022E4922EuLL);
  if (v4)
  {
    memset(&v9, 0, sizeof(v9));
    *((void *)v4 + 12) = cstr_new();
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 392));
    *(void *)v4 = *(void *)(a2 + 8);
    *((void *)v4 + 1) = v4 + 548;
    __memcpy_chk();
    CC_SHA1_Init(&v9);
    CC_SHA1_Update(&v9, *((const void **)v4 + 1), *(_DWORD *)v4);
    CC_SHA1_Final(md, &v9);
    *((void *)v4 + 2) = *(void *)(a2 + 24);
    *((void *)v4 + 3) = v4 + 804;
    __memcpy_chk();
    CC_SHA1_Init(&v9);
    CC_SHA1_Update(&v9, *((const void **)v4 + 3), *((_DWORD *)v4 + 4));
    CC_SHA1_Final(v10, &v9);
    for (i = 0; i != 20; ++i)
      md[i] ^= v10[i];
    CC_SHA1_Update((CC_SHA1_CTX *)(v4 + 392), md, 0x14u);
    CC_SHA1_Init(&v9);
    v6 = strlen(*(const char **)a1);
    CC_SHA1_Update(&v9, *(const void **)a1, v6);
    CC_SHA1_Final(md, &v9);
    CC_SHA1_Update((CC_SHA1_CTX *)(v4 + 392), md, 0x14u);
    *((void *)v4 + 4) = *(void *)(a1 + 8);
    *((void *)v4 + 5) = v4 + 1060;
    __memcpy_chk();
    v7 = *(void *)(a1 + 24);
    *((void *)v4 + 6) = v7;
    *((void *)v4 + 7) = v4 + 1316;
    __memcpy_chk();
    CC_SHA1_Update((CC_SHA1_CTX *)(v4 + 392), v4 + 1316, v7);
    *((void *)v4 + 9) = v4 + 1348;
    *((void *)v4 + 11) = v4 + 1380;
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 200));
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 104));
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 296));
  }
  return v4;
}

void t_servergenexp(uint64_t *a1)
{
  if ((unint64_t)*a1 >= 0x20) {
    uint64_t v1 = 32;
  }
  else {
    uint64_t v1 = *a1;
  }
  a1[8] = v1;
  t_random(a1[9], v1);
  BigIntegerFromBytes();
  uint64_t v2 = BigIntegerFromBytes();
  BigIntegerFromBytes();
  uint64_t v3 = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerFromBytes();
  BigIntegerAdd();
  BigIntegerCmp(v3, v2);
}

uint64_t t_serveraddexdata(uint64_t a1, const void *a2, int a3)
{
  return cstr_appendn(*(uint64_t **)(a1 + 96), a2, a3);
}

uint64_t t_servergetkey(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(&c, 0, sizeof(c));
  v4 = (CC_SHA1_CTX *)(a1 + 392);
  CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 392), *(const void **)(a2 + 8), *(_DWORD *)a2);
  CC_SHA1_Update(v4, *(const void **)(a1 + 88), *(_DWORD *)(a1 + 80));
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, *(const void **)(a1 + 88), *(_DWORD *)(a1 + 80));
  CC_SHA1_Final(md, &c);
  v5.i32[0] = *(_DWORD *)md;
  if (vmovn_s16((int16x8_t)vmovl_u8(v5)).u32[0])
  {
    BigIntegerFromBytes();
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 104), *(const void **)(a2 + 8), *(_DWORD *)a2);
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 200), *(const void **)(a2 + 8), *(_DWORD *)a2);
    BigIntegerFromBytes();
    BigIntegerFromBytes();
    BigIntegerFromBytes();
    BigIntegerFromBytes();
    BigIntegerFromInt();
    BigIntegerModExp();
    uint64_t v6 = BigIntegerFromInt();
    BigIntegerModMul();
    BigIntegerFree();
    BigIntegerFree();
    BigIntegerFree();
    BigIntegerFree();
    BigIntegerCmpInt(v6, 1);
  }
  return 0;
}

uint64_t t_serververify(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 296));
  if (*(void *)md == *(void *)a2
    && v12 == *(void *)(a2 + 8)
    && v13 == (unint64_t)*(unsigned int *)(a2 + 16))
  {
    v9 = (unsigned __int8 *)(a1 + 528);
    uint64_t v10 = (CC_SHA1_CTX *)(a1 + 104);
    goto LABEL_16;
  }
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 392));
  unint64_t v6 = bswap64(*(unint64_t *)md);
  unint64_t v7 = bswap64(*(void *)a2);
  if (v6 == v7)
  {
    unint64_t v6 = bswap64(v12);
    unint64_t v7 = bswap64(*(void *)(a2 + 8));
    if (v6 == v7)
    {
      unint64_t v6 = bswap32(v13);
      unint64_t v7 = bswap32(*(_DWORD *)(a2 + 16));
      if (v6 == v7)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 200), md, 0x14u);
        CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 200), (const void *)(a1 + 488), 0x28u);
        v9 = (unsigned __int8 *)(a1 + 528);
        uint64_t v10 = (CC_SHA1_CTX *)(a1 + 200);
LABEL_16:
        CC_SHA1_Final(v9, v10);
        return 0;
      }
    }
  }
  if (v6 < v7) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 1;
  }
}

uint64_t t_serverresponse(uint64_t a1)
{
  return a1 + 528;
}

void t_serverclose(uint64_t a1)
{
  *(_OWORD *)(a1 + 1348) = 0u;
  *(_OWORD *)(a1 + 1364) = 0u;
  *(_OWORD *)(a1 + 1060) = 0u;
  *(_OWORD *)(a1 + 1076) = 0u;
  *(_OWORD *)(a1 + 1092) = 0u;
  *(_OWORD *)(a1 + 1108) = 0u;
  *(_OWORD *)(a1 + 1124) = 0u;
  *(_OWORD *)(a1 + 1140) = 0u;
  *(_OWORD *)(a1 + 1156) = 0u;
  *(_OWORD *)(a1 + 1172) = 0u;
  *(_OWORD *)(a1 + 1188) = 0u;
  *(_OWORD *)(a1 + 1204) = 0u;
  *(_OWORD *)(a1 + 1220) = 0u;
  *(_OWORD *)(a1 + 1236) = 0u;
  *(_OWORD *)(a1 + 1252) = 0u;
  *(_OWORD *)(a1 + 1268) = 0u;
  *(_OWORD *)(a1 + 1284) = 0u;
  *(_OWORD *)(a1 + 1300) = 0u;
  *(_OWORD *)(a1 + 1316) = 0u;
  *(_OWORD *)(a1 + 1332) = 0u;
  *(void *)(a1 + 520) = 0;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  cstr_clear_free(*(_DWORD **)(a1 + 96));
  free((void *)a1);
}

void *cstr_new_alloc()
{
  result = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  if (result)
  {
    result[1] = 0;
    result[2] = 0;
    void *result = &cstr_empty_string;
    *((_DWORD *)result + 6) = 1;
    result[4] = 0;
  }
  return result;
}

void *cstr_new()
{
  result = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  if (result)
  {
    result[1] = 0;
    result[2] = 0;
    void *result = &cstr_empty_string;
    *((_DWORD *)result + 6) = 1;
    result[4] = 0;
  }
  return result;
}

void *cstr_dup_alloc(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    v2[1] = 0;
    v2[2] = 0;
    *uint64_t v2 = &cstr_empty_string;
    *((_DWORD *)v2 + 6) = 1;
    v2[4] = 0;
    cstr_setn((uint64_t)v2, *(const void **)a1, *(void *)(a1 + 8));
  }
  return v3;
}

uint64_t cstr_setn(uint64_t a1, const void *a2, size_t a3)
{
  if ((cstr_alloc(a1, a3 + 1) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  *(unsigned char *)(*(void *)a1 + a3) = 0;
  if (a2)
  {
    if (a3) {
      memmove(*(void **)a1, a2, a3);
    }
  }
  *(void *)(a1 + 8) = a3;
  return 1;
}

void *cstr_create(const char *a1)
{
  int v2 = strlen(a1);
  return cstr_createn(a1, v2);
}

void *cstr_createn(const void *a1, int a2)
{
  v4 = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  uint8x8_t v5 = v4;
  if (v4)
  {
    v4[1] = 0;
    v4[2] = 0;
    void *v4 = &cstr_empty_string;
    *((_DWORD *)v4 + 6) = 1;
    v4[4] = 0;
    cstr_setn((uint64_t)v4, a1, a2);
  }
  return v5;
}

uint64_t cstr_use(uint64_t result)
{
  return result;
}

void cstr_clear_free(_DWORD *a1)
{
  int v1 = a1[6] - 1;
  a1[6] = v1;
  if (!v1)
  {
    size_t v3 = *((void *)a1 + 2);
    if (v3)
    {
      bzero(*(void **)a1, v3);
      free(*(void **)a1);
    }
    free(a1);
  }
}

void cstr_free(_DWORD *a1)
{
  int v1 = a1[6] - 1;
  a1[6] = v1;
  if (!v1)
  {
    if (*((void *)a1 + 2)) {
      free(*(void **)a1);
    }
    free(a1);
  }
}

void cstr_empty(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    free(*(void **)a1);
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &cstr_empty_string;
}

uint64_t cstr_copy(uint64_t a1, uint64_t a2)
{
  return cstr_setn(a1, *(const void **)a2, *(void *)(a2 + 8));
}

uint64_t cstr_set(uint64_t a1, char *__s)
{
  size_t v4 = (int)strlen(__s);
  return cstr_setn(a1, __s, v4);
}

uint64_t cstr_alloc(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= a2) {
    return 0;
  }
  unint64_t v4 = 2 * v2;
  if (v4 <= a2) {
    unint64_t v4 = a2;
  }
  if (v4 <= 4) {
    size_t v5 = 4;
  }
  else {
    size_t v5 = v4;
  }
  unint64_t v6 = malloc_type_malloc(v5, 0x100004077774924uLL);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v7 = v6;
  if (*(void *)a1)
  {
    v6[*(void *)(a1 + 8)] = 0;
    if (*(void *)(a1 + 16))
    {
      size_t v8 = *(void *)(a1 + 8);
      if (v8) {
        memcpy(v6, *(const void **)a1, v8);
      }
      free(*(void **)a1);
    }
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 16) = v5;
  return 1;
}

uint64_t cstr_set_length(void *a1, int a2)
{
  uint64_t v3 = a2;
  unint64_t v4 = a1[1];
  if (v4 > a2)
  {
    *(unsigned char *)(*a1 + a2) = 0;
LABEL_6:
    a1[1] = v3;
    return 1;
  }
  if (v4 >= a2) {
    return 0;
  }
  if ((cstr_alloc((uint64_t)a1, a2 + 1) & 0x80000000) == 0)
  {
    bzero((void *)(*a1 + a1[1]), v3 - a1[1] + 1);
    goto LABEL_6;
  }
  return 0xFFFFFFFFLL;
}

uint64_t cstr_append(uint64_t *a1, char *__s)
{
  size_t v4 = (int)strlen(__s);
  return cstr_appendn(a1, __s, v4);
}

uint64_t cstr_appendn(uint64_t *a1, const void *a2, size_t a3)
{
  if ((cstr_alloc((uint64_t)a1, a3 + a1[1] + 1) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  memcpy((void *)(*a1 + a1[1]), a2, a3);
  uint64_t v6 = *a1;
  size_t v7 = a1[1] + a3;
  a1[1] = v7;
  *(unsigned char *)(v6 + v7) = 0;
  return 1;
}

uint64_t cstr_append_str(uint64_t *a1, uint64_t a2)
{
  return cstr_appendn(a1, *(const void **)a2, *(void *)(a2 + 8));
}

uint64_t SRP_initialize_library()
{
  if ((library_initialized & 1) == 0)
  {
    BigIntegerCtxFree();
    library_initialized = 1;
  }
  return 0;
}

uint64_t SRP_finalize_library()
{
  if (library_initialized == 1)
  {
    library_initialized = 0;
    BigIntegerCtxFree();
  }
  return 0;
}

uint64_t SRP_set_modulus_min_bits(int a1)
{
  srp_modulus_min_bits = a1;
  return 0;
}

uint64_t SRP_get_modulus_min_bits()
{
  return srp_modulus_min_bits;
}

uint64_t SRP_set_secret_bits_cb(uint64_t (*a1)())
{
  srp_sb_cb = a1;
  return 0;
}

uint64_t SRP_get_secret_bits()
{
  return srp_sb_cb();
}

void *SRP_SERVER_LOOKUP_new(uint64_t a1)
{
  unint64_t v2 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    *unint64_t v2 = a1;
    v2[1] = 0;
    size_t v4 = *(unsigned int (**)(void *))(a1 + 8);
    if (v4)
    {
      if (v4(v2))
      {
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t SRP_SERVER_LOOKUP_free(void *a1)
{
  unint64_t v2 = *(void (**)(void *))(*(void *)a1 + 16);
  if (v2) {
    v2(a1);
  }
  free(a1);
  return 0;
}

uint64_t SRP_SERVER_do_lookup(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
}

void *SRP_new(uint64_t a1)
{
  unint64_t v2 = malloc_type_malloc(0x90uLL, 0x10A004039E137EAuLL);
  uint64_t v3 = v2;
  if (v2)
  {
    v2[1] = 0;
    *((void *)v2 + 1) = cstr_new();
    v3[14] = BigIntegerCtxNew();
    v3[15] = 0;
    *((_OWORD *)v3 + 1) = 0u;
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *((_OWORD *)v3 + 4) = 0u;
    v3[10] = 0;
    v3[11] = cstr_new();
    v3[12] = a1;
    v3[13] = 0;
    v3[16] = 0;
    v3[17] = 0;
    size_t v4 = *(unsigned int (**)(void *))(a1 + 8);
    if (v4)
    {
      if (v4(v3))
      {
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t SRP_free(void *a1)
{
  unint64_t v2 = *(void (**)(void *))(a1[12] + 16);
  if (v2) {
    v2(a1);
  }
  uint64_t v3 = (_DWORD *)a1[1];
  if (v3) {
    cstr_clear_free(v3);
  }
  if (a1[2]) {
    BigIntegerFree();
  }
  if (a1[15]) {
    BigIntegerCtxFree();
  }
  if (a1[3]) {
    BigIntegerFree();
  }
  size_t v4 = (_DWORD *)a1[4];
  if (v4) {
    cstr_clear_free(v4);
  }
  if (a1[5]) {
    BigIntegerClearFree();
  }
  if (a1[6]) {
    BigIntegerClearFree();
  }
  if (a1[7]) {
    BigIntegerFree();
  }
  if (a1[8]) {
    BigIntegerClearFree();
  }
  if (a1[9]) {
    BigIntegerFree();
  }
  if (a1[10]) {
    BigIntegerClearFree();
  }
  if (a1[14]) {
    BigIntegerCtxFree();
  }
  size_t v5 = (_DWORD *)a1[11];
  if (v5) {
    cstr_clear_free(v5);
  }
  free(a1);
  return 0;
}

uint64_t SRP_set_server_lookup(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 136) = a2;
  return 0;
}

uint64_t SRP_set_client_param_verify_cb(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 128) = a2;
  return 0;
}

uint64_t SRP_set_username(uint64_t a1, char *a2)
{
  cstr_set(*(void *)(a1 + 8), a2);
  uint64_t result = *(void *)(a1 + 136);
  if (result)
  {
    size_t v4 = *(uint64_t (**)(void))(*(void *)result + 24);
    return v4();
  }
  return result;
}

uint64_t SRP_set_user_raw(uint64_t a1, const void *a2, int a3)
{
  cstr_setn(*(void *)(a1 + 8), a2, a3);
  uint64_t result = *(void *)(a1 + 136);
  if (result)
  {
    size_t v5 = *(uint64_t (**)(void))(*(void *)result + 24);
    return v5();
  }
  return result;
}

uint64_t SRP_set_params(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a4 && a6)
  {
    *(void *)(a1 + 16) = BigIntegerFromBytes();
    if (*(unsigned char *)(a1 + 4)) {
      *(void *)(a1 + 120) = BigIntegerCtxNew();
    }
    *(void *)(a1 + ++*(_DWORD *)(result + 24) = BigIntegerFromBytes();
    v15 = *(void **)(a1 + 32);
    if (!v15)
    {
      v15 = cstr_new();
      *(void *)(a1 + 32) = v15;
    }
    cstr_setn((uint64_t)v15, a6, (int)a7);
    if ((int)BigIntegerBitLen(*(void *)(a1 + 16)) >= srp_modulus_min_bits)
    {
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 128);
      if (!v16 || (uint64_t result = v16(a1, a2, a3, a4, a5), !result))
      {
        v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, const void *, uint64_t))(*(void *)(a1 + 96) + 24);
        return v17(a1, a2, a3, a4, a5, a6, a7);
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t SRP_set_authenticator(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 32))();
}

uint64_t SRP_set_auth_password(uint64_t a1, char *__s)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, char *, size_t))(*(void *)(a1 + 96) + 40);
  size_t v4 = strlen(__s);
  return v6(a1, __s, v4);
}

uint64_t SRP_set_auth_password_raw(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 40))();
}

uint64_t SRP_gen_pub(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 48))();
}

uint64_t SRP_add_ex_data(uint64_t a1, const void *a2, int a3)
{
  return 0;
}

uint64_t SRP_compute_key(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 56))();
}

uint64_t SRP_verify(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 64))();
}

uint64_t SRP_respond(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 72))();
}

uint64_t SRP_CLIENT_builtin_param_verify_cb()
{
  return 0xFFFFFFFFLL;
}

uint64_t SRP_CLIENT_default_param_verify_cb()
{
  return 0xFFFFFFFFLL;
}

uint64_t SRP_use_engine()
{
  if (BigIntegerUseEngine()) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

char **SRP6a_client_method()
{
  return &srp6a_client_meth;
}

uint64_t srp6a_client_init(void *a1)
{
  *a1 = 0x30000000CLL;
  unint64_t v2 = (CC_SHA1_CTX *)malloc_type_malloc(0xE8uLL, 0x10000403E2B8178uLL);
  a1[13] = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 96));
  return 0;
}

uint64_t srp6_client_finish(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  if (v1)
  {
    *(void *)(v1 + 2++*(_DWORD *)(result + 24) = 0;
    *(_OWORD *)(v1 + 192) = 0u;
    *(_OWORD *)(v1 + 208) = 0u;
    *(_OWORD *)(v1 + 160) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 64) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_OWORD *)(v1 + 32) = 0u;
    *(_OWORD *)(v1 + 48) = 0u;
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_client_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (uint64_t i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), a6, a7);
  return 0;
}

uint64_t srp6_client_auth(uint64_t a1)
{
  *(void *)(a1 + 48) = BigIntegerFromBytes();
  *(void *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

uint64_t srp6_client_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  return SRP_set_authenticator(a1);
}

uint64_t srp6_client_genpub(uint64_t a1, void **a2)
{
  BigIntegerBitLen(*(void *)(a1 + 16));
  int secret_bits = SRP_get_secret_bits();
  int v5 = secret_bits + 7;
  if (secret_bits < -7) {
    int v5 = secret_bits + 14;
  }
  int v6 = v5 >> 3;
  if (a2)
  {
    CC_SHA1_CTX v7 = *a2;
    if (!*a2)
    {
      CC_SHA1_CTX v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    CC_SHA1_CTX v7 = cstr_new();
  }
  int v8 = BigIntegerBitLen(*(void *)(a1 + 16));
  int v9 = v8 + 7;
  if (v8 < -7) {
    int v9 = v8 + 14;
  }
  if (v6 > v9 >> 3)
  {
    int v10 = BigIntegerBitLen(*(void *)(a1 + 16));
    int v11 = v10 + 7;
    if (v10 < -7) {
      int v11 = v10 + 14;
    }
    int v6 = v11 >> 3;
  }
  int v12 = BigIntegerBitLen(*(void *)(a1 + 16));
  int v13 = v12 + 7;
  if (v12 < -7) {
    int v13 = v12 + 14;
  }
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  *(void *)(a1 + 64) = BigIntegerFromBytes();
  BigIntegerBitLen(*(void *)(a1 + 16));
  BigIntegerAddInt();
  *(void *)(a1 + 56) = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerToCstr(*(void *)(a1 + 56), v7);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)*v7, *((_DWORD *)v7 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), (const void *)*v7, *((_DWORD *)v7 + 2));
  if (!a2) {
    cstr_clear_free(v7);
  }
  return 0;
}

void srp6a_client_key(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(v5, 0, 96);
  CC_SHA1_Init(v5);
  unint64_t v2 = cstr_new();
  BigIntegerToCstr(*(void *)(a1 + 16), v2);
  CC_SHA1_Update(v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  uint64_t v3 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 4) & 2) != 0) {
    BigIntegerToCstrEx(v3, (const void **)v2, v2[1]);
  }
  else {
    BigIntegerToCstr(v3, v2);
  }
  CC_SHA1_Update(v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  CC_SHA1_Final(md, v5);
  cstr_free(v2);
  uint64_t v4 = BigIntegerFromBytes();
  BigIntegerCmpInt(v4, 0);
}

uint64_t sub_2146E9A6C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CC_SHA1_CTX *c, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t ca,uint64_t c_8,uint64_t c_16,uint64_t c_24,uint64_t c_32,uint64_t c_40,uint64_t c_48,uint64_t c_56,uint64_t c_64,uint64_t c_72,uint64_t c_80)
{
  if (a1)
  {
    int v35 = BigIntegerBitLen(*(void *)(v31 + 16));
    int v36 = v35 + 7;
    if (v35 < -7) {
      int v36 = v35 + 14;
    }
    int v37 = v36 >> 3;
    if (v36 >> 3 >= v32)
    {
      memset(v46, 0, 96);
      CC_SHA1_Init(v46);
      v38 = cstr_new();
      uint64_t v39 = *(void *)(v31 + 56);
      if ((*(unsigned char *)(v31 + 4) & 2) != 0)
      {
        BigIntegerToCstrEx(v39, (const void **)v38, v37);
        CC_SHA1_Update(v46, (const void *)*v38, *((_DWORD *)v38 + 2));
        int v40 = v37 - v32;
        if (v37 > v32)
        {
          size_t v41 = v40;
          memcpy((void *)(*v38 + v40), v33, v32);
          bzero((void *)*v38, v41);
          v42 = (const void *)*v38;
          CC_LONG v43 = v37;
          goto LABEL_10;
        }
      }
      else
      {
        BigIntegerToCstr(v39, v38);
        CC_SHA1_Update(v46, (const void *)*v38, *((_DWORD *)v38 + 2));
      }
      v42 = v33;
      CC_LONG v43 = v32;
LABEL_10:
      CC_SHA1_Update(v46, v42, v43);
      CC_SHA1_Final((unsigned __int8 *)(v34 - 108), v46);
      *(void *)(v31 + 72) = BigIntegerFromBytes();
      CC_SHA1_Update(*(CC_SHA1_CTX **)(v31 + 104), v33, v32);
      uint64_t v44 = BigIntegerFromBytes();
      BigIntegerCmp(v44, *(void *)(v31 + 16));
    }
  }
  BigIntegerClearFree();
  return 0xFFFFFFFFLL;
}

uint64_t srp6_client_verify(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96));
  if (a3 == 20
    && (*(void *)md == *(void *)a2 ? (BOOL v5 = v9 == *(void *)(a2 + 8)) : (BOOL v5 = 0),
        v5 ? (BOOL v6 = v10 == (unint64_t)*(unsigned int *)(a2 + 16)) : (BOOL v6 = 0),
        v6))
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t srp6_client_respond(uint64_t a1, unsigned __int8 ***a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *a2;
  if (!*a2)
  {
    uint64_t v4 = (unsigned __int8 **)cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  CC_SHA1_Final(**a2, *(CC_SHA1_CTX **)(a1 + 104));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), **a2, *((_DWORD *)*a2 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), (const void *)(*(void *)(a1 + 104) + 192), 0x28u);
  return 0;
}

char **SRP6_server_method()
{
  return &srp6_server_meth;
}

char **SRP6a_server_method()
{
  return &srp6a_server_meth;
}

uint64_t srp6_server_init(void *a1)
{
  *a1 = 0x10000001CLL;
  unint64_t v2 = (CC_SHA1_CTX *)malloc_type_malloc(0x1BCuLL, 0x1000040E79818FDuLL);
  a1[13] = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 96));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 192));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 288));
  return 0;
}

uint64_t srp6_server_finish(uint64_t a1)
{
  uint64_t v1 = *(_OWORD **)(a1 + 104);
  if (v1)
  {
    v1[25] = 0u;
    v1[26] = 0u;
    v1[23] = 0u;
    v1[24] = 0u;
    v1[21] = 0u;
    v1[22] = 0u;
    v1[19] = 0u;
    v1[20] = 0u;
    v1[17] = 0u;
    v1[18] = 0u;
    v1[15] = 0u;
    v1[16] = 0u;
    v1[13] = 0u;
    v1[14] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[7] = 0u;
    v1[8] = 0u;
    v1[5] = 0u;
    v1[6] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    *uint64_t v1 = 0u;
    *(_OWORD *)((char *)v1 + 428) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_server_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (uint64_t i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), a6, a7);
  return 0;
}

uint64_t srp6_server_auth(uint64_t a1)
{
  *(void *)(a1 + 40) = BigIntegerFromBytes();
  return 0;
}

uint64_t srp6_server_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  *(void *)(a1 + 48) = BigIntegerFromBytes();
  *(void *)md = 0;
  uint64_t v9 = 0;
  int v10 = 0;
  *(void *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

uint64_t srp6_server_genpub(void *a1, void **a2)
{
  return 0;
}

uint64_t srp6_server_key(uint64_t a1, uint64_t a2, const void *a3, signed int a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v7 = BigIntegerBitLen(*(void *)(a1 + 16));
  int v8 = v7 + 7;
  if (v7 < -7) {
    int v8 = v7 + 14;
  }
  int v9 = v8 >> 3;
  if (v8 >> 3 >= a4)
  {
    memset(&v16, 0, sizeof(v16));
    CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), a3, a4);
    int v10 = cstr_new();
    BigIntegerToCstr(*(void *)(a1 + 56), v10);
    CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), (const void *)*v10, *((_DWORD *)v10 + 2));
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), a3, a4);
    CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 192), a3, a4);
    CC_SHA1_Init(&v16);
    if ((*(unsigned char *)(a1 + 4) & 2) == 0)
    {
      CC_SHA1_Update(&v16, a3, a4);
      goto LABEL_11;
    }
    int v11 = v9 - a4;
    if (v9 <= a4)
    {
      CC_SHA1_Update(&v16, a3, a4);
      if (v10[1] >= (unint64_t)v9) {
        goto LABEL_11;
      }
      unint64_t v13 = v9;
      uint64_t v12 = *(void *)(a1 + 56);
    }
    else
    {
      cstr_set_length(v10, v9);
      memcpy((void *)(*v10 + v11), a3, a4);
      bzero((void *)*v10, v11);
      CC_SHA1_Update(&v16, (const void *)*v10, v9);
      uint64_t v12 = *(void *)(a1 + 56);
      unint64_t v13 = v9;
    }
    BigIntegerToCstrEx(v12, (const void **)v10, v13);
LABEL_11:
    CC_SHA1_Update(&v16, (const void *)*v10, *((_DWORD *)v10 + 2));
    CC_SHA1_Final(md, &v16);
    *(void *)(a1 + 72) = BigIntegerFromBytes();
    BigIntegerFromInt();
    BigIntegerModExp();
    BigIntegerFromBytes();
    uint64_t v14 = BigIntegerFromInt();
    BigIntegerModMul();
    BigIntegerFree();
    BigIntegerCmpInt(v14, 1);
  }
  return 0xFFFFFFFFLL;
}

uint64_t srp6_server_verify(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(void *)(a1 + 104) + 288));
  if (a3 != 20)
  {
    CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96));
    return 0xFFFFFFFFLL;
  }
  BOOL v7 = *(void *)md == *(void *)a2
    && v15 == *(void *)(a2 + 8)
    && v16 == (unint64_t)*(unsigned int *)(a2 + 16);
  int v8 = *(CC_SHA1_CTX **)(a1 + 104);
  if (v7)
  {
    uint64_t v12 = (unsigned __int8 *)&v8[4].data[3];
    int v11 = v8 + 2;
  }
  else
  {
    CC_SHA1_Final(md, v8 + 1);
    if (*(void *)md != *(void *)a2
      || v15 != *(void *)(a2 + 8)
      || v16 != (unint64_t)*(unsigned int *)(a2 + 16))
    {
      return 0xFFFFFFFFLL;
    }
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)(*(void *)(a1 + 104) + 384), 0x28u);
    int v11 = *(CC_SHA1_CTX **)(a1 + 104);
    uint64_t v12 = (unsigned __int8 *)&v11[4].data[3];
  }
  CC_SHA1_Final(v12, v11);
  return 0;
}

uint64_t srp6_server_respond(uint64_t a1, uint64_t **a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *a2;
  if (!*a2)
  {
    uint64_t v4 = cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  uint64_t result = 0;
  uint64_t v6 = **a2;
  uint64_t v7 = *(void *)(a1 + 104);
  int v8 = (_OWORD *)(v7 + 424);
  LODWORD(v7) = *(_DWORD *)(v7 + 440);
  *(_OWORD *)uint64_t v6 = *v8;
  *(_DWORD *)(v6 + 16) = v7;
  return result;
}

void srp6_server_genpub_ex(void *a1, void **a2)
{
  BigIntegerBitLen(a1[2]);
  int secret_bits = SRP_get_secret_bits();
  int v5 = secret_bits + 7;
  if (secret_bits < -7) {
    int v5 = secret_bits + 14;
  }
  int v6 = v5 >> 3;
  if (a2)
  {
    uint64_t v7 = *a2;
    if (!*a2)
    {
      uint64_t v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    uint64_t v7 = cstr_new();
  }
  int v8 = BigIntegerBitLen(a1[2]);
  int v9 = v8 + 7;
  if (v8 < -7) {
    int v9 = v8 + 14;
  }
  if (v6 > v9 >> 3)
  {
    int v10 = BigIntegerBitLen(a1[2]);
    int v11 = v10 + 7;
    if (v10 < -7) {
      int v11 = v10 + 14;
    }
    int v6 = v11 >> 3;
  }
  int v12 = BigIntegerBitLen(a1[2]);
  int v13 = v12 + 7;
  if (v12 < -7) {
    int v13 = v12 + 14;
  }
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  a1[8] = BigIntegerFromBytes();
  a1[7] = BigIntegerFromInt();
  BigIntegerMul();
  BigIntegerModExp();
  BigIntegerAdd();
  BigIntegerMod();
  BigIntegerToCstr(a1[7], v7);
  CC_SHA1_Update((CC_SHA1_CTX *)(a1[13] + 288), (const void *)*v7, *((_DWORD *)v7 + 2));
  if (!a2)
  {
    cstr_clear_free(v7);
  }
}

uint64_t srp6a_server_init(void *a1)
{
  *a1 = 0x30000001CLL;
  unint64_t v2 = (CC_SHA1_CTX *)malloc_type_malloc(0x1BCuLL, 0x1000040E79818FDuLL);
  a1[13] = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 96));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 192));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 288));
  return 0;
}

void srp6a_server_genpub(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  unint64_t v2 = cstr_new();
  BigIntegerToCstr(*(void *)(a1 + 16), v2);
  CC_SHA1_Update(&v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  uint64_t v3 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 4) & 2) != 0) {
    BigIntegerToCstrEx(v3, (const void **)v2, v2[1]);
  }
  else {
    BigIntegerToCstr(v3, v2);
  }
  CC_SHA1_Update(&v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  CC_SHA1_Final(md, &v5);
  cstr_free(v2);
  uint64_t v4 = BigIntegerFromBytes();
  BigIntegerCmpInt(v4, 0);
}

uint64_t sub_2146EAA34(int a1)
{
  if (a1)
  {
    srp6_server_genpub_ex(v2, v1);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  BigIntegerClearFree();
  return v3;
}

uint64_t BigIntegerFromInt()
{
  uint64_t v0 = CCCreateBigNum();
  if (v0) {
    CCBigNumSetI();
  }
  return v0;
}

uint64_t BigIntegerFromBytes()
{
  return CCBigNumFromData();
}

uint64_t BigIntegerToBytes()
{
  return CCBigNumToData();
}

uint64_t BigIntegerToCstr(uint64_t a1, void *a2)
{
  int v3 = CCBigNumBitCount();
  int v4 = v3 + 7;
  if (v3 < -7) {
    int v4 = v3 + 14;
  }
  if ((cstr_set_length(a2, v4 >> 3) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v5 = CCBigNumToData();
  return ((int)cstr_set_length(a2, v5) >> 31);
}

uint64_t BigIntegerToCstrEx(uint64_t a1, const void **a2, unint64_t a3)
{
  if ((cstr_set_length(a2, a3) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v5 = CCBigNumToData();
  uint64_t result = 0;
  if (a3 > v5)
  {
    size_t v7 = a3 - v5;
    memmove((char *)*a2 + v7, *a2, v5);
    bzero((void *)*a2, v7);
    return 0;
  }
  return result;
}

uint64_t BigIntegerToHex(uint64_t a1, char *a2, int a3)
{
  int v5 = (char *)CCBigNumToHexString();
  strlcpy(a2, v5, a3);
  free(v5);
  return 0;
}

uint64_t BigIntegerToString(uint64_t a1, char *a2)
{
  uint64_t v3 = BigIntegerFromInt();
  CCBigNumModI();
  *a2 = b64table[0];
  int v4 = a2 + 1;
  BigIntegerFromInt();
  CCBigNumDiv();
  CCBigNumFree();
  int v5 = a2 + 1;
  if ((int)MEMORY[0x2166A6C00](v3, 0) >= 1)
  {
    int v5 = a2 + 1;
    do
    {
      CCBigNumModI();
      *v5++ = b64table[0];
      BigIntegerFromInt();
      CCBigNumDiv();
      CCBigNumFree();
    }
    while ((int)MEMORY[0x2166A6C00](v3, 0) > 0);
  }
  CCBigNumFree();
  *int v5 = 0;
  int v6 = v5 - 1;
  if (v6 > a2)
  {
    do
    {
      char v7 = *v6;
      *v6-- = *(v4 - 1);
      *(v4 - 1) = v7;
    }
    while (v6 > v4++);
  }
  return 0;
}

uint64_t BigIntegerModInt()
{
  return 0;
}

uint64_t BigIntegerDivInt()
{
  return 0;
}

uint64_t BigIntegerFree()
{
  return 0;
}

uint64_t BigIntegerLShift()
{
  return 0;
}

uint64_t BigIntegerAdd()
{
  return 0;
}

uint64_t BigIntegerAddInt()
{
  return 0;
}

uint64_t BigIntegerSub()
{
  return 0;
}

uint64_t BigIntegerSubInt()
{
  return 0;
}

uint64_t BigIntegerMul()
{
  return 0;
}

uint64_t BigIntegerMulInt()
{
  return 0;
}

uint64_t BigIntegerMod()
{
  return 0;
}

uint64_t BigIntegerModMul()
{
  return 0;
}

uint64_t BigIntegerModExp()
{
  return 0;
}

uint64_t BigIntegerCheckPrime()
{
  return CCBigNumIsPrime();
}

uint64_t BigIntegerClearFree()
{
  return 0;
}

uint64_t BigIntegerCtxNew()
{
  return 0;
}

uint64_t BigIntegerCtxFree()
{
  return 0;
}

uint64_t BigIntegerUseEngine()
{
  return 0xFFFFFFFFLL;
}

void t_random(uint64_t a1, int a2)
{
  if (a2)
  {
    if (CCRandomCopyBytes()) {
      abort();
    }
  }
}

unsigned char *t_sessionkey(unsigned char *a1, unsigned char *a2, unint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3 > 0xFA0) {
    return 0;
  }
  unint64_t v3 = a3;
  int v4 = a2;
  if (a3)
  {
    while (!*v4)
    {
      ++v4;
      if (!--v3)
      {
        int v4 = &a2[a3];
        break;
      }
    }
  }
  unint64_t v6 = v3 >> 1;
  char v7 = malloc_type_malloc(v3 >> 1, 0x100004077774924uLL);
  if (!v7) {
    return 0;
  }
  int v8 = v7;
  memset(&v19, 0, sizeof(v19));
  if (v3 >= 2)
  {
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    do
    {
      *((unsigned char *)v7 + v10++) = v4[v3 + ~(unint64_t)v9];
      v9 += 2;
    }
    while (v6 > v10);
  }
  CC_SHA1_Init(&v19);
  CC_SHA1_Update(&v19, v8, v3 >> 1);
  CC_SHA1_Final(md, &v19);
  uint64_t v11 = 0;
  int v12 = a1;
  do
  {
    *int v12 = md[v11];
    v12 += 2;
    ++v11;
  }
  while (v11 != 20);
  if (v3 >= 2)
  {
    unsigned int v13 = 0;
    uint64_t v14 = 0;
    do
    {
      *((unsigned char *)v8 + v14++) = v4[v3 - 2 - v13];
      v13 += 2;
    }
    while (v6 > v14);
  }
  CC_SHA1_Init(&v19);
  CC_SHA1_Update(&v19, v8, v3 >> 1);
  uint64_t v15 = md;
  CC_SHA1_Final(md, &v19);
  for (uint64_t i = 1; i != 41; i += 2)
  {
    char v17 = *v15++;
    a1[i] = v17;
  }
  bzero(v8, v3 >> 1);
  free(v8);
  return a1;
}

unsigned __int8 *t_mgf1(unsigned __int8 *result, unsigned int a2, const void *a3, CC_LONG a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    char v7 = result;
    int v8 = 0;
    unsigned int v9 = 0;
    memset(&c, 0, sizeof(c));
    while (1)
    {
      unsigned int data = bswap32(v9);
      CC_SHA1_Init(&c);
      CC_SHA1_Update(&c, a3, a4);
      CC_SHA1_Update(&c, &data, 4u);
      unsigned int v10 = v8 + 20;
      if (v8 + 20 > a2) {
        break;
      }
      uint64_t result = (unsigned __int8 *)CC_SHA1_Final(&v7[v8], &c);
      ++v9;
      v8 += 20;
      if (v10 >= a2) {
        return result;
      }
    }
    CC_SHA1_Final(md, &c);
    return (unsigned __int8 *)memcpy(&v7[v8], md, a2 - v8);
  }
  return result;
}

uint64_t t_fromhex(unsigned char *a1, char *__s)
{
  unint64_t v2 = __s;
  size_t v4 = strlen(__s);
  if ((v4 & 1) == 0)
  {
    int v5 = a1;
    if (!v4) {
      return (v5 - a1);
    }
    goto LABEL_12;
  }
  int v7 = *v2++;
  char v6 = v7;
  unsigned int v8 = (v7 << 24) - 788529153;
  unsigned int v9 = (v7 << 24) - 1610612737;
  char v10 = v7 - 55;
  if (((v7 << 24) - 1073741825) >= 0x6FFFFFF) {
    char v11 = 0;
  }
  else {
    char v11 = v10;
  }
  if (v9 < 0x6FFFFFF) {
    char v11 = v6 - 87;
  }
  char v12 = v6 - 48;
  if (v8 < 0xAFFFFFF) {
    char v11 = v12;
  }
  *a1 = v11;
  int v5 = a1 + 1;
  if (--v4)
  {
    do
    {
LABEL_12:
      int v13 = *v2;
      unsigned int v14 = (v13 << 24) - 788529153;
      if (((v13 << 24) - 1073741825) >= 0x6FFFFFF) {
        char v15 = 0;
      }
      else {
        char v15 = v13 - 55;
      }
      if (((v13 << 24) - 1610612737) < 0x6FFFFFF) {
        char v15 = v13 - 87;
      }
      char v16 = v13 - 48;
      if (v14 >= 0xAFFFFFF) {
        char v16 = v15;
      }
      char v17 = 16 * v16;
      int v18 = v2[1];
      unsigned int v19 = (v18 << 24) - 788529153;
      if (((v18 << 24) - 1073741825) >= 0x6FFFFFF) {
        char v20 = 0;
      }
      else {
        char v20 = v18 - 55;
      }
      if (((v18 << 24) - 1610612737) < 0x6FFFFFF) {
        char v20 = v18 - 87;
      }
      char v21 = v18 - 48;
      if (v19 >= 0xAFFFFFF) {
        char v21 = v20;
      }
      *v5++ = v21 | v17;
      v2 += 2;
      v4 -= 2;
    }
    while (v4);
  }
  return (v5 - a1);
}

char *t_tohex(char *a1, unsigned char *a2, int a3)
{
  *a1 = 0;
  if (a3)
  {
    int v4 = a3;
    int v6 = 0;
    int v7 = a1;
    do
    {
      if (v6) {
        goto LABEL_4;
      }
      if (!*a2)
      {
        int v6 = 0;
        goto LABEL_6;
      }
      if (*a2 >= 0x10u)
      {
LABEL_4:
        uint64_t v8 = 2;
        sprintf(v7, "%.2X");
      }
      else
      {
        uint64_t v8 = 1;
        sprintf(v7, "%.1X");
      }
      v7 += v8;
      int v6 = 1;
LABEL_6:
      ++a2;
      --v4;
    }
    while (v4);
  }
  return a1;
}

char *t_tohexcstr(char **a1, unsigned char *a2, int a3)
{
  cstr_set_length(a1, (2 * a3) | 1);
  int v6 = *a1;
  return t_tohex(v6, a2, a3);
}

size_t t_fromb64(void *a1, char *__s)
{
  while (1)
  {
    unsigned int v4 = *__s;
    BOOL v5 = v4 > 0x20;
    uint64_t v6 = (1 << v4) & 0x100000600;
    if (v5 || v6 == 0) {
      break;
    }
    ++__s;
  }
  unsigned int v8 = strlen(__s);
  unsigned int v9 = malloc_type_malloc(v8 + 1, 0x100004077774924uLL);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  char v10 = v9;
  if (v8)
  {
    uint64_t v11 = 0;
    while (1)
    {
      char v12 = strchr(b64table_0, __s[v11]);
      if (!v12) {
        break;
      }
      v10[v11++] = (_BYTE)v12 - b64table_0;
      if (v8 == v11) {
        goto LABEL_14;
      }
    }
    unsigned int v8 = v11;
  }
LABEL_14:
  uint64_t v14 = 0;
  signed int v15 = v8 - 1;
  uint64_t v16 = (int)v8 - 1;
  unsigned int v17 = v8 - 3;
  unsigned int v18 = v8 - 2;
  while (1)
  {
    char v19 = v10[v15 + v14];
    v10[v16 + 1] = v19;
    if (v15 + v14 < 1)
    {
LABEL_19:
      LODWORD(v16) = v16 + 1;
      goto LABEL_21;
    }
    v10[v16 + 1] = v19 | (v10[v18 + v14] << 6);
    int v20 = (v10[v18 + v14] >> 2) & 0xF;
    v10[v16] = (v10[v18 + v14] >> 2) & 0xF;
    if (v15 + v14 == 1) {
      goto LABEL_21;
    }
    char v21 = &v10[v16];
    *char v21 = v20 | (16 * v10[v17 + v14]);
    int v22 = (v10[v17 + v14] >> 4) & 3;
    *(v21 - 1) = (v10[v17 + v14] >> 4) & 3;
    if ((v15 + v14) < 3) {
      break;
    }
    int v23 = v8 - 4 + v14;
    v14 -= 4;
    *(v21 - 1) = v22 | (4 * v10[v23]);
    *(v21 - 2) = 0;
    v16 -= 3;
    if (v15 + v14 == -1) {
      goto LABEL_19;
    }
  }
  LODWORD(v16) = v16 - 1;
LABEL_21:
  v24 = &v10[(int)v16];
  do
  {
    int v26 = *v24++;
    int v25 = v26;
    int v27 = v16 + 1;
    if (v8 < v16) {
      break;
    }
    LODWORD(v16) = v16 + 1;
  }
  while (!v25);
  size_t v13 = v8 - v27 + 2;
  memcpy(a1, v24 - 1, v13);
  free(v10);
  return v13;
}

size_t t_cstrfromb64(void **a1, char *__s)
{
  size_t v4 = strlen(__s);
  cstr_set_length(a1, (6 * v4 + 7) >> 3);
  size_t v5 = t_fromb64(*a1, __s);
  cstr_set_length(a1, v5);
  return v5;
}

unsigned char *t_tob64(unsigned char *result, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int v3 = 0;
  unint64_t v4 = a3 % 3;
  if (v4 == 1)
  {
    uint64_t v6 = a2;
    goto LABEL_5;
  }
  unsigned int v5 = 0;
  if (v4 == 2)
  {
    uint64_t v6 = a2 + 1;
    unsigned int v3 = *a2;
LABEL_5:
    unsigned int v5 = *v6;
  }
  unsigned int v7 = 0;
  int v8 = 0;
  unsigned int v9 = a2 + 1;
  char v10 = result;
  while (1)
  {
    if (v8) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v7 > 3;
    }
    int v12 = v11;
    if (v12 == 1) {
      *v10++ = b64table_0[(unint64_t)v7 >> 2];
    }
    uint64_t v13 = (16 * (v7 & 3)) | (v3 >> 4);
    if (v13) {
      int v14 = 1;
    }
    else {
      int v14 = v12;
    }
    if (v14 == 1) {
      *v10++ = b64table_0[v13];
    }
    uint64_t v15 = (4 * (v3 & 0xF)) | (v5 >> 6);
    if (v15) {
      int v14 = 1;
    }
    if (v14 == 1)
    {
      *v10++ = b64table_0[v15];
      int v16 = v5 & 0x3F;
LABEL_25:
      *v10++ = b64table_0[v16];
      int v8 = 1;
      goto LABEL_26;
    }
    int v16 = v5 & 0x3F;
    if ((v5 & 0x3F) != 0) {
      goto LABEL_25;
    }
    int v8 = 0;
LABEL_26:
    if (v4 >= a3) {
      break;
    }
    unsigned int v17 = &v9[v4];
    unsigned int v7 = a2[v4];
    unsigned int v3 = v9[v4];
    v4 += 3;
    unsigned int v5 = v17[1];
  }
  *char v10 = 0;
  return result;
}

unsigned char *t_tob64cstr(void *a1, unsigned __int8 *a2, unsigned int a3)
{
  cstr_set_length(a1, ((8 * a3) | 4) / 6 + 1);
  uint64_t v6 = (unsigned char *)*a1;
  return t_tob64(v6, a2, a3);
}

char **SRP_RFC2945_client_method()
{
  return &srp_rfc2945_client_meth;
}

uint64_t srp2945_client_init(uint64_t a1)
{
  *(_DWORD *)a1 = 12;
  *(void *)(a1 + 128) = SRP_CLIENT_default_param_verify_cb;
  unint64_t v2 = (CC_SHA1_CTX *)malloc_type_malloc(0xE8uLL, 0x10000403E2B8178uLL);
  *(void *)(a1 + 104) = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96));
  return 0;
}

uint64_t srp2945_client_finish(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  if (v1)
  {
    *(void *)(v1 + 2++*(_DWORD *)(result + 24) = 0;
    *(_OWORD *)(v1 + 192) = 0u;
    *(_OWORD *)(v1 + 208) = 0u;
    *(_OWORD *)(v1 + 160) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 64) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_OWORD *)(v1 + 32) = 0u;
    *(_OWORD *)(v1 + 48) = 0u;
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp2945_client_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (uint64_t i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), a6, a7);
  return 0;
}

uint64_t srp2945_client_auth(uint64_t a1)
{
  *(void *)(a1 + 48) = BigIntegerFromBytes();
  *(void *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

uint64_t srp2945_client_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  return SRP_set_authenticator(a1);
}

uint64_t srp2945_client_genpub(uint64_t a1, void **a2)
{
  BigIntegerBitLen(*(void *)(a1 + 16));
  int secret_bits = SRP_get_secret_bits();
  int v5 = secret_bits + 7;
  if (secret_bits < -7) {
    int v5 = secret_bits + 14;
  }
  int v6 = v5 >> 3;
  if (a2)
  {
    CC_SHA1_CTX v7 = *a2;
    if (!*a2)
    {
      CC_SHA1_CTX v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    CC_SHA1_CTX v7 = cstr_new();
  }
  int v8 = BigIntegerBitLen(*(void *)(a1 + 16));
  int v9 = v8 + 7;
  if (v8 < -7) {
    int v9 = v8 + 14;
  }
  if (v6 > v9 >> 3)
  {
    int v10 = BigIntegerBitLen(*(void *)(a1 + 16));
    int v11 = v10 + 7;
    if (v10 < -7) {
      int v11 = v10 + 14;
    }
    int v6 = v11 >> 3;
  }
  int v12 = BigIntegerBitLen(*(void *)(a1 + 16));
  int v13 = v12 + 7;
  if (v12 < -7) {
    int v13 = v12 + 14;
  }
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  *(void *)(a1 + 64) = BigIntegerFromBytes();
  BigIntegerBitLen(*(void *)(a1 + 16));
  BigIntegerAddInt();
  *(void *)(a1 + 56) = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerToCstr(*(void *)(a1 + 56), v7);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)*v7, *((_DWORD *)v7 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), (const void *)*v7, *((_DWORD *)v7 + 2));
  if (!a2) {
    cstr_clear_free(v7);
  }
  return 0;
}

void srp2945_client_key(uint64_t a1, uint64_t a2, const void *a3, CC_LONG a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(&v8, 0, sizeof(v8));
  CC_SHA1_Init(&v8);
  CC_SHA1_Update(&v8, a3, a4);
  CC_SHA1_Final(md, &v8);
  uint64_t v7 = BigIntegerFromBytes();
  *(void *)(a1 + 72) = v7;
  BigIntegerCmpInt(v7, 0);
}

uint64_t sub_2146EBEC8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  if (a1)
  {
    CC_SHA1_Update(*(CC_SHA1_CTX **)(v30 + 104), v32, v31);
    uint64_t v33 = BigIntegerFromBytes();
    BigIntegerCmp(v33, *(void *)(v30 + 16));
  }
  return 0xFFFFFFFFLL;
}

uint64_t srp2945_client_verify(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96));
  if (a3 == 20
    && (*(void *)md == *(void *)a2 ? (BOOL v5 = v9 == *(void *)(a2 + 8)) : (BOOL v5 = 0),
        v5 ? (BOOL v6 = v10 == (unint64_t)*(unsigned int *)(a2 + 16)) : (BOOL v6 = 0),
        v6))
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t srp2945_client_respond(uint64_t a1, unsigned __int8 ***a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *a2;
  if (!*a2)
  {
    unint64_t v4 = (unsigned __int8 **)cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  CC_SHA1_Final(**a2, *(CC_SHA1_CTX **)(a1 + 104));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), **a2, *((_DWORD *)*a2 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), (const void *)(*(void *)(a1 + 104) + 192), 0x28u);
  return 0;
}

char **SRP_RFC2945_server_method()
{
  return &srp_rfc2945_server_meth;
}

uint64_t srp2945_server_init(uint64_t a1)
{
  *(_DWORD *)a1 = 28;
  unint64_t v2 = (CC_SHA1_CTX *)malloc_type_malloc(0x1BCuLL, 0x1000040E79818FDuLL);
  *(void *)(a1 + 104) = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96));
  CC_SHA1_Init((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 192));
  CC_SHA1_Init((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 288));
  return 0;
}

uint64_t srp2945_server_finish(uint64_t a1)
{
  uint64_t v1 = *(_OWORD **)(a1 + 104);
  if (v1)
  {
    v1[25] = 0u;
    v1[26] = 0u;
    v1[23] = 0u;
    v1[24] = 0u;
    v1[21] = 0u;
    v1[22] = 0u;
    v1[19] = 0u;
    v1[20] = 0u;
    v1[17] = 0u;
    v1[18] = 0u;
    v1[15] = 0u;
    v1[16] = 0u;
    v1[13] = 0u;
    v1[14] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[7] = 0u;
    v1[8] = 0u;
    v1[5] = 0u;
    v1[6] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    *uint64_t v1 = 0u;
    *(_OWORD *)((char *)v1 + 428) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp2945_server_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (uint64_t i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), a6, a7);
  return 0;
}

uint64_t srp2945_server_auth(uint64_t a1)
{
  *(void *)(a1 + 40) = BigIntegerFromBytes();
  return 0;
}

uint64_t srp2945_server_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  *(void *)(a1 + 48) = BigIntegerFromBytes();
  *(void *)md = 0;
  uint64_t v9 = 0;
  int v10 = 0;
  *(void *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

void srp2945_server_genpub(void *a1, void **a2)
{
  BigIntegerBitLen(a1[2]);
  int secret_bits = SRP_get_secret_bits();
  int v5 = secret_bits + 7;
  if (secret_bits < -7) {
    int v5 = secret_bits + 14;
  }
  int v6 = v5 >> 3;
  if (a2)
  {
    CC_SHA1_CTX v7 = *a2;
    if (!*a2)
    {
      CC_SHA1_CTX v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    CC_SHA1_CTX v7 = cstr_new();
  }
  int v8 = BigIntegerBitLen(a1[2]);
  int v9 = v8 + 7;
  if (v8 < -7) {
    int v9 = v8 + 14;
  }
  if (v6 > v9 >> 3)
  {
    int v10 = BigIntegerBitLen(a1[2]);
    int v11 = v10 + 7;
    if (v10 < -7) {
      int v11 = v10 + 14;
    }
    int v6 = v11 >> 3;
  }
  int v12 = BigIntegerBitLen(a1[2]);
  int v13 = v12 + 7;
  if (v12 < -7) {
    int v13 = v12 + 14;
  }
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  a1[8] = BigIntegerFromBytes();
  a1[7] = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerAdd();
  BigIntegerCmp(a1[7], a1[2]);
}

void srp2945_server_key(uint64_t a1, int a2, void *data, CC_LONG len)
{
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), data, len);
  CC_SHA1_CTX v7 = cstr_new();
  BigIntegerToCstr(*(void *)(a1 + 56), v7);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96), (const void *)*v7, *((_DWORD *)v7 + 2));
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), data, len);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(void *)(a1 + 104) + 192), data, len);
  BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerFromBytes();
  uint64_t v8 = BigIntegerFromInt();
  BigIntegerModMul();
  BigIntegerCmpInt(v8, 1);
}

uint64_t srp2945_server_verify(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(void *)(a1 + 104) + 288));
  if (a3 != 20)
  {
    CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(void *)(a1 + 104) + 96));
    return 0xFFFFFFFFLL;
  }
  BOOL v7 = *(void *)md == *(void *)a2
    && v15 == *(void *)(a2 + 8)
    && v16 == (unint64_t)*(unsigned int *)(a2 + 16);
  uint64_t v8 = *(CC_SHA1_CTX **)(a1 + 104);
  if (v7)
  {
    int v12 = (unsigned __int8 *)&v8[4].data[3];
    int v11 = v8 + 2;
  }
  else
  {
    CC_SHA1_Final(md, v8 + 1);
    if (*(void *)md != *(void *)a2
      || v15 != *(void *)(a2 + 8)
      || v16 != (unint64_t)*(unsigned int *)(a2 + 16))
    {
      return 0xFFFFFFFFLL;
    }
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)(*(void *)(a1 + 104) + 384), 0x28u);
    int v11 = *(CC_SHA1_CTX **)(a1 + 104);
    int v12 = (unsigned __int8 *)&v11[4].data[3];
  }
  CC_SHA1_Final(v12, v11);
  return 0;
}

uint64_t srp2945_server_respond(uint64_t a1, uint64_t **a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *a2;
  if (!*a2)
  {
    unint64_t v4 = cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  uint64_t result = 0;
  uint64_t v6 = **a2;
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = (_OWORD *)(v7 + 424);
  LODWORD(v7) = *(_DWORD *)(v7 + 440);
  *(_OWORD *)uint64_t v6 = *v8;
  *(_DWORD *)(v6 + 16) = v7;
  return result;
}

uint64_t CCBigNumAdd()
{
  return MEMORY[0x270ED77E8]();
}

uint64_t CCBigNumAddI()
{
  return MEMORY[0x270ED77F0]();
}

uint64_t CCBigNumBitCount()
{
  return MEMORY[0x270ED77F8]();
}

uint64_t CCBigNumCompare()
{
  return MEMORY[0x270ED7800]();
}

uint64_t CCBigNumCompareI()
{
  return MEMORY[0x270ED7808]();
}

uint64_t CCBigNumDiv()
{
  return MEMORY[0x270ED7810]();
}

uint64_t CCBigNumFree()
{
  return MEMORY[0x270ED7818]();
}

uint64_t CCBigNumFromData()
{
  return MEMORY[0x270ED7820]();
}

uint64_t CCBigNumIsPrime()
{
  return MEMORY[0x270ED7828]();
}

uint64_t CCBigNumLeftShift()
{
  return MEMORY[0x270ED7830]();
}

uint64_t CCBigNumMod()
{
  return MEMORY[0x270ED7838]();
}

uint64_t CCBigNumModExp()
{
  return MEMORY[0x270ED7840]();
}

uint64_t CCBigNumModI()
{
  return MEMORY[0x270ED7848]();
}

uint64_t CCBigNumMul()
{
  return MEMORY[0x270ED7850]();
}

uint64_t CCBigNumMulI()
{
  return MEMORY[0x270ED7858]();
}

uint64_t CCBigNumMulMod()
{
  return MEMORY[0x270ED7860]();
}

uint64_t CCBigNumSetI()
{
  return MEMORY[0x270ED7868]();
}

uint64_t CCBigNumSub()
{
  return MEMORY[0x270ED7870]();
}

uint64_t CCBigNumSubI()
{
  return MEMORY[0x270ED7878]();
}

uint64_t CCBigNumToData()
{
  return MEMORY[0x270ED7880]();
}

uint64_t CCBigNumToHexString()
{
  return MEMORY[0x270ED7888]();
}

uint64_t CCCreateBigNum()
{
  return MEMORY[0x270ED7898]();
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x270ED7A78]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}