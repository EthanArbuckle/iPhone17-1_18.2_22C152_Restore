@interface IDSCloudKitContainer
- (IDSCKContainer)container;
- (IDSCloudKitContainer)initWithIdentifier:(id)a3 queue:(id)a4;
- (IDSCloudKitGroupServer)privateGroupServer;
- (IDSCloudKitGroupServer)publicGroupServer;
- (IDSCloudKitKeyElectionStore)keyElectionStore;
- (IDSCloudKitKeyValueStore)keyValueStore;
- (IDSCloudKitTransportLog)transportLog;
- (NSString)containerIdentifier;
- (OS_dispatch_queue)queue;
- (void)setContainer:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IDSCloudKitContainer

- (IDSCloudKitContainer)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)IDSCloudKitContainer;
  v8 = [(IDSCloudKitContainer *)&v76 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    uint64_t v12 = objc_msgSend_containerWithIdentifier_(IDSCKContainer, v10, (uint64_t)v6, v11);
    container = v9->_container;
    v9->_container = (IDSCKContainer *)v12;

    v14 = [IDSCloudKitKeyValueStore alloc];
    v18 = objc_msgSend_container(v9, v15, v16, v17);
    uint64_t v21 = objc_msgSend_initWithContainer_queue_(v14, v19, (uint64_t)v18, v20, v7);
    keyValueStore = v9->_keyValueStore;
    v9->_keyValueStore = (IDSCloudKitKeyValueStore *)v21;

    v23 = [IDSCloudKitGroupServer alloc];
    v27 = objc_msgSend_container(v9, v24, v25, v26);
    v31 = objc_msgSend_publicCloudDatabase(v27, v28, v29, v30);
    uint64_t v34 = objc_msgSend_initWithDatabase_queue_(v23, v32, (uint64_t)v31, v33, v7);
    publicGroupServer = v9->_publicGroupServer;
    v9->_publicGroupServer = (IDSCloudKitGroupServer *)v34;

    v36 = [IDSCloudKitGroupServer alloc];
    v40 = objc_msgSend_container(v9, v37, v38, v39);
    v44 = objc_msgSend_privateCloudDatabase(v40, v41, v42, v43);
    uint64_t v47 = objc_msgSend_initWithDatabase_queue_(v36, v45, (uint64_t)v44, v46, v7);
    privateGroupServer = v9->_privateGroupServer;
    v9->_privateGroupServer = (IDSCloudKitGroupServer *)v47;

    v49 = [IDSCloudKitTransportLog alloc];
    v53 = objc_msgSend_container(v9, v50, v51, v52);
    v57 = objc_msgSend_privateCloudDatabase(v53, v54, v55, v56);
    uint64_t v60 = objc_msgSend_initWithDatabase_queue_(v49, v58, (uint64_t)v57, v59, v7);
    transportLog = v9->_transportLog;
    v9->_transportLog = (IDSCloudKitTransportLog *)v60;

    v62 = [IDSCloudKitKeyElectionStore alloc];
    v66 = objc_msgSend_container(v9, v63, v64, v65);
    v70 = objc_msgSend_privateCloudDatabase(v66, v67, v68, v69);
    uint64_t v73 = objc_msgSend_initWithDatabase_queue_(v62, v71, (uint64_t)v70, v72, v7);
    keyElectionStore = v9->_keyElectionStore;
    v9->_keyElectionStore = (IDSCloudKitKeyElectionStore *)v73;
  }
  return v9;
}

- (NSString)containerIdentifier
{
  v4 = objc_msgSend_container(self, a2, v2, v3);
  v8 = objc_msgSend_containerIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSCKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (IDSCloudKitKeyValueStore)keyValueStore
{
  return self->_keyValueStore;
}

- (IDSCloudKitGroupServer)publicGroupServer
{
  return self->_publicGroupServer;
}

- (IDSCloudKitGroupServer)privateGroupServer
{
  return self->_privateGroupServer;
}

- (IDSCloudKitTransportLog)transportLog
{
  return self->_transportLog;
}

- (IDSCloudKitKeyElectionStore)keyElectionStore
{
  return self->_keyElectionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyElectionStore, 0);
  objc_storeStrong((id *)&self->_transportLog, 0);
  objc_storeStrong((id *)&self->_privateGroupServer, 0);
  objc_storeStrong((id *)&self->_publicGroupServer, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end