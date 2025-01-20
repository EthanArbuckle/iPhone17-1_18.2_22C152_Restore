@interface HMDCoreDataTransformerHMCameraActivityZone
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMCameraActivityZone

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
    if ((unint64_t)[v7 count] > 5)
    {
      if (([v8 count] & 1) == 0)
      {
        v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)[v8 count] >> 1);
        if ([v8 count])
        {
          unint64_t v10 = 0;
          do
          {
            v11 = [v8 objectAtIndexedSubscript:v10];
            [v11 floatValue];
            double v13 = v12;
            v14 = [v8 objectAtIndexedSubscript:v10 + 1];
            [v14 floatValue];
            double v16 = v15;

            id v17 = objc_msgSend(objc_alloc((Class)HMPoint), "initWithPoint:", v13, v16);
            [v9 addObject:v17];

            v10 += 2;
          }
          while (v10 < (unint64_t)[v8 count]);
        }
        id v18 = [objc_alloc((Class)HMCameraActivityZone) initWithPoints:v9];
        goto LABEL_18;
      }
      if (a4)
      {
        +[NSString stringWithFormat:@"Expected NSArray of even length to create HMCameraActivityZone: %@", v5];
        goto LABEL_17;
      }
    }
    else if (a4)
    {
      +[NSString stringWithFormat:@"Expected NSArray of at least 6 elements to create HMCameraActivityZone: %@", v5];
      v9 = LABEL_17:;
      +[NSError hmfErrorWithCode:3 reason:v9];
      id v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_20;
    }
  }
  else if (a4)
  {
    +[NSString stringWithFormat:@"Expected NSArray value to create HMCameraActivityZone: %@", v5];
    goto LABEL_17;
  }
  id v18 = 0;
LABEL_20:

  return v18;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableArray);
  v6 = [v4 points];
  id v7 = objc_msgSend(v5, "initWithCapacity:", 2 * (void)objc_msgSend(v6, "count"));

  v8 = [v4 points];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001554C;
  v12[3] = &unk_10002CA38;
  id v13 = v7;
  id v9 = v7;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  id v10 = [v9 copy];

  return v10;
}

@end