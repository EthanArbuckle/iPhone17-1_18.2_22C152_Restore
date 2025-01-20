@interface MTRActionsClusterActionStruct
- (MTRActionsClusterActionStruct)init;
- (NSNumber)actionID;
- (NSNumber)endpointListID;
- (NSNumber)state;
- (NSNumber)supportedCommands;
- (NSNumber)type;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActionID:(NSNumber *)actionID;
- (void)setEndpointListID:(NSNumber *)endpointListID;
- (void)setName:(NSString *)name;
- (void)setState:(NSNumber *)state;
- (void)setSupportedCommands:(NSNumber *)supportedCommands;
- (void)setType:(NSNumber *)type;
@end

@implementation MTRActionsClusterActionStruct

- (MTRActionsClusterActionStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRActionsClusterActionStruct;
  v2 = [(MTRActionsClusterActionStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    actionID = v2->_actionID;
    v2->_actionID = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = (NSString *)&stru_26F969DC8;

    type = v3->_type;
    v3->_type = (NSNumber *)&unk_26F9C8620;

    endpointListID = v3->_endpointListID;
    v3->_endpointListID = (NSNumber *)&unk_26F9C8620;

    supportedCommands = v3->_supportedCommands;
    v3->_supportedCommands = (NSNumber *)&unk_26F9C8620;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRActionsClusterActionStruct);
  v7 = objc_msgSend_actionID(self, v5, v6);
  objc_msgSend_setActionID_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_type(self, v13, v14);
  objc_msgSend_setType_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_endpointListID(self, v17, v18);
  objc_msgSend_setEndpointListID_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_supportedCommands(self, v21, v22);
  objc_msgSend_setSupportedCommands_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_state(self, v25, v26);
  objc_msgSend_setState_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: actionID:%@; name:%@; type:%@; endpointListID:%@; supportedCommands:%@; state:%@; >",
    v5,
    self->_actionID,
    self->_name,
    self->_type,
    self->_endpointListID,
    self->_supportedCommands,
  v7 = self->_state);

  return v7;
}

- (NSNumber)actionID
{
  return self->_actionID;
}

- (void)setActionID:(NSNumber *)actionID
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
}

- (NSNumber)endpointListID
{
  return self->_endpointListID;
}

- (void)setEndpointListID:(NSNumber *)endpointListID
{
}

- (NSNumber)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(NSNumber *)supportedCommands
{
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(NSNumber *)state
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_endpointListID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_actionID, 0);
}

@end