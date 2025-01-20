@interface NTKSolarFace
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (id)_complicationSlotDescriptors;
- (id)_faceDescription;
- (id)_faceDescriptionForLibrary;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)faceSharingName;
- (id)orderedComplicationSlots;
- (int64_t)timeStyle;
@end

@implementation NTKSolarFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)_faceDescriptionKey
{
  v3 = [(NTKSolarFace *)self device];
  v4 = (char *)[v3 deviceCategory];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v5 = @"FACE_STYLE_SOLAR_GRAPH_GALLERY_DESCRIPTION";
  }
  else
  {
    v6 = [(NTKSolarFace *)self device];
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
    unsigned int v8 = [v6 supportsCapability:v7];
    v9 = @"FACE_STYLE_SOLAR_GRAPH_DESCRIPTION";
    if (v8) {
      v9 = @"FACE_STYLE_SOLAR_GRAPH_DESCRIPTION_LIGHTHOUSE";
    }
    v5 = v9;
  }

  return v5;
}

- (id)_faceDescription
{
  v2 = [(NTKSolarFace *)self _faceDescriptionKey];
  v3 = +[NTKSolarFaceBundle localizedStringForKey:v2 comment:@"Solar face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKSolarFaceBundle localizedStringForKey:@"FACE_STYLE_SOLAR_GRAPH_IN_TITLE_CASE" comment:@"Solar Graph"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v10[0] = NTKComplicationSlotTopRight;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v11[0] = v5;
  v10[1] = NTKComplicationSlotBottom;
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v7 = NTKComplicationSlotDescriptor();
  v11[1] = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)_complicationSlotDescriptors
{
  v3 = [(NTKSolarFace *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (v4 >= 0x50000)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKSolarFace;
    v5 = [(NTKSolarFace *)&v7 _complicationSlotDescriptors];
  }
  else
  {
    v5 = &__NSDictionary0__struct;
  }

  return v5;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  if ([a3 nrDeviceVersion] >= 0x50000) {
    id v3 = NTKComplicationSlotTopRight;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)orderedComplicationSlots
{
  id v3 = [(NTKSolarFace *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (v4 >= 0x50000)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKSolarFace;
    v5 = [(NTKSolarFace *)&v7 orderedComplicationSlots];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  v5 = [(NTKSolarFace *)self device];
  unsigned int v6 = [v5 nrDeviceVersion];

  if (v6 >= 0x50000)
  {
    if ([v4 isEqualToString:NTKComplicationSlotTopRight])
    {
      CFStringRef v8 = @"TOP";
    }
    else
    {
      unsigned int v9 = [v4 isEqualToString:NTKComplicationSlotBottom];
      CFStringRef v8 = @"BOTTOM";
      if (!v9) {
        CFStringRef v8 = 0;
      }
    }
    v10 = +[NSString stringWithFormat:@"SLOT_LABEL_%@", v8];
    NTKClockFaceLocalizedString();
    objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v7 = &stru_2D1F8;
  }

  return v7;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKSolarFace;
  if (!-[NTKSolarFace _snapshotContext:isStaleRelativeToContext:](&v10, "_snapshotContext:isStaleRelativeToContext:", v6, v7)&& [v6 calendarDateMatchesContext:v7]&& objc_msgSend(v6, "localeMatchesContext:", v7)&& objc_msgSend(v6, "timeZoneMatchesContext:", v7))
  {
    unsigned __int8 v8 = [v6 locationSignificantlyDiffersFromContext:v7];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (id)_faceDescriptionForLibrary
{
  id v3 = [(NTKSolarFace *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (v4 >> 17 > 2)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKSolarFace;
    v5 = [(NTKSolarFace *)&v7 _faceDescriptionForLibrary];
  }

  return v5;
}

@end