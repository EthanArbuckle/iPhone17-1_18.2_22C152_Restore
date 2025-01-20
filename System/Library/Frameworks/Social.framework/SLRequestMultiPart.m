@interface SLRequestMultiPart
+ (id)multiPartWithName:(id)a3 payload:(id)a4 type:(id)a5 multiPartBoundary:(id)a6;
- (NSData)payload;
- (NSString)filename;
- (NSString)multiPartBoundary;
- (NSString)name;
- (NSString)type;
- (NSString)uniqueIdentifier;
- (id)multiPartHeader;
- (id)partData;
- (id)payloadEpilogue;
- (id)payloadPreamble;
- (unint64_t)length;
- (void)setFilename:(id)a3;
- (void)setMultiPartBoundary:(id)a3;
- (void)setName:(id)a3;
- (void)setPayload:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SLRequestMultiPart

+ (id)multiPartWithName:(id)a3 payload:(id)a4 type:(id)a5 multiPartBoundary:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setName:v13];

  [v14 setPayload:v12];
  [v14 setType:v11];

  [v14 setMultiPartBoundary:v10];

  return v14;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFUUIDRef v5 = CFUUIDCreate(Default);
    CFAllocatorRef v6 = CFAllocatorGetDefault();
    v7 = (__CFString *)CFUUIDCreateString(v6, v5);
    v8 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = &v7->isa;

    CFRelease(v5);
    uniqueIdentifier = self->_uniqueIdentifier;
  }

  return uniqueIdentifier;
}

- (id)partData
{
  v3 = objc_opt_new();
  v4 = [(SLRequestMultiPart *)self payloadPreamble];
  [v3 appendData:v4];

  CFUUIDRef v5 = [(SLRequestMultiPart *)self payload];
  [v3 appendData:v5];

  CFAllocatorRef v6 = [(SLRequestMultiPart *)self payloadEpilogue];
  [v3 appendData:v6];

  return v3;
}

- (id)multiPartHeader
{
  v3 = objc_opt_new();
  v4 = NSString;
  CFUUIDRef v5 = [(SLRequestMultiPart *)self name];
  CFAllocatorRef v6 = [v4 stringWithFormat:@"Content-Disposition: form-data name=\"%@\"", v5];;
  [v3 addObject:v6];

  v7 = [(SLRequestMultiPart *)self filename];
  if (v7)
  {
  }
  else
  {
    v8 = [(SLRequestMultiPart *)self type];
    v9 = [v8 commonPrefixWithString:@"image" options:0];
    uint64_t v10 = [v9 length];

    if (v10) {
      [(SLRequestMultiPart *)self setFilename:@"image.jpg"];
    }
  }
  id v11 = [(SLRequestMultiPart *)self filename];

  if (v11)
  {
    id v12 = NSString;
    id v13 = [(SLRequestMultiPart *)self filename];
    id v14 = [v12 stringWithFormat:@" filename=\"./%@\"", v13];;
    [v3 addObject:v14];
  }
  [v3 addObject:@"\r\n"];
  v15 = [(SLRequestMultiPart *)self type];

  if (v15)
  {
    v16 = NSString;
    v17 = [(SLRequestMultiPart *)self type];
    v18 = [v16 stringWithFormat:@"Content-Type: %@\r\n", v17];
    [v3 addObject:v18];
  }
  [v3 addObject:@"\r\n"];
  v19 = [v3 componentsJoinedByString:&stru_1F1E28690];

  return v19;
}

- (id)payloadPreamble
{
  v3 = NSString;
  v4 = [(SLRequestMultiPart *)self multiPartBoundary];
  CFUUIDRef v5 = [v3 stringWithFormat:@"--%@\r\n", v4];

  CFAllocatorRef v6 = [(SLRequestMultiPart *)self multiPartHeader];
  v7 = [v5 stringByAppendingString:v6];
  v8 = [v7 dataUsingEncoding:4];

  return v8;
}

- (id)payloadEpilogue
{
  return (id)[@"\r\n" dataUsingEncoding:4];
}

- (unint64_t)length
{
  v3 = [(SLRequestMultiPart *)self payloadPreamble];
  uint64_t v4 = [v3 length];
  CFUUIDRef v5 = [(SLRequestMultiPart *)self payload];
  uint64_t v6 = [v5 length] + v4;
  v7 = [(SLRequestMultiPart *)self payloadEpilogue];
  unint64_t v8 = v6 + [v7 length];

  return v8;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)multiPartBoundary
{
  return self->_multiPartBoundary;
}

- (void)setMultiPartBoundary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_multiPartBoundary, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end