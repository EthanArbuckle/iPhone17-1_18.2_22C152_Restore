@interface CRMailAccountAnalyzer
- (BOOL)isAddressRestricted:(id)a3;
- (CRMailAccountAnalyzer)init;
- (CRMailAccountAnalyzer)initWithLocale:(id)a3;
- (id)allAddresses;
- (id)normalizeAddress:(id)a3;
- (void)addAddress:(id)a3 isRestricted:(BOOL)a4;
- (void)dealloc;
@end

@implementation CRMailAccountAnalyzer

- (CRMailAccountAnalyzer)init
{
  v3 = +[NSLocale currentLocale];
  return [(CRMailAccountAnalyzer *)self initWithLocale:v3];
}

- (CRMailAccountAnalyzer)initWithLocale:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRMailAccountAnalyzer;
  v4 = [(CRMailAccountAnalyzer *)&v6 init];
  if (v4)
  {
    v4->_cache = (CNCache *)objc_alloc_init((Class)CNCache);
    v4->_locale = (NSLocale *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRMailAccountAnalyzer;
  [(CRMailAccountAnalyzer *)&v3 dealloc];
}

- (void)addAddress:(id)a3 isRestricted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CRMailAccountAnalyzer *)self normalizeAddress:a3];
  if ((objc_msgSend(-[CNCache objectForKey:onCacheMiss:](self->_cache, "objectForKey:onCacheMiss:", v6, &stru_10002D300), "isEqualToNumber:", &__kCFBooleanTrue) & 1) == 0)
  {
    cache = self->_cache;
    v8 = +[NSNumber numberWithBool:v4];
    [(CNCache *)cache setObject:v8 forKey:v6];
  }
}

- (BOOL)isAddressRestricted:(id)a3
{
  id v3 = [(CNCache *)self->_cache objectForKey:[(CRMailAccountAnalyzer *)self normalizeAddress:a3]];
  if (v3)
  {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (id)allAddresses
{
  return [(CNCache *)self->_cache allKeys];
}

- (id)normalizeAddress:(id)a3
{
  return [a3 stringByFoldingWithOptions:257 locale:self->_locale];
}

@end