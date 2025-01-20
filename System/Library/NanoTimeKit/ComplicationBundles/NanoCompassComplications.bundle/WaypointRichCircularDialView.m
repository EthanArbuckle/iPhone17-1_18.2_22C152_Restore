@interface WaypointRichCircularDialView
- ($F19C7D1BACA455C0923872420114D4F8)_layoutConstantsForDevice:(SEL)a3;
- (id)_symbolSizeAdjustmentsForDevice:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3;
@end

@implementation WaypointRichCircularDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WaypointRichCircularDialView;
  return [(WaypointBaseRichDialView *)&v4 initFullColorImageViewWithDevice:a3];
}

- ($F19C7D1BACA455C0923872420114D4F8)_layoutConstantsForDevice:(SEL)a3
{
  id obj = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2689211B8);
  id WeakRetained = objc_loadWeakRetained(&qword_2689211C0);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&qword_2689211C0);
    if (v7 == obj)
    {
      uint64_t v10 = objc_msgSend_version(obj, (const char *)obj, v8, v9);
      uint64_t v11 = qword_2689211C8;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&qword_2689211C0, obj);
  qword_2689211C8 = objc_msgSend_version(obj, v13, v14, v15);

  sub_2375B3F80(v16, (const char *)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2689211B8);
  long long v17 = unk_2689211A0;
  *(_OWORD *)&retstr->var3.height = xmmword_268921190;
  *(_OWORD *)&retstr->var4.height = v17;
  *(void *)&retstr->var6 = qword_2689211B0;
  long long v18 = *(_OWORD *)&qword_268921180;
  *(_OWORD *)&retstr->var0 = xmmword_268921170;
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
    uint64_t v8 = (void *)qword_264CD5960[v4 - 2];
  }

  return v8;
}

@end