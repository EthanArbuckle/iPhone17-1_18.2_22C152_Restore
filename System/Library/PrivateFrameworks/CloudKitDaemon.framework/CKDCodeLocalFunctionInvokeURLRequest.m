@interface CKDCodeLocalFunctionInvokeURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)parsingStandaloneMessage;
- (BOOL)requestGETPreAuth;
- (BOOL)shouldCompressBody;
- (BOOL)wantsProtocolTranslator;
- (CKDCodeLocalFunctionInvokeURLRequest)initWithOperation:(id)a3 serviceName:(id)a4 functionName:(id)a5 serializedParameters:(id)a6 resolvedBaseURL:(id)a7;
- (Class)expectedResponseClass;
- (Class)requestMessageClass;
- (NSData)serializedParameters;
- (NSString)functionName;
- (NSString)serviceName;
- (NSURL)resolvedBaseURL;
- (id)additionalHeaderValues;
- (id)requestBodyStream;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)serializedResultsCallback;
- (int64_t)databaseScope;
- (int64_t)partitionType;
- (int64_t)serverType;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setResolvedBaseURL:(id)a3;
- (void)setSerializedParameters:(id)a3;
- (void)setSerializedResultsCallback:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation CKDCodeLocalFunctionInvokeURLRequest

- (CKDCodeLocalFunctionInvokeURLRequest)initWithOperation:(id)a3 serviceName:(id)a4 functionName:(id)a5 serializedParameters:(id)a6 resolvedBaseURL:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKDCodeLocalFunctionInvokeURLRequest;
  v17 = [(CKDURLRequest *)&v20 initWithOperation:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_serviceName, a4);
    objc_storeStrong((id *)&v18->_functionName, a5);
    objc_storeStrong((id *)&v18->_serializedParameters, a6);
    objc_storeStrong((id *)&v18->_resolvedBaseURL, a7);
  }

  return v18;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDCodeLocalFunctionInvokeURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v13 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_serviceName(self, v5, v6, v13.receiver, v13.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"serviceName");

  v11 = objc_msgSend_functionName(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"functionName");
}

- (BOOL)requestGETPreAuth
{
  v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  char v6 = objc_msgSend_usePreauth(v3, v4, v5);

  return v6;
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (int64_t)partitionType
{
  uint64_t v3 = objc_msgSend_databaseScope(self, a2, v2);
  if (v3 == 4 || v3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)databaseScope
{
  id v4 = objc_msgSend_operation(self, a2, v2);
  v7 = objc_msgSend_operationInfo(v4, v5, v6);

  if (objc_msgSend_enqueuedOnContainerService(v7, v8, v9))
  {
    int64_t v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKDCodeLocalFunctionInvokeURLRequest;
    int64_t v10 = [(CKDURLRequest *)&v12 databaseScope];
  }

  return v10;
}

- (int64_t)serverType
{
  return 5;
}

- (id)additionalHeaderValues
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  uint64_t v5 = objc_msgSend_serviceName(self, a2, v2);
  v8 = objc_msgSend_functionName(self, v6, v7);
  int64_t v10 = objc_msgSend_stringWithFormat_(v4, v9, @"%@/%@", v5, v8);

  v14[0] = 0x1F204D3D0;
  v14[1] = 0x1F204D130;
  v15[0] = v10;
  v15[1] = @"application/protobuf";
  objc_super v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v15, v14, 2);

  return v12;
}

- (BOOL)shouldCompressBody
{
  return 0;
}

- (BOOL)parsingStandaloneMessage
{
  return 1;
}

- (BOOL)wantsProtocolTranslator
{
  return 1;
}

- (id)requestBodyStream
{
  id v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_functionName(self, v5, v6);
  objc_msgSend_setFunctionName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_serializedParameters(self, v9, v10);
  objc_msgSend_setSerializedParameters_(v4, v12, (uint64_t)v11);

  objc_msgSend_setSerializationFormat_(v4, v13, 1);
  id v16 = objc_msgSend_container(self, v14, v15);
  v17 = objc_opt_new();
  if (objc_msgSend_allowsAuthedAccount(self, v18, v19)
    && (objc_msgSend_sendRequestAnonymously(self, v20, v21) & 1) == 0)
  {
    v22 = objc_msgSend_containerScopedUserID(v16, v20, v21);
    objc_msgSend_setUserId_(v17, v23, (uint64_t)v22);
  }
  v24 = objc_msgSend_containerID(v16, v20, v21);
  v27 = objc_msgSend_containerIdentifier(v24, v25, v26);
  objc_msgSend_setContainerName_(v17, v28, (uint64_t)v27);

  v31 = objc_msgSend_containerID(v16, v29, v30);
  uint64_t v34 = objc_msgSend_environment(v31, v32, v33);

  objc_msgSend_setDatabaseEnvironment_(v17, v35, v34 == 1);
  v38 = objc_msgSend_hardwareID(v16, v36, v37);
  objc_msgSend_setDeviceId_(v17, v39, (uint64_t)v38);

  switch(objc_msgSend_databaseScope(self, v40, v41))
  {
    case 1:
      objc_msgSend_setDatabaseType_(v17, v42, 1);
      break;
    case 2:
      objc_msgSend_setDatabaseType_(v17, v42, 0);
      break;
    case 3:
      objc_msgSend_setDatabaseType_(v17, v42, 2);
      break;
    case 4:
      objc_msgSend_setDatabaseType_(v17, v42, 3);
      break;
    default:
      v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v42, v43);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, @"CKDCodeLocalFunctionInvokeURLRequest.m", 127, @"Invalid database environment for local code request");

      break;
  }
  v46 = objc_opt_new();
  v49 = objc_msgSend_operation(self, v47, v48);
  v52 = objc_msgSend_operationID(v49, v50, v51);
  objc_msgSend_setOperationId_(v46, v53, (uint64_t)v52);

  v56 = objc_msgSend_operationGroupID(v49, v54, v55);
  objc_msgSend_setOperationGroupId_(v46, v57, (uint64_t)v56);

  v60 = objc_msgSend_operationGroupName(v49, v58, v59);
  objc_msgSend_setOperationGroupName_(v46, v61, (uint64_t)v60);

  v64 = objc_msgSend_operationGroupQuantityNumber(v49, v62, v63);

  if (v64)
  {
    v67 = objc_msgSend_operationGroupQuantityNumber(v49, v65, v66);
    int v70 = objc_msgSend_intValue(v67, v68, v69);
    objc_msgSend_setOperationGroupQuantity_(v46, v71, v70);
  }
  objc_msgSend_setOperationGroup_(v17, v65, (uint64_t)v46);
  objc_msgSend_setRequestContext_(v4, v72, (uint64_t)v17);
  v75 = objc_msgSend_data(v4, v73, v74);
  v78 = objc_msgSend_shared(CKDTrafficLogger, v76, v77);
  v81 = objc_msgSend_requestUUID(self, v79, v80);
  objc_msgSend_logPartialRequestObjectDataWithRequestUUID_objectData_completionHandler_(v78, v82, (uint64_t)v81, v75, &unk_1F2043270);

  v84 = objc_msgSend_inputStreamWithData_(MEMORY[0x1E4F1CA10], v83, (uint64_t)v75);

  return v84;
}

- (Class)requestMessageClass
{
  return (Class)objc_opt_class();
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_serializedResultsCallback(self, v5, v6);

  if (v7)
  {
    objc_msgSend_serializedResultsCallback(self, v8, v9);
    uint64_t v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_super v13 = objc_msgSend_serializedResult(v4, v11, v12);
    id v16 = objc_msgSend_error(v4, v14, v15);
    ((void (**)(void, void *, void *))v10)[2](v10, v13, v16);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v4 = objc_msgSend_serializedResultsCallback(self, a2, (uint64_t)a3);

  if (v4)
  {
    id v10 = (id)objc_opt_new();
    objc_msgSend_setCode_(v10, v5, 3);
    objc_msgSend_setMessage_(v10, v6, @"Failed to parse node");
    objc_msgSend_serializedResultsCallback(self, v7, v8);
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, id))v9)[2](v9, 0, v10);
  }
}

- (id)serializedResultsCallback
{
  return self->_serializedResultsCallback;
}

- (void)setSerializedResultsCallback:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (NSData)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setSerializedParameters:(id)a3
{
}

- (NSURL)resolvedBaseURL
{
  return self->_resolvedBaseURL;
}

- (void)setResolvedBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedBaseURL, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_serializedResultsCallback, 0);
}

@end