@interface GTReplayShaderDebugPostTessellationVertex
+ (BOOL)supportsSecureCoding;
- (GTReplayShaderDebugPostTessellationVertex)initWithCoder:(id)a3;
- (NSArray)patchIDs;
- (unsigned)amplificationID;
- (unsigned)instanceID;
- (void)encodeWithCoder:(id)a3;
- (void)setAmplificationID:(unsigned int)a3;
- (void)setInstanceID:(unsigned int)a3;
- (void)setPatchIDs:(id)a3;
@end

@implementation GTReplayShaderDebugPostTessellationVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugPostTessellationVertex)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayShaderDebugPostTessellationVertex;
  v5 = [(GTReplayShaderDebugRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PatchIDs"];
    patchIDs = v5->_patchIDs;
    v5->_patchIDs = (NSArray *)v6;

    v5->_instanceID = [v4 decodeInt32ForKey:@"InstanceID"];
    v5->_amplificationID = [v4 decodeInt32ForKey:@"AmplificationID"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugPostTessellationVertex;
  id v4 = a3;
  [(GTReplayShaderDebugRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_patchIDs, @"PatchIDs", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_instanceID forKey:@"InstanceID"];
  [v4 encodeInt32:self->_amplificationID forKey:@"AmplificationID"];
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(unsigned int)a3
{
  self->_instanceID = a3;
}

- (unsigned)amplificationID
{
  return self->_amplificationID;
}

- (void)setAmplificationID:(unsigned int)a3
{
  self->_amplificationID = a3;
}

- (NSArray)patchIDs
{
  return self->_patchIDs;
}

- (void)setPatchIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end