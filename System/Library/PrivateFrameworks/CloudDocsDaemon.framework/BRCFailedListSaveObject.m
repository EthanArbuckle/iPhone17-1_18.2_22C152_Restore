@interface BRCFailedListSaveObject
- (BRCFailedListSaveObject)initWithPendingChangesStream:(id)a3 serverTruthCallback:(id)a4 clientTruthCallback:(id)a5;
- (BRCPendingChangesStream)pendingChangesStream;
- (id)clientTruthCallback;
- (id)serverTruthCallback;
@end

@implementation BRCFailedListSaveObject

- (BRCFailedListSaveObject)initWithPendingChangesStream:(id)a3 serverTruthCallback:(id)a4 clientTruthCallback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRCFailedListSaveObject;
  v12 = [(BRCFailedListSaveObject *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pendingChangesStream, a3);
    uint64_t v14 = MEMORY[0x1D94389C0](v10);
    id serverTruthCallback = v13->_serverTruthCallback;
    v13->_id serverTruthCallback = (id)v14;

    uint64_t v16 = MEMORY[0x1D94389C0](v11);
    id clientTruthCallback = v13->_clientTruthCallback;
    v13->_id clientTruthCallback = (id)v16;
  }
  return v13;
}

- (BRCPendingChangesStream)pendingChangesStream
{
  return self->_pendingChangesStream;
}

- (id)serverTruthCallback
{
  return self->_serverTruthCallback;
}

- (id)clientTruthCallback
{
  return self->_clientTruthCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientTruthCallback, 0);
  objc_storeStrong(&self->_serverTruthCallback, 0);
  objc_storeStrong((id *)&self->_pendingChangesStream, 0);
}

@end