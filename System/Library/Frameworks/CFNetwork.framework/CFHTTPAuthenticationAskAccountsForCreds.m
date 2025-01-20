@interface CFHTTPAuthenticationAskAccountsForCreds
@end

@implementation CFHTTPAuthenticationAskAccountsForCreds

uint64_t ___CFHTTPAuthenticationAskAccountsForCreds_block_invoke(void *a1, uint64_t a2)
{
  if (!a2) {
    goto LABEL_33;
  }
  if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
  }
  if (*(_DWORD *)(a2 + 48) != 2) {
    goto LABEL_33;
  }
  uint64_t v4 = a1[5];
  CFTypeRef v5 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 128))(a2 + 16);
  CFTypeRef v6 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 136))(a2 + 16);
  CFTypeRef v7 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 16) + 144))(a2 + 16);
  if (v5) {
    CFTypeRef v5 = CFRetain(v5);
  }
  if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1) {
    dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_9469);
  }
  if (v4) {
    v8 = (void *)(v4 + 16);
  }
  else {
    v8 = 0;
  }
  v9 = (const void *)v8[24];
  v8[24] = v5;
  if (v9) {
    CFRelease(v9);
  }
  if (v6) {
    CFTypeRef v6 = CFRetain(v6);
  }
  if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1) {
    dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_9469);
  }
  v10 = (const void *)v8[25];
  v8[25] = v6;
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFTypeRef v7 = CFRetain(v7);
  }
  if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1) {
    dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_9469);
  }
  v11 = (const void *)v8[26];
  v8[26] = v7;
  if (v11)
  {
    CFRelease(v11);
    uint64_t v12 = a1[5];
    v13 = (const void *)a1[7];
    if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1) {
      dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_9469);
    }
  }
  else
  {
    uint64_t v12 = a1[5];
    v13 = (const void *)a1[7];
  }
  uint64_t v14 = v12 ? v12 + 16 : 0;
  CFDictionaryGetValue(*(CFDictionaryRef *)(v14 + 152), v13);
  if (!HTTPAuthentication::createNegotiateHeaderForRequest_Mac())
  {
    uint64_t v17 = a1[8];
    v18 = (KerberosAccountBroker *)a1[9];
    v19 = (__CFData *)a1[10];
    uint64_t v20 = a1[5];
    return _CFHTTPAuthenticationAskAccountsForCreds(v20, v17, v18, v19);
  }
  else
  {
LABEL_33:
    v15 = *(uint64_t (**)(void))(a1[4] + 16);
    return v15();
  }
}

@end