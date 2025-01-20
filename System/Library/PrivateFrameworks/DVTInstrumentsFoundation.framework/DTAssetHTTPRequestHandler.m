@interface DTAssetHTTPRequestHandler
- (BOOL)sentHeader;
- (DTAssetHTTPRequestHandler)initWithSocket:(id)a3 channel:(id)a4;
- (DTXChannel)channel;
- (NSSet)allowedResources;
- (NSString)identifier;
- (_DT_GCDAsyncSocket)socket;
- (id)completion;
- (unint64_t)dataSent;
- (void)dealloc;
- (void)receivedMessage:(id)a3;
- (void)requestAssetAtPath:(id)a3;
- (void)sendDataChunk:(id)a3;
- (void)serveErrorMessageForError:(id)a3;
- (void)serveResponseAndDisconnect:(__CFHTTPMessage *)a3;
- (void)setAllowedResources:(id)a3;
- (void)setChannel:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDataSent:(unint64_t)a3;
- (void)setSentHeader:(BOOL)a3;
- (void)setSocket:(id)a3;
- (void)socket:(id)a3 didReadData:(id)a4 withTag:(int64_t)a5;
- (void)socketDidDisconnect:(id)a3 withError:(id)a4;
- (void)startReading;
@end

@implementation DTAssetHTTPRequestHandler

- (DTAssetHTTPRequestHandler)initWithSocket:(id)a3 channel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTAssetHTTPRequestHandler;
  v8 = [(DTAssetHTTPRequestHandler *)&v15 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    [(DTAssetHTTPRequestHandler *)v8 setSocket:v6];
    v12 = [(DTAssetHTTPRequestHandler *)v8 socket];
    [v12 setDelegate:v8];

    [(DTAssetHTTPRequestHandler *)v8 setChannel:v7];
    [(DTAssetHTTPRequestHandler *)v8 setDataSent:0];
    v13 = +[DTAssetResponseBroker sharedBroker];
    [v13 registerHandler:v8];
  }
  return v8;
}

- (void)dealloc
{
  httpMessage = self->_httpMessage;
  if (httpMessage)
  {
    CFRelease(httpMessage);
    self->_httpMessage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTAssetHTTPRequestHandler;
  [(DTAssetHTTPRequestHandler *)&v4 dealloc];
}

- (void)startReading
{
  httpMessage = self->_httpMessage;
  if (httpMessage) {
    CFRelease(httpMessage);
  }
  self->_httpMessage = CFHTTPMessageCreateEmpty(0, 1u);
  id v4 = [(DTAssetHTTPRequestHandler *)self socket];
  [v4 readDataWithTimeout:0 tag:600.0];
}

- (void)requestAssetAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(DTAssetHTTPRequestHandler *)self identifier];
  id v8 = +[DTAssetRequest requestWithIdentifier:v5 path:v4];

  id v6 = [(DTAssetHTTPRequestHandler *)self channel];
  id v7 = [v8 message];
  [v6 sendMessage:v7 replyHandler:0];
}

- (void)receivedMessage:(id)a3
{
  id v14 = a3;
  id v4 = [v14 error];

  if (v4)
  {
    v5 = [v14 error];
    [(DTAssetHTTPRequestHandler *)self serveErrorMessageForError:v5];
    goto LABEL_12;
  }
  v5 = [MEMORY[0x263EFFA08] setWithObjects:nil];
  id v6 = [v14 objectWithAllowedClasses:v5];

  if (!v6) {
    goto LABEL_10;
  }
  id v7 = [(DTAssetHTTPRequestHandler *)self socket];

  if (!v7) {
    goto LABEL_12;
  }
  id v8 = [v14 objectWithAllowedClasses:v5];
  v9 = [v8 data];

  if (!v9)
  {
    if ([v8 isCompleted])
    {
      id v10 = [(DTAssetHTTPRequestHandler *)self identifier];
      syslog(5, "ODR: Request %s sent %llu bytes", (const char *)[v10 UTF8String], -[DTAssetHTTPRequestHandler dataSent](self, "dataSent"));

      v11 = [(DTAssetHTTPRequestHandler *)self socket];
      v12 = [@"0\r\n\r\n" dataUsingEncoding:1];
      [v11 writeData:v12 withTimeout:2 tag:600.0];

      v13 = [(DTAssetHTTPRequestHandler *)self socket];
      [v13 disconnectAfterWriting];

      goto LABEL_11;
    }

LABEL_10:
    id v8 = [v14 description];
    syslog(3, "ODR: Got a message we're not sure how to handle: %s", (const char *)[v8 UTF8String]);
    goto LABEL_11;
  }
  [(DTAssetHTTPRequestHandler *)self sendDataChunk:v8];
LABEL_11:

LABEL_12:
}

- (void)sendDataChunk:(id)a3
{
  id v4 = a3;
  if (![(DTAssetHTTPRequestHandler *)self sentHeader])
  {
    Response = CFHTTPMessageCreateResponse(0, 200, 0, (CFStringRef)*MEMORY[0x263EFC708]);
    CFHTTPMessageSetHeaderFieldValue(Response, @"Transfer-Encoding", @"chunked");
    CFDataRef v6 = CFHTTPMessageCopySerializedMessage(Response);
    id v7 = [(DTAssetHTTPRequestHandler *)self socket];
    [v7 writeData:v6 withTimeout:0 tag:600.0];

    CFRelease(Response);
    [(DTAssetHTTPRequestHandler *)self setSentHeader:1];
  }
  id v8 = NSString;
  v9 = [v4 data];
  [v8 stringWithFormat:@"%lx\r\n", [v9 length]];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [(DTAssetHTTPRequestHandler *)self socket];
  v11 = [v17 dataUsingEncoding:1];
  [v10 writeData:v11 withTimeout:2 tag:600.0];

  v12 = [(DTAssetHTTPRequestHandler *)self socket];
  v13 = [v4 data];
  [v12 writeData:v13 withTimeout:1 tag:600.0];

  id v14 = [v4 data];

  -[DTAssetHTTPRequestHandler setDataSent:](self, "setDataSent:", -[DTAssetHTTPRequestHandler dataSent](self, "dataSent") + [v14 length]);
  objc_super v15 = [(DTAssetHTTPRequestHandler *)self socket];
  v16 = [@"\r\n" dataUsingEncoding:1];
  [v15 writeData:v16 withTimeout:2 tag:600.0];
}

- (void)serveErrorMessageForError:(id)a3
{
  id v4 = a3;
  CFIndex v5 = [v4 code];
  Response = CFHTTPMessageCreateResponse(0, v5, 0, (CFStringRef)*MEMORY[0x263EFC700]);
  id v7 = NSString;
  id v8 = [v4 localizedDescription];

  id v9 = [v7 stringWithFormat:@"Error retrieving requested asset: %@", v8];

  CFHTTPMessageSetBody(Response, (CFDataRef)[v9 dataUsingEncoding:4]);
  [(DTAssetHTTPRequestHandler *)self serveResponseAndDisconnect:Response];
  CFRelease(Response);
}

- (void)serveResponseAndDisconnect:(__CFHTTPMessage *)a3
{
  CFDataRef v6 = CFHTTPMessageCopySerializedMessage(a3);
  id v4 = [(DTAssetHTTPRequestHandler *)self socket];
  [v4 writeData:v6 withTimeout:0 tag:600.0];

  CFIndex v5 = [(DTAssetHTTPRequestHandler *)self socket];
  [v5 disconnectAfterWriting];
}

- (void)socket:(id)a3 didReadData:(id)a4 withTag:(int64_t)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  httpMessage = self->_httpMessage;
  id v9 = a4;
  id v10 = (const UInt8 *)[v9 bytes];
  CFIndex v11 = [v9 length];

  CFHTTPMessageAppendBytes(httpMessage, v10, v11);
  if (CFHTTPMessageIsHeaderComplete(self->_httpMessage))
  {
    v12 = (__CFString *)CFHTTPMessageCopyRequestMethod(self->_httpMessage);
    if ([@"GET" isEqualToString:v12])
    {
      v13 = CFHTTPMessageCopyRequestURL(self->_httpMessage);
      id v14 = [(DTAssetHTTPRequestHandler *)self allowedResources];
      objc_super v15 = [v13 absoluteString];
      int v16 = [v14 containsObject:v15];

      if (v16)
      {
        id v17 = [(DTAssetHTTPRequestHandler *)self identifier];
        v18 = (const char *)[v17 UTF8String];
        id v19 = [v13 absoluteString];
        syslog(5, "ODR: Received GET request %s for asset pack %s. Requesting from Xcode.", v18, (const char *)[v19 UTF8String]);

        v20 = [v13 path];
        [(DTAssetHTTPRequestHandler *)self requestAssetAtPath:v20];
LABEL_11:

        goto LABEL_12;
      }
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      v30[0] = @"Not found.";
      v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
      v24 = v22;
      uint64_t v25 = 404;
    }
    else
    {
      if ([@"HEAD" isEqualToString:v12])
      {
        syslog(5, "ODR: Received HEAD request for asset pack. Sending default 200 response.");
        CFHTTPMessageRef Response = CFHTTPMessageCreateResponse(0, 200, 0, (CFStringRef)*MEMORY[0x263EFC700]);
        [(DTAssetHTTPRequestHandler *)self serveResponseAndDisconnect:Response];
        CFRelease(Response);
LABEL_12:

        goto LABEL_13;
      }
      v13 = [NSString stringWithFormat:@"This server does not handle %@ requests.", v12];
      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      v28 = v13;
      v23 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v24 = v26;
      uint64_t v25 = 500;
    }
    v20 = [v24 errorWithDomain:@"DTAssetHTTPRequestHandler" code:v25 userInfo:v23];

    [(DTAssetHTTPRequestHandler *)self serveErrorMessageForError:v20];
    goto LABEL_11;
  }
  [v7 readDataWithTimeout:0 tag:600.0];
LABEL_13:
}

- (void)socketDidDisconnect:(id)a3 withError:(id)a4
{
  id v9 = a4;
  [(DTAssetHTTPRequestHandler *)self setSocket:0];
  id v5 = [(DTAssetHTTPRequestHandler *)self identifier];
  CFDataRef v6 = (const char *)[v5 UTF8String];
  if (v9)
  {
    id v7 = [v9 description];
    syslog(4, "ODR: Socket %s disconnected with error: %s", v6, (const char *)[v7 UTF8String]);
  }
  else
  {
    syslog(6, "ODR: Socket %s disconnected without error.", v6);
  }

  id v8 = +[DTAssetResponseBroker sharedBroker];
  [v8 unregisterHandler:self];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)allowedResources
{
  return self->_allowedResources;
}

- (void)setAllowedResources:(id)a3
{
}

- (DTXChannel)channel
{
  return (DTXChannel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setChannel:(id)a3
{
}

- (_DT_GCDAsyncSocket)socket
{
  return (_DT_GCDAsyncSocket *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSocket:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)sentHeader
{
  return self->_sentHeader;
}

- (void)setSentHeader:(BOOL)a3
{
  self->_sentHeader = a3;
}

- (unint64_t)dataSent
{
  return self->_dataSent;
}

- (void)setDataSent:(unint64_t)a3
{
  self->_dataSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_allowedResources, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end