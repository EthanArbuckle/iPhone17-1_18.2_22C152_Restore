@interface HMCPartition
- (BOOL)modelBelongsToThisPartition:(id)a3;
- (HMCPartition)init;
- (HMCRedirector)redirections;
@end

@implementation HMCPartition

- (void).cxx_destruct
{
}

- (HMCRedirector)redirections
{
  return (HMCRedirector *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)modelBelongsToThisPartition:(id)a3
{
  return 1;
}

- (HMCPartition)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMCPartition;
  v2 = [(HMCPartition *)&v6 init];
  if (v2)
  {
    v3 = [[HMCRedirector alloc] initWithLabel:@"REDIR" partition:v2];
    redirections = v2->_redirections;
    v2->_redirections = v3;
  }
  return v2;
}

@end