@interface NTKExtragalacticFontLoader
+ (id)extragalacticFontDescriptor;
+ (id)extragalacticFontForDevice:(id)a3;
@end

@implementation NTKExtragalacticFontLoader

+ (id)extragalacticFontForDevice:(id)a3
{
  id v4 = a3;
  v5 = [a1 extragalacticFontDescriptor];
  v6 = (void *)MEMORY[0x263EFD198];
  id v7 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D4418);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D4420);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    id v10 = objc_loadWeakRetained(&qword_2691D4420);
    if (v10 == v7)
    {
      uint64_t v11 = [v7 version];
      uint64_t v12 = qword_2691D4428;

      if (v11 == v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&qword_2691D4420, v7);
  qword_2691D4428 = [v7 version];

  sub_246AF57CC(v14, (uint64_t)v7);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D4418);
  double v15 = *(double *)&qword_2691D4410;

  v16 = [v6 fontWithDescriptor:v5 size:v15 * 0.5];

  return v16;
}

+ (id)extragalacticFontDescriptor
{
  if (qword_2691D4400 != -1) {
    dispatch_once(&qword_2691D4400, &unk_26FB09198);
  }
  v2 = (void *)qword_2691D4408;

  return v2;
}

@end