@interface CKDMMCSItemGroup
+ (id)tupleForItem:(id)a3;
- (BOOL)complete;
- (CKAssetDownloadPreauthorization)downloadPreauthorization;
- (CKDMMCSItemGroup)initWithTuple:(id)a3;
- (MMCSOperationMetric)metrics;
- (NSArray)items;
- (NSArray)tuple;
- (NSData)authPutRequest;
- (NSData)cloneContext;
- (NSError)error;
- (NSString)owner;
- (NSString)requestor;
- (NSURL)contentBaseURL;
- (id)CKPropertiesDescription;
- (id)description;
- (void)addItem:(id)a3;
- (void)setAuthPutRequest:(id)a3;
- (void)setCloneContext:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setTuple:(id)a3;
@end

@implementation CKDMMCSItemGroup

+ (id)tupleForItem:(id)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v8 = objc_msgSend_contentBaseURL(v3, v4, v5);
  if (v8) {
    objc_msgSend_contentBaseURL(v3, v6, v7);
  }
  else {
  v9 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v6, v7);
  }
  v31[0] = v9;
  v14 = objc_msgSend_owner(v3, v10, v11);
  if (v14) {
    objc_msgSend_owner(v3, v12, v13);
  }
  else {
  v15 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v12, v13);
  }
  v31[1] = v15;
  v20 = objc_msgSend_requestor(v3, v16, v17);
  if (v20) {
    objc_msgSend_requestor(v3, v18, v19);
  }
  else {
  v21 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v18, v19);
  }
  v31[2] = v21;
  v26 = objc_msgSend_downloadPreauthorization(v3, v22, v23);
  if (v26) {
    objc_msgSend_downloadPreauthorization(v3, v24, v25);
  }
  else {
  v27 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v24, v25);
  }
  v31[3] = v27;
  v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v31, 4);

  return v29;
}

- (CKDMMCSItemGroup)initWithTuple:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDMMCSItemGroup;
  v6 = [(CKDMMCSItemGroup *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tuple, a3);
    uint64_t v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableArray *)v8;
  }
  return v7;
}

- (id)CKPropertiesDescription
{
  unint64_t v3 = 0x1E4F1C000uLL;
  v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 5);
  uint64_t v7 = objc_msgSend_contentBaseURL(self, v5, v6);
  if (v7)
  {
    v10 = (void *)v7;
    objc_super v11 = objc_msgSend_contentBaseURL(self, v8, v9);
    v14 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v12, v13);

    if (v11 != v14)
    {
      v15 = NSString;
      v16 = objc_msgSend_contentBaseURL(self, v8, v9);
      v18 = objc_msgSend_stringWithFormat_(v15, v17, @"contentBaseURL=%@", v16);
      objc_msgSend_addObject_(v4, v19, (uint64_t)v18);
    }
  }
  uint64_t v20 = objc_msgSend_owner(self, v8, v9);
  if (v20)
  {
    uint64_t v23 = (void *)v20;
    v24 = objc_msgSend_owner(self, v21, v22);
    v27 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v25, v26);

    if (v24 != v27)
    {
      v28 = NSString;
      v29 = objc_msgSend_owner(self, v21, v22);
      v31 = objc_msgSend_stringWithFormat_(v28, v30, @"owner=%@", v29);
      objc_msgSend_addObject_(v4, v32, (uint64_t)v31);
    }
  }
  uint64_t v33 = objc_msgSend_requestor(self, v21, v22);
  if (v33)
  {
    v36 = (void *)v33;
    v37 = objc_msgSend_requestor(self, v34, v35);
    uint64_t v40 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v38, v39);
    if (v37 == (void *)v40)
    {
    }
    else
    {
      v43 = (void *)v40;
      v44 = objc_msgSend_owner(self, v41, v42);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = objc_msgSend_requestor(self, v45, v46);
        v50 = objc_msgSend_owner(self, v48, v49);
        char isEqualToString = objc_msgSend_isEqualToString_(v47, v51, (uint64_t)v50);

        unint64_t v3 = 0x1E4F1C000;
        if (isEqualToString) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      v54 = NSString;
      v36 = objc_msgSend_requestor(self, v34, v53);
      v37 = objc_msgSend_stringWithFormat_(v54, v55, @"requestor=%@", v36);
      objc_msgSend_addObject_(v4, v56, (uint64_t)v37);
    }
  }
LABEL_16:
  v57 = objc_msgSend_arrayWithCapacity_(*(void **)(v3 + 2632), v34, 2);
  if (objc_msgSend_complete(self, v58, v59)) {
    objc_msgSend_addObject_(v57, v60, @"complete");
  }
  v62 = objc_msgSend_downloadPreauthorization(self, v60, v61);

  if (v62) {
    objc_msgSend_addObject_(v57, v63, @"use-download-preauth");
  }
  if (objc_msgSend_count(v57, v63, v64))
  {
    v67 = NSString;
    v68 = objc_msgSend_componentsJoinedByString_(v57, v65, @"|");
    v70 = objc_msgSend_stringWithFormat_(v67, v69, @"flags=%@", v68);
    objc_msgSend_addObject_(v4, v71, (uint64_t)v70);
  }
  v72 = objc_msgSend_error(self, v65, v66);

  if (v72)
  {
    v75 = NSString;
    v76 = objc_msgSend_error(self, v73, v74);
    v78 = objc_msgSend_stringWithFormat_(v75, v77, @"error=%@", v76);
    objc_msgSend_addObject_(v4, v79, (uint64_t)v78);
  }
  v80 = objc_msgSend_componentsJoinedByString_(v4, v73, @", ");

  return v80;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSItemGroup *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSURL)contentBaseURL
{
  unint64_t v3 = objc_msgSend_tuple(self, a2, v2);
  id v5 = objc_msgSend_objectAtIndexedSubscript_(v3, v4, 0);

  return (NSURL *)v5;
}

- (NSString)owner
{
  unint64_t v3 = objc_msgSend_tuple(self, a2, v2);
  id v5 = objc_msgSend_objectAtIndexedSubscript_(v3, v4, 1);

  return (NSString *)v5;
}

- (NSString)requestor
{
  unint64_t v3 = objc_msgSend_tuple(self, a2, v2);
  id v5 = objc_msgSend_objectAtIndexedSubscript_(v3, v4, 2);

  return (NSString *)v5;
}

- (CKAssetDownloadPreauthorization)downloadPreauthorization
{
  v4 = objc_msgSend_null(MEMORY[0x1E4F1CA98], a2, v2);
  uint64_t v7 = objc_msgSend_tuple(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, 3);
  char isEqual = objc_msgSend_isEqual_(v4, v10, (uint64_t)v9);

  if (isEqual)
  {
    v14 = 0;
  }
  else
  {
    v15 = objc_msgSend_tuple(self, v12, v13);
    v14 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, 3);
  }
  return (CKAssetDownloadPreauthorization *)v14;
}

- (void)addItem:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)items
{
  return &self->_items->super;
}

- (MMCSOperationMetric)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSData)authPutRequest
{
  return self->_authPutRequest;
}

- (void)setAuthPutRequest:(id)a3
{
}

- (NSData)cloneContext
{
  return self->_cloneContext;
}

- (void)setCloneContext:(id)a3
{
}

- (NSArray)tuple
{
  return self->_tuple;
}

- (void)setTuple:(id)a3
{
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_cloneContext, 0);
  objc_storeStrong((id *)&self->_authPutRequest, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end