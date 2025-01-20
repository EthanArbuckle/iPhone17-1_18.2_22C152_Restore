@interface SEPUtils
+ (id)dataFromACL:(__SecAccessControl *)a3;
@end

@implementation SEPUtils

+ (id)dataFromACL:(__SecAccessControl *)a3
{
  v3 = (void *)SecAccessControlCopyData();
  return v3;
}

@end