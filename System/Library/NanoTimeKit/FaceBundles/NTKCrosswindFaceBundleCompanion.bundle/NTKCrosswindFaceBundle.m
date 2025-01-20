@interface NTKCrosswindFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKCrosswindFaceBundle

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
  v4 = [(id)objc_opt_class() identifier];
  v5 = +[NTKCrosswindFace bundledFaceWithIdentifier:v4 forDevice:v3 initCustomization:0];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKCrosswindFaceBundle localizedStringForKey:@"CROSSWIND_FACE_NAME_IN_TITLE_CASE" comment:@"Palette"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NTKCrosswindFaceBundle;
  v5 = [(NTKCrosswindFaceBundle *)&v21 galleryFacesForDevice:v4];
  if (NTKShowCarbonara())
  {
    id v6 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
    v7 = NTKCarbonaraWidgetIntent();
    id v8 = [v6 initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.HomeEnergyUI.EnergyForecastComplication" intent:v7];

    v9 = +[NTKWidgetComplication complicationWithDescriptor:v8];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      uint64_t v14 = NTKComplicationSlotBottomLeft;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "setComplication:forSlot:", v9, v14, (void)v17);
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }

  return v5;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    id v8 = [(NTKCrosswindFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:300];
    id v11 = v9;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v7;
}

@end