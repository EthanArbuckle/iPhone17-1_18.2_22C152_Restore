@interface NTKSharkColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
@end

@implementation NTKSharkColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47B60);
  id WeakRetained = objc_loadWeakRetained(&qword_47B68);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_47B68);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_47B68, v4);
    qword_47B70 = (uint64_t)[v4 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_F5A4;
    v13[3] = &unk_389C8;
    v13[4] = a1;
    sub_F5A4((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_47B70;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47B60);
  id v11 = (id)qword_47B58;

  return v11;
}

@end