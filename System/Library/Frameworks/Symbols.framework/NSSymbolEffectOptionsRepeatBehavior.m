@interface NSSymbolEffectOptionsRepeatBehavior
+ (BOOL)supportsSecureCoding;
+ (id)behavior;
+ (id)behaviorContinuous;
+ (id)behaviorPeriodic;
+ (id)behaviorPeriodicWithCount:(int64_t)a3;
+ (id)behaviorPeriodicWithCount:(int64_t)a3 delay:(double)a4;
+ (id)behaviorPeriodicWithDelay:(double)a3;
- (BOOL)_prefersContinuous;
- (NSNumber)_repeatDelay;
- (NSSymbolEffectOptionsRepeatBehavior)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_repeatBehavior;
- (int64_t)_repeatCount;
- (void)encodeWithCoder:(id)a3;
- (void)set_prefersContinuous:(BOOL)a3;
- (void)set_repeatBehavior:(int64_t)a3;
- (void)set_repeatCount:(int64_t)a3;
- (void)set_repeatDelay:(id)a3;
@end

@implementation NSSymbolEffectOptionsRepeatBehavior

+ (id)behavior
{
  uint64_t v2 = objc_opt_new();
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 24) = 1;
  *(void *)(v2 + 32) = 0;

  *(void *)(v2 + 16) = 0;
  *(unsigned char *)(v2 + 8) = 0;

  return (id)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  *(void *)(v4 + 24) = [(NSSymbolEffectOptionsRepeatBehavior *)self _repeatCount];
  uint64_t v5 = [(NSSymbolEffectOptionsRepeatBehavior *)self _repeatDelay];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  *(void *)(v4 + 16) = [(NSSymbolEffectOptionsRepeatBehavior *)self _repeatBehavior];
  *(unsigned char *)(v4 + 8) = [(NSSymbolEffectOptionsRepeatBehavior *)self _prefersContinuous];
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatBehavior](self, "_repeatBehavior"), @"_repeatBehavior");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatCount](self, "_repeatCount"), @"_repeatCount");
  uint64_t v4 = [(NSSymbolEffectOptionsRepeatBehavior *)self _repeatDelay];
  [v5 encodeObject:v4 forKey:@"_repeatDelay"];

  objc_msgSend(v5, "encodeBool:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _prefersContinuous](self, "_prefersContinuous"), @"_prefersContinuous");
}

- (NSSymbolEffectOptionsRepeatBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = (NSSymbolEffectOptionsRepeatBehavior *)objc_opt_new();

  if (v5)
  {
    -[NSSymbolEffectOptionsRepeatBehavior set_repeatBehavior:](v5, "set_repeatBehavior:", [v4 decodeIntegerForKey:@"_repeatBehavior"]);
    -[NSSymbolEffectOptionsRepeatBehavior set_repeatCount:](v5, "set_repeatCount:", [v4 decodeIntegerForKey:@"_repeatCount"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_repeatDelay"];
    [(NSSymbolEffectOptionsRepeatBehavior *)v5 set_repeatDelay:v6];

    -[NSSymbolEffectOptionsRepeatBehavior set_prefersContinuous:](v5, "set_prefersContinuous:", [v4 decodeBoolForKey:@"_prefersContinuous"]);
    v7 = v5;
  }

  return v5;
}

+ (id)behaviorContinuous
{
  uint64_t v2 = [a1 behavior];
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 24) = 1;
  *(void *)(v2 + 32) = 0;

  *(void *)(v2 + 16) = 1;
  *(unsigned char *)(v2 + 8) = 1;

  return (id)v2;
}

+ (id)behaviorPeriodic
{
  uint64_t v2 = [a1 behavior];
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 24) = 1;
  *(void *)(v2 + 32) = 0;

  *(void *)(v2 + 16) = 1;
  *(unsigned char *)(v2 + 8) = 0;

  return (id)v2;
}

+ (id)behaviorPeriodicWithCount:(int64_t)a3
{
  uint64_t v4 = [a1 behavior];
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = 0;

  *(void *)(v4 + 16) = 2;
  *(unsigned char *)(v4 + 8) = 0;

  return (id)v4;
}

+ (id)behaviorPeriodicWithDelay:(double)a3
{
  uint64_t v4 = [a1 behavior];
  *(void *)(v4 + 24) = 1;
  uint64_t v5 = [NSNumber numberWithDouble:a3];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  *(void *)(v4 + 16) = 1;
  *(unsigned char *)(v4 + 8) = 0;

  return (id)v4;
}

+ (id)behaviorPeriodicWithCount:(int64_t)a3 delay:(double)a4
{
  uint64_t v6 = [a1 behavior];
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = [NSNumber numberWithDouble:a4];
  v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  *(void *)(v6 + 16) = 2;
  *(unsigned char *)(v6 + 8) = 0;

  return (id)v6;
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