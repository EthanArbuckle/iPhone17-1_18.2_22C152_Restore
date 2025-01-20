@interface MPModelArtist
@end

@implementation MPModelArtist

void __67__MPModelArtist_ICRadioContentReference__mpc_radioContentReference__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) name];
  if ([v2 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setArtistName:v2];
  }
}

@end