@interface COMutableStateClientInfo
- (COMutableStateClientInfo)initWithSuite:(id)a3 clusters:(id)a4 state:(id)a5 observers:(id)a6;
- (NSDictionary)observers;
- (NSDictionary)state;
- (void)addObserverWithPredicate:(id)a3;
- (void)removeKeyPath:(id)a3 cluster:(id)a4;
- (void)removeObserverWithPredicate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setState:(id)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4 cluster:(id)a5;
@end

@implementation COMutableStateClientInfo

- (COMutableStateClientInfo)initWithSuite:(id)a3 clusters:(id)a4 state:(id)a5 observers:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)COMutableStateClientInfo;
  v13 = [(COStateClientInfo *)&v16 initWithSuite:a3 clusters:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->super._state, a5);
    objc_storeStrong((id *)&v14->super._observers, a6);
  }

  return v14;
}

- (void)removeKeyPath:(id)a3 cluster:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(COMutableStateClientInfo *)self state];
  v8 = [v7 objectForKeyedSubscript:v6];
  v9 = (void *)[v8 mutableCopy];

  if (v9)
  {
    [v9 removeObjectForKey:v12];
    v10 = [(COMutableStateClientInfo *)self state];
    id v11 = (void *)[v10 mutableCopy];

    [v11 setObject:v9 forKey:v6];
    [(COMutableStateClientInfo *)self setState:v11];
  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4 cluster:(id)a5
{
  id v17 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(COMutableStateClientInfo *)self state];
  id v11 = [v10 objectForKeyedSubscript:v17];
  if (v11)
  {
    id v12 = [(COMutableStateClientInfo *)self state];
    v13 = [v12 objectForKeyedSubscript:v17];
    v14 = (void *)[v13 mutableCopy];
  }
  else
  {
    v14 = [MEMORY[0x263EFF9A0] dictionary];
  }

  [v14 setObject:v9 forKey:v8];
  v15 = [(COMutableStateClientInfo *)self state];
  objc_super v16 = (void *)[v15 mutableCopy];

  [v16 setObject:v14 forKey:v17];
  [(COMutableStateClientInfo *)self setState:v16];
}

- (void)addObserverWithPredicate:(id)a3
{
  id v8 = a3;
  v4 = [(COMutableStateClientInfo *)self observers];
  v5 = (void *)[v4 mutableCopy];

  id v6 = [v5 objectForKey:v8];
  [v8 allowEvaluation];
  if (v6)
  {
    v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
    [v5 setObject:v7 forKey:v8];
  }
  else
  {
    [v5 setObject:&unk_26D3EB860 forKey:v8];
  }
  [(COMutableStateClientInfo *)self setObservers:v5];
}

- (void)removeObserverWithPredicate:(id)a3
{
  id v9 = a3;
  v4 = [(COMutableStateClientInfo *)self observers];
  v5 = (void *)[v4 mutableCopy];

  id v6 = [v5 objectForKey:v9];
  v7 = v6;
  if (v6)
  {
    if ([v6 intValue] == 1)
    {
      [v5 removeObjectForKey:v9];
    }
    else
    {
      id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue") - 1);
      [v5 setObject:v8 forKey:v9];
    }
    [(COMutableStateClientInfo *)self setObservers:v5];
  }
}

- (NSDictionary)observers
{
  return self->super._observers;
}

- (void)setObservers:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (NSDictionary)state
{
  return self->super._state;
}

@end