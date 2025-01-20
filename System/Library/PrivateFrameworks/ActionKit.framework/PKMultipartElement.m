@interface PKMultipartElement
- (NSData)headers;
- (NSInputStream)body;
- (PKMultipartElement)initWithHeaders:(id)a3 path:(id)a4 boundary:(id)a5;
- (PKMultipartElement)initWithHeaders:(id)a3 string:(id)a4 boundary:(id)a5;
- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 data:(id)a5 contentType:(id)a6;
- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 data:(id)a5 contentType:(id)a6 filename:(id)a7;
- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 string:(id)a5;
- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 path:(id)a6;
- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 path:(id)a6 contentType:(id)a7;
- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 stream:(id)a6 streamLength:(unint64_t)a7;
- (id)makeHeadersDataFromHeadersDict:(id)a3 boundary:(id)a4;
- (unint64_t)bodyLength;
- (unint64_t)delivered;
- (unint64_t)headersLength;
- (unint64_t)length;
- (unint64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (void)appendNewLine:(id)a3;
- (void)setBody:(id)a3;
- (void)setBodyLength:(unint64_t)a3;
- (void)setDelivered:(unint64_t)a3;
- (void)setHeaders:(id)a3;
- (void)setHeadersLength:(unint64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)updateLength;
@end

@implementation PKMultipartElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

- (void)setDelivered:(unint64_t)a3
{
  self->_delivered = a3;
}

- (unint64_t)delivered
{
  return self->_delivered;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setBodyLength:(unint64_t)a3
{
  self->_bodyLength = a3;
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (void)setHeadersLength:(unint64_t)a3
{
  self->_headersLength = a3;
}

- (unint64_t)headersLength
{
  return self->_headersLength;
}

- (void)setBody:(id)a3
{
}

- (NSInputStream)body
{
  return self->_body;
}

- (void)setHeaders:(id)a3
{
}

- (NSData)headers
{
  return self->_headers;
}

- (unint64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v7 = [(PKMultipartElement *)self delivered];
  if (v7 >= [(PKMultipartElement *)self length]) {
    return 0;
  }
  unint64_t v8 = [(PKMultipartElement *)self delivered];
  unint64_t v9 = [(PKMultipartElement *)self headersLength];
  unint64_t v10 = 0;
  if (!a4 || v8 >= v9) {
    goto LABEL_10;
  }
  unint64_t v11 = [(PKMultipartElement *)self headersLength];
  unint64_t v12 = [(PKMultipartElement *)self delivered];
  if (v11 - v12 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = v11 - v12;
  }
  v13 = [(PKMultipartElement *)self headers];
  objc_msgSend(v13, "getBytes:range:", a3, -[PKMultipartElement delivered](self, "delivered"), v10);

  for (unint64_t i = [(PKMultipartElement *)self delivered] + v10;
        ;
        unint64_t i = [(PKMultipartElement *)self delivered] + v19)
  {
    [(PKMultipartElement *)self setDelivered:i];
LABEL_10:
    unint64_t v15 = [(PKMultipartElement *)self delivered];
    if (v15 < [(PKMultipartElement *)self headersLength]) {
      break;
    }
    unint64_t v16 = [(PKMultipartElement *)self delivered];
    if (v16 >= [(PKMultipartElement *)self length] - 2 || a4 <= v10) {
      break;
    }
    v18 = [(PKMultipartElement *)self body];
    uint64_t v19 = [v18 read:&a3[v10] maxLength:a4 - v10];

    if (!v19) {
      break;
    }
    v10 += v19;
  }
  unint64_t v20 = [(PKMultipartElement *)self delivered];
  if (v20 >= [(PKMultipartElement *)self length] - 2 && v10 < a4)
  {
    unint64_t v21 = [(PKMultipartElement *)self delivered];
    if (v21 == [(PKMultipartElement *)self length] - 2)
    {
      a3[v10++] = 13;
      [(PKMultipartElement *)self setDelivered:[(PKMultipartElement *)self delivered] + 1];
    }
    a3[v10++] = 10;
    [(PKMultipartElement *)self setDelivered:[(PKMultipartElement *)self delivered] + 1];
  }
  return v10;
}

- (void)appendNewLine:(id)a3
{
}

- (id)makeHeadersDataFromHeadersDict:(id)a3 boundary:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v18 = a4;
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"--%@", v18];
  [(PKMultipartElement *)self appendNewLine:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v6 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [NSString alloc];
        v14 = [v6 objectForKeyedSubscript:v12];
        unint64_t v15 = (void *)[v13 initWithFormat:@"%@: %@", v12, v14];
        [v7 appendString:v15];

        [(PKMultipartElement *)self appendNewLine:v7];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(PKMultipartElement *)self appendNewLine:v7];
  unint64_t v16 = [v7 dataUsingEncoding:4];

  return v16;
}

- (PKMultipartElement)initWithHeaders:(id)a3 path:(id)a4 boundary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKMultipartElement;
  unint64_t v11 = [(PKMultipartElement *)&v21 init];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(PKMultipartElement *)v11 makeHeadersDataFromHeadersDict:v8 boundary:v10];
    headers = v12->_headers;
    v12->_headers = (NSData *)v13;

    v12->_headersLength = [(NSData *)v12->_headers length];
    uint64_t v15 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v9];
    body = v12->_body;
    v12->_body = (NSInputStream *)v15;

    v17 = [MEMORY[0x263F08850] defaultManager];
    id v18 = [v17 attributesOfItemAtPath:v9 error:0];
    uint64_t v19 = [v18 objectForKey:*MEMORY[0x263F080B8]];
    v12->_bodyLength = [v19 unsignedIntegerValue];

    [(PKMultipartElement *)v12 updateLength];
  }

  return v12;
}

- (PKMultipartElement)initWithHeaders:(id)a3 string:(id)a4 boundary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKMultipartElement;
  unint64_t v11 = [(PKMultipartElement *)&v19 init];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(PKMultipartElement *)v11 makeHeadersDataFromHeadersDict:v8 boundary:v10];
    headers = v12->_headers;
    v12->_headers = (NSData *)v13;

    v12->_headersLength = [(NSData *)v12->_headers length];
    uint64_t v15 = [v9 dataUsingEncoding:4];
    uint64_t v16 = [MEMORY[0x263EFF950] inputStreamWithData:v15];
    body = v12->_body;
    v12->_body = (NSInputStream *)v16;

    v12->_bodyLength = [v15 length];
    [(PKMultipartElement *)v12 updateLength];
  }
  return v12;
}

- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 stream:(id)a6 streamLength:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKMultipartElement;
  uint64_t v16 = [(PKMultipartElement *)&v24 init];
  if (v16)
  {
    v17 = NSString;
    id v18 = [v13 pathExtension];
    objc_super v19 = MIMETypeForExtension(v18);
    objc_msgSend(v17, "stringWithFormat:", @"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n",
      v14,
      v12,
      v13,
    long long v20 = v19);
    objc_super v21 = [v20 dataUsingEncoding:4];
    [(PKMultipartElement *)v16 setHeaders:v21];

    long long v22 = [(PKMultipartElement *)v16 headers];
    -[PKMultipartElement setHeadersLength:](v16, "setHeadersLength:", [v22 length]);

    [(PKMultipartElement *)v16 setBody:v15];
    [(PKMultipartElement *)v16 setBodyLength:a7];
    [(PKMultipartElement *)v16 updateLength];
  }

  return v16;
}

- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 path:(id)a6 contentType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKMultipartElement;
  v17 = [(PKMultipartElement *)&v26 init];
  if (v17)
  {
    if (!v13)
    {
      id v13 = [v15 lastPathComponent];
    }
    objc_msgSend(NSString, "stringWithFormat:", @"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n",
      v14,
      v12,
      v13,
    id v18 = v16);
    objc_super v19 = [v18 dataUsingEncoding:4];
    [(PKMultipartElement *)v17 setHeaders:v19];

    long long v20 = [(PKMultipartElement *)v17 headers];
    -[PKMultipartElement setHeadersLength:](v17, "setHeadersLength:", [v20 length]);

    objc_super v21 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v15];
    [(PKMultipartElement *)v17 setBody:v21];

    long long v22 = [MEMORY[0x263F08850] defaultManager];
    long long v23 = [v22 attributesOfItemAtPath:v15 error:0];
    objc_super v24 = [v23 objectForKey:*MEMORY[0x263F080B8]];
    -[PKMultipartElement setBodyLength:](v17, "setBodyLength:", [v24 unsignedIntegerValue]);

    [(PKMultipartElement *)v17 updateLength];
  }

  return v17;
}

- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 path:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 pathExtension];
  id v15 = MIMETypeForExtension(v14);
  id v16 = [(PKMultipartElement *)self initWithName:v13 filename:v12 boundary:v11 path:v10 contentType:v15];

  return v16;
}

- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 data:(id)a5 contentType:(id)a6 filename:(id)a7
{
  v23.receiver = self;
  v23.super_class = (Class)PKMultipartElement;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKMultipartElement *)&v23 init];
  objc_msgSend(NSString, "stringWithFormat:", @"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n",
    v14,
    v15,
    v11,
    v12,
    v23.receiver,
  v17 = v23.super_class);

  id v18 = [v17 dataUsingEncoding:4];
  [(PKMultipartElement *)v16 setHeaders:v18];

  objc_super v19 = [(PKMultipartElement *)v16 headers];
  -[PKMultipartElement setHeadersLength:](v16, "setHeadersLength:", [v19 length]);

  long long v20 = [MEMORY[0x263EFF950] inputStreamWithData:v13];
  [(PKMultipartElement *)v16 setBody:v20];

  uint64_t v21 = [v13 length];
  [(PKMultipartElement *)v16 setBodyLength:v21];
  [(PKMultipartElement *)v16 updateLength];
  return v16;
}

- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 data:(id)a5 contentType:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)PKMultipartElement;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKMultipartElement *)&v20 init];
  objc_msgSend(NSString, "stringWithFormat:", @"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\nContent-Type: %@\r\n\r\n",
    v11,
    v12,
  id v14 = v9);

  id v15 = [v14 dataUsingEncoding:4];
  [(PKMultipartElement *)v13 setHeaders:v15];

  id v16 = [(PKMultipartElement *)v13 headers];
  -[PKMultipartElement setHeadersLength:](v13, "setHeadersLength:", [v16 length]);

  v17 = [MEMORY[0x263EFF950] inputStreamWithData:v10];
  [(PKMultipartElement *)v13 setBody:v17];

  uint64_t v18 = [v10 length];
  [(PKMultipartElement *)v13 setBodyLength:v18];
  [(PKMultipartElement *)v13 updateLength];
  return v13;
}

- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 string:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)PKMultipartElement;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PKMultipartElement *)&v17 init];
  objc_msgSend(NSString, "stringWithFormat:", @"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n",
    v8,
    v9,
    v17.receiver,
  id v11 = v17.super_class);

  id v12 = [v11 dataUsingEncoding:4];
  [(PKMultipartElement *)v10 setHeaders:v12];

  id v13 = [(PKMultipartElement *)v10 headers];
  -[PKMultipartElement setHeadersLength:](v10, "setHeadersLength:", [v13 length]);

  id v14 = [v7 dataUsingEncoding:4];

  id v15 = [MEMORY[0x263EFF950] inputStreamWithData:v14];
  [(PKMultipartElement *)v10 setBody:v15];

  -[PKMultipartElement setBodyLength:](v10, "setBodyLength:", [v14 length]);
  [(PKMultipartElement *)v10 updateLength];

  return v10;
}

- (void)updateLength
{
  [(PKMultipartElement *)self setLength:[(PKMultipartElement *)self headersLength]+ [(PKMultipartElement *)self bodyLength]+ 2];
  id v3 = [(PKMultipartElement *)self body];
  [v3 open];
}

@end