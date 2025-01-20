@interface NSURLDownload
+ (BOOL)canResumeDownloadDecodedWithEncodingMIMEType:(NSString *)MIMEType;
+ (id)_downloadWithLoadingCFURLConnection:(_CFURLConnection *)a3 request:(_CFURLRequest *)a4 response:(_CFURLResponse *)a5 delegate:(id)a6 proxy:(id)a7;
+ (id)_downloadWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7;
+ (id)_downloadWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5;
- (BOOL)deletesFileUponFailure;
- (NSData)resumeData;
- (NSString)description;
- (NSURLDownload)init;
- (NSURLDownload)initWithRequest:(NSURLRequest *)request delegate:(id)delegate;
- (NSURLDownload)initWithResumeData:(NSData *)resumeData delegate:(id)delegate path:(NSString *)path;
- (NSURLRequest)request;
- (id)_directoryPath;
- (id)_initWithLoadingCFURLConnection:(_CFURLConnection *)a3 request:(_CFURLRequest *)a4 response:(_CFURLResponse *)a5 delegate:(id)a6 proxy:(id)a7;
- (id)_initWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7;
- (id)_initWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5;
- (id)_initWithResumeInformation:(id)a3 delegate:(id)a4 path:(id)a5;
- (id)_resumeInformation;
- (id)url;
- (void)_setDelegate:(id)a3;
- (void)_setDelegateQueue:(id)a3;
- (void)_setDirectoryPath:(id)a3;
- (void)cancel;
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)cleanupChallenges;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)dealloc;
- (void)setDeletesFileUponFailure:(BOOL)deletesFileUponFailure;
- (void)setDestination:(NSString *)path allowOverwrite:(BOOL)allowOverwrite;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
- (void)withDelegate:(id)a3;
@end

@implementation NSURLDownload

- (void)withDelegate:(id)a3
{
  if (self->_internal->_targetQueue)
  {
    v4 = (void *)[MEMORY[0x1E4F28B48] blockOperationWithBlock:a3];
    [(NSOperationQueue *)self->_internal->_targetQueue addOperation:v4];
    [v4 waitUntilFinished];
  }
  else
  {
    v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void)_setDirectoryPath:(id)a3
{
  if (a3) {
    CFURLRef v4 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a3, kCFURLPOSIXPathStyle, 1u);
  }
  else {
    CFURLRef v4 = 0;
  }
  cfDownload = self->_internal->cfDownload;
  if (cfDownload)
  {
    if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
    }
    v6 = (URLDownload *)((char *)cfDownload + 16);
  }
  else
  {
    v6 = 0;
  }
  URLDownload::setDirectoryURL(v6, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)_setDelegate:(id)a3
{
  id v5 = a3;

  self->_internal->delegate = a3;
}

- (id)_directoryPath
{
  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
  }
  v3 = (char *)cfDownload + 16;
  if (!cfDownload) {
    v3 = 0;
  }
  CFURLRef v4 = (const void *)*((void *)v3 + 27);
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = (const __CFURL *)CFRetain(v4);
  if (!v5) {
    return 0;
  }
  CFURLRef v6 = v5;
  CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  if (v7)
  {
    v8 = (void *)CFMakeCollectable(v7);
    id v9 = v8;
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

- (id)url
{
  v2 = (void *)CFURLDownloadCopyRequest((char *)self->_internal->cfDownload);
  if (!v2) {
    return 0;
  }
  v3 = v2;
  uint64_t v4 = [v2 _inner];
  CFURLRef v5 = *(void **)(v4 + 8);
  if (v5)
  {
    CFRetain(*(CFTypeRef *)(v4 + 8));
    CFMakeCollectable(v5);
    id v6 = v5;
  }
  CFRelease(v3);
  return v5;
}

- (void)_setDelegateQueue:(id)a3
{
  targetQueue = self->_internal->_targetQueue;
  if (targetQueue != a3)
  {

    self->_internal->_targetQueue = (NSOperationQueue *)a3;
  }
}

- (BOOL)deletesFileUponFailure
{
  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
  }
  v3 = (char *)cfDownload + 16;
  if (!cfDownload) {
    v3 = 0;
  }
  return v3[281] != 0;
}

- (void)setDeletesFileUponFailure:(BOOL)deletesFileUponFailure
{
  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
  }
  CFURLRef v5 = (char *)cfDownload + 16;
  if (!cfDownload) {
    CFURLRef v5 = 0;
  }
  v5[281] = deletesFileUponFailure;
}

- (void)setDestination:(NSString *)path allowOverwrite:(BOOL)allowOverwrite
{
  if (!path) {
    __assert_rtn("-[NSURLDownload setDestination:allowOverwrite:]", "NSURLDownload.mm", 357, "path");
  }
  BOOL v4 = allowOverwrite;
  if (![(NSString *)path isAbsolutePath]) {
    __assert_rtn("-[NSURLDownload setDestination:allowOverwrite:]", "NSURLDownload.mm", 358, "[path isAbsolutePath]");
  }
  CFURLRef v7 = CFURLCreateWithFileSystemPath(0, (CFStringRef)path, kCFURLPOSIXPathStyle, 0);
  if (v7)
  {
    CFURLRef v8 = v7;
    CFURLDownloadSetDestination((uint64_t)self->_internal->cfDownload, v7, v4);
    CFRelease(v8);
  }
  else
  {
    NSLog(&cfstr_Setdestination.isa);
    [(NSURLDownload *)self cancel];
  }
}

- (NSURLRequest)request
{
  result = (NSURLRequest *)CFURLDownloadCopyRequest((char *)self->_internal->cfDownload);
  if (result)
  {
    v3 = result;
    BOOL v4 = (NSURLRequest *)[[NSURLRequest alloc] _initWithCFURLRequest:result];
    CFRelease(v3);
    return v4;
  }
  return result;
}

- (void)cancel
{
  self->_internal->downloadActive = 0;
  CFURLDownloadCancel((uint64_t)self->_internal->cfDownload);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLDownload;
  [(NSURLDownload *)&v3 dealloc];
}

- (NSData)resumeData
{
  CFDictionaryRef v2 = CFURLDownloadCopyResumeData((char *)self->_internal->cfDownload);
  objc_super v3 = (NSData *)v2;
  if (v2)
  {
    CFMakeCollectable(v2);
    BOOL v4 = v3;
  }
  return v3;
}

- (id)_resumeInformation
{
  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
  }
  if (cfDownload) {
    objc_super v3 = (URLDownload *)((char *)cfDownload + 16);
  }
  else {
    objc_super v3 = 0;
  }
  CFAllocatorRef v4 = CFGetAllocator(cfDownload);
  CFDictionaryRef ResumeInformation = URLDownload::createResumeInformation(v3, v4);
  CFDictionaryRef v6 = ResumeInformation;
  if (ResumeInformation)
  {
    CFMakeCollectable(ResumeInformation);
    CFDictionaryRef v7 = v6;
  }
  return v6;
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLDownload;
  return [(NSString *)[(NSURLDownload *)&v3 description] stringByAppendingFormat:@" { request: %@ }", [(NSURLDownload *)self request]];
}

- (NSURLDownload)initWithResumeData:(NSData *)resumeData delegate:(id)delegate path:(NSString *)path
{
  CFURLRef v8 = [(NSURLDownload *)self init];
  if (v8)
  {
    if ([(NSString *)path isAbsolutePath])
    {
      if (path) {
        path = (NSString *)CFURLCreateWithFileSystemPath(0, (CFStringRef)path, kCFURLPOSIXPathStyle, 0);
      }
      v12[4] = 0;
      v12[0] = 0;
      v12[1] = CFRetain(v8);
      v12[2] = 0;
      v12[3] = _NSURLDownloadReleaseClient;
      v12[5] = _NSURLDownloadDidStart;
      v12[6] = _NSURLDownloadWillSendRequest;
      v12[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
      v12[8] = _NSURLDownloadDidReceiveResponse;
      v12[9] = _NSURLDownloadWillResumeWithResponse;
      v12[10] = _NSURLDownloadDidReceiveData;
      v12[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
      v12[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
      v12[13] = _NSURLDownloadDidCreateDestination;
      v12[14] = _NSURLDownloadDidFinish;
      v12[15] = _NSURLDownloadDidFail;
      v8->_internal->uint64_t cfDownload = (_CFURLDownload *)CFURLDownloadCreateWithResumeData(0, (CFDataRef)resumeData, path, v12);
      CFMakeCollectable(v8->_internal->cfDownload);
      if (path) {
        CFRelease(path);
      }
      -[NSURLDownload _setDelegate:](v8, "_setDelegate:", delegate, v12[0]);
      uint64_t cfDownload = (uint64_t)v8->_internal->cfDownload;
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFURLDownloadScheduleWithRunLoop(cfDownload, (uint64_t)Current, *MEMORY[0x1E4F1D418]);
      CFURLDownloadStart((uint64_t)v8->_internal->cfDownload);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

uint64_t __29__NSURLDownload_sendDidFail___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:didFailWithError:");
}

uint64_t __30__NSURLDownload_sendDidFinish__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "downloadDidFinish:");
}

uint64_t __42__NSURLDownload_sendDidCreateDestination___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:didCreateDestination:");
}

uint64_t __62__NSURLDownload_sendDecideDestinationWithSuggestedObjectName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:decideDestinationWithSuggestedFilename:");
}

uint64_t __48__NSURLDownload_sendShouldDecodeDataOfMIMEType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:shouldDecodeSourceDataOfMIMEType:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __36__NSURLDownload_sendDidReceiveData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:didReceiveDataOfLength:");
}

uint64_t __57__NSURLDownload_sendWillResumeWithResponse_startingByte___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:willResumeWithResponse:fromByte:");
}

uint64_t __40__NSURLDownload_sendDidReceiveResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:didReceiveResponse:");
}

uint64_t __41__NSURLDownload_sendDidReceiveChallenge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:didReceiveAuthenticationChallenge:");
}

void __54__NSURLDownload_sendWillSendRequest_redirectResponse___block_invoke(void *a1)
{
  id v2 = [[NSURLRequest alloc] _initWithCFURLRequest:a1[6]];
  if (a1[7]) {
    +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
  }
  id v3 = (id)objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 32), "download:willSendRequest:redirectResponse:");

  if (v3 != v2)
  {
    if (v3) {
      CFRetain(v3);
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  }
}

uint64_t __30__NSURLDownload_sendDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "downloadDidBegin:");
}

void __30__NSURLDownload_sendDidStart___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "downloadShouldUseCredentialStorage:") & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
    if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
    }
    *(unsigned char *)(v2 + 336) = 0;
  }
}

- (id)_initWithResumeInformation:(id)a3 delegate:(id)a4 path:(id)a5
{
  CFURLRef v8 = [(NSURLDownload *)self init];
  if (v8)
  {
    if ([a5 isAbsolutePath])
    {
      if (a5) {
        a5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a5, kCFURLPOSIXPathStyle, 0);
      }
      v12[4] = 0;
      v12[0] = 0;
      v12[1] = CFRetain(v8);
      v12[2] = 0;
      v12[3] = _NSURLDownloadReleaseClient;
      v12[5] = _NSURLDownloadDidStart;
      v12[6] = _NSURLDownloadWillSendRequest;
      v12[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
      v12[8] = _NSURLDownloadDidReceiveResponse;
      v12[9] = _NSURLDownloadWillResumeWithResponse;
      v12[10] = _NSURLDownloadDidReceiveData;
      v12[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
      v12[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
      v12[13] = _NSURLDownloadDidCreateDestination;
      v12[14] = _NSURLDownloadDidFinish;
      v12[15] = _NSURLDownloadDidFail;
      v8->_internal->uint64_t cfDownload = (_CFURLDownload *)CFURLDownloadCreateWithResumeInformation(0, (const __CFDictionary *)a3, a5, v12);
      CFMakeCollectable(v8->_internal->cfDownload);
      if (a5) {
        CFRelease(a5);
      }
      -[NSURLDownload _setDelegate:](v8, "_setDelegate:", a4, v12[0]);
      uint64_t cfDownload = (uint64_t)v8->_internal->cfDownload;
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFURLDownloadScheduleWithRunLoop(cfDownload, (uint64_t)Current, *MEMORY[0x1E4F1D418]);
      CFURLDownloadStart((uint64_t)v8->_internal->cfDownload);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (id)_initWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5
{
  CFDictionaryRef v6 = [(NSURLDownload *)self initWithRequest:a3 delegate:a4];
  if (v6)
  {
    CFURLRef v7 = CFURLCreateWithString(0, (CFStringRef)a5, 0);
    if (v7)
    {
      CFURLRef v8 = v7;
      uint64_t cfDownload = v6->_internal->cfDownload;
      if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
        dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
      }
      if (cfDownload) {
        v10 = (URLDownload *)((char *)cfDownload + 16);
      }
      else {
        v10 = 0;
      }
      URLDownload::setDirectoryURL(v10, v8);
      CFRelease(v8);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (id)_initWithLoadingCFURLConnection:(_CFURLConnection *)a3 request:(_CFURLRequest *)a4 response:(_CFURLResponse *)a5 delegate:(id)a6 proxy:(id)a7
{
  v11 = [(NSURLDownload *)self init];
  v12 = v11;
  if (v11)
  {
    if (!a3) {
      goto LABEL_6;
    }
    if (!a4) {
      goto LABEL_6;
    }
    v14[4] = 0;
    v14[0] = 0;
    v14[1] = CFRetain(v11);
    v14[2] = 0;
    v14[3] = _NSURLDownloadReleaseClient;
    v14[5] = _NSURLDownloadDidStart;
    v14[6] = _NSURLDownloadWillSendRequest;
    v14[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
    v14[8] = _NSURLDownloadDidReceiveResponse;
    v14[9] = _NSURLDownloadWillResumeWithResponse;
    v14[10] = _NSURLDownloadDidReceiveData;
    v14[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
    v14[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
    v14[13] = _NSURLDownloadDidCreateDestination;
    v14[14] = _NSURLDownloadDidFinish;
    v14[15] = _NSURLDownloadDidFail;
    v12->_internal->uint64_t cfDownload = (_CFURLDownload *)CFURLDownloadCreateAndStartWithLoadingConnection(0, (char *)a3, a4, a5, v14);
    if (v12->_internal->cfDownload)
    {
      -[NSURLDownload _setDelegate:](v12, "_setDelegate:", a6, v14[0]);
      CFMakeCollectable(v12->_internal->cfDownload);
    }
    else
    {
LABEL_6:

      return 0;
    }
  }
  return v12;
}

- (id)_initWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7
{
  if (a3 && a4)
  {
    objc_msgSend((id)objc_msgSend(a3, "_cfInternal"), "_setShouldSkipCancelOnRelease:", 1);
    uint64_t v13 = [a3 _cfInternal];
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 72);
    }
    else {
      uint64_t v14 = 0;
    }
    return [(NSURLDownload *)self _initWithLoadingCFURLConnection:v14 request:a4 response:a5 delegate:a6 proxy:a7];
  }
  else
  {

    return 0;
  }
}

- (NSURLDownload)initWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  if (!request) {
    __assert_rtn("-[NSURLDownload initWithRequest:delegate:]", "NSURLDownload.mm", 128, "request");
  }
  CFDictionaryRef v6 = [(NSURLDownload *)self init];
  CFURLRef v7 = v6;
  if (v6)
  {
    v12[4] = 0;
    v12[0] = 0;
    v12[1] = CFRetain(v6);
    v12[2] = 0;
    v12[3] = _NSURLDownloadReleaseClient;
    v12[5] = _NSURLDownloadDidStart;
    v12[6] = _NSURLDownloadWillSendRequest;
    v12[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
    v12[8] = _NSURLDownloadDidReceiveResponse;
    v12[9] = _NSURLDownloadWillResumeWithResponse;
    v12[10] = _NSURLDownloadDidReceiveData;
    v12[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
    v12[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
    v12[13] = _NSURLDownloadDidCreateDestination;
    v12[14] = _NSURLDownloadDidFinish;
    v12[15] = _NSURLDownloadDidFail;
    v7->_internal->uint64_t cfDownload = (_CFURLDownload *)CFURLDownloadCreate(0, request, v12);
    uint64_t cfDownload = v7->_internal->cfDownload;
    if (cfDownload)
    {
      CFMakeCollectable(cfDownload);
      -[NSURLDownload _setDelegate:](v7, "_setDelegate:", delegate, v12[0]);
      uint64_t v9 = (uint64_t)v7->_internal->cfDownload;
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFURLDownloadScheduleWithRunLoop(v9, (uint64_t)Current, *MEMORY[0x1E4F1D418]);
      CFURLDownloadStart((uint64_t)v7->_internal->cfDownload);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSURLDownload)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSURLDownload;
  uint64_t v2 = [(NSURLDownload *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(NSURLDownloadInternal);
    v2->_internal = v3;
    v3->downloadActive = 1;
  }
  return v2;
}

+ (BOOL)canResumeDownloadDecodedWithEncodingMIMEType:(NSString *)MIMEType
{
  BOOL v4 = 1;
  if (CFStringCompare((CFStringRef)MIMEType, @"application/mac-binhex40", 1uLL)) {
    return CFStringCompare((CFStringRef)MIMEType, @"application/macbinary", 1uLL) == kCFCompareEqualTo;
  }
  return v4;
}

+ (id)_downloadWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5
{
  objc_super v5 = (void *)[objc_alloc((Class)a1) _initWithRequest:a3 delegate:a4 directory:a5];

  return v5;
}

+ (id)_downloadWithLoadingCFURLConnection:(_CFURLConnection *)a3 request:(_CFURLRequest *)a4 response:(_CFURLResponse *)a5 delegate:(id)a6 proxy:(id)a7
{
  CFURLRef v7 = (void *)[objc_alloc((Class)a1) _initWithLoadingCFURLConnection:a3 request:a4 response:a5 delegate:a6 proxy:a7];

  return v7;
}

+ (id)_downloadWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7
{
  CFURLRef v7 = (void *)[objc_alloc((Class)a1) _initWithLoadingConnection:a3 request:a4 response:a5 delegate:a6 proxy:a7];

  return v7;
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    objc_super v5 = objc_msgSend(v4, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E4F289A0], -1012, -[NSURLDownload url](self, "url"));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__NSURLDownload_NSURLAuthenticationChallengeSender__cancelAuthenticationChallenge___block_invoke;
    v6[3] = &unk_1E5257FB0;
    v6[4] = self;
    v6[5] = v5;
    [(NSURLDownload *)self withDelegate:v6];
  }
  -[NSURLDownload cleanupChallenges]((uint64_t)self);
  self->_internal->downloadActive = 0;
  CFURLDownloadCancel((uint64_t)self->_internal->cfDownload);
}

uint64_t __83__NSURLDownload_NSURLAuthenticationChallengeSender__cancelAuthenticationChallenge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "download:didFailWithError:");
}

- (void)cleanupChallenges
{
  if (a1)
  {

    *(void *)(*(void *)(a1 + 8) + 24) = 0;
    *(void *)(*(void *)(a1 + 8) + 16) = 0;
  }
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  internal = self->_internal;
  if (internal->currNSChallenge == a3)
  {
    uint64_t cfDownload = internal->cfDownload;
    currCFChallenge = internal->currCFChallenge;
    if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
    }
    if (cfDownload) {
      CFURLRef v7 = (URLDownload *)((char *)cfDownload + 16);
    }
    else {
      CFURLRef v7 = 0;
    }
    URLDownload::useCredential(v7, 0, currCFChallenge);
    -[NSURLDownload cleanupChallenges]((uint64_t)self);
  }
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  internal = self->_internal;
  if (internal->currNSChallenge == a4)
  {
    uint64_t cfDownload = internal->cfDownload;
    CFURLRef v7 = (const _CFURLCredential *)[a3 _cfurlcredential];
    currCFChallenge = self->_internal->currCFChallenge;
    if (URLDownload::Class(void)::sOnce_URLDownload != -1) {
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_5409);
    }
    if (cfDownload) {
      uint64_t v9 = (URLDownload *)((char *)cfDownload + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    URLDownload::useCredential(v9, v7, currCFChallenge);
    -[NSURLDownload cleanupChallenges]((uint64_t)self);
  }
}

@end