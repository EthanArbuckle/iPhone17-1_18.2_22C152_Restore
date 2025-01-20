@interface ACTTouchEvent
- (ACTTouchEvent)initWithTouchEvent:(id)a3;
- (TIKeyboardTouchEvent)touchEvent;
- (id)description;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTTouchEvent

- (ACTTouchEvent)initWithTouchEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACTTouchEvent;
  v6 = [(ACTTouchEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_touchEvent, a3);
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(ACTTouchEvent *)self touchEvent];
  v6 = +[NSString stringWithFormat:@"<%@: touchEvent=%@>", v4, v5];

  return v6;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ACTTouchEvent *)self touchEvent];
  id v8 = [v9 _performTouchEvent:v7 typingLog:v6];
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void).cxx_destruct
{
}

@end