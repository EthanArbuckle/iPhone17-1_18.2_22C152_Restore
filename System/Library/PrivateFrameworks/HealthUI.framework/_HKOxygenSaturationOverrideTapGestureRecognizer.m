@interface _HKOxygenSaturationOverrideTapGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_HKOxygenSaturationOverrideTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation _HKOxygenSaturationOverrideTapGestureRecognizer

- (_HKOxygenSaturationOverrideTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_HKOxygenSaturationOverrideTapGestureRecognizer;
  v4 = [(_HKOxygenSaturationOverrideTapGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(_HKOxygenSaturationOverrideTapGestureRecognizer *)v4 setNumberOfTapsRequired:3];
    [(_HKOxygenSaturationOverrideTapGestureRecognizer *)v5 setDelegate:v5];
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [v5 view];
  v8 = [v6 view];

  if (v7 == v8)
  {
    char v10 = 1;
  }
  else
  {
    v9 = [v5 view];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass() ^ 1;
  }
  return v10 & 1;
}

@end