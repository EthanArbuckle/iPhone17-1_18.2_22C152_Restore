@interface VSObservance
- (BOOL)isObserving;
- (NSString)keyPath;
- (VSObservance)init;
- (VSObservance)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5;
- (VSObservanceDelegate)delegate;
- (id)object;
- (unint64_t)options;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation VSObservance

- (VSObservance)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSObservance)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The object parameter must not be nil."];
    if (v10) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keyPath parameter must not be nil."];
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)VSObservance;
  v11 = [(VSObservance *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_object = v8;
    uint64_t v13 = [v10 copy];
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    v12->_options = a5;
  }

  return v12;
}

- (void)dealloc
{
  [(VSObservance *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)VSObservance;
  [(VSObservance *)&v3 dealloc];
}

- (void)startObserving
{
  if (![(VSObservance *)self isObserving])
  {
    objc_super v3 = [(VSObservance *)self object];
    uint64_t v4 = [(VSObservance *)self keyPath];
    unint64_t v5 = [(VSObservance *)self options];
    [v3 addObserver:self forKeyPath:v4 options:v5 context:kVSKeyValueObservingContext_GenericObservance];

    [(VSObservance *)self setObserving:1];
  }
}

- (void)stopObserving
{
  if ([(VSObservance *)self isObserving])
  {
    objc_super v3 = [(VSObservance *)self object];
    uint64_t v4 = [(VSObservance *)self keyPath];
    [v3 removeObserver:self forKeyPath:v4 context:kVSKeyValueObservingContext_GenericObservance];

    [(VSObservance *)self setObserving:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kVSKeyValueObservingContext_GenericObservance == a6)
  {
    id v11 = a5;
    id v12 = [(VSObservance *)self delegate];
    [v12 observeChange:v11 forObservance:self];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VSObservance;
    id v10 = a5;
    [(VSObservance *)&v13 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (id)object
{
  return self->_object;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)options
{
  return self->_options;
}

- (VSObservanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSObservanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end