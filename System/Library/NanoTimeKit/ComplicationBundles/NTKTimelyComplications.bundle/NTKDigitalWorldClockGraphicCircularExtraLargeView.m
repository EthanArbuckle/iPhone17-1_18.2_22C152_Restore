@interface NTKDigitalWorldClockGraphicCircularExtraLargeView
+ ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstantsForDevice:(SEL)a3;
@end

@implementation NTKDigitalWorldClockGraphicCircularExtraLargeView

+ ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstantsForDevice:(SEL)a3
{
  id obj = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18110);
  id WeakRetained = objc_loadWeakRetained(&qword_18118);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&qword_18118);
    if (v7 == obj)
    {
      id v8 = [obj version];
      uint64_t v9 = qword_18120;

      if (v8 == (id)v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_18118, obj);
  qword_18120 = (uint64_t)[obj version];

  sub_77E8(v11, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18110);
  float64x2_t v12 = xmmword_180E0;
  *(_OWORD *)&retstr->var0 = xmmword_180D0;
  *(float64x2_t *)&retstr->var2 = v12;
  float64x2_t v13 = xmmword_18100;
  *(_OWORD *)&retstr->var4 = xmmword_180F0;
  *(float64x2_t *)&retstr->var6 = v13;

  return result;
}

@end