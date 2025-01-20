@interface SGDetailCacheSnapshot
@end

@implementation SGDetailCacheSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maybeFormat, 0);
  objc_storeStrong((id *)&self->_emailCache, 0);

  objc_storeStrong((id *)&self->_phoneCache, 0);
}

@end