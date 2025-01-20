@interface AVMutableValueTiming
+ (id)allocWithZone:(_NSZone *)a3;
- (Class)classForCoder;
- (void)setAnchorTimeStamp:(double)a3;
- (void)setAnchorValue:(double)a3;
- (void)setRate:(double)a3;
- (void)setValueTiming:(id)a3;
@end

@implementation AVMutableValueTiming

- (void)setRate:(double)a3
{
  v5 = (objc_class *)objc_opt_class();

  AVRequestConcreteImplementation(self, a2, v5);
}

- (void)setAnchorTimeStamp:(double)a3
{
  v5 = (objc_class *)objc_opt_class();

  AVRequestConcreteImplementation(self, a2, v5);
}

- (void)setAnchorValue:(double)a3
{
  v5 = (objc_class *)objc_opt_class();

  AVRequestConcreteImplementation(self, a2, v5);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return +[AVMutableValueTiming allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AVMutableValueTiming;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (void)setValueTiming:(id)a3
{
  id v4 = a3;
  [v4 anchorValue];
  -[AVMutableValueTiming setAnchorValue:](self, "setAnchorValue:");
  [v4 anchorTimeStamp];
  -[AVMutableValueTiming setAnchorTimeStamp:](self, "setAnchorTimeStamp:");
  [v4 rate];
  double v6 = v5;

  [(AVMutableValueTiming *)self setRate:v6];
}

@end