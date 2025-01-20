@interface ASCLockupKeyGetAllCases
@end

@implementation ASCLockupKeyGetAllCases

uint64_t ___ASCLockupKeyGetAllCases_block_invoke()
{
  _ASCLockupKeyGetAllCases_allCases = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"id", @"icon", @"title", @"subtitle", @"shortName", @"developerName", @"eula", @"privacyPolicyUrl", @"genreName", @"genreID", @"subgenres", @"bundleID", @"developerId", @"webDistributionDomains", @"supportUrl", @"contentRatingsBySystem", @"distributorBundleId",
                                        @"appVersionId",
                                        @"isDistributor",
                                        0);

  return MEMORY[0x1F41817F8]();
}

@end