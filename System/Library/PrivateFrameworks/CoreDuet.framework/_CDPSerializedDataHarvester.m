@interface _CDPSerializedDataHarvester
- (NSURL)url;
- (void)loadWithLimit:(unint64_t)a3 dataPointReader:(id)a4 completion:(id)a5;
- (void)setUrl:(id)a3;
@end

@implementation _CDPSerializedDataHarvester

- (void)loadWithLimit:(unint64_t)a3 dataPointReader:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke;
  v16[3] = &unk_1E5610400;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a3;
  v11 = v16;
  id v12 = v9;
  id v13 = v8;
  v14 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_9;
  block[3] = &unk_1E560D978;
  id v21 = v14;
  id v22 = v11;
  id v15 = v14;
  dispatch_async(v10, block);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end