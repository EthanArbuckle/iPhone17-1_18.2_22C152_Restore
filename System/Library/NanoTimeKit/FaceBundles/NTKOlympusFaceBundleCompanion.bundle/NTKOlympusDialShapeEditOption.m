@interface NTKOlympusDialShapeEditOption
+ (id)_orderedValuesForDevice:(id)a3;
@end

@implementation NTKOlympusDialShapeEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12148);
  id WeakRetained = objc_loadWeakRetained(&qword_12150);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_12150);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_12150, v3);
    qword_12158 = (uint64_t)[v3 version];

    v10 = (void *)qword_12140;
    qword_12140 = (uint64_t)&off_CA00;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_12158;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12148);
  id v11 = (id)qword_12140;

  return v11;
}

@end