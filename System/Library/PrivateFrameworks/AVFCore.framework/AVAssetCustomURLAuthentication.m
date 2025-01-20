@interface AVAssetCustomURLAuthentication
+ (id)copyKeychainCredentialForUrl:(id)a3;
+ (int)sendAuthResponse:(__CFDictionary *)a3 requestID:(unint64_t)a4 disposition:(int64_t)a5 credential:(id)a6 authHandler:(OpaqueFigCustomURLHandler *)a7;
- (AVAssetCustomURLAuthentication)initWithFigAsset:(OpaqueFigAsset *)a3;
- (int)_handleAuthChallenge:(__CFDictionary *)a3 requestID:(unint64_t)a4 canHandleRequestOut:(char *)a5;
- (void)dealloc;
@end

@implementation AVAssetCustomURLAuthentication

- (AVAssetCustomURLAuthentication)initWithFigAsset:(OpaqueFigAsset *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AVAssetCustomURLAuthentication;
  CFTypeRef cf = 0;
  v4 = [(AVAssetCustomURLAuthentication *)&v18 init];
  if (!v4)
  {
    int v9 = 0;
    goto LABEL_16;
  }
  if (a3)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.authkeychain.callback", v5);
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v8 = v7 ? v7 : 0;
    v10 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v8 + 48);
    if (v10)
    {
      int v11 = v10(CMBaseObject, *MEMORY[0x1E4F32208], *MEMORY[0x1E4F1CF80], &cf);
      if (v11)
      {
LABEL_14:
        int v9 = v11;
        goto LABEL_16;
      }
      CFTypeRef v12 = cf;
      callbackQueue = v4->_callbackQueue;
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      v16 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLAuthentication *, OS_dispatch_queue *, void *, void, OpaqueFigCustomURLHandler **))(v15 + 16);
      if (v16)
      {
        int v11 = v16(v12, 800, "com.apple.avfoundation.authkeychain", v4, callbackQueue, &initWithFigAsset__sAVAssetCustomURLAuthenticationCallbacks, 0, &v4->_handler);
        goto LABEL_14;
      }
    }
  }
  int v9 = -12780;
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
  if (v9)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  callbackQueue = self->_callbackQueue;
  if (callbackQueue) {
    dispatch_release(callbackQueue);
  }
  handler = self->_handler;
  if (handler) {
    CFRelease(handler);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLAuthentication;
  [(AVAssetCustomURLAuthentication *)&v5 dealloc];
}

- (int)_handleAuthChallenge:(__CFDictionary *)a3 requestID:(unint64_t)a4 canHandleRequestOut:(char *)a5
{
  id v19 = 0;
  id v20 = 0;
  *a5 = 0;
  int v9 = FigCustomURLRequestInfoCopyNSURLAuthenticationChallenge();
  if (v9)
  {
    if (v9 == -17360) {
      int v10 = 0;
    }
    else {
      int v10 = v9;
    }
    CFTypeRef v12 = 0;
  }
  else
  {
    *a5 = 1;
    int v10 = FigCustomURLRequestInfoCopyURL();
    if (v10
      || (id v11 = +[AVAssetCustomURLAuthentication copyKeychainCredentialForUrl:v19]) == 0)
    {
      if (a3) {
        CFRetain(a3);
      }
      callbackQueue = self->_callbackQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke_2;
      v17[3] = &unk_1E57B36D0;
      v17[5] = a3;
      v17[6] = a4;
      v17[4] = self;
      dispatch_async(callbackQueue, v17);
      CFTypeRef v12 = 0;
    }
    else
    {
      CFTypeRef v12 = v11;
      if (a3) {
        CFRetain(a3);
      }
      id v13 = v12;
      uint64_t v14 = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke;
      block[3] = &unk_1E57B3CD0;
      block[6] = a3;
      block[7] = a4;
      block[4] = v12;
      block[5] = self;
      dispatch_async(v14, block);
      int v10 = 0;
    }
  }

  return v10;
}

void __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke(uint64_t a1)
{
  +[AVAssetCustomURLAuthentication sendAuthResponse:*(void *)(a1 + 48) requestID:*(void *)(a1 + 56) disposition:0 credential:*(void *)(a1 + 32) authHandler:*(void *)(*(void *)(a1 + 40) + 8)];

  v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __85__AVAssetCustomURLAuthentication__handleAuthChallenge_requestID_canHandleRequestOut___block_invoke_2(void *a1)
{
  +[AVAssetCustomURLAuthentication sendAuthResponse:a1[5] requestID:a1[6] disposition:3 credential:0 authHandler:*(void *)(a1[4] + 8)];
  v2 = (const void *)a1[5];
  if (v2)
  {
    CFRelease(v2);
  }
}

+ (id)copyKeychainCredentialForUrl:(id)a3
{
  CFTypeRef result = 0;
  if (![a3 scheme] || !objc_msgSend(a3, "host"))
  {
    id v4 = 0;
LABEL_17:
    int v9 = 0;
    goto LABEL_18;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:*MEMORY[0x1E4F3B998] forKey:*MEMORY[0x1E4F3B978]];
  [v4 setObject:*MEMORY[0x1E4F3B600] forKey:*MEMORY[0x1E4F3B5E8]];
  [v4 setObject:*MEMORY[0x1E4F3BB90] forKey:*MEMORY[0x1E4F3BB80]];
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC68]];
  [v4 setObject:v5 forKey:*MEMORY[0x1E4F3BC70]];
  uint64_t v6 = [a3 host];
  [v4 setObject:v6 forKey:*MEMORY[0x1E4F3B848]];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString"), "isEqualToString:", @"http"))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F3B7E8];
  }
  else
  {
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString"), "isEqualToString:", @"https"))goto LABEL_8; {
    uint64_t v7 = (void *)MEMORY[0x1E4F3B7F8];
    }
  }
  [v4 setObject:*v7 forKey:*MEMORY[0x1E4F3B7C8]];
LABEL_8:
  if ([a3 port])
  {
    uint64_t v8 = [a3 port];
    [v4 setObject:v8 forKey:*MEMORY[0x1E4F3B7C0]];
  }
  if (SecItemCopyMatching((CFDictionaryRef)v4, &result)) {
    goto LABEL_17;
  }
  int v9 = (void *)[(id)result valueForKey:*MEMORY[0x1E4F3B5C0]];
  if (!v9)
  {
LABEL_18:
    int v10 = 0;
    goto LABEL_15;
  }
  int v10 = (void *)[(id)result valueForKey:*MEMORY[0x1E4F3BD38]];
  if (v10 && (int v10 = (void *)[[NSString alloc] initWithData:v10 encoding:4]) != 0) {
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F18D88]) initWithUser:v9 password:v10 persistence:1];
  }
  else {
    int v9 = 0;
  }
LABEL_15:

  return v9;
}

+ (int)sendAuthResponse:(__CFDictionary *)a3 requestID:(unint64_t)a4 disposition:(int64_t)a5 credential:(id)a6 authHandler:(OpaqueFigCustomURLHandler *)a7
{
  int Mutable = FigCustomURLResponseInfoCreateMutable();
  if (Mutable) {
    return Mutable;
  }
  if (a6)
  {
    int Mutable = FigCustomURLResponseInfoSetNSURLCredential();
    if (Mutable) {
      return Mutable;
    }
  }
  int Mutable = FigCustomURLResponseInfoSetNSURLSessionAuthChallengeDisposition();
  if (Mutable) {
    return Mutable;
  }
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = *(uint64_t (**)(OpaqueFigCustomURLHandler *, unint64_t, void))(v12 + 8);
  if (!v13) {
    return -12782;
  }
  int Mutable = v13(a7, a4, 0);
  if (!Mutable)
  {
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = *(uint64_t (**)(OpaqueFigCustomURLHandler *, unint64_t, void, void))(v15 + 24);
    if (v16) {
      return v16(a7, a4, 0, 0);
    }
    return -12782;
  }
  return Mutable;
}

@end