@interface _BLPerformDownloadOperation
- (BLDownloadPipeline)pipeline;
- (BLPrepareDownloadResponse)response;
- (_BLPerformDownloadOperation)initWithBLDownloadPipeline:(id)a3 response:(id)a4 completion:(id)a5;
- (id)downloadStartCompletionBlock;
- (void)run;
- (void)setDownloadStartCompletionBlock:(id)a3;
- (void)setPipeline:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation _BLPerformDownloadOperation

- (_BLPerformDownloadOperation)initWithBLDownloadPipeline:(id)a3 response:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_BLPerformDownloadOperation;
  v11 = [(_BLPerformDownloadOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_pipeline, v8);
    objc_storeStrong((id *)&v12->_response, a4);
    id v13 = [v10 copy];
    id downloadStartCompletionBlock = v12->_downloadStartCompletionBlock;
    v12->_id downloadStartCompletionBlock = v13;
  }
  return v12;
}

- (void)run
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeline);
  objc_msgSend(WeakRetained, "doq_performDownloadOperation:completion:", self->_response, self->_downloadStartCompletionBlock);
}

- (BLPrepareDownloadResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (BLDownloadPipeline)pipeline
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipeline);

  return (BLDownloadPipeline *)WeakRetained;
}

- (void)setPipeline:(id)a3
{
}

- (id)downloadStartCompletionBlock
{
  return self->_downloadStartCompletionBlock;
}

- (void)setDownloadStartCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadStartCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_pipeline);

  objc_storeStrong((id *)&self->_response, 0);
}

@end