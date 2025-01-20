@interface IMDWhitetailToCoralDowngrader
- (id)createDowngradeHelper;
@end

@implementation IMDWhitetailToCoralDowngrader

- (id)createDowngradeHelper
{
  v3 = [IMDWhitetailToCoralDowngradeHelper alloc];
  [(IMAbstractDatabaseArchiver *)self destinationPath];
  return (id)MEMORY[0x1F4181798](v3, sel_initWithPath_);
}

@end