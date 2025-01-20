@interface ASTSessionInfo
- (ASTSessionInfo)initWithQueuedSuiteType:(int64_t)a3 isGuided:(BOOL)a4;
- (BOOL)isGuided;
- (id)_descriptionForQueuedSuiteType:(int64_t)a3;
- (id)description;
- (int64_t)queuedSuiteType;
@end

@implementation ASTSessionInfo

- (ASTSessionInfo)initWithQueuedSuiteType:(int64_t)a3 isGuided:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ASTSessionInfo;
  result = [(ASTSessionInfo *)&v7 init];
  if (result)
  {
    result->_queuedSuiteType = a3;
    result->_isGuided = a4;
  }
  return result;
}

- (id)description
{
  v3 = [(ASTSessionInfo *)self _descriptionForQueuedSuiteType:[(ASTSessionInfo *)self queuedSuiteType]];
  v4 = [NSString stringWithFormat:@"[ASTSessionInfo queuedSuiteType: %@, isGuided: %d]", v3, -[ASTSessionInfo isGuided](self, "isGuided")];

  return v4;
}

- (id)_descriptionForQueuedSuiteType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"unknown";
  }
  else {
    return off_264E7DC88[a3];
  }
}

- (int64_t)queuedSuiteType
{
  return self->_queuedSuiteType;
}

- (BOOL)isGuided
{
  return self->_isGuided;
}

@end