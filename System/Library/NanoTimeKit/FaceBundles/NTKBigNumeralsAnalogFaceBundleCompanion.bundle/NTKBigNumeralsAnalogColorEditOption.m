@interface NTKBigNumeralsAnalogColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (BOOL)isPrideOption;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)pigmentEditOption;
- (unint64_t)color;
@end

@implementation NTKBigNumeralsAnalogColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKBigNumeralsAnalogColorEditOption *)self _value];
}

- (BOOL)isPrideOption
{
  return (uint32_t *)[(NTKBigNumeralsAnalogColorEditOption *)self color] == &stru_B88.offset;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v5] && !NTKGizmoOrCompanionAreRussian())
  {

    goto LABEL_6;
  }
  unint64_t v6 = [(NTKBigNumeralsAnalogColorEditOption *)self color];

  if (v6 != 3000)
  {
LABEL_6:
    BOOL v7 = 1;
    goto LABEL_7;
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11560);
  id WeakRetained = objc_loadWeakRetained(&qword_11568);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11568);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_11568, v4);
    qword_11570 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_11558;
    qword_11558 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_11570;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11560);
  id v13 = (id)qword_11558;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v6])
  {
    char v7 = NTKGizmoOrCompanionAreRussian();

    if ((v7 & 1) == 0) {
      [v5 addObjectsFromArray:&off_CD08];
    }
  }
  else
  {
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___NTKBigNumeralsAnalogColorEditOption;
  id v8 = objc_msgSendSuper2(&v10, "__orderedValuesForDevice:", v4);
  [v5 addObjectsFromArray:v8];

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 3000)
  {
    id v6 = @"analog_multicolor_gradient-1";
  }
  else
  {
    +[NTKFaceColorEditOption _snapshotKeyForValue:forDevice:](NTKFaceColorEditOption, "_snapshotKeyForValue:forDevice:", a3, a4, v4);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_754C;
  block[3] = &unk_C3C8;
  block[4] = self;
  if (qword_11580 != -1) {
    dispatch_once(&qword_11580, block);
  }
  return (id)qword_11578;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainNumeralsMono;
}

- (id)pigmentEditOption
{
  if ((uint32_t *)[(NTKBigNumeralsAnalogColorEditOption *)self color] == &stru_B88.offset)
  {
    id v3 = +[NTKPigmentEditOption pigmentNamed:ntk_special_rainbow];
  }
  else
  {
    [(NTKBigNumeralsAnalogColorEditOption *)self color];
    NTKFaceColorNameAndCollection();
    id v4 = 0;
    id v5 = 0;
    id v3 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v4 collectionName:v5];
  }

  return v3;
}

@end