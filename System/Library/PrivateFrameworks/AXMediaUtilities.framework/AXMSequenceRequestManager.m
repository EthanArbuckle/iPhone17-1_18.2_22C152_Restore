@interface AXMSequenceRequestManager
- (VNSequenceRequestHandler)sequenceRequestHandler;
- (void)setSequenceRequestHandler:(id)a3;
@end

@implementation AXMSequenceRequestManager

- (VNSequenceRequestHandler)sequenceRequestHandler
{
  sequenceRequestHandler = self->_sequenceRequestHandler;
  if (!sequenceRequestHandler)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getVNSequenceRequestHandlerClass_softClass;
    uint64_t v13 = getVNSequenceRequestHandlerClass_softClass;
    if (!getVNSequenceRequestHandlerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getVNSequenceRequestHandlerClass_block_invoke;
      v9[3] = &unk_1E6116AD8;
      v9[4] = &v10;
      __getVNSequenceRequestHandlerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (VNSequenceRequestHandler *)objc_alloc_init(v5);
    v7 = self->_sequenceRequestHandler;
    self->_sequenceRequestHandler = v6;

    sequenceRequestHandler = self->_sequenceRequestHandler;
  }

  return sequenceRequestHandler;
}

- (void)setSequenceRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end