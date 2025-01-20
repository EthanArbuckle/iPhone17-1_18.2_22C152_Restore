@interface LACTCCHelper
+ (int64_t)approvalStateOfFaceIDSeviceForAuditToken:(id *)a3;
@end

@implementation LACTCCHelper

+ (int64_t)approvalStateOfFaceIDSeviceForAuditToken:(id *)a3
{
  int64_t result = TCCAccessPreflightWithAuditToken();
  if (result)
  {
    if (result == 1)
    {
      v4 = &LACEnvironmentMechanismApprovalStateDenied;
    }
    else
    {
      if (result != 2) {
        return result;
      }
      v4 = &LACEnvironmentMechanismApprovalStateUnknown;
    }
  }
  else
  {
    v4 = &LACEnvironmentMechanismApprovalStateGranted;
  }
  return *v4;
}

@end