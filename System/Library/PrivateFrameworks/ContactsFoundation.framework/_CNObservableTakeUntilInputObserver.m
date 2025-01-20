@interface _CNObservableTakeUntilInputObserver
- (CNObserver)observer;
- (NSString)description;
- (_CNObservableTakeUntilInputObserver)initWithObserver:(id)a3 delegate:(id)a4;
- (_CNObservableTakeUntilInputObserverDelegate)delegate;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _CNObservableTakeUntilInputObserver

- (_CNObservableTakeUntilInputObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableTakeUntilInputObserver;
  v9 = [(_CNObservableTakeUntilInputObserver *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(_CNObservableTakeUntilInputObserver *)self observer];
  id v5 = (id)[v3 appendName:@"observer" object:v4];

  v6 = [(_CNObservableTakeUntilInputObserver *)self delegate];
  id v7 = (id)[v3 appendName:@"delegate" object:v6];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v8 = a3;
  v4 = +[CNObservableEvent eventWithResult:](CNObservableEvent, "eventWithResult:");
  id v5 = [(_CNObservableTakeUntilInputObserver *)self delegate];
  int v6 = [v5 shouldMirrorEvent:v4];

  if (v6)
  {
    id v7 = [(_CNObservableTakeUntilInputObserver *)self observer];
    [v7 observerDidReceiveResult:v8];
  }
}

- (void)observerDidComplete
{
  id v6 = +[CNObservableEvent completionEvent];
  v3 = [(_CNObservableTakeUntilInputObserver *)self delegate];
  int v4 = [v3 shouldMirrorEvent:v6];

  if (v4)
  {
    id v5 = [(_CNObservableTakeUntilInputObserver *)self observer];
    [v5 observerDidComplete];
  }
}

- (void)observerDidFailWithError:(id)a3
{
  id v8 = a3;
  int v4 = +[CNObservableEvent failureEventWithError:](CNObservableEvent, "failureEventWithError:");
  id v5 = [(_CNObservableTakeUntilInputObserver *)self delegate];
  int v6 = [v5 shouldMirrorEvent:v4];

  if (v6)
  {
    id v7 = [(_CNObservableTakeUntilInputObserver *)self observer];
    [v7 observerDidFailWithError:v8];
  }
}

- (CNObserver)observer
{
  return (CNObserver *)objc_getProperty(self, a2, 8, 1);
}

- (_CNObservableTakeUntilInputObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CNObservableTakeUntilInputObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_observer, 0);
}

@end