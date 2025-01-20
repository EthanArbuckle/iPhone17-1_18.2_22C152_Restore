@interface ADMissingReferencesContext
- (ADMissingReferencesContext)initWithMissingReferences:(id)a3 forRequestId:(id)a4;
- (BOOL)hasBeenFulfilled;
- (NSArray)missingReferences;
- (NSMutableSet)_mutableResolvedIds;
- (NSSet)resolvedReferences;
- (NSString)requestId;
- (id)fulfillmentBlock;
- (void)setFulfillmentBlock:(id)a3;
- (void)setHasBeenFulfilled:(BOOL)a3;
- (void)set_mutableResolvedIds:(id)a3;
@end

@implementation ADMissingReferencesContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fulfillmentBlock, 0);
  objc_storeStrong((id *)&self->_missingReferences, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_mutableResolvedIds, 0);
}

- (void)setHasBeenFulfilled:(BOOL)a3
{
  self->_hasBeenFulfilled = a3;
}

- (BOOL)hasBeenFulfilled
{
  return self->_hasBeenFulfilled;
}

- (void)setFulfillmentBlock:(id)a3
{
}

- (id)fulfillmentBlock
{
  return self->_fulfillmentBlock;
}

- (NSArray)missingReferences
{
  return self->_missingReferences;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)set_mutableResolvedIds:(id)a3
{
}

- (NSMutableSet)_mutableResolvedIds
{
  return self->_mutableResolvedIds;
}

- (NSSet)resolvedReferences
{
  return (NSSet *)self->_mutableResolvedIds;
}

- (ADMissingReferencesContext)initWithMissingReferences:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADMissingReferencesContext;
  v8 = [(ADMissingReferencesContext *)&v16 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    missingReferences = v8->_missingReferences;
    v8->_missingReferences = v9;

    v11 = (NSString *)[v7 copy];
    requestId = v8->_requestId;
    v8->_requestId = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableResolvedIds = v8->_mutableResolvedIds;
    v8->_mutableResolvedIds = v13;
  }
  return v8;
}

@end