@interface AXLTTranscribedDataReceiver
- (AXLTTranscribedDataReceiver)initWithRequestType:(int64_t)a3 targetPID:(int)a4 handler:(id)a5 audioInfoBlock:(id)a6;
- (id)audioInfoBlock;
- (id)callbackBlock;
- (int)targetPID;
- (int64_t)requestType;
@end

@implementation AXLTTranscribedDataReceiver

- (AXLTTranscribedDataReceiver)initWithRequestType:(int64_t)a3 targetPID:(int)a4 handler:(id)a5 audioInfoBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AXLTTranscribedDataReceiver;
  v12 = [(AXLTTranscribedDataReceiver *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_requestType = a3;
    v12->_targetPID = a4;
    uint64_t v14 = MEMORY[0x23ECDEA10](v10);
    id callbackBlock = v13->_callbackBlock;
    v13->_id callbackBlock = (id)v14;

    uint64_t v16 = MEMORY[0x23ECDEA10](v11);
    id audioInfoBlock = v13->_audioInfoBlock;
    v13->_id audioInfoBlock = (id)v16;
  }
  return v13;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (int)targetPID
{
  return self->_targetPID;
}

- (id)callbackBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (id)audioInfoBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audioInfoBlock, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end