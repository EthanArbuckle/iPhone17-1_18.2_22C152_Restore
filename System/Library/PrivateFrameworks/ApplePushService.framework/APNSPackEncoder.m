@interface APNSPackEncoder
- (APNSPackEncoder)initWithMaxTableSize:(unint64_t)a3;
- (APNSPackEncoderDelegate)delegate;
- (BOOL)hasError;
- (id)copyMessage;
- (id)errorMessage;
- (id)keyTable;
- (id)metrics;
- (id)valueTable;
- (int)errorCode;
- (unint64_t)maxTableSize;
- (void)addBinaryPropertyListWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5;
- (void)addBooleanWithAttributeId:(unsigned __int8)a3 value:(BOOL)a4;
- (void)addDataWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5;
- (void)addInt16WithAttributeId:(unsigned __int8)a3 number:(unsigned __int16)a4 isIndexable:(BOOL)a5;
- (void)addInt32WithAttributeId:(unsigned __int8)a3 number:(unsigned int)a4 isIndexable:(BOOL)a5;
- (void)addInt64WithAttributeId:(unsigned __int8)a3 number:(unint64_t)a4 isIndexable:(BOOL)a5;
- (void)addInt8WithAttributeId:(unsigned __int8)a3 number:(unsigned __int8)a4 isIndexable:(BOOL)a5;
- (void)addStringWithAttributId:(unsigned __int8)a3 string:(id)a4 isIndexable:(BOOL)a5;
- (void)builder;
- (void)dealloc;
- (void)encoder;
- (void)reset;
- (void)setBuilder:(void *)a3;
- (void)setCommand:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setEncoder:(void *)a3;
- (void)setMaxTableSize:(unint64_t)a3;
@end

@implementation APNSPackEncoder

- (APNSPackEncoder)initWithMaxTableSize:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)APNSPackEncoder;
  v4 = [(APNSPackEncoder *)&v6 init];
  if (v4)
  {
    if (a3)
    {
      v4->_maxTableSize = a3;
      operator new();
    }
    v4->_maxTableSize = 4096;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  encoder = (void **)self->_encoder;
  if (encoder)
  {
    if (*((char *)encoder + 519) < 0) {
      operator delete(encoder[62]);
    }
    sub_100016048(encoder + 28);
    sub_100016048(encoder);
    operator delete();
  }
  v3.receiver = self;
  v3.super_class = (Class)APNSPackEncoder;
  [(APNSPackEncoder *)&v3 dealloc];
}

- (void)setCommand:(unsigned __int8)a3
{
}

- (void)addDataWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  sub_10001A740((uint64_t)self->_builder, a3, (char *)[v8 bytes], (unint64_t)objc_msgSend(v8, "length"), v5);
}

- (void)addStringWithAttributId:(unsigned __int8)a3 string:(id)a4 isIndexable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  sub_100014374(__p, (char *)[v8 UTF8String]);
  sub_10001A808((uint64_t)self->_builder, a3, (uint64_t)__p, v5);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)addInt8WithAttributeId:(unsigned __int8)a3 number:(unsigned __int8)a4 isIndexable:(BOOL)a5
{
}

- (void)addInt16WithAttributeId:(unsigned __int8)a3 number:(unsigned __int16)a4 isIndexable:(BOOL)a5
{
}

- (void)addInt32WithAttributeId:(unsigned __int8)a3 number:(unsigned int)a4 isIndexable:(BOOL)a5
{
}

- (void)addInt64WithAttributeId:(unsigned __int8)a3 number:(unint64_t)a4 isIndexable:(BOOL)a5
{
}

- (void)addBooleanWithAttributeId:(unsigned __int8)a3 value:(BOOL)a4
{
}

- (void)addBinaryPropertyListWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5
{
  id v7 = a4;
  sub_10001ACA0((unint64_t *)self->_builder, a3, (const UInt8 *)[v7 bytes], (unint64_t)objc_msgSend(v7, "length"));
}

- (id)copyMessage
{
  __p = 0;
  v13 = 0;
  uint64_t v14 = 0;
  if (sub_10001AE48((uint64_t)self->_builder, (uint64_t)&__p))
  {
    id v3 = objc_alloc_init((Class)NSMutableData);
    v4 = (char *)__p;
    if (v13 != __p)
    {
      unint64_t v5 = 0;
      do
      {
        [v3 appendBytes:&v4[v5++] length:1];
        v4 = (char *)__p;
      }
      while (v13 - (unsigned char *)__p > v5);
    }
    builder = self->_builder;
    if (builder)
    {
      id v7 = (void *)builder[2];
      if (v7)
      {
        builder[3] = v7;
        operator delete(v7);
      }
      operator delete();
    }
    self->_builder = 0;
  }
  else
  {
    id v8 = self->_builder;
    if (v8)
    {
      v9 = (void *)v8[2];
      if (v9)
      {
        v8[3] = v9;
        operator delete(v9);
      }
      operator delete();
    }
    self->_builder = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "APNSPackEncoder:receivedError:", self, -[APNSPackEncoder errorCode](self, "errorCode"));

    id v3 = 0;
  }
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
  return v3;
}

- (BOOL)hasError
{
  return sub_100018970((uint64_t)self->_encoder);
}

- (int)errorCode
{
  return sub_100018980((uint64_t)self->_encoder);
}

- (id)errorMessage
{
  uint64_t v2 = sub_10001893C((uint64_t)self->_encoder);
  if (*(char *)(v2 + 23) >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = *(void *)v2;
  }
  return +[NSString stringWithUTF8String:v3];
}

- (id)keyTable
{
  uint64_t v2 = nullsub_2(self->_encoder, a2);
  return sub_100067B68(v2);
}

- (id)valueTable
{
  uint64_t v2 = sub_100018988((uint64_t)self->_encoder);
  return sub_100067D14(v2);
}

- (id)metrics
{
  uint64_t v2 = [[APNSPackMetrics alloc] initWithEncoder:self];
  return v2;
}

- (void)reset
{
}

- (void)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(void *)a3
{
  self->_encoder = a3;
}

- (void)builder
{
  return self->_builder;
}

- (void)setBuilder:(void *)a3
{
  self->_builder = a3;
}

- (APNSPackEncoderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APNSPackEncoderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maxTableSize
{
  return self->_maxTableSize;
}

- (void)setMaxTableSize:(unint64_t)a3
{
  self->_maxTableSize = a3;
}

- (void).cxx_destruct
{
}

@end