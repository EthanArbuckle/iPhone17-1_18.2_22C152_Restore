@interface MTRCommandPath
+ (BOOL)supportsSecureCoding;
+ (MTRCommandPath)commandPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID;
+ (MTRCommandPath)commandPathWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId commandId:(NSNumber *)commandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommandPath:(id)a3;
- (MTRCommandPath)initWithCoder:(id)a3;
- (MTRCommandPath)initWithPath:(const ConcreteCommandPath *)a3;
- (NSNumber)command;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTRCommandPath

- (MTRCommandPath)initWithPath:(const ConcreteCommandPath *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTRCommandPath;
  v5 = -[MTRClusterPath initWithPath:](&v9, sel_initWithPath_);
  if (v5)
  {
    uint64_t v6 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v4, a3->var3);
    command = v5->_command;
    v5->_command = (NSNumber *)v6;
  }
  return v5;
}

- (id)description
{
  v4 = NSString;
  v5 = objc_msgSend_endpoint(self, a2, v2);
  uint64_t v8 = objc_msgSend_unsignedShortValue(v5, v6, v7);
  v11 = objc_msgSend_cluster(self, v9, v10);
  uint64_t v14 = objc_msgSend_unsignedLongLongValue(v11, v12, v13);
  v17 = objc_msgSend_cluster(self, v15, v16);
  uint64_t v20 = objc_msgSend_unsignedLongLongValue(v17, v18, v19);
  uint64_t v23 = objc_msgSend_unsignedLongLongValue(self->_command, v21, v22);
  uint64_t v26 = objc_msgSend_unsignedLongLongValue(self->_command, v24, v25);
  v28 = objc_msgSend_stringWithFormat_(v4, v27, @"<MTRCommandPath endpoint %u cluster 0x%llx (%llu) command 0x%llx (%llu)>", v8, v14, v20, v23, v26);

  return v28;
}

+ (MTRCommandPath)commandPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID
{
  uint64_t v7 = endpointID;
  uint64_t v8 = clusterID;
  objc_super v9 = commandID;
  __int16 v20 = objc_msgSend_unsignedShortValue(v7, v10, v11);
  int v21 = objc_msgSend_unsignedLongValue(v8, v12, v13);
  int v22 = objc_msgSend_unsignedLongValue(v9, v14, v15);
  uint64_t v16 = [MTRCommandPath alloc];
  v18 = objc_msgSend_initWithPath_(v16, v17, (uint64_t)&v20);

  return (MTRCommandPath *)v18;
}

- (BOOL)isEqualToCommandPath:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToClusterPath_(self, v5, (uint64_t)v4))
  {
    command = self->_command;
    objc_super v9 = objc_msgSend_command(v4, v6, v7);
    char v10 = sub_2446BE670(command, v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char isEqualToCommandPath = objc_msgSend_isEqualToCommandPath_(self, v6, (uint64_t)v4);
  }
  else {
    char isEqualToCommandPath = 0;
  }

  return isEqualToCommandPath;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_endpoint(self, a2, v2);
  unsigned int v7 = objc_msgSend_unsignedShortValue(v4, v5, v6);
  char v10 = objc_msgSend_cluster(self, v8, v9);
  uint64_t v13 = objc_msgSend_unsignedLongValue(v10, v11, v12);
  unint64_t v16 = v13 ^ v7 ^ objc_msgSend_unsignedLongValue(self->_command, v14, v15);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend_endpoint(self, a2, (uint64_t)a3);
  unsigned int v7 = objc_msgSend_cluster(self, v5, v6);
  uint64_t v9 = objc_msgSend_commandPathWithEndpointID_clusterID_commandID_(MTRCommandPath, v8, (uint64_t)v4, v7, self->_command);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRCommandPath)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTRCommandPath;
  uint64_t v5 = [(MTRClusterPath *)&v14 initWithCoder:v4];
  if (!v5)
  {
LABEL_9:
    char v10 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"commandKey");
  command = v5->_command;
  v5->_command = (NSNumber *)v8;

  if (v5->_command)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v5->_command;
        *(_DWORD *)buf = 138412290;
        unint64_t v16 = v12;
        _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "MTRCommandPath decoded %@ for command, not NSNumber.", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      goto LABEL_9;
    }
  }
  char v10 = v5;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTRCommandPath;
  [(MTRClusterPath *)&v6 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_command, @"commandKey");
}

- (NSNumber)command
{
  return self->_command;
}

- (void).cxx_destruct
{
}

+ (MTRCommandPath)commandPathWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId commandId:(NSNumber *)commandId
{
  uint64_t v5 = objc_msgSend_commandPathWithEndpointID_clusterID_commandID_(a1, a2, (uint64_t)endpointId, clusterId, commandId);

  return (MTRCommandPath *)v5;
}

@end