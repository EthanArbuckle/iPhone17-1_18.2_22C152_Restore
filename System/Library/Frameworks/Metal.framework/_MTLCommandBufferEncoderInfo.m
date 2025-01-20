@interface _MTLCommandBufferEncoderInfo
- (NSArray)debugSignposts;
- (NSString)description;
- (NSString)label;
- (int64_t)errorState;
- (unint64_t)globalTraceObjectID;
- (unint64_t)uniqueID;
- (void)dealloc;
- (void)setDebugSignposts:(id)a3;
- (void)setErrorState:(int64_t)a3;
- (void)setGlobalTraceObjectID:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setUniqueID:(unint64_t)a3;
@end

@implementation _MTLCommandBufferEncoderInfo

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = [(_MTLCommandBufferEncoderInfo *)self errorState];
  if (v4 > 4) {
    v5 = @"Unknown";
  }
  else {
    v5 = (__CFString *)*((void *)&off_1E5222190 + v4);
  }
  return (NSString *)[v3 stringWithFormat:@"<errorState: %@, label: %@, debugSignposts: %@>", v5, -[_MTLCommandBufferEncoderInfo label](self, "label"), -[_MTLCommandBufferEncoderInfo debugSignposts](self, "debugSignposts")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandBufferEncoderInfo;
  [(_MTLCommandBufferEncoderInfo *)&v3 dealloc];
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(unint64_t)a3
{
  self->_uniqueID = a3;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setGlobalTraceObjectID:(unint64_t)a3
{
  self->_globalTraceObjectID = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSArray)debugSignposts
{
  return self->_debugSignposts;
}

- (void)setDebugSignposts:(id)a3
{
}

- (int64_t)errorState
{
  return self->_errorState;
}

- (void)setErrorState:(int64_t)a3
{
  self->_errorState = a3;
}

@end