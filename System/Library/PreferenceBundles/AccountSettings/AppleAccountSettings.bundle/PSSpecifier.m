@interface PSSpecifier
- (BOOL)aaui_startSpinner;
- (BOOL)aaui_stopSpinner;
- (SEL)_aaui_selectorForKey:(id)a3;
- (id)aaui_performSuperGetter;
- (void)aaui_overrideAccessorsWithTarget:(id)a3 getter:(SEL)a4 setter:(SEL)a5;
- (void)aaui_performSuperSetterWithValue:(id)a3;
@end

@implementation PSSpecifier

- (BOOL)aaui_startSpinner
{
  return +[AAUIPSSpecifier _startSpinnerWithSpecifier:self];
}

- (BOOL)aaui_stopSpinner
{
  return +[AAUIPSSpecifier _stopSpinnerWithSpecifier:self];
}

- (void)aaui_overrideAccessorsWithTarget:(id)a3 getter:(SEL)a4 setter:(SEL)a5
{
  id v14 = a3;
  v8 = [(PSSpecifier *)self propertyForKey:@"_aaui_overridenTarget"];
  if (!v8)
  {
    v9 = [(PSSpecifier *)self target];
    [(PSSpecifier *)self setProperty:v9 forKey:@"_aaui_overridenTarget"];
  }
  v10 = [(PSSpecifier *)self propertyForKey:@"_aaui_overridenGetter"];
  if (!v10)
  {
    v11 = NSStringFromSelector(*(SEL *)((char *)self + OBJC_IVAR___PSSpecifier_getter));
    [(PSSpecifier *)self setProperty:v11 forKey:@"_aaui_overridenGetter"];
  }
  v12 = [(PSSpecifier *)self propertyForKey:@"_aaui_overridenSetter"];
  if (!v12)
  {
    v13 = NSStringFromSelector(*(SEL *)((char *)self + OBJC_IVAR___PSSpecifier_setter));
    [(PSSpecifier *)self setProperty:v13 forKey:@"_aaui_overridenSetter"];
  }
  [(PSSpecifier *)self setTarget:v14];
  *(void *)((char *)self + OBJC_IVAR___PSSpecifier_getter) = a4;
  *(void *)((char *)self + OBJC_IVAR___PSSpecifier_setter) = a5;
}

- (id)aaui_performSuperGetter
{
  v3 = [(PSSpecifier *)self propertyForKey:@"_aaui_overridenTarget"];
  v4 = [(PSSpecifier *)self _aaui_selectorForKey:@"_aaui_overridenGetter"];
  if (v4 && (v5 = v4, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v6 = ((void (*)(void *, const char *, PSSpecifier *))[v3 methodForSelector:v5])(v3, v5, self);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)aaui_performSuperSetterWithValue:(id)a3
{
  id v7 = a3;
  v4 = [(PSSpecifier *)self propertyForKey:@"_aaui_overridenTarget"];
  v5 = [(PSSpecifier *)self _aaui_selectorForKey:@"_aaui_overridenSetter"];
  if (v5)
  {
    v6 = v5;
    if (objc_opt_respondsToSelector()) {
      ((void (*)(void *, const char *, id, PSSpecifier *))[v4 methodForSelector:v6])(v4, v6, v7, self);
    }
  }
}

- (SEL)_aaui_selectorForKey:(id)a3
{
  v3 = [(PSSpecifier *)self propertyForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = NSSelectorFromString(v3);
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end