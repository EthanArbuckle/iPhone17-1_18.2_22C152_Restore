@interface MPCQCBMSPSongIdentifierSetForVendorID
@end

@implementation MPCQCBMSPSongIdentifierSetForVendorID

uint64_t ___MPCQCBMSPSongIdentifierSetForVendorID_block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVendorID:*(void *)(a1 + 32)];
}

@end