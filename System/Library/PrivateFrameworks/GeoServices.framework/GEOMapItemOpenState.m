@interface GEOMapItemOpenState
+ (unint64_t)_checkForStateWithStartTime:(double)a3 endtime:(double)a4 compareTimeInSeconds:(double)a5 openingSoonThreshold:(double)a6 closingSoonThreshold:(double)a7 secondsOverMidnightForTomorrow:(double)a8 isTodaysNormalizedHours:(BOOL)a9 tomorrowsHoursBeginAtMidnight:(BOOL)a10;
+ (unint64_t)_geoMapItemOpeningHoursOptionsForBusinessHours:(id)a3 compareDate:(id)a4 timeZone:(id)a5;
+ (unint64_t)_geoMapItemOpeningHoursOptionsForNormalizedHours:(id)a3 compareDate:(id)a4 timeZone:(id)a5;
@end

@implementation GEOMapItemOpenState

+ (unint64_t)_geoMapItemOpeningHoursOptionsForBusinessHours:(id)a3 compareDate:(id)a4 timeZone:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 hoursType] == 4)
  {
    unint64_t v10 = 128;
  }
  else if ([v7 hoursType] == 3)
  {
    unint64_t v10 = 256;
  }
  else
  {
    v11 = [v7 placeDailyNormalizedHours];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [v7 placeDailyNormalizedHours];
      unint64_t v10 = +[GEOMapItemOpenState _geoMapItemOpeningHoursOptionsForNormalizedHours:v13 compareDate:v8 timeZone:v9];
    }
    else
    {
      unint64_t v10 = 1;
    }
  }

  return v10;
}

+ (unint64_t)_geoMapItemOpeningHoursOptionsForNormalizedHours:(id)a3 compareDate:(id)a4 timeZone:(id)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1C9C8] date];
    }
    unint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v79 = v9;
    [v10 setTimeZone:v9];
    v78 = v10;
    v11 = [v10 components:736 fromDate:v8];
    uint64_t v12 = [v11 weekday];
    uint64_t v13 = v12;
    long long v93 = 0u;
    long long v94 = 0u;
    if ((unint64_t)(v12 + 1) <= 7) {
      uint64_t v14 = v12 + 1;
    }
    else {
      uint64_t v14 = 1;
    }
    long long v95 = 0uLL;
    long long v96 = 0uLL;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v93 objects:v100 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v76 = v7;
      v77 = v11;
      id v75 = v8;
      LOBYTE(v7) = 0;
      v80 = 0;
      v18 = 0;
      uint64_t v19 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v94 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          if (objc_msgSend(v21, "weekday", v75, v76) == v13)
          {
            id v22 = v21;

            v18 = v22;
          }
          if ([v21 weekday] == v14)
          {
            id v23 = v21;

            v80 = v23;
          }
          if (v7)
          {
            LODWORD(v7) = 1;
          }
          else
          {
            v24 = [v21 localTimeIntervals];
            LODWORD(v7) = [v24 count] != 0;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v93 objects:v100 count:16];
      }
      while (v17);

      if (v7)
      {
        v11 = v77;
        uint64_t v25 = 3600 * [v77 hour];
        uint64_t v26 = [v77 minute];
        uint64_t v27 = [v77 second];
        [v18 openingSoonThresholdSeconds];
        double v28 = 0.0;
        double v29 = 0.0;
        if (v30 > 1.0)
        {
          [v18 openingSoonThresholdSeconds];
          double v29 = v31;
        }
        uint64_t v32 = v25 + 60 * v26;
        [v18 closingSoonThresholdSeconds];
        if (v33 > 1.0)
        {
          [v18 closingSoonThresholdSeconds];
          double v28 = v34;
        }
        uint64_t v35 = v32 + v27;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        v36 = [v80 localTimeIntervals];
        uint64_t v37 = [v36 countByEnumeratingWithState:&v89 objects:v99 count:16];
        double v38 = 0.0;
        if (v37)
        {
          uint64_t v39 = *(void *)v90;
          while (2)
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v90 != v39) {
                objc_enumerationMutation(v36);
              }
              v41 = *(void **)(*((void *)&v89 + 1) + 8 * j);
              [v41 startTime];
              if (v42 == 0.0)
              {
                [v41 endTime];
                double v38 = v45;
                uint64_t v37 = 1;
                goto LABEL_39;
              }
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v89 objects:v99 count:16];
            if (v37) {
              continue;
            }
            break;
          }
        }
LABEL_39:
        double v46 = (double)v35;

        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v47 = [v18 localTimeIntervals];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v85 objects:v98 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v86;
          unint64_t v43 = 18;
          while (2)
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v86 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v85 + 1) + 8 * k);
              [v52 endTime];
              if (v53 >= v46)
              {
                [v52 endTime];
                double v55 = v54;
                [v52 startTime];
                if (v55 - v56 >= 86400.0)
                {
                  [v52 startTime];
                  if (v57 == 0.0) {
                    goto LABEL_63;
                  }
                }
                [v52 startTime];
                double v59 = v58;
                [v52 endTime];
                unint64_t v61 = +[GEOMapItemOpenState _checkForStateWithStartTime:1 endtime:v37 compareTimeInSeconds:v59 openingSoonThreshold:v60 closingSoonThreshold:v46 secondsOverMidnightForTomorrow:v29 isTodaysNormalizedHours:v28 tomorrowsHoursBeginAtMidnight:v38];
                if (v61 != 1)
                {
                  unint64_t v43 = v61;
LABEL_63:

                  goto LABEL_64;
                }
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v85 objects:v98 count:16];
            v11 = v77;
            if (v49) {
              continue;
            }
            break;
          }
        }

        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v62 = [v80 localTimeIntervals];
        uint64_t v63 = [v62 countByEnumeratingWithState:&v81 objects:v97 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v82;
          while (2)
          {
            for (uint64_t m = 0; m != v64; ++m)
            {
              if (*(void *)v82 != v65) {
                objc_enumerationMutation(v62);
              }
              v67 = *(void **)(*((void *)&v81 + 1) + 8 * m);
              [v67 startTime];
              double v69 = v68;
              [v67 endTime];
              if (v70 + 86400.0 >= v46)
              {
                unint64_t v71 = +[GEOMapItemOpenState _checkForStateWithStartTime:0 endtime:v37 compareTimeInSeconds:v69 + 86400.0 openingSoonThreshold:v70 + 86400.0 closingSoonThreshold:v46 secondsOverMidnightForTomorrow:v29 isTodaysNormalizedHours:v28 tomorrowsHoursBeginAtMidnight:v38];
                if (v71 != 1)
                {
                  unint64_t v43 = v71;

                  goto LABEL_69;
                }
              }
            }
            uint64_t v64 = [v62 countByEnumeratingWithState:&v81 objects:v97 count:16];
            if (v64) {
              continue;
            }
            break;
          }
        }

        v72 = [v18 localTimeIntervals];
        uint64_t v73 = [v72 count];

        if (v73) {
          unint64_t v43 = 4;
        }
        else {
          unint64_t v43 = 12;
        }
LABEL_69:
        id v8 = v75;
        id v7 = v76;
        unint64_t v10 = v78;
        id v9 = v79;
      }
      else
      {
        unint64_t v43 = 1;
LABEL_64:
        id v8 = v75;
        id v7 = v76;
        unint64_t v10 = v78;
        id v9 = v79;
        v11 = v77;
      }
      v44 = v80;
    }
    else
    {

      v18 = 0;
      v44 = 0;
      unint64_t v43 = 1;
    }
  }
  else
  {
    unint64_t v43 = 1;
  }

  return v43;
}

+ (unint64_t)_checkForStateWithStartTime:(double)a3 endtime:(double)a4 compareTimeInSeconds:(double)a5 openingSoonThreshold:(double)a6 closingSoonThreshold:(double)a7 secondsOverMidnightForTomorrow:(double)a8 isTodaysNormalizedHours:(BOOL)a9 tomorrowsHoursBeginAtMidnight:(BOOL)a10
{
  double v10 = a3 - a5;
  double v11 = a4 - a5;
  BOOL v12 = a4 == 86400.0 && a10;
  double v13 = -0.0;
  if (v12 && a9) {
    double v13 = a8;
  }
  double v14 = v11 + v13;
  if (v10 > 0.0 || v14 <= 0.0)
  {
    if (v14 > 0.0)
    {
      BOOL v17 = v10 == a6;
      BOOL v16 = v10 >= a6;
    }
    else
    {
      BOOL v16 = 1;
      BOOL v17 = 0;
    }
    if (!v17 && v16) {
      return 1;
    }
    else {
      return 36;
    }
  }
  else if (v14 <= a7)
  {
    return 66;
  }
  else
  {
    return 2;
  }
}

@end