@interface ATMessageLink
- (ATMessageLink)init;
- (BOOL)isInitialized;
- (BOOL)isOpen;
- (NSString)identifier;
- (int)endpointType;
- (void)addObserver:(id)a3;
- (void)addRequestHandler:(id)a3 forDataClass:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeRequestHandlerForDataClass:(id)a3;
- (void)sendRequest:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withProgress:(id)a4 completion:(id)a5;
@end

@implementation ATMessageLink

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeRequestHandlerForDataClass:(id)a3
{
}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4
{
}

- (void)sendResponse:(id)a3 withProgress:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, void))a5;
  [(ATMessageLink *)self doesNotRecognizeSelector:a2];
  v7[2](v7, 0);
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  [(ATMessageLink *)self doesNotRecognizeSelector:a2];
  v6[2](v6, 0);
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  [(ATMessageLink *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
}

- (int)endpointType
{
  return 0;
}

- (NSString)identifier
{
  return 0;
}

- (BOOL)isInitialized
{
  return 0;
}

- (BOOL)isOpen
{
  return 0;
}

- (ATMessageLink)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ATMessageLink.m" lineNumber:14 description:@"ATMessageLink is an abstract class and requires a concrete implementation."];
  }
  v7.receiver = self;
  v7.super_class = (Class)ATMessageLink;
  return [(ATMessageLink *)&v7 init];
}

@end