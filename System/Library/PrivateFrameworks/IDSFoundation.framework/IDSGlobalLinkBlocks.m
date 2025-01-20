@interface IDSGlobalLinkBlocks
- (IDSGlobalLinkBlocks)initWithBlocks:(id)a3 qraAWDBlock:(id)a4 qraCONBlock:(id)a5 qraDISBlock:(id)a6;
@end

@implementation IDSGlobalLinkBlocks

- (IDSGlobalLinkBlocks)initWithBlocks:(id)a3 qraAWDBlock:(id)a4 qraCONBlock:(id)a5 qraDISBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)IDSGlobalLinkBlocks;
  v14 = [(IDSGlobalLinkBlocks *)&v24 init];
  if (v14)
  {
    v15 = _Block_copy(v10);
    id qraREQBlock = v14->_qraREQBlock;
    v14->_id qraREQBlock = v15;

    v17 = _Block_copy(v11);
    id qraAWDBlock = v14->_qraAWDBlock;
    v14->_id qraAWDBlock = v17;

    v19 = _Block_copy(v12);
    id qraCONBlock = v14->_qraCONBlock;
    v14->_id qraCONBlock = v19;

    v21 = _Block_copy(v13);
    id qraDISBlock = v14->_qraDISBlock;
    v14->_id qraDISBlock = v21;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_qraDISBlock, 0);
  objc_storeStrong(&self->_qraCONBlock, 0);
  objc_storeStrong(&self->_qraAWDBlock, 0);
  objc_storeStrong(&self->_qraREQBlock, 0);
}

@end