@interface HMDFakeUserManagementOperationForDecodingArchive
+ (BOOL)supportsSecureCoding;
@end

@implementation HMDFakeUserManagementOperationForDecodingArchive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end