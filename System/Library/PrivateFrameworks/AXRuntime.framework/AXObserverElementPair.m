@interface AXObserverElementPair
- (AXObserverElementPair)initWithObserver:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)observer;
- (void)setObserver:(id)a3;
@end

@implementation AXObserverElementPair

- (id)observer
{
  return self->_observer;
}

- (AXObserverElementPair)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXObserverElementPair;
  v5 = [(AXObserverElementPair *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXObserverElementPair *)v5 setObserver:v4];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 observer];
    v6 = [(AXObserverElementPair *)self observer];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v2 = NSString;
  v3 = [(AXObserverElementPair *)self observer];
  id v4 = [v2 stringWithFormat:@"Pair (%@) ", v3];

  return v4;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end