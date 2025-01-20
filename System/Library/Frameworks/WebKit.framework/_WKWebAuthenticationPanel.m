@interface _WKWebAuthenticationPanel
+ (PublicKeyCredentialCreationOptions)convertToCoreCreationOptionsWithOptions:(SEL)a3;
+ (PublicKeyCredentialRequestOptions)convertToCoreRequestOptionsWithOptions:(SEL)a3;
+ (id)encodeGetAssertionCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5;
+ (id)encodeGetAssertionCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6;
+ (id)encodeGetAssertionCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5;
+ (id)encodeGetAssertionCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6;
+ (id)encodeMakeCredentialCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5;
+ (id)encodeMakeCredentialCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6;
+ (id)encodeMakeCredentialCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5;
+ (id)encodeMakeCredentialCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6;
+ (id)exportLocalAuthenticatorCredentialWithGroupAndID:(id)a3 credential:(id)a4 error:(id *)a5;
+ (id)exportLocalAuthenticatorCredentialWithID:(id)a3 error:(id *)a4;
+ (id)getAllLocalAuthenticatorCredentials;
+ (id)getAllLocalAuthenticatorCredentialsWithAccessGroup:(id)a3;
+ (id)getAllLocalAuthenticatorCredentialsWithCredentialID:(id)a3;
+ (id)getAllLocalAuthenticatorCredentialsWithCredentialIDAndAccessGroup:(id)a3 credentialID:(id)a4;
+ (id)getAllLocalAuthenticatorCredentialsWithRPID:(id)a3;
+ (id)getAllLocalAuthenticatorCredentialsWithRPIDAndAccessGroup:(id)a3 rpID:(id)a4;
+ (id)getClientDataJSONForAuthenticationType:(int64_t)a3 challenge:(id)a4 origin:(id)a5;
+ (id)getClientDataJSONWithTopOrigin:(int64_t)a3 challenge:(id)a4 origin:(id)a5 topOrigin:(id)a6 crossOrigin:(BOOL)a7;
+ (id)importLocalAuthenticatorCredential:(id)a3 error:(id *)a4;
+ (id)importLocalAuthenticatorWithAccessGroup:(id)a3 credential:(id)a4 error:(id *)a5;
+ (void)deleteLocalAuthenticatorCredentialWithGroupAndID:(id)a3 credential:(id)a4;
+ (void)deleteLocalAuthenticatorCredentialWithID:(id)a3;
+ (void)setDisplayNameForLocalCredentialWithGroupAndID:(id)a3 credential:(id)a4 displayName:(id)a5;
+ (void)setNameForLocalCredentialWithGroupAndID:(id)a3 credential:(id)a4 name:(id)a5;
- (NSSet)transports;
- (NSString)relyingPartyID;
- (NSString)userName;
- (Object)_apiObject;
- (_WKWebAuthenticationPanel)init;
- (_WKWebAuthenticationPanelDelegate)delegate;
- (id).cxx_construct;
- (int64_t)type;
- (uint64_t)getAssertionWithChallenge:(uint64_t)a1 origin:options:completionHandler:;
- (uint64_t)getAssertionWithMediationRequirement:(const void *)a1 clientDataHash:options:completionHandler:;
- (uint64_t)getAssertionWithMediationRequirement:(uint64_t)a1 clientDataHash:options:completionHandler:;
- (uint64_t)makeCredentialWithChallenge:(uint64_t)a1 origin:options:completionHandler:;
- (uint64_t)makeCredentialWithMediationRequirement:(const void *)a1 clientDataHash:options:completionHandler:;
- (uint64_t)makeCredentialWithMediationRequirement:(uint64_t)a1 clientDataHash:options:completionHandler:;
- (void)cancel;
- (void)dealloc;
- (void)getAssertionWithChallenge:(id)a3 origin:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)getAssertionWithChallenge:(uint64_t)a1 origin:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:;
- (void)getAssertionWithClientDataHash:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)getAssertionWithMediationRequirement:(int64_t)a3 clientDataHash:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)getAssertionWithMediationRequirement:(uint64_t)a1 clientDataHash:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:;
- (void)makeCredentialWithChallenge:(id)a3 origin:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)makeCredentialWithChallenge:(uint64_t)a1 origin:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:;
- (void)makeCredentialWithClientDataHash:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)makeCredentialWithMediationRequirement:(int64_t)a3 clientDataHash:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)makeCredentialWithMediationRequirement:(uint64_t)a1 clientDataHash:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:;
- (void)setDelegate:(id)a3;
- (void)setMockConfiguration:(id)a3;
@end

@implementation _WKWebAuthenticationPanel

- (_WKWebAuthenticationPanel)init
{
  v5.receiver = self;
  v5.super_class = (Class)_WKWebAuthenticationPanel;
  v2 = [(_WKWebAuthenticationPanel *)&v5 init];
  v3 = v2;
  if (v2) {
    *((void *)API::WebAuthenticationPanel::WebAuthenticationPanel((API::WebAuthenticationPanel *)[(_WKWebAuthenticationPanel *)v2 _apiObject])+ 1) = v2;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::WebAuthenticationPanel::~WebAuthenticationPanel((API::WebAuthenticationPanel *)&self->_panel, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKWebAuthenticationPanel;
    [(_WKWebAuthenticationPanel *)&v5 dealloc];
  }
}

- (_WKWebAuthenticationPanelDelegate)delegate
{
  m_ptr = self->_client.m_impl.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = *((void *)m_ptr + 1);
  if (!v3) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
  objc_super v5 = (void *)CFMakeCollectable(WeakRetained);

  return (_WKWebAuthenticationPanelDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  uint64_t v5 = WTF::fastMalloc((WTF *)0x28);
  WebKit::WebAuthenticationPanelClient::WebAuthenticationPanelClient(v5, (uint64_t)self, a3);
  uint64_t v12 = v5;
  uint64_t v7 = *(void *)(v5 + 8);
  if (v7) {
    goto LABEL_6;
  }
  uint64_t v7 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v7 = 1;
  *(void *)(v7 + 8) = v5;
  v8 = *(unsigned int **)(v5 + 8);
  *(void *)(v5 + 8) = v7;
  if (!v8) {
    goto LABEL_6;
  }
  if (atomic_fetch_add((atomic_uint *volatile)v8, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v8);
    WTF::fastFree((WTF *)v8, v6);
  }
  uint64_t v7 = *(void *)(v5 + 8);
  if (v7) {
LABEL_6:
  }
    atomic_fetch_add((atomic_uint *volatile)v7, 1u);
  m_ptr = (unsigned int *)self->_client.m_impl.m_ptr;
  self->_client.m_impl.m_ptr = (DefaultWeakPtrImpl *)v7;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, v6);
  }
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  uint64_t v11 = *(void *)&self->_panel.data.__lx[32];
  *(void *)&self->_panel.data.__lx[32] = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  std::unique_ptr<WebKit::WebAuthenticationPanelClient>::reset[abi:sn180100](&v12);
}

- (NSString)relyingPartyID
{
  v2 = *(WTF::StringImpl **)self->_anon_38;
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSSet)transports
{
  result = (NSSet *)self->_transports.m_ptr;
  if (!result)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:*(unsigned int *)&self->_anon_38[20]];
    uint64_t v5 = v4;
    if (v4) {
      CFRetain(v4);
    }
    m_ptr = self->_transports.m_ptr;
    self->_transports.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v7 = *(unsigned int *)&self->_anon_38[20];
    if (v7)
    {
      v8 = *(unsigned char **)&self->_anon_38[8];
      do
      {
        v9 = self->_transports.m_ptr;
        id v10 = objc_alloc(NSNumber);
        if (*v8 - 1 < 6) {
          uint64_t v11 = (*v8 - 1) + 1;
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = (const void *)[v10 initWithInt:v11];
        [v9 addObject:v12];
        if (v12) {
          CFRelease(v12);
        }
        ++v8;
        --v7;
      }
      while (v7);
    }
    return (NSSet *)self->_transports.m_ptr;
  }
  return result;
}

- (int64_t)type
{
  return self->_anon_38[24];
}

- (NSString)userName
{
  v2 = *(WTF::StringImpl **)&self->_anon_38[32];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

+ (id)getAllLocalAuthenticatorCredentials
{
  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)[NSString stringWithUTF8String:"com.apple.webkit.webauthn"], 0, 0);
  v2 = (void *)CFMakeCollectable(cf);

  return v2;
}

+ (id)getAllLocalAuthenticatorCredentialsWithAccessGroup:(id)a3
{
  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)a3, 0, 0);
  uint64_t v3 = (void *)CFMakeCollectable(cf);

  return v3;
}

+ (id)getAllLocalAuthenticatorCredentialsWithRPID:(id)a3
{
  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)[NSString stringWithUTF8String:"com.apple.webkit.webauthn"], (NSData *)a3, 0);
  uint64_t v3 = (void *)CFMakeCollectable(cf);

  return v3;
}

+ (id)getAllLocalAuthenticatorCredentialsWithCredentialID:(id)a3
{
  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)[NSString stringWithUTF8String:"com.apple.webkit.webauthn"], 0, (uint64_t)a3);
  uint64_t v3 = (void *)CFMakeCollectable(cf);

  return v3;
}

+ (id)getAllLocalAuthenticatorCredentialsWithRPIDAndAccessGroup:(id)a3 rpID:(id)a4
{
  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)a3, (NSData *)a4, 0);
  v4 = (void *)CFMakeCollectable(cf);

  return v4;
}

+ (id)getAllLocalAuthenticatorCredentialsWithCredentialIDAndAccessGroup:(id)a3 credentialID:(id)a4
{
  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)a3, 0, (uint64_t)a4);
  v4 = (void *)CFMakeCollectable(cf);

  return v4;
}

+ (void)deleteLocalAuthenticatorCredentialWithID:(id)a3
{
}

+ (void)deleteLocalAuthenticatorCredentialWithGroupAndID:(id)a3 credential:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  int shouldUseAlternateKeychainAttribute = WebKit::shouldUseAlternateKeychainAttribute((WebKit *)a1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = *MEMORY[0x1E4F3B9A0];
  uint64_t v9 = *MEMORY[0x1E4F3BD08];
  v13[0] = *MEMORY[0x1E4F3B978];
  v13[1] = v9;
  v14[0] = v8;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F3B878];
  v14[2] = *MEMORY[0x1E4F3B880];
  objc_msgSend(v7, "setDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  if (a3) {
    [v7 setObject:a3 forKey:*MEMORY[0x1E4F3B858]];
  }
  uint64_t v10 = *MEMORY[0x1E4F3B5C8];
  uint64_t v11 = *MEMORY[0x1E4F3B5D0];
  if (shouldUseAlternateKeychainAttribute) {
    uint64_t v12 = *MEMORY[0x1E4F3B5C8];
  }
  else {
    uint64_t v12 = *MEMORY[0x1E4F3B5D0];
  }
  [v7 setObject:a4 forKey:v12];
  SecItemDelete((CFDictionaryRef)v7);
  if (shouldUseAlternateKeychainAttribute)
  {
    [v7 removeObjectForKey:v10];
    [v7 setObject:a4 forKey:v11];
    SecItemDelete((CFDictionaryRef)v7);
  }
  if (v7) {
    CFRelease(v7);
  }
}

+ (void)setDisplayNameForLocalCredentialWithGroupAndID:(id)a3 credential:(id)a4 displayName:(id)a5
{
  v68[5] = *MEMORY[0x1E4F143B8];
  int shouldUseAlternateKeychainAttribute = WebKit::shouldUseAlternateKeychainAttribute((WebKit *)a1);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = *MEMORY[0x1E4F3B978];
  uint64_t v11 = *MEMORY[0x1E4F3B9A0];
  uint64_t v12 = *MEMORY[0x1E4F3BC68];
  v67[0] = *MEMORY[0x1E4F3B978];
  v67[1] = v12;
  v68[0] = v11;
  v68[1] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = *MEMORY[0x1E4F1CFD0];
  uint64_t v14 = *MEMORY[0x1E4F3B878];
  v67[2] = *MEMORY[0x1E4F3BC78];
  v67[3] = v14;
  uint64_t v50 = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B880];
  v68[2] = v13;
  v68[3] = v15;
  uint64_t v49 = v15;
  v67[4] = *MEMORY[0x1E4F3BD08];
  v68[4] = MEMORY[0x1E4F1CC38];
  objc_msgSend(v9, "setDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v68, v67, 5));
  if (a3) {
    [v9 setObject:a3 forKey:*MEMORY[0x1E4F3B858]];
  }
  uint64_t v16 = *MEMORY[0x1E4F3B5C8];
  uint64_t v17 = *MEMORY[0x1E4F3B5D0];
  if (shouldUseAlternateKeychainAttribute) {
    uint64_t v18 = *MEMORY[0x1E4F3B5C8];
  }
  else {
    uint64_t v18 = *MEMORY[0x1E4F3B5D0];
  }
  [v9 setObject:a4 forKey:v18];
  CFTypeRef result = 0;
  OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if (v19 == -25300) {
    int v20 = shouldUseAlternateKeychainAttribute;
  }
  else {
    int v20 = 0;
  }
  if (v20 == 1)
  {
    [v9 removeObjectForKey:v16];
    [v9 setObject:a4 forKey:v17];
    OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  }
  if (v19 && v19 != -25300) {
    goto LABEL_58;
  }
  v21 = (void *)result;
  uint64_t v48 = *MEMORY[0x1E4F3B5E0];
  v22 = objc_msgSend((id)result, "objectForKeyedSubscript:");
  v23 = v22;
  if (v22)
  {
    uint64_t v24 = [v22 bytes];
    unint64_t v25 = [v23 length];
    unint64_t v26 = v25;
    if (v25)
    {
      if (HIDWORD(v25))
      {
        __break(0xC471u);
        return;
      }
      uint64_t v27 = WTF::fastMalloc((WTF *)v25);
      v23 = (void *)v27;
      uint64_t v28 = 0;
      do
      {
        *(unsigned char *)(v27 + v28) = *(unsigned char *)(v24 + v28);
        ++v28;
      }
      while (v26 != v28);
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    LODWORD(v26) = 0;
  }
  v56[0] = (uint64_t)v23;
  v56[1] = v26;
  cbor::CBORReader::read();
  if (v23) {
    WTF::fastFree((WTF *)v23, v29);
  }
  if (v60)
  {
    if (v59[0] != 5)
    {
LABEL_55:
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v59);
      goto LABEL_56;
    }
    Map = (void *)cbor::CBORValue::getMap((cbor::CBORValue *)v59);
    uint64_t v46 = v11;
    uint64_t v47 = v10;
    v58[0] = 0;
    v58[1] = 0;
    v57 = v58;
    v31 = Map + 1;
    v32 = (void *)*Map;
    if ((void *)*Map == Map + 1)
    {
      char v33 = 0;
      if (!a5) {
        goto LABEL_48;
      }
    }
    else
    {
      char v33 = 0;
      do
      {
        if (*((_DWORD *)v32 + 8) == 3
          && (String = (void *)cbor::CBORValue::getString((cbor::CBORValue *)(v32 + 4)),
              MEMORY[0x19972E990](*String, "displayName", 11)))
        {
          if (a5)
          {
            MEMORY[0x19972EAD0](&v55, a5);
            cbor::CBORValue::CBORValue();
            cbor::CBORValue::clone((uint64_t *)&v51, (cbor::CBORValue *)(v32 + 4));
            v62 = &v51;
            std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v57, (cbor::CBORValue *)&v51);
            cbor::CBORValue::operator=();
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v51);
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
            v36 = v55;
            v55 = 0;
            if (v36)
            {
              if (*(_DWORD *)v36 == 2) {
                WTF::StringImpl::destroy(v36, v35);
              }
              else {
                *(_DWORD *)v36 -= 2;
              }
            }
          }
          char v33 = 1;
        }
        else
        {
          cbor::CBORValue::clone(v56, (cbor::CBORValue *)(v32 + 8));
          cbor::CBORValue::clone((uint64_t *)&v51, (cbor::CBORValue *)(v32 + 4));
          v62 = &v51;
          std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v57, (cbor::CBORValue *)&v51);
          cbor::CBORValue::operator=();
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v51);
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
        }
        v37 = (void *)v32[1];
        if (v37)
        {
          do
          {
            v38 = v37;
            v37 = (void *)*v37;
          }
          while (v37);
        }
        else
        {
          do
          {
            v38 = (void *)v32[2];
            BOOL v39 = *v38 == (void)v32;
            v32 = v38;
          }
          while (!v39);
        }
        v32 = v38;
      }
      while (v38 != v31);
      if (!a5)
      {
LABEL_48:
        cbor::CBORValue::CBORValue();
        cbor::CBORWriter::write();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
        if (!v54) {
          __break(1u);
        }
        v42 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v51 length:v53];
        uint64_t v65 = v48;
        v66 = v42;
        CFDictionaryRef v43 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v63[0] = *MEMORY[0x1E4F3BD40];
        v64[0] = objc_msgSend(v21, "objectForKey:");
        v64[1] = v46;
        v63[1] = v47;
        v63[2] = v50;
        v64[2] = v49;
        objc_msgSend(v9, "setDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v64, v63, 3));
        if (a3) {
          [v9 setObject:a3 forKey:*MEMORY[0x1E4F3B858]];
        }
        SecItemUpdate((CFDictionaryRef)v9, v43);
        if (v42) {
          CFRelease(v42);
        }
        if (v54)
        {
          v45 = v51;
          if (v51)
          {
            v51 = 0;
            int v52 = 0;
            WTF::fastFree(v45, v44);
          }
        }
        std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::destroy((uint64_t)&v57, v58[0]);
        if (!v60) {
          goto LABEL_56;
        }
        goto LABEL_55;
      }
    }
    if ((v33 & 1) == 0)
    {
      MEMORY[0x19972EAD0](&v55, a5);
      cbor::CBORValue::CBORValue();
      cbor::CBORValue::CBORValue();
      v62 = &v51;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v57, (cbor::CBORValue *)&v51);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v51);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
      v41 = v55;
      v55 = 0;
      if (v41)
      {
        if (*(_DWORD *)v41 == 2) {
          WTF::StringImpl::destroy(v41, v40);
        }
        else {
          *(_DWORD *)v41 -= 2;
        }
      }
    }
    goto LABEL_48;
  }
LABEL_56:
  if (v21) {
    CFRelease(v21);
  }
LABEL_58:
  if (v9) {
    CFRelease(v9);
  }
}

+ (void)setNameForLocalCredentialWithGroupAndID:(id)a3 credential:(id)a4 name:(id)a5
{
  v68[5] = *MEMORY[0x1E4F143B8];
  int shouldUseAlternateKeychainAttribute = WebKit::shouldUseAlternateKeychainAttribute((WebKit *)a1);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = *MEMORY[0x1E4F3B978];
  uint64_t v11 = *MEMORY[0x1E4F3B9A0];
  uint64_t v12 = *MEMORY[0x1E4F3BC68];
  v67[0] = *MEMORY[0x1E4F3B978];
  v67[1] = v12;
  v68[0] = v11;
  v68[1] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = *MEMORY[0x1E4F1CFD0];
  uint64_t v14 = *MEMORY[0x1E4F3B878];
  v67[2] = *MEMORY[0x1E4F3BC78];
  v67[3] = v14;
  uint64_t v50 = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B880];
  v68[2] = v13;
  v68[3] = v15;
  uint64_t v49 = v15;
  v67[4] = *MEMORY[0x1E4F3BD08];
  v68[4] = MEMORY[0x1E4F1CC38];
  objc_msgSend(v9, "setDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v68, v67, 5));
  if (a3) {
    [v9 setObject:a3 forKey:*MEMORY[0x1E4F3B858]];
  }
  uint64_t v16 = *MEMORY[0x1E4F3B5C8];
  uint64_t v17 = *MEMORY[0x1E4F3B5D0];
  if (shouldUseAlternateKeychainAttribute) {
    uint64_t v18 = *MEMORY[0x1E4F3B5C8];
  }
  else {
    uint64_t v18 = *MEMORY[0x1E4F3B5D0];
  }
  [v9 setObject:a4 forKey:v18];
  CFTypeRef result = 0;
  OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if (v19 == -25300) {
    int v20 = shouldUseAlternateKeychainAttribute;
  }
  else {
    int v20 = 0;
  }
  if (v20 == 1)
  {
    [v9 removeObjectForKey:v16];
    [v9 setObject:a4 forKey:v17];
    OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  }
  if (v19 && v19 != -25300) {
    goto LABEL_58;
  }
  v21 = (void *)result;
  uint64_t v48 = *MEMORY[0x1E4F3B5E0];
  v22 = objc_msgSend((id)result, "objectForKeyedSubscript:");
  v23 = v22;
  if (v22)
  {
    uint64_t v24 = [v22 bytes];
    unint64_t v25 = [v23 length];
    unint64_t v26 = v25;
    if (v25)
    {
      if (HIDWORD(v25))
      {
        __break(0xC471u);
        return;
      }
      uint64_t v27 = WTF::fastMalloc((WTF *)v25);
      v23 = (void *)v27;
      uint64_t v28 = 0;
      do
      {
        *(unsigned char *)(v27 + v28) = *(unsigned char *)(v24 + v28);
        ++v28;
      }
      while (v26 != v28);
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    LODWORD(v26) = 0;
  }
  v56[0] = (uint64_t)v23;
  v56[1] = v26;
  cbor::CBORReader::read();
  if (v23) {
    WTF::fastFree((WTF *)v23, v29);
  }
  if (v60)
  {
    if (v59[0] != 5)
    {
LABEL_55:
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v59);
      goto LABEL_56;
    }
    Map = (void *)cbor::CBORValue::getMap((cbor::CBORValue *)v59);
    uint64_t v46 = v11;
    uint64_t v47 = v10;
    v58[0] = 0;
    v58[1] = 0;
    v57 = v58;
    v31 = Map + 1;
    v32 = (void *)*Map;
    if ((void *)*Map == Map + 1)
    {
      char v33 = 0;
      if (!a5) {
        goto LABEL_48;
      }
    }
    else
    {
      char v33 = 0;
      do
      {
        if (*((_DWORD *)v32 + 8) == 3
          && (String = (void *)cbor::CBORValue::getString((cbor::CBORValue *)(v32 + 4)),
              MEMORY[0x19972E990](*String, "name", 4)))
        {
          if (a5)
          {
            MEMORY[0x19972EAD0](&v55, a5);
            cbor::CBORValue::CBORValue();
            cbor::CBORValue::clone((uint64_t *)&v51, (cbor::CBORValue *)(v32 + 4));
            v62 = &v51;
            std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v57, (cbor::CBORValue *)&v51);
            cbor::CBORValue::operator=();
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v51);
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
            v36 = v55;
            v55 = 0;
            if (v36)
            {
              if (*(_DWORD *)v36 == 2) {
                WTF::StringImpl::destroy(v36, v35);
              }
              else {
                *(_DWORD *)v36 -= 2;
              }
            }
          }
          char v33 = 1;
        }
        else
        {
          cbor::CBORValue::clone(v56, (cbor::CBORValue *)(v32 + 8));
          cbor::CBORValue::clone((uint64_t *)&v51, (cbor::CBORValue *)(v32 + 4));
          v62 = &v51;
          std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v57, (cbor::CBORValue *)&v51);
          cbor::CBORValue::operator=();
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v51);
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
        }
        v37 = (void *)v32[1];
        if (v37)
        {
          do
          {
            v38 = v37;
            v37 = (void *)*v37;
          }
          while (v37);
        }
        else
        {
          do
          {
            v38 = (void *)v32[2];
            BOOL v39 = *v38 == (void)v32;
            v32 = v38;
          }
          while (!v39);
        }
        v32 = v38;
      }
      while (v38 != v31);
      if (!a5)
      {
LABEL_48:
        cbor::CBORValue::CBORValue();
        cbor::CBORWriter::write();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
        if (!v54) {
          __break(1u);
        }
        v42 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v51 length:v53];
        uint64_t v65 = v48;
        v66 = v42;
        CFDictionaryRef v43 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v63[0] = *MEMORY[0x1E4F3BD40];
        v64[0] = objc_msgSend(v21, "objectForKey:");
        v64[1] = v46;
        v63[1] = v47;
        v63[2] = v50;
        v64[2] = v49;
        objc_msgSend(v9, "setDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v64, v63, 3));
        if (a3) {
          [v9 setObject:a3 forKey:*MEMORY[0x1E4F3B858]];
        }
        SecItemUpdate((CFDictionaryRef)v9, v43);
        if (v42) {
          CFRelease(v42);
        }
        if (v54)
        {
          v45 = v51;
          if (v51)
          {
            v51 = 0;
            int v52 = 0;
            WTF::fastFree(v45, v44);
          }
        }
        std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::destroy((uint64_t)&v57, v58[0]);
        if (!v60) {
          goto LABEL_56;
        }
        goto LABEL_55;
      }
    }
    if ((v33 & 1) == 0)
    {
      MEMORY[0x19972EAD0](&v55, a5);
      cbor::CBORValue::CBORValue();
      cbor::CBORValue::CBORValue();
      v62 = &v51;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v57, (cbor::CBORValue *)&v51);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v51);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
      v41 = v55;
      v55 = 0;
      if (v41)
      {
        if (*(_DWORD *)v41 == 2) {
          WTF::StringImpl::destroy(v41, v40);
        }
        else {
          *(_DWORD *)v41 -= 2;
        }
      }
    }
    goto LABEL_48;
  }
LABEL_56:
  if (v21) {
    CFRelease(v21);
  }
LABEL_58:
  if (v9) {
    CFRelease(v9);
  }
}

+ (id)importLocalAuthenticatorCredential:(id)a3 error:(id *)a4
{
  uint64_t v7 = [NSString stringWithUTF8String:"com.apple.webkit.webauthn"];

  return (id)[a1 importLocalAuthenticatorWithAccessGroup:v7 credential:a3 error:a4];
}

+ (id)importLocalAuthenticatorWithAccessGroup:(id)a3 credential:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v86[3] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v8 = [a4 bytes];
    id result = (id)[v6 length];
    uint64_t v10 = (char *)result;
    if (result)
    {
      if ((unint64_t)result >> 32)
      {
        __break(0xC471u);
        goto LABEL_116;
      }
      uint64_t v11 = WTF::fastMalloc((WTF *)result);
      id v6 = (id)v11;
      uint64_t v12 = 0;
      do
      {
        v12[v11] = v12[v8];
        ++v12;
      }
      while (v10 != v12);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    LODWORD(v10) = 0;
  }
  v81 = (WTF *)v6;
  uint64_t v82 = v10;
  cbor::CBORReader::read();
  if (v6) {
    WTF::fastFree((WTF *)v6, v13);
  }
  if (v84 && v83[0] == 5)
  {
    uint64_t Map = cbor::CBORValue::getMap((cbor::CBORValue *)v83);
    cbor::CBORValue::CBORValue((cbor::CBORValue *)&v81, "priv");
    uint64_t v15 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v81);
    cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v81);
    uint64_t v16 = (void *)(Map + 8);
    if ((void *)(Map + 8) != v15)
    {
      int v18 = *((_DWORD *)v15 + 16);
      uint64_t v17 = (cbor::CBORValue *)(v15 + 8);
      if (v18 == 2)
      {
        uint64_t ByteString = cbor::CBORValue::getByteString(v17);
        CFDataRef v20 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)ByteString length:*(unsigned int *)(ByteString + 12)];
        cbor::CBORValue::CBORValue((cbor::CBORValue *)&v81, "key_type");
        v21 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v81);
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v81);
        if (v16 == v21 || (unsigned int v23 = *((_DWORD *)v21 + 16), v22 = (cbor::CBORValue *)(v21 + 8), v23 >= 2))
        {
          if (!a5) {
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v24 = *(void *)cbor::CBORValue::getInteger(v22);
          cbor::CBORValue::CBORValue((cbor::CBORValue *)&v81, "key_size");
          unint64_t v25 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v81);
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v81);
          if (v16 != v25)
          {
            unsigned int v27 = *((_DWORD *)v25 + 16);
            unint64_t v26 = (cbor::CBORValue *)(v25 + 8);
            if (v27 < 2)
            {
              uint64_t v28 = *(void *)cbor::CBORValue::getInteger(v26);
              cbor::CBORValue::CBORValue((cbor::CBORValue *)&v81, "rp");
              v29 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v81);
              cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v81);
              if (v16 != v29)
              {
                int v31 = *((_DWORD *)v29 + 16);
                v30 = (cbor::CBORValue *)(v29 + 8);
                if (v31 == 3)
                {
                  v32 = *(WTF::StringImpl **)cbor::CBORValue::getString(v30);
                  if (v32) {
                    *(_DWORD *)v32 += 2;
                  }
                  cbor::CBORValue::CBORValue((cbor::CBORValue *)&v81, "tag");
                  char v33 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v81);
                  cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v81);
                  if (v16 == v33 || (int v36 = *((_DWORD *)v33 + 16), v35 = (cbor::CBORValue *)(v33 + 8), v36 != 5))
                  {
                    id v44 = 0;
                    if (a5) {
                      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
                    }
                    goto LABEL_106;
                  }
                  uint64_t v37 = cbor::CBORValue::getMap(v35);
                  MEMORY[0x19972F0A0](&v81, v37);
                  cbor::CBORWriter::write();
                  cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v81);
                  v85[0] = *MEMORY[0x1E4F3B718];
                  uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v24);
                  uint64_t v39 = *MEMORY[0x1E4F3B6D8];
                  uint64_t v40 = *MEMORY[0x1E4F3B6E8];
                  v86[0] = v38;
                  v86[1] = v40;
                  uint64_t v41 = *MEMORY[0x1E4F3B708];
                  v85[1] = v39;
                  v85[2] = v41;
                  v86[2] = [NSNumber numberWithLongLong:v28];
                  CFErrorRef error = 0;
                  v42 = SecKeyCreateWithData(v20, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3], &error);
                  CFDictionaryRef v43 = v42;
                  if (error)
                  {
                    id v44 = 0;
                    if (a5) {
                      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
                    }
LABEL_103:
                    if (v43) {
                      CFRelease(v43);
                    }
                    if (v80)
                    {
                      v67 = v77;
                      if (v77)
                      {
                        v77 = 0;
                        int v78 = 0;
                        WTF::fastFree(v67, v34);
                      }
                    }
LABEL_106:
                    if (v32)
                    {
                      if (*(_DWORD *)v32 == 2) {
                        WTF::StringImpl::destroy(v32, (WTF::StringImpl *)v34);
                      }
                      else {
                        *(_DWORD *)v32 -= 2;
                      }
                    }
                    goto LABEL_39;
                  }
                  uint64_t v46 = SecKeyCopyPublicKey(v42);
                  CFDataRef v47 = SecKeyCopyExternalRepresentation(v46, &error);
                  CFDataRef v48 = v47;
                  if (error)
                  {
                    id v44 = 0;
                    if (a5) {
                      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
                    }
LABEL_99:
                    if (v48) {
                      CFRelease(v48);
                    }
                    if (v46) {
                      CFRelease(v46);
                    }
                    goto LABEL_103;
                  }
                  v70 = v46;
                  CFDataRef v71 = v47;
                  PAL::CryptoDigest::create();
                  if (v48)
                  {
                    [(__CFData *)v48 bytes];
                    [(__CFData *)v71 length];
                  }
                  PAL::CryptoDigest::addBytes();
                  PAL::CryptoDigest::computeHash((uint64_t *)&v81, v75);
                  CFTypeRef cf = (WebKit *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v81 length:HIDWORD(v82)];
                  int shouldUseAlternateKeychainAttribute = WebKit::shouldUseAlternateKeychainAttribute(cf);
                  id v49 = objc_alloc(MEMORY[0x1E4F1CA60]);
                  if (v32) {
                    uint64_t v50 = (__CFString *)WTF::StringImpl::operator NSString *();
                  }
                  else {
                    uint64_t v50 = &stru_1EEA10550;
                  }
                  uint64_t v68 = *MEMORY[0x1E4F3BD08];
                  uint64_t v69 = *MEMORY[0x1E4F3B788];
                  query = (WebKit *)objc_msgSend(v49, "initWithObjectsAndKeys:", *MEMORY[0x1E4F3B9A0], *MEMORY[0x1E4F3B978], v40, v39, v50, *MEMORY[0x1E4F3B788], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F3BD08], 0);
                  v51 = (WebKit *)WebKit::getASCWebKitSPISupportClass[0](query);
                  if (v51
                    && [(id)WebKit::getASCWebKitSPISupportClass[0](v51) shouldUseAlternateCredentialStore])
                  {
                    [(WebKit *)query setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3B878]];
                  }
                  uint64_t v52 = *MEMORY[0x1E4F3B5C8];
                  uint64_t v53 = *MEMORY[0x1E4F3B5D0];
                  if (shouldUseAlternateKeychainAttribute) {
                    uint64_t v54 = *MEMORY[0x1E4F3B5C8];
                  }
                  else {
                    uint64_t v54 = *MEMORY[0x1E4F3B5D0];
                  }
                  [(WebKit *)query setObject:cf forKey:v54];
                  if (a3) {
                    [(WebKit *)query setObject:a3 forKey:*MEMORY[0x1E4F3B550]];
                  }
                  id result = (id)SecItemCopyMatching(query, 0);
                  if (result == -25300) {
                    int v55 = shouldUseAlternateKeychainAttribute;
                  }
                  else {
                    int v55 = 0;
                  }
                  if (v55 == 1)
                  {
                    [(WebKit *)query removeObjectForKey:v52];
                    [(WebKit *)query setObject:cf forKey:v53];
                    id result = (id)SecItemCopyMatching(query, 0);
                  }
                  if (!result)
                  {
                    id v44 = 0;
                    if (a5) {
                      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:15 userInfo:0];
                    }
                    uint64_t v46 = v70;
                    CFDataRef v48 = v71;
                    v62 = cf;
                    v63 = query;
                    goto LABEL_91;
                  }
                  if (v80)
                  {
                    v56 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v77 length:v79];
                    id v57 = objc_alloc(MEMORY[0x1E4F1CA60]);
                    if (v32) {
                      v58 = (__CFString *)WTF::StringImpl::operator NSString *();
                    }
                    else {
                      v58 = &stru_1EEA10550;
                    }
                    v59 = (WebKit *)objc_msgSend(v57, "initWithObjectsAndKeys:", v43, *MEMORY[0x1E4F3BD48], v40, v39, v58, v69, v56, *MEMORY[0x1E4F3B5E0], MEMORY[0x1E4F1CC38], v68, *MEMORY[0x1E4F3B570], *MEMORY[0x1E4F3B558], 0);
                    char v60 = (WebKit *)WebKit::getASCWebKitSPISupportClass[0](v59);
                    if (v60
                      && [(id)WebKit::getASCWebKitSPISupportClass[0](v60) shouldUseAlternateCredentialStore])
                    {
                      [(WebKit *)v59 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3B878]];
                    }
                    if (a3) {
                      [(WebKit *)v59 setObject:a3 forKey:*MEMORY[0x1E4F3B550]];
                    }
                    if (SecItemAdd(v59, 0))
                    {
                      id v44 = 0;
                      if (a5) {
                        *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
                      }
                    }
                    else
                    {
                      v61 = (void *)CFMakeCollectable(cf);
                      CFTypeRef cf = 0;
                      id v44 = v61;
                    }
                    uint64_t v46 = v70;
                    v62 = cf;
                    v63 = query;
                    if (v59) {
                      CFRelease(v59);
                    }
                    if (v56) {
                      CFRelease(v56);
                    }
                    CFDataRef v48 = v71;
LABEL_91:
                    if (v63) {
                      CFRelease(v63);
                    }
                    if (v62) {
                      CFRelease(v62);
                    }
                    v64 = v81;
                    if (v81)
                    {
                      v81 = 0;
                      LODWORD(v82) = 0;
                      WTF::fastFree(v64, v34);
                    }
                    if (v75)
                    {
                      PAL::CryptoDigest::~CryptoDigest(v75);
                      WTF::fastFree(v65, v66);
                    }
                    goto LABEL_99;
                  }
LABEL_116:
                  __break(1u);
                  return result;
                }
              }
              if (a5) {
                goto LABEL_37;
              }
LABEL_38:
              id v44 = 0;
LABEL_39:
              if (v20) {
                CFRelease(v20);
              }
              goto LABEL_41;
            }
          }
          if (!a5) {
            goto LABEL_38;
          }
        }
LABEL_37:
        id v44 = 0;
        *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
        goto LABEL_39;
      }
    }
    if (a5)
    {
      v45 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
      goto LABEL_29;
    }
LABEL_30:
    id v44 = 0;
    goto LABEL_41;
  }
  if (!a5) {
    goto LABEL_30;
  }
  v45 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
LABEL_29:
  id v44 = 0;
  *a5 = v45;
LABEL_41:
  if (v84) {
    cbor::CBORValue::~CBORValue((cbor::CBORValue *)v83);
  }
  return v44;
}

+ (id)exportLocalAuthenticatorCredentialWithID:(id)a3 error:(id *)a4
{
  return (id)[a1 exportLocalAuthenticatorCredentialWithGroupAndID:0 credential:a3 error:a4];
}

+ (id)exportLocalAuthenticatorCredentialWithGroupAndID:(id)a3 credential:(id)a4 error:(id *)a5
{
  int shouldUseAlternateKeychainAttribute = WebKit::shouldUseAlternateKeychainAttribute((WebKit *)a1);
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = *MEMORY[0x1E4F3BC80];
  uint64_t v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", *MEMORY[0x1E4F3B9A0], *MEMORY[0x1E4F3B978], *MEMORY[0x1E4F3B6E8], *MEMORY[0x1E4F3B6D8], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F3BC80], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F3BD08], *MEMORY[0x1E4F3B880], *MEMORY[0x1E4F3B878], 0);
  uint64_t v12 = v11;
  if (a3) {
    [v11 setObject:a3 forKey:*MEMORY[0x1E4F3B858]];
  }
  uint64_t v13 = *MEMORY[0x1E4F3B5C8];
  uint64_t v14 = *MEMORY[0x1E4F3B5D0];
  if (shouldUseAlternateKeychainAttribute) {
    uint64_t v15 = *MEMORY[0x1E4F3B5C8];
  }
  else {
    uint64_t v15 = *MEMORY[0x1E4F3B5D0];
  }
  [v12 setObject:a4 forKey:v15];
  CFTypeRef result = 0;
  OSStatus v16 = SecItemCopyMatching((CFDictionaryRef)v12, &result);
  if (v16 == -25300) {
    int v17 = shouldUseAlternateKeychainAttribute;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1)
  {
    [v12 removeObjectForKey:v13];
    [v12 setObject:a4 forKey:v14];
    OSStatus v16 = SecItemCopyMatching((CFDictionaryRef)v12, &result);
  }
  if (v16 != -25300 && v16)
  {
    CFTypeRef v21 = 0;
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:17 userInfo:0];
    }
    goto LABEL_62;
  }
  CFTypeRef v18 = result;
  CFErrorRef error = 0;
  OSStatus v19 = (NSData *)SecKeyCopyExternalRepresentation((SecKeyRef)result, &error);
  CFErrorRef v20 = error;
  if (error)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:17 userInfo:0];
    }
    CFRelease(v20);
LABEL_17:
    CFTypeRef v21 = 0;
    goto LABEL_59;
  }
  [v12 removeObjectForKey:v10];
  [v12 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC68]];
  CFTypeRef v48 = 0;
  OSStatus v22 = SecItemCopyMatching((CFDictionaryRef)v12, &v48);
  if (v22 != -25300 && v22)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:17 userInfo:0];
    }
    goto LABEL_17;
  }
  unsigned int v23 = (void *)v48;
  uint64_t v46 = 0;
  uint64_t valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)[(id)v48 objectForKeyedSubscript:*MEMORY[0x1E4F3B718]], kCFNumberSInt64Type, &valuePtr))
  {
    if (CFNumberGetValue((CFNumberRef)[v23 objectForKeyedSubscript:*MEMORY[0x1E4F3B708]], kCFNumberSInt64Type, &v46))
    {
      v45[0] = 0;
      v45[1] = 0;
      id v44 = v45;
      WebCore::toBufferSource((WebCore *)&v37, v19);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v41, (const WebCore::BufferSource *)&v37);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v43, "priv");
      v51 = (WTF **)v43;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v44, (cbor::CBORValue *)v43);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v43);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v41);
      if (v38 != -1) {
        ((void (*)(void *, WTF **))off_1EE9CC2E8[v38])(v43, &v37);
      }
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v41);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v43, "key_type");
      uint64_t v37 = (WTF *)v43;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v44, (cbor::CBORValue *)v43);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v43);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v41);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v41);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v43, "key_size");
      uint64_t v37 = (WTF *)v43;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v44, (cbor::CBORValue *)v43);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v43);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v41);
      MEMORY[0x19972EAD0](&v51, [v23 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]]);
      cbor::CBORValue::CBORValue();
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v43, "rp");
      uint64_t v37 = (WTF *)v43;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v44, (cbor::CBORValue *)v43);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v43);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v41);
      unint64_t v25 = (WTF::StringImpl *)v51;
      v51 = 0;
      if (v25)
      {
        if (*(_DWORD *)v25 == 2) {
          WTF::StringImpl::destroy(v25, v24);
        }
        else {
          *(_DWORD *)v25 -= 2;
        }
      }
      unsigned int v27 = (void *)[v23 objectForKeyedSubscript:*MEMORY[0x1E4F3B5E0]];
      uint64_t v28 = v27;
      if (!v27)
      {
        LODWORD(v31) = 0;
        goto LABEL_44;
      }
      uint64_t v29 = [v27 bytes];
      id v30 = (id)[v28 length];
      int v31 = (char *)v30;
      if (!v30) {
        goto LABEL_69;
      }
      if ((unint64_t)v30 >> 32)
      {
        __break(0xC471u);
        return v30;
      }
      uint64_t v32 = WTF::fastMalloc((WTF *)v30);
      uint64_t v28 = (void *)v32;
      char v33 = 0;
      do
      {
        v33[v32] = v33[v29];
        ++v33;
      }
      while (v31 != v33);
      while (1)
      {
LABEL_44:
        v43[0] = v28;
        v43[1] = v31;
        cbor::CBORReader::read();
        if (v28) {
          WTF::fastFree((WTF *)v28, v34);
        }
        if (!v42 || v41[0] != 5) {
          break;
        }
        cbor::CBORValue::CBORValue();
        a5 = (id *)&v37;
        cbor::CBORValue::CBORValue((cbor::CBORValue *)&v37, "tag");
        v51 = &v37;
        std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v44, (cbor::CBORValue *)&v37);
        cbor::CBORValue::operator=();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v37);
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v43);
        cbor::CBORValue::CBORValue();
        cbor::CBORWriter::write();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v43);
        if (v40)
        {
          CFTypeRef v21 = (id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v37 length:v39]);
          if (v40)
          {
            int v36 = v37;
            if (v37)
            {
              uint64_t v37 = 0;
              int v38 = 0;
              WTF::fastFree(v36, v35);
            }
          }
          goto LABEL_54;
        }
        std::__throw_bad_optional_access[abi:sn180100]();
        __break(1u);
LABEL_69:
        uint64_t v28 = 0;
      }
      CFTypeRef v21 = 0;
      if (a5) {
        *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
      }
LABEL_54:
      if (v42) {
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v41);
      }
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::destroy((uint64_t)&v44, v45[0]);
      goto LABEL_57;
    }
    if (a5)
    {
      unint64_t v26 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
      goto LABEL_36;
    }
  }
  else if (a5)
  {
    unint64_t v26 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:16 userInfo:0];
LABEL_36:
    CFTypeRef v21 = 0;
    *a5 = v26;
    goto LABEL_57;
  }
  CFTypeRef v21 = 0;
LABEL_57:
  if (v23) {
    CFRelease(v23);
  }
LABEL_59:
  if (v19)
  {
    CFRelease(v19);
    if (!v18) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
  if (v18) {
LABEL_61:
  }
    CFRelease(v18);
LABEL_62:
  if (v12) {
    CFRelease(v12);
  }
  return (id)v21;
}

- (void)cancel
{
}

+ (PublicKeyCredentialCreationOptions)convertToCoreCreationOptionsWithOptions:(SEL)a3
{
  retstr->var0.var2.BOOL var1 = 0;
  retstr->var0.var0.m_impl.m_ptr = 0;
  retstr->var0.var1.m_impl.m_ptr = 0;
  retstr->var0.var2.var0.var0 = 0;
  retstr->var1.var0.m_impl.m_ptr = 0;
  p_BOOL var1 = &retstr->var1;
  retstr->var1.var3.m_impl.m_ptr = 0;
  p_var3 = &retstr->var1.var3;
  retstr->var1.var1.m_impl.m_ptr = 0;
  retstr->var1.var2.var0.var0.var0.var1.var0.var0 = 0;
  retstr->var1.var2.var0.var0.BOOL var1 = 0;
  retstr->var3.var0 = 0;
  uint64_t v8 = &retstr->var3;
  retstr->var4.__engaged_ = 0;
  retstr->var6.BOOL var1 = 0;
  retstr->var8.var0.var1.BOOL var1 = 0;
  id v9 = &retstr->var8.var0.var1.var1;
  LOBYTE(retstr[1].var0.var0.m_impl.m_ptr) = 0;
  retstr->var2.var0.var0.var0.var1.var0.var0 = 0;
  retstr->var2.var0.var0.BOOL var1 = 0;
  *(void *)&retstr->var3.BOOL var1 = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var5.var0 = 0;
  *(void *)&retstr->var5.BOOL var1 = 0;
  p_var5 = (WebCore::PublicKeyCredentialDescriptor **)&retstr->var5;
  retstr->var6.var0.var0 = 0;
  uint64_t v11 = (void *)[a4 relyingParty];
  LOBYTE(v69) = 0;
  LOBYTE(v68) = 0;
  MEMORY[0x19972EAD0](&v72, [v11 name]);
  v67.super.isa = v72;
  MEMORY[0x19972EAD0](&v72, [v11 icon]);
  v67._appid = (NSString *)v72;
  MEMORY[0x19972EAD0](&v68, [v11 identifier]);
  LOBYTE(v69) = 1;
  isa = (StringImpl *)v67.super.isa;
  v67.super.isa = 0;
  m_ptr = retstr->var0.var0.m_impl.m_ptr;
  retstr->var0.var0.m_impl.m_ptr = isa;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v12);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }
  appid = (StringImpl *)v67._appid;
  v67._appid = 0;
  OSStatus v16 = retstr->var0.var1.m_impl.m_ptr;
  retstr->var0.var1.m_impl.m_ptr = appid;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v16, v12);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  std::__optional_storage_base<WTF::String,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::String,false>>((uint64_t)&retstr->var0.var2, (uint64_t)&v68);
  if ((_BYTE)v69)
  {
    CFTypeRef v18 = v68;
    uint64_t v68 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v17);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
  }
  OSStatus v19 = (WTF::StringImpl *)v67._appid;
  v67._appid = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v17);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  CFErrorRef v20 = v67.super.isa;
  v67.super.isa = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy(v20, v17);
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  CFTypeRef v21 = (void *)[a4 user];
  v70 = 0;
  uint64_t v68 = 0;
  int v69 = 0;
  MEMORY[0x19972EAD0](&v72, [v21 name]);
  OSStatus v22 = v72;
  v72 = 0;
  v67.super.isa = v22;
  MEMORY[0x19972EAD0](&v72, [v21 icon]);
  unsigned int v23 = (NSString *)v72;
  v72 = 0;
  v67._appid = v23;
  WebCore::toBufferSource((WebCore *)&v72, (NSData *)[v21 identifier]);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>>::__generic_assign[abi:sn180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>,(std::__variant_detail::_Trait)1>>((uint64_t)&v68, (uint64_t)&v72);
  if (v73 != -1) {
    ((void (*)(unsigned char *, objc_class **))off_1EE9CC2E8[v73])(v74, &v72);
  }
  MEMORY[0x19972EAD0](&v72, [v21 displayName]);
  unint64_t v25 = v72;
  v72 = 0;
  unint64_t v26 = v70;
  v70 = v25;
  if (v26)
  {
    int v27 = *(_DWORD *)v26 - 2;
    if (*(_DWORD *)v26 != 2) {
      goto LABEL_28;
    }
    WTF::StringImpl::destroy(v26, v24);
    unint64_t v26 = v72;
    v72 = 0;
    if (!v26) {
      goto LABEL_29;
    }
    int v27 = *(_DWORD *)v26 - 2;
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy(v26, v24);
    }
    else {
LABEL_28:
    }
      *(_DWORD *)unint64_t v26 = v27;
  }
LABEL_29:
  Class v28 = v67.super.isa;
  v67.super.isa = 0;
  uint64_t v29 = (WTF::StringImpl *)p_var1->var0.m_impl.m_ptr;
  p_var1->var0.m_impl.m_ptr = (StringImpl *)v28;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy(v29, v24);
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
  id v30 = (StringImpl *)v67._appid;
  v67._appid = 0;
  int v31 = retstr->var1.var1.m_impl.m_ptr;
  retstr->var1.var1.m_impl.m_ptr = v30;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v31, v24);
    }
    else {
      *(_DWORD *)v31 -= 2;
    }
  }
  std::__variant_detail::__assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>>::__generic_assign[abi:sn180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>,(std::__variant_detail::_Trait)1>>((uint64_t)&retstr->var1.var2, (uint64_t)&v68);
  char v33 = v70;
  v70 = 0;
  v34 = (WTF::StringImpl *)p_var3->m_impl.m_ptr;
  p_var3->m_impl.m_ptr = (StringImpl *)v33;
  if (v34)
  {
    if (*(_DWORD *)v34 == 2) {
      WTF::StringImpl::destroy(v34, v32);
    }
    else {
      *(_DWORD *)v34 -= 2;
    }
    v35 = v70;
    v70 = 0;
    if (v35)
    {
      if (*(_DWORD *)v35 == 2) {
        WTF::StringImpl::destroy(v35, v32);
      }
      else {
        *(_DWORD *)v35 -= 2;
      }
    }
  }
  if (v69 != -1) {
    ((void (*)(objc_class **, WTF::StringImpl **))off_1EE9CC2E8[v69])(&v72, &v68);
  }
  int v69 = -1;
  int v36 = (WTF::StringImpl *)v67._appid;
  v67._appid = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 2) {
      WTF::StringImpl::destroy(v36, v32);
    }
    else {
      *(_DWORD *)v36 -= 2;
    }
  }
  uint64_t v37 = v67.super.isa;
  v67.super.isa = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 2) {
      WTF::StringImpl::destroy(v37, v32);
    }
    else {
      *(_DWORD *)v37 -= 2;
    }
  }
  int v38 = (void *)[a4 publicKeyCredentialParamaters];
  CFTypeRef result = (PublicKeyCredentialCreationOptions *)[v38 count];
  uint64_t v41 = result;
  if (result)
  {
    if ((unint64_t)result >> 28)
    {
      __break(0xC471u);
      return result;
    }
    char v42 = (Parameters *)WTF::fastMalloc((WTF *)(16 * (void)result));
    CFDictionaryRef v43 = 0;
    id v44 = (uint64_t *)((char *)v42 + 8);
    do
    {
      uint64_t v45 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "objectAtIndexedSubscript:", v43), "algorithm"), "longLongValue");
      *(v44 - 1) = 0;
      uint64_t *v44 = v45;
      CFDictionaryRef v43 = (PublicKeyCredentialCreationOptions *)((char *)v43 + 1);
      v44 += 2;
    }
    while (v41 != v43);
  }
  else
  {
    char v42 = 0;
  }
  var0 = (WTF *)v8->var0;
  if (v8->var0)
  {
    retstr->var3.var0 = 0;
    retstr->var3.BOOL var1 = 0;
    WTF::fastFree(var0, v40);
  }
  retstr->var3.var0 = v42;
  retstr->var3.BOOL var1 = v41;
  retstr->var3.unsigned int var2 = v41;
  if ([a4 timeout])
  {
    retstr->var4.var0.__val_ = objc_msgSend((id)objc_msgSend(a4, "timeout"), "unsignedIntValue");
    retstr->var4.__engaged_ = 1;
  }
  if ([a4 excludeCredentials])
  {
    publicKeyCredentialDescriptors((uint64_t)&v67, (void *)[a4 excludeCredentials]);
    unsigned int var2 = retstr->var5.var2;
    if (var2) {
      WTF::VectorDestructor<true,WebCore::PublicKeyCredentialDescriptor>::destruct(*p_var5, (WebCore::PublicKeyCredentialDescriptor *)((char *)*p_var5 + 40 * var2));
    }
    id v49 = *p_var5;
    if (*p_var5)
    {
      retstr->var5.var0 = 0;
      retstr->var5.BOOL var1 = 0;
      WTF::fastFree(v49, v47);
    }
    retstr->var5.var0 = (PublicKeyCredentialDescriptor *)v67.super.isa;
    uint64_t v50 = v67._appid;
    v67.super.isa = 0;
    v67._appid = 0;
    *(void *)&retstr->var5.BOOL var1 = v50;
    WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v67);
  }
  if ([a4 authenticatorSelection])
  {
    v51 = (void *)[a4 authenticatorSelection];
    uint64_t v52 = [v51 authenticatorAttachment];
    if (v52 == 2)
    {
      int v53 = 1;
    }
    else
    {
      if (v52 != 1)
      {
        int v53 = 0;
        int v54 = 0;
        goto LABEL_78;
      }
      int v53 = 0;
    }
    int v54 = 1;
LABEL_78:
    unint64_t v55 = [v51 residentKey];
    int v56 = [v51 requireResidentKey];
    unint64_t v57 = [v51 userVerification];
    unint64_t v58 = v57 << 40;
    if (v57 >= 3) {
      WORD2(v58) = 256;
    }
    __int16 v59 = WORD2(v58) | (v56 != 0);
    unsigned int v60 = ((0x2010000u >> (8 * v55)) & 3 | (unsigned __int16)((unsigned __int16)(0x1010100u >> (8 * v55)) << 8)) << 16;
    if (v55 >= 4) {
      unsigned int v60 = 16842752;
    }
    BOOL var1 = retstr->var6.var1;
    *(_WORD *)&retstr->var6.var0.var1.unsigned int var2 = v59;
    *(_DWORD *)&retstr->var6.var0.var0 = v60 | v53 | (v54 << 8);
    if (!var1) {
      retstr->var6.BOOL var1 = 1;
    }
  }
  unint64_t v62 = [a4 attestation];
  if (v62 >= 4) {
    char v63 = 0;
  }
  else {
    char v63 = v62;
  }
  retstr->var8.var0.var0 = v63;
  if ([a4 extensionsCBOR])
  {
    v64 = (void *)[a4 extensionsCBOR];
    uint64_t v65 = v64;
    if (v64)
    {
      [v64 bytes];
      [v65 length];
    }
    WebCore::AuthenticationExtensionsClientInputs::fromCBOR();
    std::__optional_storage_base<WebCore::AuthenticationExtensionsClientInputs,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebCore::AuthenticationExtensionsClientInputs,false>>((WebCore::AuthenticationExtensionsClientInputs *)v9, (uint64_t)&v67);
    return (PublicKeyCredentialCreationOptions *)std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v67);
  }
  else
  {
    authenticationExtensionsClientInputs(&v67, (void *)[a4 extensions]);
    std::optional<WebCore::AuthenticationExtensionsClientInputs>::operator=[abi:sn180100]<WebCore::AuthenticationExtensionsClientInputs,void>((uint64_t)v9, (uint64_t)&v67);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::PRFInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::PRFInputs *)&v71);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs *)&v68);
    CFTypeRef result = (PublicKeyCredentialCreationOptions *)v67.super.isa;
    v67.super.isa = 0;
    if (result)
    {
      if (LODWORD(result->var0.var0.m_impl.m_ptr) == 2) {
        return (PublicKeyCredentialCreationOptions *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v66);
      }
      else {
        LODWORD(result->var0.var0.m_impl.m_ptr) -= 2;
      }
    }
  }
  return result;
}

- (void)makeCredentialWithChallenge:(id)a3 origin:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  *(void *)&v29[352] = *MEMORY[0x1E4F143B8];
  produceClientDataJson(&v20, 0, a3, (uint64_t)a4, 0);
  id v9 = v20;
  produceClientDataJsonHash(&v18, v20);
  uint64_t v10 = _Block_copy(a6);
  CFErrorRef v20 = 0;
  v21[0] = v18.super.isa;
  uint64_t v11 = v19;
  v18.super.isa = 0;
  uint64_t v19 = 0;
  v21[1] = v11;
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:a5];
  WebCore::PublicKeyCredentialCreationOptions::PublicKeyCredentialCreationOptions((uint64_t)v22, (uint64_t)v17);
  v22[74] = 0;
  uint64_t v23 = 0;
  char v24 = 0;
  uint64_t v25 = 0;
  char v26 = 0;
  char v27 = 0;
  __int16 v28 = 0;
  WebCore::ResourceRequest::ResourceRequest((StringImpl *)v29);
  v29[272] = 0;
  *(_DWORD *)&v29[280] = 0;
  *(_WORD *)&v29[284] = 0;
  v29[312] = 0;
  v29[344] = 0;
  memset(&v29[200], 0, 57);
  memset(&v29[288], 0, 18);
  uint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x18);
  *uint64_t v12 = &unk_1EE9CC318;
  v12[1] = v10;
  v12[2] = v9;
  OSStatus v16 = v12;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)v21, (uint64_t)&v16);
  uint64_t v13 = v16;
  OSStatus v16 = 0;
  if (v13) {
    (*(void (**)(void *))(*v13 + 8))(v13);
  }
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)v21);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v17);
  _Block_release(0);
  isa = v18.super.isa;
  if (v18.super.isa)
  {
    v18.super.isa = 0;
    LODWORD(v19) = 0;
    WTF::fastFree(isa, v14);
  }
}

- (void)makeCredentialWithMediationRequirement:(int64_t)a3 clientDataHash:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  *(void *)&v30[352] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = _Block_copy(a6);
  if (a4)
  {
    uint64_t v11 = [a4 bytes];
    unint64_t v12 = [a4 length];
    unint64_t v13 = v12;
    uint64_t v21 = 0;
    LODWORD(v22) = 0;
    HIDWORD(v22) = v12;
    if (v12)
    {
      if (HIDWORD(v12))
      {
        __break(0xC471u);
        return;
      }
      uint64_t v14 = WTF::fastMalloc((WTF *)v12);
      uint64_t v15 = 0;
      LODWORD(v22) = v13;
      uint64_t v21 = v14;
      do
      {
        *(unsigned char *)(v14 + v15) = *(unsigned char *)(v11 + v15);
        ++v15;
      }
      while (v13 != v15);
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:a5];
  WebCore::PublicKeyCredentialCreationOptions::PublicKeyCredentialCreationOptions((uint64_t)v23, (uint64_t)v20);
  v23[74] = 0;
  uint64_t v24 = 0;
  char v25 = 0;
  uint64_t v26 = 0;
  char v27 = 0;
  char v28 = 0;
  __int16 v29 = 0;
  WebCore::ResourceRequest::ResourceRequest((StringImpl *)v30);
  v30[272] = 0;
  *(_DWORD *)&v30[280] = 0;
  *(_WORD *)&v30[284] = 0;
  memset(&v30[200], 0, 57);
  *(_OWORD *)&v30[288] = 0u;
  if ((unint64_t)a3 >= 4) {
    char v16 = 1;
  }
  else {
    char v16 = a3;
  }
  v30[304] = v16;
  v30[305] = 1;
  v30[312] = 0;
  v30[344] = 0;
  int v17 = (void *)WTF::fastMalloc((WTF *)0x10);
  *int v17 = &unk_1EE9CC340;
  v17[1] = v10;
  uint64_t v19 = v17;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)&v21, (uint64_t)&v19);
  NSData v18 = v19;
  uint64_t v19 = 0;
  if (v18) {
    (*(void (**)(void *))(*v18 + 8))(v18);
  }
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)&v21);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v20);
  _Block_release(0);
}

- (void)makeCredentialWithClientDataHash:(id)a3 options:(id)a4 completionHandler:(id)a5
{
}

+ (PublicKeyCredentialRequestOptions)convertToCoreRequestOptionsWithOptions:(SEL)a3
{
  retstr->var0.var0.var0.var0.var1.var0.var0 = 0;
  retstr->var0.var0.var0.BOOL var1 = 0;
  retstr->var1.var0.__null_state_ = 0;
  retstr->var1.__engaged_ = 0;
  retstr->var2.m_impl.Class m_ptr = 0;
  p_unsigned int var2 = &retstr->var2;
  retstr->var3.var0 = 0;
  *(void *)&retstr->var3.BOOL var1 = 0;
  retstr->var4 = 1;
  retstr->var5.var0.var0 = 0;
  retstr->var5.BOOL var1 = 0;
  retstr->var6 = 0;
  if ([a4 timeout])
  {
    retstr->var1.var0.__val_ = objc_msgSend((id)objc_msgSend(a4, "timeout"), "unsignedIntValue");
    retstr->var1.__engaged_ = 1;
  }
  if ([a4 relyingPartyIdentifier])
  {
    MEMORY[0x19972EAD0](&v25, [a4 relyingPartyIdentifier]);
    Class isa = v25.super.isa;
    v25.super.Class isa = 0;
    Class m_ptr = (Class)p_var2->m_impl.m_ptr;
    p_var2->m_impl.Class m_ptr = (StringImpl *)isa;
    if (m_ptr)
    {
      int v10 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr != 2) {
        goto LABEL_8;
      }
      WTF::StringImpl::destroy(m_ptr, v7);
      Class m_ptr = v25.super.isa;
      v25.super.Class isa = 0;
      if (!m_ptr) {
        goto LABEL_9;
      }
      int v10 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2) {
        WTF::StringImpl::destroy(m_ptr, v11);
      }
      else {
LABEL_8:
      }
        *(_DWORD *)Class m_ptr = v10;
    }
  }
LABEL_9:
  if ([a4 allowCredentials])
  {
    publicKeyCredentialDescriptors((uint64_t)&v25, (void *)[a4 allowCredentials]);
    unsigned int var2 = retstr->var3.var2;
    if (var2) {
      WTF::VectorDestructor<true,WebCore::PublicKeyCredentialDescriptor>::destruct((WebCore::PublicKeyCredentialDescriptor *)retstr->var3.var0, (WebCore::PublicKeyCredentialDescriptor *)((char *)retstr->var3.var0 + 40 * var2));
    }
    var0 = retstr->var3.var0;
    if (var0)
    {
      retstr->var3.var0 = 0;
      retstr->var3.BOOL var1 = 0;
      WTF::fastFree((WTF *)var0, v12);
    }
    retstr->var3.var0 = (PublicKeyCredentialDescriptor *)v25.super.isa;
    appid = v25._appid;
    v25.super.Class isa = 0;
    v25._appid = 0;
    *(void *)&retstr->var3.BOOL var1 = appid;
    WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v25);
  }
  if ([a4 extensionsCBOR])
  {
    char v16 = (void *)[a4 extensionsCBOR];
    int v17 = v16;
    if (v16)
    {
      [v16 bytes];
      [v17 length];
    }
    WebCore::AuthenticationExtensionsClientInputs::fromCBOR();
    std::__optional_storage_base<WebCore::AuthenticationExtensionsClientInputs,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebCore::AuthenticationExtensionsClientInputs,false>>((WebCore::AuthenticationExtensionsClientInputs *)&retstr->var5, (uint64_t)&v25);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v25);
  }
  else
  {
    authenticationExtensionsClientInputs(&v25, (void *)[a4 extensions]);
    std::optional<WebCore::AuthenticationExtensionsClientInputs>::operator=[abi:sn180100]<WebCore::AuthenticationExtensionsClientInputs,void>((uint64_t)&retstr->var5, (uint64_t)&v25);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::PRFInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::PRFInputs *)&v27);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs *)&v26);
    uint64_t v19 = v25.super.isa;
    v25.super.Class isa = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2) {
        WTF::StringImpl::destroy(v19, v18);
      }
      else {
        *(_DWORD *)v19 -= 2;
      }
    }
  }
  unint64_t v20 = [a4 userVerification];
  if (v20 >= 3) {
    unsigned __int8 v21 = 1;
  }
  else {
    unsigned __int8 v21 = v20;
  }
  retstr->var4 = v21;
  CFTypeRef result = (PublicKeyCredentialRequestOptions *)[a4 authenticatorAttachment];
  if (result == (PublicKeyCredentialRequestOptions *)2)
  {
    __int16 v23 = 1;
  }
  else
  {
    if (result != (PublicKeyCredentialRequestOptions *)1)
    {
      __int16 v23 = 0;
      __int16 v24 = 0;
      goto LABEL_32;
    }
    __int16 v23 = 0;
  }
  __int16 v24 = 1;
LABEL_32:
  retstr->var6 = (optional<WebCore::AuthenticatorAttachment>)(v23 | (v24 << 8));
  return result;
}

- (void)getAssertionWithChallenge:(id)a3 origin:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  *(void *)&v35[352] = *MEMORY[0x1E4F143B8];
  produceClientDataJson(&v26, 1, a3, (uint64_t)a4, 0);
  id v9 = v26;
  produceClientDataJsonHash(&v24, v26);
  int v10 = _Block_copy(a6);
  uint64_t v26 = 0;
  v27[0] = v24.super.isa;
  uint64_t v11 = v25;
  v24.super.Class isa = 0;
  uint64_t v25 = 0;
  v27[1] = v11;
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:a5];
  std::__variant_detail::__alt<1ul,WebCore::PublicKeyCredentialRequestOptions>::__alt[abi:sn180100]<WebCore::PublicKeyCredentialRequestOptions>((uint64_t)v28, (uint64_t)v19);
  v28[74] = 1;
  uint64_t v29 = 0;
  char v30 = 0;
  uint64_t v31 = 0;
  char v32 = 0;
  char v33 = 0;
  __int16 v34 = 0;
  WebCore::ResourceRequest::ResourceRequest((StringImpl *)v35);
  v35[272] = 0;
  *(_DWORD *)&v35[280] = 0;
  *(_WORD *)&v35[284] = 0;
  v35[312] = 0;
  v35[344] = 0;
  memset(&v35[200], 0, 57);
  memset(&v35[288], 0, 18);
  unint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x18);
  *unint64_t v12 = &unk_1EE9CC368;
  v12[1] = v10;
  v12[2] = v9;
  NSData v18 = v12;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)v27, (uint64_t)&v18);
  unint64_t v13 = v18;
  NSData v18 = 0;
  if (v13) {
    (*(void (**)(void *))(*v13 + 8))(v13);
  }
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)v27);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v23);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v22);
  uint64_t v15 = v21;
  unsigned __int8 v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v14);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  if (v20 != -1) {
    ((void (*)(void **, char *))off_1EE9CC2E8[v20])(&v18, v19);
  }
  _Block_release(0);
  Class isa = v24.super.isa;
  if (v24.super.isa)
  {
    v24.super.Class isa = 0;
    LODWORD(v25) = 0;
    WTF::fastFree(isa, v16);
  }
}

- (void)getAssertionWithMediationRequirement:(int64_t)a3 clientDataHash:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  *(void *)&v36[352] = *MEMORY[0x1E4F143B8];
  int v10 = _Block_copy(a6);
  if (a4)
  {
    uint64_t v11 = (char *)[a4 bytes];
    unint64_t v12 = [a4 length];
    unint64_t v13 = v12;
    uint64_t v27 = 0;
    LODWORD(v28) = 0;
    HIDWORD(v28) = v12;
    if (v12)
    {
      if (HIDWORD(v12))
      {
        __break(0xC471u);
        return;
      }
      uint64_t v14 = (unsigned char *)WTF::fastMalloc((WTF *)v12);
      LODWORD(v28) = v13;
      uint64_t v27 = v14;
      do
      {
        char v15 = *v11++;
        *v14++ = v15;
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:a5];
  std::__variant_detail::__alt<1ul,WebCore::PublicKeyCredentialRequestOptions>::__alt[abi:sn180100]<WebCore::PublicKeyCredentialRequestOptions>((uint64_t)v29, (uint64_t)v22);
  v29[74] = 1;
  uint64_t v30 = 0;
  char v31 = 0;
  uint64_t v32 = 0;
  char v33 = 0;
  char v34 = 0;
  __int16 v35 = 0;
  WebCore::ResourceRequest::ResourceRequest((StringImpl *)v36);
  v36[272] = 0;
  *(_DWORD *)&v36[280] = 0;
  *(_WORD *)&v36[284] = 0;
  memset(&v36[200], 0, 57);
  *(_OWORD *)&v36[288] = 0u;
  if ((unint64_t)a3 >= 4) {
    char v16 = 1;
  }
  else {
    char v16 = a3;
  }
  v36[304] = v16;
  v36[305] = 1;
  v36[312] = 0;
  v36[344] = 0;
  int v17 = (void *)WTF::fastMalloc((WTF *)0x10);
  *int v17 = &unk_1EE9CC390;
  v17[1] = v10;
  unsigned __int8 v21 = v17;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)&v27, (uint64_t)&v21);
  NSData v18 = v21;
  unsigned __int8 v21 = 0;
  if (v18) {
    (*(void (**)(void *))(*v18 + 8))(v18);
  }
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)&v27);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v26);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v25);
  int v20 = v24;
  NSData v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy(v20, v19);
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  if (v23 != -1) {
    ((void (*)(void **, char *))off_1EE9CC2E8[v23])(&v21, v22);
  }
  _Block_release(0);
}

- (void)getAssertionWithClientDataHash:(id)a3 options:(id)a4 completionHandler:(id)a5
{
}

+ (id)getClientDataJSONForAuthenticationType:(int64_t)a3 challenge:(id)a4 origin:(id)a5
{
  produceClientDataJson(&cf, a3, a4, (uint64_t)a5, 0);
  uint64_t v5 = (void *)CFMakeCollectable(cf);

  return v5;
}

+ (id)getClientDataJSONWithTopOrigin:(int64_t)a3 challenge:(id)a4 origin:(id)a5 topOrigin:(id)a6 crossOrigin:(BOOL)a7
{
  produceClientDataJson(&cf, a3, a4, (uint64_t)a5, (uint64_t)a6);
  uint64_t v7 = (void *)CFMakeCollectable(cf);

  return v7;
}

+ (id)encodeMakeCredentialCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)[a1 encodeMakeCredentialCommandWithClientDataJSON:a3 options:a4 userVerificationAvailability:a5 authenticatorSupportedExtensions:0];
}

+ (id)encodeMakeCredentialCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  produceClientDataJsonHash(&v19, a3);
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:a4];
  WTF::makeVector<WTF::String>(a6, (uint64_t)v14);
  fido::encodeMakeCredentialRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v8);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v15);
  CFTypeRef v10 = (id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v16 length:v18]);
  uint64_t v11 = v16;
  if (v16)
  {
    char v16 = 0;
    int v17 = 0;
    WTF::fastFree(v11, v9);
  }
  Class isa = v19.super.isa;
  if (v19.super.isa)
  {
    v19.super.Class isa = 0;
    int v20 = 0;
    WTF::fastFree(isa, v9);
  }
  return (id)v10;
}

+ (id)encodeGetAssertionCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)[a1 encodeGetAssertionCommandWithClientDataJSON:a3 options:a4 userVerificationAvailability:a5 authenticatorSupportedExtensions:0];
}

+ (id)encodeGetAssertionCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  produceClientDataJsonHash(&v25, a3);
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:a4];
  WTF::makeVector<WTF::String>(a6, (uint64_t)v16);
  fido::encodeGetAssertionRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v16, v8);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v21);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v20);
  CFTypeRef v10 = v19;
  NSData v19 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  if (v18 != -1) {
    ((void (*)(unsigned char *, unsigned char *))off_1EE9CC2E8[v18])(v16, v17);
  }
  CFTypeRef v12 = (id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v22 length:v24]);
  unint64_t v13 = v22;
  if (v22)
  {
    uint64_t v22 = 0;
    int v23 = 0;
    WTF::fastFree(v13, v11);
  }
  Class isa = v25.super.isa;
  if (v25.super.isa)
  {
    v25.super.Class isa = 0;
    int v26 = 0;
    WTF::fastFree(isa, v11);
  }
  return (id)v12;
}

+ (id)encodeMakeCredentialCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)[a1 encodeMakeCredentialCommandWithClientDataHash:a3 options:a4 userVerificationAvailability:a5 authenticatorSupportedExtensions:0];
}

+ (id)encodeMakeCredentialCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  if (a3)
  {
    uint64_t v9 = [a3 bytes];
    id result = (id)[a3 length];
    uint64_t v11 = (char *)result;
    uint64_t v22 = 0;
    LODWORD(v23) = 0;
    HIDWORD(v23) = result;
    if (result)
    {
      if ((unint64_t)result >> 32)
      {
        __break(0xC471u);
        return result;
      }
      uint64_t v12 = WTF::fastMalloc((WTF *)result);
      unint64_t v13 = 0;
      LODWORD(v23) = v11;
      uint64_t v22 = (WTF *)v12;
      do
      {
        v13[v12] = v13[v9];
        ++v13;
      }
      while (v11 != v13);
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:a4];
  WTF::makeVector<WTF::String>(a6, (uint64_t)v20);
  fido::encodeMakeCredentialRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v14);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v21);
  char v16 = v22;
  if (v22)
  {
    uint64_t v22 = 0;
    LODWORD(v23) = 0;
    WTF::fastFree(v16, v15);
  }
  CFTypeRef v18 = (id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v24 length:v26]);
  NSData v19 = v24;
  if (v24)
  {
    unsigned int v24 = 0;
    int v25 = 0;
    WTF::fastFree(v19, v17);
  }
  return (id)v18;
}

+ (id)encodeGetAssertionCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)[a1 encodeGetAssertionCommandWithClientDataHash:a3 options:a4 userVerificationAvailability:a5 authenticatorSupportedExtensions:0];
}

+ (id)encodeGetAssertionCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  if (a3)
  {
    uint64_t v9 = (char *)[a3 bytes];
    id result = (id)[a3 length];
    uint64_t v11 = (char *)result;
    uint64_t v27 = 0;
    LODWORD(v28) = 0;
    HIDWORD(v28) = result;
    if (result)
    {
      if ((unint64_t)result >> 32)
      {
        __break(0xC471u);
        return result;
      }
      uint64_t v12 = (WTF *)WTF::fastMalloc((WTF *)result);
      LODWORD(v28) = v11;
      uint64_t v27 = v12;
      do
      {
        char v13 = *v9++;
        *(unsigned char *)uint64_t v12 = v13;
        uint64_t v12 = (WTF *)((char *)v12 + 1);
        --v11;
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:a4];
  WTF::makeVector<WTF::String>(a6, (uint64_t)v21);
  fido::encodeGetAssertionRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v21, v14);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v26);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v25);
  char v16 = v24;
  unsigned int v24 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v15);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  if (v23 != -1) {
    ((void (*)(unsigned char *, char *))off_1EE9CC2E8[v23])(v21, v22);
  }
  int v17 = v27;
  if (v27)
  {
    uint64_t v27 = 0;
    LODWORD(v28) = 0;
    WTF::fastFree(v17, v15);
  }
  CFTypeRef v19 = (id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v29 length:v31]);
  uint64_t v20 = v29;
  if (v29)
  {
    uint64_t v29 = 0;
    int v30 = 0;
    WTF::fastFree(v20, v18);
  }
  return (id)v19;
}

- (void)setMockConfiguration:(id)a3
{
  if ([a3 objectForKeyedSubscript:@"privateKeyBase64"])
  {
    MEMORY[0x19972EAD0](&v7, [a3 objectForKeyedSubscript:@"privateKeyBase64"]);
    uint64_t v5 = v7;
  }
  else
  {
    uint64_t v5 = 0;
  }
  LOBYTE(v7) = 0;
  v14[0] = 0;
  char v15 = 0;
  char v16 = 0;
  char v18 = 0;
  v19[0] = 0;
  char v20 = 0;
  __int16 v8 = 1;
  uint64_t v9 = v5;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  char v13 = 1;
  API::WebAuthenticationPanel::setMockConfiguration((uint64_t)&self->_panel, (uint64_t)&v7);
  if (v20) {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v19, v6);
  }
  if (v18) {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v17, v6);
  }
  if (v15) {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v6);
  }
  std::__optional_destruct_base<WebCore::MockWebAuthenticationConfiguration::LocalConfiguration,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v8, (WTF::StringImpl *)v6);
}

- (Object)_apiObject
{
  return (Object *)&self->_panel;
}

- (void).cxx_destruct
{
  Class m_ptr = self->_transports.m_ptr;
  self->_transports.Class m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = (unsigned int *)self->_client.m_impl.m_ptr;
  self->_client.m_impl.Class m_ptr = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (uint64_t)makeCredentialWithChallenge:(uint64_t)a1 origin:options:completionHandler:
{
  *(void *)a1 = &unk_1EE9CC318;
  v2 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(v2);
  }
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9CC318;
  v2 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(v2);
  }
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)makeCredentialWithChallenge:(uint64_t)a1 origin:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v5 = *((_DWORD *)a2 + 4);
  if (v5 == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *(unsigned __int8 *)a2;
    v16[0] = *MEMORY[0x1E4F28568];
    if (a2[1]) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_1EEA10550;
    }
    v15[0] = v12;
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", @"WKErrorDomain", v11, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, v16, 1));
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    if (v5)
    {
      uint64_t v14 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
      if (v2) {
        CFRelease(v2);
      }
      WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v15, v13);
      _Unwind_Resume(v14);
    }
    (*(void (**)(void *__return_ptr))(*(void *)*a2 + 24))(v15);
    uint64_t v6 = *(void *)(a1 + 16);
    int v7 = WebCore::AuthenticatorResponse::attachment(*a2);
    wkAuthenticatorAttestationResponse(v16, (uint64_t)v15, v6, v7);
    __int16 v8 = (const void *)v16[0];
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v8) {
      CFRelease(v8);
    }
    WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v15, v9);
  }
}

- (uint64_t)makeCredentialWithMediationRequirement:(uint64_t)a1 clientDataHash:options:completionHandler:
{
  *(void *)a1 = &unk_1EE9CC340;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)makeCredentialWithMediationRequirement:(const void *)a1 clientDataHash:options:completionHandler:
{
  *a1 = &unk_1EE9CC340;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)makeCredentialWithMediationRequirement:(uint64_t)a1 clientDataHash:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = *((_DWORD *)a2 + 4);
  if (v5 == 1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *(unsigned __int8 *)a2;
    v15[0] = *MEMORY[0x1E4F28568];
    if (a2[1]) {
      uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v11 = &stru_1EEA10550;
    }
    v14[0] = v11;
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"WKErrorDomain", v10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    if (v5)
    {
      char v13 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
      if (v2) {
        CFRelease(v2);
      }
      WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v14, v12);
      _Unwind_Resume(v13);
    }
    (*(void (**)(void *__return_ptr))(*(void *)*a2 + 24))(v14);
    int v6 = WebCore::AuthenticatorResponse::attachment(*a2);
    wkAuthenticatorAttestationResponse(v15, (uint64_t)v14, 0, v6);
    int v7 = (const void *)v15[0];
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v7) {
      CFRelease(v7);
    }
    WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v14, v8);
  }
}

- (uint64_t)getAssertionWithChallenge:(uint64_t)a1 origin:options:completionHandler:
{
  *(void *)a1 = &unk_1EE9CC368;
  v2 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(v2);
  }
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9CC368;
  v2 = *(const void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    CFRelease(v2);
  }
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)getAssertionWithChallenge:(uint64_t)a1 origin:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v5 = *((_DWORD *)a2 + 4);
  if (v5 == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *(unsigned __int8 *)a2;
    v16[0] = *MEMORY[0x1E4F28568];
    if (a2[1]) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_1EEA10550;
    }
    v15[0] = v12;
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", @"WKErrorDomain", v11, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, v16, 1));
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    if (v5)
    {
      uint64_t v14 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
      if (v2) {
        CFRelease(v2);
      }
      WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v15, v13);
      _Unwind_Resume(v14);
    }
    (*(void (**)(void *__return_ptr))(*(void *)*a2 + 24))(v15);
    uint64_t v6 = *(void *)(a1 + 16);
    int v7 = WebCore::AuthenticatorResponse::attachment(*a2);
    wkAuthenticatorAssertionResponse(v16, (uint64_t)v15, v6, v7);
    __int16 v8 = (const void *)v16[0];
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v8) {
      CFRelease(v8);
    }
    WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v15, v9);
  }
}

- (uint64_t)getAssertionWithMediationRequirement:(uint64_t)a1 clientDataHash:options:completionHandler:
{
  *(void *)a1 = &unk_1EE9CC390;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)getAssertionWithMediationRequirement:(const void *)a1 clientDataHash:options:completionHandler:
{
  *a1 = &unk_1EE9CC390;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)getAssertionWithMediationRequirement:(uint64_t)a1 clientDataHash:(WebCore::AuthenticatorResponse *)a2 options:completionHandler:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v5 = *((_DWORD *)a2 + 4);
  if (v5 == 1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *(unsigned __int8 *)a2;
    v15[0] = *MEMORY[0x1E4F28568];
    if (a2[1]) {
      uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v11 = &stru_1EEA10550;
    }
    v14[0] = v11;
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"WKErrorDomain", v10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    if (v5)
    {
      char v13 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
      if (v2) {
        CFRelease(v2);
      }
      WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v14, v12);
      _Unwind_Resume(v13);
    }
    (*(void (**)(void *__return_ptr))(*(void *)*a2 + 24))(v14);
    int v6 = WebCore::AuthenticatorResponse::attachment(*a2);
    wkAuthenticatorAssertionResponse(v15, (uint64_t)v14, 0, v6);
    int v7 = (const void *)v15[0];
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    if (v7) {
      CFRelease(v7);
    }
    WebCore::AuthenticatorResponseData::~AuthenticatorResponseData((WebCore::AuthenticatorResponseData *)v14, v8);
  }
}

@end