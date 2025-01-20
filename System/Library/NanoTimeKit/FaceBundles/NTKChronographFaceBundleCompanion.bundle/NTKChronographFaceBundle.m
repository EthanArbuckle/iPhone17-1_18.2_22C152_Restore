@interface NTKChronographFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_orderedColorEditOptionsForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)galleryTitleForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKChronographFaceBundle

- (id)legacyFaceStyle
{
  return &off_1D9C8;
}

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  if (NTKShowBlueRidgeUI()) {
    uint64_t v4 = 202;
  }
  else {
    uint64_t v4 = 2;
  }
  v5 = +[NTKChronographFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKChronographFaceBundle localizedStringForKey:@"FACE_STYLE_CHRONOGRAPH_IN_TITLE_CASE" comment:@"Chronograph"];
}

- (id)galleryTitleForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKChronographFaceBundle;
    v7 = [(NTKChronographFaceBundle *)&v9 galleryTitleForDevice:v4];
  }

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unsigned __int8 v6 = objc_opt_class();
  v7 = [(NTKChronographFaceBundle *)self _orderedColorEditOptionsForDevice:v4];
  id v8 = [v7 mutableCopy];

  objc_super v9 = [v6 optionsRestrictedByDevice:v4];
  id v10 = [v9 mutableCopy];

  if ([v10 count]) {
    uint64_t v11 = 9;
  }
  else {
    uint64_t v11 = 8;
  }
  do
  {
    v12 = [(NTKChronographFaceBundle *)self defaultFaceForDevice:v4];
    if (v12)
    {
      v13 = [(NTKChronographFaceBundle *)self complicationTypesBySlot];
      [v12 _setFaceGalleryComplicationTypesForSlots:v13];

      if ([v12 _faceGalleryDidUpdateFaceColorForColorEditOptionClass:v6 availableHardwareSpecificColorOptions:v10 availableColorOptions:v8])objc_msgSend(v5, "addObject:", v12); {
    }
      }

    --v11;
  }
  while (v11);
  id v14 = [v5 copy];

  return v14;
}

- (id)_orderedColorEditOptionsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_23A48);
  id WeakRetained = objc_loadWeakRetained(&qword_23A50);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_23A50);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_23A50, v3);
    qword_23A58 = (uint64_t)[v3 version];

    sub_C280(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_23A58;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_23A48);
  id v11 = (id)qword_23A40;

  return v11;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotBottomLeft;
  v5[0] = &off_1DFD8;
  v5[1] = &off_1DFF0;
  v4[2] = NTKComplicationSlotBottomRight;
  v5[2] = &off_1E008;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

@end