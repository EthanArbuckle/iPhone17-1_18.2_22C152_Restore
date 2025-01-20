@interface LAContextProvider
- (_TtC29LocalAuthenticationEmbeddedUI17LAContextProvider)init;
- (id)createContext;
@end

@implementation LAContextProvider

- (id)createContext
{
  id v2 = objc_msgSend(self, sel_createContext);

  return v2;
}

- (_TtC29LocalAuthenticationEmbeddedUI17LAContextProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LAContextProvider();
  return [(LAContextProvider *)&v3 init];
}

@end