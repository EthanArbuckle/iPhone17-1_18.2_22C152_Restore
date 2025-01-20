@interface NTKFoghornFaceBundle
+ (id)_faceWithBezelStyle:(int64_t)a3 layoutStyle:(unint64_t)a4 nightMode:(unint64_t)a5 complications:(id)a6 forDevice:(id)a7;
+ (id)_galleryFacesForDevice:(id)a3;
+ (id)defaultFaceForDevice:(id)a3;
+ (id)logCategoryName;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKFoghornFaceBundle

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

+ (id)defaultFaceForDevice:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_identifier(a1, v5, v6, v7);
  v12 = objc_msgSend_analyticsIdentifier(a1, v9, v10, v11);
  v14 = objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(NTKFoghornFace, v13, (uint64_t)v8, (uint64_t)v12, v4, 0);

  return v14;
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_defaultFaceForDevice_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (id)galleryTitle
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FOGHORN_FACE_NAME_IN_TITLE_CASE", (uint64_t)&stru_26FB0CCF0);
}

- (id)galleryDescriptionText
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, a2, @"FACE_STYLE_FOGHORN_DESCRIPTION", (uint64_t)&stru_26FB0CCF0);
}

- (id)heroFacesForDevice:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = objc_msgSend_initWithUUIDString_(v5, v6, @"DAB81146-4105-445B-94AD-14033A199AC4", v7);
  char v11 = objc_msgSend_supportsCapability_(v4, v9, (uint64_t)v8, v10);

  if (v11)
  {
    v14 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v15 = objc_msgSend_defaultFaceForDevice_(self, v12, (uint64_t)v4, v13);
    id v16 = objc_alloc(MEMORY[0x263F579E8]);
    v18 = objc_msgSend_initWithFace_priority_(v16, v17, (uint64_t)v15, 600);
    v21[0] = v18;
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v21, 1);
  }

  return v14;
}

+ (id)_faceWithBezelStyle:(int64_t)a3 layoutStyle:(unint64_t)a4 nightMode:(unint64_t)a5 complications:(id)a6 forDevice:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v16 = objc_msgSend_defaultFaceForDevice_(a1, v14, (uint64_t)v13, v15);
  v18 = objc_msgSend_optionWithBezelStyle_forDevice_(NTKFoghornFaceBezelStyleEditOption, v17, a3, (uint64_t)v13);
  objc_msgSend_selectOption_forCustomEditMode_slot_(v16, v19, (uint64_t)v18, 12, 0);
  v21 = objc_msgSend_optionWithLayoutStyle_forDevice_(NTKFoghornFaceLayoutStyleEditOption, v20, a4, (uint64_t)v13);
  objc_msgSend_selectOption_forCustomEditMode_slot_(v16, v22, (uint64_t)v21, 15, 0);
  v24 = objc_msgSend_optionWithFoghornNightMode_forDevice_(NTKFoghornNightModeEditOption, v23, a5, (uint64_t)v13);
  objc_msgSend_selectOption_forCustomEditMode_slot_(v16, v25, (uint64_t)v24, 18, 0);
  v28 = objc_msgSend_pigmentNamed_(MEMORY[0x263F57A50], v26, *MEMORY[0x263F57F78], v27);
  objc_msgSend_selectOption_forCustomEditMode_slot_(v16, v29, (uint64_t)v28, 10, 0);
  if (v12)
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_246B153DC;
    v34[3] = &unk_2651F6C18;
    id v35 = v16;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v31, (uint64_t)v34, v32);
  }
  else
  {
    objc_msgSend__applyInitialDefaultComplicationsForBezelStyle_toFace_forDevice_(NTKFoghornFace, v30, a3, (uint64_t)v16, v13);
  }

  return v16;
}

+ (id)_galleryFacesForDevice:(id)a3
{
  v368[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = objc_msgSend_initWithUUIDString_(v5, v6, @"DAB81146-4105-445B-94AD-14033A199AC4", v7);
  int v11 = objc_msgSend_supportsCapability_(v4, v9, (uint64_t)v8, v10);

  if (v11)
  {
    v303 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v12, 12, v14);
    id v15 = objc_alloc(MEMORY[0x263EFD238]);
    v283 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v15, v16, @"com.apple.NanoWorldClock.WorldClockWidgetExtension", @"com.apple.NanoWorldClock", @"SunriseSunsetWidget", 0);
    id v17 = objc_alloc(MEMORY[0x263EFD238]);
    v282 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v17, v18, @"com.apple.HeartRate.HeartRateWidgetExtension", @"com.apple.HeartRate", @"HeartRateWidgetExtension", 0);
    id v19 = objc_alloc(MEMORY[0x263EFD238]);
    v281 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v19, v20, @"com.apple.weather.watchapp.widgets", @"com.apple.weather.watchapp", @"com.apple.weather.widget.humidity", 0);
    id v21 = objc_alloc(MEMORY[0x263EFD238]);
    v280 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v21, v22, @"com.apple.weather.watchapp.widgets", @"com.apple.weather.watchapp", @"com.apple.weather.widget.airquality", 0);
    id v23 = objc_alloc(MEMORY[0x263EFD238]);
    v279 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v23, v24, @"com.apple.boardwalk.watchapp.widgets", @"com.apple.boardwalk.watchapp", @"Swell", 0);
    id v25 = objc_alloc(MEMORY[0x263EFD238]);
    v278 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v25, v26, @"com.apple.boardwalk.watchapp.widgets", @"com.apple.boardwalk.watchapp", @"Tides", 0);
    id v27 = objc_alloc(MEMORY[0x263EFD238]);
    v277 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v27, v28, @"com.apple.NanoHealthBalance.NanoHealthBalanceWidgetExtension", @"com.apple.NanoHealthBalance", @"BalanceOneDayWidgetKind", 0);
    id v29 = objc_alloc(MEMORY[0x263EFD238]);
    v276 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v29, v30, @"com.apple.weather.watchapp.widgets", @"com.apple.weather.watchapp", @"com.apple.weather.widget.rain", 0);
    id v31 = objc_alloc(MEMORY[0x263EFD238]);
    v275 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v31, v32, @"com.apple.Mind.MindComplication", @"com.apple.Mind", @"MentalHealthLauncherComplication", 0);
    id v33 = objc_alloc(MEMORY[0x263EFD238]);
    v274 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v33, v34, @"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget", @"com.apple.nanomusicrecognition", @"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget", 0);
    id v35 = objc_alloc(MEMORY[0x263EFD238]);
    v273 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v35, v36, @"com.apple.NanoAlarm.NanoAlarmWidgetExtension", @"com.apple.NanoAlarm", @"NanoAlarmComplication", 0);
    id v37 = objc_alloc(MEMORY[0x263EFD238]);
    v272 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v37, v38, @"com.apple.NanoOxygenSaturation.watchkitapp.NanoOxygenSaturationWidgetExtension", @"com.apple.NanoOxygenSaturation.watchkitapp", @"NanoOxygenSaturationWidgetExtension", 0);
    id v39 = objc_alloc(MEMORY[0x263EFD238]);
    v271 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v39, v40, @"com.apple.NanoTranslate.Widget", @"com.apple.NanoTranslate", @"NanoTranslateStaticWidget", 0);
    id v41 = objc_alloc(MEMORY[0x263F0F9A0]);
    uint64_t v43 = objc_msgSend_initWithAppBundleIdentifier_appIntentIdentifier_serializedParameters_(v41, v42, @"com.apple.ActivityMonitorApp.ActivityComplication", @"WorkoutDistanceConfigurationIntent", &unk_26FB122B8);
    id v44 = objc_alloc(MEMORY[0x263EFD238]);
    v256 = (void *)v43;
    v270 = objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(v44, v45, @"com.apple.ActivityMonitorApp.ActivityComplication", @"com.apple.ActivityMonitorApp", @"WorkoutDistanceComplication", v43);
    v48 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v46, 10, v47);
    v296 = _complicationOrDie(v48);

    v51 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v49, (uint64_t)v283, v50);
    v298 = _complicationOrDie(v51);

    v54 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v52, 7, v53);
    v300 = _complicationOrDie(v54);

    v57 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v55, (uint64_t)v282, v56);
    v297 = _complicationOrDie(v57);

    v60 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v58, 18, v59);
    v290 = _complicationOrDie(v60);

    if (objc_msgSend_supportsUrsa(v4, v61, v62, v63))
    {
      v65 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v64, *MEMORY[0x263F57800], *MEMORY[0x263F577D0], 0);
      v301 = _complicationOrDie(v65);
    }
    else
    {
      v301 = _complicationOrDie(0);
    }
    v88 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v66, 17, v67);
    v289 = _complicationOrDie(v88);

    if (objc_msgSend_supportsUrsa(v4, v89, v90, v91))
    {
      v93 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v92, *MEMORY[0x263F577E8], *MEMORY[0x263F577D0], 0);
      v288 = _complicationOrDie(v93);
    }
    else
    {
      v288 = _complicationOrDie(0);
    }
    if (objc_msgSend_supportsUrsa(v4, v94, v95, v96))
    {
      v98 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v97, *MEMORY[0x263F577E0], *MEMORY[0x263F577D0], 0);
      v295 = _complicationOrDie(v98);
    }
    else
    {
      v295 = _complicationOrDie(0);
    }
    if (objc_msgSend_supportsUrsa(v4, v99, v100, v101))
    {
      v103 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v102, *MEMORY[0x263F577D8], *MEMORY[0x263F577D0], 0);
      v269 = _complicationOrDie(v103);
    }
    else
    {
      v269 = _complicationOrDie(0);
    }
    v106 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v104, 43, v105);
    v299 = _complicationOrDie(v106);

    v109 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v107, (uint64_t)v281, v108);
    v287 = _complicationOrDie(v109);

    v112 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v110, 44, v111);
    v294 = _complicationOrDie(v112);

    v115 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v113, (uint64_t)v280, v114);
    v285 = _complicationOrDie(v115);

    v118 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v116, (uint64_t)v279, v117);
    v286 = _complicationOrDie(v118);

    v121 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v119, (uint64_t)v278, v120);
    v267 = _complicationOrDie(v121);

    if (objc_msgSend_supportsUrsa(v4, v122, v123, v124))
    {
      v126 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v125, @"com.apple.NanoCompass.complications.altitude", *MEMORY[0x263F577D0], 0);
      v293 = _complicationOrDie(v126);
    }
    else
    {
      v293 = _complicationOrDie(0);
    }
    v129 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v127, (uint64_t)v277, v128);
    v268 = _complicationOrDie(v129);

    v132 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v130, 1, v131);
    v284 = _complicationOrDie(v132);

    v134 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v133, @"com.apple.Depth.depth", @"com.apple.Depth", 0);
    v292 = _complicationOrDie(v134);

    v137 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v135, (uint64_t)v276, v136);
    v265 = _complicationOrDie(v137);

    v140 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v138, (uint64_t)v275, v139);
    v263 = _complicationOrDie(v140);

    v143 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v141, (uint64_t)v274, v142);
    v262 = _complicationOrDie(v143);

    v146 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v144, (uint64_t)v273, v145);
    v261 = _complicationOrDie(v146);

    v149 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v147, (uint64_t)v272, v148);
    v260 = _complicationOrDie(v149);

    v151 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v150, @"com.apple.NoiseComplications", @"com.apple.Noise", 0);
    v259 = _complicationOrDie(v151);

    v154 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v152, (uint64_t)v271, v153);
    v258 = _complicationOrDie(v154);

    v157 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v155, 14, v156);
    v257 = _complicationOrDie(v157);

    v159 = objc_msgSend_bundledComplicationWithBundleIdentifier_appBundleIdentifier_complicationDescriptor_(MEMORY[0x263F57948], v158, @"com.apple.Depth.temperature", @"com.apple.Depth", 0);
    v291 = _complicationOrDie(v159);

    v162 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v160, 46, v161);
    v266 = _complicationOrDie(v162);

    v165 = objc_msgSend_complicationWithDescriptor_(MEMORY[0x263F57AD0], v163, (uint64_t)v270, v164);
    v264 = _complicationOrDie(v165);

    v168 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v166, 12, v167);
    uint64_t v169 = *MEMORY[0x263F57850];
    v362[0] = *MEMORY[0x263F57858];
    uint64_t v302 = v362[0];
    v362[1] = v169;
    v368[0] = v296;
    v368[1] = v298;
    uint64_t v171 = *MEMORY[0x263F57840];
    uint64_t v363 = *MEMORY[0x263F57860];
    uint64_t v170 = v363;
    uint64_t v364 = v171;
    v368[2] = v300;
    v368[3] = v297;
    uint64_t v173 = *MEMORY[0x263F57828];
    uint64_t v365 = *MEMORY[0x263F57830];
    uint64_t v172 = v365;
    uint64_t v366 = v173;
    v368[4] = v290;
    v368[5] = v301;
    uint64_t v367 = *MEMORY[0x263F57838];
    uint64_t v174 = v367;
    v368[6] = v289;
    v176 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v175, (uint64_t)v368, (uint64_t)v362, 7);
    objc_msgSend_addObject_(v168, v177, (uint64_t)v176, v178);

    v360[0] = v302;
    v360[1] = v169;
    v361[0] = v296;
    v361[1] = v288;
    v360[2] = v170;
    v360[3] = v171;
    v361[2] = v301;
    v361[3] = v269;
    v360[4] = v172;
    v360[5] = v173;
    v361[4] = v300;
    v361[5] = v298;
    v360[6] = v174;
    v361[6] = v299;
    v180 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v179, (uint64_t)v361, (uint64_t)v360, 7);
    objc_msgSend_addObject_(v168, v181, (uint64_t)v180, v182);

    v358[0] = v302;
    v358[1] = v169;
    v359[0] = v286;
    v359[1] = v287;
    v358[2] = v170;
    v358[3] = v171;
    v359[2] = v295;
    v359[3] = v292;
    v358[4] = v172;
    v358[5] = v173;
    v359[4] = v301;
    v359[5] = v291;
    v358[6] = v174;
    v359[6] = v294;
    v184 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v183, (uint64_t)v359, (uint64_t)v358, 7);
    objc_msgSend_addObject_(v168, v185, (uint64_t)v184, v186);

    v356[0] = v302;
    v356[1] = v169;
    v357[0] = v266;
    v357[1] = v293;
    v356[2] = v170;
    v356[3] = v171;
    v357[2] = v300;
    v357[3] = v299;
    v356[4] = v172;
    v356[5] = v173;
    v357[4] = v295;
    v357[5] = v297;
    v356[6] = v174;
    v357[6] = v301;
    v188 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v187, (uint64_t)v357, (uint64_t)v356, 7);
    objc_msgSend_addObject_(v168, v189, (uint64_t)v188, v190);

    v354[0] = v302;
    v354[1] = v169;
    v355[0] = v300;
    v355[1] = v284;
    v354[2] = v170;
    v354[3] = v171;
    v355[2] = v268;
    v355[3] = v264;
    v354[4] = v172;
    v354[5] = v173;
    v355[4] = v285;
    v355[5] = v301;
    v354[6] = v174;
    v355[6] = v297;
    v192 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v191, (uint64_t)v355, (uint64_t)v354, 7);
    objc_msgSend_addObject_(v168, v193, (uint64_t)v192, v194);

    v352[0] = v302;
    v352[1] = v169;
    v353[0] = v299;
    v353[1] = v293;
    v352[2] = v170;
    v352[3] = v171;
    v353[2] = v300;
    v353[3] = v301;
    v352[4] = v172;
    v352[5] = v173;
    v353[4] = v290;
    v353[5] = v295;
    v352[6] = v174;
    v353[6] = v298;
    v196 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v195, (uint64_t)v353, (uint64_t)v352, 7);
    objc_msgSend_addObject_(v168, v197, (uint64_t)v196, v198);

    v350[0] = v302;
    v350[1] = v169;
    v351[0] = v265;
    v351[1] = v301;
    v350[2] = v170;
    v350[3] = v171;
    v351[2] = v299;
    v351[3] = v267;
    v350[4] = v172;
    v350[5] = v173;
    v351[4] = v291;
    v351[5] = v294;
    v350[6] = v174;
    v351[6] = v292;
    v200 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v199, (uint64_t)v351, (uint64_t)v350, 7);
    objc_msgSend_addObject_(v168, v201, (uint64_t)v200, v202);

    v348[0] = v302;
    v348[1] = v169;
    v349[0] = v263;
    v349[1] = v259;
    v348[2] = v170;
    v348[3] = v172;
    v349[2] = v262;
    v349[3] = v260;
    v348[4] = v173;
    v348[5] = v174;
    v349[4] = v289;
    v349[5] = v261;
    v204 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v203, (uint64_t)v349, (uint64_t)v348, 6);
    objc_msgSend_addObject_(v168, v205, (uint64_t)v204, v206);

    v346[0] = v302;
    v346[1] = v169;
    v347[0] = v258;
    v347[1] = v296;
    v346[2] = v170;
    v346[3] = v172;
    v347[2] = v284;
    v347[3] = v257;
    v346[4] = v173;
    v346[5] = v174;
    v347[4] = v298;
    v347[5] = v300;
    v208 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v207, (uint64_t)v347, (uint64_t)v346, 6);
    objc_msgSend_addObject_(v168, v209, (uint64_t)v208, v210);

    v344[0] = v302;
    v344[1] = v169;
    v345[0] = v301;
    v345[1] = v293;
    v344[2] = v170;
    v344[3] = v172;
    v345[2] = v295;
    v345[3] = v285;
    v344[4] = v173;
    v344[5] = v174;
    v345[4] = v297;
    v345[5] = v299;
    v212 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v211, (uint64_t)v345, (uint64_t)v344, 6);
    objc_msgSend_addObject_(v168, v213, (uint64_t)v212, v214);

    v342[0] = v302;
    v342[1] = v169;
    v343[0] = v286;
    v343[1] = v287;
    v342[2] = v170;
    v342[3] = v172;
    v343[2] = v299;
    v343[3] = v291;
    v342[4] = v173;
    v342[5] = v174;
    v343[4] = v294;
    v343[5] = v292;
    v216 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v215, (uint64_t)v343, (uint64_t)v342, 6);
    objc_msgSend_addObject_(v168, v217, (uint64_t)v216, v218);

    v340[0] = v302;
    v340[1] = v169;
    v341[0] = v296;
    v341[1] = v288;
    v340[2] = v170;
    v340[3] = v172;
    v341[2] = v301;
    v341[3] = v300;
    v340[4] = v173;
    v340[5] = v174;
    v341[4] = v298;
    v341[5] = v299;
    v220 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v219, (uint64_t)v341, (uint64_t)v340, 6);
    objc_msgSend_addObject_(v168, v221, (uint64_t)v220, v222);

    long long v304 = xmmword_246B22910;
    uint64_t v305 = 2;
    uint64_t v306 = objc_msgSend_objectAtIndexedSubscript_(v168, v223, 0, v224);
    long long v307 = xmmword_246B22920;
    uint64_t v308 = 2;
    uint64_t v309 = objc_msgSend_objectAtIndexedSubscript_(v168, v225, 1, v226);
    long long v310 = xmmword_246B22930;
    uint64_t v311 = 2;
    uint64_t v312 = objc_msgSend_objectAtIndexedSubscript_(v168, v227, 2, v228);
    long long v313 = xmmword_246B22940;
    uint64_t v314 = 2;
    uint64_t v315 = objc_msgSend_objectAtIndexedSubscript_(v168, v229, 3, v230);
    long long v316 = xmmword_246B22910;
    uint64_t v317 = 2;
    uint64_t v318 = objc_msgSend_objectAtIndexedSubscript_(v168, v231, 4, v232);
    long long v319 = xmmword_246B22920;
    uint64_t v320 = 2;
    uint64_t v321 = objc_msgSend_objectAtIndexedSubscript_(v168, v233, 5, v234);
    long long v322 = xmmword_246B22930;
    uint64_t v323 = 2;
    uint64_t v324 = objc_msgSend_objectAtIndexedSubscript_(v168, v235, 6, v236);
    long long v325 = xmmword_246B22950;
    uint64_t v326 = 2;
    uint64_t v327 = objc_msgSend_objectAtIndexedSubscript_(v168, v237, 7, v238);
    long long v328 = xmmword_246B22960;
    uint64_t v329 = 2;
    uint64_t v330 = objc_msgSend_objectAtIndexedSubscript_(v168, v239, 8, v240);
    int64x2_t v331 = vdupq_n_s64(3uLL);
    uint64_t v332 = 2;
    uint64_t v333 = objc_msgSend_objectAtIndexedSubscript_(v168, v241, 9, v242);
    long long v334 = xmmword_246B22970;
    uint64_t v335 = 2;
    uint64_t v336 = objc_msgSend_objectAtIndexedSubscript_(v168, v243, 10, v244);
    int64x2_t v337 = v331;
    uint64_t v338 = 1;
    objc_msgSend_objectAtIndexedSubscript_(v168, v245, 11, v246);
    v339 = uint64_t v247 = 0;
    do
    {
      v249 = objc_msgSend__faceWithBezelStyle_layoutStyle_nightMode_complications_forDevice_(a1, v248, *(void *)((char *)&v304 + v247), *(void *)((char *)&v304 + v247 + 8), *(void *)((char *)&v304 + v247 + 16), *(uint64_t *)((char *)&v306 + v247), v4);
      objc_msgSend_addObject_(v303, v250, (uint64_t)v249, v251);

      v247 += 32;
    }
    while (v247 != 384);
    v87 = objc_msgSend_copy(v303, v248, v252, v253);
    for (uint64_t i = 376; i != -8; i -= 32)
  }
  else
  {
    v71 = objc_msgSend_array(MEMORY[0x263EFF980], v12, v13, v14);
    for (uint64_t j = 0; j != 3; ++j)
    {
      if (objc_msgSend_count(&unk_26FB12048, v68, v69, v70))
      {
        unint64_t v73 = 0;
        uint64_t v74 = qword_246B22980[j];
        do
        {
          v75 = objc_msgSend_objectAtIndexedSubscript_(&unk_26FB12048, v68, v73, v70);
          uint64_t v79 = objc_msgSend_integerValue(v75, v76, v77, v78);
          v81 = objc_msgSend__faceWithBezelStyle_layoutStyle_nightMode_complications_forDevice_(a1, v80, v79, v74, 2, 0, v4);
          objc_msgSend_addObject_(v71, v82, (uint64_t)v81, v83);

          ++v73;
        }
        while (v73 < objc_msgSend_count(&unk_26FB12048, v84, v85, v86));
      }
    }
    v87 = objc_msgSend_copy(v71, v68, v69, v70);
  }

  return v87;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend__galleryFacesForDevice_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)logCategoryName
{
  return @"foghorn";
}

@end