@interface NTKDigitalSecondsGraphicCircularExtraLargeView
+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3;
+ (int64_t)_filterStyle;
@end

@implementation NTKDigitalSecondsGraphicCircularExtraLargeView

+ ($58D15C9700E10FDF418FBC0C790388C2)_layoutConstantsForDevice:(SEL)a3
{
  id v4 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_181F0);
  id WeakRetained = objc_loadWeakRetained(&qword_181F8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_181F8);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_181F8, v4);
    qword_18200 = (uint64_t)[v4 version];

    sub_AF94(v11, v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_18200;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_181F0);

  return result;
}

+ (int64_t)_filterStyle
{
  return 0;
}

@end