@interface _CNObservableTakeUntilSignalObserver
- (CNObserver)observer;
- (NSString)description;
- (_CNObservableTakeUntilSignalObserver)initWithObserver:(id)a3 delegate:(id)a4;
- (_CNObservableTakeUntilSignalObserverDelegate)delegate;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _CNObservableTakeUntilSignalObserver

- (_CNObservableTakeUntilSignalObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableTakeUntilSignalObserver;
  v9 = [(_CNObservableTakeUntilSignalObserver *)&v13 init];
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
  v4 = [(_CNObservableTakeUntilSignalObserver *)self observer];
  id v5 = (id)[v3 appendName:@"observer" object:v4];

  v6 = [(_CNObservableTakeUntilSignalObserver *)self delegate];
  id v7 = (id)[v3 appendName:@"delegate" object:v6];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v5 = [(_CNObservableTakeUntilSignalObserver *)self delegate];
  v4 = [(_CNObservableTakeUntilSignalObserver *)self observer];
  [v5 signalDidGenerateEventWithObserver:v4];
}

- (void)observerDidComplete
{
  id v4 = [(_CNObservableTakeUntilSignalObserver *)self delegate];
  v3 = [(_CNObservableTakeUntilSignalObserver *)self observer];
  [v4 signalDidGenerateEventWithObserver:v3];
}

- (void)observerDidFailWithError:(id)a3
{
  id v5 = [(_CNObservableTakeUntilSignalObserver *)self delegate];
  id v4 = [(_CNObservableTakeUntilSignalObserver *)self observer];
  [v5 signalDidGenerateEventWithObserver:v4];
}

- (CNObserver)observer
{
  return (CNObserver *)objc_getProperty(self, a2, 8, 1);
}

- (_CNObservableTakeUntilSignalObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CNObservableTakeUntilSignalObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_observer, 0);
}

@end