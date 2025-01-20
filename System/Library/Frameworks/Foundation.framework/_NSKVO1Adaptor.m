@interface _NSKVO1Adaptor
- (BOOL)isEqual:(id)a3;
- (_NSKVO1Adaptor)initWithObservable:(id)a3 observer:(id)a4 keyPath:(id)a5;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9;
- (void)_setEmitsChanges:(BOOL)a3;
- (void)finishObserving;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remove;
@end

@implementation _NSKVO1Adaptor

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9
{
  if ((id)*MEMORY[0x1E4F1D260] == a7) {
    id v10 = 0;
  }
  else {
    id v10 = a7;
  }
  if ((id)*MEMORY[0x1E4F1D260] == a6) {
    id v11 = 0;
  }
  else {
    id v11 = a6;
  }
  _NSKVO1AdaptorDeliver((uint64_t)self->super._LHSobservable, (uint64_t)self->super._RHSobserver, self->emitsChanges, (uint64_t)v10, (uint64_t)v11, a8, a5, (uint64_t)a3, (uint64_t)a4);
}

- (_NSKVO1Adaptor)initWithObservable:(id)a3 observer:(id)a4 keyPath:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_NSKVO1Adaptor;
  v8 = [(_NSKVO1Adaptor *)&v12 init];
  if (v8)
  {
    v8->super._RHSobserver = (NSObserver *)a4;
    v8->super._LHSobservable = (NSObservable *)a3;
    if ([(NSObserver *)v8->super._RHSobserver conformsToProtocol:&unk_1ECACD308]) {
      [(NSObserver *)v8->super._RHSobserver setObservation:v8];
    }
    int v9 = [a5 _wantsChanges];
    v8->emitsChanges = v9;
    if (v9) {
      uint64_t v10 = 39;
    }
    else {
      uint64_t v10 = 37;
    }
    [(NSObservable *)v8->super._LHSobservable addObserver:v8 forKeyPath:*((void *)a5 + 2) options:v10 context:&internalObservationContext];
    v8->kp = (NSObservableKeyPath *)a5;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_NSKVO1Adaptor;
  BOOL v5 = -[_NSConcreteObservation isEqual:](&v7, sel_isEqual_);
  if (v5) {
    LOBYTE(v5) = (objc_opt_isKindOfClass() & 1) != 0
  }
              && [(NSBoundKeyPath *)self->kp isEqual:*((void *)a3 + 7)];
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (void)_setEmitsChanges:(BOOL)a3
{
  self->emitsChanges = a3;
}

- (void)remove
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:](self->super._LHSobservable, "removeObservation:forObservableKeyPath:", self);

    self->kp = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSKVO1Adaptor;
  [(_NSConcreteObservation *)&v3 remove];
}

- (void)finishObserving
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->kp)
  {
    -[NSObservable removeObservation:forObservableKeyPath:](self->super._LHSobservable, "removeObservation:forObservableKeyPath:", self);

    self->kp = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSKVO1Adaptor;
  [(_NSConcreteObservation *)&v3 finishObserving];
}

@end