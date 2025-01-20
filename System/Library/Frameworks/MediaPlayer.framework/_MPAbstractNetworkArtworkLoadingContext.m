@interface _MPAbstractNetworkArtworkLoadingContext
- (NSMutableDictionary)catalogIdentifierToCompletionHandlerMap;
- (NSURLSessionDataTask)dataTask;
- (_MPAbstractNetworkArtworkLoadingContext)init;
- (void)setDataTask:(id)a3;
@end

@implementation _MPAbstractNetworkArtworkLoadingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogIdentifierToCompletionHandlerMap, 0);

  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (NSMutableDictionary)catalogIdentifierToCompletionHandlerMap
{
  return self->_catalogIdentifierToCompletionHandlerMap;
}

- (void)setDataTask:(id)a3
{
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (_MPAbstractNetworkArtworkLoadingContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MPAbstractNetworkArtworkLoadingContext;
  v2 = [(_MPAbstractNetworkArtworkLoadingContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    catalogIdentifierToCompletionHandlerMap = v2->_catalogIdentifierToCompletionHandlerMap;
    v2->_catalogIdentifierToCompletionHandlerMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end