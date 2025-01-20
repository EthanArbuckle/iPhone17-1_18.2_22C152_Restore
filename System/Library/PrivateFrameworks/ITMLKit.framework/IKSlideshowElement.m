@interface IKSlideshowElement
- (NSArray)images;
- (double)transitionInterval;
- (int64_t)showSettings;
- (unint64_t)transition;
@end

@implementation IKSlideshowElement

- (int64_t)showSettings
{
  v3 = objc_opt_class();
  v4 = [(IKViewElement *)self attributes];
  v5 = [v4 objectForKeyedSubscript:@"showSettings"];
  int64_t v6 = objc_msgSend(v3, "ik_valueForBooleanAttribute:", v5);

  return v6;
}

- (NSArray)images
{
  return (NSArray *)[(IKViewElement *)self childElementsWithType:49];
}

- (unint64_t)transition
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 transition];
  unint64_t v4 = +[IKViewElementStyle transitionFromString:v3];

  return v4;
}

- (double)transitionInterval
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 transitionInterval];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

@end