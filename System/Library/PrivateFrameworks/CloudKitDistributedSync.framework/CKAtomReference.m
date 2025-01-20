@interface CKAtomReference
- (BOOL)isEqual:(id)a3;
- (CKAtomReference)initWithMergeableValueID:(id)a3;
- (CKAtomReference)initWithMergeableValueID:(id)a3 timestamp:(id)a4;
- (CKAtomReference)initWithMergeableValueID:(id)a3 timestamp:(id)a4 type:(unsigned __int8)a5;
- (CKDistributedTimestamp)timestamp;
- (CKMergeableValueID)mergeableValueID;
- (unint64_t)hash;
- (unsigned)type;
@end

@implementation CKAtomReference

- (CKAtomReference)initWithMergeableValueID:(id)a3
{
  return (CKAtomReference *)MEMORY[0x1F4181798](self, sel_initWithMergeableValueID_timestamp_, a3);
}

- (CKAtomReference)initWithMergeableValueID:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKAtomReference;
  v10 = [(CKAtomReference *)&v18 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    mergeableValueID = v10->_mergeableValueID;
    v10->_mergeableValueID = (CKMergeableValueID *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    timestamp = v10->_timestamp;
    v10->_timestamp = (CKDistributedTimestamp *)v15;

    v10->_type = 1;
  }

  return v10;
}

- (CKAtomReference)initWithMergeableValueID:(id)a3 timestamp:(id)a4 type:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKAtomReference;
  v12 = [(CKAtomReference *)&v20 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
    mergeableValueID = v12->_mergeableValueID;
    v12->_mergeableValueID = (CKMergeableValueID *)v13;

    uint64_t v17 = objc_msgSend_copy(v9, v15, v16);
    timestamp = v12->_timestamp;
    v12->_timestamp = (CKDistributedTimestamp *)v17;

    v12->_type = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CKAtomReference *)a3;
  if (v5 == self)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      int v9 = objc_msgSend_type(self, v7, v8);
      if (v9 != objc_msgSend_type(v6, v10, v11))
      {
        char isEqual = 0;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v14 = objc_msgSend_mergeableValueID(self, v12, v13);
      v19 = objc_msgSend_mergeableValueID(v6, v15, v16);
      if (v14 != v19)
      {
        objc_super v20 = objc_msgSend_mergeableValueID(self, v17, v18);
        v3 = objc_msgSend_mergeableValueID(v6, v21, v22);
        if (!objc_msgSend_isEqual_(v20, v23, (uint64_t)v3))
        {
          char isEqual = 0;
LABEL_15:

LABEL_16:
          goto LABEL_17;
        }
        v38 = v20;
      }
      v25 = objc_msgSend_timestamp(self, v17, v18);
      uint64_t v28 = objc_msgSend_timestamp(v6, v26, v27);
      if (v25 == (void *)v28)
      {

        char isEqual = 1;
      }
      else
      {
        v31 = (void *)v28;
        v32 = objc_msgSend_timestamp(self, v29, v30);
        v35 = objc_msgSend_timestamp(v6, v33, v34);
        char isEqual = objc_msgSend_isEqual_(v32, v36, (uint64_t)v35);
      }
      objc_super v20 = v38;
      if (v14 == v19) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    char isEqual = 0;
  }
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_type(self, a2, v2);
  id v7 = objc_msgSend_mergeableValueID(self, v5, v6);
  uint64_t v10 = objc_msgSend_hash(v7, v8, v9);
  uint64_t v13 = objc_msgSend_timestamp(self, v11, v12);
  unint64_t v16 = v10 ^ objc_msgSend_hash(v13, v14, v15) ^ v4;

  return v16;
}

- (unsigned)type
{
  return self->_type;
}

- (CKMergeableValueID)mergeableValueID
{
  return self->_mergeableValueID;
}

- (CKDistributedTimestamp)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
}

@end