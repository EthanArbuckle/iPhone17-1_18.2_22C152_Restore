@interface CKMessagesComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
- (CKMessagesComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (CKMessagesComplicationSpecs)specs;
- (DMFCommunicationPolicyMonitor)communicationPolicyMonitor;
- (NSDictionary)communicationPolicies;
- (OS_os_log)log;
- (id)currentSwitcherTemplate;
- (id)fullColorImageProviderForUnreadCount:(unint64_t)a3 family:(int64_t)a4 template:(id)a5;
- (id)imageProviderForUnreadCount:(unint64_t)a3 family:(int64_t)a4 template:(id)a5;
- (id)lockedTemplate;
- (id)privacyTemplate;
- (id)templateForFamily:(int64_t)a3 unreadCount:(unint64_t)a4 locked:(BOOL)a5 privacy:(BOOL)a6;
- (id)textProviderForUnreadCount:(unint64_t)a3 locked:(BOOL)a4 privacy:(BOOL)a5 shortText:(BOOL)a6 tintColor:(id)a7;
- (unint64_t)unreadCount;
- (void)_updateCommunicationPolicies;
- (void)dealloc;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)setCommunicationPolicies:(id)a3;
- (void)setCommunicationPolicyMonitor:(id)a3;
- (void)setDefaultBackgroundForTemplate:(id)a3;
- (void)setInitialUnreadCount:(unint64_t)a3;
- (void)setLog:(id)a3;
- (void)setSpecs:(id)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)unreadCountDidChange:(unint64_t)a3;
@end

@implementation CKMessagesComplicationDataSource

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  if (unint64_t)a3 < 8 && ((0xDDu >> a3)) {
    return 1;
  }
  return (unint64_t)(a3 - 8) < 3 || *MEMORY[0x263EFCF20] == a3 || a3 == 12;
}

+ (id)legacyNTKComplicationType
{
  return &unk_26EB850B8;
}

+ (id)appIdentifier
{
  return @"com.apple.MobileSMS";
}

+ (id)localizedAppName
{
  v2 = NSString;
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  v10 = objc_msgSend_bundleForClass_(v3, v5, v6, v7, v8, v9, v4);
  v16 = objc_msgSend_localizedStringForKey_value_table_(v10, v11, v12, v13, v14, v15, @"MESSAGES_TITLE", &stru_26EB841C8, @"MessagesComplication");
  v22 = objc_msgSend_localizedStringWithFormat_(v2, v17, v18, v19, v20, v21, v16);

  return v22;
}

- (CKMessagesComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CKMessagesComplicationDataSource;
  double v9 = [(CLKCComplicationDataSource *)&v21 initWithComplication:a3 family:a4 forDevice:v8];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.Messages", "CKMessagesComplicationDataSource");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    double v12 = [CKMessagesComplicationSpecs alloc];
    uint64_t v18 = objc_msgSend_initWithDevice_(v12, v13, v14, v15, v16, v17, v8);
    specs = v9->_specs;
    v9->_specs = (CKMessagesComplicationSpecs *)v18;
  }
  return v9;
}

- (void)_updateCommunicationPolicies
{
  id location = 0;
  id v3 = objc_initWeak(&location, self);
  double v9 = objc_msgSend_communicationPolicyMonitor(self, v4, v5, v6, v7, v8);
  id v27 = 0;
  double v15 = objc_msgSend_requestPoliciesByBundleIdentifierWithError_(v9, v10, v11, v12, v13, v14, &v27);
  id v16 = v27;

  if (v16)
  {
    id v17 = objc_loadWeakRetained(&location);
    v23 = objc_msgSend_log(v17, v18, v19, v20, v21, v22);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_2388409C8();
    }
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_23883DEA4;
    v24[3] = &unk_264D48B08;
    objc_copyWeak(&v26, &location);
    id v25 = v15;
    dispatch_async(MEMORY[0x263EF83A0], v24);

    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&location);
}

- (void)dealloc
{
  double v7 = objc_msgSend_log(self, a2, v2, v3, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_238840A3C();
  }

  v8.receiver = self;
  v8.super_class = (Class)CKMessagesComplicationDataSource;
  [(CKMessagesComplicationDataSource *)&v8 dealloc];
}

- (void)unreadCountDidChange:(unint64_t)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  double v9 = objc_msgSend_log(self, a2, v3, v4, v5, v6);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v47 = 134349312;
    uint64_t v48 = objc_msgSend_unreadCount(self, v10, v11, v12, v13, v14);
    __int16 v49 = 2050;
    unint64_t v50 = a3;
    _os_log_impl(&dword_23883B000, v9, OS_LOG_TYPE_DEFAULT, "unread count did change from: %{public}lu to: %{public}lu", (uint8_t *)&v47, 0x16u);
  }

  if (objc_msgSend_unreadCount(self, v15, v16, v17, v18, v19) != a3)
  {
    objc_msgSend_setUnreadCount_(self, v20, v21, v22, v23, v24, a3);
    v30 = objc_msgSend_delegate(self, v25, v26, v27, v28, v29);
    objc_msgSend_invalidateEntries(v30, v31, v32, v33, v34, v35);

    v41 = objc_msgSend_delegate(self, v36, v37, v38, v39, v40);
    objc_msgSend_invalidateSwitcherTemplate(v41, v42, v43, v44, v45, v46);
  }
}

- (void)setInitialUnreadCount:(unint64_t)a3
{
  double v9 = objc_msgSend_log(self, a2, v3, v4, v5, v6);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_238840AA4();
  }

  objc_msgSend_setUnreadCount_(self, v10, v11, v12, v13, v14, a3);
}

- (id)privacyTemplate
{
  double v7 = objc_msgSend_log(self, a2, v2, v3, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_238840B0C();
  }

  double v13 = objc_msgSend_unreadCount(self, v8, v9, v10, v11, v12);
  if (v13)
  {
    uint64_t v19 = objc_msgSend_family(self, v14, v15, v16, v17, v18);
    double v13 = objc_msgSend_templateForFamily_unreadCount_locked_privacy_(self, v20, v21, v22, v23, v24, v19, 0, 0, 1);
  }

  return v13;
}

- (id)lockedTemplate
{
  double v7 = objc_msgSend_log(self, a2, v2, v3, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_238840B40();
  }

  uint64_t v13 = objc_msgSend_family(self, v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_templateForFamily_unreadCount_locked_privacy_(self, v14, v15, v16, v17, v18, v13, 0, 1, 0);

  return v19;
}

- (id)currentSwitcherTemplate
{
  uint64_t v8 = objc_msgSend_family(self, a2, v2, v3, v4, v5);

  return (id)objc_msgSend_templateForFamily_unreadCount_locked_privacy_(self, v7, v9, v10, v11, v12, v8, 0, 1, 0);
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  if (a3)
  {
    double v4 = (void (**)(id, void *))a3;
    double v10 = objc_msgSend_log(self, v5, v6, v7, v8, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_238840B74();
    }

    uint64_t v16 = objc_msgSend_family(self, v11, v12, v13, v14, v15);
    uint64_t v22 = objc_msgSend_unreadCount(self, v17, v18, v19, v20, v21);
    double v28 = objc_msgSend_templateForFamily_unreadCount_locked_privacy_(self, v23, v24, v25, v26, v27, v16, v22, 0, 0);
    double v29 = (void *)MEMORY[0x263EFD168];
    double v35 = objc_msgSend_date(MEMORY[0x263EFF910], v30, v31, v32, v33, v34);
    v41 = objc_msgSend_entryWithDate_complicationTemplate_(v29, v36, v37, v38, v39, v40, v35, v28);

    v4[2](v4, v41);
  }
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  double v6 = (void (**)(id, void))a5;
  double v12 = objc_msgSend_log(self, v7, v8, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v26 = 0;
    _os_log_impl(&dword_23883B000, v12, OS_LOG_TYPE_DEFAULT, "complication tapped", v26, 2u);
  }

  double v18 = objc_msgSend_log(self, v13, v14, v15, v16, v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_238840BA8(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  if (v6) {
    v6[2](v6, 0);
  }
}

- (id)templateForFamily:(int64_t)a3 unreadCount:(unint64_t)a4 locked:(BOOL)a5 privacy:(BOOL)a6
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v335 = *MEMORY[0x263EF8340];
  double v15 = objc_msgSend_communicationPolicies(self, a2, v6, v7, v8, v9);

  if (v15)
  {
    uint64_t v21 = objc_msgSend_communicationPolicies(self, v16, v17, v18, v19, v20);
    double v27 = objc_msgSend_objectForKeyedSubscript_(v21, v22, v23, v24, v25, v26, @"com.apple.MobileSMS");
    BOOL v33 = objc_msgSend_intValue(v27, v28, v29, v30, v31, v32) == 2;
  }
  else
  {
    BOOL v33 = 0;
  }
  BOOL v34 = v11 || v10 || v33;
  if (v34) {
    double v35 = 0;
  }
  else {
    double v35 = (const char *)a4;
  }
  v36 = objc_msgSend_log(self, v16, v17, v18, v19, v20);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    sub_238840C18(a3, v35, v36, v37, v38, v39, v40);
  }

  id v41 = 0;
  switch(a3)
  {
    case 0:
      id v41 = objc_alloc_init(MEMORY[0x263EFD118]);
      int v47 = objc_msgSend_log(self, v42, v43, v44, v45, v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v47, OS_LOG_TYPE_DEFAULT, "creating ModularSmallSimpleImage template", buf, 2u);
      }

      objc_msgSend_imageProviderForUnreadCount_family_template_(self, v48, v49, v50, v51, v52, v35, 0, v41);
      goto LABEL_31;
    case 2:
      id v41 = objc_alloc_init(MEMORY[0x263EFD160]);
      v58 = objc_msgSend_log(self, v53, v54, v55, v56, v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v58, OS_LOG_TYPE_DEFAULT, "creating UtilitarianSmallSquare template", buf, 2u);
      }

      objc_msgSend_imageProviderForUnreadCount_family_template_(self, v59, v60, v61, v62, v63, v35, 2, v41);
      goto LABEL_31;
    case 3:
      id v41 = objc_alloc_init(MEMORY[0x263EFD138]);
      v69 = objc_msgSend_log(self, v64, v65, v66, v67, v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v69, OS_LOG_TYPE_DEFAULT, "creating UtilitarianLargeFlat template", buf, 2u);
      }

      v75 = objc_msgSend_imageProviderForUnreadCount_family_template_(self, v70, v71, v72, v73, v74, 0, 3, v41);
      objc_msgSend_setImageProvider_(v41, v76, v77, v78, v79, v80, v75);

      if (v34)
      {
        if (!v11 || v10 || v33)
        {
          if (!v10 && !v33) {
            goto LABEL_59;
          }
          v86 = NSString;
          v87 = (void *)MEMORY[0x263F086E0];
          uint64_t v88 = objc_opt_class();
          v94 = objc_msgSend_bundleForClass_(v87, v89, v90, v91, v92, v93, v88);
          objc_msgSend_localizedStringForKey_value_table_(v94, v95, v96, v97, v98, v99, @"MESSAGES_TITLE", &stru_26EB841C8, @"MessagesComplication");
        }
        else
        {
          v86 = NSString;
          v292 = (void *)MEMORY[0x263F086E0];
          uint64_t v293 = objc_opt_class();
          v94 = objc_msgSend_bundleForClass_(v292, v294, v295, v296, v297, v298, v293);
          objc_msgSend_localizedStringForKey_value_table_(v94, v299, v300, v301, v302, v303, @"UTILITY_UNLOCK_TO_VIEW", &stru_26EB841C8, @"MessagesComplication");
        v270 = };
        objc_msgSend_localizedStringWithFormat_(v86, v304, v305, v306, v307, v308, v270);
      }
      else
      {
        v257 = NSString;
        v258 = (void *)MEMORY[0x263F086E0];
        uint64_t v259 = objc_opt_class();
        v94 = objc_msgSend_bundleForClass_(v258, v260, v261, v262, v263, v264, v259);
        v270 = objc_msgSend_localizedStringForKey_value_table_(v94, v265, v266, v267, v268, v269, @"NEW_MESSAGES_FORMAT", &stru_26EB841C8, @"MessagesComplication");
        objc_msgSend_localizedStringWithFormat_(v257, v271, v272, v273, v274, v275, v270, a4);
      v309 = };

      v315 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v310, v311, v312, v313, v314, v309);
      objc_msgSend_setTextProvider_(v41, v316, v317, v318, v319, v320, v315);

LABEL_59:
      v133 = objc_msgSend_log(self, v81, v82, v83, v84, v85);
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        v326 = objc_msgSend_textProvider(v41, v321, v322, v323, v324, v325);
        objc_msgSend_text(v326, v327, v328, v329, v330, v331);
        v332 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v334 = v332;
        _os_log_impl(&dword_23883B000, v133, OS_LOG_TYPE_DEFAULT, "added text: %{public}@", buf, 0xCu);
      }
      goto LABEL_33;
    case 4:
      id v41 = objc_alloc_init(MEMORY[0x263EFCFC0]);
      v105 = objc_msgSend_log(self, v100, v101, v102, v103, v104);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v105, OS_LOG_TYPE_DEFAULT, "creating CircularSmallSimpleImage template", buf, 2u);
      }

      objc_msgSend_imageProviderForUnreadCount_family_template_(self, v106, v107, v108, v109, v110, v35, 4, v41);
      goto LABEL_31;
    case 6:
      id v41 = objc_alloc_init(MEMORY[0x263EFD148]);
      v116 = objc_msgSend_log(self, v111, v112, v113, v114, v115);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v116, OS_LOG_TYPE_DEFAULT, "creating UtilitarianSmallFlat template", buf, 2u);
      }

      v122 = objc_msgSend_imageProviderForUnreadCount_family_template_(self, v117, v118, v119, v120, v121, v35, 6, v41);
      objc_msgSend_setImageProvider_(v41, v123, v124, v125, v126, v127, v122);

      v133 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v128, v129, v130, v131, v132, &stru_26EB841C8);
      objc_msgSend_setTextProvider_(v41, v134, v135, v136, v137, v138, v133);
      goto LABEL_33;
    case 7:
      id v41 = objc_alloc_init(MEMORY[0x263EFCFF0]);
      v144 = objc_msgSend_log(self, v139, v140, v141, v142, v143);
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v144, OS_LOG_TYPE_DEFAULT, "creating ExtraLargeSimpleImage template", buf, 2u);
      }

      objc_msgSend_imageProviderForUnreadCount_family_template_(self, v145, v146, v147, v148, v149, v35, 7, v41);
      uint64_t v150 = LABEL_31:;
      goto LABEL_32;
    case 8:
      if (!v35 || v11)
      {
        id v41 = objc_alloc_init(MEMORY[0x263EFD060]);
        v281 = objc_msgSend_log(self, v276, v277, v278, v279, v280);
        if (os_log_type_enabled(v281, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23883B000, v281, OS_LOG_TYPE_DEFAULT, "creating GraphicCorner template without unread count", buf, 2u);
        }

        objc_msgSend_setDefaultBackgroundForTemplate_(self, v282, v283, v284, v285, v286, v41);
        uint64_t v150 = objc_msgSend_fullColorImageProviderForUnreadCount_family_template_(self, v287, v288, v289, v290, v291, v35, 8, v41);
LABEL_32:
        v133 = v150;
        objc_msgSend_setImageProvider_(v41, v151, v152, v153, v154, v155, v150);
LABEL_33:
      }
      else
      {
        id v41 = objc_alloc_init(MEMORY[0x263EFD098]);
        v161 = objc_msgSend_log(self, v156, v157, v158, v159, v160);
        if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v334 = v35;
          _os_log_impl(&dword_23883B000, v161, OS_LOG_TYPE_DEFAULT, "creating GraphicCorner template with unread count %{public}lu", buf, 0xCu);
        }

        v167 = objc_msgSend_fullColorImageProviderForUnreadCount_family_template_(self, v162, v163, v164, v165, v166, 0, 8, v41);
        objc_msgSend_setImageProvider_(v41, v168, v169, v170, v171, v172, v167);

        v178 = objc_msgSend_bubbleTintColor(CKMessagesComplicationSpecs, v173, v174, v175, v176, v177);
        v184 = objc_msgSend_textProviderForUnreadCount_locked_privacy_shortText_tintColor_(self, v179, v180, v181, v182, v183, v35, 0, v10, 1, v178);
        objc_msgSend_setTextProvider_(v41, v185, v186, v187, v188, v189, v184);
      }
LABEL_49:
      return v41;
    case 9:
      id v41 = objc_alloc_init(MEMORY[0x263EFD018]);
      id v190 = objc_alloc_init(MEMORY[0x263EFD030]);
      v196 = objc_msgSend_log(self, v191, v192, v193, v194, v195);
      if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v196, OS_LOG_TYPE_DEFAULT, "creating GraphicBezel template", buf, 2u);
      }

      v202 = objc_msgSend_fullColorImageProviderForUnreadCount_family_template_(self, v197, v198, v199, v200, v201, v35, 10, 0);
      objc_msgSend_setImageProvider_(v190, v203, v204, v205, v206, v207, v202);

      objc_msgSend_setDefaultBackgroundForTemplate_(self, v208, v209, v210, v211, v212, v190);
      objc_msgSend_setCircularTemplate_(v41, v213, v214, v215, v216, v217, v190);
      objc_msgSend_setTextProvider_(v41, v218, v219, v220, v221, v222, 0);

      goto LABEL_49;
    case 10:
      id v41 = objc_alloc_init(MEMORY[0x263EFD030]);
      v228 = objc_msgSend_log(self, v223, v224, v225, v226, v227);
      if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v228, OS_LOG_TYPE_DEFAULT, "creating GraphicCircular template", buf, 2u);
      }

      objc_msgSend_fullColorImageProviderForUnreadCount_family_template_(self, v229, v230, v231, v232, v233, v35, 10, 0);
      goto LABEL_48;
    case 12:
      id v41 = objc_alloc_init(MEMORY[0x263EFD0A0]);
      v239 = objc_msgSend_log(self, v234, v235, v236, v237, v238);
      if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23883B000, v239, OS_LOG_TYPE_DEFAULT, "creating GraphicExtraLarge template", buf, 2u);
      }

      objc_msgSend_fullColorImageProviderForUnreadCount_family_template_(self, v240, v241, v242, v243, v244, v35, 12, 0);
      v245 = LABEL_48:;
      objc_msgSend_setImageProvider_(v41, v246, v247, v248, v249, v250, v245);

      objc_msgSend_setDefaultBackgroundForTemplate_(self, v251, v252, v253, v254, v255, v41);
      goto LABEL_49;
    default:
      goto LABEL_49;
  }
}

- (id)imageProviderForUnreadCount:(unint64_t)a3 family:(int64_t)a4 template:(id)a5
{
  id v8 = a5;
  double v14 = objc_msgSend_sharedInstance(CKMessagesComplicationImageProvider, v9, v10, v11, v12, v13);
  double v20 = objc_msgSend_specs(self, v15, v16, v17, v18, v19);
  double v26 = objc_msgSend_imageForUnreadCount_family_complicationTemplate_specs_(v14, v21, v22, v23, v24, v25, a3, a4, v8, v20);

  BOOL v33 = objc_msgSend_imageProviderWithOnePieceImage_(MEMORY[0x263EFD1D0], v27, v28, v29, v30, v31, v26);
  if (a4 == 6) {
    objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v32, v34, v35, v36, v37);
  }
  else {
  double v38 = objc_msgSend_bubbleTintColor(CKMessagesComplicationSpecs, v32, v34, v35, v36, v37);
  }
  objc_msgSend_setTintColor_(v33, v39, v40, v41, v42, v43, v38);

  return v33;
}

- (id)fullColorImageProviderForUnreadCount:(unint64_t)a3 family:(int64_t)a4 template:(id)a5
{
  id v8 = a5;
  double v14 = objc_msgSend_sharedInstance(CKMessagesComplicationImageProvider, v9, v10, v11, v12, v13);
  double v20 = objc_msgSend_specs(self, v15, v16, v17, v18, v19);
  double v26 = objc_msgSend_imageForUnreadCount_family_complicationTemplate_specs_(v14, v21, v22, v23, v24, v25, a3, a4, v8, v20);

  double v32 = objc_msgSend_providerWithFullColorImage_monochromeFilterType_(MEMORY[0x263EFD1A8], v27, v28, v29, v30, v31, v26, 1);

  return v32;
}

- (id)textProviderForUnreadCount:(unint64_t)a3 locked:(BOOL)a4 privacy:(BOOL)a5 shortText:(BOOL)a6 tintColor:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a7;
  if (v9 || v8)
  {
    if (!v9 || v8)
    {
      if (!v8) {
        goto LABEL_13;
      }
      double v45 = NSString;
      v59 = (void *)MEMORY[0x263F086E0];
      uint64_t v60 = objc_opt_class();
      v53 = objc_msgSend_bundleForClass_(v59, v61, v62, v63, v64, v65, v60);
      objc_msgSend_localizedStringForKey_value_table_(v53, v66, v67, v68, v69, v70, @"MESSAGES_TITLE", &stru_26EB841C8, @"MessagesComplication");
    }
    else
    {
      double v45 = NSString;
      double v46 = (void *)MEMORY[0x263F086E0];
      uint64_t v47 = objc_opt_class();
      v53 = objc_msgSend_bundleForClass_(v46, v48, v49, v50, v51, v52, v47);
      objc_msgSend_localizedStringForKey_value_table_(v53, v54, v55, v56, v57, v58, @"UTILITY_UNLOCK_TO_VIEW", &stru_26EB841C8, @"MessagesComplication");
    double v71 = };
    double v32 = objc_msgSend_localizedStringWithFormat_(v45, v72, v73, v74, v75, v76, v71);

    double v44 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v77, v78, v79, v80, v81, v32);
LABEL_12:

    goto LABEL_14;
  }
  if (v7)
  {
    double v12 = NSString;
    double v13 = (void *)MEMORY[0x263F086E0];
    uint64_t v14 = objc_opt_class();
    double v20 = objc_msgSend_bundleForClass_(v13, v15, v16, v17, v18, v19, v14);
    double v26 = objc_msgSend_localizedStringForKey_value_table_(v20, v21, v22, v23, v24, v25, @"UNREAD_MESSAGES_FORMAT", &stru_26EB841C8, @"MessagesComplication");
    double v32 = objc_msgSend_localizedStringWithFormat_(v12, v27, v28, v29, v30, v31, v26, a3);

    double v38 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v33, v34, v35, v36, v37, v32);
    double v44 = v38;
    if (v11) {
      objc_msgSend_setTintColor_(v38, v39, v40, v41, v42, v43, v11);
    }
    goto LABEL_12;
  }
LABEL_13:
  double v44 = 0;
LABEL_14:

  return v44;
}

- (void)setDefaultBackgroundForTemplate:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v10 = objc_msgSend_log(self, v5, v6, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_238840CD0();
  }

  uint64_t v22 = *MEMORY[0x263EFCF80];
  v23[0] = MEMORY[0x263EFFA88];
  double v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, v12, v13, v14, v15, v23, &v22, 1);
  objc_msgSend_setMetadata_(v4, v17, v18, v19, v20, v21, v16);
}

- (CKMessagesComplicationSpecs)specs
{
  return self->_specs;
}

- (void)setSpecs:(id)a3
{
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (DMFCommunicationPolicyMonitor)communicationPolicyMonitor
{
  return self->_communicationPolicyMonitor;
}

- (void)setCommunicationPolicyMonitor:(id)a3
{
}

- (NSDictionary)communicationPolicies
{
  return self->_communicationPolicies;
}

- (void)setCommunicationPolicies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationPolicies, 0);
  objc_storeStrong((id *)&self->_communicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_specs, 0);
}

@end