@interface _CNObservableTakeUntilOperator
- (BOOL)isActive;
- (BOOL)shouldMirrorEvent:(id)a3;
- (CNCancelable)inputToken;
- (CNCancelable)signalToken;
- (CNObservable)input;
- (CNObservable)signal;
- (NSString)description;
- (_CNObservableTakeUntilOperator)initWithInput:(id)a3 signal:(id)a4;
- (id)subscribe:(id)a3;
- (void)cancel;
- (void)setActive:(BOOL)a3;
- (void)setInputToken:(id)a3;
- (void)setSignalToken:(id)a3;
- (void)signalDidGenerateEventWithObserver:(id)a3;
@end

@implementation _CNObservableTakeUntilOperator

- (_CNObservableTakeUntilOperator)initWithInput:(id)a3 signal:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableTakeUntilOperator;
  v9 = [(_CNObservableTakeUntilOperator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    objc_storeStrong((id *)&v10->_signal, a4);
    v10->_active = 1;
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(_CNObservableTakeUntilOperator *)self input];
  id v5 = (id)[v3 appendName:@"input" object:v4];

  v6 = [(_CNObservableTakeUntilOperator *)self signal];
  id v7 = (id)[v3 appendName:@"signal" object:v6];

  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"active", -[_CNObservableTakeUntilOperator isActive](self, "isActive"));
  v9 = [v3 build];

  return (NSString *)v9;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNObservableTakeUntilSignalObserver alloc] initWithObserver:v4 delegate:self];
  v6 = [(_CNObservableTakeUntilOperator *)self signal];
  id v7 = [v6 subscribe:v5];
  [(_CNObservableTakeUntilOperator *)self setSignalToken:v7];

  id v8 = [[_CNObservableTakeUntilInputObserver alloc] initWithObserver:v4 delegate:self];
  v9 = [(_CNObservableTakeUntilOperator *)self input];
  v10 = [v9 subscribe:v8];
  [(_CNObservableTakeUntilOperator *)self setInputToken:v10];

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44___CNObservableTakeUntilOperator_subscribe___block_invoke;
  v13[3] = &unk_1E56A05E8;
  objc_copyWeak(&v14, &location);
  v11 = +[CNCancelationToken tokenWithCancelationBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

- (void)cancel
{
  v3 = [(_CNObservableTakeUntilOperator *)self inputToken];
  [v3 cancel];

  id v4 = [(_CNObservableTakeUntilOperator *)self signalToken];
  [v4 cancel];
}

- (BOOL)shouldMirrorEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 eventType] == 1 || objc_msgSend(v4, "eventType") == 2;
  v6 = self;
  objc_sync_enter(v6);
  BOOL v7 = [(_CNObservableTakeUntilOperator *)v6 isActive];
  if (v5) {
    [(_CNObservableTakeUntilOperator *)v6 setActive:0];
  }
  objc_sync_exit(v6);

  if (v7 && v5)
  {
    id v8 = [(_CNObservableTakeUntilOperator *)v6 signalToken];
    [v8 cancel];
  }
  return v7;
}

- (void)signalDidGenerateEventWithObserver:(id)a3
{
  id v6 = a3;
  [(_CNObservableTakeUntilOperator *)self cancel];
  id v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = [(_CNObservableTakeUntilOperator *)v4 isActive];
  [(_CNObservableTakeUntilOperator *)v4 setActive:0];
  objc_sync_exit(v4);

  if (v5) {
    [v6 observerDidComplete];
  }
}

- (CNObservable)input
{
  return (CNObservable *)objc_getProperty(self, a2, 24, 1);
}

- (CNObservable)signal
{
  return (CNObservable *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (CNCancelable)inputToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputToken:(id)a3
{
}

- (CNCancelable)signalToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSignalToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalToken, 0);
  objc_storeStrong((id *)&self->_inputToken, 0);
  objc_storeStrong((id *)&self->_signal, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

@end