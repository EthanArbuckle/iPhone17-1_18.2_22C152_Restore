@interface NSISVariableObservation
- (NSISVariableObservation)initWithVariable:(id)a3;
- (void)dealloc;
- (void)emitValueIfNeededWithEngine:(id)a3;
- (void)valueWasDirtied;
@end

@implementation NSISVariableObservation

- (void)emitValueIfNeededWithEngine:(id)a3
{
  if (self->_valueIsDirtied)
  {
    double v8 = 0.0;
    if (![a3 hasValue:&v8 forVariable:self->_variable])
    {
      self->_double lastValue = NAN;
      BOOL v7 = 1;
LABEL_12:
      self->_valueIsDirtied = v7;
      return;
    }
    double lastValue = self->_lastValue;
    if (lastValue == 0.0)
    {
      double v6 = fabs(v8);
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
      double v6 = fabs(lastValue);
    }
    if (v6 < *(double *)&NSISEpsilon)
    {
LABEL_9:
      BOOL v7 = 0;
      self->_double lastValue = v8;
      goto LABEL_12;
    }
LABEL_11:
    self->_double lastValue = v8;
    [(NSISVariableDelegate *)[(NSISVariable *)self->_variable delegate] nsis_valueOfVariable:self->_variable didChangeInEngine:a3];
    BOOL v7 = 0;
    goto LABEL_12;
  }
}

- (void)valueWasDirtied
{
  self->_valueIsDirtied = 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSISVariableObservation;
  [(NSISVariableObservation *)&v3 dealloc];
}

- (NSISVariableObservation)initWithVariable:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSISVariableObservation;
  v4 = [(NSISVariableObservation *)&v6 init];
  if (v4)
  {
    v4->_variable = (NSISVariable *)a3;
    v4->_double lastValue = NAN;
  }
  return v4;
}

@end