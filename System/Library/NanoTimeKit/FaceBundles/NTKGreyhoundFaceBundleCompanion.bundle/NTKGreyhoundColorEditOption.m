@interface NTKGreyhoundColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
@end

@implementation NTKGreyhoundColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1A588);
  id WeakRetained = objc_loadWeakRetained(&qword_1A590);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_1A590);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_1A590, v4);
    qword_1A598 = (uint64_t)[v4 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_904C;
    v13[3] = &unk_14538;
    v13[4] = a1;
    sub_904C((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_1A598;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1A588);
  id v11 = (id)qword_1A580;

  return v11;
}

@end