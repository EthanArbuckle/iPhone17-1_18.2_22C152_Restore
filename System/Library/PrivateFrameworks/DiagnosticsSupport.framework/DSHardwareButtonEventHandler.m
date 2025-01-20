@interface DSHardwareButtonEventHandler
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandler:(id)a3;
- (BOOL)preventPropagation;
- (SEL)action;
- (id)target;
- (unint64_t)events;
- (void)setAction:(SEL)a3;
- (void)setEvents:(unint64_t)a3;
- (void)setPreventPropagation:(BOOL)a3;
- (void)setTarget:(id)a3;
@end

@implementation DSHardwareButtonEventHandler

- (BOOL)isEqualToHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(DSHardwareButtonEventHandler *)self target];
    v6 = [v4 target];

    v7 = [(DSHardwareButtonEventHandler *)self action];
    uint64_t v8 = [v4 action];
    BOOL v9 = [(DSHardwareButtonEventHandler *)self preventPropagation];
    char v10 = [v4 preventPropagation];
    unint64_t v11 = [(DSHardwareButtonEventHandler *)self events];
    BOOL v12 = (v11 == [v4 events]) & ~(v9 ^ v10);
    if (v7 != (const char *)v8) {
      BOOL v12 = 0;
    }
    BOOL v13 = v5 == v6 && v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DSHardwareButtonEventHandler *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(DSHardwareButtonEventHandler *)self isEqualToHandler:v4];
  }

  return v5;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (BOOL)preventPropagation
{
  return self->_preventPropagation;
}

- (void)setPreventPropagation:(BOOL)a3
{
  self->_preventPropagation = a3;
}

- (unint64_t)events
{
  return self->_events;
}

- (void)setEvents:(unint64_t)a3
{
  self->_events = a3;
}

- (void).cxx_destruct
{
}

@end