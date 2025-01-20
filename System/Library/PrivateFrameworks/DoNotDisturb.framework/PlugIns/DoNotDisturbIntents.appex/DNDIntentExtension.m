@interface DNDIntentExtension
- (id)handlerForIntent:(id)a3;
@end

@implementation DNDIntentExtension

- (id)handlerForIntent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = &off_100004150;
LABEL_6:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v4 = off_100004140;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = off_100004148;
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

@end