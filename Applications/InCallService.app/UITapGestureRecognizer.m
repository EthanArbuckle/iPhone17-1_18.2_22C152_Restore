@interface UITapGestureRecognizer
+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5;
+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 tapCount:(unint64_t)a6;
+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 tapCount:(unint64_t)a6 touchCount:(unint64_t)a7;
@end

@implementation UITapGestureRecognizer

+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:a5];

  [v8 addGestureRecognizer:v9];
}

+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 tapCount:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:a5];

  [v11 setNumberOfTapsRequired:a6];
  [v10 addGestureRecognizer:v11];
}

+ (void)addTapGestureRecognizerToView:(id)a3 withTarget:(id)a4 action:(SEL)a5 tapCount:(unint64_t)a6 touchCount:(unint64_t)a7
{
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v11 action:a5];

  [v13 setNumberOfTapsRequired:a6];
  [v13 setNumberOfTouchesRequired:a7];
  [v12 addGestureRecognizer:v13];
}

@end