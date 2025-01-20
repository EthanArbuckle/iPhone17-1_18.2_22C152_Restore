@interface APNSPackDecoder
- (APNSPackDecoder)initWithMaxTableSize:(unint64_t)a3;
- (APNSPackDecoderDelegate)delegate;
- (BOOL)decodeMessage:(id)a3 parser:(id)a4 parameters:(id *)a5 isInvalid:(BOOL *)a6 lengthParsed:(unint64_t *)a7;
- (BOOL)hasError;
- (id)errorMessage;
- (id)keyTable;
- (id)metrics;
- (id)valueTable;
- (int)errorCode;
- (void)dealloc;
- (void)decoder;
- (void)reset;
- (void)setDecoder:(void *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation APNSPackDecoder

- (APNSPackDecoder)initWithMaxTableSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APNSPackDecoder;
  if ([(APNSPackDecoder *)&v5 init])
  {
    if (a3) {
      operator new();
    }
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  decoder = (void **)self->_decoder;
  if (decoder)
  {
    if (*((char *)decoder + 215) < 0) {
      operator delete(decoder[24]);
    }
    sub_10000F0D0(decoder + 9);
    sub_10000F0D0(decoder);
    operator delete();
  }
  v3.receiver = self;
  v3.super_class = (Class)APNSPackDecoder;
  [(APNSPackDecoder *)&v3 dealloc];
}

- (BOOL)decodeMessage:(id)a3 parser:(id)a4 parameters:(id *)a5 isInvalid:(BOOL *)a6 lengthParsed:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  if (![v12 length]) {
    goto LABEL_13;
  }
  id v14 = v12;
  v15 = (unsigned __int8 *)[v14 bytes];
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  v16 = v15 + 1;
  if (!sub_100010B54((uint64_t)self->_decoder, (uint64_t)(v15 + 1), (uint64_t)[v14 length] - 1, &v27, &v26))
  {
LABEL_10:
    *a6 = 1;
    if ([(APNSPackDecoder *)self hasError])
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "APNSPackDecoder:ReceivedError:", self, -[APNSPackDecoder errorCode](self, "errorCode"));
      BOOL v22 = 0;
      goto LABEL_12;
    }
LABEL_13:
    BOOL v22 = 0;
    goto LABEL_14;
  }
  WeakRetained = +[NSMutableDictionary dictionary];
  v24 = a7;
  sub_1000689C4(v25, v13, WeakRetained);
  sub_100068348((uint64_t)v25, *v15);
  uint64_t v19 = v26;
  unint64_t v18 = v27;
  id v20 = [v14 length];
  unint64_t v21 = v19 + v18 + 1;
  BOOL v22 = v21 <= (unint64_t)v20;
  if (v21 > (unint64_t)v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ we don't have entire frame data yet when parsing", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (!sub_100010E54((uint64_t)self->_decoder, (uint64_t)v25, (uint64_t)&v16[v26], v27))
  {
    sub_100068C50((uint64_t)v25);

    goto LABEL_10;
  }
  *a5 = WeakRetained;
  unint64_t *v24 = v26 + v27 + 1;
LABEL_8:
  sub_100068C50((uint64_t)v25);
LABEL_12:

LABEL_14:
  return v22;
}

- (BOOL)hasError
{
  return sub_100010C80((uint64_t)self->_decoder);
}

- (int)errorCode
{
  return sub_1000132A8((uint64_t)self->_decoder);
}

- (id)errorMessage
{
  uint64_t v2 = sub_1000132A0((uint64_t)self->_decoder);
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
  uint64_t v2 = nullsub_2(self->_decoder, a2);
  return sub_100068440(v2);
}

- (id)valueTable
{
  uint64_t v2 = sub_100013340((uint64_t)self->_decoder);
  return sub_1000685EC(v2);
}

- (id)metrics
{
  uint64_t v2 = [[APNSPackMetrics alloc] initWithDecoder:self];
  return v2;
}

- (void)reset
{
}

- (void)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(void *)a3
{
  self->_decoder = a3;
}

- (APNSPackDecoderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APNSPackDecoderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end