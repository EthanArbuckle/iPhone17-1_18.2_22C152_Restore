@interface _CNKeyValueObserverHandler
- (_CNKeyValueObserverHandler)initWithObject:(id)a3 keyPath:(id)a4 observer:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startObservingWithOptions:(unint64_t)a3;
- (void)stopObserving;
@end

@implementation _CNKeyValueObserverHandler

- (_CNKeyValueObserverHandler)initWithObject:(id)a3 keyPath:(id)a4 observer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_CNKeyValueObserverHandler;
  v12 = [(_CNKeyValueObserverHandler *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_object, a3);
    uint64_t v14 = [v10 copy];
    keyPath = v13->_keyPath;
    v13->_keyPath = (NSString *)v14;

    objc_storeStrong((id *)&v13->_observer, a5);
    v16 = v13;
  }

  return v13;
}

- (void)startObservingWithOptions:(unint64_t)a3
{
}

- (void)stopObserving
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)sHandlerContext == a6)
  {
    observer = self->_observer;
    -[CNObserver observerDidReceiveResult:](observer, "observerDidReceiveResult:", a5, a4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_CNKeyValueObserverHandler;
    -[_CNKeyValueObserverHandler observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong(&self->_object, 0);
}

@end