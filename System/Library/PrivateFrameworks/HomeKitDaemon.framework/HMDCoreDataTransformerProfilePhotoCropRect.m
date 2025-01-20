@interface HMDCoreDataTransformerProfilePhotoCropRect
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerProfilePhotoCropRect

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "hmf_numberForKey:", @"x");
    [v9 floatValue];
    double v11 = v10;
    v12 = objc_msgSend(v8, "hmf_numberForKey:", @"y");
    [v12 floatValue];
    double v14 = v13;
    v15 = objc_msgSend(v8, "hmf_numberForKey:", @"w");
    [v15 floatValue];
    double v17 = v16;
    v18 = objc_msgSend(v8, "hmf_numberForKey:", @"h");
    [v18 floatValue];
    double v20 = v19;

    objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v11, v14, v17, v20);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    v22 = [NSString stringWithFormat:@"Expected NSDictionary value to create crop rect value: %@", v5];
    *a4 = [v21 hmfErrorWithCode:3 reason:v22];

    a4 = 0;
  }

  return a4;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  v26[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    [v5 rectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v25[0] = @"x";
    *(float *)&double v13 = v13;
    double v14 = [NSNumber numberWithFloat:v13];
    v26[0] = v14;
    v25[1] = @"y";
    *(float *)&double v15 = v8;
    float v16 = [NSNumber numberWithFloat:v15];
    v26[1] = v16;
    v25[2] = @"w";
    *(float *)&double v17 = v10;
    v18 = [NSNumber numberWithFloat:v17];
    v26[2] = v18;
    v25[3] = @"h";
    *(float *)&double v19 = v12;
    double v20 = [NSNumber numberWithFloat:v19];
    v26[3] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  }
  else
  {
    if (a4)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      v23 = [NSString stringWithFormat:@"Invalid crop rect value: %@", 0];
      *a4 = [v22 hmfErrorWithCode:3 reason:v23];
    }
    v21 = 0;
  }

  return v21;
}

@end