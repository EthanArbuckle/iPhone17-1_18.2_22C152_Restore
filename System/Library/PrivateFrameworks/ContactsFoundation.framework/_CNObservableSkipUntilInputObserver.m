@interface _CNObservableSkipUntilInputObserver
- (CNObserver)observer;
- (NSString)description;
- (_CNObservableSkipUntilInputObserver)initWithObserver:(id)a3 delegate:(id)a4;
- (_CNObservableSkipUntilInputObserverDelegate)delegate;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _CNObservableSkipUntilInputObserver

- (_CNObservableSkipUntilInputObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableSkipUntilInputObserver;
  v9 = [(_CNObservableSkipUntilInputObserver *)&v13 init];
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
  v4 = [(_CNObservableSkipUntilInputObserver *)self observer];
  id v5 = (id)[v3 appendName:@"observer" object:v4];

  v6 = [(_CNObservableSkipUntilInputObserver *)self delegate];
  id v7 = (id)[v3 appendName:@"delegate" object:v6];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v7 = a3;
  v4 = [(_CNObservableSkipUntilInputObserver *)self delegate];
  int v5 = [v4 shouldMirrorEvents];

  if (v5)
  {
    v6 = [(_CNObservableSkipUntilInputObserver *)self observer];
    [v6 observerDidReceiveResult:v7];
  }
}

- (void)observerDidComplete
{
  v3 = [(_CNObservableSkipUntilInputObserver *)self delegate];
  int v4 = [v3 shouldMirrorEvents];

  if (v4)
  {
    id v5 = [(_CNObservableSkipUntilInputObserver *)self observer];
    [v5 observerDidComplete];
  }
  else
  {
    id v5 = [(_CNObservableSkipUntilInputObserver *)self delegate];
    [v5 inputDidTerminate];
  }
}

- (void)observerDidFailWithError:(id)a3
{
  id v7 = a3;
  int v4 = [(_CNObservableSkipUntilInputObserver *)self delegate];
  int v5 = [v4 shouldMirrorEvents];

  if (v5)
  {
    v6 = [(_CNObservableSkipUntilInputObserver *)self observer];
    [v6 observerDidFailWithError:v7];
  }
  else
  {
    v6 = [(_CNObservableSkipUntilInputObserver *)self delegate];
    [v6 inputDidTerminate];
  }
}

- (CNObserver)observer
{
  return (CNObserver *)objc_getProperty(self, a2, 8, 1);
}

- (_CNObservableSkipUntilInputObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CNObservableSkipUntilInputObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_observer, 0);
}

@end