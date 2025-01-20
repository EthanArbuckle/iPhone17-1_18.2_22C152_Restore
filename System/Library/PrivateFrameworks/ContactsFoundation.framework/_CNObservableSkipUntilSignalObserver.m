@interface _CNObservableSkipUntilSignalObserver
- (NSString)description;
- (_CNObservableSkipUntilSignalObserver)initWithDelegate:(id)a3;
- (_CNObservableSkipUntilSignalObserverDelegate)delegate;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _CNObservableSkipUntilSignalObserver

- (_CNObservableSkipUntilSignalObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CNObservableSkipUntilSignalObserver;
  v5 = [(_CNObservableSkipUntilSignalObserver *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = [(_CNObservableSkipUntilSignalObserver *)self delegate];
  id v5 = (id)[v3 appendName:@"delegate" object:v4];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v3 = [(_CNObservableSkipUntilSignalObserver *)self delegate];
  [v3 signalDidGenerateEvent];
}

- (void)observerDidComplete
{
  id v2 = [(_CNObservableSkipUntilSignalObserver *)self delegate];
  [v2 signalDidGenerateEvent];
}

- (void)observerDidFailWithError:(id)a3
{
  id v3 = [(_CNObservableSkipUntilSignalObserver *)self delegate];
  [v3 signalDidGenerateEvent];
}

- (_CNObservableSkipUntilSignalObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CNObservableSkipUntilSignalObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end