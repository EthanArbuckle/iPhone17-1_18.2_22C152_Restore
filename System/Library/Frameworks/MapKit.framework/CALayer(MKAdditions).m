@interface CALayer(MKAdditions)
- (id)_mapKit_mapLayer;
- (id)currentLayer;
- (uint64_t)getPresentationValue:()MKAdditions forKey:removeAnimation:;
- (uint64_t)getPresentationValue:()MKAdditions forValueKey:animationKey:removeAnimation:;
- (void)_mapkit_addAnimation:()MKAdditions forKey:completion:;
- (void)_mapkit_removeAnimationImmediatelyForKey:()MKAdditions;
- (void)_mapkit_setActionsToRemoveDefaultImplicitActions;
@end

@implementation CALayer(MKAdditions)

- (id)_mapKit_mapLayer
{
  if (!_mapKit_mapLayer_mapViewClass) {
    _mapKit_mapLayer_mapViewClass = objc_opt_class();
  }
  id v2 = a1;
  do
  {
    v3 = CALayerGetDelegate();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      break;
    }
    uint64_t v5 = CALayerGetSuperlayer();

    id v2 = (id)v5;
  }
  while (v5);

  return v2;
}

- (void)_mapkit_setActionsToRemoveDefaultImplicitActions
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bounds";
  id v2 = [MEMORY[0x1E4F1CA98] null];
  v10[0] = v2;
  v9[1] = @"position";
  v3 = [MEMORY[0x1E4F1CA98] null];
  v10[1] = v3;
  v9[2] = @"cornerRadius";
  v4 = [MEMORY[0x1E4F1CA98] null];
  v10[2] = v4;
  v9[3] = @"transform";
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  v10[3] = v5;
  v9[4] = @"hidden";
  v6 = [MEMORY[0x1E4F1CA98] null];
  v10[4] = v6;
  v9[5] = @"shadowOpacity";
  v7 = [MEMORY[0x1E4F1CA98] null];
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  [a1 setActions:v8];
}

- (void)_mapkit_addAnimation:()MKAdditions forKey:completion:
{
  id v8 = a4;
  id v10 = a3;
  v9 = +[MKCALayerCompletionDelegate delegateWithCompletion:a5];
  [v10 setDelegate:v9];

  [a1 addAnimation:v10 forKey:v8];
}

- (id)currentLayer
{
  id v2 = [a1 presentationLayer];
  v3 = v2;
  if (!v2) {
    id v2 = a1;
  }
  id v4 = v2;

  return v4;
}

- (uint64_t)getPresentationValue:()MKAdditions forKey:removeAnimation:
{
  return [a1 getPresentationValue:a3 forValueKey:a4 animationKey:a4 removeAnimation:a5];
}

- (uint64_t)getPresentationValue:()MKAdditions forValueKey:animationKey:removeAnimation:
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [a1 presentationLayer];
  if (v12
    && (v13 = (void *)v12,
        [a1 animationForKey:v11],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    v15 = [a1 presentationLayer];
    if ([v10 isEqualToString:@"doublePosition"])
    {
      [v15 doublePosition];
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29238]), "_mapkit_initWithCADoublePoint:", v16, v17);
    }
    else if ([v10 isEqualToString:@"doubleBounds"])
    {
      [v15 doubleBounds];
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29238]), "_mapkit_initWithCADoubleRect:", v20, v21, v22, v23);
    }
    else
    {
      uint64_t v18 = [v15 valueForKey:v10];
    }
    v24 = (void *)v18;
    if (a6) {
      [a1 removeAnimationForKey:v11];
    }
    if (a3) {
      *a3 = v24;
    }

    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void)_mapkit_removeAnimationImmediatelyForKey:()MKAdditions
{
  id v9 = a3;
  id v4 = objc_msgSend(a1, "animationForKey:");
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 completion];
      id v8 = (void (**)(void, void))[v7 copy];

      [v6 setCompletion:0];
      [a1 removeAnimationForKey:v9];
      if (v8) {
        v8[2](v8, 0);
      }
    }
    else
    {
      [a1 removeAnimationForKey:v9];
    }
  }
}

@end