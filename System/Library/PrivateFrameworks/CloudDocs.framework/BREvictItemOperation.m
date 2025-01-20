@interface BREvictItemOperation
- (BREvictItemOperation)initWithURL:(id)a3;
- (id)description;
- (id)evictionCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setEvictionCompletionBlock:(id)a3;
@end

@implementation BREvictItemOperation

- (BREvictItemOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BREvictItemOperation;
  v6 = [(BROperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  v7.receiver = v2;
  v7.super_class = (Class)BREvictItemOperation;
  v4 = [(BROperation *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ url=%@", v4, v2->_url];

  objc_sync_exit(v2);

  return v5;
}

- (void)main
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_section = &self->_section;
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  __brc_create_section(0, (uint64_t)"-[BREvictItemOperation main]", 33, &v16);
  v4 = brc_bread_crumbs((uint64_t)"-[BREvictItemOperation main]", 33);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    v21 = url;
    __int16 v22 = 2112;
    v23 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx evicting item at: %@%@", buf, 0x20u);
  }

  *(_OWORD *)&p_section->sectionID = v16;
  *(void *)&p_section->line = v17;
  if (BRIsFPFSEnabled(v6, v7))
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_super v9 = self->_url;
    id v15 = 0;
    [v8 evictUbiquitousItemAtURL:v9 error:&v15];
    id v10 = v15;

    [(BROperation *)self completedWithResult:0 error:v10];
  }
  else
  {
    v11 = [(BROperation *)self remoteLegacyObject];
    v12 = self->_url;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__BREvictItemOperation_main__block_invoke;
    v14[3] = &unk_1E59AD448;
    v14[4] = self;
    [v11 startOperation:self toEvictItemAtURL:v12 reply:v14];
  }
}

uint64_t __28__BREvictItemOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  $3C52EB5FA2A5D3907B44D7DBAB114CA7 section = self->_section;
  v8 = brc_bread_crumbs((uint64_t)"-[BREvictItemOperation finishWithResult:error:]", 48);
  objc_super v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    *(_DWORD *)buf = 134218498;
    unint64_t sectionID = section.sectionID;
    __int16 v17 = 2112;
    v18 = url;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx eviction for %@ finished%@", buf, 0x20u);
  }

  uint64_t v10 = [(BREvictItemOperation *)self evictionCompletionBlock];
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
    [(BREvictItemOperation *)self setEvictionCompletionBlock:0];
  }

  v13.receiver = self;
  v13.super_class = (Class)BREvictItemOperation;
  [(BROperation *)&v13 finishWithResult:v6 error:v7];
  __brc_leave_section((uint64_t)&section);
}

- (id)evictionCompletionBlock
{
  return objc_getProperty(self, a2, 328, 1);
}

- (void)setEvictionCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evictionCompletionBlock, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end