@interface DecryptDataConsumer
- (AssetDataConsumer)streamAdapter;
- (BOOL)_beginSessionWithDPInfo:(id)a3 error:(id *)a4;
- (ChunkedDigest)digest;
- (DecryptDataConsumer)initWithDPInfo:(id)a3 error:(id *)a4;
- (void)_resetDecryptionBufferAndDigestVerifier;
- (void)_resizeSampleSizeArray:(unint64_t)a3;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setDigest:(id)a3;
- (void)setStreamAdapter:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation DecryptDataConsumer

- (DecryptDataConsumer)initWithDPInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DecryptDataConsumer;
  v7 = [(DecryptDataConsumer *)&v12 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.storekit.DecryptDataConsumer", v8);
    consumerQueue = v7->_consumerQueue;
    v7->_consumerQueue = (OS_dispatch_queue *)v9;

    v7->_partialSampleBuffer = (char *)malloc_type_malloc(0x8000uLL, 0x1CDD03F9uLL);
    v7->_partialSampleBufferLength = 0;
    v7->_sampleSizes = 0;
    v7->_sampleSizesCount = 0;
    if (![(DecryptDataConsumer *)v7 _beginSessionWithDPInfo:v6 error:a4])
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  free(self->_partialSampleBuffer);
  self->_partialSampleBuffer = 0;
  free(self->_sampleSizes);
  self->_sampleSizes = 0;
  session = self->_session;
  if (session)
  {
    sub_1001C834C((uint64_t)session);
    self->_session = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DecryptDataConsumer;
  [(DecryptDataConsumer *)&v4 dealloc];
}

- (BOOL)_beginSessionWithDPInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10003CCE0;
  v21 = sub_10003CCF0;
  id v22 = 0;
  consumerQueue = self->_consumerQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CCF8;
  v12[3] = &unk_100357F28;
  v15 = &v17;
  id v8 = v6;
  id v13 = v8;
  v14 = self;
  v16 = &v23;
  dispatch_sync(consumerQueue, v12);
  int v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v9 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (void)_resizeSampleSizeArray:(unint64_t)a3
{
  if (self->_sampleSizesCount < a3)
  {
    unint64_t v5 = 4 * a3;
    id v6 = (unsigned int *)malloc_type_realloc(self->_sampleSizes, 4 * a3, 0x100004052888210uLL);
    self->_sampleSizes = v6;
    unint64_t sampleSizesCount = self->_sampleSizesCount;
    if (sampleSizesCount < a3) {
      memset_pattern16(&v6[sampleSizesCount], &unk_1002E2300, v5 - 4 * sampleSizesCount);
    }
    self->_unint64_t sampleSizesCount = a3;
  }
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  consumerQueue = self->_consumerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CFEC;
  block[3] = &unk_100357F50;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(consumerQueue, block);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D7CC;
  v7[3] = &unk_100357FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DB2C;
  v7[3] = &unk_100357FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DD58;
  v7[3] = &unk_100357FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DEA0;
  v7[3] = &unk_100357FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DFE8;
  v7[3] = &unk_100357FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)_resetDecryptionBufferAndDigestVerifier
{
  self->_partialSampleBufferLength = 0;
  self->_digestVerifier = 0;
  _objc_release_x1();
}

- (ChunkedDigest)digest
{
  return (ChunkedDigest *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDigest:(id)a3
{
}

- (AssetDataConsumer)streamAdapter
{
  return (AssetDataConsumer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStreamAdapter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamAdapter, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_digestVerifier, 0);

  objc_storeStrong((id *)&self->_consumerQueue, 0);
}

@end