@interface LNMeasurementValueType(CATSupport)
- (__CFString)cat_dialogType;
- (id)cat_value:()CATSupport;
- (uint64_t)cat_keyPath;
@end

@implementation LNMeasurementValueType(CATSupport)

- (uint64_t)cat_keyPath
{
  return 0;
}

- (id)cat_value:()CATSupport
{
  v3 = (objc_class *)MEMORY[0x1E4F28E30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 value];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v5 stringFromMeasurement:v8];

  return v9;
}

- (__CFString)cat_dialogType
{
  return @"dialog.String";
}

@end