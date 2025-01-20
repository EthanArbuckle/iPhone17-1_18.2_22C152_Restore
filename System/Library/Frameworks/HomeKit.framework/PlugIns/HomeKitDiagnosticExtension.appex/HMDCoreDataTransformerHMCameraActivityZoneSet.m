@interface HMDCoreDataTransformerHMCameraActivityZoneSet
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDCoreDataTransformerHMCameraActivityZoneSet

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

  if (v7)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = sub_100015814;
    v20 = sub_100015824;
    id v21 = 0;
    +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001582C;
    v13[3] = &unk_10002CA88;
    v15 = &v16;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v8;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
    v9 = (void *)v17[5];
    if (v9)
    {
      id v10 = 0;
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      id v10 = [v8 copy];
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (a4)
    {
      v11 = +[NSString stringWithFormat:@"Expected NSArray value to create NSSet<HMCameraActivityZone>: %@", v5];
      *a4 = +[NSError hmfErrorWithCode:3 reason:v11];
    }
    id v10 = 0;
  }

  return v10;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100015814;
  v20 = sub_100015824;
  id v21 = 0;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100015AA8;
  v13 = &unk_10002CA60;
  v15 = &v16;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v6;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v10);
  id v7 = (void *)v17[5];
  if (v7)
  {
    id v8 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  }

  _Block_object_dispose(&v16, 8);

  return v8;
}

@end