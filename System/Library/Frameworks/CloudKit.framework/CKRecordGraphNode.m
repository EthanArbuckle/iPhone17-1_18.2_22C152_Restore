@interface CKRecordGraphNode
- (BOOL)isEqual:(id)a3;
- (CKRecord)record;
- (CKRecordGraphNode)init;
- (NSMutableSet)edges;
- (NSMutableSet)indegrees;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
- (unint64_t)indegree;
- (void)setEdges:(id)a3;
- (void)setRecord:(id)a3;
@end

@implementation CKRecordGraphNode

- (CKRecordGraphNode)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKRecordGraphNode;
  v2 = [(CKRecordGraphNode *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    edges = v2->_edges;
    v2->_edges = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    indegrees = v2->_indegrees;
    v2->_indegrees = (NSMutableSet *)v5;

    record = v2->_record;
    v2->_record = 0;
  }
  return v2;
}

- (unint64_t)indegree
{
  v4 = objc_msgSend_indegrees(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_record(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_recordID(v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_hash(v8, v9, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKRecordGraphNode *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      objc_super v9 = objc_msgSend_record(self, v6, v7, v8);
      v13 = objc_msgSend_recordID(v9, v10, v11, v12);
      v17 = objc_msgSend_record(v5, v14, v15, v16);

      v21 = objc_msgSend_recordID(v17, v18, v19, v20);
      char isEqual = objc_msgSend_isEqual_(v13, v22, (uint64_t)v21, v23);
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (id)CKPropertiesDescription
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_indegree(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_edges(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);
  v18 = objc_msgSend_record(self, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"indegree=%d, edges=%d, record=%@", v20, v6, v14, v18);

  return v21;
}

- (id)description
{
  return (id)((uint64_t (*)(CKRecordGraphNode *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSMutableSet)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
}

- (NSMutableSet)indegrees
{
  return self->_indegrees;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_indegrees, 0);

  objc_storeStrong((id *)&self->_edges, 0);
}

@end