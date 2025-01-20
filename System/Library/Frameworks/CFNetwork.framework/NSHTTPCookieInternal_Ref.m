@interface NSHTTPCookieInternal_Ref
- (HTTPCookie)_inner;
- (NSHTTPCookieInternal_Ref)init;
- (id)_initWithReference:(const CompactCookieArray *)a3 index:(int64_t)a4;
- (void)dealloc;
@end

@implementation NSHTTPCookieInternal_Ref

- (void)dealloc
{
  fromRef = self->_fromRef;
  if (fromRef)
  {
    (*((void (**)(CompactHTTPCookieReference *, SEL))fromRef->var0 + 1))(fromRef, a2);
    self->_fromRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieInternal_Ref;
  [(NSHTTPCookieInternal_Ref *)&v4 dealloc];
}

- (id)_initWithReference:(const CompactCookieArray *)a3 index:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NSHTTPCookieInternal_Ref;
  if ([(NSHTTPCookieInternal *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (NSHTTPCookieInternal_Ref)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieInternal_Ref;
  return [(NSHTTPCookieInternal *)&v3 init];
}

- (HTTPCookie)_inner
{
  return (HTTPCookie *)self->_fromRef;
}

@end