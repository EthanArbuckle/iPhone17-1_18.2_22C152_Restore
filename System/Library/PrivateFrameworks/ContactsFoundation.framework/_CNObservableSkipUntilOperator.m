@interface _CNObservableSkipUntilOperator
- (BOOL)isActive;
- (BOOL)shouldMirrorEvents;
- (CNCancelable)inputToken;
- (CNCancelable)signalToken;
- (CNObservable)input;
- (CNObservable)signal;
- (NSString)description;
- (_CNObservableSkipUntilOperator)initWithInput:(id)a3 signal:(id)a4;
- (id)subscribe:(id)a3;
- (void)cancel;
- (void)inputDidTerminate;
- (void)setActive:(BOOL)a3;
- (void)setInputToken:(id)a3;
- (void)setSignalToken:(id)a3;
- (void)signalDidGenerateEvent;
@end

@implementation _CNObservableSkipUntilOperator

- (_CNObservableSkipUntilOperator)initWithInput:(id)a3 signal:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNObservableSkipUntilOperator;
  v9 = [(_CNObservableSkipUntilOperator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    objc_storeStrong((id *)&v10->_signal, a4);
    v10->_active = 0;
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(_CNObservableSkipUntilOperator *)self input];
  id v5 = (id)[v3 appendName:@"input" object:v4];

  v6 = [(_CNObservableSkipUntilOperator *)self signal];
  id v7 = (id)[v3 appendName:@"signal" object:v6];

  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"active", -[_CNObservableSkipUntilOperator isActive](self, "isActive"));
  v9 = [v3 build];

  return (NSString *)v9;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNObservableSkipUntilSignalObserver alloc] initWithDelegate:self];
  v6 = [(_CNObservableSkipUntilOperator *)self signal];
  id v7 = [v6 subscribe:v5];
  [(_CNObservableSkipUntilOperator *)self setSignalToken:v7];

  id v8 = [[_CNObservableSkipUntilInputObserver alloc] initWithObserver:v4 delegate:self];
  v9 = [(_CNObservableSkipUntilOperator *)self input];
  v10 = [v9 subscribe:v8];
  [(_CNObservableSkipUntilOperator *)self setInputToken:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44___CNObservableSkipUntilOperator_subscribe___block_invoke;
  v13[3] = &unk_1E569F9D8;
  v13[4] = self;
  v11 = +[CNCancelationToken tokenWithCancelationBlock:v13];

  return v11;
}

- (void)cancel
{
  v3 = [(_CNObservableSkipUntilOperator *)self inputToken];
  [v3 cancel];

  id v4 = [(_CNObservableSkipUntilOperator *)self signalToken];
  [v4 cancel];
}

- (BOOL)shouldMirrorEvents
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(_CNObservableSkipUntilOperator *)v2 isActive];
  objc_sync_exit(v2);

  return v3;
}

- (void)inputDidTerminate
{
  id v2 = [(_CNObservableSkipUntilOperator *)self signalToken];
  [v2 cancel];
}

- (void)signalDidGenerateEvent
{
  obj = self;
  objc_sync_enter(obj);
  [(_CNObservableSkipUntilOperator *)obj setActive:1];
  objc_sync_exit(obj);
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