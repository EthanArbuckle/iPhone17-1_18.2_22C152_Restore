@interface WFGetExternalAddressOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (BOOL)useIPv6;
- (NSError)error;
- (NSMutableData)data;
- (NSString)result;
- (__CFReadStream)stream;
- (void)dealloc;
- (void)handleStreamEvent:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
- (void)setStream:(__CFReadStream *)a3;
- (void)setUseIPv6:(BOOL)a3;
- (void)start;
- (void)update;
@end

@implementation WFGetExternalAddressOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (__CFReadStream)stream
{
  return self->_stream;
}

- (void)setData:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)result
{
  return self->_result;
}

- (void)setUseIPv6:(BOOL)a3
{
  self->_useIPv6 = a3;
}

- (BOOL)useIPv6
{
  return self->_useIPv6;
}

- (BOOL)isFinished
{
  return self->_error || self->_result != 0;
}

- (BOOL)isExecuting
{
  return ![(WFGetExternalAddressOperation *)self isFinished];
}

- (BOOL)isReady
{
  return 1;
}

- (void)update
{
  [(WFGetExternalAddressOperation *)self willChangeValueForKey:@"isExecuting"];
  [(WFGetExternalAddressOperation *)self didChangeValueForKey:@"isExecuting"];
  [(WFGetExternalAddressOperation *)self willChangeValueForKey:@"isFinished"];
  [(WFGetExternalAddressOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  [(WFGetExternalAddressOperation *)self update];
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
  [(WFGetExternalAddressOperation *)self update];
}

- (void)handleStreamEvent:(unint64_t)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0x10uLL:
      v5 = (void *)[[NSString alloc] initWithData:self->_data encoding:4];
      [(WFGetExternalAddressOperation *)self setResult:v5];

      v6 = [(WFGetExternalAddressOperation *)self result];

      if (!v6)
      {
        v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v8 = *MEMORY[0x263F08438];
        uint64_t v14 = *MEMORY[0x263F08320];
        v9 = WFLocalizedString(@"The response data was not a valid string.");
        v15[0] = v9;
        v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
        v11 = [v7 errorWithDomain:v8 code:79 userInfo:v10];
        [(WFGetExternalAddressOperation *)self setError:v11];
      }
      break;
    case 8uLL:
      CFErrorRef v13 = CFReadStreamCopyError(self->_stream);
      -[WFGetExternalAddressOperation setError:](self, "setError:");

      break;
    case 2uLL:
      CFIndex v4 = CFReadStreamRead(self->_stream, v12, 1024);
      if (v4 >= 1) {
        [(NSMutableData *)self->_data appendBytes:v12 length:v4];
      }
      break;
  }
}

- (void)dealloc
{
  stream = self->_stream;
  if (stream) {
    CFRelease(stream);
  }
  v4.receiver = self;
  v4.super_class = (Class)WFGetExternalAddressOperation;
  [(WFGetExternalAddressOperation *)&v4 dealloc];
}

- (void)setStream:(__CFReadStream *)a3
{
  stream = self->_stream;
  if (a3) {
    CFRetain(a3);
  }
  self->_stream = a3;
  if (stream)
  {
    CFRelease(stream);
  }
}

- (void)start
{
  v3 = (void *)MEMORY[0x263F08BA0];
  objc_super v4 = [NSURL URLWithString:@"https://www.icloud.com/shortcuts/api/external_ip"];
  v5 = [v3 componentsWithURL:v4 resolvingAgainstBaseURL:0];

  v6 = [v5 host];
  v7 = +[WFNetworkInterface activeNetworkInterface];
  if (v7)
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__WFGetExternalAddressOperation_start__block_invoke;
    block[3] = &unk_264E5E938;
    id v11 = v6;
    v12 = self;
    id v13 = v5;
    dispatch_async(v8, block);
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:50 userInfo:0];
    [(WFGetExternalAddressOperation *)self setError:v9];
  }
}

void __38__WFGetExternalAddressOperation_start__block_invoke(id *a1)
{
  v38[1] = *MEMORY[0x263EF8340];
  v2 = (const char *)[a1[4] UTF8String];
  if ([a1[5] useIPv6]) {
    int v3 = 30;
  }
  else {
    int v3 = 2;
  }
  objc_super v4 = gethostbyname2(v2, v3);
  if (!v4)
  {
    uint64_t v8 = (int *)MEMORY[0x263EF88E8];
    v9 = hstrerror(*MEMORY[0x263EF88E8]);
    if (v9)
    {
      uint64_t v37 = *MEMORY[0x263F08320];
      v10 = [NSString stringWithUTF8String:v9];
      v38[0] = v10;
      id v11 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    }
    else
    {
      id v11 = 0;
    }
    v17 = [MEMORY[0x263F087E8] errorWithDomain:@"WFNetDBErrorDomain" code:*v8 userInfo:v11];
    [a1[5] setError:v17];

    goto LABEL_26;
  }
  v5 = v4;
  v6 = *v4->h_addr_list;
  if (!v6)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = (int)*MEMORY[0x263EF88E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    id v11 = WFLocalizedString(@"The domain could not be found.");
    v36 = v11;
    uint64_t v14 = NSDictionary;
    v15 = &v36;
    v16 = &v35;
LABEL_25:
    v28 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    v29 = [v12 errorWithDomain:@"WFNetDBErrorDomain" code:v13 userInfo:v28];
    [a1[5] setError:v29];

    goto LABEL_26;
  }
  int h_addrtype = v4->h_addrtype;
  if (h_addrtype == 2)
  {
    clientContext.info = 0;
    clientContext.version = 528;
    HIDWORD(clientContext.version) = *(_DWORD *)v6;
  }
  else
  {
    if (h_addrtype != 30)
    {
LABEL_24:
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = (int)*MEMORY[0x263EF88E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      id v11 = WFLocalizedString(@"The domain could not be found. (Error 2)");
      v34 = v11;
      uint64_t v14 = NSDictionary;
      v15 = &v34;
      v16 = &v33;
      goto LABEL_25;
    }
    memset(&clientContext.info, 0, 20);
    clientContext.version = 28;
    *(_OWORD *)&clientContext.info = *(_OWORD *)v6;
    BYTE1(clientContext.version) = 30;
  }
  id v11 = WFStringFromIPSocketAddress((unsigned __int8 *)&clientContext);
  if (!v11) {
    goto LABEL_24;
  }
  if (v5->h_addrtype == 30) {
    v18 = @"[%@]";
  }
  else {
    v18 = @"%@";
  }
  v19 = objc_msgSend(NSString, "stringWithFormat:", v18, v11);
  [a1[6] setPercentEncodedHost:v19];

  CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v21 = [a1[6] URL];
  Request = CFHTTPMessageCreateRequest(v20, @"GET", v21, (CFStringRef)*MEMORY[0x263EFC708]);

  CFHTTPMessageSetHeaderFieldValue(Request, @"Host", (CFStringRef)a1[4]);
  v23 = CFReadStreamCreateForHTTPRequest(v20, Request);
  CFReadStreamSetProperty(v23, (CFStreamPropertyKey)*MEMORY[0x263EFC7A0], (CFTypeRef)*MEMORY[0x263EFFB40]);
  CFStringRef v24 = (const __CFString *)*MEMORY[0x263EFC800];
  id v25 = a1[4];
  uint64_t v31 = *MEMORY[0x263EFC860];
  id v32 = v25;
  CFReadStreamSetProperty(v23, v24, (CFTypeRef)[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1]);
  [a1[5] setStream:v23];
  v26 = objc_opt_new();
  [a1[5] setData:v26];

  if (v23) {
    CFRelease(v23);
  }
  if (Request) {
    CFRelease(Request);
  }
  memset(&clientContext, 0, sizeof(clientContext));
  clientContext.info = a1[5];
  CFReadStreamSetClient(v23, 0x1AuLL, (CFReadStreamClientCallBack)WFStreamClientCallback, &clientContext);
  Main = CFRunLoopGetMain();
  CFReadStreamScheduleWithRunLoop(v23, Main, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  CFReadStreamOpen(v23);
LABEL_26:
}

@end