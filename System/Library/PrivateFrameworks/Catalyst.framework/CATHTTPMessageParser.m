@interface CATHTTPMessageParser
+ (id)encodeRequestData:(id)a3;
+ (id)responseHeaderForContentWithLength:(unint64_t)a3;
- (BOOL)appendBytes:(const char *)a3 length:(unint64_t)a4;
- (CATHTTPMessageParserDelegate)delegate;
- (void)dealloc;
- (void)delegateDidReceiveRequestData:(id)a3;
- (void)delegateDidReceiveRequestWithURL:(id)a3;
- (void)delegateDidReceiveResponseData:(id)a3 moreComing:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CATHTTPMessageParser

- (void)dealloc
{
  mCurrentMessage = self->mCurrentMessage;
  if (mCurrentMessage)
  {
    CFRelease(mCurrentMessage);
    self->mCurrentMessage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CATHTTPMessageParser;
  [(CATHTTPMessageParser *)&v4 dealloc];
}

- (BOOL)appendBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!a4) {
    goto LABEL_16;
  }
  mCurrentMessage = self->mCurrentMessage;
  if (!mCurrentMessage)
  {
    mCurrentMessage = CFHTTPMessageCreateEmpty((CFAllocatorRef)*MEMORY[0x263EFFB08], *a3 != 72);
    self->mCurrentMessage = mCurrentMessage;
  }
  if (CFHTTPMessageIsHeaderComplete(mCurrentMessage) && !CFHTTPMessageIsRequest(self->mCurrentMessage))
  {
    int v8 = 0;
  }
  else
  {
    if (!CFHTTPMessageAppendBytes(self->mCurrentMessage, (const UInt8 *)a3, a4)) {
      goto LABEL_38;
    }
    int v8 = 1;
  }
  mCurrentHeaderFields = self->mCurrentHeaderFields;
  if (mCurrentHeaderFields) {
    goto LABEL_13;
  }
  if (CFHTTPMessageIsHeaderComplete(self->mCurrentMessage))
  {
    v10 = (NSDictionary *)CFHTTPMessageCopyAllHeaderFields(self->mCurrentMessage);
    v11 = self->mCurrentHeaderFields;
    self->mCurrentHeaderFields = v10;

    v12 = [(NSDictionary *)self->mCurrentHeaderFields objectForKeyedSubscript:@"Content-Length"];
    uint64_t v13 = [v12 length];

    if (!v13)
    {
      if (CFHTTPMessageIsRequest(self->mCurrentMessage))
      {
        id v17 = (id)CFHTTPMessageCopyRequestMethod(self->mCurrentMessage);
        int v18 = [v17 isEqualToString:@"GET"];
        if (v18)
        {
          CFURLRef v27 = CFHTTPMessageCopyRequestURL(self->mCurrentMessage);
          [(CATHTTPMessageParser *)self delegateDidReceiveRequestWithURL:v27];
        }
        goto LABEL_34;
      }
LABEL_38:
      LOBYTE(v18) = 0;
      return v18;
    }
  }
  mCurrentHeaderFields = self->mCurrentHeaderFields;
  if (mCurrentHeaderFields)
  {
LABEL_13:
    v14 = [(NSDictionary *)mCurrentHeaderFields objectForKeyedSubscript:@"Content-Length"];
    unint64_t v15 = [v14 integerValue];

    if (CFHTTPMessageIsRequest(self->mCurrentMessage))
    {
      CFDataRef v16 = CFHTTPMessageCopyBody(self->mCurrentMessage);
      if ([(__CFData *)v16 length] < v15)
      {
        id v17 = 0;
        goto LABEL_31;
      }
      v19 = -[__CFData subdataWithRange:](v16, "subdataWithRange:", 0, v15);
      v20 = -[__CFData subdataWithRange:](v16, "subdataWithRange:", v15, [(__CFData *)v16 length] - v15);
      CFRelease(self->mCurrentMessage);
      self->mCurrentMessage = 0;
      [(CATHTTPMessageParser *)self delegateDidReceiveRequestData:v19];
      v21 = self->mCurrentHeaderFields;
      self->mCurrentHeaderFields = 0;

      if ([v20 length])
      {
        id v17 = v20;
        LOBYTE(v18) = -[CATHTTPMessageParser appendBytes:length:](self, "appendBytes:length:", [v17 bytes], objc_msgSend(v17, "length"));

LABEL_34:
        return v18;
      }
      id v17 = v16;
    }
    else
    {
      if (v8)
      {
        id v17 = CFHTTPMessageCopyBody(self->mCurrentMessage);
        if (![v17 length]) {
          goto LABEL_33;
        }
      }
      else
      {
        id v17 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
      }
      unint64_t v22 = v15 - self->mCurrentBytesReceived;
      unint64_t v23 = [v17 length];
      if (v22 >= v23) {
        unint64_t v24 = v23;
      }
      else {
        unint64_t v24 = v22;
      }
      v19 = objc_msgSend(v17, "subdataWithRange:", 0, v24);
      v20 = objc_msgSend(v17, "subdataWithRange:", objc_msgSend(v19, "length"), objc_msgSend(v17, "length") - objc_msgSend(v19, "length"));
      unint64_t v25 = self->mCurrentBytesReceived + [v19 length];
      self->mCurrentBytesReceived = v25;
      if (v25 >= v15)
      {
        CFRelease(self->mCurrentMessage);
        self->mCurrentMessage = 0;
        [(CATHTTPMessageParser *)self delegateDidReceiveResponseData:v19 moreComing:0];
        v26 = self->mCurrentHeaderFields;
        self->mCurrentHeaderFields = 0;

        self->mCurrentBytesReceived = 0;
      }
      else
      {
        [(CATHTTPMessageParser *)self delegateDidReceiveResponseData:v19 moreComing:1];
      }
    }

    CFDataRef v16 = (CFDataRef)v17;
    id v17 = v20;
LABEL_31:

    if ([v17 length])
    {
      id v17 = v17;
      LOBYTE(v18) = -[CATHTTPMessageParser appendBytes:length:](self, "appendBytes:length:", [v17 bytes], objc_msgSend(v17, "length"));
      goto LABEL_34;
    }
LABEL_33:
    LOBYTE(v18) = 1;
    goto LABEL_34;
  }
LABEL_16:
  LOBYTE(v18) = 1;
  return v18;
}

+ (id)encodeRequestData:(id)a3
{
  uint64_t v3 = encodeRequestData__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&encodeRequestData__onceToken, &__block_literal_global_2);
  }
  Request = CFHTTPMessageCreateRequest((CFAllocatorRef)*MEMORY[0x263EFFB08], @"POST", (CFURLRef)encodeRequestData__postURL, @"1.1");
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v4, "length"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Length", v6);
  CFHTTPMessageSetBody(Request, (CFDataRef)v4);

  CFDataRef v7 = CFHTTPMessageCopySerializedMessage(Request);
  CFRelease(Request);

  return v7;
}

uint64_t __42__CATHTTPMessageParser_encodeRequestData___block_invoke()
{
  uint64_t v0 = [NSURL URLWithString:@"http://localhost/"];
  uint64_t v1 = encodeRequestData__postURL;
  encodeRequestData__postURL = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)responseHeaderForContentWithLength:(unint64_t)a3
{
  Response = CFHTTPMessageCreateResponse((CFAllocatorRef)*MEMORY[0x263EFFB08], 200, 0, (CFStringRef)*MEMORY[0x263EFC708]);
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Response, @"Content-Length", v5);
  CFDataRef v6 = CFHTTPMessageCopySerializedMessage(Response);
  CFRelease(Response);

  return v6;
}

- (void)delegateDidReceiveRequestData:(id)a3
{
  id v7 = a3;
  id v4 = [(CATHTTPMessageParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    CFDataRef v6 = [(CATHTTPMessageParser *)self delegate];
    [v6 messageParser:self didParseRequestData:v7];
  }
}

- (void)delegateDidReceiveResponseData:(id)a3 moreComing:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  CFDataRef v6 = [(CATHTTPMessageParser *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(CATHTTPMessageParser *)self delegate];
    [v8 messageParser:self didParseResponseData:v9 moreComing:v4];
  }
}

- (void)delegateDidReceiveRequestWithURL:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(CATHTTPMessageParser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    CFDataRef v6 = [(CATHTTPMessageParser *)self delegate];
    [v6 messageParser:self didParseRequestWithURL:v7];
  }
}

- (CATHTTPMessageParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATHTTPMessageParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->mCurrentHeaderFields, 0);
}

@end