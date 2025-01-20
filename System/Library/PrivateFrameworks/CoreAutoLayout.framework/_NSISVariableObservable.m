@interface _NSISVariableObservable
+ (id)observableForVariable:(id)a3 inEngine:(id)a4;
- (BOOL)valueHasChanged;
- (void)dealloc;
- (void)emitValueIfNeeded;
- (void)initWithVariable:(uint64_t)a3 inEngine:;
- (void)receiveObservedValue:(id)a3;
@end

@implementation _NSISVariableObservable

+ (id)observableForVariable:(id)a3 inEngine:(id)a4
{
  v4 = -[_NSISVariableObservable initWithVariable:inEngine:]([_NSISVariableObservable alloc], a3, (uint64_t)a4);
  return v4;
}

- (void)initWithVariable:(uint64_t)a3 inEngine:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_NSISVariableObservable;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[9] = a3;
    v5[8] = a2;
    v6[7] = 0x7FF8000000000000;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSISVariableObservable;
  [(NSObservationSource *)&v3 dealloc];
}

- (void)receiveObservedValue:(id)a3
{
  *((unsigned char *)self + 80) |= 2u;
}

- (BOOL)valueHasChanged
{
  return (*((unsigned __int8 *)self + 80) >> 1) & 1;
}

- (void)emitValueIfNeeded
{
  if ((*((unsigned char *)self + 80) & 2) != 0)
  {
    double v8 = 0.0;
    if (![(NSISEngine *)self->_associatedEngine hasValue:&v8 forVariable:self->_variable])
    {
      self->_double lastValue = NAN;
      char v5 = *((unsigned char *)self + 80) | 2;
LABEL_13:
      *((unsigned char *)self + 80) = v5;
      return;
    }
    double lastValue = self->_lastValue;
    if (lastValue == 0.0)
    {
      double v4 = fabs(v8);
    }
    else
    {
      if (v8 != 0.0)
      {
        if (vabdd_f64(lastValue, v8) < fabs(lastValue) * *(double *)&NSISEpsilon) {
          goto LABEL_9;
        }
        goto LABEL_11;
      }
      double v4 = fabs(lastValue);
    }
    if (v4 < *(double *)&NSISEpsilon)
    {
LABEL_9:
      self->_double lastValue = v8;
LABEL_12:
      char v5 = *((unsigned char *)self + 80) & 0xFD;
      goto LABEL_13;
    }
LABEL_11:
    self->_double lastValue = v8;
    uint64_t v6 = *MEMORY[0x1E4F1CFD0];
    v7.receiver = self;
    v7.super_class = (Class)_NSISVariableObservable;
    [(_NSISVariableObservable *)&v7 receiveObservedValue:v6];
    goto LABEL_12;
  }
}

@end