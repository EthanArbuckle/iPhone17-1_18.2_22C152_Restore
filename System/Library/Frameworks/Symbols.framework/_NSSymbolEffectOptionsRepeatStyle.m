@interface _NSSymbolEffectOptionsRepeatStyle
+ (BOOL)supportsSecureCoding;
+ (id)style;
+ (id)styleContinuous;
+ (id)stylePeriodic;
+ (id)stylePeriodicWithCount:(int64_t)a3;
+ (id)stylePeriodicWithCount:(int64_t)a3 delay:(double)a4;
+ (id)stylePeriodicWithDelay:(double)a3;
- (NSSymbolEffectOptionsRepeatBehavior)_backing;
- (_NSSymbolEffectOptionsRepeatStyle)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_backing:(id)a3;
@end

@implementation _NSSymbolEffectOptionsRepeatStyle

+ (id)style
{
  v2 = objc_opt_new();
  uint64_t v3 = +[NSSymbolEffectOptionsRepeatBehavior behavior];
  v4 = (void *)v2[1];
  v2[1] = v3;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  uint64_t v5 = [(NSSymbolEffectOptionsRepeatBehavior *)self->_backing copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  backing = self->_backing;
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatBehavior](backing, "_repeatBehavior"), @"_repeatBehavior");
  objc_msgSend(v6, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatCount](self->_backing, "_repeatCount"), @"_repeatCount");
  uint64_t v5 = [(NSSymbolEffectOptionsRepeatBehavior *)self->_backing _repeatDelay];
  [v6 encodeObject:v5 forKey:@"_repeatDelay"];

  objc_msgSend(v6, "encodeBool:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _prefersContinuous](self->_backing, "_prefersContinuous"), @"_prefersContinuous");
}

- (_NSSymbolEffectOptionsRepeatStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = objc_opt_new();

  if (v5
    && (id v6 = [[NSSymbolEffectOptionsRepeatBehavior alloc] initWithCoder:v4]) != 0)
  {
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)styleContinuous
{
  v2 = objc_opt_new();
  uint64_t v3 = +[NSSymbolEffectOptionsRepeatBehavior behaviorContinuous];
  id v4 = (void *)v2[1];
  v2[1] = v3;

  return v2;
}

+ (id)stylePeriodic
{
  v2 = objc_opt_new();
  uint64_t v3 = +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodic];
  id v4 = (void *)v2[1];
  v2[1] = v3;

  return v2;
}

+ (id)stylePeriodicWithCount:(int64_t)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodicWithCount:a3];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)stylePeriodicWithDelay:(double)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodicWithDelay:a3];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)stylePeriodicWithCount:(int64_t)a3 delay:(double)a4
{
  id v6 = objc_opt_new();
  uint64_t v7 = +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodicWithCount:a3 delay:a4];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (NSSymbolEffectOptionsRepeatBehavior)_backing
{
  return self->_backing;
}

- (void)set_backing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end