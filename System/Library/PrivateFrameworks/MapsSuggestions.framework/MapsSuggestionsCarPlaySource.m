@interface MapsSuggestionsCarPlaySource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)observeExternalAccessory;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)_updateExternalAccessory:(id)a3;
- (void)setObserveExternalAccessory:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsCarPlaySource

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarPlaySource.m";
      __int16 v16 = 1024;
      int v17 = 36;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsCarPlaySource initFromResourceDepot:name:]";
      __int16 v20 = 2082;
      v21 = "nil == (resourceDepot)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, v11, buf, 0x26u);
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarPlaySource.m";
      __int16 v16 = 1024;
      int v17 = 37;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsCarPlaySource initFromResourceDepot:name:]";
      __int16 v20 = 2082;
      v21 = "nil == (resourceDepot.oneSourceDelegate)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = [v6 oneSourceDelegate];
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsCarPlaySource;
  self = [(MapsSuggestionsCarPlaySource *)&v13 initWithDelegate:v9 name:v7];
  v10 = self;
LABEL_10:

  return v10;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (void)setObserveExternalAccessory:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[MapsSuggestionsCarPlaySource isEnabled]
    && self->_observeExternalAccessory != v3)
  {
    self->_observeExternalAccessory = v3;
    id v6 = +[NSNotificationCenter defaultCenter];
    +[MapsExternalAccessory sharedInstance];
    if (v3) {
      v5 = {;
    }
      [v6 addObserver:self selector:"_updateExternalAccessory:" name:@"MapsExternalAccessoryUpdatedNotification" object:v5];
    }
    else {
      v5 = {;
    }
      [v6 removeObserver:self name:@"MapsExternalAccessoryUpdatedNotification" object:v5];
    }
  }
}

- (void)_updateExternalAccessory:(id)a3
{
}

- (void)start
{
  BOOL v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

  [(MapsSuggestionsCarPlaySource *)self setObserveExternalAccessory:1];
}

- (void)stop
{
  BOOL v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "stop", v4, 2u);
  }

  [(MapsSuggestionsCarPlaySource *)self setObserveExternalAccessory:0];
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  BOOL v3 = (void (**)(void))a3;
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(MapsSuggestionsCarPlaySource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v6 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [(MapsSuggestionsCarPlaySource *)self uniqueName];
    NSStringFromMapsSuggestionsCurrentBestLocation();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"ALL";
    *(_WORD *)&buf[22] = 2112;
    CFStringRef v120 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
  }
  v92 = objc_opt_new();
  v10 = +[MapsExternalAccessory sharedInstance];
  unsigned int v11 = [v10 needsFuel];

  if (v11)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_super v13 = [(MapsSuggestionsCarPlaySource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "needsFuel";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    v14 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "needsFuel", "", buf, 2u);
    }
    v88 = v3;

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v15 = +[MapsExternalAccessory sharedInstance];
    __int16 v16 = [v15 engineStates];
    int v17 = [v16 allValues];

    id v18 = [v17 countByEnumeratingWithState:&v101 objects:v106 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v102;
      uint64_t v21 = 1;
      uint64_t v90 = *(void *)v102;
      v91 = v17;
      do
      {
        v22 = 0;
        id v93 = v19;
        do
        {
          uint64_t v23 = v21;
          if (*(void *)v102 != v20) {
            objc_enumerationMutation(v17);
          }
          v24 = *(void **)(*((void *)&v101 + 1) + 8 * (void)v22);
          if ([v24 lowRangeWarning])
          {
            id v25 = [v24 engineType];
            uint64_t v21 = 0;
            id v26 = v25;
            switch((int)v25)
            {
              case 1:
                if (GEOConfigGetBOOL()) {
                  goto LABEL_23;
                }
                goto LABEL_20;
              case 2:
              case 4:
              case 8:
                if ((GEOConfigGetBOOL() & 1) == 0)
                {
LABEL_20:
                  uint64_t v21 = 0;
                  break;
                }
LABEL_23:
                unsigned int v27 = (v26 & 1)
                    + (((v26 << 7) & 0x100u) >> 8)
                    + (((v26 << 14) & 0x10000u) >> 16)
                    + (((v26 << 21) & 0x1000000u) >> 24);
                if ((((v26 >> 2) & 1) << 16) & 0x10000 | (((v26 >> 1) & 1) << 8) & 0x10000)
                {
                  if (v27 <= 1)
                  {
                    MapsSuggestionsLocalizedCarPlayLowEVString();
                    id obj = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v29 = MapsSuggestionsLocalizedFindEVChargerString();
                    goto LABEL_33;
                  }
                }
                else if (v27 <= 1)
                {
                  uint64_t v28 = MapsSuggestionsLocalizedCarPlayLowFuelString();
                  goto LABEL_29;
                }
                uint64_t v28 = MapsSuggestionsLocalizedCarPlayLowFuelAndEVBatteryString();
LABEL_29:
                id obj = (id)v28;
                if ((v26 & 1) != 0 && v27 <= 1)
                {
                  uint64_t v29 = MapsSuggestionsLocalizedFindStationString();
                }
                else
                {
                  uint64_t v29 = MapsSuggestionsLocalizedFindStationForDieselCNGHybridString();
                }
LABEL_33:
                v30 = (void *)v29;
                GEOConfigGetDouble();
                double v32 = v31;
                GEOConfigGetDouble();
                v94 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                id v33 = objc_alloc((Class)NSString);
                v34 = sub_100034948(v26 & 1 | (((v26 >> 3) & 1) << 24) | (((v26 >> 2) & 1) << 16) | (((v26 >> 1) & 1) << 8));
                v35 = [v34 stringByReplacingOccurrencesOfString:@", ", @"_" withString];
                id v36 = [v33 initWithFormat:@"CarPlayLowOnEnergy_%@", v35];

                CFStringRef v107 = @"MapsSuggestionsCarPlayUniqueKey";
                CFStringRef v108 = @"MapsSuggestionsGEOMapItemOriginKey";
                *(void *)buf = v36;
                *(void *)&buf[8] = &off_100074E88;
                CFStringRef v109 = @"MapsSuggestionsCarPlayEnergyTypeKey";
                uint64_t v37 = +[NSNumber numberWithUnsignedInt:v26];
                v38 = (void *)v37;
                CFStringRef v39 = @"evcharger";
                if (!((((v26 >> 2) & 1) << 16) & 0x10000 | (((v26 >> 1) & 1) << 8) & 0x10000)) {
                  CFStringRef v39 = @"gas";
                }
                if (v26 & 1 | (((v26 >> 3) & 1) << 24) & 0x1000101 | (((v26 >> 2) & 1) << 16) & 0x1000101 | (((v26 >> 1) & 1) << 8) & 0x1000101) {
                  CFStringRef v39 = @"gas";
                }
                *(void *)&buf[16] = v37;
                CFStringRef v120 = v39;
                CFStringRef v110 = @"MapsSuggestionsCarPlayEnergyQueryString";
                CFStringRef v111 = @"MapsSuggestionsCarPlayEnergyBulletinTitle";
                id v121 = obj;
                v122 = v30;
                CFStringRef v112 = @"MapsSuggestionsCarPlayEnergyBulletinSubtitle";
                CFStringRef v113 = @"MapsSuggestionsCarPlayEnergyBulletinEngineType";
                v40 = +[NSNumber numberWithUnsignedInt:v26];
                v123 = v40;
                v124 = &off_100074EA0;
                CFStringRef v114 = @"MapsSuggestionsTransportTypeKey";
                CFStringRef v115 = @"MapsSuggestionsPrimaryKey";
                CFStringRef v125 = @"MapsSuggestionsCarPlayUniqueKey";
                v126 = &__kCFBooleanTrue;
                CFStringRef v116 = @"MapsSuggestionsIsNotADestinationKey";
                CFStringRef v117 = @"MapsSuggestionsNeedsETATrackingKey";
                CFStringRef v118 = @"MapsSuggestionsNeedsDistanceTrackingKey";
                v127 = &__kCFBooleanFalse;
                v128 = &__kCFBooleanFalse;
                v41 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v107 count:12];

                v42 = +[MapsSuggestionsEntry entryWithType:10 title:obj subtitle:v30 weight:v94 expires:v41 sourceSpecificInfo:v32];

                [v92 addObject:v42];
                uint64_t v21 = v23;
                uint64_t v20 = v90;
                int v17 = v91;
                id v19 = v93;
                break;
              default:
                break;
            }
          }
          else
          {
            uint64_t v21 = v23;
          }
          v22 = (char *)v22 + 1;
        }
        while (v19 != v22);
        id v19 = [v17 countByEnumeratingWithState:&v101 objects:v106 count:16];
      }
      while (v19);
    }
    else
    {
      LOBYTE(v21) = 1;
    }

    if (![v92 count] && (v21 & 1) != 0)
    {
      v43 = +[MapsExternalAccessory sharedInstance];
      id v44 = [v43 primaryEngineType];
      unsigned int v45 = (v44 & 1)
          + (((v44 << 7) & 0x100u) >> 8)
          + (((v44 << 14) & 0x10000u) >> 16)
          + (((v44 << 21) & 0x1000000u) >> 24);
      if ((((v44 >> 2) & 1) << 16) & 0x10000 | (((v44 >> 1) & 1) << 8) & 0x10000)
      {
        if (v45 <= 1)
        {
          v51 = MapsSuggestionsLocalizedCarPlayLowEVString();
          uint64_t v52 = MapsSuggestionsLocalizedFindEVChargerString();
LABEL_60:
          v53 = (void *)v52;
          GEOConfigGetDouble();
          double v55 = v54;
          GEOConfigGetDouble();
          v56 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
          id v57 = objc_alloc((Class)NSString);
          v58 = sub_100034948(v44 & 1 | (((v44 >> 3) & 1) << 24) | (((v44 >> 2) & 1) << 16) | (((v44 >> 1) & 1) << 8));
          v59 = [v58 stringByReplacingOccurrencesOfString:@", ", @"_" withString];
          id v60 = [v57 initWithFormat:@"CarPlayLowOnEnergy_%@", v59];

          CFStringRef v107 = @"MapsSuggestionsCarPlayUniqueKey";
          CFStringRef v108 = @"MapsSuggestionsGEOMapItemOriginKey";
          *(void *)buf = v60;
          *(void *)&buf[8] = &off_100074E88;
          CFStringRef v109 = @"MapsSuggestionsCarPlayEnergyTypeKey";
          uint64_t v61 = +[NSNumber numberWithUnsignedInt:v44];
          v62 = (void *)v61;
          CFStringRef v63 = @"evcharger";
          if (!((((v44 >> 2) & 1) << 16) & 0x10000 | (((v44 >> 1) & 1) << 8) & 0x10000)) {
            CFStringRef v63 = @"gas";
          }
          if (v44 & 1 | (((v44 >> 3) & 1) << 24) & 0x1000101 | (((v44 >> 2) & 1) << 16) & 0x1000101 | (((v44 >> 1) & 1) << 8) & 0x1000101) {
            CFStringRef v63 = @"gas";
          }
          *(void *)&buf[16] = v61;
          CFStringRef v120 = v63;
          CFStringRef v110 = @"MapsSuggestionsCarPlayEnergyQueryString";
          CFStringRef v111 = @"MapsSuggestionsCarPlayEnergyBulletinTitle";
          id v121 = v51;
          v122 = v53;
          CFStringRef v112 = @"MapsSuggestionsCarPlayEnergyBulletinSubtitle";
          CFStringRef v113 = @"MapsSuggestionsCarPlayEnergyBulletinEngineType";
          v64 = +[NSNumber numberWithUnsignedInt:v44];
          v123 = v64;
          v124 = &off_100074EA0;
          CFStringRef v114 = @"MapsSuggestionsTransportTypeKey";
          CFStringRef v115 = @"MapsSuggestionsPrimaryKey";
          CFStringRef v125 = @"MapsSuggestionsCarPlayUniqueKey";
          v126 = &__kCFBooleanTrue;
          CFStringRef v116 = @"MapsSuggestionsIsNotADestinationKey";
          CFStringRef v117 = @"MapsSuggestionsNeedsETATrackingKey";
          CFStringRef v118 = @"MapsSuggestionsNeedsDistanceTrackingKey";
          v127 = &__kCFBooleanFalse;
          v128 = &__kCFBooleanFalse;
          v65 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v107 count:12];

          v66 = +[MapsSuggestionsEntry entryWithType:10 title:v51 subtitle:v53 weight:v56 expires:v65 sourceSpecificInfo:v55];

          [v92 addObject:v66];
LABEL_81:

          BOOL v3 = v88;
          goto LABEL_82;
        }
      }
      else if (v45 <= 1)
      {
        uint64_t v46 = MapsSuggestionsLocalizedCarPlayLowFuelString();
LABEL_54:
        v51 = (void *)v46;
        if ((v44 & 1) != 0 && v45 <= 1)
        {
          uint64_t v52 = MapsSuggestionsLocalizedFindStationString();
        }
        else
        {
          uint64_t v52 = MapsSuggestionsLocalizedFindStationForDieselCNGHybridString();
        }
        goto LABEL_60;
      }
      uint64_t v46 = MapsSuggestionsLocalizedCarPlayLowFuelAndEVBatteryString();
      goto LABEL_54;
    }
    BOOL v3 = v88;
    if ((unint64_t)[v92 count] < 2)
    {
LABEL_82:
      v79 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        v80 = [(MapsSuggestionsCarPlaySource *)self uniqueName];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v80;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "needsFuel";
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      v81 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v81))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v81, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "needsFuel", "", buf, 2u);
      }

      goto LABEL_87;
    }
    v47 = +[MapsExternalAccessory sharedInstance];
    unsigned int v48 = [v47 engineTypes];
    unsigned int v49 = ((v48 >> 8) & 1) + (v48 & 1) + (HIWORD(v48) & 1) + (HIBYTE(v48) & 1);
    if ((v48 & 0x10000) != 0)
    {
      if (v49 <= 1)
      {
        uint64_t v50 = MapsSuggestionsLocalizedCarPlayLowEVString();
LABEL_66:
        v66 = (void *)v50;

        v67 = +[MapsExternalAccessory sharedInstance];
        unsigned int v68 = [v67 engineTypes];
        if ((v68 & 0x10000) != 0 && ((v68 >> 8) & 1) + (v68 & 1) + (HIWORD(v68) & 1) + (HIBYTE(v68) & 1) <= 1)
        {
          uint64_t v69 = MapsSuggestionsLocalizedFindEVChargerString();
        }
        else if ((v68 & 1) != 0 && ((v68 >> 8) & 1) + (v68 & 1) + (HIWORD(v68) & 1) + (HIBYTE(v68) & 1) <= 1)
        {
          uint64_t v69 = MapsSuggestionsLocalizedFindStationString();
        }
        else
        {
          uint64_t v69 = MapsSuggestionsLocalizedFindStationForDieselCNGHybridString();
        }
        v70 = (void *)v69;

        v71 = +[MapsExternalAccessory sharedInstance];
        id v72 = [v71 primaryEngineType];

        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id obja = v92;
        id v73 = [obja countByEnumeratingWithState:&v97 objects:v105 count:16];
        if (v73)
        {
          id v74 = v73;
          uint64_t v75 = *(void *)v98;
          do
          {
            for (i = 0; i != v74; i = (char *)i + 1)
            {
              if (*(void *)v98 != v75) {
                objc_enumerationMutation(obja);
              }
              v77 = *(void **)(*((void *)&v97 + 1) + 8 * i);
              [v77 setString:v66 forKey:@"MapsSuggestionsCarPlayEnergyBulletinTitle"];
              [v77 setString:v70 forKey:@"MapsSuggestionsCarPlayEnergyBulletinSubtitle"];
              v78 = +[NSNumber numberWithUnsignedInt:v72];
              [v77 setNumber:v78 forKey:@"MapsSuggestionsCarPlayEnergyBulletinEngineType"];
            }
            id v74 = [obja countByEnumeratingWithState:&v97 objects:v105 count:16];
          }
          while (v74);
        }

        goto LABEL_81;
      }
    }
    else if (v49 < 2)
    {
      uint64_t v50 = MapsSuggestionsLocalizedCarPlayLowFuelString();
      goto LABEL_66;
    }
    uint64_t v50 = MapsSuggestionsLocalizedCarPlayLowFuelAndEVBatteryString();
    goto LABEL_66;
  }
LABEL_87:
  [(MapsSuggestionsCarPlaySource *)self addOrUpdateMySuggestionEntries:v92];
  if (v3) {
    v3[2](v3);
  }
  v82 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
  {
    v83 = [(MapsSuggestionsCarPlaySource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v83;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  v84 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v84))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v84, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  GEOConfigGetDouble();
  double v86 = v85;

  return v86;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 10;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)observeExternalAccessory
{
  return self->_observeExternalAccessory;
}

@end