@interface IXSPromisedOutOfBandStreamingZipTransfer
- (IXSPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4;
- (unint64_t)totalBytesForProgress;
- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3;
- (void)reset;
@end

@implementation IXSPromisedOutOfBandStreamingZipTransfer

- (IXSPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IXSPromisedOutOfBandStreamingZipTransfer;
  return [(IXSDataPromise *)&v5 initWithSeed:a3 error:a4];
}

- (void)reset
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IXSDataPromise *)self seed];
  [v4 setArchiveBytesConsumed:0];

  v5.receiver = self;
  v5.super_class = (Class)IXSPromisedOutOfBandStreamingZipTransfer;
  [(IXSDataPromise *)&v5 reset];
}

- (unint64_t)totalBytesForProgress
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IXSDataPromise *)self seed];
  id v5 = [v4 archiveSizeBytes];

  return (unint64_t)v5;
}

- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3
{
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004A5C;
  v7[3] = &unk_1000E8D28;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);
}

@end