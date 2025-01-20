@interface NTKDigitalTimeGraphicCircularExtraLargeView
+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3;
+ (int64_t)_filterStyle;
@end

@implementation NTKDigitalTimeGraphicCircularExtraLargeView

+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3
{
  id v4 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18180);
  id WeakRetained = objc_loadWeakRetained(&qword_18188);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_18188);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_18188, v4);
    qword_18190 = (uint64_t)[v4 version];

    sub_9610(v11, v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_18190;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18180);

  return result;
}

+ (int64_t)_filterStyle
{
  return 0;
}

@end