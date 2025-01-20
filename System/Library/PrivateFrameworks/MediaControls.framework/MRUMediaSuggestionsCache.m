@interface MRUMediaSuggestionsCache
+ (MRUMediaSuggestionsCache)sharedCache;
- (MRUMediaSuggestionsCache)init;
- (NSCache)imageCache;
- (id)artworkForMediaSuggestion:(id)a3;
- (void)setImageCache:(id)a3;
@end

@implementation MRUMediaSuggestionsCache

+ (MRUMediaSuggestionsCache)sharedCache
{
  if (sharedCache___once != -1) {
    dispatch_once(&sharedCache___once, &__block_literal_global_23);
  }
  v2 = (void *)sharedCache___sharedCache;

  return (MRUMediaSuggestionsCache *)v2;
}

void __39__MRUMediaSuggestionsCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(MRUMediaSuggestionsCache);
  v1 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = (uint64_t)v0;
}

- (MRUMediaSuggestionsCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUMediaSuggestionsCache;
  v2 = [(MRUMediaSuggestionsCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;
  }
  return v2;
}

- (id)artworkForMediaSuggestion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  imageCache = v5->_imageCache;
  v7 = [v4 identifier];
  v8 = [(NSCache *)imageCache objectForKey:v7];

  if (!v8)
  {
    v10 = [v4 artwork];
    v11 = [v10 imageData];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4FB1818]);
      v13 = [v4 artwork];
      v14 = [v13 imageData];
      v8 = (void *)[v12 initWithData:v14];

      if (v8)
      {
        v15 = v5->_imageCache;
        v16 = [v4 identifier];
        [(NSCache *)v15 setObject:v8 forKey:v16];
      }
    }
    else
    {
      v8 = 0;
    }
  }
  objc_sync_exit(v5);

  return v8;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end