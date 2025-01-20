@interface NTKCollieColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (id)_valueToFaceBundleStringDict;
- (id)pigmentEditOption;
@end

@implementation NTKCollieColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2F7C8);
  id WeakRetained = objc_loadWeakRetained(&qword_2F7D0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_2F7D0);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_2F7D0, v4);
    qword_2F7D8 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_2F7C0;
    qword_2F7C0 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_2F7D8;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2F7C8);
  id v13 = (id)qword_2F7C0;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  v3 = +[NTKFaceColorEditOption _orderedValuesForDevice:a3];
  id v4 = [v3 mutableCopy];

  id v5 = [v4 indexOfObject:&off_29E30];
  [v4 removeObject:&off_29E30];
  [v4 insertObject:&off_29E48 atIndex:v5];
  [v4 insertObject:&off_29E60 atIndex:v5];
  [v4 insertObject:&off_29E78 atIndex:v5];

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 200)
  {
    v6 = @"collie-dark-gray";
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKCollieColorEditOption;
    objc_msgSendSuper2(&v8, "_snapshotKeyForValue:forDevice:", a3, a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11FE0;
  block[3] = &unk_28950;
  block[4] = self;
  if (qword_2F7E8 != -1) {
    dispatch_once(&qword_2F7E8, block);
  }
  return (id)qword_2F7E0;
}

- (id)pigmentEditOption
{
  v3 = (char *)[(NTKCollieColorEditOption *)self faceColor];
  if ((unint64_t)(v3 - 200) >= 2)
  {
    if (v3 == (unsigned char *)&dword_18 + 2)
    {
      id v5 = objc_alloc((Class)NTKPigmentEditOption);
      v6 = NTKFaceColorName();
      id v7 = [v5 initWithOptionName:v6 collectionName:ntk_seasons];

      goto LABEL_7;
    }
    v9.receiver = self;
    v9.super_class = (Class)NTKCollieColorEditOption;
    id v4 = [(NTKCollieColorEditOption *)&v9 pigmentEditOption];
  }
  else
  {
    id v4 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:@"darkGray" collectionName:@"memoji"];
  }
  id v7 = v4;
LABEL_7:

  return v7;
}

+ (id)pigmentFaceDomain
{
  return @"memoji";
}

@end