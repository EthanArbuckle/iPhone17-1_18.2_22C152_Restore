@interface MTRMessagesClusterMessageResponseOptionStruct
- (MTRMessagesClusterMessageResponseOptionStruct)init;
- (NSNumber)messageResponseID;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLabel:(id)a3;
- (void)setMessageResponseID:(id)a3;
@end

@implementation MTRMessagesClusterMessageResponseOptionStruct

- (MTRMessagesClusterMessageResponseOptionStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRMessagesClusterMessageResponseOptionStruct;
  v2 = [(MTRMessagesClusterMessageResponseOptionStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    messageResponseID = v2->_messageResponseID;
    v2->_messageResponseID = 0;

    label = v3->_label;
    v3->_label = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMessagesClusterMessageResponseOptionStruct);
  objc_super v7 = objc_msgSend_messageResponseID(self, v5, v6);
  objc_msgSend_setMessageResponseID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_label(self, v9, v10);
  objc_msgSend_setLabel_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: messageResponseID:%@; label:%@; >",
    v5,
    self->_messageResponseID,
  objc_super v7 = self->_label);

  return v7;
}

- (NSNumber)messageResponseID
{
  return self->_messageResponseID;
}

- (void)setMessageResponseID:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_messageResponseID, 0);
}

@end