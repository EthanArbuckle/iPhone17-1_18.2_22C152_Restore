@interface NTKSpectrumAnalogColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)domain;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)isPrideOption;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
- (unint64_t)color;
@end

@implementation NTKSpectrumAnalogColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKSpectrumAnalogColorEditOption *)self _value];
}

- (BOOL)isPrideOption
{
  return (char *)[(NTKSpectrumAnalogColorEditOption *)self color] == "ics";
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v5] && !NTKGizmoOrCompanionAreRussian())
  {

    goto LABEL_6;
  }
  unint64_t v6 = [(NTKSpectrumAnalogColorEditOption *)self color];

  if (v6 != 3011)
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
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16E50);
  id WeakRetained = objc_loadWeakRetained(&qword_16E58);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_16E58);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_16E58, v4);
    qword_16E60 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_16E48;
    qword_16E48 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_16E60;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16E50);
  id v13 = (id)qword_16E48;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___NTKSpectrumAnalogColorEditOption;
  unint64_t v6 = objc_msgSendSuper2(&v19, "__orderedValuesForDevice:", v4);
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [v5 count];
  while ((int)v7 >= 1)
  {
    id v8 = [v5 objectAtIndex:--v7];
    unsigned int v9 = [v8 isEqual:&off_10C90];

    if (v9) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  [v5 removeObject:&off_10C90];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v10])
  {
    char v11 = NTKGizmoOrCompanionAreRussian();

    if ((v11 & 1) == 0) {
      [v5 insertObject:&off_10CA8 atIndex:v7];
    }
  }
  else
  {
  }
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  unsigned int v13 = [v4 supportsCapability:v12];

  if (v13)
  {
    [v5 insertObject:&off_10CC0 atIndex:v7];
    [v5 insertObject:&off_10CD8 atIndex:v7];
    [v5 insertObject:&off_10CF0 atIndex:v7];
    [v5 insertObject:&off_10D08 atIndex:v7];
    [v5 insertObject:&off_10D20 atIndex:v7];
  }
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v15 = [v4 supportsCapability:v14];

  if (v15)
  {
    [v5 insertObject:&off_10D38 atIndex:v7];
    [v5 insertObject:&off_10D50 atIndex:v7];
    [v5 insertObject:&off_10D68 atIndex:v7];
  }
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  unsigned int v17 = [v4 supportsCapability:v16];

  if (v17)
  {
    [v5 insertObject:&off_10D80 atIndex:v7];
    [v5 insertObject:&off_10D98 atIndex:v7];
    [v5 insertObject:&off_10DB0 atIndex:v7];
    [v5 insertObject:&off_10DC8 atIndex:v7];
  }
  [v5 insertObject:&off_10DE0 atIndex:v7];
  [v5 insertObject:&off_10DF8 atIndex:v7];
  [v5 insertObject:&off_10E10 atIndex:v7];
  [v5 insertObject:&off_10E28 atIndex:v7];

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 0xBB8uLL:
      unint64_t v6 = @"dual-tone-1";
      break;
    case 0xBB9uLL:
      unint64_t v6 = @"dual-tone-2";
      break;
    case 0xBBAuLL:
      unint64_t v6 = @"dual-tone-3";
      break;
    case 0xBBBuLL:
      unint64_t v6 = @"dual-tone-4";
      break;
    case 0xBBCuLL:
      unint64_t v6 = @"dual-tone-5";
      break;
    case 0xBBDuLL:
      unint64_t v6 = @"dual-tone-6";
      break;
    case 0xBBEuLL:
      unint64_t v6 = @"dual-tone-7";
      break;
    case 0xBBFuLL:
      unint64_t v6 = @"dual-tone-8";
      break;
    case 0xBC0uLL:
      unint64_t v6 = @"dual-tone-9";
      break;
    case 0xBC1uLL:
      unint64_t v6 = @"dual-tone-10";
      break;
    case 0xBC2uLL:
      unint64_t v6 = @"dual-tone-11";
      break;
    case 0xBC3uLL:
      unint64_t v6 = @"multicolor-1";
      break;
    case 0xBC4uLL:
      unint64_t v6 = @"dual-tone-12";
      break;
    case 0xBC5uLL:
      unint64_t v6 = @"dual-tone-13";
      break;
    case 0xBC6uLL:
      unint64_t v6 = @"dual-tone-14";
      break;
    case 0xBC7uLL:
      unint64_t v6 = @"dual-tone-15";
      break;
    case 0xBC8uLL:
      unint64_t v6 = @"dual-tone-16";
      break;
    default:
      if (a3 == 7)
      {
        unint64_t v6 = 0;
      }
      else
      {
        unint64_t v6 = +[NTKFaceColorEditOption _snapshotKeyForValue:a3 forDevice:v5];
      }
      break;
  }

  return v6;
}

- (id)localizedName
{
  v2 = [(NTKSpectrumAnalogColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_82EC;
  block[3] = &unk_105E8;
  block[4] = self;
  if (qword_16E70 != -1) {
    dispatch_once(&qword_16E70, block);
  }
  return (id)qword_16E68;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (id)pigmentEditOption
{
  id v3 = NTKColorPaletteDomainGradient;
  switch([(NTKSpectrumAnalogColorEditOption *)self color])
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
    case 0xBC4uLL:
    case 0xBC5uLL:
    case 0xBC6uLL:
    case 0xBC7uLL:
    case 0xBC8uLL:
      NTKFaceColorNameForDuotones();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 0xBC3uLL:
      id v5 = +[NTKPigmentEditOption pigmentNamed:ntk_special_rainbow];
      id v4 = 0;
      break;
    default:
      [(NTKSpectrumAnalogColorEditOption *)self color];
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
  return NTKColorPaletteDomainGradient;
}

@end