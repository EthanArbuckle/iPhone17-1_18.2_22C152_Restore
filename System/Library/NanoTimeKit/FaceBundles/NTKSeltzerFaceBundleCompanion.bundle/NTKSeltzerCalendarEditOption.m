@interface NTKSeltzerCalendarEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForDevice:(id)a3;
+ (id)optionWithCalendar:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (unint64_t)calendar;
@end

@implementation NTKSeltzerCalendarEditOption

+ (id)optionWithCalendar:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)calendar
{
  return (unint64_t)[(NTKSeltzerCalendarEditOption *)self _value];
}

+ (id)defaultOptionForDevice:(id)a3
{
  id v3 = a3;
  v4 = NTKLunarCalendarID();
  if ([v4 isEqualToString:NSCalendarIdentifierHebrew])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:NSCalendarIdentifierIslamicCivil])
  {
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = +[NTKSeltzerCalendarEditOption optionWithCalendar:v5 forDevice:v3];

  return v6;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15F78);
  id WeakRetained = objc_loadWeakRetained(&qword_15F80);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_15F80);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_15F80, v3);
    qword_15F88 = (uint64_t)[v3 version];

    sub_9D74();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_15F88;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15F78);
  id v10 = (id)qword_15F70;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_10598 + a3);
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKSeltzerCalendarEditOption *)self calendar];
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_105B0 + v2);
  }

  return +[NTKSeltzerFaceBundle localizedStringForKey:v3 comment:@"calendar"];
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9EBC;
  block[3] = &unk_10578;
  block[4] = self;
  if (qword_15F98 != -1) {
    dispatch_once(&qword_15F98, block);
  }
  return (id)qword_15F90;
}

@end