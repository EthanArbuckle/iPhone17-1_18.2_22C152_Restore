@interface CAMBufferKeyValueObserverObservanceChange
- (CAMBufferKeyValueObserverObservanceChange)initWithKeyPath:(id)a3 ofObject:(id)a4 withChange:(id)a5;
- (NSDictionary)change;
- (NSObject)object;
- (NSString)keyPath;
@end

@implementation CAMBufferKeyValueObserverObservanceChange

- (CAMBufferKeyValueObserverObservanceChange)initWithKeyPath:(id)a3 ofObject:(id)a4 withChange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CAMBufferKeyValueObserverObservanceChange;
  v11 = [(CAMBufferKeyValueObserverObservanceChange *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    keyPath = v11->_keyPath;
    v11->_keyPath = (NSString *)v12;

    objc_storeWeak((id *)&v11->_object, v9);
    uint64_t v14 = [v10 copy];
    change = v11->_change;
    v11->_change = (NSDictionary *)v14;

    v16 = v11;
  }

  return v11;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return WeakRetained;
}

- (NSDictionary)change
{
  return self->_change;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_change, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end