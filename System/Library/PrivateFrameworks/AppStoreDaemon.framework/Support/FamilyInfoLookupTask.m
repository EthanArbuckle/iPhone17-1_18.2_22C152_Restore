@interface FamilyInfoLookupTask
@end

@implementation FamilyInfoLookupTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end