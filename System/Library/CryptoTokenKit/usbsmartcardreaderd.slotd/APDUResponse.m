@interface APDUResponse
+ (id)responseWithData:(id)a3;
+ (id)responseWithDataField:(id)a3 SW1:(unsigned __int8)a4 SW2:(unsigned __int8)a5;
- (APDUResponse)initWithData:(id)a3;
- (NSData)data;
- (NSData)dataField;
- (id)description;
- (unsigned)SW1;
- (unsigned)SW2;
@end

@implementation APDUResponse

- (APDUResponse)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDUResponse;
  v6 = [(APDUResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

+ (id)responseWithData:(id)a3
{
  id v3 = a3;
  v4 = [[APDUResponse alloc] initWithData:v3];

  return v4;
}

+ (id)responseWithDataField:(id)a3 SW1:(unsigned __int8)a4 SW2:(unsigned __int8)a5
{
  unsigned __int8 v9 = a4;
  unsigned __int8 v8 = a5;
  id v5 = +[NSMutableData dataWithData:a3];
  [v5 appendBytes:&v9 length:1];
  [v5 appendBytes:&v8 length:1];
  v6 = [[APDUResponse alloc] initWithData:v5];

  return v6;
}

- (id)description
{
  unsigned int v3 = [(APDUResponse *)self SW1];
  unsigned int v4 = [(APDUResponse *)self SW2];
  id v5 = [(APDUResponse *)self dataField];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"{ SW1: 0x%.2x SW2: 0x%.2x dataLen: %lu }", v3, v4, [v5 length]);

  return v6;
}

- (unsigned)SW1
{
  id v3 = [(APDUResponse *)self data];
  unsigned int v4 = [v3 bytes];
  id v5 = [(APDUResponse *)self data];
  LOBYTE(v4) = v4[(void)[v5 length] - 2];

  return v4;
}

- (unsigned)SW2
{
  id v3 = [(APDUResponse *)self data];
  unsigned int v4 = [v3 bytes];
  id v5 = [(APDUResponse *)self data];
  LOBYTE(v4) = v4[(void)[v5 length] - 1];

  return v4;
}

- (NSData)dataField
{
  id v3 = [(APDUResponse *)self data];
  id v4 = [v3 length];

  if ((unint64_t)v4 < 3)
  {
    v7 = 0;
  }
  else
  {
    id v5 = [(APDUResponse *)self data];
    v6 = [(APDUResponse *)self data];
    v7 = objc_msgSend(v5, "subdataWithRange:", 0, (char *)objc_msgSend(v6, "length") - 2);
  }

  return (NSData *)v7;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end