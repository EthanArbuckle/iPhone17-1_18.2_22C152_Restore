@interface AVKeyPathFlattenerKVOIntrospectionShim
- (AVKeyPathFlattenerKVOIntrospectionShim)initWithObservedObject:(id)a3 realNotifier:(id)a4;
- (NSObject)observedObject;
- (void)cancelCallbacks;
- (void)dealloc;
@end

@implementation AVKeyPathFlattenerKVOIntrospectionShim

- (AVKeyPathFlattenerKVOIntrospectionShim)initWithObservedObject:(id)a3 realNotifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVKeyPathFlattenerKVOIntrospectionShim;
  v6 = [(AVKeyPathFlattenerKVOIntrospectionShim *)&v9 init];
  if (v6)
  {
    v6->_observedObject = a3;
    v6->_realNotifier = (AVKVOIntrospection *)a4;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVKeyPathFlattenerKVOIntrospectionShim;
  [(AVKeyPathFlattenerKVOIntrospectionShim *)&v3 dealloc];
}

- (NSObject)observedObject
{
  return self->_observedObject;
}

- (void)cancelCallbacks
{
}

@end