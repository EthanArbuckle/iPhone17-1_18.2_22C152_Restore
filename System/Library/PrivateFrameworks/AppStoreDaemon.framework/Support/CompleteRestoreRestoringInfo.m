@interface CompleteRestoreRestoringInfo
@end

@implementation CompleteRestoreRestoringInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needBootstrap, 0);
  objc_storeStrong((id *)&self->_coordinators, 0);
}

@end