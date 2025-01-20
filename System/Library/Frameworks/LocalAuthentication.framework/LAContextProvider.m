@interface LAContextProvider
- (id)createContext;
@end

@implementation LAContextProvider

- (id)createContext
{
  v2 = objc_alloc_init(LAContext);

  return v2;
}

@end