@interface _MXIntentResponseObserverProxy
- (_MXIntentResponseObserver)observer;
- (_MXIntentResponseObserverProxy)initWithObserver:(id)a3;
- (void)didReceiveError:(id)a3;
- (void)intentResponseDidUpdate:(id)a3;
- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4;
- (void)setObserver:(id)a3;
- (void)stopObserving;
@end

@implementation _MXIntentResponseObserverProxy

- (_MXIntentResponseObserverProxy)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MXIntentResponseObserverProxy;
  v5 = [(_MXIntentResponseObserverProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v6;
}

- (void)intentResponseDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(_MXIntentResponseObserverProxy *)self observer];
  [v5 intentResponseDidUpdate:v4 withSerializedCacheItems:0 error:0];
}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MXIntentResponseObserverProxy *)self observer];
  [v8 intentResponseDidUpdate:v7 withSerializedCacheItems:v6 error:0];
}

- (void)didReceiveError:(id)a3
{
  id v4 = a3;
  id v5 = [(_MXIntentResponseObserverProxy *)self observer];
  [v5 intentResponseDidUpdate:0 withSerializedCacheItems:0 error:v4];
}

- (void)stopObserving
{
}

- (_MXIntentResponseObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (_MXIntentResponseObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end