@interface NTKNumeralsAnalogFaceColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
@end

@implementation NTKNumeralsAnalogFaceColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16B58);
  id WeakRetained = objc_loadWeakRetained(&qword_16B60);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_16B60);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_16B60, v4);
    qword_16B68 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_16B50;
    qword_16B50 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_16B68;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16B58);
  id v13 = (id)qword_16B50;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NTKNumeralsAnalogFaceColorEditOption;
  v3 = objc_msgSendSuper2(&v7, "__orderedValuesForDevice:", a3);
  id v4 = [v3 mutableCopy];

  id v5 = [v4 indexOfObject:&off_10E60];
  [v4 removeObject:&off_10E60];
  [v4 insertObject:&off_10E78 atIndex:v5];
  objc_msgSend(v4, "insertObject:atIndex:", &off_10E90, objc_msgSend(v4, "indexOfObject:", &off_10E78));

  return v4;
}

@end