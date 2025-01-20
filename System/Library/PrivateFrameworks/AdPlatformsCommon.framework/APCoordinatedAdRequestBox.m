@interface APCoordinatedAdRequestBox
- (APAdRequestContents)requestContents;
- (APCoordinatedAdRequestBox)initWithDelegate:(id)a3 contents:(id)a4 handler:(id)a5;
- (id)completionHandler;
@end

@implementation APCoordinatedAdRequestBox

- (APCoordinatedAdRequestBox)initWithDelegate:(id)a3 contents:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)APCoordinatedAdRequestBox;
  v11 = [(APCoordinatedRetryBox *)&v16 initWithType:0 delegate:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContents, a4);
    uint64_t v13 = MEMORY[0x22A64D220](v10);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v13;
  }
  return v12;
}

- (APAdRequestContents)requestContents
{
  return self->_requestContents;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestContents, 0);
}

@end