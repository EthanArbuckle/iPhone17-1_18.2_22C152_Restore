@interface MPUFallAnimator
+ (void)animateFallForView:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation MPUFallAnimator

+ (void)animateFallForView:(id)a3 withCompletionHandler:(id)a4
{
  v88[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    v67 = v6;
    v8 = [v5 layer];
    objc_msgSend(v8, "setAnchorPoint:", 0.5, 1.0);
    [v8 position];
    double v10 = v9;
    double v12 = v11;
    [v8 bounds];
    v65 = v8;
    objc_msgSend(v8, "setPosition:", v10, v12 + CGRectGetHeight(v89) * 0.5);
    id v13 = objc_alloc(MEMORY[0x263F1CB60]);
    [v5 bounds];
    v14 = objc_msgSend(v13, "initWithFrame:");
    v15 = [MEMORY[0x263F1C550] blackColor];
    [v14 setBackgroundColor:v15];

    double v16 = 0.0;
    [v14 setAlpha:0.0];
    id v68 = v5;
    v63 = v14;
    [v5 addSubview:v14];
    v17 = objc_alloc_init(_MPUFallAnimatorDynamicItem);
    -[_MPUFallAnimatorDynamicItem setBounds:](v17, "setBounds:", 0.0, 0.0, 5.0, 100.0);
    -[_MPUFallAnimatorDynamicItem setCenter:](v17, "setCenter:", 50.0, 100.0);
    long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v82.m11 = *MEMORY[0x263F000D0];
    *(_OWORD *)&v82.m13 = v18;
    *(_OWORD *)&v82.m21 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(_MPUFallAnimatorDynamicItem *)v17 setTransform:&v82];
    v19 = objc_alloc_init(_MPUFallAnimatorDynamicSystem);
    [(_MPUFallAnimatorDynamicSystem *)v19 bounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    v66 = v19;
    v28 = (void *)[objc_alloc(MEMORY[0x263F1C608]) initWithReferenceSystem:v19];
    [v28 _setAlwaysDisableDisplayLink:1];
    id v29 = objc_alloc(MEMORY[0x263F1C690]);
    v88[0] = v17;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:1];
    uint64_t v31 = [v29 initWithItems:v30];

    v64 = (void *)v31;
    [v28 addBehavior:v31];
    id v32 = objc_alloc(MEMORY[0x263F1C540]);
    v87 = v17;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
    v34 = (void *)[v32 initWithItems:v33];

    v90.origin.x = v21;
    v90.origin.y = v23;
    v90.size.width = v25;
    v90.size.height = v27;
    double MinX = CGRectGetMinX(v90);
    v91.origin.x = 0.0;
    v91.origin.y = 0.0;
    v91.size.width = 5.0;
    v91.size.height = 100.0;
    CGFloat v36 = CGRectGetHeight(v91) * 0.5 + 100.0;
    v92.origin.x = v21;
    v92.origin.y = v23;
    v92.size.width = v25;
    v92.size.height = v27;
    double MaxX = CGRectGetMaxX(v92);
    v93.origin.x = 0.0;
    v93.origin.y = 0.0;
    v93.size.width = 5.0;
    v93.size.height = 100.0;
    objc_msgSend(v34, "addBoundaryWithIdentifier:fromPoint:toPoint:", @"floor", MinX, v36, MaxX, CGRectGetHeight(v93) * 0.5 + 100.0);
    v62 = v34;
    [v28 addBehavior:v34];
    id v38 = objc_alloc(MEMORY[0x263F1C8E8]);
    v86 = v17;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
    v40 = (void *)[v38 initWithItems:v39 mode:1];

    objc_msgSend(v40, "setTargetPoint:forItem:", v17, 0.0, 5.0);
    [v40 setXComponent:1.0 yComponent:0.0];
    v61 = v40;
    [v28 addBehavior:v40];
    id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    long double v43 = 0.0;
    long double v44 = 0.0;
    if (v17)
    {
      [(_MPUFallAnimatorDynamicItem *)v17 transform];
      long double v44 = *((double *)&v83 + 1);
      long double v43 = *(double *)&v83;
    }
    double v45 = atan2(v44, v43);
    if (v45 >= -1.57079633)
    {
      long double v46 = v45;
      long long v74 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      long long v75 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      CGFloat v47 = *(double *)(MEMORY[0x263F15740] + 80);
      long long v72 = *MEMORY[0x263F15740];
      long long v73 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      long long v70 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      long long v71 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      long long v69 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      long long v48 = 0uLL;
      do
      {
        *(_OWORD *)&v81.m21 = v75;
        *(_OWORD *)&v81.m23 = v74;
        *(_OWORD *)&v81.m31 = v73;
        *(_OWORD *)&v81.m11 = v72;
        *(_OWORD *)&v81.m13 = v71;
        *(_OWORD *)&v81.m41 = v70;
        *(_OWORD *)&v81.m43 = v69;
        *(_OWORD *)&v82.m41 = v48;
        *(_OWORD *)&v82.m43 = v48;
        *(_OWORD *)&v82.m31 = v48;
        *(_OWORD *)&v82.m33 = v48;
        *(_OWORD *)&v82.m21 = v48;
        *(_OWORD *)&v82.m23 = v48;
        *(_OWORD *)&v82.m11 = v48;
        *(_OWORD *)&v82.m13 = v48;
        v81.m33 = v47;
        v81.m34 = -0.004;
        CATransform3DRotate(&v82, &v81, v46, 1.0, 0.0, 0.0);
        CATransform3D v81 = v82;
        v49 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v81];
        [v41 addObject:v49];

        v50 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(fmax(v46 / -1.57079633 * 0.8, 0.0), 1.0));
        [v42 addObject:v50];

        char v51 = [v28 _animatorStep:0.0166666667];
        if (v17) {
          [(_MPUFallAnimatorDynamicItem *)v17 transform];
        }
        else {
          memset(&v81, 0, 48);
        }
        double v16 = v16 + 0.0166666667;
        long long v83 = *(_OWORD *)&v81.m11;
        long long v84 = *(_OWORD *)&v81.m13;
        long long v85 = *(_OWORD *)&v81.m21;
        long double v46 = atan2(v81.m12, v81.m11);
        if (v46 >= -1.57079633) {
          char v52 = v51;
        }
        else {
          char v52 = 0;
        }
        long long v48 = 0uLL;
      }
      while ((v52 & 1) != 0);
    }
    [v28 removeAllBehaviors];
    [MEMORY[0x263F158F8] begin];
    v53 = (void *)MEMORY[0x263F158F8];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __60__MPUFallAnimator_animateFallForView_withCompletionHandler___block_invoke;
    v77[3] = &unk_2647D0C40;
    id v78 = v63;
    id v79 = v65;
    v7 = v67;
    id v80 = v67;
    id v76 = v65;
    id v54 = v63;
    [v53 setCompletionBlock:v77];
    v55 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
    [v55 setValues:v41];
    UIAnimationDragCoefficient();
    [v55 setDuration:v16 * v56];
    uint64_t v57 = *MEMORY[0x263F15AA8];
    [v55 setFillMode:*MEMORY[0x263F15AA8]];
    [v55 setRemovedOnCompletion:0];
    [v76 addAnimation:v55 forKey:@"fallingAnimation"];
    v58 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v58 setValues:v42];
    UIAnimationDragCoefficient();
    [v58 setDuration:v16 * v59];
    [v58 setFillMode:v57];
    [v58 setRemovedOnCompletion:0];
    v60 = [v54 layer];
    [v60 addAnimation:v58 forKey:@"fallingAnimation"];

    [MEMORY[0x263F158F8] commit];
    id v5 = v68;
  }
  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

uint64_t __60__MPUFallAnimator_animateFallForView_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  objc_msgSend(*(id *)(a1 + 40), "setAnchorPoint:", 0.5, 0.5);
  v2 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v8[0] = *MEMORY[0x263F15740];
  v8[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v8[3] = v6;
  [v2 setTransform:v8];
  [*(id *)(a1 + 40) removeAnimationForKey:@"fallingAnimation"];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end