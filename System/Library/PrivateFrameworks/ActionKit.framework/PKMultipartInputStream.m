@interface PKMultipartInputStream
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSData)footer;
- (NSMutableArray)parts;
- (NSString)boundary;
- (PKMultipartInputStream)init;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)currentPart;
- (unint64_t)delivered;
- (unint64_t)length;
- (unint64_t)status;
- (unint64_t)streamStatus;
- (void)addPartWithHeaders:(id)a3 path:(id)a4;
- (void)addPartWithHeaders:(id)a3 string:(id)a4;
- (void)addPartWithName:(id)a3 data:(id)a4;
- (void)addPartWithName:(id)a3 data:(id)a4 contentType:(id)a5;
- (void)addPartWithName:(id)a3 filename:(id)a4 data:(id)a5 contentType:(id)a6;
- (void)addPartWithName:(id)a3 filename:(id)a4 path:(id)a5;
- (void)addPartWithName:(id)a3 filename:(id)a4 path:(id)a5 contentType:(id)a6;
- (void)addPartWithName:(id)a3 filename:(id)a4 stream:(id)a5 streamLength:(unint64_t)a6;
- (void)addPartWithName:(id)a3 path:(id)a4;
- (void)addPartWithName:(id)a3 string:(id)a4;
- (void)close;
- (void)open;
- (void)setBoundary:(id)a3;
- (void)setCurrentPart:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDelivered:(unint64_t)a3;
- (void)setFooter:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setParts:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)updateLength;
@end

@implementation PKMultipartInputStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_boundary, 0);
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setDelivered:(unint64_t)a3
{
  self->_delivered = a3;
}

- (unint64_t)delivered
{
  return self->_delivered;
}

- (void)setCurrentPart:(unint64_t)a3
{
  self->_currentPart = a3;
}

- (unint64_t)currentPart
{
  return self->_currentPart;
}

- (void)setFooter:(id)a3
{
}

- (NSData)footer
{
  return self->_footer;
}

- (void)setParts:(id)a3
{
}

- (NSMutableArray)parts
{
  return self->_parts;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setBoundary:(id)a3
{
}

- (NSString)boundary
{
  return self->_boundary;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (NSStreamDelegate *)a3;
}

- (id)delegate
{
  return self->delegate;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (unint64_t)streamStatus
{
  if ([(PKMultipartInputStream *)self status] != 6)
  {
    unint64_t v3 = [(PKMultipartInputStream *)self delivered];
    if (v3 >= [(PKMultipartInputStream *)self length]) {
      [(PKMultipartInputStream *)self setStatus:5];
    }
  }
  return [(PKMultipartInputStream *)self status];
}

- (void)close
{
}

- (void)open
{
}

- (BOOL)hasBytesAvailable
{
  unint64_t v3 = [(PKMultipartInputStream *)self delivered];
  return v3 < [(PKMultipartInputStream *)self length];
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  [(PKMultipartInputStream *)self setStatus:3];
  unint64_t v7 = [(PKMultipartInputStream *)self delivered];
  unint64_t v8 = 0;
  BOOL v9 = a4 != 0;
  if (v7 < [(PKMultipartInputStream *)self length] && a4)
  {
    unint64_t v8 = 0;
    while (1)
    {
      unint64_t v10 = [(PKMultipartInputStream *)self currentPart];
      v11 = [(PKMultipartInputStream *)self parts];
      unint64_t v12 = [v11 count];

      if (v10 >= v12) {
        break;
      }
      v13 = [(PKMultipartInputStream *)self parts];
      v14 = objc_msgSend(v13, "objectAtIndex:", -[PKMultipartInputStream currentPart](self, "currentPart"));
      uint64_t v15 = [v14 read:&a3[v8] maxLength:a4 - v8];

      if (v15)
      {
        v8 += v15;
        [(PKMultipartInputStream *)self setDelivered:[(PKMultipartInputStream *)self delivered] + v15];
        unint64_t v17 = [(PKMultipartInputStream *)self delivered];
        BOOL v9 = v8 < a4;
        if (v17 >= [(PKMultipartInputStream *)self length] || v8 >= a4) {
          goto LABEL_12;
        }
      }
      else
      {
        [(PKMultipartInputStream *)self setCurrentPart:[(PKMultipartInputStream *)self currentPart] + 1];
        unint64_t v16 = [(PKMultipartInputStream *)self delivered];
        if (v16 >= [(PKMultipartInputStream *)self length]) {
          break;
        }
      }
    }
    BOOL v9 = 1;
  }
LABEL_12:
  unint64_t v18 = [(PKMultipartInputStream *)self delivered];
  unint64_t v19 = [(PKMultipartInputStream *)self length];
  v20 = [(PKMultipartInputStream *)self footer];
  unint64_t v21 = v19 - [v20 length];

  if (v18 >= v21 && v9)
  {
    v22 = [(PKMultipartInputStream *)self footer];
    uint64_t v23 = [v22 length];
    unint64_t v24 = [(PKMultipartInputStream *)self delivered];
    unint64_t v25 = [(PKMultipartInputStream *)self length];
    v26 = [(PKMultipartInputStream *)self footer];
    unint64_t v27 = v23 + v25 - (v24 + [v26 length]);

    if (v27 >= a4 - v8) {
      unint64_t v28 = a4 - v8;
    }
    else {
      unint64_t v28 = v27;
    }
    v29 = [(PKMultipartInputStream *)self footer];
    unint64_t v30 = [(PKMultipartInputStream *)self delivered];
    unint64_t v31 = [(PKMultipartInputStream *)self length];
    v32 = [(PKMultipartInputStream *)self footer];
    objc_msgSend(v29, "getBytes:range:", &a3[v8], v30 - v31 + objc_msgSend(v32, "length"), v28);

    v8 += v28;
    [(PKMultipartInputStream *)self setDelivered:[(PKMultipartInputStream *)self delivered] + v28];
  }
  return v8;
}

- (void)addPartWithHeaders:(id)a3 path:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKMultipartInputStream *)self parts];
  BOOL v9 = [PKMultipartElement alloc];
  unint64_t v10 = [(PKMultipartInputStream *)self boundary];
  v11 = [(PKMultipartElement *)v9 initWithHeaders:v7 path:v6 boundary:v10];

  [v8 addObject:v11];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithHeaders:(id)a3 string:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKMultipartInputStream *)self parts];
  BOOL v9 = [PKMultipartElement alloc];
  unint64_t v10 = [(PKMultipartInputStream *)self boundary];
  v11 = [(PKMultipartElement *)v9 initWithHeaders:v7 string:v6 boundary:v10];

  [v8 addObject:v11];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 filename:(id)a4 stream:(id)a5 streamLength:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(PKMultipartInputStream *)self parts];
  v14 = [PKMultipartElement alloc];
  uint64_t v15 = [(PKMultipartInputStream *)self boundary];
  unint64_t v16 = [(PKMultipartElement *)v14 initWithName:v12 filename:v11 boundary:v15 stream:v10 streamLength:a6];

  [v13 addObject:v16];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 filename:(id)a4 path:(id)a5 contentType:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(PKMultipartInputStream *)self parts];
  uint64_t v15 = [PKMultipartElement alloc];
  unint64_t v16 = [(PKMultipartInputStream *)self boundary];
  unint64_t v17 = [(PKMultipartElement *)v15 initWithName:v13 filename:v12 boundary:v16 path:v11 contentType:v10];

  [v14 addObject:v17];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 filename:(id)a4 path:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKMultipartInputStream *)self parts];
  id v12 = [PKMultipartElement alloc];
  id v13 = [(PKMultipartInputStream *)self boundary];
  v14 = [(PKMultipartElement *)v12 initWithName:v10 filename:v9 boundary:v13 path:v8];

  [v11 addObject:v14];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 path:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKMultipartInputStream *)self parts];
  id v9 = [PKMultipartElement alloc];
  id v10 = [(PKMultipartInputStream *)self boundary];
  id v11 = [(PKMultipartElement *)v9 initWithName:v7 filename:0 boundary:v10 path:v6];

  [v8 addObject:v11];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 filename:(id)a4 data:(id)a5 contentType:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(PKMultipartInputStream *)self parts];
  uint64_t v15 = [PKMultipartElement alloc];
  unint64_t v16 = [(PKMultipartInputStream *)self boundary];
  unint64_t v17 = [(PKMultipartElement *)v15 initWithName:v13 boundary:v16 data:v11 contentType:v10 filename:v12];

  [v14 addObject:v17];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 data:(id)a4 contentType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKMultipartInputStream *)self parts];
  id v12 = [PKMultipartElement alloc];
  id v13 = [(PKMultipartInputStream *)self boundary];
  v14 = [(PKMultipartElement *)v12 initWithName:v10 boundary:v13 data:v9 contentType:v8];

  [v11 addObject:v14];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKMultipartInputStream *)self parts];
  id v9 = [PKMultipartElement alloc];
  id v10 = [(PKMultipartInputStream *)self boundary];
  id v11 = [(PKMultipartElement *)v9 initWithName:v7 boundary:v10 data:v6 contentType:@"application/octet-stream"];

  [v8 addObject:v11];
  [(PKMultipartInputStream *)self updateLength];
}

- (void)addPartWithName:(id)a3 string:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKMultipartInputStream *)self parts];
  id v9 = [PKMultipartElement alloc];
  id v10 = [(PKMultipartInputStream *)self boundary];
  id v11 = [(PKMultipartElement *)v9 initWithName:v7 boundary:v10 string:v6];

  [v8 addObject:v11];
  [(PKMultipartInputStream *)self updateLength];
}

- (PKMultipartInputStream)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKMultipartInputStream;
  v2 = [(PKMultipartInputStream *)&v11 init];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x263EFF980] array];
    [(PKMultipartInputStream *)v2 setParts:v3];

    v4 = [MEMORY[0x263F08AB0] processInfo];
    v5 = [v4 globallyUniqueString];
    [(PKMultipartInputStream *)v2 setBoundary:v5];

    id v6 = NSString;
    id v7 = [(PKMultipartInputStream *)v2 boundary];
    id v8 = [v6 stringWithFormat:@"--%@--\r\n", v7];
    id v9 = [v8 dataUsingEncoding:4];
    [(PKMultipartInputStream *)v2 setFooter:v9];

    [(PKMultipartInputStream *)v2 updateLength];
  }
  return v2;
}

- (void)updateLength
{
  id v6 = [(PKMultipartInputStream *)self footer];
  uint64_t v3 = [v6 length];
  v4 = [(PKMultipartInputStream *)self parts];
  v5 = [v4 valueForKeyPath:@"@sum.length"];
  -[PKMultipartInputStream setLength:](self, "setLength:", [v5 unsignedIntegerValue] + v3);
}

@end