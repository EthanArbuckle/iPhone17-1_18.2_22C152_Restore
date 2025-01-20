@interface GEOPlacePhotoLookupTicket
@end

@implementation GEOPlacePhotoLookupTicket

void __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v5 = [a2 resultsWithResultType:1];
    v6 = [v5 firstObject];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke_2;
    v8[3] = &unk_1E53DEA90;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    +[GEOPlacePhotoLookupResult buildVendorLookupResultForPlaceWithCaptionedPhotos:mapItemIdentifier:originalRange:completion:](GEOPlacePhotoLookupResult, "buildVendorLookupResultForPlaceWithCaptionedPhotos:mapItemIdentifier:originalRange:completion:", v6, v7, *(void *)(a1 + 48), *(void *)(a1 + 56), v8);
  }
}

uint64_t __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end