@interface NTKZeusColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorNameForColorValue:(unint64_t)a3;
+ (id)domain;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
+ (unint64_t)colorCodeForColorName:(id)a3;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKZeusColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 nrDeviceVersion];
  if (v5 >> 17 <= 2)
  {
    if (qword_4CA38 != -1) {
      dispatch_once(&qword_4CA38, &stru_3CB58);
    }
    id v6 = (id)qword_4CA30;
    unsigned __int8 v7 = objc_msgSend(v6, "containsIndex:", -[NTKZeusColorEditOption _value](self, "_value"));

    if (v7) {
      goto LABEL_36;
    }
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  if ([v4 supportsCapability:v8])
  {
  }
  else
  {
    if (qword_4CA48 != -1) {
      dispatch_once(&qword_4CA48, &stru_3CB78);
    }
    id v9 = (id)qword_4CA40;
    unsigned __int8 v10 = objc_msgSend(v9, "containsIndex:", -[NTKZeusColorEditOption _value](self, "_value"));

    if (v10) {
      goto LABEL_36;
    }
  }
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  if ([v4 supportsCapability:v11])
  {
  }
  else
  {
    if (qword_4CA58 != -1) {
      dispatch_once(&qword_4CA58, &stru_3CB98);
    }
    id v12 = (id)qword_4CA50;
    unsigned __int8 v13 = objc_msgSend(v12, "containsIndex:", -[NTKZeusColorEditOption _value](self, "_value"));

    if (v13) {
      goto LABEL_36;
    }
  }
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  if ([v4 supportsCapability:v14])
  {
  }
  else
  {
    if (qword_4CA68 != -1) {
      dispatch_once(&qword_4CA68, &stru_3CBB8);
    }
    id v15 = (id)qword_4CA60;
    unsigned __int8 v16 = objc_msgSend(v15, "containsIndex:", -[NTKZeusColorEditOption _value](self, "_value"));

    if (v16) {
      goto LABEL_36;
    }
  }
  if (v5 >> 9 <= 0x280)
  {
    if (qword_4CA28 != -1) {
      dispatch_once(&qword_4CA28, &stru_3CB38);
    }
    id v17 = (id)qword_4CA20;
    unsigned __int8 v18 = objc_msgSend(v17, "containsIndex:", -[NTKZeusColorEditOption _value](self, "_value"));

    if ((v18 & 1) != 0
      || HIWORD(v5) <= 4u
      && (sub_775C(),
          v19 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v20 = objc_msgSend(v19, "containsIndex:", -[NTKZeusColorEditOption _value](self, "_value")),
          v19,
          (v20 & 1) != 0))
    {
LABEL_36:
      BOOL v24 = 0;
      goto LABEL_37;
    }
  }
  v21 = [(NTKZeusColorEditOption *)self device];
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues() & 1) != 0
    || ([v4 isExplorer] & 1) != 0)
  {
  }
  else
  {
    unint64_t v25 = [(NTKZeusColorEditOption *)self color];

    if (v25 == 104) {
      goto LABEL_36;
    }
  }
  v22 = [(NTKZeusColorEditOption *)self device];
  if ((!NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues()
     || [v4 deviceCategory] == (char *)&dword_0 + 1)
    && ([v4 isZeusBlack] & 1) == 0)
  {
    unint64_t v23 = [(NTKZeusColorEditOption *)self color];

    if (v23 != 3009) {
      goto LABEL_34;
    }
    goto LABEL_36;
  }

LABEL_34:
  BOOL v24 = 1;
LABEL_37:

  return v24;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4C9E8);
  id WeakRetained = objc_loadWeakRetained(&qword_4C9F0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_4C9F0);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_4C9F0, v4);
    qword_4C9F8 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    id v12 = (void *)qword_4C9E0;
    qword_4C9E0 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_4C9F8;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4C9E8);
  id v13 = (id)qword_4C9E0;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 addObject:&off_3EE70];
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues() & 1) != 0
    || [v3 isExplorer])
  {
    [v4 addObject:&off_3EE88];
  }
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues()
    && [v3 deviceCategory] != (char *)&dword_0 + 1
    || [v3 isZeusBlack])
  {
    [v4 addObject:&off_3EEA0];
  }
  if ([v3 deviceCategory] != (char *)&dword_0 + 1) {
    [v4 addObject:&off_3EEB8];
  }
  [v4 addObjectsFromArray:&off_3F9F0];
  if ([v3 deviceCategory] != (char *)&dword_0 + 1) {
    [v4 addObjectsFromArray:&off_3FA08];
  }

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 - 3000 < 0x13 && ((0x7FFDFu >> (a3 + 72)) & 1) != 0)
  {
    id v6 = off_3CBD8[a3 - 3000];
  }
  else
  {
    id v6 = +[NTKFaceColorEditOption _snapshotKeyForValue:a3 forDevice:v5];
  }

  return v6;
}

- (id)localizedName
{
  v2 = [(NTKZeusColorEditOption *)self pigmentEditOption];
  id v3 = [v2 localizedName];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_4CA08 != -1) {
    dispatch_once(&qword_4CA08, &stru_3CAF8);
  }
  v2 = (void *)qword_4CA00;

  return v2;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (id)pigmentEditOption
{
  v2 = objc_msgSend((id)objc_opt_class(), "colorNameForColorValue:", -[NTKZeusColorEditOption _value](self, "_value"));
  id v3 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v2 collectionName:@"zeus"];

  return v3;
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  id v3 = 0;
  if ((uint64_t)a3 <= 2999)
  {
    CFStringRef v4 = @"orangeDial";
    CFStringRef v5 = @"rougeHands";
    if (a3 != 104) {
      CFStringRef v5 = 0;
    }
    if (a3 != 102) {
      CFStringRef v4 = v5;
    }
    if (a3 == 7) {
      id v3 = @"orange";
    }
    else {
      id v3 = (__CFString *)v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xBB8uLL:
      case 0xBB9uLL:
      case 0xBBAuLL:
      case 0xBBBuLL:
      case 0xBBCuLL:
      case 0xBC2uLL:
        NTKNameForDuotones();
        id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 0xBBEuLL:
        id v3 = @"encre";
        break;
      case 0xBBFuLL:
        id v3 = @"etain";
        break;
      case 0xBC0uLL:
        id v3 = @"brique";
        break;
      case 0xBC1uLL:
        id v3 = @"noir";
        break;
      case 0xBC3uLL:
        id v3 = @"blanc";
        break;
      case 0xBC4uLL:
        id v3 = @"rougePiment";
        break;
      case 0xBC5uLL:
        id v3 = @"jauneAmbre";
        break;
      case 0xBC6uLL:
        id v3 = @"bambou";
        break;
      case 0xBC7uLL:
        id v3 = @"navy";
        break;
      case 0xBC8uLL:
        id v3 = @"anemone";
        break;
      case 0xBC9uLL:
        id v3 = @"argent";
        break;
      case 0xBCAuLL:
        id v3 = @"roseMexico";
        break;
      default:
        break;
    }
  }

  return v3;
}

+ (unint64_t)colorCodeForColorName:(id)a3
{
  id v4 = a3;
  id v5 = [&off_3FA20 mutableCopy];
  uint64_t v6 = 3000;
  do
  {
    id v7 = +[NSNumber numberWithInt:v6];
    [v5 addObject:v7];

    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 3019);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    id v12 = &dword_4 + 3;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_msgSend(a1, "colorNameForColorValue:", objc_msgSend(v14, "integerValue", (void)v18));
        unsigned __int8 v16 = [v15 isEqualToString:v4];

        if (v16)
        {
          id v12 = [v14 integerValue];
          goto LABEL_14;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = &dword_4 + 3;
  }
LABEL_14:

  return (unint64_t)v12;
}

+ (id)domain
{
  return NTKColorPaletteDomainZeusAnalog;
}

@end