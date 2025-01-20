@interface _MTLMessageNotifier
- (MTLMessageFilter)filter;
- (id)handler;
- (id)init:(id)a3 filter:(id)a4;
- (void)dealloc;
@end

@implementation _MTLMessageNotifier

- (id)init:(id)a3 filter:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_MTLMessageNotifier;
  v6 = [(_MTLMessageNotifier *)&v9 init];
  if (v6)
  {
    v7 = _Block_copy(a3);
    v6->_filter = (MTLMessageFilter *)a4;
    v6->_handler = v7;
    if (!v7)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  _Block_release(self->_handler);
  v3.receiver = self;
  v3.super_class = (Class)_MTLMessageNotifier;
  [(_MTLMessageNotifier *)&v3 dealloc];
}

- (MTLMessageFilter)filter
{
  return (MTLMessageFilter *)objc_getProperty(self, a2, 8, 1);
}

- (id)handler
{
  return self->_handler;
}

@end