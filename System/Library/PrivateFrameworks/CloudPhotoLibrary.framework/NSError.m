@interface NSError
@end

@implementation NSError

void __57__NSError_CPLAdditions___cplSafeUserInfoForXPCDidChange___block_invoke()
{
  v6[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F285A0];
  v6[0] = *MEMORY[0x1E4F28588];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F288B8];
  v6[2] = *MEMORY[0x1E4F28590];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F28908];
  v6[4] = *MEMORY[0x1E4F28458];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F28328];
  v6[6] = *MEMORY[0x1E4F289D0];
  v6[7] = v3;
  v6[8] = @"CPLErrorLearnMoreLink";
  v6[9] = @"CPLErrorServerGeneratedLocalizedDescription";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:10];
  v5 = (void *)_cplSafeUserInfoForXPCDidChange__safeKeys;
  _cplSafeUserInfoForXPCDidChange__safeKeys = v4;
}

void __50__NSError_CPLAdditions__cplShortDomainDescription__block_invoke()
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F281F8];
  v3[1] = @"CloudPhotoLibraryErrorDomain";
  v4[0] = @"cocoa";
  v4[1] = @"cpl";
  uint64_t v0 = *MEMORY[0x1E4F28798];
  v3[2] = *MEMORY[0x1E4F28760];
  v3[3] = v0;
  v4[2] = @"os";
  v4[3] = @"posix";
  v3[4] = *MEMORY[0x1E4F285A8];
  v3[5] = @"CKErrorDomain";
  v4[4] = @"mach";
  v4[5] = @"cloudkit";
  v3[6] = @"CKInternalErrorDomain";
  v3[7] = @"CKUnderlyingErrorDomain";
  v4[6] = @"cloudkit-internal";
  v4[7] = @"cloudkit-internal";
  v3[8] = @"SqliteErrorDomain";
  v4[8] = @"sqlite";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:9];
  uint64_t v2 = (void *)cplShortDomainDescription_wellKnownDomainToShortDomain;
  cplShortDomainDescription_wellKnownDomainToShortDomain = v1;
}

@end