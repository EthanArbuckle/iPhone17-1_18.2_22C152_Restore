@interface CKRecordObserver
- (CKContainerSetupInfo)containerInfo;
- (CKRecordObservable)provider;
- (CKRecordObserver)init;
- (CKRecordObserver)initWithContainer:(id)a3 recordType:(id)a4;
- (CKRecordObserver)initWithContainerInfo:(id)a3 recordType:(id)a4 provider:(id)a5;
- (NSString)description;
- (NSString)recordType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)invalidate;
- (void)registerWithBlock:(id)a3;
@end

@implementation CKRecordObserver

- (CKRecordObserver)init
{
  return (CKRecordObserver *)MEMORY[0x1F4181798](self, sel_initWithContainer_recordType_, 0, 0);
}

- (CKRecordObserver)initWithContainer:(id)a3 recordType:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (v6)
  {
    id v11 = v6;
  }
  else
  {
    objc_msgSend_defaultContainer(CKContainer, v7, v8, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v11;
  v16 = objc_msgSend_setupInfo(v11, v12, v13, v14);
  v20 = objc_msgSend_recordChangeProvider(v15, v17, v18, v19);
  v22 = (CKRecordObserver *)objc_msgSend_initWithContainerInfo_recordType_provider_(self, v21, (uint64_t)v16, (uint64_t)v10, v20);

  return v22;
}

- (CKRecordObserver)initWithContainerInfo:(id)a3 recordType:(id)a4 provider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)self, @"CKRecordObserver.m", 153, @"Invalid parameter not satisfying: %@", @"containerInfo");

    if (v15) {
      goto LABEL_3;
    }
  }
  v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, @"CKRecordObserver.m", 154, @"Invalid parameter not satisfying: %@", @"provider");

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)CKRecordObserver;
  uint64_t v19 = [(CKRecordObserver *)&v32 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v9, v16, v17, v18);
    containerInfo = v19->_containerInfo;
    v19->_containerInfo = (CKContainerSetupInfo *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    recordType = v19->_recordType;
    v19->_recordType = (NSString *)v25;

    objc_storeStrong((id *)&v19->_provider, a5);
  }

  return v19;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordType(self, v5, v6, v7);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v9, @"recordType", (uint64_t)v8, 0);

  objc_msgSend_containerInfo(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v13, @"container", (uint64_t)v14, 0);
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x18C12ADA0](self, a2);
  v5 = objc_msgSend_CKObjectDescriptionRedact_avoidShortDescription_(self, v4, 0, 1);
  id v9 = objc_msgSend_description(v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)redactedDescription
{
  v3 = (void *)MEMORY[0x18C12ADA0](self, a2);
  v5 = objc_msgSend_CKObjectDescriptionRedact_avoidShortDescription_(self, v4, 1, 1);
  id v9 = objc_msgSend_description(v5, v6, v7, v8);

  return v9;
}

- (void)registerWithBlock:(id)a3
{
  id v4 = a3;
  objc_msgSend_provider(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRecordObserver_block_(v9, v8, (uint64_t)self, (uint64_t)v4);
}

- (void)invalidate
{
  objc_msgSend_provider(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeRecordObserver_(v7, v5, (uint64_t)self, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKRecordObserver alloc];
  uint64_t v8 = objc_msgSend_containerInfo(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_recordType(self, v9, v10, v11);
  v16 = objc_msgSend_provider(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_initWithContainerInfo_recordType_provider_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (CKContainerSetupInfo)containerInfo
{
  return self->_containerInfo;
}

- (CKRecordObservable)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_containerInfo, 0);

  objc_storeStrong((id *)&self->_recordType, 0);
}

@end