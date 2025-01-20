@interface LiveFSHexAndASCIIString
- (LiveFSHexAndASCIIString)init;
- (LiveFSHexAndASCIIString)initWithData:(id)a3;
- (id)data;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation LiveFSHexAndASCIIString

- (LiveFSHexAndASCIIString)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LiveFSHexAndASCIIString;
  v5 = [(LiveFSHexAndASCIIString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    data = v5->data;
    v5->data = (NSData *)v6;
  }
  return v5;
}

- (LiveFSHexAndASCIIString)init
{
  v3 = [MEMORY[0x263EFF8F8] data];
  id v4 = [(LiveFSHexAndASCIIString *)self initWithData:v3];

  return v4;
}

- (id)data
{
  return self->data;
}

- (unint64_t)length
{
  return 53 * (([(NSData *)self->data length] + 9) / 0xA);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 v4 = 0;
  -[LiveFSHexAndASCIIString getCharacters:range:](self, "getCharacters:range:", &v4, a3, 1);
  return v4;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v32 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:53];
  v31 = [(NSData *)self->data bytes];
  int64_t v8 = 10 * (location / 0x35);
  NSUInteger v26 = length;
  int64_t v9 = 10 * ((length + location + 52) / 0x35);
  if (v9 > [(NSData *)self->data length]) {
    int64_t v9 = [(NSData *)self->data length];
  }
  uint64_t v10 = v9 - v8;
  v11 = v32;
  if (v9 > v8)
  {
    int64_t v30 = v9;
    do
    {
      v28 = a3;
      uint64_t v29 = v10 - 10;
      if (v10 >= 10) {
        uint64_t v10 = 10;
      }
      if (v10 <= 1) {
        uint64_t v10 = 1;
      }
      int64_t v12 = v9;
      unint64_t v27 = v10;
      uint64_t v13 = -v10;
      objc_msgSend(v11, "appendFormat:", @"%08ld: ", v8);
      unint64_t v14 = 0;
      v15 = v31;
      uint64_t v16 = v13;
      if (v12 <= v8) {
        goto LABEL_13;
      }
      do
      {
        objc_msgSend(v32, "appendFormat:", @" %02hhx", v15[v8]);
        ++v15;
        BOOL v17 = __CFADD__(v16++, 1);
      }
      while (!v17);
      unint64_t v14 = v27;
      if (v27 <= 9)
      {
LABEL_13:
        unint64_t v18 = v14 - 10;
        do
        {
          [v32 appendString:@"   "];
          BOOL v17 = __CFADD__(v18++, 1);
        }
        while (!v17);
      }
      [v32 appendString:@"  "];
      v19 = v31;
      if (v30 <= v8)
      {
        unint64_t v21 = 0;
        v22 = v28;
        int64_t v9 = v30;
      }
      else
      {
        do
        {
          if ((v19[v8] & 0x7Fu) - 32 >= 0x5F) {
            uint64_t v20 = 46;
          }
          else {
            uint64_t v20 = v19[v8];
          }
          objc_msgSend(v32, "appendFormat:", @"%c", v20);
          ++v19;
          BOOL v17 = __CFADD__(v13++, 1);
        }
        while (!v17);
        unint64_t v21 = v27;
        v22 = v28;
        v23 = v32;
        int64_t v9 = v30;
        if (v27 > 9) {
          goto LABEL_28;
        }
      }
      unint64_t v24 = v21 - 10;
      do
      {
        [v32 appendString:@" "];
        v23 = v32;
        BOOL v17 = __CFADD__(v24++, 1);
      }
      while (!v17);
LABEL_28:
      [v23 appendString:@"\n"];
      v34.NSUInteger location = 53 * (v8 / 0xAuLL);
      v34.NSUInteger length = 53;
      v35.NSUInteger location = location;
      v35.NSUInteger length = v26;
      NSRange v25 = NSIntersectionRange(v34, v35);
      objc_msgSend(v32, "getCharacters:range:", v22, v25.location - 53 * (v8 / 0xAuLL), v25.length);
      [v32 setString:&stru_26EE1CB58];
      v11 = v32;
      v8 += 10;
      a3 = &v22[v25.length];
      uint64_t v10 = v29;
    }
    while (v8 < v9);
  }
}

- (void).cxx_destruct
{
}

@end