@interface NTKActivityAnalogDensityEditOption
+ (id)_orderedValuesForDevice:(id)a3;
- (id)localizedName;
@end

@implementation NTKActivityAnalogDensityEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_295B0);
  id WeakRetained = objc_loadWeakRetained(&qword_295B8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_295B8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_295B8, v3);
    qword_295C0 = (uint64_t)[v3 version];

    v10 = (void *)qword_295A8;
    qword_295A8 = (uint64_t)&off_21A70;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_295C0;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_295B0);
  id v11 = (id)qword_295A8;

  return v11;
}

- (id)localizedName
{
  v2 = (char *)[(NTKActivityAnalogDensityEditOption *)self density];
  if (v2 == (unsigned char *)&dword_0 + 3)
  {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_ANALOG_DENSITY_SUBDIALS";
    CFStringRef v4 = @"Subdials";
    goto LABEL_5;
  }
  if (v2 == (unsigned char *)&dword_0 + 1)
  {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_ANALOG_DENSITY_RINGS";
    CFStringRef v4 = @"Rings";
LABEL_5:
    v5 = +[NTKActivityAnalogFaceBundle localizedStringForKey:v3 comment:v4];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end