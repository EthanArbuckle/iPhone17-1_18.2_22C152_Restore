@interface GTReplayShaderDebugVertex
+ (BOOL)supportsSecureCoding;
- (GTReplayShaderDebugVertex)initWithCoder:(id)a3;
- (NSArray)vertexIDs;
- (unsigned)amplificationID;
- (unsigned)instanceID;
- (void)encodeWithCoder:(id)a3;
- (void)setAmplificationID:(unsigned int)a3;
- (void)setInstanceID:(unsigned int)a3;
- (void)setVertexIDs:(id)a3;
@end

@implementation GTReplayShaderDebugVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugVertex)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayShaderDebugVertex;
  v5 = [(GTReplayShaderDebugRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"VertexIDs"];
    vertexIDs = v5->_vertexIDs;
    v5->_vertexIDs = (NSArray *)v6;

    v5->_instanceID = [v4 decodeInt32ForKey:@"InstanceID"];
    v5->_amplificationID = [v4 decodeInt32ForKey:@"AmplificationID"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugVertex;
  id v4 = a3;
  [(GTReplayShaderDebugRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_vertexIDs, @"VertexIDs", v5.receiver, v5.super_class);
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

- (NSArray)vertexIDs
{
  return self->_vertexIDs;
}

- (void)setVertexIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end