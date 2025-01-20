@interface NTKNumeralsAnalogElementsPlacement
+ (CGPoint)centerPointFor10NumeralInImageForStyle:(unint64_t)a3 forDevice:(id)a4;
+ (CGPoint)hourViewPositionForHour:(int64_t)a3 complicationHidden:(BOOL)a4 utilitySlot:(int64_t)a5 forDevice:(id)a6;
+ (double)edgeVerticalAdjustmentDistanceForDevice:(id)a3;
+ (int64_t)complicationPlacementForHour:(int64_t)a3 forDevice:(id)a4;
@end

@implementation NTKNumeralsAnalogElementsPlacement

+ (double)edgeVerticalAdjustmentDistanceForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16C08);
  id WeakRetained = objc_loadWeakRetained(&qword_16C10);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_16C10);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_16C10, v3);
    qword_16C18 = (uint64_t)[v3 version];

    sub_9620(v10, (uint64_t)v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_16C18;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16C08);
  double v11 = *(double *)&qword_16C00;

  return v11;
}

+ (CGPoint)hourViewPositionForHour:(int64_t)a3 complicationHidden:(BOOL)a4 utilitySlot:(int64_t)a5 forDevice:(id)a6
{
  id v6 = objc_msgSend(a6, "screenBounds", a3, a4, a5);

  _CLKRectGetCenter(v6);
  result.y = v8;
  result.x = v7;
  return result;
}

+ (CGPoint)centerPointFor10NumeralInImageForStyle:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16C28);
  id WeakRetained = objc_loadWeakRetained(&qword_16C30);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v7 = WeakRetained;
  id v8 = objc_loadWeakRetained(&qword_16C30);
  if (v8 != v5)
  {

LABEL_5:
    id v11 = objc_storeWeak(&qword_16C30, v5);
    qword_16C38 = (uint64_t)[v5 version];

    sub_9874(v12, (uint64_t)v5);
    goto LABEL_6;
  }
  id v9 = [v5 version];
  uint64_t v10 = qword_16C38;

  if (v9 != (id)v10) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16C28);
  v13 = (void *)qword_16C20;
  v14 = +[NSNumber numberWithUnsignedInteger:a3];
  v15 = [v13 objectForKeyedSubscript:v14];
  [v15 CGPointValue];
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

+ (int64_t)complicationPlacementForHour:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16C48);
  id WeakRetained = objc_loadWeakRetained(&qword_16C50);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v7 = WeakRetained;
  id v8 = objc_loadWeakRetained(&qword_16C50);
  if (v8 != v5)
  {

LABEL_5:
    id v11 = objc_storeWeak(&qword_16C50, v5);
    qword_16C58 = (uint64_t)[v5 version];

    uint64_t v12 = (void *)qword_16C40;
    qword_16C40 = (uint64_t)&off_114E8;

    goto LABEL_6;
  }
  id v9 = [v5 version];
  uint64_t v10 = qword_16C58;

  if (v9 != (id)v10) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16C48);
  v13 = [(id)qword_16C40 objectAtIndexedSubscript:a3 - 1];
  id v14 = [v13 integerValue];

  return (int64_t)v14;
}

@end