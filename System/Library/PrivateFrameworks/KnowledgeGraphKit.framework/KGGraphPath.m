@interface KGGraphPath
- (KGGraphPath)initWithSourceNodeIdentifier:(unint64_t)a3 targetNodeIdentifier:(unint64_t)a4 numberOfPaths:(unint64_t)a5;
- (id)description;
- (unint64_t)numberOfPaths;
- (unint64_t)sourceNodeIdentifier;
- (unint64_t)targetNodeIdentifier;
@end

@implementation KGGraphPath

- (unint64_t)numberOfPaths
{
  return self->_numberOfPaths;
}

- (unint64_t)targetNodeIdentifier
{
  return self->_targetNodeIdentifier;
}

- (unint64_t)sourceNodeIdentifier
{
  return self->_sourceNodeIdentifier;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"from:%llu to:%llu count:%llu", self->_sourceNodeIdentifier, self->_targetNodeIdentifier, self->_numberOfPaths);
}

- (KGGraphPath)initWithSourceNodeIdentifier:(unint64_t)a3 targetNodeIdentifier:(unint64_t)a4 numberOfPaths:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)KGGraphPath;
  result = [(KGGraphPath *)&v9 init];
  if (result)
  {
    result->_sourceNodeIdentifier = a3;
    result->_targetNodeIdentifier = a4;
    result->_numberOfPaths = a5;
  }
  return result;
}

@end