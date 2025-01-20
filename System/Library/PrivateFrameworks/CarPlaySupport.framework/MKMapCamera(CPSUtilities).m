@interface MKMapCamera(CPSUtilities)
+ (id)_CPS_cameraForRegion:()CPSUtilities withSize:;
@end

@implementation MKMapCamera(CPSUtilities)

+ (id)_CPS_cameraForRegion:()CPSUtilities withSize:
{
  double v22 = a3;
  unint64_t v23 = a4.n128_u64[0];
  unint64_t v24 = a5.n128_u64[0];
  unint64_t v25 = a6.n128_u64[0];
  double v20 = a7;
  double v21 = a8;
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  double v14 = MEMORY[0x230F4C320]((__n128)*(unint64_t *)&a3, a4, a5, a6);
  double v15 = v8;
  double v16 = v9;
  double v17 = v10;
  id v13 = (id)objc_msgSend(MEMORY[0x263F10940], "_cameraLookingAtMapRect:forViewSize:", v14, v8, v9, v10, v20, v21);
  id v12 = v13;
  objc_storeStrong(&v13, 0);

  return v12;
}

@end