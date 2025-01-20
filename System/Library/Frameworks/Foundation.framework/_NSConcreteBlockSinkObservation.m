@interface _NSConcreteBlockSinkObservation
- (BOOL)isEqual:(id)a3;
- (_NSConcreteBlockSinkObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5;
- (id)_observerStorage;
- (id)debugDescription;
- (void)_observerStorageOfSize:(unint64_t)a3;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)remove;
@end

@implementation _NSConcreteBlockSinkObservation

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 && (NSObservable *)*((void *)a3 + 1) == self->_LHSobservable) {
    return (id)*((void *)a3 + 2) == self->_block;
  }
  return 0;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  return 0;
}

- (id)_observerStorage
{
  return 0;
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@(%p) (%@ => %@)", objc_opt_class(), self, -[NSObservable debugDescription](self->_LHSobservable, "debugDescription"), [self->_block debugDescription]);
}

- (_NSConcreteBlockSinkObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_NSConcreteBlockSinkObservation;
  v8 = [(_NSConcreteBlockSinkObservation *)&v10 init];
  if (v8)
  {
    v8->_block = (id)[a4 copy];
    v8->_LHSobservable = (NSObservable *)a3;
    v8->_tag = a5;
  }
  return v8;
}

- (void)remove
{
  LHSobservable = self->_LHSobservable;
  if (LHSobservable)
  {
    self->_LHSobservable = 0;
    id block = self->_block;
    self->_id block = 0;
    v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, LHSobservable, 0);
    v5 = v4;
    if (v4) {
      removeObservation((uint64_t)v4, (uint64_t)self);
    }
  }
}

- (void)_receiveBox:(id)a3
{
  if ((NSObservable *)*((void *)a3 + 2) == self->_LHSobservable)
  {
    int v3 = *((_DWORD *)a3 + 6);
    int tag = self->_tag;
    if (v3 != tag || tag == 3)
    {
      if (v3 == 3) {
        [(_NSConcreteBlockSinkObservation *)self finishObserving];
      }
    }
    else
    {
      (*((void (**)(void))self->_block + 2))();
    }
  }
  else
  {
    -[NSObservable _receiveBox:](self->_LHSobservable, "_receiveBox:");
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_NSConcreteBlockSinkObservation *)self remove];
  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteBlockSinkObservation;
  [(_NSConcreteBlockSinkObservation *)&v3 dealloc];
}

@end