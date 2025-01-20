@interface ZoomUI_UIAlertControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ZoomUI_UIAlertControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIAlertController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v65[2] = *MEMORY[0x263EF8340];
  v63.receiver = self;
  v63.super_class = (Class)ZoomUI_UIAlertControllerOverride;
  [(ZoomUI_UIAlertControllerOverride *)&v63 viewDidAppear:a3];
  v4 = [(ZoomUI_UIAlertControllerOverride *)self safeValueForKey:@"view"];
  v5 = [v4 safeValueForKey:@"_contentView"];
  v6 = [v4 safeValueForKey:@"window"];
  if (v5)
  {
    v7 = [v5 safeValueForKey:@"bounds"];
    [v7 CGRectValue];
    uint64_t v9 = v8;
    uint64_t v11 = v10;

    uint64_t v57 = 0;
    v58 = (double *)&v57;
    uint64_t v59 = 0x4010000000;
    v60 = &unk_2401841CA;
    long long v61 = 0u;
    long long v62 = 0u;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __50__ZoomUI_UIAlertControllerOverride_viewDidAppear___block_invoke;
    v50[3] = &unk_26509D9B8;
    v53 = &v57;
    id v12 = v6;
    id v51 = v12;
    uint64_t v54 = v9;
    uint64_t v55 = v11;
    __asm { FMOV            V0.2D, #2.0 }
    long long v56 = _Q0;
    id v52 = v5;
    soft_AXPerformSafeBlock(v50);
    uint64_t v18 = *((void *)v58 + 4);
    uint64_t v19 = *((void *)v58 + 5);
    uint64_t v20 = *((void *)v58 + 6);
    uint64_t v21 = *((void *)v58 + 7);

    _Block_object_dispose(&v57, 8);
    uint64_t v57 = 0;
    v58 = (double *)&v57;
    uint64_t v59 = 0x4010000000;
    v60 = &unk_2401841CA;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v40 = MEMORY[0x263EF8330];
    uint64_t v41 = 3221225472;
    v42 = __50__ZoomUI_UIAlertControllerOverride_viewDidAppear___block_invoke_2;
    v43 = &unk_26509D9E0;
    v45 = &v57;
    id v22 = v12;
    id v44 = v22;
    uint64_t v46 = v18;
    uint64_t v47 = v19;
    uint64_t v48 = v20;
    uint64_t v49 = v21;
    soft_AXPerformSafeBlock(&v40);
    double v23 = v58[4];
    double v24 = v58[5];
    double v25 = v58[6];
    double v26 = v58[7];

    _Block_object_dispose(&v57, 8);
    double v27 = soft_AXUIConvertRectFromScreenToContextSpace(v22, v23, v24, v25, v26);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    id v34 = objc_alloc(MEMORY[0x263F089F8]);
    v64[0] = @"frame";
    v35 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v27, v29, v31, v33, v40, v41, v42, v43);
    v64[1] = @"contextId";
    v65[0] = v35;
    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v22, "_contextId"));
    v65[1] = v36;
    v37 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
    v38 = (void *)[v34 initWithName:@"ZoomUIAleartWillAppearNotification" object:0 userInfo:v37];

    v39 = [MEMORY[0x263F08A00] defaultCenter];
    [v39 postNotification:v38];
  }
}

@end