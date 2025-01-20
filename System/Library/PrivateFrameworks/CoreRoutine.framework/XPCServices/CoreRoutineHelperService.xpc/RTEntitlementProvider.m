@interface RTEntitlementProvider
+ (id)daemonProtocolEntitlementProvider;
+ (id)helperServiceProtocolEntitlementProvider;
+ (id)internalDaemonProtocolEntitlementProvider;
+ (id)safetyMonitorDaemonProtocolEntitlementProvider;
+ (id)selectorsForProtocol:(id)a3;
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4;
- (NSDictionary)entitlementsDictionary;
- (Protocol)protocol;
- (RTEntitlementProvider)init;
- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4;
- (void)setEntitlementsDictionary:(id)a3;
@end

@implementation RTEntitlementProvider

- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v15 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: connection";
LABEL_13:
      v18 = buf;
LABEL_14:
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    }
LABEL_28:

LABEL_29:
    BOOL v27 = 0;
    goto LABEL_30;
  }
  if (!v7)
  {
    v15 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: invocation";
      goto LABEL_13;
    }
    goto LABEL_28;
  }
  if (!sel_isEqual((SEL)[v7 selector], "fetchEnumerableObjectsWithOptions:offset:reply:"))
  {
    entitlementsDictionary = self->_entitlementsDictionary;
    v20 = NSStringFromSelector((SEL)[v8 selector]);
    v14 = [(NSDictionary *)entitlementsDictionary objectForKey:v20];

    if (!v14)
    {
LABEL_7:
      v15 = sub_1000071D0(&qword_10002D370);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v16 = NSStringFromSelector((SEL)[v8 selector]);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v16;
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "\"%@\" requires no entitlements.", buf, 0xCu);
      }
      goto LABEL_28;
    }
    goto LABEL_16;
  }
  *(void *)buf = 0;
  [v8 getArgument:buf atIndex:2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)v39 = 0;
    v17 = "Invalid parameter not satisfying: [options isKindOfClass:[RTEnumerationOptions class]]";
    v18 = v39;
    goto LABEL_14;
  }
  v9 = self->_entitlementsDictionary;
  v10 = NSStringFromSelector((SEL)[v8 selector]);
  v11 = [(NSDictionary *)v9 objectForKey:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v39 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [optionsEntitlements isKindOfClass:[NSDictionary class]]", v39, 2u);
    }

    goto LABEL_29;
  }
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 objectForKey:v13];

  if (!v14) {
    goto LABEL_7;
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [requiredEntitlements isKindOfClass:[NSArray class]]", buf, 2u);
    }

    goto LABEL_29;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v14;
  id v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v22)
  {
    BOOL v27 = 1;
    goto LABEL_42;
  }
  id v23 = v22;
  uint64_t v24 = *(void *)v36;
  while (2)
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v36 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = sub_1000071D0(&qword_10002D358);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_41:

          BOOL v27 = 0;
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v32 = "Invalid parameter not satisfying: [entitlement isKindOfClass:[NSString class]]";
        v33 = v31;
        uint32_t v34 = 2;
LABEL_45:
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
        goto LABEL_41;
      }
      if (!-[RTEntitlementProvider clientConnection:hasEntitlement:](self, "clientConnection:hasEntitlement:", v6, v26, (void)v35))
      {
        v31 = sub_1000071D0(&qword_10002D370);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        __int16 v41 = 2112;
        uint64_t v42 = v26;
        v32 = "%@, does not have entitlement, %@";
        v33 = v31;
        uint32_t v34 = 22;
        goto LABEL_45;
      }
    }
    id v23 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
    BOOL v27 = 1;
    if (v23) {
      continue;
    }
    break;
  }
LABEL_42:

LABEL_30:
  return v27;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    v10 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      unsigned __int8 v9 = 0;
      goto LABEL_11;
    }
    __int16 v15 = 0;
    v11 = "Invalid parameter not satisfying: connection";
    v12 = (uint8_t *)&v15;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_8;
  }
  if (!v6)
  {
    v10 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v14 = 0;
    v11 = "Invalid parameter not satisfying: entitlement";
    v12 = (uint8_t *)&v14;
    goto LABEL_13;
  }
  v8 = [v5 valueForEntitlement:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  else {
    unsigned __int8 v9 = 0;
  }

LABEL_11:
  return v9;
}

- (RTEntitlementProvider)init
{
  uint64_t v2 = objc_opt_class();
  sub_10000BD50(v2, "initWithProtocol:entitlementsDictionary:");
}

- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = v8;
  if (!v7)
  {
    __int16 v15 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      __int16 v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: protocol";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    __int16 v15 = sub_1000071D0(&qword_10002D358);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: entitlementsDictionary";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTEntitlementProvider;
  v10 = [(RTEntitlementProvider *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_protocol, a3);
    v12 = (NSDictionary *)[v9 copy];
    entitlementsDictionary = v11->_entitlementsDictionary;
    v11->_entitlementsDictionary = v12;
  }
  self = v11;
  __int16 v14 = self;
LABEL_10:

  return v14;
}

+ (id)daemonProtocolEntitlementProvider
{
  v188 = &OBJC_PROTOCOL___RTDaemonProtocol;
  v187 = NSStringFromSelector("setRoutineEnabled:reply:");
  v279[0] = v187;
  CFStringRef v278 = @"com.apple.CoreRoutine.preferences";
  v186 = +[NSArray arrayWithObjects:&v278 count:1];
  v280[0] = v186;
  v185 = NSStringFromSelector("clearRoutineWithReply:");
  v279[1] = v185;
  CFStringRef v277 = @"com.apple.CoreRoutine.preferences";
  v184 = +[NSArray arrayWithObjects:&v277 count:1];
  v280[1] = v184;
  v183 = NSStringFromSelector("fetchPathToDiagnosticFilesWithOptions:reply:");
  v279[2] = v183;
  CFStringRef v276 = @"com.apple.CoreRoutine.preferences";
  v182 = +[NSArray arrayWithObjects:&v276 count:1];
  v280[2] = v182;
  v181 = NSStringFromSelector("fetchRoutineEnabledWithReply:");
  v279[3] = v181;
  v280[3] = &__NSArray0__struct;
  v180 = NSStringFromSelector("setRestorationIdentifier:");
  v279[4] = v180;
  v280[4] = &__NSArray0__struct;
  v179 = NSStringFromSelector("setTargetUserSession:");
  v279[5] = v179;
  CFStringRef v275 = @"com.apple.private.xpc.launchd.per-user-lookup";
  v178 = +[NSArray arrayWithObjects:&v275 count:1];
  v280[5] = v178;
  v177 = NSStringFromSelector("startMonitoringPlaceInferencesWithOptions:reply:");
  v279[6] = v177;
  CFStringRef v274 = @"com.apple.CoreRoutine.LocationOfInterest";
  v176 = +[NSArray arrayWithObjects:&v274 count:1];
  v280[6] = v176;
  v175 = NSStringFromSelector("stopMonitoringPlaceInferencesWithReply:");
  v279[7] = v175;
  CFStringRef v273 = @"com.apple.CoreRoutine.LocationOfInterest";
  v174 = +[NSArray arrayWithObjects:&v273 count:1];
  v280[7] = v174;
  v173 = NSStringFromSelector("fetchFamiliarityIndexResultsWithOptions:reply:");
  v279[8] = v173;
  CFStringRef v272 = @"com.apple.CoreRoutine.LocationOfInterest";
  v172 = +[NSArray arrayWithObjects:&v272 count:1];
  v280[8] = v172;
  v171 = NSStringFromSelector("fetchLocationsOfInterestWithinDistance:ofLocation:reply:");
  v279[9] = v171;
  CFStringRef v271 = @"com.apple.CoreRoutine.LocationOfInterest";
  v170 = +[NSArray arrayWithObjects:&v271 count:1];
  v280[9] = v170;
  v169 = NSStringFromSelector("fetchLocationsOfInterestOfType:reply:");
  v279[10] = v169;
  CFStringRef v270 = @"com.apple.CoreRoutine.LocationOfInterest";
  v168 = +[NSArray arrayWithObjects:&v270 count:1];
  v280[10] = v168;
  v167 = NSStringFromSelector("fetchAllLocationsOfInterestForSettingsWithReply:");
  v279[11] = v167;
  v269[0] = @"com.apple.CoreRoutine.LocationOfInterest";
  v269[1] = @"com.apple.CoreRoutine.preferences";
  v166 = +[NSArray arrayWithObjects:v269 count:2];
  v280[11] = v166;
  v165 = NSStringFromSelector("fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:reply:");
  v279[12] = v165;
  CFStringRef v268 = @"com.apple.CoreRoutine.LocationOfInterest";
  v164 = +[NSArray arrayWithObjects:&v268 count:1];
  v280[12] = v164;
  v163 = NSStringFromSelector("fetchPlaceInferencesWithOptions:reply:");
  v279[13] = v163;
  CFStringRef v267 = @"com.apple.CoreRoutine.LocationOfInterest";
  v162 = +[NSArray arrayWithObjects:&v267 count:1];
  v280[13] = v162;
  v161 = NSStringFromSelector("fetchFormattedPostalAddressesFromMeCard:");
  v279[14] = v161;
  CFStringRef v266 = @"com.apple.CoreRoutine.LocationOfInterest";
  v160 = +[NSArray arrayWithObjects:&v266 count:1];
  v280[14] = v160;
  v159 = NSStringFromSelector("fetchRoutineModeFromLocation:reply:");
  v279[15] = v159;
  CFStringRef v265 = @"com.apple.CoreRoutine.LocationOfInterest";
  v158 = +[NSArray arrayWithObjects:&v265 count:1];
  v280[15] = v158;
  v157 = NSStringFromSelector("fetchLocationsOfInterestAssociatedToIdentifier:reply:");
  v279[16] = v157;
  CFStringRef v264 = @"com.apple.CoreRoutine.LocationOfInterest";
  v156 = +[NSArray arrayWithObjects:&v264 count:1];
  v280[16] = v156;
  v155 = NSStringFromSelector("fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:reply:");
  v279[17] = v155;
  CFStringRef v263 = @"com.apple.CoreRoutine.LocationOfInterest";
  v154 = +[NSArray arrayWithObjects:&v263 count:1];
  v280[17] = v154;
  v153 = NSStringFromSelector("fetchPredictedLocationsOfInterestOnDate:reply:");
  v279[18] = v153;
  CFStringRef v262 = @"com.apple.CoreRoutine.LocationOfInterest";
  v152 = +[NSArray arrayWithObjects:&v262 count:1];
  v280[18] = v152;
  v151 = NSStringFromSelector("fetchCurrentPredictedLocationsOfInterestLookingBack:lookingAhead:reply:");
  v279[19] = v151;
  CFStringRef v261 = @"com.apple.CoreRoutine.LocationOfInterest";
  v150 = +[NSArray arrayWithObjects:&v261 count:1];
  v280[19] = v150;
  v149 = NSStringFromSelector("performBluePOIQueryLookingBack:lookingAhead:reply:");
  v279[20] = v149;
  CFStringRef v260 = @"com.apple.CoreRoutine.LocationOfInterest";
  v148 = +[NSArray arrayWithObjects:&v260 count:1];
  v280[20] = v148;
  v147 = NSStringFromSelector("fetchLocationOfInterestWithIdentifier:reply:");
  v279[21] = v147;
  CFStringRef v259 = @"com.apple.CoreRoutine.LocationOfInterest";
  v146 = +[NSArray arrayWithObjects:&v259 count:1];
  v280[21] = v146;
  v145 = NSStringFromSelector("fetchLocationsOfInterestVisitedBetweenStartDate:endDate:reply:");
  v279[22] = v145;
  CFStringRef v258 = @"com.apple.CoreRoutine.LocationOfInterest";
  v144 = +[NSArray arrayWithObjects:&v258 count:1];
  v280[22] = v144;
  v143 = NSStringFromSelector("fetchLocationOfInterestAtLocation:reply:");
  v279[23] = v143;
  CFStringRef v257 = @"com.apple.CoreRoutine.LocationOfInterest";
  v142 = +[NSArray arrayWithObjects:&v257 count:1];
  v280[23] = v142;
  v141 = NSStringFromSelector("fetchLocationOfInterestForRegion:reply:");
  v279[24] = v141;
  CFStringRef v256 = @"com.apple.CoreRoutine.LocationOfInterest";
  v140 = +[NSArray arrayWithObjects:&v256 count:1];
  v280[24] = v140;
  v139 = NSStringFromSelector("addLocationOfInterestOfType:mapItemStorage:customLabel:reply:");
  v279[25] = v139;
  CFStringRef v255 = @"com.apple.CoreRoutine.LocationOfInterest";
  v138 = +[NSArray arrayWithObjects:&v255 count:1];
  v280[25] = v138;
  v137 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:type:reply:");
  v279[26] = v137;
  CFStringRef v254 = @"com.apple.CoreRoutine.LocationOfInterest";
  v136 = +[NSArray arrayWithObjects:&v254 count:1];
  v280[26] = v136;
  v135 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:customLabel:reply:");
  v279[27] = v135;
  CFStringRef v253 = @"com.apple.CoreRoutine.LocationOfInterest";
  v134 = +[NSArray arrayWithObjects:&v253 count:1];
  v280[27] = v134;
  v133 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:mapItemStorage:reply:");
  v279[28] = v133;
  CFStringRef v252 = @"com.apple.CoreRoutine.LocationOfInterest";
  v132 = +[NSArray arrayWithObjects:&v252 count:1];
  v280[28] = v132;
  v131 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:type:customLabel:reply:");
  v279[29] = v131;
  CFStringRef v251 = @"com.apple.CoreRoutine.LocationOfInterest";
  v130 = +[NSArray arrayWithObjects:&v251 count:1];
  v280[29] = v130;
  v129 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:type:mapItemStorage:customLabel:reply:");
  v279[30] = v129;
  CFStringRef v250 = @"com.apple.CoreRoutine.LocationOfInterest";
  v128 = +[NSArray arrayWithObjects:&v250 count:1];
  v280[30] = v128;
  v127 = NSStringFromSelector("fetchTransitionsBetweenStartDate:endDate:reply:");
  v279[31] = v127;
  CFStringRef v249 = @"com.apple.CoreRoutine.LocationOfInterest";
  v126 = +[NSArray arrayWithObjects:&v249 count:1];
  v280[31] = v126;
  v125 = NSStringFromSelector("fetchDedupedLocationOfInterestIdentifiersWithIdentifier:reply:");
  v279[32] = v125;
  CFStringRef v248 = @"com.apple.CoreRoutine.LocationOfInterest";
  v124 = +[NSArray arrayWithObjects:&v248 count:1];
  v280[32] = v124;
  v123 = NSStringFromSelector("fetchAuthorizedLocationStatus:");
  v279[33] = v123;
  CFStringRef v247 = @"com.apple.CoreRoutine.AuthorizedLocation";
  v122 = +[NSArray arrayWithObjects:&v247 count:1];
  v280[33] = v122;
  v121 = NSStringFromSelector("setHintForRegionState:significantRegion:reply:");
  v279[34] = v121;
  CFStringRef v246 = @"com.apple.CoreRoutine.LocationOfInterest";
  v120 = +[NSArray arrayWithObjects:&v246 count:1];
  v280[34] = v120;
  v119 = NSStringFromSelector("fetchPredictedExitDatesFromLocation:onDate:reply:");
  v279[35] = v119;
  CFStringRef v245 = @"com.apple.CoreRoutine.Prediction";
  v118 = +[NSArray arrayWithObjects:&v245 count:1];
  v280[35] = v118;
  v117 = NSStringFromSelector("fetchPredictedLocationsOfInterestBetweenStartDate:endDate:reply:");
  v279[36] = v117;
  CFStringRef v244 = @"com.apple.CoreRoutine.Prediction";
  v116 = +[NSArray arrayWithObjects:&v244 count:1];
  v280[36] = v116;
  v115 = NSStringFromSelector("userInteractionWithPredictedLocationOfInterest:interaction:feedback:geoMapItem:reply:");
  v279[37] = v115;
  CFStringRef v243 = @"com.apple.CoreRoutine.Prediction";
  v114 = +[NSArray arrayWithObjects:&v243 count:1];
  v280[37] = v114;
  v113 = NSStringFromSelector("startMonitoringVehicleEventsWithReply:");
  v279[38] = v113;
  CFStringRef v242 = @"com.apple.CoreRoutine.VehicleLocation";
  v112 = +[NSArray arrayWithObjects:&v242 count:1];
  v280[38] = v112;
  v111 = NSStringFromSelector("stopMonitoringVehicleEventsWithReply:");
  v279[39] = v111;
  CFStringRef v241 = @"com.apple.CoreRoutine.VehicleLocation";
  v110 = +[NSArray arrayWithObjects:&v241 count:1];
  v280[39] = v110;
  v109 = NSStringFromSelector("fetchLastVehicleEventsWithReply:");
  v279[40] = v109;
  CFStringRef v240 = @"com.apple.CoreRoutine.VehicleLocation";
  v108 = +[NSArray arrayWithObjects:&v240 count:1];
  v280[40] = v108;
  v107 = NSStringFromSelector("vehicleEventAtLocation:notes:reply:");
  v279[41] = v107;
  CFStringRef v239 = @"com.apple.CoreRoutine.VehicleLocation";
  v106 = +[NSArray arrayWithObjects:&v239 count:1];
  v280[41] = v106;
  v105 = NSStringFromSelector("clearAllVehicleEventsWithReply:");
  v279[42] = v105;
  CFStringRef v238 = @"com.apple.CoreRoutine.VehicleLocation";
  v104 = +[NSArray arrayWithObjects:&v238 count:1];
  v280[42] = v104;
  v103 = NSStringFromSelector("updateVehicleEventWithIdentifier:notes:reply:");
  v279[43] = v103;
  CFStringRef v237 = @"com.apple.CoreRoutine.VehicleLocation";
  v102 = +[NSArray arrayWithObjects:&v237 count:1];
  v280[43] = v102;
  v101 = NSStringFromSelector("updateVehicleEventWithIdentifier:photo:reply:");
  v279[44] = v101;
  CFStringRef v236 = @"com.apple.CoreRoutine.VehicleLocation";
  v100 = +[NSArray arrayWithObjects:&v236 count:1];
  v280[44] = v100;
  v99 = NSStringFromSelector("updateVehicleEventWithIdentifier:geoMapItem:reply:");
  v279[45] = v99;
  CFStringRef v235 = @"com.apple.CoreRoutine.VehicleLocation";
  v98 = +[NSArray arrayWithObjects:&v235 count:1];
  v280[45] = v98;
  v97 = NSStringFromSelector("updateVehicleEventWithIdentifier:location:reply:");
  v279[46] = v97;
  CFStringRef v234 = @"com.apple.CoreRoutine.VehicleLocation";
  v96 = +[NSArray arrayWithObjects:&v234 count:1];
  v280[46] = v96;
  v95 = NSStringFromSelector("engageInVehicleEventWithIdentifier:reply:");
  v279[47] = v95;
  CFStringRef v233 = @"com.apple.CoreRoutine.VehicleLocation";
  v94 = +[NSArray arrayWithObjects:&v233 count:1];
  v280[47] = v94;
  v93 = NSStringFromSelector("fetchAutomaticVehicleEventDetectionSupportedWithReply:");
  v279[48] = v93;
  CFStringRef v232 = @"com.apple.CoreRoutine.VehicleLocation";
  v92 = +[NSArray arrayWithObjects:&v232 count:1];
  v280[48] = v92;
  v91 = NSStringFromSelector("removeLocationOfInterestWithIdentifier:reply:");
  v279[49] = v91;
  CFStringRef v231 = @"com.apple.CoreRoutine.LocationOfInterest.Delete";
  v90 = +[NSArray arrayWithObjects:&v231 count:1];
  v280[49] = v90;
  v89 = NSStringFromSelector("removeVisitWithIdentifier:reply:");
  v279[50] = v89;
  CFStringRef v230 = @"com.apple.CoreRoutine.LocationOfInterest.Delete";
  v88 = +[NSArray arrayWithObjects:&v230 count:1];
  v280[50] = v88;
  v87 = NSStringFromSelector("extendLifetimeOfVisitsWithIdentifiers:reply:");
  v279[51] = v87;
  CFStringRef v229 = @"com.apple.CoreRoutine.LocationOfInterest.ExtendLifetime";
  v86 = +[NSArray arrayWithObjects:&v229 count:1];
  v280[51] = v86;
  v85 = NSStringFromSelector("fetchCloudSyncAuthorizationStateWithReply:");
  v279[52] = v85;
  CFStringRef v228 = @"com.apple.CoreRoutine.CloudSync";
  v84 = +[NSArray arrayWithObjects:&v228 count:1];
  v280[52] = v84;
  v83 = NSStringFromSelector("updateCloudSyncProvisionedForAccount:reply:");
  v279[53] = v83;
  CFStringRef v227 = @"com.apple.CoreRoutine.CloudSync";
  v82 = +[NSArray arrayWithObjects:&v227 count:1];
  v280[53] = v82;
  v81 = NSStringFromSelector("fetchLookbackWindowStartDateWithLocation:reply:");
  v279[54] = v81;
  CFStringRef v226 = @"com.apple.CoreRoutine.StoredLocation";
  v80 = +[NSArray arrayWithObjects:&v226 count:1];
  v280[54] = v80;
  v79 = NSStringFromSelector("fetchStoredLocationsWithContext:reply:");
  v279[55] = v79;
  CFStringRef v225 = @"com.apple.CoreRoutine.StoredLocation";
  v78 = +[NSArray arrayWithObjects:&v225 count:1];
  v280[55] = v78;
  v77 = NSStringFromSelector("fetchEstimatedLocationAtDate:options:reply:");
  v279[56] = v77;
  CFStringRef v224 = @"com.apple.CoreRoutine.StoredLocation";
  v76 = +[NSArray arrayWithObjects:&v224 count:1];
  v280[56] = v76;
  v75 = NSStringFromSelector("startMonitoringVisitsWithReply:");
  v279[57] = v75;
  CFStringRef v223 = @"com.apple.CoreRoutine.Visit";
  v74 = +[NSArray arrayWithObjects:&v223 count:1];
  v280[57] = v74;
  v73 = NSStringFromSelector("stopMonitoringVisitsWithReply:");
  v279[58] = v73;
  CFStringRef v222 = @"com.apple.CoreRoutine.Visit";
  v72 = +[NSArray arrayWithObjects:&v222 count:1];
  v280[58] = v72;
  v71 = NSStringFromSelector("startLeechingVisitsWithReply:");
  v279[59] = v71;
  CFStringRef v221 = @"com.apple.CoreRoutine.Visit";
  v70 = +[NSArray arrayWithObjects:&v221 count:1];
  v280[59] = v70;
  v69 = NSStringFromSelector("stopLeechingVisitsWithReply:");
  v279[60] = v69;
  CFStringRef v220 = @"com.apple.CoreRoutine.Visit";
  v68 = +[NSArray arrayWithObjects:&v220 count:1];
  v280[60] = v68;
  v67 = NSStringFromSelector("startLeechingLowConfidenceVisitsWithReply:");
  v279[61] = v67;
  CFStringRef v219 = @"com.apple.CoreRoutine.Visit";
  v66 = +[NSArray arrayWithObjects:&v219 count:1];
  v280[61] = v66;
  v65 = NSStringFromSelector("stopLeechingLowConfidenceVisitsWithReply:");
  v279[62] = v65;
  CFStringRef v218 = @"com.apple.CoreRoutine.Visit";
  v64 = +[NSArray arrayWithObjects:&v218 count:1];
  v280[62] = v64;
  v63 = NSStringFromSelector("fetchStoredVisitsWithOptions:reply:");
  v279[63] = v63;
  CFStringRef v217 = @"com.apple.CoreRoutine.Visit";
  v62 = +[NSArray arrayWithObjects:&v217 count:1];
  v280[63] = v62;
  v61 = NSStringFromSelector("processHindsightVisitsWithReply:");
  v279[64] = v61;
  CFStringRef v216 = @"com.apple.CoreRoutine.Visit";
  v60 = +[NSArray arrayWithObjects:&v216 count:1];
  v280[64] = v60;
  v59 = NSStringFromSelector("fetchTripSegmentsWithOptions:reply:");
  v279[65] = v59;
  CFStringRef v215 = @"com.apple.CoreRoutine.TripSegment";
  v57 = +[NSArray arrayWithObjects:&v215 count:1];
  v280[65] = v57;
  v56 = NSStringFromSelector("fetchLocationsCountForTripSegmentWithOptions:reply:");
  v279[66] = v56;
  CFStringRef v214 = @"com.apple.CoreRoutine.TripSegment";
  v55 = +[NSArray arrayWithObjects:&v214 count:1];
  v280[66] = v55;
  v54 = NSStringFromSelector("fetchLocationsForTripSegmentWithOptions:reply:");
  v279[67] = v54;
  CFStringRef v213 = @"com.apple.CoreRoutine.TripSegment";
  v53 = +[NSArray arrayWithObjects:&v213 count:1];
  v280[67] = v53;
  v52 = NSStringFromSelector("deleteTripSegmentWithUUID:reply:");
  v279[68] = v52;
  CFStringRef v212 = @"com.apple.CoreRoutine.TripSegment";
  v51 = +[NSArray arrayWithObjects:&v212 count:1];
  v280[68] = v51;
  v50 = NSStringFromSelector("fetchVehiclesWithOptions:reply:");
  v279[69] = v50;
  CFStringRef v211 = @"com.apple.CoreRoutine.TripSegment";
  v49 = +[NSArray arrayWithObjects:&v211 count:1];
  v280[69] = v49;
  v48 = NSStringFromSelector("fetchTripSegmentMetadataWithOptions:reply:");
  v279[70] = v48;
  CFStringRef v210 = @"com.apple.CoreRoutine.TripSegment";
  v47 = +[NSArray arrayWithObjects:&v210 count:1];
  v280[70] = v47;
  v46 = NSStringFromSelector("fetchBackgroundInertialOdometrySamplesWithOptions:reply:");
  v279[71] = v46;
  CFStringRef v209 = @"com.apple.CoreRoutine.BackgroundInertialOdometry";
  v45 = +[NSArray arrayWithObjects:&v209 count:1];
  v280[71] = v45;
  v44 = NSStringFromSelector("addBackgroundInertialOdometrySamples:reply:");
  v279[72] = v44;
  CFStringRef v208 = @"com.apple.CoreRoutine.BackgroundInertialOdometry";
  v43 = +[NSArray arrayWithObjects:&v208 count:1];
  v280[72] = v43;
  uint64_t v42 = NSStringFromSelector("startMonitoringScenarioTriggerOfType:reply:");
  v279[73] = v42;
  CFStringRef v207 = @"com.apple.CoreRoutine.ScenarioTrigger";
  __int16 v41 = +[NSArray arrayWithObjects:&v207 count:1];
  v280[73] = v41;
  v40 = NSStringFromSelector("stopMonitoringScenarioTriggerOfType:reply:");
  v279[74] = v40;
  CFStringRef v206 = @"com.apple.CoreRoutine.ScenarioTrigger";
  v39 = +[NSArray arrayWithObjects:&v206 count:1];
  v280[74] = v39;
  long long v38 = NSStringFromSelector("fetchMonitoredScenarioTriggerTypesWithReply:");
  v279[75] = v38;
  CFStringRef v205 = @"com.apple.CoreRoutine.ScenarioTrigger";
  long long v37 = +[NSArray arrayWithObjects:&v205 count:1];
  v280[75] = v37;
  long long v36 = NSStringFromSelector("fetchEnumerableObjectsWithOptions:offset:reply:");
  v279[76] = v36;
  uint64_t v2 = (objc_class *)objc_opt_class();
  long long v35 = NSStringFromClass(v2);
  v203[0] = v35;
  CFStringRef v202 = @"com.apple.CoreRoutine.LocationOfInterest";
  uint32_t v34 = +[NSArray arrayWithObjects:&v202 count:1];
  v204[0] = v34;
  v3 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v3);
  v203[1] = v33;
  CFStringRef v201 = @"com.apple.CoreRoutine.Hint";
  v32 = +[NSArray arrayWithObjects:&v201 count:1];
  v204[1] = v32;
  v4 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v4);
  v203[2] = v31;
  CFStringRef v200 = @"com.apple.CoreRoutine.StoredLocation";
  v30 = +[NSArray arrayWithObjects:&v200 count:1];
  v204[2] = v30;
  v29 = +[NSDictionary dictionaryWithObjects:v204 forKeys:v203 count:3];
  v280[76] = v29;
  v28 = NSStringFromSelector("startMonitoringForPeopleDiscovery:configuration:reply:");
  v279[77] = v28;
  CFStringRef v199 = @"com.apple.CoreRoutine.PeopleDiscovery";
  BOOL v27 = +[NSArray arrayWithObjects:&v199 count:1];
  v280[77] = v27;
  uint64_t v26 = NSStringFromSelector("stopMonitoringForPeopleDiscoveryWithReply:");
  v279[78] = v26;
  CFStringRef v198 = @"com.apple.CoreRoutine.PeopleDiscovery";
  v25 = +[NSArray arrayWithObjects:&v198 count:1];
  v280[78] = v25;
  uint64_t v24 = NSStringFromSelector("fetchProximityHistoryFromStartDate:endDate:completionHandler:");
  v279[79] = v24;
  CFStringRef v197 = @"com.apple.CoreRoutine.PeopleDiscovery";
  id v23 = +[NSArray arrayWithObjects:&v197 count:1];
  v280[79] = v23;
  id v22 = NSStringFromSelector("fetchProximityHistoryFromEventIDs:completionHandler:");
  v279[80] = v22;
  CFStringRef v196 = @"com.apple.CoreRoutine.PeopleDiscovery";
  id v21 = +[NSArray arrayWithObjects:&v196 count:1];
  v280[80] = v21;
  v20 = NSStringFromSelector("fetchPeopleCountEventsHistory:completionHandler:");
  v279[81] = v20;
  CFStringRef v195 = @"com.apple.CoreRoutine.PeopleDiscovery";
  v19 = +[NSArray arrayWithObjects:&v195 count:1];
  v280[81] = v19;
  objc_super v18 = NSStringFromSelector("fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:");
  v279[82] = v18;
  CFStringRef v194 = @"com.apple.CoreRoutine.PeopleDiscovery";
  v17 = +[NSArray arrayWithObjects:&v194 count:1];
  v280[82] = v17;
  id v5 = NSStringFromSelector("fetchOngoingPeopleDensity:");
  v279[83] = v5;
  CFStringRef v193 = @"com.apple.CoreRoutine.PeopleDiscovery";
  id v6 = +[NSArray arrayWithObjects:&v193 count:1];
  v280[83] = v6;
  id v7 = NSStringFromSelector("fetchContactScoresFromContactIDs:completionHandler:");
  v279[84] = v7;
  CFStringRef v192 = @"com.apple.CoreRoutine.PeopleDiscovery";
  id v8 = +[NSArray arrayWithObjects:&v192 count:1];
  v280[84] = v8;
  unsigned __int8 v9 = NSStringFromSelector("fetchElevationsWithOptions:reply:");
  v279[85] = v9;
  CFStringRef v191 = @"com.apple.CoreRoutine.StoredElevation";
  v10 = +[NSArray arrayWithObjects:&v191 count:1];
  v280[85] = v10;
  v11 = NSStringFromSelector("addElevations:handler:");
  v279[86] = v11;
  CFStringRef v190 = @"com.apple.CoreRoutine.StoredElevation";
  v12 = +[NSArray arrayWithObjects:&v190 count:1];
  v280[86] = v12;
  v13 = NSStringFromSelector("fetchRemoteStatusWithReply:");
  v279[87] = v13;
  CFStringRef v189 = @"com.apple.CoreRoutine.RemoteStatus";
  __int16 v14 = +[NSArray arrayWithObjects:&v189 count:1];
  v280[87] = v14;
  v58 = +[NSDictionary dictionaryWithObjects:v280 forKeys:v279 count:88];

  __int16 v15 = [[RTEntitlementProvider alloc] initWithProtocol:v188 entitlementsDictionary:v58];
  return v15;
}

+ (id)internalDaemonProtocolEntitlementProvider
{
  uint64_t v2 = &OBJC_PROTOCOL___RTDaemonInternalProtocol;
  v3 = [(id)objc_opt_class() selectorsForProtocol:v2];
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        CFStringRef v18 = @"com.apple.CoreRoutine.Internal";
        v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1, (void)v14);
        [v4 setObject:v11 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  v12 = [[RTEntitlementProvider alloc] initWithProtocol:v2 entitlementsDictionary:v4];
  return v12;
}

+ (id)helperServiceProtocolEntitlementProvider
{
  uint64_t v2 = &OBJC_PROTOCOL___RTHelperServiceProtocol;
  v3 = [(id)objc_opt_class() selectorsForProtocol:v2];
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        CFStringRef v18 = @"com.apple.CoreRoutine.MapItemService";
        v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1, (void)v14);
        [v4 setObject:v11 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  v12 = [[RTEntitlementProvider alloc] initWithProtocol:v2 entitlementsDictionary:v4];
  return v12;
}

+ (id)safetyMonitorDaemonProtocolEntitlementProvider
{
  v30[0] = &OBJC_PROTOCOL___SMDaemonProtocol;
  v30[1] = &OBJC_PROTOCOL___SMDeviceConfigurationProtocol;
  v30[2] = &OBJC_PROTOCOL___SMEligibilityProtocol;
  v30[3] = &OBJC_PROTOCOL___SMIDSMessengerProtocolPrivate;
  v30[4] = &OBJC_PROTOCOL___SMInitiatorCacheProtocol;
  v30[5] = &OBJC_PROTOCOL___SMInitiatorDestinationBoundSessionProtocol;
  v30[6] = &OBJC_PROTOCOL___SMInitiatorGroupChatProtocol;
  v30[7] = &OBJC_PROTOCOL___SMInitiatorProtocol;
  v30[8] = &OBJC_PROTOCOL___SMInitiatorSafetyCacheMonitoringProtocol;
  v30[9] = &OBJC_PROTOCOL___SMInitiatorSessionConfigurationProtocol;
  v30[10] = &OBJC_PROTOCOL___SMInitiatorSessionMonitorProtocol;
  v30[11] = &OBJC_PROTOCOL___SMMadridMessengerProtocol;
  v30[12] = &OBJC_PROTOCOL___SMMadridMessengerProtocolPrivate;
  v30[13] = &OBJC_PROTOCOL___SMReceiverMonitorProtocol;
  v30[14] = &OBJC_PROTOCOL___SMReceiverProtocol;
  v30[15] = &OBJC_PROTOCOL___SMSessionStoreProtocol;
  v30[16] = &OBJC_PROTOCOL___SMSuggestionsProtocol;
  v30[17] = &OBJC_PROTOCOL___SMSuggestionsHelperProtocol;
  v30[18] = &OBJC_PROTOCOL___SMSuggestionsStoreProtocol;
  v30[19] = &OBJC_PROTOCOL___SMUserNotificationProtocol;
  v30[20] = &OBJC_PROTOCOL___SMWorkoutSnapshotProtocol;
  uint64_t v2 = +[NSArray arrayWithObjects:v30 count:21];
  v3 = +[NSSet setWithArray:v2];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v18 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        id v6 = [(id)objc_opt_class() selectorsForProtocol:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v28 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
              v12 = [v4 objectForKeyedSubscript:v11];

              if (!v12)
              {
                CFStringRef v27 = @"com.apple.CoreRoutine.SafetyMonitor";
                v13 = +[NSArray arrayWithObjects:&v27 count:1];
                [v4 setObject:v13 forKey:v11];
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v19 objects:v28 count:16];
          }
          while (v8);
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v18);
  }

  long long v14 = [[RTEntitlementProvider alloc] initWithProtocol:&OBJC_PROTOCOL___SMDaemonProtocol entitlementsDictionary:v4];
  return v14;
}

+ (id)selectorsForProtocol:(id)a3
{
  v3 = (Protocol *)a3;
  id v4 = v3;
  if (v3)
  {
    *(void *)outCount = 0;
    id v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount[1]);
    id v6 = protocol_copyMethodDescriptionList(v4, 0, 1, outCount);
    id v7 = objc_alloc((Class)NSMutableSet);
    id v8 = [v7 initWithCapacity:outCount[1]];
    if (outCount[1])
    {
      unint64_t v9 = 0;
      p_name = &v5->name;
      do
      {
        uint64_t v11 = *p_name;
        p_name += 2;
        v12 = NSStringFromSelector(v11);
        [v8 addObject:v12];

        ++v9;
      }
      while (v9 < outCount[1]);
    }
    if (outCount[0])
    {
      unint64_t v13 = 0;
      long long v14 = &v6->name;
      do
      {
        long long v15 = *v14;
        v14 += 2;
        long long v16 = NSStringFromSelector(v15);
        [v8 addObject:v16];

        ++v13;
      }
      while (v13 < outCount[0]);
    }
    free(v5);
    free(v6);
  }
  else
  {
    uint64_t v17 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: protocol", buf, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (NSDictionary)entitlementsDictionary
{
  return self->_entitlementsDictionary;
}

- (void)setEntitlementsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsDictionary, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end