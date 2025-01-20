@interface NSURL
@end

@implementation NSURL

uint64_t __41__NSURL_GKAdditions___gkIsValidServerURL__block_invoke()
{
  _gkIsValidServerURL_sValidSchemes = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"http", @"https", 0);

  return MEMORY[0x1F41817F8]();
}

@end