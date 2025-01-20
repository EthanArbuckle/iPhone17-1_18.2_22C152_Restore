@interface _HDOntologyDownloadTask
- (_HDOntologyDownloadTask)init;
- (id)_taskError;
- (id)initForDownloader:(id)a3 session:(id)a4 queue:(id)a5;
- (void)downloadShardsForEntries:(id)a3 completion:(id)a4;
@end

@implementation _HDOntologyDownloadTask

- (_HDOntologyDownloadTask)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)initForDownloader:(id)a3 session:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HDOntologyDownloadTask;
  v12 = [(_HDOntologyDownloadTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downloader, a3);
    objc_storeStrong((id *)&v13->_session, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
    dispatch_group_t v14 = dispatch_group_create();
    downloadGroup = v13->_downloadGroup;
    v13->_downloadGroup = (OS_dispatch_group *)v14;
  }
  return v13;
}

- (void)downloadShardsForEntries:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_group_t v8 = dispatch_group_create();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke;
  v16[3] = &unk_1E6303100;
  v16[4] = self;
  dispatch_group_t v17 = v8;
  id v9 = v8;
  objc_msgSend(v7, "hk_map:", v16);
  id v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

  downloadTasks = self->_downloadTasks;
  self->_downloadTasks = v10;

  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke_2;
  v14[3] = &unk_1E62F4928;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  dispatch_group_notify(v9, queue, v14);
}

- (id)_taskError
{
  v2 = [(NSArray *)self->_downloadTasks hk_firstObjectPassingTest:&__block_literal_global_130];
  v3 = [v2 error];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTasks, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_downloader, 0);
}

@end