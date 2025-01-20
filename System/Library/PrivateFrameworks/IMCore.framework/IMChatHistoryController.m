@interface IMChatHistoryController
+ (id)sharedInstance;
- (IMChatHistoryController)init;
- (NSMutableDictionary)_runningQueries;
- (void)dealloc;
- (void)itemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5;
- (void)loadItemWithGUID:(id)a3 completionBlock:(id)a4;
- (void)loadMessageItemWithGUID:(id)a3 completionBlock:(id)a4;
- (void)loadMessageWithGUID:(id)a3 completionBlock:(id)a4;
- (void)messageItemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5;
- (void)messageQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5;
- (void)set_runningQueries:(id)a3;
@end

@implementation IMChatHistoryController

- (IMChatHistoryController)init
{
  v14.receiver = self;
  v14.super_class = (Class)IMChatHistoryController;
  v5 = [(IMChatHistoryController *)&v14 init];
  if (v5)
  {
    v6 = objc_msgSend_sharedInstance(IMDaemonController, v2, v3, v4);
    v10 = objc_msgSend_listener(v6, v7, v8, v9);
    objc_msgSend_addHandler_(v10, v11, (uint64_t)v5, v12);
  }
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1EB3F24E8 != -1) {
    dispatch_once(&qword_1EB3F24E8, &unk_1EF8E5758);
  }
  v2 = (void *)qword_1EB3F2548;

  return v2;
}

- (void)dealloc
{
  v5 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  uint64_t v9 = objc_msgSend_listener(v5, v6, v7, v8);
  objc_msgSend_removeHandler_(v9, v10, (uint64_t)self, v11);

  v12.receiver = self;
  v12.super_class = (Class)IMChatHistoryController;
  [(IMChatHistoryController *)&v12 dealloc];
}

- (void)loadMessageWithGUID:(id)a3 completionBlock:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v11 = v7;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    objc_super v12 = objc_msgSend_sharedRegistry(IMChatRegistry, v8, v9, v10);
    v16 = objc_msgSend_cachedChats(v12, v13, v14, v15);

    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v44, (uint64_t)v48, 16);
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v22 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v16);
          }
          uint64_t v24 = objc_msgSend_messageForGUID_(*(void **)(*((void *)&v44 + 1) + 8 * i), v19, (uint64_t)v6, v20);
          if (v24)
          {
            v42 = (void *)v24;
            v43 = objc_msgSend_copy(v11, v19, v25, v20);

            id v40 = v42;
            id v11 = v43;
            im_dispatch_after();

            goto LABEL_14;
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v44, (uint64_t)v48, 16);
        if (v21) {
          continue;
        }
        break;
      }
    }

    if (!self->_runningQueries)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      runningQueries = self->_runningQueries;
      self->_runningQueries = Mutable;
    }
    v16 = objc_msgSend_stringGUID(NSString, v26, v27, v28);
    v34 = objc_msgSend_sharedInstance(IMDaemonController, v31, v32, v33);
    objc_msgSend_loadMessageWithGUID_queryID_(v34, v35, (uint64_t)v6, (uint64_t)v16);

    v36 = self->_runningQueries;
    id v40 = (id)objc_msgSend_copy(v11, v37, v38, v39);
    objc_msgSend_setObject_forKey_(v36, v41, (uint64_t)v40, (uint64_t)v16);
LABEL_14:
  }
}

- (void)loadItemWithGUID:(id)a3 completionBlock:(id)a4
{
  id v28 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!self->_runningQueries)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      runningQueries = self->_runningQueries;
      self->_runningQueries = Mutable;
    }
    objc_super v12 = objc_msgSend_stringGUID(NSString, v6, v7, v8);
    v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
    uint64_t v20 = objc_msgSend_remoteDaemon(v16, v17, v18, v19);
    objc_msgSend_loadItemWithGUID_queryID_(v20, v21, (uint64_t)v28, (uint64_t)v12);

    uint64_t v22 = self->_runningQueries;
    v26 = objc_msgSend_copy(v9, v23, v24, v25);
    objc_msgSend_setObject_forKey_(v22, v27, (uint64_t)v26, (uint64_t)v12);
  }
}

- (void)loadMessageItemWithGUID:(id)a3 completionBlock:(id)a4
{
  id v28 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!self->_runningQueries)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      runningQueries = self->_runningQueries;
      self->_runningQueries = Mutable;
    }
    objc_super v12 = objc_msgSend_stringGUID(NSString, v6, v7, v8);
    v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
    uint64_t v20 = objc_msgSend_remoteDaemon(v16, v17, v18, v19);
    objc_msgSend_loadMessageItemWithGUID_queryID_(v20, v21, (uint64_t)v28, (uint64_t)v12);

    uint64_t v22 = self->_runningQueries;
    v26 = objc_msgSend_copy(v9, v23, v24, v25);
    objc_msgSend_setObject_forKey_(v22, v27, (uint64_t)v26, (uint64_t)v12);
  }
}

- (void)messageQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = objc_msgSend_objectForKey_(self->_runningQueries, v11, (uint64_t)v8, v12);
  if (v13)
  {
    v57 = self;
    uint64_t v59 = (uint64_t)v8;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v58 = v10;
    id v15 = v10;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v63, (uint64_t)v67, 16);
    if (v17)
    {
      uint64_t v21 = v17;
      uint64_t v22 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v64 != v22) {
            objc_enumerationMutation(v15);
          }
          uint64_t v24 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_sharedRegistry(IMChatRegistry, v18, v19, v20, v57);
          id v28 = objc_msgSend_existingChatWithGUID_(v25, v26, v24, v27);

          if (v28) {
            objc_msgSend_addObject_(v14, v29, (uint64_t)v28, v30);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v63, (uint64_t)v67, 16);
      }
      while (v21);
    }

    v34 = objc_msgSend_lastObject(v14, v31, v32, v33);
    uint64_t v38 = objc_msgSend_account(v34, v35, v36, v37);

    v42 = objc_msgSend_sender(v9, v39, v40, v41);
    long long v44 = objc_msgSend_imHandleWithID_alreadyCanonical_(v38, v43, (uint64_t)v42, 1);

    v48 = objc_msgSend_handle(v9, v45, v46, v47);
    v50 = objc_msgSend_imHandleWithID_alreadyCanonical_(v38, v49, (uint64_t)v48, 1);

    v52 = objc_msgSend_messageFromIMMessageItem_sender_subject_(IMMessage, v51, (uint64_t)v9, (uint64_t)v44, v50);
    v61 = v14;
    id v62 = v13;
    v60 = v52;
    id v53 = v14;
    id v54 = v52;
    im_dispatch_after();
    id v8 = (id)v59;
    objc_msgSend_removeObjectForKey_(v57->_runningQueries, v55, v59, v56);

    id v10 = v58;
  }
}

- (void)itemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = objc_msgSend_objectForKey_(self->_runningQueries, v11, (uint64_t)v8, v12);
  if (v13)
  {
    v34 = self;
    v35 = v9;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v10;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v17)
    {
      uint64_t v21 = v17;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v15);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_sharedRegistry(IMChatRegistry, v18, v19, v20, v34);
          id v28 = objc_msgSend_existingChatWithGUID_(v25, v26, v24, v27);

          if (v28) {
            objc_msgSend_addObject_(v14, v29, (uint64_t)v28, v30);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v21);
    }

    id v38 = v13;
    id v9 = v35;
    id v36 = v35;
    uint64_t v37 = v14;
    id v31 = v14;
    im_dispatch_after();
    objc_msgSend_removeObjectForKey_(v34->_runningQueries, v32, (uint64_t)v8, v33);
  }
}

- (void)messageItemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = objc_msgSend_objectForKey_(self->_runningQueries, v11, (uint64_t)v8, v12);
  if (v13)
  {
    v34 = self;
    v35 = v9;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v10;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v17)
    {
      uint64_t v21 = v17;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v15);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_sharedRegistry(IMChatRegistry, v18, v19, v20, v34);
          id v28 = objc_msgSend_existingChatWithGUID_(v25, v26, v24, v27);

          if (v28) {
            objc_msgSend_addObject_(v14, v29, (uint64_t)v28, v30);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v21);
    }

    id v38 = v13;
    id v9 = v35;
    id v36 = v35;
    uint64_t v37 = v14;
    id v31 = v14;
    im_dispatch_after();
    objc_msgSend_removeObjectForKey_(v34->_runningQueries, v32, (uint64_t)v8, v33);
  }
}

- (NSMutableDictionary)_runningQueries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_runningQueries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end