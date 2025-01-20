@interface CLSSummaryClustering
+ (double)maximumScoreForItems:(id)a3;
+ (double)meanScoreForItems:(id)a3;
+ (double)scoreForItems:(id)a3;
- (BOOL)enableAdaptiveElectionSmoother;
- (BOOL)enableAdaptiveElectionSmootherAutomaticLimit;
- (BOOL)enableDensityClusteringLocationsDistance;
- (BOOL)enableMultipassDensityClustering;
- (CLSSummaryClustering)init;
- (double)conciseDensityClusteringMaximumDistance;
- (double)diffuseDensityClusteringMaximumDistance;
- (double)optimalDayDistributionThreshold;
- (id)_densityClustersWithItems:(id)a3 progressBlock:(id)a4;
- (id)adaptiveElection:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7;
- (id)densityClusteringDistanceBlock;
- (id)densityClustersWithItems:(id)a3 progressBlock:(id)a4;
- (id)performWithItems:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7;
- (id)performWithItems:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 progressBlock:(id)a6;
- (unint64_t)adaptiveElectionMaximumNumberOfItemsByCluster;
- (unint64_t)adaptiveElectionMinimumNumberOfItemsByCluster;
- (unint64_t)adaptiveElectionSmootherMaximumLimit;
- (unint64_t)adaptiveElectionSmootherMinimumLimit;
- (unint64_t)conciseDensityClusteringMinimumNumberOfObjects;
- (unint64_t)densityClusteringLocationsDistanceUnit;
- (unint64_t)diffuseDensityClusteringMinimumNumberOfObjects;
- (unint64_t)timeSpanDensityAverageNumberOfObjects;
- (void)setAdaptiveElectionMaximumNumberOfItemsByCluster:(unint64_t)a3;
- (void)setAdaptiveElectionMinimumNumberOfItemsByCluster:(unint64_t)a3;
- (void)setAdaptiveElectionSmootherMaximumLimit:(unint64_t)a3;
- (void)setAdaptiveElectionSmootherMinimumLimit:(unint64_t)a3;
- (void)setConciseDensityClusteringMaximumDistance:(double)a3;
- (void)setConciseDensityClusteringMinimumNumberOfObjects:(unint64_t)a3;
- (void)setDensityClusteringLocationsDistanceUnit:(unint64_t)a3;
- (void)setDiffuseDensityClusteringMaximumDistance:(double)a3;
- (void)setDiffuseDensityClusteringMinimumNumberOfObjects:(unint64_t)a3;
- (void)setEnableAdaptiveElectionSmoother:(BOOL)a3;
- (void)setEnableAdaptiveElectionSmootherAutomaticLimit:(BOOL)a3;
- (void)setEnableDensityClusteringLocationsDistance:(BOOL)a3;
- (void)setEnableMultipassDensityClustering:(BOOL)a3;
- (void)setOptimalDayDistributionThreshold:(double)a3;
- (void)setTimeSpanDensityAverageNumberOfObjects:(unint64_t)a3;
@end

@implementation CLSSummaryClustering

- (id)densityClusteringDistanceBlock
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__CLSSummaryClustering_Performance__densityClusteringDistanceBlock__block_invoke;
  v3[3] = &unk_1E690EC78;
  v3[4] = self;
  return (id)[v3 copy];
}

uint64_t __67__CLSSummaryClustering_Performance__densityClusteringDistanceBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "cls_universalDate"), "timeIntervalSinceDate:", objc_msgSend(a3, "cls_universalDate"));
  uint64_t result = [*(id *)(a1 + 32) enableDensityClusteringLocationsDistance];
  if (result)
  {
    uint64_t result = [a2 clsLocation];
    if (result)
    {
      v7 = (void *)result;
      uint64_t result = [MEMORY[0x1E4F1CA98] null];
      if (v7 != (void *)result)
      {
        [v7 coordinate];
        uint64_t result = CLLocationCoordinate2DIsValid(v9);
        if (result)
        {
          uint64_t result = [a3 clsLocation];
          if (result)
          {
            v8 = (void *)result;
            uint64_t result = [MEMORY[0x1E4F1CA98] null];
            if (v8 != (void *)result)
            {
              [v8 coordinate];
              uint64_t result = CLLocationCoordinate2DIsValid(v10);
              if (result)
              {
                [v7 distanceFromLocation:v8];
                return [*(id *)(a1 + 32) densityClusteringLocationsDistanceUnit];
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)setAdaptiveElectionSmootherMinimumLimit:(unint64_t)a3
{
  self->_adaptiveElectionSmootherMinimumLimit = a3;
}

- (unint64_t)adaptiveElectionSmootherMinimumLimit
{
  return self->_adaptiveElectionSmootherMinimumLimit;
}

- (void)setAdaptiveElectionSmootherMaximumLimit:(unint64_t)a3
{
  self->_adaptiveElectionSmootherMaximumLimit = a3;
}

- (unint64_t)adaptiveElectionSmootherMaximumLimit
{
  return self->_adaptiveElectionSmootherMaximumLimit;
}

- (void)setEnableAdaptiveElectionSmootherAutomaticLimit:(BOOL)a3
{
  self->_enableAdaptiveElectionSmootherAutomaticLimit = a3;
}

- (BOOL)enableAdaptiveElectionSmootherAutomaticLimit
{
  return self->_enableAdaptiveElectionSmootherAutomaticLimit;
}

- (void)setEnableAdaptiveElectionSmoother:(BOOL)a3
{
  self->_enableAdaptiveElectionSmoother = a3;
}

- (BOOL)enableAdaptiveElectionSmoother
{
  return self->_enableAdaptiveElectionSmoother;
}

- (void)setAdaptiveElectionMaximumNumberOfItemsByCluster:(unint64_t)a3
{
  self->_adaptiveElectionMaximumNumberOfItemsByCluster = a3;
}

- (unint64_t)adaptiveElectionMaximumNumberOfItemsByCluster
{
  return self->_adaptiveElectionMaximumNumberOfItemsByCluster;
}

- (void)setAdaptiveElectionMinimumNumberOfItemsByCluster:(unint64_t)a3
{
  self->_adaptiveElectionMinimumNumberOfItemsByCluster = a3;
}

- (unint64_t)adaptiveElectionMinimumNumberOfItemsByCluster
{
  return self->_adaptiveElectionMinimumNumberOfItemsByCluster;
}

- (void)setEnableMultipassDensityClustering:(BOOL)a3
{
  self->_enableMultipassDensityClustering = a3;
}

- (BOOL)enableMultipassDensityClustering
{
  return self->_enableMultipassDensityClustering;
}

- (void)setConciseDensityClusteringMinimumNumberOfObjects:(unint64_t)a3
{
  self->_conciseDensityClusteringMinimumNumberOfObjects = a3;
}

- (unint64_t)conciseDensityClusteringMinimumNumberOfObjects
{
  return self->_conciseDensityClusteringMinimumNumberOfObjects;
}

- (void)setConciseDensityClusteringMaximumDistance:(double)a3
{
  self->_conciseDensityClusteringMaximumDistance = a3;
}

- (double)conciseDensityClusteringMaximumDistance
{
  return self->_conciseDensityClusteringMaximumDistance;
}

- (void)setDiffuseDensityClusteringMinimumNumberOfObjects:(unint64_t)a3
{
  self->_diffuseDensityClusteringMinimumNumberOfObjects = a3;
}

- (unint64_t)diffuseDensityClusteringMinimumNumberOfObjects
{
  return self->_diffuseDensityClusteringMinimumNumberOfObjects;
}

- (void)setDiffuseDensityClusteringMaximumDistance:(double)a3
{
  self->_diffuseDensityClusteringMaximumDistance = a3;
}

- (double)diffuseDensityClusteringMaximumDistance
{
  return self->_diffuseDensityClusteringMaximumDistance;
}

- (void)setDensityClusteringLocationsDistanceUnit:(unint64_t)a3
{
  self->_densityClusteringLocationsDistanceUnit = a3;
}

- (unint64_t)densityClusteringLocationsDistanceUnit
{
  return self->_densityClusteringLocationsDistanceUnit;
}

- (void)setEnableDensityClusteringLocationsDistance:(BOOL)a3
{
  self->_enableDensityClusteringLocationsDistance = a3;
}

- (BOOL)enableDensityClusteringLocationsDistance
{
  return self->_enableDensityClusteringLocationsDistance;
}

- (void)setTimeSpanDensityAverageNumberOfObjects:(unint64_t)a3
{
  self->_timeSpanDensityAverageNumberOfObjects = a3;
}

- (unint64_t)timeSpanDensityAverageNumberOfObjects
{
  return self->_timeSpanDensityAverageNumberOfObjects;
}

- (void)setOptimalDayDistributionThreshold:(double)a3
{
  self->_optimalDayDistributionThreshold = a3;
}

- (double)optimalDayDistributionThreshold
{
  return self->_optimalDayDistributionThreshold;
}

- (id)adaptiveElection:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  v148[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v105 = a6;
  id v101 = a7;
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:1];
  v148[0] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objects.@count" ascending:1];
  v148[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];

  v102 = v11;
  v100 = (void *)v15;
  v16 = [v11 sortedArrayUsingDescriptors:v15];
  v104 = (void *)[v16 mutableCopy];
  [v105 setStage:@"Adaptive Election"];
  v113 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = v16;
  v109 = self;
  uint64_t v110 = [obj countByEnumeratingWithState:&v134 objects:v147 count:16];
  if (v110)
  {
    unint64_t v17 = 0;
    uint64_t v108 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v110; ++i)
      {
        if (*(void *)v135 != v108) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v134 + 1) + 8 * i);
        v20 = [v19 objects];
        v21 = v20;
        v111 = v19;
        if (v12)
        {
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          uint64_t v22 = [v20 countByEnumeratingWithState:&v130 objects:v146 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            unint64_t v24 = 0;
            uint64_t v25 = *(void *)v131;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v131 != v25) {
                  objc_enumerationMutation(v21);
                }
                v27 = [*(id *)(*((void *)&v130 + 1) + 8 * j) clsIdentifier];
                unsigned int v28 = [v12 containsObject:v27];

                v24 += v28;
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v130 objects:v146 count:16];
            }
            while (v23);
          }
          else
          {
            unint64_t v24 = 0;
          }
        }
        else
        {
          unint64_t v24 = [v20 count];
        }
        v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v24];
        [v113 setObject:v29 forKey:v111];

        if (v17 <= v24) {
          unint64_t v17 = v24;
        }

        self = v109;
      }
      uint64_t v110 = [obj countByEnumeratingWithState:&v134 objects:v147 count:16];
    }
    while (v110);
    double v30 = (double)v17;
  }
  else
  {
    double v30 = 0.0;
  }

  unint64_t v31 = [obj count];
  unint64_t v32 = v31;
  double adaptiveElectionSmootherMaximumLimit = (double)self->_adaptiveElectionSmootherMaximumLimit;
  if (self->_enableAdaptiveElectionSmoother && self->_enableAdaptiveElectionSmootherAutomaticLimit)
  {
    double v34 = v30 / (double)v31;
    if (v34 >= adaptiveElectionSmootherMaximumLimit) {
      double v34 = (double)self->_adaptiveElectionSmootherMaximumLimit;
    }
    if (v34 >= (double)self->_adaptiveElectionSmootherMinimumLimit) {
      double adaptiveElectionSmootherMaximumLimit = v34;
    }
    else {
      double adaptiveElectionSmootherMaximumLimit = (double)self->_adaptiveElectionSmootherMinimumLimit;
    }
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v35 = obj;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v126 objects:v145 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v127;
    double v39 = 0.0;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v127 != v38) {
          objc_enumerationMutation(v35);
        }
        v41 = [v113 objectForKey:*(void *)(*((void *)&v126 + 1) + 8 * k)];
        unint64_t v42 = [v41 unsignedIntegerValue];

        if (self->_enableAdaptiveElectionSmoother)
        {
          if (v42)
          {
            double v43 = adaptiveElectionSmootherMaximumLimit
                / 1.57079633
                * atan((double)v42 / (adaptiveElectionSmootherMaximumLimit / 1.57079633));
            if (v43 > (double)v42) {
              __assert_rtn("-[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:]", "CLSSummaryClustering.m", 442, "numberOfItemsFromThisCluster <= numberOfEligibleItemsInThisCluster");
            }
          }
          else
          {
            double v43 = 0.0;
          }
        }
        else
        {
          double v43 = (double)v42;
        }
        double v39 = v39 + v43;
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v126 objects:v145 count:16];
    }
    while (v37);
  }
  else
  {
    double v39 = 0.0;
  }

  v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v32];
  v45 = v104;
  v46 = v105;
  id obja = v44;
  if ([v104 count])
  {
    unint64_t v47 = 0;
    double v48 = 0.0;
    double v49 = 0.0;
    do
    {
      uint64_t v50 = [v45 objectAtIndexedSubscript:v47];
      v51 = [v113 objectForKey:v50];
      unint64_t v52 = [v51 unsignedIntegerValue];

      if (self->_enableAdaptiveElectionSmoother)
      {
        if (!v52)
        {
          double v53 = 0.0;
          double v54 = 0.0;
          goto LABEL_54;
        }
        double v53 = (double)v52;
        double v54 = adaptiveElectionSmootherMaximumLimit
            / 1.57079633
            * atan((double)v52 / (adaptiveElectionSmootherMaximumLimit / 1.57079633));
      }
      else
      {
        double v53 = (double)v52;
        double v54 = (double)v52;
      }
      if (v54 > v53) {
        __assert_rtn("-[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:]", "CLSSummaryClustering.m", 462, "targetNumberOfItemsFromThisCluster <= numberOfEligibleItemsInThisCluster");
      }
LABEL_54:
      v112 = (void *)v50;
      double v55 = ((double)a5 - v48) * (v54 / (v39 - v49));
      unint64_t v56 = (unint64_t)v55;
      if (v52 < (unint64_t)v55)
      {
        v57 = +[CLSLogging sharedLogging];
        v58 = [v57 loggingConnection];

        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v142 = v56;
          __int16 v143 = 2048;
          unint64_t v144 = v52;
          _os_log_impl(&dword_1D2150000, v58, OS_LOG_TYPE_INFO, "Election wants %lu items from cluster that only contains %lu", buf, 0x16u);
        }

        double v55 = v53;
      }
      double v59 = v55 + 0.0000001;
      unint64_t adaptiveElectionMaximumNumberOfItemsByCluster = self->_adaptiveElectionMaximumNumberOfItemsByCluster;
      if (adaptiveElectionMaximumNumberOfItemsByCluster >= (unint64_t)v59) {
        unint64_t v61 = (unint64_t)v59;
      }
      else {
        unint64_t v61 = self->_adaptiveElectionMaximumNumberOfItemsByCluster;
      }
      if (adaptiveElectionMaximumNumberOfItemsByCluster) {
        unint64_t v62 = v61;
      }
      else {
        unint64_t v62 = (unint64_t)v59;
      }
      double v48 = v48 + (double)v62;
      v63 = v104;
      if (v48 >= (double)a5 + 1.0
        || v47 == [v104 count] - 1 && !objc_msgSend(v44, "count") && objc_msgSend(v104, "count"))
      {
        if (v46)
        {
          v68 = [v104 firstObject];
          [v46 setState:2 ofCluster:v68 withReason:@"Election Failure"];
        }
        [v104 removeObjectAtIndex:0];
        [v44 removeAllObjects];
        uint64_t v69 = [v104 count];
        if (!v69)
        {

          v45 = v104;
          break;
        }
        if (self->_enableAdaptiveElectionSmoother)
        {
          unint64_t v70 = v69;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          id v71 = v104;
          uint64_t v72 = [v71 countByEnumeratingWithState:&v122 objects:v140 count:16];
          if (v72)
          {
            uint64_t v73 = v72;
            unint64_t v74 = 0;
            uint64_t v75 = *(void *)v123;
            do
            {
              for (uint64_t m = 0; m != v73; ++m)
              {
                if (*(void *)v123 != v75) {
                  objc_enumerationMutation(v71);
                }
                v77 = [v113 objectForKey:*(void *)(*((void *)&v122 + 1) + 8 * m)];
                unint64_t v78 = [v77 unsignedIntegerValue];

                if (v74 <= v78) {
                  unint64_t v74 = v78;
                }
              }
              uint64_t v73 = [v71 countByEnumeratingWithState:&v122 objects:v140 count:16];
            }
            while (v73);
          }
          else
          {
            unint64_t v74 = 0;
          }

          self = v109;
          v63 = v104;
          v44 = obja;
          if (v109->_enableAdaptiveElectionSmootherAutomaticLimit)
          {
            double v79 = (double)v74 / (double)v70;
            unint64_t adaptiveElectionSmootherMinimumLimit = v109->_adaptiveElectionSmootherMinimumLimit;
            if (v79 >= (double)v109->_adaptiveElectionSmootherMaximumLimit) {
              double v79 = (double)v109->_adaptiveElectionSmootherMaximumLimit;
            }
            if (v79 >= (double)adaptiveElectionSmootherMinimumLimit) {
              double adaptiveElectionSmootherMaximumLimit = v79;
            }
            else {
              double adaptiveElectionSmootherMaximumLimit = (double)adaptiveElectionSmootherMinimumLimit;
            }
          }
        }
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        v64 = v63;
        unint64_t v47 = [(__CFString *)v64 countByEnumeratingWithState:&v118 objects:v139 count:16];
        if (v47)
        {
          uint64_t v81 = *(void *)v119;
          double v39 = 0.0;
          do
          {
            for (uint64_t n = 0; n != v47; ++n)
            {
              if (*(void *)v119 != v81) {
                objc_enumerationMutation(v64);
              }
              v83 = [v113 objectForKey:*(void *)(*((void *)&v118 + 1) + 8 * n)];
              unint64_t v84 = [v83 unsignedIntegerValue];

              if (self->_enableAdaptiveElectionSmoother)
              {
                if (v84)
                {
                  double v85 = adaptiveElectionSmootherMaximumLimit
                      / 1.57079633
                      * atan((double)v84 / (adaptiveElectionSmootherMaximumLimit / 1.57079633));
                  if (v85 > (double)v84) {
                    __assert_rtn("-[CLSSummaryClustering adaptiveElection:identifiersOfEligibleItems:maximumNumberOfItemsToElect:debugInfo:progressBlock:]", "CLSSummaryClustering.m", 530, "numberOfItemsFromOtherCluster <= numberOfEligibleItemsInOtherCluster");
                  }
                }
                else
                {
                  double v85 = 0.0;
                }
              }
              else
              {
                double v85 = (double)v84;
              }
              double v39 = v39 + v85;
            }
            unint64_t v47 = [(__CFString *)v64 countByEnumeratingWithState:&v118 objects:v139 count:16];
          }
          while (v47);
          double v49 = 0.0;
          double v48 = 0.0;
          v63 = v104;
          v46 = v105;
        }
        else
        {
          double v49 = 0.0;
          double v48 = 0.0;
          double v39 = 0.0;
          v46 = v105;
        }
        v67 = v112;
      }
      else
      {
        if (v62)
        {
          if (v62 >= self->_adaptiveElectionMinimumNumberOfItemsByCluster)
          {
            v66 = [[CLSSummaryClusteringItem alloc] initWithCluster:v112 numberOfItemsToElect:v62];
            [v44 addObject:v66];
            objc_msgSend(NSString, "stringWithFormat:", @"Electing %lu items out of %lu", v62, v52);
            v64 = (__CFString *)objc_claimAutoreleasedReturnValue();

            uint64_t v65 = 1;
          }
          else
          {
            v64 = [NSString stringWithFormat:@"Number of elected items less than threshold, electing 0 items out of %lu", v52];
            uint64_t v65 = 2;
          }
        }
        else
        {
          uint64_t v65 = 2;
          v64 = @"Electing 0 items, cluster is too small";
        }
        double v49 = v49 + v54;
        ++v47;
        v67 = v112;
        [v46 setState:v65 ofCluster:v112 withReason:v64];
      }

      v45 = v63;
    }
    while (v47 < [v63 count]);
  }
  v86 = v45;
  if (![v44 count])
  {
    v87 = [v35 lastObject];
    if (v87)
    {
      v88 = [v113 objectForKey:v87];
      unint64_t v89 = [v88 unsignedIntegerValue];

      if (v89 >= a5) {
        unint64_t v90 = a5;
      }
      else {
        unint64_t v90 = v89;
      }
      v91 = [[CLSSummaryClusteringItem alloc] initWithCluster:v87 numberOfItemsToElect:v90];
      [v44 addObject:v91];
    }
    if (v46)
    {
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v92 = v35;
      uint64_t v93 = [v92 countByEnumeratingWithState:&v114 objects:v138 count:16];
      if (v93)
      {
        uint64_t v94 = v93;
        uint64_t v95 = *(void *)v115;
        do
        {
          for (iuint64_t i = 0; ii != v94; ++ii)
          {
            if (*(void *)v115 != v95) {
              objc_enumerationMutation(v92);
            }
            if (*(void **)(*((void *)&v114 + 1) + 8 * ii) == v87) {
              uint64_t v97 = 3;
            }
            else {
              uint64_t v97 = 2;
            }
            objc_msgSend(v105, "setState:ofCluster:withReason:", v97);
          }
          uint64_t v94 = [v92 countByEnumeratingWithState:&v114 objects:v138 count:16];
        }
        while (v94);
      }

      v86 = v104;
      v46 = v105;
      v44 = obja;
    }
  }
  v98 = [v44 sortedArrayUsingComparator:&__block_literal_global_106];

  return v98;
}

uint64_t __120__CLSSummaryClustering_adaptiveElection_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 cluster];
  v6 = [v5 objects];
  v7 = [v6 firstObject];
  v8 = objc_msgSend(v7, "cls_universalDate");
  CLLocationCoordinate2D v9 = [v4 cluster];

  CLLocationCoordinate2D v10 = [v9 objects];
  id v11 = [v10 firstObject];
  id v12 = objc_msgSend(v11, "cls_universalDate");
  uint64_t v13 = [v8 compare:v12];

  return v13;
}

- (id)performWithItems:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v53 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = MEMORY[0x1D2602540]();
  uint64_t v15 = (void *)v14;
  uint64_t v72 = 0;
  uint64_t v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  unint64_t v56 = v12;
  v57 = (void *)v14;
  double v54 = v11;
  unint64_t v52 = v13;
  if (!v14
    || (char v71 = 0,
        (*(void (**)(uint64_t, char *, double))(v14 + 16))(v14, &v71, 0.0),
        char v16 = *((unsigned char *)v73 + 24) | v71,
        (*((unsigned char *)v73 + 24) = v16) == 0))
  {
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke;
    v68[3] = &unk_1E6910648;
    id v18 = v15;
    id v69 = v18;
    unint64_t v70 = &v72;
    v19 = [(CLSSummaryClustering *)self _densityClustersWithItems:v11 progressBlock:v68];
    if (v12)
    {
      [v12 setAgent:@"Summarizer"];
      [v12 setStage:@"Density Clustering"];
      [v12 setClusters:v19 withReason:@"Summarizer"];
    }
    v51 = v19;
    if (self->_enableMultipassDensityClustering)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F8A9E0]) initWithDistanceBlock:&__block_literal_global_41];
      [v20 setMaximumDistance:86400.0];
      [v20 setMinimumNumberOfObjects:2];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_3;
      v65[3] = &unk_1E6910648;
      id v66 = v18;
      v67 = &v72;
      v21 = [v20 performWithDataset:v19 progressBlock:v65];
      int v22 = *((unsigned __int8 *)v73 + 24);
      if (*((unsigned char *)v73 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v81 = 315;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
      }
      else
      {
        uint64_t v23 = [v19 valueForKeyPath:@"meanDate"];
        NSLog(&cfstr_Totaldensitycl.isa, v23);

        NSLog(&cfstr_Densitycluster.isa, v21);
      }

      if (v22) {
        goto LABEL_26;
      }
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v24 = v19;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v79 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v62;
LABEL_16:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v62 != v26) {
          objc_enumerationMutation(v24);
        }
        unsigned int v28 = *(void **)(*((void *)&v61 + 1) + 8 * v27);
        if (v57)
        {
          buf[0] = 0;
          (*((void (**)(id, uint8_t *, double))v18 + 2))(v18, buf, 0.5);
          char v29 = *((unsigned char *)v73 + 24) | buf[0];
          *((unsigned char *)v73 + 24) = v29;
          if (v29) {
            break;
          }
        }
        double v30 = [v28 objects];
        +[CLSSummaryClustering scoreForItems:v30];
        objc_msgSend(v28, "setScore:");

        if (v25 == ++v27)
        {
          uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v79 count:16];
          if (v25) {
            goto LABEL_16;
          }
          break;
        }
      }
    }

    if (*((unsigned char *)v73 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v81 = 335;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
LABEL_26:
      unint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_57:

      goto LABEL_58;
    }
    if ((unint64_t)[v24 count] < 2)
    {
      if ([v24 count] != 1)
      {
        id v31 = 0;
        goto LABEL_44;
      }
      id v32 = [v24 firstObject];
      v33 = [v32 objects];
      unint64_t v34 = [v33 count];

      if (v34 >= a5) {
        unint64_t v35 = a5;
      }
      else {
        unint64_t v35 = v34;
      }
      uint64_t v36 = [[CLSSummaryClusteringItem alloc] initWithCluster:v32 numberOfItemsToElect:v35];
      unint64_t v78 = v36;
      id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      if (v56)
      {
        uint64_t v37 = NSString;
        uint64_t v38 = [v32 objects];
        double v39 = [v37 stringWithFormat:@"Single density cluster, electing %lu items out of %lu", v35, objc_msgSend(v38, "count")];

        [v56 setState:1 ofCluster:v32 withReason:v39];
      }
    }
    else
    {
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_52;
      v58[3] = &unk_1E6910648;
      id v59 = v18;
      v60 = &v72;
      id v31 = [(CLSSummaryClustering *)self adaptiveElection:v24 identifiersOfEligibleItems:v53 maximumNumberOfItemsToElect:a5 debugInfo:v56 progressBlock:v58];
      if (*((unsigned char *)v73 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v81 = 348;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        goto LABEL_54;
      }
      id v32 = v59;
    }

    if (v31 && [v31 count])
    {
      [v56 setUnclusteredItemsState:2 withReason:@"Not Clustered"];
LABEL_50:
      if (!v57
        || (char v71 = 0,
            (*((void (**)(id, char *, double))v18 + 2))(v18, &v71, 1.0),
            char v49 = *((unsigned char *)v73 + 24) | v71,
            (*((unsigned char *)v73 + 24) = v49) == 0))
      {
        id v31 = v31;
        unint64_t v17 = v31;
        goto LABEL_56;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v81 = 386;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
LABEL_54:
      unint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_56:

      v19 = v51;
      goto LABEL_57;
    }
LABEL_44:
    v40 = [MEMORY[0x1E4F8A788] clusterWithObjects:v54];
    unint64_t v41 = [v54 count];
    if (v41 >= a5) {
      unint64_t v42 = a5;
    }
    else {
      unint64_t v42 = v41;
    }
    double v43 = [[CLSSummaryClusteringItem alloc] initWithCluster:v40 numberOfItemsToElect:v42];
    v77 = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];

    if (v56)
    {
      [v56 resetWithReason:@"SummaryClustering didn't find any density cluster"];
      v76 = v40;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      [v56 setClusters:v45 withReason:@"No Density Clusters"];

      v46 = NSString;
      unint64_t v47 = [v40 objects];
      double v48 = [v46 stringWithFormat:@"No density cluster, electing %lu items out of %lu", v42, objc_msgSend(v47, "count")];

      [v56 setState:1 ofCluster:v40 withReason:v48];
    }

    id v31 = (id)v44;
    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v81 = 287;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
  unint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_58:
  _Block_object_dispose(&v72, 8);

  return v17;
}

uint64_t __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_3(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_52(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

void __120__CLSSummaryClustering_performWithItems_identifiersOfEligibleItems_maximumNumberOfItemsToElect_debugInfo_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 meanUniversalDate];
  char v6 = [v4 meanUniversalDate];

  [v5 timeIntervalSinceDate:v6];
}

- (id)performWithItems:(id)a3 identifiersOfEligibleItems:(id)a4 maximumNumberOfItemsToElect:(unint64_t)a5 progressBlock:(id)a6
{
  return [(CLSSummaryClustering *)self performWithItems:a3 identifiersOfEligibleItems:a4 maximumNumberOfItemsToElect:a5 debugInfo:0 progressBlock:a6];
}

- (id)_densityClustersWithItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = a4;
  uint64_t v6 = MEMORY[0x1D2602540]();
  v7 = (void *)v6;
  uint64_t v51 = 0;
  unint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  if (!v6
    || (LOBYTE(v47) = 0,
        (*(void (**)(uint64_t, int *, double))(v6 + 16))(v6, &v47, 0.0),
        char v8 = *((unsigned char *)v52 + 24) | v47,
        (*((unsigned char *)v52 + 24) = v8) == 0))
  {
    CLLocationCoordinate2D v10 = [v38 sortedArrayUsingComparator:&__block_literal_global_6254];
    id v11 = [v10 lastObject];
    id v12 = objc_msgSend(v11, "cls_universalDate");
    id v13 = [v10 firstObject];
    uint64_t v14 = objc_msgSend(v13, "cls_universalDate");
    [v12 timeIntervalSinceDate:v14];
    double v16 = v15;

    if (v16 <= 0.0) {
      double v17 = 1.79769313e308;
    }
    else {
      double v17 = (double)(unint64_t)[v10 count] / (v16 / 86400.0);
    }
    double optimalDayDistributionThreshold = self->_optimalDayDistributionThreshold;
    uint64_t v19 = 56;
    if (v17 < optimalDayDistributionThreshold) {
      uint64_t v19 = 40;
    }
    uint64_t v20 = 64;
    if (v17 < optimalDayDistributionThreshold) {
      uint64_t v20 = 48;
    }
    uint64_t v21 = *(uint64_t *)((char *)&self->super.isa + v20);
    double v22 = *(double *)((char *)&self->super.isa + v19);
    id v23 = objc_alloc_init(MEMORY[0x1E4F8AC50]);
    [v23 setAverageNumberOfObjects:self->_timeSpanDensityAverageNumberOfObjects];
    [v23 setMinimumSpan:v22 * 3.0];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2;
    v48[3] = &unk_1E6910648;
    id v24 = v7;
    id v49 = v24;
    uint64_t v50 = &v51;
    uint64_t v25 = [v23 performWithDataset:v10 progressBlock:v48];
    if (*((unsigned char *)v52 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109120;
        int v56 = 241;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_28;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F8A780]);
    id v27 = [(CLSSummaryClustering *)self densityClusteringDistanceBlock];
    unsigned int v28 = (void *)[v26 initWithDistanceBlock:v27];

    [v28 setMaximumDistance:v22];
    [v28 setMinimumNumberOfObjects:v21];
    char v29 = [MEMORY[0x1E4F1CA48] array];
    int v47 = 0;
    size_t v30 = [v25 count];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_29;
    block[3] = &unk_1E69102B0;
    id v31 = v24;
    v46 = &v47;
    id v44 = v31;
    v45 = &v51;
    id v41 = v25;
    id v32 = v28;
    id v42 = v32;
    id v33 = v29;
    id v43 = v33;
    dispatch_apply(v30, 0, block);
    if (*((unsigned char *)v52 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109120;
        int v56 = 270;
        unint64_t v34 = MEMORY[0x1E4F14500];
LABEL_20:
        _os_log_impl(&dword_1D2150000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
    }
    else
    {
      if (!v7
        || (char v39 = 0,
            (*((void (**)(id, char *, double))v31 + 2))(v31, &v39, 1.0),
            char v35 = *((unsigned char *)v52 + 24) | v39,
            (*((unsigned char *)v52 + 24) = v35) == 0))
      {
        id v9 = v33;
        goto LABEL_27;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109120;
        int v56 = 273;
        unint64_t v34 = MEMORY[0x1E4F14500];
        goto LABEL_20;
      }
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109120;
    int v56 = 187;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_29:
  _Block_object_dispose(&v51, 8);

  return v9;
}

uint64_t __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

void __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_29(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1D2602300]();
  if (!*(void *)(a1 + 56)
    || (char v17 = 0,
        os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 72)),
        (*(void (**)(double))(*(void *)(a1 + 56) + 16))(0.5),
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24),
        v5 = *(os_unfair_lock_s **)(a1 + 72),
        char v17 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24),
        os_unfair_lock_unlock(v5),
        !v17))
  {
    char v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    v7 = *(void **)(a1 + 40);
    char v8 = [v6 objects];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2_30;
    uint64_t v14 = &unk_1E6910288;
    id v15 = *(id *)(a1 + 56);
    long long v16 = *(_OWORD *)(a1 + 64);
    id v9 = [v7 performWithDataset:v8 progressBlock:&v11];

    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 72));
    LODWORD(v8) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 72));
    if (!v8)
    {
      id v10 = *(id *)(a1 + 48);
      objc_sync_enter(v10);
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v9, v11, v12, v13, v14);
      objc_sync_exit(v10);
    }
  }
}

void __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke_2_30(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
    char v6 = *(os_unfair_lock_s **)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
    char v7 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    os_unfair_lock_unlock(v6);
    if (v7) {
      *a2 = 1;
    }
  }
}

uint64_t __64__CLSSummaryClustering__densityClustersWithItems_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = objc_msgSend(a2, "cls_universalDate");
  char v6 = objc_msgSend(v4, "cls_universalDate");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)densityClustersWithItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(CLSSummaryClustering *)self _densityClustersWithItems:v6 progressBlock:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objects];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (CLSSummaryClustering)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSSummaryClustering;
  uint64_t result = [(CLSSummaryClustering *)&v3 init];
  if (result)
  {
    result->_double optimalDayDistributionThreshold = 30.0;
    *(_OWORD *)&result->_timeSpanDensityAverageNumberOfObjects = xmmword_1D21C51E0;
    result->_diffuseDensityClusteringMaximumDistance = 10800.0;
    result->_diffuseDensityClusteringMinimumNumberOfObjects = 7;
    result->_conciseDensityClusteringMaximumDistance = 1800.0;
    *(_OWORD *)&result->_conciseDensityClusteringMinimumNumberOfObjects = xmmword_1D21C51F0;
    *(_DWORD *)&result->_enableDensityClusteringLocationsDistance = 16842752;
    *(_OWORD *)&result->_double adaptiveElectionSmootherMaximumLimit = xmmword_1D21C5200;
  }
  return result;
}

+ (double)maximumScoreForItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) clsContentScore];
        if (v7 < v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (double)meanScoreForItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) clsContentScore];
        double v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }
  unint64_t v10 = [v3 count];

  return v7 / (double)v10;
}

+ (double)scoreForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "clsContentScore", (void)v13);
        double v9 = v9 + v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9 + (double)v4 * -0.4;
}

@end