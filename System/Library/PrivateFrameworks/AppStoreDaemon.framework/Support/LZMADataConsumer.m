@interface LZMADataConsumer
- (LZMADataConsumer)init;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation LZMADataConsumer

- (LZMADataConsumer)init
{
  v6.receiver = self;
  v6.super_class = (Class)LZMADataConsumer;
  v2 = [(LZMADataConsumer *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    buffer = v2->_buffer;
    v2->_buffer = v3;
  }
  return v2;
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  if ([v6 length])
  {
    id v12 = 0;
    int v8 = sub_100367CD0((uint64_t)self, v6, &v12);
    id v9 = v12;
    if (v8)
    {
      streamAdapter = self->_streamAdapter;
      id v11 = [(NSMutableData *)self->_buffer copy];
      [(AssetDataConsumer *)streamAdapter consumeData:v11 withCompletionHandler:v7];
    }
    else
    {
      v7[2](v7, v9, 0);
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  int v5 = sub_100367CD0((uint64_t)self, 0, &v13);
  id v6 = v13;
  if (v5)
  {
    decoder = self->_decoder;
    self->_decoder = 0;

    NSUInteger v8 = [(NSMutableData *)self->_buffer length];
    streamAdapter = self->_streamAdapter;
    if (v8)
    {
      id v10 = [(NSMutableData *)self->_buffer copy];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100367F98;
      v11[3] = &unk_100522EC0;
      v11[4] = self;
      id v12 = v4;
      [(AssetDataConsumer *)streamAdapter consumeData:v10 andWaitWithCompletionHandler:v11];
    }
    else
    {
      [(AssetDataConsumer *)self->_streamAdapter finishWithCompletionHandler:v4];
    }
  }
  else
  {
    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = (LZMADecoder *)sub_100239938([LZMADecoder alloc], self->_digest);
  decoder = self->_decoder;
  self->_decoder = v4;

  id v6 = self->_decoder;
  if (v6) {
    v6->_disableAutodetection = self->_disableAutodetection;
  }
  [(AssetDataConsumer *)self->_streamAdapter prepareWithCompletionHandler:v7];
}

- (void)resetWithCompletionHandler:(id)a3
{
  decoder = self->_decoder;
  self->_decoder = 0;
  id v5 = a3;

  [(AssetDataConsumer *)self->_streamAdapter resetWithCompletionHandler:v5];
}

- (void)suspendWithCompletionHandler:(id)a3
{
  decoder = self->_decoder;
  self->_decoder = 0;
  id v4 = (void (**)(id, id))a3;

  id v5 = +[NSError errorWithDomain:ASDErrorDomain code:400 userInfo:0];
  v4[2](v4, v5);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  decoder = self->_decoder;
  self->_decoder = 0;
  id v5 = a3;

  [(AssetDataConsumer *)self->_streamAdapter truncateWithCompletionHandler:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamAdapter, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end