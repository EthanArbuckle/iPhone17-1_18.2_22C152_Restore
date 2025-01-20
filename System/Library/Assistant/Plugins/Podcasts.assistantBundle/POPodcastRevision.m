@interface POPodcastRevision
- (BOOL)isPodcastCollection;
- (NSString)objectID;
- (id)deletedModelObject;
- (id)description;
- (int64_t)revisionType;
- (unint64_t)revisionID;
- (void)setIsPodcastCollection:(BOOL)a3;
- (void)setObjectID:(id)a3;
- (void)setRevisionID:(unint64_t)a3;
- (void)setRevisionType:(int64_t)a3;
@end

@implementation POPodcastRevision

- (id)deletedModelObject
{
  if (objc_msgSend_isPodcastCollection(self, a2, v2, v3, v4)) {
    v6 = @"POPodcastCollection";
  }
  else {
    v6 = @"POPodcastStation";
  }
  id v7 = objc_alloc_init(NSClassFromString(&v6->isa));
  v12 = objc_msgSend_objectID(self, v8, v9, v10, v11);
  objc_msgSend_setUuid_(v7, v13, (uint64_t)v12, v14, v15);

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v10 = objc_msgSend_revisionID(self, v6, v7, v8, v9);
  unint64_t v15 = objc_msgSend_revisionType(self, v11, v12, v13, v14);
  if (v15 > 2) {
    v20 = @"unknown";
  }
  else {
    v20 = off_26467BAE0[v15];
  }
  v21 = objc_msgSend_objectID(self, v16, v17, v18, v19);
  v25 = objc_msgSend_stringWithFormat_(v3, v22, @"%@ (%p) revisionID: %lu, type: %@, uuid, %@", v23, v24, v5, self, v10, v20, v21);

  return v25;
}

- (unint64_t)revisionID
{
  return self->_revisionID;
}

- (void)setRevisionID:(unint64_t)a3
{
  self->_revisionID = a3;
}

- (int64_t)revisionType
{
  return self->_revisionType;
}

- (void)setRevisionType:(int64_t)a3
{
  self->_revisionType = a3;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (BOOL)isPodcastCollection
{
  return self->_isPodcastCollection;
}

- (void)setIsPodcastCollection:(BOOL)a3
{
  self->_isPodcastCollection = a3;
}

- (void).cxx_destruct
{
}

@end