@interface MPStoreLyricsRequest
+ (BOOL)supportsLyricsForURLBag:(id)a3;
+ (BOOL)supportsLyricsForURLBagDictionary:(id)a3;
- (MPModelSong)song;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setSong:(id)a3;
@end

@implementation MPStoreLyricsRequest

+ (BOOL)supportsLyricsForURLBagDictionary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB8780];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initWithDictionary:v4];

  int v6 = _os_feature_enabled_impl();
  v7 = off_1E57EC850;
  if (!v6) {
    v7 = off_1E57EC858;
  }
  char v8 = [(__objc2_class *)*v7 supportsLyricsForURLBag:v5];

  return v8;
}

+ (BOOL)supportsLyricsForURLBag:(id)a3
{
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  v5 = off_1E57EC850;
  if (!v4) {
    v5 = off_1E57EC858;
  }
  char v6 = [(__objc2_class *)*v5 supportsLyricsForURLBag:v3];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setSong:(id)a3
{
}

- (MPModelSong)song
{
  return self->_song;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  _os_feature_enabled_impl();
  v5 = objc_opt_new();
  char v6 = [(MPStoreLyricsRequest *)self song];
  v7 = [v6 identifiers];
  char v8 = [v7 universalStore];
  uint64_t v9 = [v8 lyricsAdamID];
  if (v9)
  {
    [v5 setSongAdamID:v9];
  }
  else
  {
    v10 = [(MPStoreLyricsRequest *)self song];
    v11 = [v10 identifiers];
    v12 = [v11 universalStore];
    uint64_t v13 = [v12 subscriptionAdamID];
    if (v13)
    {
      [v5 setSongAdamID:v13];
    }
    else
    {
      v20 = [(MPStoreLyricsRequest *)self song];
      v19 = [v20 identifiers];
      v14 = [v19 universalStore];
      objc_msgSend(v5, "setSongAdamID:", objc_msgSend(v14, "adamID"));
    }
  }

  v15 = [(MPStoreLyricsRequest *)self song];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke;
  v21[3] = &unk_1E57EE690;
  id v22 = v15;
  id v23 = v4;
  id v16 = v15;
  id v17 = v4;
  [v5 setResponseHandler:v21];

  return v5;
}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v6 = *(void **)(a1 + 32);
    v7 = [v6 identifiers];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_2;
    v9[3] = &unk_1E57F2318;
    id v10 = v5;
    char v8 = (void *)[v6 copyWithIdentifiers:v7 block:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasLoadedValueForKey:@"MPModelRelationshipSongLyrics"])
  {
    id v4 = [v3 lyrics];
  }
  else
  {
    id v4 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_3;
  v18[3] = &unk_1E57FA3B8;
  id v19 = *(id *)(a1 + 32);
  id v5 = (void *)MEMORY[0x19971E0F0](v18);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_4;
  id v16 = &unk_1E57EE668;
  id v17 = *(id *)(a1 + 32);
  char v6 = (void *)MEMORY[0x19971E0F0](&v13);
  if (v4)
  {
    v7 = objc_msgSend(v4, "identifiers", v13, v14, v15, v16);
    char v8 = (MPIdentifierSet *)[v7 copyWithSource:@"StoreLyrics" block:v5];
    uint64_t v9 = [v4 copyWithIdentifiers:v8 block:v6];
  }
  else
  {
    id v10 = [MPModelLyrics alloc];
    v11 = [MPIdentifierSet alloc];
    v7 = +[MPModelLyricsKind identityKind];
    char v8 = [(MPIdentifierSet *)v11 initWithSource:@"StoreLyrics" modelKind:v7 block:v5];
    uint64_t v9 = [(MPModelObject *)v10 initWithIdentifiers:v8 block:v6];
  }
  v12 = (void *)v9;

  [v3 setLyrics:v12];
}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 lyricsID];
  [v3 setLyricsID:v4];
}

void __56__MPStoreLyricsRequest_newOperationWithResponseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 lyricsContent];
  [v3 setTTML:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 1, self->_song);
  }
  return v5;
}

@end