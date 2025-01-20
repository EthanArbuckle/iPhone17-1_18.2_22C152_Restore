@interface HSUpdateRequest
+ (id)requestWithDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4 connectionType:(int64_t)a5;
- (BOOL)isConcurrent;
- (HSUpdateRequest)initWithDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4 connectionType:(int64_t)a5;
- (double)timeoutInterval;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation HSUpdateRequest

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4
{
  v6 = [MEMORY[0x263EFF990] data];
  int v11 = 0x4000000;
  int v12 = 1684630637;
  unsigned int v13 = bswap32(a4);
  [v6 appendBytes:&v12 length:4];
  [v6 appendBytes:&v11 length:4];
  [v6 appendBytes:&v13 length:4];
  int v9 = 0x4000000;
  int v10 = 1920169325;
  unsigned int v8 = bswap32(a3);
  [v6 appendBytes:&v10 length:4];
  [v6 appendBytes:&v9 length:4];
  [v6 appendBytes:&v8 length:4];
  return v6;
}

- (double)timeoutInterval
{
  if (self->_connectionType)
  {
    v6.receiver = self;
    v6.super_class = (Class)HSUpdateRequest;
    [(HSRequest *)&v6 timeoutInterval];
  }
  else
  {
    v3 = [MEMORY[0x263EFF910] distantFuture];
    [v3 timeIntervalSinceNow];
    double v5 = v4;

    return v5;
  }
  return result;
}

- (BOOL)isConcurrent
{
  if (!self->_connectionType) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)HSUpdateRequest;
  return [(HSRequest *)&v3 isConcurrent];
}

- (id)canonicalResponseForResponse:(id)a3
{
  objc_super v3 = +[HSResponse responseWithResponse:a3];
  double v4 = [v3 responseData];
  double v5 = +[HSResponseDataParser parseResponseData:v4];

  objc_msgSend(v3, "setDatabaseRevision:", objc_msgSend(v5, "unsignedIntValue"));
  return v3;
}

- (HSUpdateRequest)initWithDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4 connectionType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  v7 = [(HSRequest *)self initWithAction:@"update", *(void *)&a4];
  unsigned int v8 = v7;
  if (v7)
  {
    v7->_connectionType = a5;
    int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
    [(HSRequest *)v8 setValue:v9 forArgument:@"revision-number"];
  }
  return v8;
}

+ (id)requestWithDatabaseRevision:(unsigned int)a3 sessionID:(unsigned int)a4 connectionType:(int64_t)a5
{
  double v5 = (void *)[objc_alloc((Class)a1) initWithDatabaseRevision:*(void *)&a3 sessionID:*(void *)&a4 connectionType:a5];
  return v5;
}

@end