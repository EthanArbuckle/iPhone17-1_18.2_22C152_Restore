@interface SBHIconGridSizeClassDomain
@end

@implementation SBHIconGridSizeClassDomain

void __74__SBHIconGridSizeClassDomain_ControlCenterUIServices__controlCenterDomain__block_invoke()
{
  v36[9] = *MEMORY[0x263EF8340];
  id v15 = objc_alloc(MEMORY[0x263F79200]);
  v35[0] = @"CCUIIconGridSizeClassSmall";
  uint64_t v1 = *MEMORY[0x263F79308];
  v32[0] = *MEMORY[0x263F79300];
  uint64_t v0 = v32[0];
  v32[1] = v1;
  v34[0] = @"small";
  v34[1] = @"S";
  uint64_t v33 = *MEMORY[0x263F792F8];
  uint64_t v2 = v33;
  v34[2] = @"small";
  v14 = [NSDictionary dictionaryWithObjects:v34 forKeys:v32 count:3];
  v36[0] = v14;
  v35[1] = @"CCUIIconGridSizeClassSmallTall";
  v30[0] = v0;
  v30[1] = v1;
  v31[0] = @"smallTall";
  v31[1] = @"ST";
  v30[2] = v2;
  v31[2] = @"smallTall";
  v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  v36[1] = v13;
  v35[2] = @"CCUIIconGridSizeClassSmallWide";
  v28[0] = v0;
  v28[1] = v1;
  v29[0] = @"smallWide";
  v29[1] = @"SW";
  v28[2] = v2;
  v29[2] = @"smallWide";
  v3 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v36[2] = v3;
  v35[3] = @"CCUIIconGridSizeClassSmallExtraWide";
  v26[0] = v0;
  v26[1] = v1;
  v27[0] = @"smallExtraWide";
  v27[1] = @"SXW";
  v26[2] = v2;
  v27[2] = @"smallExtraWide";
  v4 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  v36[3] = v4;
  v35[4] = @"CCUIIconGridSizeClassMedium";
  v24[0] = v0;
  v24[1] = v1;
  v25[0] = @"medium";
  v25[1] = @"M";
  v24[2] = v2;
  v25[2] = @"medium";
  v5 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  v36[4] = v5;
  v35[5] = @"CCUIIconGridSizeClassMediumWide";
  v22[0] = v0;
  v22[1] = v1;
  v23[0] = @"mediumWide";
  v23[1] = @"MW";
  v22[2] = v2;
  v23[2] = @"mediumWide";
  v6 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v36[5] = v6;
  v35[6] = @"CCUIIconGridSizeClassLarge";
  v20[0] = v0;
  v20[1] = v1;
  v21[0] = @"large";
  v21[1] = @"L";
  v20[2] = v2;
  v21[2] = @"large";
  v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v36[6] = v7;
  v35[7] = @"CCUIIconGridSizeClassLargeTall";
  v18[0] = v0;
  v18[1] = v1;
  v19[0] = @"largeTall";
  v19[1] = @"LT";
  v18[2] = v2;
  v19[2] = @"largeTall";
  v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v36[7] = v8;
  v35[8] = @"CCUIIconGridSizeClassLargeExtraTall";
  v16[0] = v0;
  v16[1] = v1;
  v17[0] = @"largeExtraTall";
  v17[1] = @"LXT";
  v16[2] = v2;
  v17[2] = @"largeExtraTall";
  v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  v36[8] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:9];

  uint64_t v11 = [v15 initWithGridSizeClasses:v10];
  v12 = (void *)controlCenterDomain_controlCenterDomain;
  controlCenterDomain_controlCenterDomain = v11;
}

@end