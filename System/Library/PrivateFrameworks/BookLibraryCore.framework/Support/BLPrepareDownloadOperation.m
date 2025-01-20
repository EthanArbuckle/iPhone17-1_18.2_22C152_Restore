@interface BLPrepareDownloadOperation
+ (BOOL)allowsCellularAccessForAsset:(id)a3 policy:(id)a4 isCellularAllowedForRestores:(BOOL)a5;
+ (void)enumerateOperationsWithDownloads:(id)a3 downloadPolicyManager:(id)a4 usingBlock:(id)a5;
- (NSString)downloadIdentifier;
- (_BLPrepareDownloadOperation)operation;
- (id)_initWithDownload:(id)a3 policy:(id)a4;
- (id)outputBlock;
- (void)run;
- (void)setOperation:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation BLPrepareDownloadOperation

- (id)_initWithDownload:(id)a3 policy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLPrepareDownloadOperation;
  v8 = [(BLOperation *)&v12 init];
  if (v8)
  {
    v9 = [[_BLPrepareDownloadOperation alloc] _initWithOperation:v8 download:v6 policy:v7];
    operation = v8->_operation;
    v8->_operation = v9;
  }
  return v8;
}

+ (BOOL)allowsCellularAccessForAsset:(id)a3 policy:(id)a4 isCellularAllowedForRestores:(BOOL)a5
{
  return +[_BLPrepareDownloadOperation _allowsCellularAccessForAsset:a3 policy:a4 isCellularAllowedForRestores:a5];
}

+ (void)enumerateOperationsWithDownloads:(id)a3 downloadPolicyManager:(id)a4 usingBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003BF3C;
  v9[3] = &unk_1001A2200;
  id v10 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  [a3 enumerateObjectsUsingBlock:v9];
}

- (NSString)downloadIdentifier
{
  v2 = [(BLPrepareDownloadOperation *)self operation];
  v3 = [v2 downloadIdentifier];

  return (NSString *)v3;
}

- (id)outputBlock
{
  [(BLOperation *)self lock];
  v3 = [(BLPrepareDownloadOperation *)self operation];
  v4 = [v3 outputBlock];
  id v5 = [v4 copy];

  [(BLOperation *)self unlock];
  id v6 = objc_retainBlock(v5);

  return v6;
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  [(BLOperation *)self lock];
  id v5 = [(BLPrepareDownloadOperation *)self operation];
  [v5 setOutputBlock:v4];

  [(BLOperation *)self unlock];
}

- (void)run
{
  id v2 = [(BLPrepareDownloadOperation *)self operation];
  [v2 run];
}

- (_BLPrepareDownloadOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end