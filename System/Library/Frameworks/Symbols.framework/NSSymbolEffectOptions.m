@interface NSSymbolEffectOptions
+ (BOOL)supportsSecureCoding;
+ (NSSymbolEffectOptions)options;
+ (NSSymbolEffectOptions)optionsWithNonRepeating;
+ (NSSymbolEffectOptions)optionsWithRepeatBehavior:(id)a3;
+ (NSSymbolEffectOptions)optionsWithRepeatCount:(NSInteger)count;
+ (NSSymbolEffectOptions)optionsWithRepeatCount:(int64_t)a3 delay:(double)a4;
+ (NSSymbolEffectOptions)optionsWithRepeating;
+ (NSSymbolEffectOptions)optionsWithRepeatingDelay:(double)a3;
+ (NSSymbolEffectOptions)optionsWithSpeed:(double)speed;
+ (id)_optionsWithRepeatStyle:(id)a3;
- (BOOL)_prefersContinuous;
- (NSNumber)_repeatDelay;
- (NSSymbolEffectOptions)initWithCoder:(id)a3;
- (NSSymbolEffectOptions)optionsWithNonRepeating;
- (NSSymbolEffectOptions)optionsWithRepeatBehavior:(id)a3;
- (NSSymbolEffectOptions)optionsWithRepeatCount:(NSInteger)count;
- (NSSymbolEffectOptions)optionsWithRepeatCount:(int64_t)a3 delay:(double)a4;
- (NSSymbolEffectOptions)optionsWithRepeating;
- (NSSymbolEffectOptions)optionsWithRepeatingDelay:(double)a3;
- (NSSymbolEffectOptions)optionsWithSpeed:(double)speed;
- (double)_speed;
- (id)_optionsWithRepeatStyle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_repeatBehavior;
- (int64_t)_repeatCount;
- (void)encodeWithCoder:(id)a3;
- (void)set_prefersContinuous:(BOOL)a3;
- (void)set_repeatBehavior:(int64_t)a3;
- (void)set_repeatCount:(int64_t)a3;
- (void)set_repeatDelay:(id)a3;
- (void)set_speed:(double)a3;
@end

@implementation NSSymbolEffectOptions

+ (NSSymbolEffectOptions)options
{
  v2 = objc_opt_new();
  objc_msgSend(v2, "set_speed:", 1.0);
  objc_msgSend(v2, "set_repeatBehavior:", 0);
  objc_msgSend(v2, "set_prefersContinuous:", 0);
  objc_msgSend(v2, "set_repeatCount:", 1);
  objc_msgSend(v2, "set_repeatDelay:", 0);

  return (NSSymbolEffectOptions *)v2;
}

+ (NSSymbolEffectOptions)optionsWithRepeating
{
  v2 = [a1 options];
  objc_msgSend(v2, "set_repeatBehavior:", 1);

  return (NSSymbolEffectOptions *)v2;
}

- (NSSymbolEffectOptions)optionsWithRepeating
{
  id v2 = [(NSSymbolEffectOptions *)self copyWithZone:0];
  objc_msgSend(v2, "set_repeatBehavior:", 1);
  objc_msgSend(v2, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v2;
}

+ (NSSymbolEffectOptions)optionsWithNonRepeating
{
  id v2 = [a1 options];
  objc_msgSend(v2, "set_repeatBehavior:", 2);

  return (NSSymbolEffectOptions *)v2;
}

- (NSSymbolEffectOptions)optionsWithNonRepeating
{
  id v2 = [(NSSymbolEffectOptions *)self copyWithZone:0];
  objc_msgSend(v2, "set_repeatBehavior:", 2);
  objc_msgSend(v2, "set_repeatCount:", 1);
  objc_msgSend(v2, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v2;
}

+ (NSSymbolEffectOptions)optionsWithRepeatCount:(NSInteger)count
{
  v4 = [a1 options];
  objc_msgSend(v4, "set_repeatBehavior:", 2);
  objc_msgSend(v4, "set_repeatCount:", count);

  return (NSSymbolEffectOptions *)v4;
}

- (NSSymbolEffectOptions)optionsWithRepeatCount:(NSInteger)count
{
  id v4 = [(NSSymbolEffectOptions *)self copyWithZone:0];
  objc_msgSend(v4, "set_repeatBehavior:", 2);
  objc_msgSend(v4, "set_repeatCount:", count);
  objc_msgSend(v4, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v4;
}

+ (NSSymbolEffectOptions)optionsWithSpeed:(double)speed
{
  id v4 = [a1 options];
  objc_msgSend(v4, "set_speed:", speed);

  return (NSSymbolEffectOptions *)v4;
}

- (NSSymbolEffectOptions)optionsWithSpeed:(double)speed
{
  id v4 = [(NSSymbolEffectOptions *)self copyWithZone:0];
  objc_msgSend(v4, "set_speed:", speed);

  return (NSSymbolEffectOptions *)v4;
}

+ (NSSymbolEffectOptions)optionsWithRepeatingDelay:(double)a3
{
  id v4 = [a1 options];
  objc_msgSend(v4, "set_repeatBehavior:", 1);
  v5 = [NSNumber numberWithDouble:a3];
  objc_msgSend(v4, "set_repeatDelay:", v5);

  objc_msgSend(v4, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v4;
}

- (NSSymbolEffectOptions)optionsWithRepeatingDelay:(double)a3
{
  id v4 = [(NSSymbolEffectOptions *)self copyWithZone:0];
  objc_msgSend(v4, "set_repeatBehavior:", 1);
  v5 = [NSNumber numberWithDouble:a3];
  objc_msgSend(v4, "set_repeatDelay:", v5);

  objc_msgSend(v4, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v4;
}

+ (NSSymbolEffectOptions)optionsWithRepeatCount:(int64_t)a3 delay:(double)a4
{
  v6 = [a1 options];
  objc_msgSend(v6, "set_repeatBehavior:", 2);
  objc_msgSend(v6, "set_repeatCount:", a3);
  v7 = [NSNumber numberWithDouble:a4];
  objc_msgSend(v6, "set_repeatDelay:", v7);

  objc_msgSend(v6, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v6;
}

- (NSSymbolEffectOptions)optionsWithRepeatCount:(int64_t)a3 delay:(double)a4
{
  id v6 = [(NSSymbolEffectOptions *)self copyWithZone:0];
  objc_msgSend(v6, "set_repeatBehavior:", 2);
  objc_msgSend(v6, "set_repeatCount:", a3);
  v7 = [NSNumber numberWithDouble:a4];
  objc_msgSend(v6, "set_repeatDelay:", v7);

  objc_msgSend(v6, "set_prefersContinuous:", 0);

  return (NSSymbolEffectOptions *)v6;
}

+ (id)_optionsWithRepeatStyle:(id)a3
{
  id v4 = [a3 _backing];
  v5 = [a1 optionsWithRepeatBehavior:v4];

  return v5;
}

- (id)_optionsWithRepeatStyle:(id)a3
{
  id v4 = [a3 _backing];
  v5 = [(NSSymbolEffectOptions *)self optionsWithRepeatBehavior:v4];

  return v5;
}

+ (NSSymbolEffectOptions)optionsWithRepeatBehavior:(id)a3
{
  id v4 = a3;
  v5 = [a1 options];
  objc_msgSend(v5, "set_repeatBehavior:", objc_msgSend(v4, "_repeatBehavior"));
  objc_msgSend(v5, "set_repeatCount:", objc_msgSend(v4, "_repeatCount"));
  id v6 = [v4 _repeatDelay];
  objc_msgSend(v5, "set_repeatDelay:", v6);

  uint64_t v7 = [v4 _prefersContinuous];
  objc_msgSend(v5, "set_prefersContinuous:", v7);

  return (NSSymbolEffectOptions *)v5;
}

- (NSSymbolEffectOptions)optionsWithRepeatBehavior:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(NSSymbolEffectOptions *)self copy];
  objc_msgSend(v5, "set_repeatBehavior:", objc_msgSend(v4, "_repeatBehavior"));
  objc_msgSend(v5, "set_repeatCount:", objc_msgSend(v4, "_repeatCount"));
  id v6 = [v4 _repeatDelay];
  objc_msgSend(v5, "set_repeatDelay:", v6);

  uint64_t v7 = [v4 _prefersContinuous];
  objc_msgSend(v5, "set_prefersContinuous:", v7);

  return (NSSymbolEffectOptions *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() options];
  [(NSSymbolEffectOptions *)self _speed];
  objc_msgSend(v4, "set_speed:");
  objc_msgSend(v4, "set_prefersContinuous:", -[NSSymbolEffectOptions _prefersContinuous](self, "_prefersContinuous"));
  objc_msgSend(v4, "set_repeatBehavior:", -[NSSymbolEffectOptions _repeatBehavior](self, "_repeatBehavior"));
  objc_msgSend(v4, "set_repeatCount:", -[NSSymbolEffectOptions _repeatCount](self, "_repeatCount"));
  v5 = [(NSSymbolEffectOptions *)self _repeatDelay];
  id v6 = (void *)[v5 copyWithZone:0];
  objc_msgSend(v4, "set_repeatDelay:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(NSSymbolEffectOptions *)self _speed];
  objc_msgSend(v5, "encodeDouble:forKey:", @"_speed");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptions _repeatBehavior](self, "_repeatBehavior"), @"_repeatBehavior");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptions _repeatCount](self, "_repeatCount"), @"_repeatCount");
  id v4 = [(NSSymbolEffectOptions *)self _repeatDelay];
  [v5 encodeObject:v4 forKey:@"_repeatDelay"];

  objc_msgSend(v5, "encodeBool:forKey:", -[NSSymbolEffectOptions _prefersContinuous](self, "_prefersContinuous"), @"_prefersContinuous");
}

- (NSSymbolEffectOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (NSSymbolEffectOptions *)objc_opt_new();

  if (v5)
  {
    [v4 decodeDoubleForKey:@"_speed"];
    -[NSSymbolEffectOptions set_speed:](v5, "set_speed:");
    -[NSSymbolEffectOptions set_repeatBehavior:](v5, "set_repeatBehavior:", [v4 decodeIntegerForKey:@"_repeatBehavior"]);
    -[NSSymbolEffectOptions set_repeatCount:](v5, "set_repeatCount:", [v4 decodeIntegerForKey:@"_repeatCount"]);
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_repeatDelay"];
    [(NSSymbolEffectOptions *)v5 set_repeatDelay:v6];

    if ([v4 containsValueForKey:@"_prefersContinuous"]) {
      uint64_t v7 = [v4 decodeBoolForKey:@"_prefersContinuous"];
    }
    else {
      uint64_t v7 = 0;
    }
    [(NSSymbolEffectOptions *)v5 set_prefersContinuous:v7];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)_speed
{
  return self->_speed;
}

- (void)set_speed:(double)a3
{
  self->_speed = a3;
}

- (int64_t)_repeatBehavior
{
  return self->_repeatBehavior;
}

- (void)set_repeatBehavior:(int64_t)a3
{
  self->_repeatBehavior = a3;
}

- (int64_t)_repeatCount
{
  return self->_repeatCount;
}

- (void)set_repeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (NSNumber)_repeatDelay
{
  return self->_repeatDelay;
}

- (void)set_repeatDelay:(id)a3
{
}

- (BOOL)_prefersContinuous
{
  return self->_prefersContinuous;
}

- (void)set_prefersContinuous:(BOOL)a3
{
  self->_prefersContinuous = a3;
}

- (void).cxx_destruct
{
}

@end