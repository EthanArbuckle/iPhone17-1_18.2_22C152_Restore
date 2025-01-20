@interface _MFSearchProcessResultsOperation
+ (id)operationWithResultsOfType:(unint64_t)a3 completion:(id)a4 consumer:(id)a5;
- (void)main;
@end

@implementation _MFSearchProcessResultsOperation

+ (id)operationWithResultsOfType:(unint64_t)a3 completion:(id)a4 consumer:(id)a5
{
  id v7 = a4;
  v8 = (_MFSearchResultsConsumer *)a5;
  v9 = objc_alloc_init(_MFSearchProcessResultsOperation);
  v9->_type = a3;
  consumer = v9->_consumer;
  v9->_consumer = v8;
  v11 = v8;

  v12 = _Block_copy(v7);
  id completionBlock = v9->_completionBlock;
  v9->_id completionBlock = v12;

  return v9;
}

- (void)main
{
  if (_shouldCancel(self, self->_consumer)
    || ![(_MFSearchResultsConsumer *)self->_consumer _shouldProcessResultsAfterFinishingType:self->_type])
  {
    v10 = (void (*)(void))*((void *)self->_completionBlock + 2);
    v10();
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    consumer = self->_consumer;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40___MFSearchProcessResultsOperation_main__block_invoke;
    v11[3] = &unk_1E5F7A820;
    v11[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v7 = v3;
    id v13 = v7;
    [(_MFSearchResultsConsumer *)consumer _enumerateSearchResultTypesInSortOrderUsingBlock:v11];
    id completionBlock = (void (**)(id, void))self->_completionBlock;
    if (_shouldCancel(self, self->_consumer)) {
      id v9 = 0;
    }
    else {
      id v9 = v7;
    }
    ((void (**)(id, id))completionBlock)[2](completionBlock, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_consumer, 0);
}

@end