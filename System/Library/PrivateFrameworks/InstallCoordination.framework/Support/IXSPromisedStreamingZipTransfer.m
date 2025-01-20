@interface IXSPromisedStreamingZipTransfer
- (IXSPromisedStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4;
- (unint64_t)bytesConsumedOnDisk;
- (unint64_t)totalBytesForProgress;
- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3;
- (void)reset;
@end

@implementation IXSPromisedStreamingZipTransfer

- (IXSPromisedStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IXSPromisedStreamingZipTransfer;
  v4 = [(IXSOwnedDataPromise *)&v10 initWithSeed:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(IXSDataPromise *)v4 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029F58;
    block[3] = &unk_1000E8FA8;
    v9 = v5;
    dispatch_sync(v6, block);
  }
  return v5;
}

- (void)reset
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IXSDataPromise *)self seed];
  [v4 setArchiveBytesConsumed:0];

  v5.receiver = self;
  v5.super_class = (Class)IXSPromisedStreamingZipTransfer;
  [(IXSOwnedDataPromise *)&v5 reset];
}

- (unint64_t)totalBytesForProgress
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IXSDataPromise *)self seed];
  id v5 = [v4 archiveSizeBytes];

  return (unint64_t)v5;
}

- (unint64_t)bytesConsumedOnDisk
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = +[IXFileManager defaultManager];
  id v5 = [(IXSOwnedDataPromise *)self stagedPath];
  id v6 = [v4 diskUsageForURL:v5];

  return (unint64_t)v6;
}

- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3
{
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A1BC;
  v7[3] = &unk_1000E8D28;
  v7[4] = self;
  v7[5] = a3;
  sub_100066F24(v6, v7);
}

@end