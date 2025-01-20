@interface ADClientLiteWorkItem
- (ADClientLiteWorkItem)initWithWork:(id)a3 timeout:(id)a4;
- (id)timeout;
- (id)workItem;
@end

@implementation ADClientLiteWorkItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeout, 0);
  objc_storeStrong(&self->_workItem, 0);
}

- (id)timeout
{
  id v2 = objc_retainBlock(self->_timeout);
  return v2;
}

- (id)workItem
{
  id v2 = objc_retainBlock(self->_workItem);
  return v2;
}

- (ADClientLiteWorkItem)initWithWork:(id)a3 timeout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADClientLiteWorkItem;
  v8 = [(ADClientLiteWorkItem *)&v14 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id workItem = v8->_workItem;
    v8->_id workItem = v9;

    id v11 = objc_retainBlock(v7);
    id timeout = v8->_timeout;
    v8->_id timeout = v11;
  }
  return v8;
}

@end