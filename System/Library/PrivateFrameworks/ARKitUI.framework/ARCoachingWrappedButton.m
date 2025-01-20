@interface ARCoachingWrappedButton
- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ARCoachingWrappedButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingWrappedButton;
  -[ARCoachingWrappedButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = [(ARCoachingWrappedButton *)self wrapperButton];
  [v5 setHighlighted:v3];
}

- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(ARCoachingWrappedButton *)self wrapperButton];
  [v10 sendAction:a3 to:v9 forEvent:v8];
}

@end