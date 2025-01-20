@interface _NSCFWikipediaProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
- (_NSCFWikipediaProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation _NSCFWikipediaProtocol

- (void)stopLoading
{
}

- (void)startLoading
{
}

- (void)dealloc
{
  if (self->_instance)
  {
    var2 = (void (*)(void))self->_callbacks->var2;
    if (var2) {
      var2();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSCFWikipediaProtocol;
  [(NSURLProtocol *)&v4 dealloc];
}

- (_NSCFWikipediaProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_NSCFWikipediaProtocol;
  v5 = [(NSURLProtocol *)&v9 initWithRequest:a3 cachedResponse:a4 client:a5];
  v6 = v5;
  if (v5)
  {
    p_callbacks = &v5->_callbacks;
    v5->_instance = (const void *)off_1E8F7FB38(v5, &v5->_callbacks, *((void *)&_wikipediaProtocol + 1));
    if ((*p_callbacks)->var0 != 2) {
      __assert_rtn("-[_NSCFWikipediaProtocol initWithRequest:cachedResponse:client:]", "CFURLProtocol.mm", 122, "_callbacks->version == 2");
    }
    if (!(*p_callbacks)->var6) {
      __assert_rtn("-[_NSCFWikipediaProtocol initWithRequest:cachedResponse:client:]", "CFURLProtocol.mm", 123, "_callbacks->start != NULL");
    }
  }
  return v6;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  return (*((unsigned int (**)(id, void))&xmmword_1E8F7FB18 + 1))(a3, *((void *)&_wikipediaProtocol + 1)) != 0;
}

@end