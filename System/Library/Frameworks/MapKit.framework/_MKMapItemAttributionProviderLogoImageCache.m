@interface _MKMapItemAttributionProviderLogoImageCache
+ (id)sharedInstance;
- (_MKMapItemAttributionProviderLogoImageCache)init;
- (id)imageForKey:(id)a3;
- (void)setImage:(id)a3 forKey:(id)a4;
@end

@implementation _MKMapItemAttributionProviderLogoImageCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___MKMapItemAttributionProviderLogoImageCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB315CF0 != -1) {
    dispatch_once(&qword_1EB315CF0, block);
  }
  v2 = (void *)_MergedGlobals_134;

  return v2;
}

- (_MKMapItemAttributionProviderLogoImageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MKMapItemAttributionProviderLogoImageCache;
  v2 = [(_MKMapItemAttributionProviderLogoImageCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (id)imageForKey:(id)a3
{
  return [(NSCache *)self->_cache objectForKey:a3];
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  if (a3) {
    [(NSCache *)self->_cache setObject:a3 forKey:a4];
  }
}

- (void).cxx_destruct
{
}

@end