@interface ARUICountdownPreCancel
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownPreCancel

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.0;
}

- (BOOL)cancelable
{
  return 0;
}

+ (id)identifier
{
  return @"Pre Cancel";
}

- (id)identifier
{
  v2 = objc_opt_class();

  return (id)[v2 identifier];
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v15 = a4;
  id v5 = a3;
  v6 = [v5 ringGroup];
  [v6 zRotation];
  BOOL v8 = ARUIFloatGreater(v7, 0.0);

  v9 = [v5 ringGroup];
  v10 = v9;
  if (v8)
  {
    [v9 setZRotation:0.0];

    v10 = [v5 ringGroup];
    LODWORD(v11) = 1.0;
    [v10 setPercentage:0 ofRingAtIndex:v11];
  }
  else
  {
    [v9 removeAllAnimations];
  }

  v12 = [v5 ringGroup];

  LODWORD(v13) = 1051931443;
  [v12 setEmptyOpacity:v13];

  v14 = v15;
  if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
    v14 = v15;
  }
}

@end