@interface MTRRVCOperationalStateClusterOperationalStateStruct
- (MTRRVCOperationalStateClusterOperationalStateStruct)init;
- (NSNumber)operationalStateID;
- (NSString)operationalStateLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOperationalStateID:(id)a3;
- (void)setOperationalStateLabel:(id)a3;
@end

@implementation MTRRVCOperationalStateClusterOperationalStateStruct

- (MTRRVCOperationalStateClusterOperationalStateStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRRVCOperationalStateClusterOperationalStateStruct;
  v2 = [(MTRRVCOperationalStateClusterOperationalStateStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    operationalStateID = v2->_operationalStateID;
    v2->_operationalStateID = (NSNumber *)&unk_26F9C8620;

    operationalStateLabel = v3->_operationalStateLabel;
    v3->_operationalStateLabel = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRRVCOperationalStateClusterOperationalStateStruct);
  objc_super v7 = objc_msgSend_operationalStateID(self, v5, v6);
  objc_msgSend_setOperationalStateID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_operationalStateLabel(self, v9, v10);
  objc_msgSend_setOperationalStateLabel_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: operationalStateID:%@; operationalStateLabel:%@; >",
    v5,
    self->_operationalStateID,
  objc_super v7 = self->_operationalStateLabel);

  return v7;
}

- (NSNumber)operationalStateID
{
  return self->_operationalStateID;
}

- (void)setOperationalStateID:(id)a3
{
}

- (NSString)operationalStateLabel
{
  return self->_operationalStateLabel;
}

- (void)setOperationalStateLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalStateLabel, 0);

  objc_storeStrong((id *)&self->_operationalStateID, 0);
}

@end