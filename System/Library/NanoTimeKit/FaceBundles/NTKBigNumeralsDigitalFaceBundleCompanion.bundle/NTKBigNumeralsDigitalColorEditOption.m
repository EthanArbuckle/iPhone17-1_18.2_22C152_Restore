@interface NTKBigNumeralsDigitalColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)domain;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)isPrideOption;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)pigmentEditOption;
- (unint64_t)color;
@end

@implementation NTKBigNumeralsDigitalColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKBigNumeralsDigitalColorEditOption *)self _value];
}

- (BOOL)isPrideOption
{
  return (uint32_t *)[(NTKBigNumeralsDigitalColorEditOption *)self color] == &stru_B88.nreloc;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v5] && !NTKGizmoOrCompanionAreRussian())
  {

    goto LABEL_6;
  }
  unint64_t v6 = [(NTKBigNumeralsDigitalColorEditOption *)self color];

  if (v6 != 3012)
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
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11EA0);
  id WeakRetained = objc_loadWeakRetained(&qword_11EA8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11EA8);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_11EA8, v4);
    qword_11EB0 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_11E98;
    qword_11E98 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_11EB0;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11EA0);
  id v13 = (id)qword_11E98;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 addObjectsFromArray:&off_D508];
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  unsigned int v7 = [v4 supportsCapability:v6];

  if (v7) {
    [v5 addObjectsFromArray:&off_D520];
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v9 = [v4 supportsCapability:v8];

  if (v9) {
    [v5 addObjectsFromArray:&off_D538];
  }
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  unsigned int v11 = [v4 supportsCapability:v10];

  if (v11) {
    [v5 addObjectsFromArray:&off_D550];
  }
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v12])
  {
    char v13 = NTKGizmoOrCompanionAreRussian();

    if ((v13 & 1) == 0) {
      [v5 addObjectsFromArray:&off_D568];
    }
  }
  else
  {
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___NTKBigNumeralsDigitalColorEditOption;
  v14 = objc_msgSendSuper2(&v16, "__orderedValuesForDevice:", v4);
  [v5 addObjectsFromArray:v14];

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 - 3000 >= 0x15)
  {
    id v6 = +[NTKFaceColorEditOption _snapshotKeyForValue:a3 forDevice:v5];
  }
  else
  {
    id v6 = *(&off_C480 + a3 - 3000);
  }

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_67D4;
  block[3] = &unk_C460;
  block[4] = self;
  if (qword_11EC0 != -1) {
    dispatch_once(&qword_11EC0, block);
  }
  return (id)qword_11EB8;
}

- (id)pigmentEditOption
{
  id v3 = ntk_seasons;
  switch([(NTKBigNumeralsDigitalColorEditOption *)self color])
  {
    case 0xBB8uLL:
    case 0xBB9uLL:
    case 0xBBAuLL:
    case 0xBBBuLL:
    case 0xBBCuLL:
    case 0xBBDuLL:
    case 0xBBEuLL:
    case 0xBBFuLL:
    case 0xBC0uLL:
    case 0xBC1uLL:
    case 0xBC2uLL:
    case 0xBC3uLL:
    case 0xBC5uLL:
    case 0xBC6uLL:
    case 0xBC7uLL:
    case 0xBC8uLL:
    case 0xBC9uLL:
    case 0xBCAuLL:
    case 0xBCBuLL:
    case 0xBCCuLL:
      NTKFaceColorNameForDuotones();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 0xBC4uLL:
      id v5 = +[NTKPigmentEditOption pigmentNamed:ntk_special_rainbow];
      id v4 = 0;
      break;
    default:
      [(NTKBigNumeralsDigitalColorEditOption *)self color];
      NTKFaceColorNameAndCollection();
      id v4 = 0;
      id v7 = v3;

      id v3 = v7;
LABEL_5:
      id v5 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v4 collectionName:v3];
      break;
  }

  return v5;
}

+ (id)domain
{
  return NTKColorPaletteDomainNumeralsDuo;
}

@end