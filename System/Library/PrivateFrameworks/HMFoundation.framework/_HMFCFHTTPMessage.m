@interface _HMFCFHTTPMessage
+ (id)dateFormatter;
+ (id)requestWithMethod:(id)a3 url:(id)a4 protocolVersion:(int64_t)a5;
+ (id)responseWithStatusCode:(int64_t)a3 statusDescription:(id)a4 protocolVersion:(int64_t)a5;
- (NSData)body;
- (NSDictionary)headerFields;
- (_HMFCFHTTPMessage)init;
- (_HMFCFHTTPMessage)initWithMessageRef:(__CFHTTPMessage *)a3;
- (__CFHTTPMessage)message;
- (id)contentType;
- (id)date;
- (id)valueForHeaderField:(id)a3;
- (int64_t)contentLength;
- (void)dealloc;
- (void)setBody:(id)a3;
- (void)setContentLength:(int64_t)a3;
- (void)setContentType:(id)a3;
- (void)setDate:(id)a3;
- (void)setValue:(id)a3 forHeaderField:(id)a4;
@end

@implementation _HMFCFHTTPMessage

+ (id)dateFormatter
{
  if (qword_1EB4EECC0 != -1) {
    dispatch_once(&qword_1EB4EECC0, &__block_literal_global_4);
  }
  v2 = (void *)_MergedGlobals_56;
  return v2;
}

+ (id)requestWithMethod:(id)a3 url:(id)a4 protocolVersion:(int64_t)a5
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFURLRef v9 = (const __CFURL *)a4;
  v10 = (__CFString *)a3;
  CFStringRef v11 = (const __CFString *)HMFHTTPProtocolVersionString(a5);
  CFHTTPMessageRef Request = CFHTTPMessageCreateRequest(v8, v10, v9, v11);

  if (Request)
  {
    v13 = (void *)[objc_alloc((Class)a1) initWithMessageRef:Request];
    CFRelease(Request);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)responseWithStatusCode:(int64_t)a3 statusDescription:(id)a4 protocolVersion:(int64_t)a5
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFURLRef v9 = (__CFString *)a4;
  CFStringRef v10 = (const __CFString *)HMFHTTPProtocolVersionString(a5);
  CFHTTPMessageRef Response = CFHTTPMessageCreateResponse(v8, a3, v9, v10);

  if (Response)
  {
    v12 = (void *)[objc_alloc((Class)a1) initWithMessageRef:Response];
    CFRelease(Response);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (_HMFCFHTTPMessage)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFCFHTTPMessage)initWithMessageRef:(__CFHTTPMessage *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HMFCFHTTPMessage;
  v4 = [(_HMFCFHTTPMessage *)&v6 init];
  if (v4) {
    v4->_message = (__CFHTTPMessage *)CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  message = self->_message;
  if (message) {
    CFRelease(message);
  }
  v4.receiver = self;
  v4.super_class = (Class)_HMFCFHTTPMessage;
  [(_HMFCFHTTPMessage *)&v4 dealloc];
}

- (NSDictionary)headerFields
{
  CFDictionaryRef v2 = CFHTTPMessageCopyAllHeaderFields([(_HMFCFHTTPMessage *)self message]);
  return (NSDictionary *)v2;
}

- (id)valueForHeaderField:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  v5 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue([(_HMFCFHTTPMessage *)self message], v4);

  return v5;
}

- (void)setValue:(id)a3 forHeaderField:(id)a4
{
  objc_super v6 = (__CFString *)a4;
  value = (__CFString *)a3;
  CFHTTPMessageSetHeaderFieldValue([(_HMFCFHTTPMessage *)self message], v6, value);
}

- (id)date
{
  CFDictionaryRef v2 = [(_HMFCFHTTPMessage *)self valueForHeaderField:@"Date"];
  uint64_t v3 = [(id)objc_opt_class() dateFormatter];
  objc_super v4 = [v3 dateFromString:v2];

  return v4;
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() dateFormatter];
  id v6 = [v5 stringFromDate:v4];

  [(_HMFCFHTTPMessage *)self setValue:v6 forHeaderField:@"Date"];
}

- (id)contentType
{
  return [(_HMFCFHTTPMessage *)self valueForHeaderField:@"Content-Type"];
}

- (void)setContentType:(id)a3
{
}

- (int64_t)contentLength
{
  CFDictionaryRef v2 = [(_HMFCFHTTPMessage *)self valueForHeaderField:@"Content-Length"];
  uint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)setContentLength:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(_HMFCFHTTPMessage *)self setValue:v4 forHeaderField:@"Content-Length"];
}

- (NSData)body
{
  CFDataRef v2 = CFHTTPMessageCopyBody([(_HMFCFHTTPMessage *)self message]);
  return (NSData *)v2;
}

- (void)setBody:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  CFHTTPMessageSetBody([(_HMFCFHTTPMessage *)self message], v4);
  uint64_t v5 = [(__CFData *)v4 length];

  [(_HMFCFHTTPMessage *)self setContentLength:v5];
}

- (__CFHTTPMessage)message
{
  return self->_message;
}

@end