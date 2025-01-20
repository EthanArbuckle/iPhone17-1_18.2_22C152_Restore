@interface NTKTroutColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)curatedColorValuesForDevice:(id)a3;
@end

@implementation NTKTroutColorEditOption

+ (id)curatedColorValuesForDevice:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKTroutColorEditOption;
  v3 = objc_msgSendSuper2(&v6, "curatedColorValuesForDevice:", a3);
  id v4 = [v3 mutableCopy];

  [v4 removeObject:&off_3A9D8];

  return v4;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47E78);
  id WeakRetained = objc_loadWeakRetained(&qword_47E80);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_47E80);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_47E80, v4);
    qword_47E88 = (uint64_t)[v4 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_22140;
    v13[3] = &unk_389C8;
    v13[4] = a1;
    sub_22140((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_47E88;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47E78);
  id v11 = (id)qword_47E70;

  return v11;
}

@end