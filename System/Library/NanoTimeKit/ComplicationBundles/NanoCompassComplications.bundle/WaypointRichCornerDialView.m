@interface WaypointRichCornerDialView
- ($F19C7D1BACA455C0923872420114D4F8)_layoutConstantsForDevice:(SEL)a3;
- (id)_symbolSizeAdjustmentsForDevice:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
@end

@implementation WaypointRichCornerDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WaypointRichCornerDialView;
  return [(WaypointBaseRichDialView *)&v4 initFullColorImageViewWithDevice:a3];
}

- (id)monochromeAccentViews
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)monochromeOtherViews
{
  v17[3] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_needleView(self, a2, v2, v3);
  v9 = objc_msgSend_ticksView(self, v6, v7, v8, v5);
  v17[1] = v9;
  v13 = objc_msgSend_waypointView(self, v10, v11, v12);
  v17[2] = v13;
  v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v17, 3);

  return v15;
}

- ($F19C7D1BACA455C0923872420114D4F8)_layoutConstantsForDevice:(SEL)a3
{
  id obj = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268920EC8);
  id WeakRetained = objc_loadWeakRetained(&qword_268920ED0);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&qword_268920ED0);
    if (v7 == obj)
    {
      uint64_t v10 = objc_msgSend_version(obj, (const char *)obj, v8, v9);
      uint64_t v11 = qword_268920ED8;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&qword_268920ED0, obj);
  qword_268920ED8 = objc_msgSend_version(obj, v13, v14, v15);

  sub_2375AB8E4(v16, (const char *)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268920EC8);
  long long v17 = unk_268920EB0;
  *(_OWORD *)&retstr->var3.height = xmmword_268920EA0;
  *(_OWORD *)&retstr->var4.height = v17;
  *(void *)&retstr->var6 = qword_268920EC0;
  long long v18 = *(_OWORD *)&qword_268920E90;
  *(_OWORD *)&retstr->var0 = xmmword_268920E80;
  *(_OWORD *)&retstr->var2 = v18;

  return result;
}

- (id)_symbolSizeAdjustmentsForDevice:(id)a3
{
  uint64_t v4 = objc_msgSend_sizeClass(a3, a2, (uint64_t)a3, v3);
  if ((unint64_t)(v4 - 2) >= 7)
  {
    uint64_t v8 = objc_msgSend_dictionary(NSDictionary, v5, v6, v7);
  }
  else
  {
    uint64_t v8 = *(&off_264CD56E0 + v4 - 2);
  }

  return v8;
}

@end