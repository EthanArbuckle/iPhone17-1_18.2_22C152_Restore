@interface QLRoundProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (BOOL)needsDisplayOnBoundsChange;
- (QLRoundProgressLayer)initWithLayer:(id)a3;
@end

@implementation QLRoundProgressLayer

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"progress"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___QLRoundProgressLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (QLRoundProgressLayer)initWithLayer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLRoundProgressLayer;
  unsigned __int8 v5 = [(QLRoundProgressLayer *)&v8 initWithLayer:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 progress];
      -[QLRoundProgressLayer setProgress:](v5, "setProgress:");
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)needsDisplayOnBoundsChange
{
  return 1;
}

@end