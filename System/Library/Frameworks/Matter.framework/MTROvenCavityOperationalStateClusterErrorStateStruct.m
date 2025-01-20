@interface MTROvenCavityOperationalStateClusterErrorStateStruct
- (MTROvenCavityOperationalStateClusterErrorStateStruct)init;
- (NSNumber)errorStateID;
- (NSString)errorStateDetails;
- (NSString)errorStateLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setErrorStateDetails:(id)a3;
- (void)setErrorStateID:(id)a3;
- (void)setErrorStateLabel:(id)a3;
@end

@implementation MTROvenCavityOperationalStateClusterErrorStateStruct

- (MTROvenCavityOperationalStateClusterErrorStateStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTROvenCavityOperationalStateClusterErrorStateStruct;
  v2 = [(MTROvenCavityOperationalStateClusterErrorStateStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    errorStateID = v2->_errorStateID;
    v2->_errorStateID = (NSNumber *)&unk_26F9C8620;

    errorStateLabel = v3->_errorStateLabel;
    v3->_errorStateLabel = 0;

    errorStateDetails = v3->_errorStateDetails;
    v3->_errorStateDetails = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROvenCavityOperationalStateClusterErrorStateStruct);
  v7 = objc_msgSend_errorStateID(self, v5, v6);
  objc_msgSend_setErrorStateID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_errorStateLabel(self, v9, v10);
  objc_msgSend_setErrorStateLabel_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_errorStateDetails(self, v13, v14);
  objc_msgSend_setErrorStateDetails_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: errorStateID:%@; errorStateLabel:%@; errorStateDetails:%@; >",
    v5,
    self->_errorStateID,
    self->_errorStateLabel,
  v7 = self->_errorStateDetails);

  return v7;
}

- (NSNumber)errorStateID
{
  return self->_errorStateID;
}

- (void)setErrorStateID:(id)a3
{
}

- (NSString)errorStateLabel
{
  return self->_errorStateLabel;
}

- (void)setErrorStateLabel:(id)a3
{
}

- (NSString)errorStateDetails
{
  return self->_errorStateDetails;
}

- (void)setErrorStateDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorStateDetails, 0);
  objc_storeStrong((id *)&self->_errorStateLabel, 0);

  objc_storeStrong((id *)&self->_errorStateID, 0);
}

@end