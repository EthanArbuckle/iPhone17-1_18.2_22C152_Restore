@interface AVTwoPartKeyPath
- (AVTwoPartKeyPath)initWithTopLevelPropertyKey:(id)a3 secondLevelPropertyKey:(id)a4;
- (NSString)keyPathString;
- (NSString)secondLevelPropertyKey;
- (NSString)topLevelPropertyKey;
- (void)dealloc;
@end

@implementation AVTwoPartKeyPath

- (AVTwoPartKeyPath)initWithTopLevelPropertyKey:(id)a3 secondLevelPropertyKey:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVTwoPartKeyPath;
  v6 = [(AVTwoPartKeyPath *)&v8 init];
  if (v6)
  {
    v6->_topLevelKey = (NSString *)[a3 copy];
    v6->_secondLevelKey = (NSString *)[a4 copy];
  }
  return v6;
}

- (NSString)topLevelPropertyKey
{
  return self->_topLevelKey;
}

- (NSString)secondLevelPropertyKey
{
  return self->_secondLevelKey;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVTwoPartKeyPath;
  [(AVTwoPartKeyPath *)&v3 dealloc];
}

- (NSString)keyPathString
{
  return (NSString *)[NSString stringWithFormat:@"%@.%@", self->_topLevelKey, self->_secondLevelKey];
}

@end