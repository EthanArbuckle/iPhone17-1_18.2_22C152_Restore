@interface _CRPhoneSearchCache
- (CRPhoneSearch)lastPhoneSearch;
- (id)copySearcherForPattern:(const char *)a3;
- (void)dealloc;
- (void)flush;
- (void)setLastPhoneSearch:(id)a3;
@end

@implementation _CRPhoneSearchCache

- (void)flush
{
}

- (void)dealloc
{
  lastSearchString = self->_lastSearchString;
  if (lastSearchString) {
    free(lastSearchString);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CRPhoneSearchCache;
  [(_CRPhoneSearchCache *)&v4 dealloc];
}

- (id)copySearcherForPattern:(const char *)a3
{
  if (self->_lastSearchStringLength && !strcmp(a3, self->_lastSearchString))
  {
    lastPhoneSearch = self->_lastPhoneSearch;
    return lastPhoneSearch;
  }
  else
  {
    size_t v5 = strlen(a3);
    if (!v5) {
      return 0;
    }
    unint64_t v6 = v5;
    lastSearchString = self->_lastSearchString;
    if (lastSearchString) {
      free(lastSearchString);
    }
    self->_lastSearchString = strdup(a3);
    self->_lastSearchStringLength = v6;
    id v8 = [objc_alloc((Class)NSData) initWithBytesNoCopy:self->_lastSearchString length:self->_lastSearchStringLength freeWhenDone:0];
    v9 = (CRPhoneSearch *)[(NSCache *)self->_cache objectForKey:v8];
    if (!v9)
    {
      if (!self->_cache) {
        self->_cache = (NSCache *)objc_alloc_init((Class)NSCache);
      }
      v9 = [[CRPhoneSearch alloc] initWithSearchString:+[NSString stringWithUTF8String:a3]];
      [(NSCache *)self->_cache setObject:v9 forKey:+[NSData dataWithData:v8]];
    }

    [(_CRPhoneSearchCache *)self setLastPhoneSearch:v9];
    return v9;
  }
}

- (CRPhoneSearch)lastPhoneSearch
{
  return self->_lastPhoneSearch;
}

- (void)setLastPhoneSearch:(id)a3
{
}

@end