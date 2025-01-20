@interface NTKCloudrakerFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
- (void)_addGalleryFaceWithTopComplication:(unint64_t)a3 centerComplicationType:(unint64_t)a4 bottomComplicationType:(unint64_t)a5 toCollection:(id)a6 withBaseFace:(id)a7;
@end

@implementation NTKCloudrakerFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() identifier];
  v5 = [(id)objc_opt_class() analyticsIdentifier];
  v6 = +[NTKCloudrakerFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKCloudrakerFaceBundle localizedStringForKey:@"FACE_STYLE_CLOUDRAKER_IN_TITLE_CASE" comment:@"Cloudraker"];
}

- (id)galleryDescriptionText
{
  return +[NTKCloudrakerFaceBundle localizedStringForKey:@"FACE_STYLE_CLOUDRAKER_DESCRIPTION" comment:@"Modular Max Description"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v6 = [(id)objc_opt_class() identifier];
  v7 = [(id)objc_opt_class() analyticsIdentifier];
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_3438;
  v103[3] = &unk_82F8;
  id v8 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:@"multicolor" collectionName:@"special"];
  id v104 = v8;
  v9 = +[NTKCloudrakerFace bundledFaceWithIdentifier:v6 analyticsIdentifier:v7 forDevice:v4 initCustomization:v103];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  v11 = v4;
  LODWORD(v4) = [v4 supportsCapability:v10];

  if (v4)
  {
    if (v9)
    {
      id v73 = v8;
      id v98 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.boardwalk.watchapp.widgets" containerBundleIdentifier:@"com.apple.boardwalk.watchapp" kind:@"Tides" intent:0];
      id v97 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.Mind.MindComplication" containerBundleIdentifier:@"com.apple.Mind" kind:@"MentalHealthLauncherComplication" intent:0];
      id v96 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget" containerBundleIdentifier:@"com.apple.nanomusicrecognition" kind:@"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget" intent:0];
      id v72 = [objc_alloc((Class)INAppIntent) initWithAppBundleIdentifier:@"com.apple.NanoTranslate.Widget" appIntentIdentifier:@"ConfigurationAppIntent" serializedParameters:&__NSDictionary0__struct];
      id v95 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoTranslate.Widget" containerBundleIdentifier:@"com.apple.NanoTranslate" kind:@"NanoTranslateWidget" intent:v72];
      id v94 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.weather.watchapp.widgets" containerBundleIdentifier:@"com.apple.weather.watchapp" kind:@"com.apple.weather.widget.threeup" intent:0];
      id v93 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.ActivityMonitorApp.ActivityComplication" containerBundleIdentifier:@"com.apple.ActivityMonitorApp" kind:@"ActivityGraphComplication" intent:0];
      id v71 = [objc_alloc((Class)INAppIntent) initWithAppBundleIdentifier:@"com.apple.ActivityMonitorApp.ActivityComplication" appIntentIdentifier:@"WorkoutDistanceConfigurationIntent" serializedParameters:&off_8CD8];
      id v92 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.ActivityMonitorApp.ActivityComplication" containerBundleIdentifier:@"com.apple.ActivityMonitorApp" kind:@"WorkoutDistanceComplication" intent:v71];
      id v70 = [objc_alloc((Class)INAppIntent) initWithAppBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" appIntentIdentifier:@"NHOSmartStackActionIntent" serializedParameters:&off_8D00];
      id v91 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.NanoHome.NHOSmartStackActionWidget" intent:v70];
      v12 = +[NTKComplication anyComplicationOfType:10];
      v90 = _complicationOrDie(v12);

      v13 = +[NTKComplication anyComplicationOfType:7];
      v89 = _complicationOrDie(v13);

      v88 = +[NTKComplication anyComplicationOfType:18];
      if ([v11 supportsUrsa])
      {
        v14 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKComplicationCompassSmartWaypointIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
        v87 = _complicationOrDie(v14);
      }
      else
      {
        v87 = _complicationOrDie(0);
      }
      if ([v11 supportsUrsa])
      {
        v22 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaCompassBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
        v86 = _complicationOrDie(v22);
      }
      else
      {
        v86 = _complicationOrDie(0);
      }
      if ([v11 supportsUrsa])
      {
        v23 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaBearingBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
        v99 = _complicationOrDie(v23);
      }
      else
      {
        v99 = _complicationOrDie(0);
      }
      v24 = +[NTKComplication anyComplicationOfType:43];
      v85 = _complicationOrDie(v24);

      v74 = v7;
      v68 = v9;
      v69 = v5;
      if ([v11 supportsUrsa])
      {
        v25 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.altitude" appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
        v84 = _complicationOrDie(v25);
      }
      else
      {
        v84 = _complicationOrDie(0);
      }
      v26 = +[NTKComplication anyComplicationOfType:1];
      v83 = _complicationOrDie(v26);

      v27 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.depth" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
      uint64_t v28 = _complicationOrDie(v27);

      v29 = +[NTKWidgetComplication complicationWithDescriptor:v98];
      v76 = _complicationOrDie(v29);

      v30 = +[NTKWidgetComplication complicationWithDescriptor:v97];
      v78 = _complicationOrDie(v30);

      v31 = +[NTKWidgetComplication complicationWithDescriptor:v96];
      v82 = _complicationOrDie(v31);

      v32 = +[NTKWidgetComplication complicationWithDescriptor:v95];
      v81 = _complicationOrDie(v32);

      v33 = +[NTKComplication anyComplicationOfType:14];
      v80 = _complicationOrDie(v33);

      v34 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.temperature" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
      uint64_t v35 = _complicationOrDie(v34);

      v36 = +[NTKWidgetComplication complicationWithDescriptor:v94];
      v75 = _complicationOrDie(v36);

      v37 = +[NTKComplication anyComplicationOfType:5];
      v79 = _complicationOrDie(v37);

      v38 = +[NTKWidgetComplication complicationWithDescriptor:v93];
      v64 = _complicationOrDie(v38);

      v39 = +[NTKWidgetComplication complicationWithDescriptor:v91];
      v77 = _complicationOrDie(v39);

      id v67 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoHealthBalance.NanoHealthBalanceWidgetExtension" containerBundleIdentifier:@"com.apple.NanoHealthBalance" kind:@"BalanceOneDayWidgetKind" intent:0];
      v66 = +[NTKWidgetComplication complicationWithDescriptor:v67];
      v40 = +[NTKWidgetComplication complicationWithDescriptor:v92];
      v63 = _complicationOrDie(v40);

      v41 = +[NSMutableArray arrayWithCapacity:12];
      uint64_t v42 = NTKComplicationSlotTopLeft;
      v121[0] = NTKComplicationSlotTopLeft;
      uint64_t v43 = v35;
      v62 = (void *)v35;
      if ([v11 supportsCharon]) {
        uint64_t v44 = v35;
      }
      else {
        uint64_t v44 = (uint64_t)v89;
      }
      uint64_t v45 = NTKComplicationSlotCenter;
      v122[0] = v44;
      v122[1] = v99;
      uint64_t v46 = NTKComplicationSlotBottom;
      v121[1] = NTKComplicationSlotCenter;
      v121[2] = NTKComplicationSlotBottom;
      uint64_t v47 = v28;
      v65 = (void *)v28;
      if ([v11 supportsCharon]) {
        uint64_t v48 = v28;
      }
      else {
        uint64_t v48 = (uint64_t)v88;
      }
      v122[2] = v48;
      v49 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];
      [v41 addObject:v49];

      v119[0] = v42;
      v119[1] = v45;
      v120[0] = v86;
      v120[1] = v84;
      v119[2] = v46;
      v120[2] = v87;
      v50 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:3];
      [v41 addObject:v50];

      v117[0] = v42;
      if ([v11 supportsCharon]) {
        uint64_t v51 = v43;
      }
      else {
        uint64_t v51 = (uint64_t)v89;
      }
      v118[0] = v51;
      v118[1] = v76;
      v117[1] = v45;
      v117[2] = v46;
      if ([v11 supportsCharon]) {
        uint64_t v52 = v47;
      }
      else {
        uint64_t v52 = (uint64_t)v88;
      }
      v118[2] = v52;
      v53 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:3];
      [v41 addObject:v53];

      v115[0] = v42;
      v115[1] = v45;
      v116[0] = v83;
      v116[1] = v85;
      v115[2] = v46;
      v116[2] = v75;
      v54 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:3];
      [v41 addObject:v54];

      v113[0] = v42;
      v113[1] = v45;
      v114[0] = v80;
      v114[1] = v81;
      v113[2] = v46;
      v114[2] = v79;
      v55 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:3];
      [v41 addObject:v55];

      v111[0] = v42;
      v111[1] = v45;
      v112[0] = v90;
      v112[1] = v77;
      v111[2] = v46;
      v112[2] = v82;
      v56 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:3];
      [v41 addObject:v56];

      v109[0] = v42;
      v109[1] = v45;
      v110[0] = v89;
      v110[1] = v64;
      v109[2] = v46;
      v110[2] = v78;
      v57 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:3];
      [v41 addObject:v57];

      v107[0] = v42;
      v107[1] = v45;
      v108[0] = v76;
      v108[1] = v99;
      v107[2] = v46;
      v108[2] = v75;
      v58 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:3];
      [v41 addObject:v58];

      v105[0] = v42;
      v105[1] = v45;
      v105[2] = v46;
      v106[0] = v89;
      v106[1] = v66;
      v106[2] = v63;
      v59 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:3];
      [v41 addObject:v59];

      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = sub_34A8;
      v100[3] = &unk_8348;
      v9 = v68;
      id v101 = v68;
      v5 = v69;
      id v102 = v69;
      [v41 enumerateObjectsUsingBlock:v100];

      v7 = v74;
      id v8 = v73;
    }
  }
  else
  {
    if (NTKShowCarbonara())
    {
      id v15 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
      v16 = NTKCarbonaraWidgetIntent();
      id v17 = [v15 initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.HomeEnergyUI.EnergyForecastComplication" intent:v16];

      v18 = +[NTKWidgetComplication complicationWithDescriptor:v17];
      [v9 setComplication:v18 forSlot:NTKComplicationSlotCenter];
      [v5 addObject:v9];
    }
    [(NTKCloudrakerFaceBundle *)self _addGalleryFaceWithTopComplication:10 centerComplicationType:7 bottomComplicationType:43 toCollection:v5 withBaseFace:v9];
    [(NTKCloudrakerFaceBundle *)self _addGalleryFaceWithTopComplication:39 centerComplicationType:40 bottomComplicationType:5 toCollection:v5 withBaseFace:v9];
    [(NTKCloudrakerFaceBundle *)self _addGalleryFaceWithTopComplication:19 centerComplicationType:15 bottomComplicationType:7 toCollection:v5 withBaseFace:v9];
    [(NTKCloudrakerFaceBundle *)self _addGalleryFaceWithTopComplication:10 centerComplicationType:43 bottomComplicationType:22 toCollection:v5 withBaseFace:v9];
    v19 = [v11 nrDevice];
    v20 = [v19 pairingID];

    if (v20) {
      uint64_t v21 = 9;
    }
    else {
      uint64_t v21 = 8;
    }
    [(NTKCloudrakerFaceBundle *)self _addGalleryFaceWithTopComplication:1 centerComplicationType:5 bottomComplicationType:v21 toCollection:v5 withBaseFace:v9];
  }
  id v60 = [v5 copy];

  return v60;
}

- (void)_addGalleryFaceWithTopComplication:(unint64_t)a3 centerComplicationType:(unint64_t)a4 bottomComplicationType:(unint64_t)a5 toCollection:(id)a6 withBaseFace:(id)a7
{
  id v11 = a6;
  id v15 = [a7 copy];
  v12 = +[NTKComplication anyComplicationOfType:a3];
  [v15 setComplication:v12 forSlot:NTKComplicationSlotTopLeft];

  v13 = +[NTKComplication anyComplicationOfType:a4];
  [v15 setComplication:v13 forSlot:NTKComplicationSlotCenter];

  v14 = +[NTKComplication anyComplicationOfType:a5];
  [v15 setComplication:v14 forSlot:NTKComplicationSlotBottom];

  [v11 addObject:v15];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  if ([v4 supportsCapability:v5])
  {
  }
  else
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v7 = [v4 supportsCapability:v6];

    if (v7 && [v4 deviceCategory] == (char *)&dword_0 + 3)
    {
      id v8 = [(NTKCloudrakerFaceBundle *)self defaultFaceForDevice:v4];
      id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:300];
      id v10 = v9;
      if (v9)
      {
        id v13 = v9;
        id v11 = +[NSArray arrayWithObjects:&v13 count:1];
      }
      else
      {
        id v11 = &__NSArray0__struct;
      }

      goto LABEL_8;
    }
  }
  id v11 = &__NSArray0__struct;
LABEL_8:

  return v11;
}

@end