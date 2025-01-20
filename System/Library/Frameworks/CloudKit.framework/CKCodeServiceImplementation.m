@interface CKCodeServiceImplementation
- (CKContainerImplementation)containerImplementation;
- (NSNumber)boxedDatabaseScope;
- (NSOperationQueue)operationQueue;
- (NSString)serviceName;
- (NSURL)serviceInstanceURL;
- (OS_dispatch_queue)underlyingDispatchQueue;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)CKStatusReportArray;
- (id)description;
- (id)initInternalWithContainerImplementation:(id)a3 serviceName:(id)a4 boxedDatabaseScope:(id)a5 serviceInstanceURL:(id)a6;
- (void)_addPreparedOperation:(id)a3;
- (void)addOperation:(id)a3 wrappingCodeService:(id)a4 convenienceConfiguration:(id)a5;
@end

@implementation CKCodeServiceImplementation

- (id)initInternalWithContainerImplementation:(id)a3 serviceName:(id)a4 boxedDatabaseScope:(id)a5 serviceInstanceURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v51.receiver = self;
  v51.super_class = (Class)CKCodeServiceImplementation;
  v14 = [(CKCodeServiceImplementation *)&v51 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_containerImplementation, v10);
    uint64_t v19 = objc_msgSend_copy(v11, v16, v17, v18);
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v19;

    uint64_t v24 = objc_msgSend_copy(v12, v21, v22, v23);
    boxedDatabaseScope = v15->_boxedDatabaseScope;
    v15->_boxedDatabaseScope = (NSNumber *)v24;

    uint64_t v29 = objc_msgSend_copy(v13, v26, v27, v28);
    serviceInstanceURL = v15->_serviceInstanceURL;
    v15->_serviceInstanceURL = (NSURL *)v29;

    v31 = NSString;
    v35 = objc_msgSend_containerIdentifier(v10, v32, v33, v34);
    objc_msgSend_stringWithFormat_(v31, v36, @"%@.%@", v37, @"com.apple.cloudkit.codeservice-queue", v35);
    id v38 = objc_claimAutoreleasedReturnValue();
    v42 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41);
    v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v44 = dispatch_queue_create(v42, v43);
    underlyingDispatchQueue = v15->_underlyingDispatchQueue;
    v15->_underlyingDispatchQueue = (OS_dispatch_queue *)v44;

    uint64_t v46 = objc_opt_new();
    operationQueue = v15->_operationQueue;
    v15->_operationQueue = (NSOperationQueue *)v46;

    objc_msgSend_setUnderlyingQueue_(v15->_operationQueue, v48, (uint64_t)v15->_underlyingDispatchQueue, v49);
  }

  return v15;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38[0] = @"serviceName";
  v6 = objc_msgSend_serviceName(self, a2, a3, a4, a5);
  v38[1] = @"container";
  v39[0] = v6;
  id v10 = objc_msgSend_containerImplementation(self, v7, v8, v9);
  v39[1] = v10;
  id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v39, (uint64_t)v38, 2);
  v16 = objc_msgSend_mutableCopy(v12, v13, v14, v15);

  v20 = objc_msgSend_boxedDatabaseScope(self, v17, v18, v19);

  if (v20)
  {
    uint64_t v24 = objc_msgSend_boxedDatabaseScope(self, v21, v22, v23);
    unint64_t v28 = objc_msgSend_integerValue(v24, v25, v26, v27);
    uint64_t v29 = CKDatabaseScopeString(v28);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v30, (uint64_t)v29, @"databaseScope");
  }
  v31 = objc_msgSend_serviceInstanceURL(self, v21, v22, v23);

  if (v31)
  {
    v35 = objc_msgSend_serviceInstanceURL(self, v32, v33, v34);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v36, (uint64_t)v35, @"serviceInstanceURL");
  }

  return v16;
}

- (id)description
{
  return (id)((uint64_t (*)(CKCodeServiceImplementation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void)_addPreparedOperation:(id)a3
{
  id v4 = a3;
  objc_msgSend_operationQueue(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v10, v8, (uint64_t)v4, v9);
}

- (void)addOperation:(id)a3 wrappingCodeService:(id)a4 convenienceConfiguration:(id)a5
{
  id v98 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v95 = [CKException alloc];
    id v97 = (id)objc_msgSend_initWithCode_format_(v95, v96, 12, @"Only CKCodeOperation must be submitted to a CKCodeService");
    objc_exception_throw(v97);
  }
  id v13 = objc_msgSend_configuration(v98, v10, v11, v12);
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v13, v14, v15, v16)) {
    goto LABEL_7;
  }
  v20 = objc_msgSend_group(v98, v17, v18, v19);
  uint64_t v24 = objc_msgSend_defaultConfiguration(v20, v21, v22, v23);
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v24, v25, v26, v27)) {
    goto LABEL_6;
  }
  v31 = objc_msgSend_configuration(v9, v28, v29, v30);
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v31, v32, v33, v34))
  {

LABEL_6:
LABEL_7:

    goto LABEL_8;
  }
  v72 = objc_msgSend_group(v9, v35, v36, v37);
  v76 = objc_msgSend_defaultConfiguration(v72, v73, v74, v75);
  char hasDiscretionaryNetworkBehavior = objc_msgSend_hasDiscretionaryNetworkBehavior(v76, v77, v78, v79);

  if ((hasDiscretionaryNetworkBehavior & 1) == 0)
  {
    id v13 = objc_msgSend_configuration(v98, v38, v39, v40);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v13, v81, 0, v82);
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v41 = objc_msgSend_configuration(v98, v38, v39, v40);
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v41, v42, v43, v44))
  {
LABEL_13:

    goto LABEL_14;
  }
  v48 = objc_msgSend_group(v98, v45, v46, v47);
  v52 = objc_msgSend_defaultConfiguration(v48, v49, v50, v51);
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v52, v53, v54, v55))
  {
LABEL_12:

    goto LABEL_13;
  }
  v59 = objc_msgSend_configuration(v9, v56, v57, v58);
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v59, v60, v61, v62))
  {

    goto LABEL_12;
  }
  v83 = objc_msgSend_group(v9, v63, v64, v65);
  v87 = objc_msgSend_defaultConfiguration(v83, v84, v85, v86);
  char hasAutomaticallyRetryNetworkFailures = objc_msgSend_hasAutomaticallyRetryNetworkFailures(v87, v88, v89, v90);

  if ((hasAutomaticallyRetryNetworkFailures & 1) == 0)
  {
    uint64_t v41 = objc_msgSend_configuration(v98, v66, v92, v67);
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v41, v93, 0, v94);
    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend_setCodeService_(v98, v66, (uint64_t)v8, v67);
  objc_msgSend_applyConvenienceConfiguration_(v98, v68, (uint64_t)v9, v69);
  objc_msgSend__addPreparedOperation_(self, v70, (uint64_t)v98, v71);
}

- (id)CKStatusReportArray
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = NSString;
  id v8 = objc_msgSend_operationQueue(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_operationCount(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_operationQueue(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_maxConcurrentOperationCount(v16, v17, v18, v19);
  uint64_t v23 = objc_msgSend_stringWithFormat_(v4, v21, @"%@, %lu/%ld operations", v22, self, v12, v20);
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

  uint64_t v29 = objc_msgSend_operationQueue(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_operationCount(v29, v30, v31, v32);

  if (v33)
  {
    objc_msgSend_addObject_(v3, v34, @"\nOperations: {", v35);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v39 = objc_msgSend_operationQueue(self, v36, v37, v38);
    uint64_t v43 = objc_msgSend_operations(v39, v40, v41, v42);

    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v57, (uint64_t)v61, 16);
    if (v45)
    {
      uint64_t v48 = v45;
      uint64_t v49 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v58 != v49) {
            objc_enumerationMutation(v43);
          }
          uint64_t v51 = objc_msgSend_stringWithFormat_(NSString, v46, @"\t%@", v47, *(void *)(*((void *)&v57 + 1) + 8 * i));
          objc_msgSend_addObject_(v3, v52, (uint64_t)v51, v53);
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v57, (uint64_t)v61, 16);
      }
      while (v48);
    }

    objc_msgSend_addObject_(v3, v54, @"}", v55);
  }

  return v3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSURL)serviceInstanceURL
{
  return self->_serviceInstanceURL;
}

- (NSNumber)boxedDatabaseScope
{
  return self->_boxedDatabaseScope;
}

- (CKContainerImplementation)containerImplementation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerImplementation);

  return (CKContainerImplementation *)WeakRetained;
}

- (OS_dispatch_queue)underlyingDispatchQueue
{
  return self->_underlyingDispatchQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_underlyingDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_containerImplementation);
  objc_storeStrong((id *)&self->_boxedDatabaseScope, 0);
  objc_storeStrong((id *)&self->_serviceInstanceURL, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end