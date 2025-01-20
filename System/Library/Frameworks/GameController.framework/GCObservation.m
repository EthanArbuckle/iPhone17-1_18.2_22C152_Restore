@interface GCObservation
- (BOOL)isEqual:(id)a3;
- (GCObservation)initWithObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
- (id)description;
- (id)observer;
- (unint64_t)hash;
- (unint64_t)options;
- (void)context;
- (void)setContext:(void *)a3;
- (void)setObserver:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation GCObservation

- (GCObservation)initWithObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCObservation;
  v9 = [(GCObservation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_observer, v8);
    v10->_options = a4;
    v10->_context = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 observer];
    v7 = [(GCObservation *)self observer];
    if (v6 == v7)
    {
      v9 = (void *)[v5 context];
      BOOL v8 = v9 == [(GCObservation *)self context];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GCObservation *)self observer];

  return (unint64_t)v2;
}

- (id)description
{
  unint64_t options = self->_options;
  id WeakRetained = objc_loadWeakRetained(&self->_observer);
  id v5 = +[NSString stringWithFormat:@"<GCObservation options:0x%02lx observer:%p context:%p>", options, WeakRetained, self->_context];

  return v5;
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);

  return WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
}

@end