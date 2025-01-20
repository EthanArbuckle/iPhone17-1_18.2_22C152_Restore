@interface UIPinchGestureRecognizer
+ (void)addPinchGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5;
@end

@implementation UIPinchGestureRecognizer

+ (void)addPinchGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:v7 action:a5];

  [v8 addGestureRecognizer:v9];
}

@end