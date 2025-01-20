@interface BRCHalfChainInfo
- (BRCHalfChainInfo)initWithRecord:(id)a3 ckInfo:(id)a4;
- (BRFieldCKInfo)ckInfo;
- (CKRecord)record;
- (void)setRecord:(id)a3;
@end

@implementation BRCHalfChainInfo

- (BRCHalfChainInfo)initWithRecord:(id)a3 ckInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCHalfChainInfo;
  v9 = [(BRCHalfChainInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_ckInfo, a4);
  }

  return v10;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckInfo, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end