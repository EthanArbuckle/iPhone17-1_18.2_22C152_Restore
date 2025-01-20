@interface HMDUserType6Prediction
+ (id)predictionToHomeLocation:(id)a3 visitExit:(id)a4 predictedLocations:(id)a5;
- (BOOL)hasDelayAction;
- (CLCircularRegion)geofenceRegionForDelayAction;
- (CLLocation)homeLocation;
- (CLLocation)visitExitLocation;
- (CLVisit)visitExit;
- (HMDRTPredictedLocationOfInterest)predictedLocationOfInterest;
- (HMDUserType6Prediction)initWithAction:(unint64_t)a3 homeLocation:(id)a4 visitExit:(id)a5 predictedLocationOfInterest:(id)a6 predictedLocations:(id)a7;
- (NSArray)predictedLocations;
- (NSDate)nextEntryTime;
- (double)maxVisitDurationDuringComingHomeForVisit:(id)a3;
- (id)copyPredictionWithNewHomeLocation:(id)a3;
- (unint64_t)action;
- (void)setAction:(unint64_t)a3;
- (void)setHomeLocation:(id)a3;
- (void)setPredictedLocationOfInterest:(id)a3;
- (void)setPredictedLocations:(id)a3;
@end

@implementation HMDUserType6Prediction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geofenceRegionForDelayAction, 0);
  objc_storeStrong((id *)&self->_predictedLocations, 0);
  objc_storeStrong((id *)&self->_predictedLocationOfInterest, 0);
  objc_storeStrong((id *)&self->_visitExit, 0);
  objc_storeStrong((id *)&self->_homeLocation, 0);
}

- (CLCircularRegion)geofenceRegionForDelayAction
{
  return self->_geofenceRegionForDelayAction;
}

- (void)setPredictedLocations:(id)a3
{
}

- (NSArray)predictedLocations
{
  return self->_predictedLocations;
}

- (void)setPredictedLocationOfInterest:(id)a3
{
}

- (HMDRTPredictedLocationOfInterest)predictedLocationOfInterest
{
  return self->_predictedLocationOfInterest;
}

- (CLVisit)visitExit
{
  return self->_visitExit;
}

- (void)setHomeLocation:(id)a3
{
}

- (CLLocation)homeLocation
{
  return self->_homeLocation;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (unint64_t)action
{
  return self->_action;
}

- (double)maxVisitDurationDuringComingHomeForVisit:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserType6Prediction *)self predictedLocationOfInterest];

  if (v5)
  {
    v6 = [(HMDUserType6Prediction *)self homeLocation];
    v7 = deriveCLLocationFromCLVisit(v4);
    BOOL v8 = isNearLocation(v6, v7);

    if (v8) {
      double v9 = 0.0;
    }
    else {
      double v9 = 900.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (BOOL)hasDelayAction
{
  unint64_t v3 = [(HMDUserType6Prediction *)self action];
  if (v3 != 1) {
    LOBYTE(v3) = [(HMDUserType6Prediction *)self action] == 2;
  }
  return v3;
}

- (CLLocation)visitExitLocation
{
  v2 = [(HMDUserType6Prediction *)self visitExit];
  unint64_t v3 = deriveCLLocationFromCLVisit(v2);

  return (CLLocation *)v3;
}

- (NSDate)nextEntryTime
{
  v2 = [(HMDUserType6Prediction *)self predictedLocationOfInterest];
  unint64_t v3 = [v2 nextEntryTime];

  return (NSDate *)v3;
}

- (id)copyPredictionWithNewHomeLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDUserType6Prediction *)self predictedLocationOfInterest];
    v6 = [v5 locationOfInterest];
    v7 = [v6 location];
    BOOL v8 = deriveCLLocationFromHMDRTLocation(v7);

    if (isNearLocation(v4, v8))
    {
      double v9 = [HMDUserType6Prediction alloc];
      unint64_t v10 = [(HMDUserType6Prediction *)self action];
      v11 = [(HMDUserType6Prediction *)self visitExit];
      v12 = [(HMDUserType6Prediction *)self predictedLocationOfInterest];
      v13 = [(HMDUserType6Prediction *)self predictedLocations];
      v14 = [(HMDUserType6Prediction *)v9 initWithAction:v10 homeLocation:v4 visitExit:v11 predictedLocationOfInterest:v12 predictedLocations:v13];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HMDUserType6Prediction)initWithAction:(unint64_t)a3 homeLocation:(id)a4 visitExit:(id)a5 predictedLocationOfInterest:(id)a6 predictedLocations:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v35 = a6;
  id v15 = a7;
  v36.receiver = self;
  v36.super_class = (Class)HMDUserType6Prediction;
  v16 = [(HMDUserType6Prediction *)&v36 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_14;
  }
  v16->_action = a3;
  objc_storeStrong((id *)&v16->_homeLocation, a4);
  objc_storeStrong((id *)&v17->_visitExit, a5);
  objc_storeStrong((id *)&v17->_predictedLocationOfInterest, a6);
  objc_storeStrong((id *)&v17->_predictedLocations, a7);
  if (a3 - 1 > 1) {
    goto LABEL_14;
  }
  v18 = deriveCLLocationFromCLVisit(v14);
  [v13 distanceFromLocation:v18];
  if (a3 == 2)
  {
    double v21 = 0.5;
    goto LABEL_7;
  }
  double v20 = 0.0;
  if (a3 == 1)
  {
    double v21 = 0.2;
LABEL_7:
    double v20 = v19 * v21;
  }

  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v38 = v24;
    __int16 v39 = 2048;
    double v40 = v20;
    __int16 v41 = 2048;
    uint64_t v42 = 0x408F400000000000;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Required distance between locations: %lf m (%lf m required)", buf, 0x20u);
  }
  if (v20 > 1000.0 || fabs(v20 + -1000.0) < 2.22044605e-16)
  {
    id v25 = objc_alloc(MEMORY[0x263F00A28]);
    [v13 coordinate];
    double v27 = v26;
    double v29 = v28;
    v30 = [MEMORY[0x263F08C38] UUID];
    v31 = [v30 UUIDString];
    uint64_t v32 = objc_msgSend(v25, "initWithCenter:radius:identifier:nearbyAllowed:", v31, 0, v27, v29, v20);
    geofenceRegionForDelayAction = v17->_geofenceRegionForDelayAction;
    v17->_geofenceRegionForDelayAction = (CLCircularRegion *)v32;

    [(CLCircularRegion *)v17->_geofenceRegionForDelayAction setNotifyOnEntry:1];
  }
  else
  {
    v17->_action = 0;
  }
LABEL_14:

  return v17;
}

+ (id)predictionToHomeLocation:(id)a3 visitExit:(id)a4 predictedLocations:(id)a5
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = v9;
  v11 = 0;
  v99 = v7;
  if (!v7 || !v9) {
    goto LABEL_90;
  }
  if (![v9 count])
  {
    v11 = 0;
    goto LABEL_90;
  }
  v98 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v12 = v10;
  uint64_t v104 = [v12 countByEnumeratingWithState:&v118 objects:v128 count:16];
  if (!v104)
  {

    v53 = 0;
    v54 = 0;
    id v55 = 0;
    v50 = 0;
    v56 = 0;
    goto LABEL_45;
  }
  v92 = v10;
  id v93 = v8;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v106 = 0;
  id v101 = 0;
  uint64_t v102 = *(void *)v119;
  obuint64_t j = v12;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v119 != v102) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v118 + 1) + 8 * v13);
      id v15 = [MEMORY[0x263EFF910] distantPast];
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v108 = v14;
      v16 = [v14 sources];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v114 objects:v127 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v115;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v115 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(id *)(*((void *)&v114 + 1) + 8 * i);
            if ([v21 conformsToProtocol:&unk_26E5F8330]) {
              v22 = v21;
            }
            else {
              v22 = 0;
            }
            id v23 = v22;

            if (v23)
            {
              v24 = [v23 usageDate];
              uint64_t v25 = [v15 laterDate:v24];

              id v15 = (void *)v25;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v114 objects:v127 count:16];
        }
        while (v18);
      }

      double v26 = [MEMORY[0x263EFF910] distantPast];
      char v27 = [v15 isEqualToDate:v26];

      if (v27)
      {
        double v28 = v108;
        double v29 = [v108 nextEntryTime];

        if (v29)
        {
          [v98 addObject:v108];
          v30 = [v108 locationOfInterest];
          v31 = [v30 location];
          uint64_t v32 = deriveCLLocationFromHMDRTLocation(v31);

          if (isNearLocation(v99, v32))
          {
            if (!v96) {
              goto LABEL_27;
            }
            v33 = [v96 nextEntryTime];
            v34 = [v108 nextEntryTime];
            uint64_t v35 = [v33 compare:v34];

            BOOL v36 = v35 == 1;
            double v28 = v108;
            if (v36)
            {
LABEL_27:
              id v37 = v28;

              v96 = v37;
            }
          }
        }
        else
        {
          [v108 confidence];
          double v40 = fabs(v39 + -1.0);
          __int16 v41 = [v108 locationOfInterest];
          uint64_t v42 = [v41 location];
          uint64_t v32 = deriveCLLocationFromHMDRTLocation(v42);

          BOOL v43 = isNearLocation(v99, v32);
          if (v40 >= 2.22044605e-16)
          {
            if (v43)
            {
              id v45 = v108;

              v95 = v45;
            }
          }
          else if (v43)
          {
            id v44 = v108;

            v94 = v44;
          }
        }
        goto LABEL_31;
      }
      if (!v106 || [v101 compare:v15] == -1)
      {
        id v38 = v108;

        uint64_t v32 = v101;
        v106 = v38;
        id v101 = v15;
LABEL_31:
      }
      ++v13;
    }
    while (v13 != v104);
    id v12 = obj;
    uint64_t v46 = [obj countByEnumeratingWithState:&v118 objects:v128 count:16];
    uint64_t v104 = v46;
  }
  while (v46);

  if (v106)
  {
    v47 = [v106 locationOfInterest];
    v48 = [v47 location];
    v49 = deriveCLLocationFromHMDRTLocation(v48);

    unint64_t v10 = v92;
    id v8 = v93;
    v50 = v94;
    if (isNearLocation(v99, v49))
    {
      id v51 = v106;
      uint64_t v52 = 3;
    }
    else
    {
      id v51 = 0;
      uint64_t v52 = 0;
    }

    v54 = v106;
    uint64_t v57 = v52;
    v53 = v101;
    v56 = v95;
    id v55 = v96;
    goto LABEL_89;
  }
  unint64_t v10 = v92;
  id v8 = v93;
  v53 = v101;
  v56 = v95;
  v50 = v94;
  if (!v96)
  {
    if (v94)
    {
      id v90 = v94;
      v50 = v90;
      v54 = 0;
      id v55 = 0;
      uint64_t v57 = 2;
LABEL_84:
      id v51 = v90;
      goto LABEL_89;
    }
    if (v95)
    {
      id v90 = v95;
      v56 = v90;
      v54 = 0;
      id v55 = 0;
      v50 = 0;
      uint64_t v57 = 1;
      goto LABEL_84;
    }
    v54 = 0;
    id v55 = 0;
    v50 = 0;
LABEL_45:
    id v51 = 0;
    uint64_t v57 = 0;
    goto LABEL_89;
  }
  v58 = [v98 sortedArrayUsingComparator:&__block_literal_global_236416];
  id v55 = v96;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v109 = v58;
  uint64_t v59 = [v109 countByEnumeratingWithState:&v110 objects:v126 count:16];
  if (!v59)
  {
    uint64_t v57 = 0;
    goto LABEL_88;
  }
  v97 = v55;
  uint64_t v60 = *(void *)v111;
  uint64_t v57 = 3;
  uint64_t v61 = v59;
  uint64_t v103 = *(void *)v111;
  while (2)
  {
    uint64_t v62 = 0;
    uint64_t v105 = v61;
    while (2)
    {
      if (*(void *)v111 != v60) {
        objc_enumerationMutation(v109);
      }
      v63 = *(void **)(*((void *)&v110 + 1) + 8 * v62);
      id v55 = v97;
      if (v63 == v97)
      {
        unint64_t v10 = v92;
        id v8 = v93;
        v56 = v95;
        goto LABEL_87;
      }
      id v64 = v63;
      id v65 = v97;
      v66 = [v64 nextEntryTime];
      v67 = [v65 nextEntryTime];
      uint64_t v68 = [v66 compare:v67];

      if (v68 != -1) {
        goto LABEL_54;
      }
      v69 = [v65 nextEntryTime];
      v70 = [v64 nextEntryTime];
      [v69 timeIntervalSinceDate:v70];
      double v72 = v71;

      if (v72 < 900.0 && fabs(v72 + -900.0) >= 2.22044605e-16)
      {
LABEL_54:

        goto LABEL_73;
      }
      v107 = v65;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      v73 = [v64 locationOfInterest];
      v74 = [v73 visits];

      uint64_t v75 = [v74 countByEnumeratingWithState:&v122 objects:v129 count:16];
      if (!v75)
      {

LABEL_71:
        double v88 = 0.0;
        uint64_t v60 = v103;
        uint64_t v61 = v105;
        goto LABEL_72;
      }
      uint64_t v76 = v75;
      uint64_t v77 = 0;
      uint64_t v78 = *(void *)v123;
      double v79 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v123 != v78) {
            objc_enumerationMutation(v74);
          }
          v81 = *(void **)(*((void *)&v122 + 1) + 8 * j);
          uint64_t v82 = [v81 entryDate];
          if (v82)
          {
            v83 = (void *)v82;
            v84 = [v81 exitDate];

            if (v84)
            {
              v85 = [v81 exitDate];
              v86 = [v81 entryDate];
              [v85 timeIntervalSinceDate:v86];
              double v79 = v79 + v87;

              ++v77;
            }
          }
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v122 objects:v129 count:16];
      }
      while (v76);

      id v12 = obj;
      uint64_t v57 = 3;
      if (v77 <= 0) {
        goto LABEL_71;
      }
      double v88 = v79 / (double)v77;
      uint64_t v60 = v103;
      uint64_t v61 = v105;
      if (v88 >= 900.0)
      {

        goto LABEL_86;
      }
LABEL_72:
      double v89 = fabs(v88 + -900.0);

      if (v89 < 2.22044605e-16) {
        goto LABEL_86;
      }
LABEL_73:
      if (++v62 != v61) {
        continue;
      }
      break;
    }
    uint64_t v61 = [v109 countByEnumeratingWithState:&v110 objects:v126 count:16];
    if (v61) {
      continue;
    }
    break;
  }
LABEL_86:
  uint64_t v57 = 0;
  unint64_t v10 = v92;
  id v8 = v93;
  v56 = v95;
  id v55 = v97;
LABEL_87:
  v50 = v94;
LABEL_88:

  v54 = 0;
  id v51 = v55;
  v53 = v101;
LABEL_89:
  v11 = [[HMDUserType6Prediction alloc] initWithAction:v57 homeLocation:v99 visitExit:v8 predictedLocationOfInterest:v51 predictedLocations:v12];

LABEL_90:
  return v11;
}

uint64_t __80__HMDUserType6Prediction_predictionToHomeLocation_visitExit_predictedLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 nextEntryTime];
  v6 = [v4 nextEntryTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end