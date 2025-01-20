@interface CAFCarManagerConfiguration
- (BOOL)sparseTree;
- (CAFASCTree)registrations;
- (CAFCarManagerConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setRegistrations:(id)a3;
- (void)setSparseTree:(BOOL)a3;
@end

@implementation CAFCarManagerConfiguration

- (CAFCarManagerConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)CAFCarManagerConfiguration;
  v2 = [(CAFCarManagerConfiguration *)&v4 init];
  if (v2) {
    v2->_sparseTree = CAFDefaultsGetBoolean(@"sparseTree", 1);
  }
  return v2;
}

- (id)description
{
  v2 = NSString;
  BOOL v3 = [(CAFCarManagerConfiguration *)self sparseTree];
  objc_super v4 = @"NO";
  if (v3) {
    objc_super v4 = @"YES";
  }
  return (id)[v2 stringWithFormat:@"sparseTree=%@", v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[CAFCarManagerConfiguration allocWithZone:a3] init];
  v5 = [(CAFCarManagerConfiguration *)self registrations];
  [(CAFCarManagerConfiguration *)v4 setRegistrations:v5];

  [(CAFCarManagerConfiguration *)v4 setSparseTree:[(CAFCarManagerConfiguration *)self sparseTree]];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [(CAFCarManagerConfiguration *)+[CAFCarManagerMutableConfiguration allocWithZone:a3] init];
  v5 = [(CAFCarManagerConfiguration *)self registrations];
  [(CAFCarManagerConfiguration *)v4 setRegistrations:v5];

  [(CAFCarManagerConfiguration *)v4 setSparseTree:[(CAFCarManagerConfiguration *)self sparseTree]];
  return v4;
}

- (CAFASCTree)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (BOOL)sparseTree
{
  return self->_sparseTree;
}

- (void)setSparseTree:(BOOL)a3
{
  self->_sparseTree = a3;
}

- (void).cxx_destruct
{
}

@end