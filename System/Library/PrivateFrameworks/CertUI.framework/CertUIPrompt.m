@interface CertUIPrompt
+ (id)promptQueue;
+ (id)stringForResponse:(int)a3;
- (BOOL)_isRootCertificateFromTrust:(__SecTrust *)a3;
- (CertUIPrompt)init;
- (NSString)connectionDisplayName;
- (NSString)host;
- (NSString)service;
- (__SecTrust)trust;
- (id)_copyPropertiesFromTrust:(__SecTrust *)a3;
- (id)_digestFromTrust:(__SecTrust *)a3;
- (id)_expirationFromTrust:(__SecTrust *)a3;
- (id)_issuerFromTrust:(__SecTrust *)a3;
- (id)_messagingCenter;
- (id)_newUserInfoWithHostname:(id)a3 trust:(__SecTrust *)a4 options:(id)a5;
- (id)_propertyNamed:(id)a3 ofType:(id)a4 inProperties:(id)a5;
- (id)_purposeFromTrustProperties:(id)a3;
- (id)_sendablePropertiesFromProperties:(id)a3;
- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3;
- (id)_sendablePropertyFromProperty:(id)a3;
- (id)_subtitleFromTrust:(__SecTrust *)a3;
- (id)_titleFromTrust:(__SecTrust *)a3;
- (id)description;
- (int)_responseFromReplyDict:(id)a3;
- (int)_sendRemoteMessage;
- (int)_sendRemoteMessageWithPromptOptions:(id)a3;
- (int)showAndWaitForResponse;
- (void)_informConsumerOfResponse:(int)a3;
- (void)dealloc;
- (void)setConnectionDisplayName:(id)a3;
- (void)setHost:(id)a3;
- (void)setService:(id)a3;
- (void)setTrust:(__SecTrust *)a3;
- (void)showPromptWithOptions:(id)a3 responseBlock:(id)a4;
- (void)showPromptWithResponseBlock:(id)a3;
@end

@implementation CertUIPrompt

+ (id)stringForResponse:(int)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v7 = xmmword_2642393E8;
  v8 = @"CertUIResponseAllowPermanently";
  if (a3 > 2) {
    v3 = @"Unknown";
  }
  else {
    v3 = (__CFString *)*((void *)&v7 + a3);
  }
  v4 = v3;
  for (uint64_t i = 16; i != -8; i -= 8)

  return v4;
}

- (CertUIPrompt)init
{
  v4.receiver = self;
  v4.super_class = (Class)CertUIPrompt;
  v2 = [(CertUIPrompt *)&v4 init];
  if (v2) {
    CertUILoggingInitialize();
  }
  return v2;
}

- (void)dealloc
{
  trust = self->_trust;
  if (trust)
  {
    CFRelease(trust);
    self->_trust = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CertUIPrompt;
  [(CertUIPrompt *)&v4 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CertUIPrompt;
  v3 = [(CertUIPrompt *)&v6 description];
  objc_super v4 = [v3 stringByAppendingFormat:@": host: %@ service: %@", self->_host, self->_service];

  return v4;
}

- (void)setTrust:(__SecTrust *)a3
{
  trust = self->_trust;
  if (trust != a3)
  {
    if (trust)
    {
      CFRelease(trust);
      self->_trust = 0;
    }
    if (a3) {
      objc_super v6 = (__SecTrust *)CFRetain(a3);
    }
    else {
      objc_super v6 = 0;
    }
    self->_trust = v6;
  }
}

- (__SecTrust)trust
{
  return self->_trust;
}

- (NSString)connectionDisplayName
{
  connectionDisplayName = self->_connectionDisplayName;
  if (connectionDisplayName)
  {
    v3 = connectionDisplayName;
  }
  else
  {
    objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

    if (v5)
    {
      v3 = v5;
    }
    else
    {
      objc_super v6 = [MEMORY[0x263F08AB0] processInfo];
      v3 = [v6 processName];
    }
  }

  return v3;
}

+ (id)promptQueue
{
  if (promptQueue_sQueueOnce != -1) {
    dispatch_once(&promptQueue_sQueueOnce, &__block_literal_global_1);
  }
  v2 = (void *)promptQueue_sPromptQueue;

  return v2;
}

uint64_t __27__CertUIPrompt_promptQueue__block_invoke()
{
  promptQueue_sPromptQueue = (uint64_t)dispatch_queue_create("com.apple.CertUIPromptQueue", 0);

  return MEMORY[0x270F9A758]();
}

- (id)_sendablePropertyFromProperty:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:*MEMORY[0x263F174D8]];
  if ([v5 isEqualToString:*MEMORY[0x263F17508]])
  {
    objc_super v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

    uint64_t v7 = *MEMORY[0x263F174E0];
    v8 = [v4 objectForKey:*MEMORY[0x263F174E0]];
    uint64_t v9 = [v8 absoluteString];
  }
  else
  {
    objc_super v6 = v4;
    if (![v5 isEqualToString:*MEMORY[0x263F174F8]]) {
      goto LABEL_6;
    }
    objc_super v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

    uint64_t v7 = *MEMORY[0x263F174E0];
    v8 = [v4 objectForKey:*MEMORY[0x263F174E0]];
    uint64_t v9 = [(CertUIPrompt *)self _sendablePropertiesFromProperties:v8];
  }
  v10 = (void *)v9;
  [v6 setObject:v9 forKey:v7];

LABEL_6:

  return v6;
}

- (id)_sendablePropertiesFromProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[CertUIPrompt _sendablePropertyFromProperty:](self, "_sendablePropertyFromProperty:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_copyPropertiesFromTrust:(__SecTrust *)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  int CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount >= 1)
  {
    CFIndex v6 = 0;
    uint64_t v7 = CertificateCount;
    do
    {
      SecTrustGetCertificateAtIndex(a3, v6);
      uint64_t v8 = SecCertificateCopyProperties();
      if (v8)
      {
        uint64_t v9 = (const void *)v8;
        [v4 addObject:v8];
        CFRelease(v9);
      }
      ++v6;
    }
    while (v7 != v6);
  }
  return v4;
}

- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [(CertUIPrompt *)self _copyPropertiesFromTrust:a3];
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[CertUIPrompt _sendablePropertiesFromProperties:](self, "_sendablePropertiesFromProperties:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_titleFromTrust:(__SecTrust *)a3
{
  if (SecTrustGetCertificateCount(a3) < 1)
  {
    v5 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
    v5 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }

  return v5;
}

- (id)_issuerFromTrust:(__SecTrust *)a3
{
  if (SecTrustGetCertificateCount(a3) < 1)
  {
    id v4 = 0;
  }
  else
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    id v4 = (void *)SecCertificateCopyIssuerSummary();
  }

  return v4;
}

- (id)_subtitleFromTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 2)
  {
    id v6 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
    id v6 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }

  return v6;
}

- (id)_propertyNamed:(id)a3 ofType:(id)a4 inProperties:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v20 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = *MEMORY[0x263F174C8];
    uint64_t v12 = *MEMORY[0x263F174D8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "objectForKey:", v11, v20);
        if ([v15 isEqualToString:v7])
        {
          long long v16 = [v14 objectForKey:v12];
          int v17 = [v16 isEqualToString:v20];

          if (v17)
          {
            uint64_t v18 = [v14 objectForKey:*MEMORY[0x263F174E0]];
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  uint64_t v18 = 0;
LABEL_13:

  return v18;
}

- (id)_purposeFromTrustProperties:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 objectAtIndex:0];
    id v6 = [(CertUIPrompt *)self _propertyNamed:@"2.5.29.37" ofType:*MEMORY[0x263F174F8] inProperties:v5];
    if (v6)
    {
      id v7 = [(CertUIPrompt *)self _propertyNamed:@"Purpose" ofType:*MEMORY[0x263F17500] inProperties:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_expirationFromTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1) {
    goto LABEL_9;
  }
  CFIndex v5 = CertificateCount;
  CFIndex v6 = 0;
  int v7 = 0;
  double v8 = *MEMORY[0x263EFFAF0];
  do
  {
    if (SecTrustGetCertificateAtIndex(a3, v6))
    {
      SecCertificateNotValidAfter();
      int v10 = v7 ^ 1 | (v9 < v8);
      v7 |= v10;
      if (v10) {
        double v8 = v9;
      }
    }
    ++v6;
  }
  while (v5 != v6);
  if (v7) {
    CFDateRef v11 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v8);
  }
  else {
LABEL_9:
  }
    CFDateRef v11 = 0;

  return v11;
}

- (BOOL)_isRootCertificateFromTrust:(__SecTrust *)a3
{
  if (SecTrustGetCertificateCount(self->_trust) < 1) {
    return 0;
  }
  SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, 0);

  return MEMORY[0x270EFD848](CertificateAtIndex);
}

- (id)_digestFromTrust:(__SecTrust *)a3
{
  if (SecTrustGetCertificateCount(a3) < 1)
  {
    id v4 = 0;
  }
  else
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    id v4 = (void *)[(id)SecCertificateGetSHA1Digest() copy];
  }

  return v4;
}

- (id)_newUserInfoWithHostname:(id)a3 trust:(__SecTrust *)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:12];
  CFDateRef v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKey:@"kCertUITrustHostnameKey"];
  }
  uint64_t v12 = [(CertUIPrompt *)self _sendablePropertiesFromTrust:a4];
  if (v12) {
    [v11 setObject:v12 forKey:@"kCertUITrustPropertiesKey"];
  }
  uint64_t v13 = [(CertUIPrompt *)self _titleFromTrust:a4];
  if (v13) {
    [v11 setObject:v13 forKey:@"kCertUITrustTitleKey"];
  }
  uint64_t v14 = [(CertUIPrompt *)self _issuerFromTrust:a4];
  if (v14) {
    [v11 setObject:v14 forKey:@"kCertUITrustIssuerKey"];
  }
  uint64_t v15 = [(CertUIPrompt *)self _subtitleFromTrust:a4];
  if (v15) {
    [v11 setObject:v15 forKey:@"kCertUITrustSubtitleKey"];
  }
  uint64_t v16 = [(CertUIPrompt *)self _purposeFromTrustProperties:v12];
  if (v16) {
    [v11 setObject:v16 forKey:@"kCertUITrustPurposeKey"];
  }
  v37 = (void *)v14;
  uint64_t v17 = [(CertUIPrompt *)self _expirationFromTrust:a4];
  if (v17) {
    [v11 setObject:v17 forKey:@"kCertUITrustExpirationKey"];
  }
  v34 = (void *)v17;
  BOOL v18 = [(CertUIPrompt *)self _isRootCertificateFromTrust:a4];
  v19 = [NSNumber numberWithBool:v18];
  [v11 setObject:v19 forKey:@"kCertUITrustIsRootCertificateKey"];

  id v20 = [(CertUIPrompt *)self _digestFromTrust:a4];
  if (v20) {
    [v11 setObject:v20 forKey:@"kCertUITrustDigestKey"];
  }
  v35 = (void *)v16;
  v21 = [v9 objectForKey:@"allowCertificateTrust"];
  v33 = (void *)v13;
  v36 = (void *)v15;
  long long v22 = (void *)v12;
  if (v21)
  {
    [v11 setObject:v21 forKey:@"kCertUITrustAllowCertificateTrust"];
    int v23 = [v21 BOOLValue] ^ 1;
  }
  else
  {
    int v23 = 0;
  }
  id v24 = v8;
  long long v25 = v9;
  v26 = [v9 objectForKey:@"showCertificateDetails"];
  if (v26)
  {
    [v11 setObject:v26 forKey:@"kCertUITrustShowCertificateDetailsKey"];
    int v27 = [v26 BOOLValue] ^ 1;
  }
  else
  {
    int v27 = 0;
  }
  v28 = [v25 objectForKey:@"showContinue"];
  v29 = v28;
  if ((v23 | v27) == 1)
  {

    v29 = (void *)MEMORY[0x263EFFA80];
    v30 = v24;
    v31 = v33;
LABEL_26:
    [v11 setObject:v29 forKey:@"kCertUITrustShowContinueKey"];

    goto LABEL_27;
  }
  v30 = v24;
  v31 = v33;
  if (v28) {
    goto LABEL_26;
  }
LABEL_27:

  return v11;
}

- (id)_messagingCenter
{
  return (id)[MEMORY[0x263F255B0] centerNamed:@"com.apple.certui.relay"];
}

- (int)_responseFromReplyDict:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectForKey:@"kCertUITrustResponseKey"];

  if (!v4)
  {
    uint64_t v11 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      id v8 = "Can't find value for trust response key";
      id v9 = v11;
      uint32_t v10 = 2;
      goto LABEL_7;
    }
LABEL_8:
    unsigned int v6 = 0;
    goto LABEL_9;
  }
  CFIndex v5 = [v3 objectForKey:@"kCertUITrustResponseKey"];
  unsigned int v6 = [v5 intValue];

  if (v6 >= 3)
  {
    uint64_t v7 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v13[0] = 67109120;
      v13[1] = v6;
      id v8 = "Invalid value for response %d";
      id v9 = v7;
      uint32_t v10 = 8;
LABEL_7:
      _os_log_impl(&dword_2152BF000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v13, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (int)_sendRemoteMessage
{
  return [(CertUIPrompt *)self _sendRemoteMessageWithPromptOptions:0];
}

- (int)_sendRemoteMessageWithPromptOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [(CertUIPrompt *)self _newUserInfoWithHostname:self->_host trust:self->_trust options:a3];
  CFIndex v5 = [(CertUIPrompt *)self _messagingCenter];
  id v11 = 0;
  unsigned int v6 = [v5 sendMessageAndReceiveReplyName:@"kCertUIPresentTrustInfoMessage" userInfo:v4 error:&v11];
  id v7 = v11;

  if (v7)
  {
    id v8 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_2152BF000, v8, OS_LOG_TYPE_ERROR, "Error receiving blocking reply from ui app %@", buf, 0xCu);
    }
    int v9 = 0;
  }
  else
  {
    int v9 = [(CertUIPrompt *)self _responseFromReplyDict:v6];
  }

  return v9;
}

- (void)showPromptWithResponseBlock:(id)a3
{
}

- (void)showPromptWithOptions:(id)a3 responseBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CertUIPrompt promptQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CertUIPrompt_showPromptWithOptions_responseBlock___block_invoke;
  block[3] = &unk_264239408;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__CertUIPrompt_showPromptWithOptions_responseBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendRemoteMessageWithPromptOptions:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_informConsumerOfResponse:(int)a3
{
  (*((void (**)(void))self->_responseBlock + 2))();
  id responseBlock = self->_responseBlock;
  self->_id responseBlock = 0;
}

- (int)showAndWaitForResponse
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  id v3 = +[CertUIPrompt promptQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__CertUIPrompt_showAndWaitForResponse__block_invoke;
  v5[3] = &unk_264239430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

uint64_t __38__CertUIPrompt_showAndWaitForResponse__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _sendRemoteMessage];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void)setConnectionDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_connectionDisplayName, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

@end