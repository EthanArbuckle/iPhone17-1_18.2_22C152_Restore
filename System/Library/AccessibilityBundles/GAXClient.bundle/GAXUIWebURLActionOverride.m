@interface GAXUIWebURLActionOverride
+ (BOOL)performDefaultActionForURL:(id)a3 andDOMNode:(id)a4 withAllowedTypes:(unint64_t)a5 forFrame:(id)a6 inView:(id)a7;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation GAXUIWebURLActionOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIWebURLAction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)performDefaultActionForURL:(id)a3 andDOMNode:(id)a4 withAllowedTypes:(unint64_t)a5 forFrame:(id)a6 inView:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = +[GAXClient sharedInstance];
  if ([v16 serverMode] == 2)
  {
    v17 = GAXLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v12;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Guided Access returning NO for perform action for URL: %{public}@", buf, 0xCu);
    }

    [v16 asynchronouslyPresentGuidedAccessActiveBanner];
    unsigned __int8 v18 = 0;
  }
  else
  {
    v20.receiver = a1;
    v20.super_class = (Class)&OBJC_METACLASS___GAXUIWebURLActionOverride;
    unsigned __int8 v18 = objc_msgSendSuper2(&v20, "performDefaultActionForURL:andDOMNode:withAllowedTypes:forFrame:inView:", v12, v13, a5, v14, v15);
  }

  return v18;
}

@end