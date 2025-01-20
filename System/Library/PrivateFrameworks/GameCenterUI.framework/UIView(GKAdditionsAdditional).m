@interface UIView(GKAdditionsAdditional)
- (__CFString)_gkAncestryAffectingVisualLayout;
- (id)_gkAncestryDescription;
- (id)_gkRecursiveDescriptionForKey:()GKAdditionsAdditional depth:;
- (id)_gkRecursiveDescriptionForValue:()GKAdditionsAdditional forKey:depth:;
- (uint64_t)_gkRecursiveDescriptionForKey:()GKAdditionsAdditional;
- (uint64_t)_gkRecursiveDescriptionForValue:()GKAdditionsAdditional forKey:;
- (void)_gkRecursivelyApplyBlock:()GKAdditionsAdditional depth:;
@end

@implementation UIView(GKAdditionsAdditional)

- (void)_gkRecursivelyApplyBlock:()GKAdditionsAdditional depth:
{
  v6 = a3;
  v6[2](v6, a1, a4);
  uint64_t v7 = a4 + 1;
  v8 = [a1 subviews];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__UIView_GKAdditionsAdditional___gkRecursivelyApplyBlock_depth___block_invoke;
  v10[3] = &unk_1E5F63080;
  id v11 = v6;
  uint64_t v12 = v7;
  v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (uint64_t)_gkRecursiveDescriptionForKey:()GKAdditionsAdditional
{
  return [a1 _gkRecursiveDescriptionForKey:a3 depth:0];
}

- (id)_gkRecursiveDescriptionForKey:()GKAdditionsAdditional depth:
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28E78] string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForKey_depth___block_invoke;
  v13[3] = &unk_1E5F630A8;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [a1 _gkRecursivelyApplyBlock:v13 depth:a4];
  v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)_gkRecursiveDescriptionForValue:()GKAdditionsAdditional forKey:depth:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28E78] string];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForValue_forKey_depth___block_invoke;
  v17[3] = &unk_1E5F630D0;
  id v18 = v9;
  id v19 = v8;
  id v11 = v10;
  id v20 = v11;
  id v12 = v8;
  id v13 = v9;
  [a1 _gkRecursivelyApplyBlock:v17 depth:a5];
  id v14 = v20;
  id v15 = v11;

  return v15;
}

- (uint64_t)_gkRecursiveDescriptionForValue:()GKAdditionsAdditional forKey:
{
  return [a1 _gkRecursiveDescriptionForValue:a3 forKey:a4 depth:0];
}

- (id)_gkAncestryDescription
{
  v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:32];
  id v3 = a1;
  if (v3)
  {
    v4 = v3;
    do
    {
      v5 = [NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), v4];
      [v2 addObject:v5];

      uint64_t v6 = [v4 superview];

      v4 = (void *)v6;
    }
    while (v6);
  }
  uint64_t v7 = [v2 componentsJoinedByString:@" -> "];

  return v7;
}

- (__CFString)_gkAncestryAffectingVisualLayout
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1B3E83AA0]();
  v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:32];
  id v3 = a1;
  if (v3)
  {
    v4 = v3;
    double v59 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v60 = *MEMORY[0x1E4F1DAD8];
    do
    {
      [v4 frame];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      double v10 = v9;
      double v12 = v11;
      [v4 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      memset(&v68, 0, sizeof(v68));
      v21 = [v4 layer];
      v22 = v21;
      if (v21) {
        [v21 transform];
      }
      else {
        memset(&v68, 0, sizeof(v68));
      }

      memset(&v67, 0, sizeof(v67));
      v23 = [v4 layer];
      v24 = v23;
      if (v23) {
        [v23 sublayerTransform];
      }
      else {
        memset(&v67, 0, sizeof(v67));
      }

      v25 = NSString;
      uint64_t v26 = objc_opt_class();
      v72.origin.x = v6;
      v72.origin.y = v8;
      v72.size.width = v10;
      v72.size.height = v12;
      v27 = NSStringFromCGRect(v72);
      v28 = [v25 stringWithFormat:@"<%@ %p> frame:%@", v26, v4, v27];

      if (v14 != v60 || v16 != v59 || v18 != v10 || v20 != v12)
      {
        v73.origin.x = v14;
        v73.origin.y = v16;
        v73.size.width = v18;
        v73.size.height = v20;
        v29 = NSStringFromCGRect(v73);
        uint64_t v30 = [v28 stringByAppendingFormat:@" bounds:%@", v29];

        v28 = (void *)v30;
      }
      v31 = [v4 layer];
      [v31 zPosition];
      double v33 = v32;

      if (v33 != 0.0)
      {
        v34 = [v4 layer];
        [v34 zPosition];
        uint64_t v36 = objc_msgSend(v28, "stringByAppendingFormat:", @" zPos:%g", v35);

        v28 = (void *)v36;
      }
      CATransform3D v66 = v68;
      if (!CATransform3DIsIdentity(&v66))
      {
        CATransform3D v66 = v68;
        v37 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v66];
        uint64_t v38 = [v28 stringByAppendingFormat:@" transform:%@", v37];

        v28 = (void *)v38;
      }
      CATransform3D v66 = v67;
      if (!CATransform3DIsIdentity(&v66))
      {
        CATransform3D v66 = v67;
        v39 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v66];
        uint64_t v40 = [v28 stringByAppendingFormat:@" sublayerTransform:%@", v39];

        v28 = (void *)v40;
      }
      v41 = [v4 layer];
      v42 = [v41 animationKeys];

      if ([v42 count])
      {
        v43 = [v42 componentsJoinedByString:@", "];
        uint64_t v44 = [v28 stringByAppendingFormat:@" animations:%@", v43];

        v28 = (void *)v44;
      }
      [v2 addObject:v28];
      uint64_t v45 = [v4 superview];

      v4 = (void *)v45;
    }
    while (v45);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v61 = v2;
  v46 = [v2 reverseObjectEnumerator];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    v49 = &stru_1F07B2408;
    uint64_t v50 = *(void *)v63;
    v51 = &stru_1F07B2408;
    do
    {
      uint64_t v52 = 0;
      v53 = v49;
      do
      {
        if (*(void *)v63 != v50) {
          objc_enumerationMutation(v46);
        }
        uint64_t v54 = *(void *)(*((void *)&v62 + 1) + 8 * v52);
        v55 = [(__CFString *)v51 stringByAppendingString:v53];

        v56 = [v55 stringByAppendingString:v54];

        v51 = [v56 stringByAppendingString:@"\n"];

        v49 = [(__CFString *)v53 stringByAppendingString:@" "];

        ++v52;
        v53 = v49;
      }
      while (v48 != v52);
      uint64_t v48 = [v46 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v48);
  }
  else
  {
    v49 = &stru_1F07B2408;
    v51 = &stru_1F07B2408;
  }

  return v51;
}

@end