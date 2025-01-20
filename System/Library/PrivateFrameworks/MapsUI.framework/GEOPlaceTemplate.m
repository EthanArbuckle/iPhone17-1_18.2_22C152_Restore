@interface GEOPlaceTemplate
@end

@implementation GEOPlaceTemplate

void __77__GEOPlaceTemplate_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!a2 || a5)
  {
    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v10();
  }
  else
  {
    double v8 = *(double *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__GEOPlaceTemplate_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke_2;
    v11[3] = &unk_1E5750288;
    id v9 = *(id *)(a1 + 32);
    id v12 = 0;
    id v13 = v9;
    char v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", a2, v11, *(double *)(a1 + 40), *(double *)(a1 + 48), v8);
  }
}

uint64_t __77__GEOPlaceTemplate_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

@end