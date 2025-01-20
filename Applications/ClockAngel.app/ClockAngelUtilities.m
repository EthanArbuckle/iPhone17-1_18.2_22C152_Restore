@interface ClockAngelUtilities
+ (double)radFromDeg:(double)a3;
+ (id)mtOrange;
+ (void)updateTimerWithID:(id)a3 toState:(unint64_t)a4 withManager:(id)a5;
@end

@implementation ClockAngelUtilities

+ (id)mtOrange
{
  return +[UIColor systemOrangeColor];
}

+ (double)radFromDeg:(double)a3
{
  return a3 * 0.0174532925;
}

+ (void)updateTimerWithID:(id)a3 toState:(unint64_t)a4 withManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v8 timers];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000033F0;
  v17[3] = &unk_1000B2890;
  id v18 = v7;
  id v10 = v7;
  v11 = [v9 flatMap:v17];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000034F8;
  v14[3] = &unk_1000B28B8;
  id v15 = v8;
  unint64_t v16 = a4;
  id v12 = v8;
  id v13 = [v11 addSuccessBlock:v14];
}

@end