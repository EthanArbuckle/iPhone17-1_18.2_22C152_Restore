@interface NSObject
@end

@implementation NSObject

__CFString *__68__NSObject_MusicKit_SoftLinking_MPIdentifierSet__musicKit_formerIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t quot = [a2 longLongValue];
  uint64_t v3 = quot;
  v4 = (UInt8 *)&v9;
  do
  {
    lldiv_t v5 = lldiv(quot, 10);
    uint64_t quot = v5.quot;
    if (v5.rem >= 0) {
      LOBYTE(v6) = v5.rem;
    }
    else {
      uint64_t v6 = -v5.rem;
    }
    *v4-- = v6 + 48;
  }
  while (v5.quot);
  if (v3 < 0) {
    UInt8 *v4 = 45;
  }
  else {
    ++v4;
  }
  v7 = (__CFString *)CFStringCreateWithBytes(0, v4, (char *)&v10 - (char *)v4, 0x8000100u, 0);

  return v7;
}

void __91__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestImageDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v8 = (void (*)(id))getUIImagePNGRepresentationSymbolLoc_ptr;
    v16 = getUIImagePNGRepresentationSymbolLoc_ptr;
    if (!getUIImagePNGRepresentationSymbolLoc_ptr)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getUIImagePNGRepresentationSymbolLoc_block_invoke;
      v12[3] = &unk_26443F950;
      v12[4] = &v13;
      __getUIImagePNGRepresentationSymbolLoc_block_invoke((uint64_t)v12);
      v8 = (void (*)(id))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v8)
    {
      v11 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(v11);
    }
    char v9 = v8(v7);

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1017 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __102__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestColorAnalysisWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end