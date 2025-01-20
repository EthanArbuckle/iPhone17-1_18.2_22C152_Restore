@interface _CNAmbObserver
- (_CNAmbObserver)initWithObserver:(id)a3 delegate:(id)a4;
- (void)declareWinner;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation _CNAmbObserver

- (_CNAmbObserver)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAmbObserver;
  v9 = [(_CNAmbObserver *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (void)declareWinner
{
  self->_isWinner = 1;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained observerWillRelayEvent:self];

  if (self->_isWinner) {
    [(CNObserver *)self->_observer observerDidReceiveResult:v5];
  }
}

- (void)observerDidComplete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained observerWillRelayEvent:self];

  if (self->_isWinner)
  {
    observer = self->_observer;
    [(CNObserver *)observer observerDidComplete];
  }
}

- (void)observerDidFailWithError:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained observerWillRelayEvent:self];

  if (self->_isWinner) {
    [(CNObserver *)self->_observer observerDidFailWithError:v5];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_observer, 0);
}

@end