@interface MessageFilterExtension
- (_TtC15extensionFilter22MessageFilterExtension)init;
- (void)handleCapabilitiesQueryRequest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)handleQueryRequest:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation MessageFilterExtension

- (_TtC15extensionFilter22MessageFilterExtension)init
{
  return (_TtC15extensionFilter22MessageFilterExtension *)MessageFilterExtension.init()();
}

- (void)handleCapabilitiesQueryRequest:(id)a3 context:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  specialized MessageFilterExtension.handle(_:context:completion:)((void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)handleQueryRequest:(id)a3 context:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  specialized MessageFilterExtension.handle(_:context:completion:)(v9, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

@end