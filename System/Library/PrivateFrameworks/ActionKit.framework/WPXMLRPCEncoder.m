@interface WPXMLRPCEncoder
- (BOOL)encodeToFile:(id)a3 error:(id *)a4;
- (NSArray)parameters;
- (NSData)body;
- (NSString)method;
- (WPXMLRPCEncoder)init;
- (WPXMLRPCEncoder)initWithMethod:(id)a3 andParameters:(id)a4;
- (WPXMLRPCEncoder)initWithResponseFaultCode:(id)a3 andString:(id)a4;
- (WPXMLRPCEncoder)initWithResponseParams:(id)a3;
- (id)dataEncodedWithError:(id *)a3;
- (id)tmpFilePathForCache;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)encodeArray:(id)a3;
- (void)encodeBoolean:(__CFBoolean *)a3;
- (void)encodeData:(id)a3;
- (void)encodeDate:(id)a3;
- (void)encodeDictionary:(id)a3;
- (void)encodeFileHandle:(id)a3;
- (void)encodeForStreaming;
- (void)encodeInputStream:(id)a3;
- (void)encodeNumber:(id)a3;
- (void)encodeObject:(id)a3;
- (void)encodeString:(id)a3 omitTag:(BOOL)a4;
- (void)valueTag:(id)a3 value:(id)a4;
@end

@implementation WPXMLRPCEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultString, 0);
  objc_storeStrong((id *)&self->_faultCode, 0);
  objc_storeStrong((id *)&self->_streamingCacheFile, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_method, 0);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)method
{
  return self->_method;
}

- (id)tmpFilePathForCache
{
  v2 = NSTemporaryDirectory();
  v3 = [MEMORY[0x263F08AB0] processInfo];
  v4 = [v3 globallyUniqueString];

  v5 = [v2 stringByAppendingPathComponent:v4];

  return v5;
}

- (void)appendFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(WPXMLRPCEncoder *)self appendString:v6];
}

- (void)appendString:(id)a3
{
  streamingCacheFile = self->_streamingCacheFile;
  id v4 = [a3 dataUsingEncoding:4];
  [(NSFileHandle *)streamingCacheFile writeData:v4];
}

- (void)encodeFileHandle:(id)a3
{
  id v4 = a3;
  [(WPXMLRPCEncoder *)self appendString:@"<value><base64>"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__WPXMLRPCEncoder_encodeFileHandle___block_invoke;
  v5[3] = &unk_264E5C0E0;
  v5[4] = self;
  +[WPBase64Utils encodeFileHandle:v4 withChunkHandler:v5];

  [(WPXMLRPCEncoder *)self appendString:@"</base64></value>"];
}

uint64_t __36__WPXMLRPCEncoder_encodeFileHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

- (void)encodeInputStream:(id)a3
{
  id v4 = a3;
  [(WPXMLRPCEncoder *)self appendString:@"<value><base64>"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__WPXMLRPCEncoder_encodeInputStream___block_invoke;
  v5[3] = &unk_264E5C0E0;
  v5[4] = self;
  +[WPBase64Utils encodeInputStream:v4 withChunkHandler:v5];

  [(WPXMLRPCEncoder *)self appendString:@"</base64></value>"];
}

uint64_t __37__WPXMLRPCEncoder_encodeInputStream___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

- (void)encodeData:(id)a3
{
  id v4 = +[WPBase64Utils encodeData:a3];
  [(WPXMLRPCEncoder *)self valueTag:@"base64" value:v4];
}

- (void)encodeDate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v10 = (id)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v7 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
  [v10 setTimeZone:v7];

  v8 = [v10 components:252 fromDate:v5];

  v9 = [NSString stringWithFormat:@"%.4ld%.2d%.2dT%.2d:%.2ld:%.2ld%@", objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), objc_msgSend(v8, "second"), @"Z", 0];
  [(WPXMLRPCEncoder *)self valueTag:@"dateTime.iso8601" value:v9];
}

- (void)encodeString:(id)a3 omitTag:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = +[WPStringUtils escapedStringWithString:a3];
  id v7 = (id)v6;
  if (v4) {
    [(WPXMLRPCEncoder *)self appendString:v6];
  }
  else {
    [(WPXMLRPCEncoder *)self valueTag:@"string" value:v6];
  }
}

- (void)encodeNumber:(id)a3
{
  BOOL v4 = NSString;
  id v5 = a3;
  objc_msgSend(v4, "stringWithCString:encoding:", objc_msgSend(v5, "objCType"), 4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = [v8 isEqualToString:@"d"];
  uint64_t v6 = [v5 stringValue];

  if (v4) {
    id v7 = @"double";
  }
  else {
    id v7 = @"i4";
  }
  [(WPXMLRPCEncoder *)self valueTag:v7 value:v6];
}

- (void)encodeBoolean:(__CFBoolean *)a3
{
  if ((__CFBoolean *)*MEMORY[0x263EFFB40] == a3) {
    v3 = @"1";
  }
  else {
    v3 = @"0";
  }
  [(WPXMLRPCEncoder *)self valueTag:@"BOOLean" value:v3];
}

- (void)encodeDictionary:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 keyEnumerator];
  [(WPXMLRPCEncoder *)self appendString:@"<value><struct>"];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    do
    {
      [(WPXMLRPCEncoder *)self appendString:@"<member>"];
      [(WPXMLRPCEncoder *)self appendString:@"<name>"];
      [(WPXMLRPCEncoder *)self encodeString:v6 omitTag:1];
      [(WPXMLRPCEncoder *)self appendString:@"</name>"];
      id v7 = [v9 objectForKey:v6];
      [(WPXMLRPCEncoder *)self encodeObject:v7];

      [(WPXMLRPCEncoder *)self appendString:@"</member>"];
      uint64_t v8 = [v4 nextObject];

      uint64_t v6 = (void *)v8;
    }
    while (v8);
  }
  [(WPXMLRPCEncoder *)self appendString:@"</struct></value>"];
}

- (void)encodeArray:(id)a3
{
  id v7 = [a3 objectEnumerator];
  [(WPXMLRPCEncoder *)self appendString:@"<value><array><data>"];
  uint64_t v4 = [v7 nextObject];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      [(WPXMLRPCEncoder *)self encodeObject:v5];
      uint64_t v6 = [v7 nextObject];

      uint64_t v5 = (void *)v6;
    }
    while (v6);
  }
  [(WPXMLRPCEncoder *)self appendString:@"</data></array></value>"];
}

- (void)encodeObject:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WPXMLRPCEncoder *)self encodeArray:v6];
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WPXMLRPCEncoder *)self encodeDictionary:v6];
      goto LABEL_24;
    }
    if ((id)*MEMORY[0x263EFFB40] == v6 || *MEMORY[0x263EFFB38] == (void)v6)
    {
      [(WPXMLRPCEncoder *)self encodeBoolean:v6];
      goto LABEL_24;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [(WPXMLRPCEncoder *)self encodeNumber:v6];
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WPXMLRPCEncoder *)self encodeDate:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(WPXMLRPCEncoder *)self encodeData:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(WPXMLRPCEncoder *)self encodeInputStream:v6];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_15:
            [(WPXMLRPCEncoder *)self encodeString:v6 omitTag:0];
            goto LABEL_24;
          }
          [(WPXMLRPCEncoder *)self encodeFileHandle:v6];
        }
      }
    }
  }
LABEL_24:
}

- (void)valueTag:(id)a3 value:(id)a4
{
}

- (void)encodeForStreaming
{
  v13[2] = *MEMORY[0x263EF8340];
  [(WPXMLRPCEncoder *)self appendString:@"<?xml version=\"1.0\"?>"];
  if (self->_isResponse)
  {
    [(WPXMLRPCEncoder *)self appendString:@"<methodResponse>"];
    if (self->_isFault)
    {
      [(WPXMLRPCEncoder *)self appendString:@"<fault>"];
      v12[0] = @"faultCode";
      v12[1] = @"faultString";
      faultString = self->_faultString;
      v13[0] = self->_faultCode;
      v13[1] = faultString;
      uint64_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      [(WPXMLRPCEncoder *)self encodeDictionary:v4];

      uint64_t v5 = @"</fault>";
    }
    else
    {
      uint64_t v5 = @"<params>";
    }
  }
  else
  {
    [(WPXMLRPCEncoder *)self appendString:@"<methodCall><methodName>"];
    [(WPXMLRPCEncoder *)self encodeString:self->_method omitTag:1];
    uint64_t v5 = @"</methodName><params>";
  }
  [(WPXMLRPCEncoder *)self appendString:v5];
  parameters = self->_parameters;
  if (parameters)
  {
    id v7 = [(NSArray *)parameters objectEnumerator];
    uint64_t v8 = [v7 nextObject];
    if (v8)
    {
      id v9 = (void *)v8;
      do
      {
        [(WPXMLRPCEncoder *)self appendString:@"<param>"];
        [(WPXMLRPCEncoder *)self encodeObject:v9];
        [(WPXMLRPCEncoder *)self appendString:@"</param>"];
        uint64_t v10 = [v7 nextObject];

        id v9 = (void *)v10;
      }
      while (v10);
    }
  }
  if (!self->_isResponse)
  {
    v11 = @"</methodCall>";
LABEL_15:
    [(WPXMLRPCEncoder *)self appendString:@"</params>"];
    goto LABEL_16;
  }
  v11 = @"</methodResponse>";
  if (!self->_isFault) {
    goto LABEL_15;
  }
LABEL_16:
  [(WPXMLRPCEncoder *)self appendString:v11];
  [(NSFileHandle *)self->_streamingCacheFile synchronizeFile];
}

- (BOOL)encodeToFile:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F08850];
  id v7 = a3;
  uint64_t v8 = [v6 defaultManager];
  [v8 createFileAtPath:v7 contents:0 attributes:0];
  id v9 = (void *)MEMORY[0x263F08840];
  uint64_t v10 = [NSURL fileURLWithPath:v7];

  v11 = [v9 fileHandleForWritingToURL:v10 error:a4];
  streamingCacheFile = self->_streamingCacheFile;
  self->_streamingCacheFile = v11;

  v13 = self->_streamingCacheFile;
  if (v13) {
    [(WPXMLRPCEncoder *)self encodeForStreaming];
  }

  return v13 != 0;
}

- (id)dataEncodedWithError:(id *)a3
{
  uint64_t v5 = [(WPXMLRPCEncoder *)self tmpFilePathForCache];
  if ([(WPXMLRPCEncoder *)self encodeToFile:v5 error:a3])
  {
    id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:2 error:a3];
    id v7 = [MEMORY[0x263F08850] defaultManager];
    [v7 removeItemAtPath:v5 error:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSData)body
{
  return (NSData *)[(WPXMLRPCEncoder *)self dataEncodedWithError:0];
}

- (WPXMLRPCEncoder)init
{
  return 0;
}

- (WPXMLRPCEncoder)initWithResponseFaultCode:(id)a3 andString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WPXMLRPCEncoder;
  id v9 = [(WPXMLRPCEncoder *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faultCode, a3);
    objc_storeStrong((id *)&v10->_faultString, a4);
    *(_WORD *)&v10->_isResponse = 257;
  }

  return v10;
}

- (WPXMLRPCEncoder)initWithResponseParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WPXMLRPCEncoder;
  id v6 = [(WPXMLRPCEncoder *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameters, a3);
    v7->_isResponse = 1;
  }

  return v7;
}

- (WPXMLRPCEncoder)initWithMethod:(id)a3 andParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WPXMLRPCEncoder;
  objc_super v9 = [(WPXMLRPCEncoder *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_method, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

@end