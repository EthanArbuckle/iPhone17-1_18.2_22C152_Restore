@interface C3DownloadChunkContext
- (C3DownloadChunkContext)initWithMMCS:(id)a3;
- (CKDMMCS)MMCS;
- (NSMutableDictionary)signatureToMutableData;
- (void)setMMCS:(id)a3;
- (void)setSignatureToMutableData:(id)a3;
@end

@implementation C3DownloadChunkContext

- (C3DownloadChunkContext)initWithMMCS:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)C3DownloadChunkContext;
  v5 = [(C3DownloadChunkContext *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_MMCS, v4);
    uint64_t v7 = objc_opt_new();
    signatureToMutableData = v6->_signatureToMutableData;
    v6->_signatureToMutableData = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (CKDMMCS)MMCS
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_MMCS);
  return (CKDMMCS *)WeakRetained;
}

- (void)setMMCS:(id)a3
{
}

- (NSMutableDictionary)signatureToMutableData
{
  return self->_signatureToMutableData;
}

- (void)setSignatureToMutableData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureToMutableData, 0);
  objc_destroyWeak((id *)&self->_MMCS);
}

@end