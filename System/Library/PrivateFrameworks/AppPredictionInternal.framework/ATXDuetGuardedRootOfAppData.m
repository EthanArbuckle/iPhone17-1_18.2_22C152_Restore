@interface ATXDuetGuardedRootOfAppData
@end

@implementation ATXDuetGuardedRootOfAppData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootOfAppDataUpdateTime, 0);
  objc_storeStrong((id *)&self->_rootOfAppData, 0);
}

@end