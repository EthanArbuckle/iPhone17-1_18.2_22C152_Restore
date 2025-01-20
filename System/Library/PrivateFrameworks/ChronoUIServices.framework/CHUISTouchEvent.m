@interface CHUISTouchEvent
- (BOOL)baseContentTouchedDown;
- (BOOL)isEqual:(id)a3;
- (CHUISTouchEvent)initWithBaseContentTouchedDown:(BOOL)a3;
- (unint64_t)hash;
@end

@implementation CHUISTouchEvent

- (CHUISTouchEvent)initWithBaseContentTouchedDown:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHUISTouchEvent;
  result = [(CHUISTouchEvent *)&v5 init];
  if (result) {
    result->_baseContentTouchedDown = a3;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_baseContentTouchedDown;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[8] == self->_baseContentTouchedDown;

  return v5;
}

- (BOOL)baseContentTouchedDown
{
  return self->_baseContentTouchedDown;
}

@end