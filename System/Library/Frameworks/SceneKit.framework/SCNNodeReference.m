@interface SCNNodeReference
- (NSString)referenceNodeName;
- (NSString)referenceSceneName;
- (void)dealloc;
- (void)setReferenceNodeName:(id)a3;
- (void)setReferenceSceneName:(id)a3;
@end

@implementation SCNNodeReference

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNNodeReference;
  [(SCNReferenceNode *)&v3 dealloc];
}

- (NSString)referenceSceneName
{
  return self->referenceSceneName;
}

- (void)setReferenceSceneName:(id)a3
{
}

- (NSString)referenceNodeName
{
  return self->referenceNodeName;
}

- (void)setReferenceNodeName:(id)a3
{
}

@end