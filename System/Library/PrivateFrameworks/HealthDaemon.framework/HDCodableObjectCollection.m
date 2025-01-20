@interface HDCodableObjectCollection
+ (Class)activityCachesType;
+ (Class)activityGoalSchedulesType;
+ (Class)binarySamplesType;
+ (Class)categorySamplesType;
+ (Class)cdaDocumentSamplesType;
+ (Class)correlationsType;
+ (Class)deletedSamplesType;
+ (Class)ecgSamplesType;
+ (Class)fitnessFriendAchievementsType;
+ (Class)fitnessFriendActivitySnapshotsType;
+ (Class)fitnessFriendWorkoutsType;
+ (Class)locationSeriesType;
+ (Class)pauseRingsSchedulesType;
+ (Class)quantitySamplesType;
+ (Class)scoredAssessmentSamplesType;
+ (Class)sleepSchedulesType;
+ (Class)stateOfMindLogsType;
+ (Class)visionSamplesType;
+ (Class)workoutZonesType;
+ (Class)workoutsType;
- (BOOL)hasGeneratedObjectCollection;
- (BOOL)hasProvenance;
- (BOOL)hasSource;
- (BOOL)hasSourceBundleIdentifier;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unitTest_isEquivalentToObjectCollection:(id)a3;
- (HDCodableGeneratedObjectCollection)generatedObjectCollection;
- (HDCodableProvenance)provenance;
- (HDCodableSource)source;
- (HDCodableSyncIdentity)syncIdentity;
- (NSMutableArray)activityCaches;
- (NSMutableArray)activityGoalSchedules;
- (NSMutableArray)binarySamples;
- (NSMutableArray)categorySamples;
- (NSMutableArray)cdaDocumentSamples;
- (NSMutableArray)correlations;
- (NSMutableArray)deletedSamples;
- (NSMutableArray)ecgSamples;
- (NSMutableArray)fitnessFriendAchievements;
- (NSMutableArray)fitnessFriendActivitySnapshots;
- (NSMutableArray)fitnessFriendWorkouts;
- (NSMutableArray)locationSeries;
- (NSMutableArray)pauseRingsSchedules;
- (NSMutableArray)quantitySamples;
- (NSMutableArray)scoredAssessmentSamples;
- (NSMutableArray)sleepSchedules;
- (NSMutableArray)stateOfMindLogs;
- (NSMutableArray)visionSamples;
- (NSMutableArray)workoutZones;
- (NSMutableArray)workouts;
- (NSString)sourceBundleIdentifier;
- (id)activityCachesAtIndex:(unint64_t)a3;
- (id)activityGoalSchedulesAtIndex:(unint64_t)a3;
- (id)binarySamplesAtIndex:(unint64_t)a3;
- (id)categorySamplesAtIndex:(unint64_t)a3;
- (id)cdaDocumentSamplesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correlationsAtIndex:(unint64_t)a3;
- (id)decodedObjects;
- (id)deletedSamplesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ecgSamplesAtIndex:(unint64_t)a3;
- (id)fitnessFriendAchievementsAtIndex:(unint64_t)a3;
- (id)fitnessFriendActivitySnapshotsAtIndex:(unint64_t)a3;
- (id)fitnessFriendWorkoutsAtIndex:(unint64_t)a3;
- (id)locationSeriesAtIndex:(unint64_t)a3;
- (id)pauseRingsSchedulesAtIndex:(unint64_t)a3;
- (id)quantitySamplesAtIndex:(unint64_t)a3;
- (id)scoredAssessmentSamplesAtIndex:(unint64_t)a3;
- (id)sleepSchedulesAtIndex:(unint64_t)a3;
- (id)stateOfMindLogsAtIndex:(unint64_t)a3;
- (id)visionSamplesAtIndex:(unint64_t)a3;
- (id)workoutZonesAtIndex:(unint64_t)a3;
- (id)workoutsAtIndex:(unint64_t)a3;
- (unint64_t)activityCachesCount;
- (unint64_t)activityGoalSchedulesCount;
- (unint64_t)binarySamplesCount;
- (unint64_t)categorySamplesCount;
- (unint64_t)cdaDocumentSamplesCount;
- (unint64_t)correlationsCount;
- (unint64_t)count;
- (unint64_t)deletedSamplesCount;
- (unint64_t)ecgSamplesCount;
- (unint64_t)fitnessFriendAchievementsCount;
- (unint64_t)fitnessFriendActivitySnapshotsCount;
- (unint64_t)fitnessFriendWorkoutsCount;
- (unint64_t)hash;
- (unint64_t)locationSeriesCount;
- (unint64_t)pauseRingsSchedulesCount;
- (unint64_t)quantitySamplesCount;
- (unint64_t)scoredAssessmentSamplesCount;
- (unint64_t)sleepSchedulesCount;
- (unint64_t)stateOfMindLogsCount;
- (unint64_t)visionSamplesCount;
- (unint64_t)workoutZonesCount;
- (unint64_t)workoutsCount;
- (void)addActivityCaches:(id)a3;
- (void)addActivityGoalSchedules:(id)a3;
- (void)addBinarySamples:(id)a3;
- (void)addCategorySamples:(id)a3;
- (void)addCdaDocumentSamples:(id)a3;
- (void)addCorrelations:(id)a3;
- (void)addDeletedSamples:(id)a3;
- (void)addEcgSamples:(id)a3;
- (void)addFitnessFriendAchievements:(id)a3;
- (void)addFitnessFriendActivitySnapshots:(id)a3;
- (void)addFitnessFriendWorkouts:(id)a3;
- (void)addLocationSeries:(id)a3;
- (void)addMedicationDoseEvent:(id)a3;
- (void)addPauseRingsSchedules:(id)a3;
- (void)addQuantitySamples:(id)a3;
- (void)addScoredAssessmentSamples:(id)a3;
- (void)addSleepSchedules:(id)a3;
- (void)addStateOfMindLogs:(id)a3;
- (void)addVisionSamples:(id)a3;
- (void)addWorkoutZones:(id)a3;
- (void)addWorkouts:(id)a3;
- (void)clearActivityCaches;
- (void)clearActivityGoalSchedules;
- (void)clearBinarySamples;
- (void)clearCategorySamples;
- (void)clearCdaDocumentSamples;
- (void)clearCorrelations;
- (void)clearDeletedSamples;
- (void)clearEcgSamples;
- (void)clearFitnessFriendAchievements;
- (void)clearFitnessFriendActivitySnapshots;
- (void)clearFitnessFriendWorkouts;
- (void)clearLocationSeries;
- (void)clearPauseRingsSchedules;
- (void)clearQuantitySamples;
- (void)clearScoredAssessmentSamples;
- (void)clearSleepSchedules;
- (void)clearStateOfMindLogs;
- (void)clearVisionSamples;
- (void)clearWorkoutZones;
- (void)clearWorkouts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityCaches:(id)a3;
- (void)setActivityGoalSchedules:(id)a3;
- (void)setBinarySamples:(id)a3;
- (void)setCategorySamples:(id)a3;
- (void)setCdaDocumentSamples:(id)a3;
- (void)setCorrelations:(id)a3;
- (void)setDeletedSamples:(id)a3;
- (void)setEcgSamples:(id)a3;
- (void)setFitnessFriendAchievements:(id)a3;
- (void)setFitnessFriendActivitySnapshots:(id)a3;
- (void)setFitnessFriendWorkouts:(id)a3;
- (void)setGeneratedObjectCollection:(id)a3;
- (void)setLocationSeries:(id)a3;
- (void)setPauseRingsSchedules:(id)a3;
- (void)setProvenance:(id)a3;
- (void)setQuantitySamples:(id)a3;
- (void)setScoredAssessmentSamples:(id)a3;
- (void)setSleepSchedules:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setStateOfMindLogs:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setVisionSamples:(id)a3;
- (void)setWorkoutZones:(id)a3;
- (void)setWorkouts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableObjectCollection

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (void)addCategorySamples:(id)a3
{
  id v4 = a3;
  categorySamples = self->_categorySamples;
  id v8 = v4;
  if (!categorySamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_categorySamples;
    self->_categorySamples = v6;

    id v4 = v8;
    categorySamples = self->_categorySamples;
  }
  [(NSMutableArray *)categorySamples addObject:v4];
}

- (unint64_t)count
{
  uint64_t v3 = [(NSMutableArray *)self->_categorySamples count];
  uint64_t v4 = [(NSMutableArray *)self->_quantitySamples count] + v3;
  uint64_t v5 = [(NSMutableArray *)self->_workouts count];
  uint64_t v6 = v4 + v5 + [(NSMutableArray *)self->_correlations count];
  uint64_t v7 = [(NSMutableArray *)self->_activityCaches count];
  uint64_t v8 = v7 + [(NSMutableArray *)self->_activityGoalSchedules count];
  uint64_t v9 = v6 + v8 + [(NSMutableArray *)self->_pauseRingsSchedules count];
  uint64_t v10 = [(NSMutableArray *)self->_binarySamples count];
  uint64_t v11 = v10 + [(NSMutableArray *)self->_deletedSamples count];
  uint64_t v12 = v11 + [(NSMutableArray *)self->_locationSeries count];
  uint64_t v13 = v9 + v12 + [(NSMutableArray *)self->_cdaDocumentSamples count];
  uint64_t v14 = [(NSMutableArray *)self->_fitnessFriendAchievements count];
  uint64_t v15 = v14 + [(NSMutableArray *)self->_fitnessFriendActivitySnapshots count];
  uint64_t v16 = v15 + [(NSMutableArray *)self->_fitnessFriendWorkouts count];
  uint64_t v17 = v16 + [(NSMutableArray *)self->_ecgSamples count];
  uint64_t v18 = v13 + v17 + [(HDCodableGeneratedObjectCollection *)self->_generatedObjectCollection count];
  uint64_t v19 = [(NSMutableArray *)self->_sleepSchedules count];
  uint64_t v20 = v19 + [(NSMutableArray *)self->_visionSamples count];
  uint64_t v21 = v20 + [(NSMutableArray *)self->_stateOfMindLogs count];
  uint64_t v22 = v21 + [(NSMutableArray *)self->_scoredAssessmentSamples count];
  return v18 + v22 + [(NSMutableArray *)self->_workoutZones count];
}

- (void)writeTo:(id)a3
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sourceBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_source) {
    PBDataWriterWriteSubmessage();
  }
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  uint64_t v5 = self->_categorySamples;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v181 objects:v204 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v182;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v182 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v181 objects:v204 count:16];
    }
    while (v7);
  }

  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v177 = 0u;
  uint64_t v10 = self->_quantitySamples;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v177 objects:v203 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v178;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v178 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v177 objects:v203 count:16];
    }
    while (v12);
  }

  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  uint64_t v15 = self->_workouts;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v173 objects:v202 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v174;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v174 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v173 objects:v202 count:16];
    }
    while (v17);
  }

  long long v172 = 0u;
  long long v171 = 0u;
  long long v170 = 0u;
  long long v169 = 0u;
  uint64_t v20 = self->_correlations;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v169 objects:v201 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v170;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v170 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v169 objects:v201 count:16];
    }
    while (v22);
  }

  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  v25 = self->_activityCaches;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v165 objects:v200 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v166;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v166 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v165 objects:v200 count:16];
    }
    while (v27);
  }

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  v30 = self->_binarySamples;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v161 objects:v199 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v162;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v162 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v161 objects:v199 count:16];
    }
    while (v32);
  }

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  v35 = self->_deletedSamples;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v157 objects:v198 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v158;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v158 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v157 objects:v198 count:16];
    }
    while (v37);
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  v40 = self->_locationSeries;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v153 objects:v197 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v154;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v154 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v153 objects:v197 count:16];
    }
    while (v42);
  }

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  v45 = self->_cdaDocumentSamples;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v149 objects:v196 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v150;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v150 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v149 objects:v196 count:16];
    }
    while (v47);
  }

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  v50 = self->_fitnessFriendActivitySnapshots;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v145 objects:v195 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v146;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v146 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v145 objects:v195 count:16];
    }
    while (v52);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v55 = self->_fitnessFriendAchievements;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v141 objects:v194 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v142;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v142 != v58) {
          objc_enumerationMutation(v55);
        }
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v141 objects:v194 count:16];
    }
    while (v57);
  }

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v60 = self->_fitnessFriendWorkouts;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v137 objects:v193 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v138;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v138 != v63) {
          objc_enumerationMutation(v60);
        }
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v137 objects:v193 count:16];
    }
    while (v62);
  }

  if (self->_generatedObjectCollection) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_provenance) {
    PBDataWriterWriteSubmessage();
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  v65 = self->_sleepSchedules;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v133 objects:v192 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v134;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v134 != v68) {
          objc_enumerationMutation(v65);
        }
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v133 objects:v192 count:16];
    }
    while (v67);
  }

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v70 = self->_ecgSamples;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v129 objects:v191 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v130;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v130 != v73) {
          objc_enumerationMutation(v70);
        }
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v129 objects:v191 count:16];
    }
    while (v72);
  }

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  v75 = self->_visionSamples;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v125 objects:v190 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v126;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v126 != v78) {
          objc_enumerationMutation(v75);
        }
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v125 objects:v190 count:16];
    }
    while (v77);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v80 = self->_stateOfMindLogs;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v121 objects:v189 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v122;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v122 != v83) {
          objc_enumerationMutation(v80);
        }
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v121 objects:v189 count:16];
    }
    while (v82);
  }

  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v85 = self->_scoredAssessmentSamples;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v117 objects:v188 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v118;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v118 != v88) {
          objc_enumerationMutation(v85);
        }
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v117 objects:v188 count:16];
    }
    while (v87);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v90 = self->_workoutZones;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v113 objects:v187 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v114;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v114 != v93) {
          objc_enumerationMutation(v90);
        }
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v113 objects:v187 count:16];
    }
    while (v92);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v95 = self->_activityGoalSchedules;
  uint64_t v96 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v109 objects:v186 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v110;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v110 != v98) {
          objc_enumerationMutation(v95);
        }
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      uint64_t v97 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v109 objects:v186 count:16];
    }
    while (v97);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v100 = self->_pauseRingsSchedules;
  uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v105 objects:v185 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v106;
    do
    {
      uint64_t v104 = 0;
      do
      {
        if (*(void *)v106 != v103) {
          objc_enumerationMutation(v100);
        }
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      uint64_t v102 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v105 objects:v185 count:16];
    }
    while (v102);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workouts, 0);
  objc_storeStrong((id *)&self->_workoutZones, 0);
  objc_storeStrong((id *)&self->_visionSamples, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_stateOfMindLogs, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sleepSchedules, 0);
  objc_storeStrong((id *)&self->_scoredAssessmentSamples, 0);
  objc_storeStrong((id *)&self->_quantitySamples, 0);
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_pauseRingsSchedules, 0);
  objc_storeStrong((id *)&self->_locationSeries, 0);
  objc_storeStrong((id *)&self->_generatedObjectCollection, 0);
  objc_storeStrong((id *)&self->_fitnessFriendWorkouts, 0);
  objc_storeStrong((id *)&self->_fitnessFriendActivitySnapshots, 0);
  objc_storeStrong((id *)&self->_fitnessFriendAchievements, 0);
  objc_storeStrong((id *)&self->_ecgSamples, 0);
  objc_storeStrong((id *)&self->_deletedSamples, 0);
  objc_storeStrong((id *)&self->_correlations, 0);
  objc_storeStrong((id *)&self->_cdaDocumentSamples, 0);
  objc_storeStrong((id *)&self->_categorySamples, 0);
  objc_storeStrong((id *)&self->_binarySamples, 0);
  objc_storeStrong((id *)&self->_activityGoalSchedules, 0);

  objc_storeStrong((id *)&self->_activityCaches, 0);
}

- (void)addQuantitySamples:(id)a3
{
  id v4 = a3;
  quantitySamples = self->_quantitySamples;
  id v8 = v4;
  if (!quantitySamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_quantitySamples;
    self->_quantitySamples = v6;

    id v4 = v8;
    quantitySamples = self->_quantitySamples;
  }
  [(NSMutableArray *)quantitySamples addObject:v4];
}

- (void)addBinarySamples:(id)a3
{
  id v4 = a3;
  binarySamples = self->_binarySamples;
  id v8 = v4;
  if (!binarySamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_binarySamples;
    self->_binarySamples = v6;

    id v4 = v8;
    binarySamples = self->_binarySamples;
  }
  [(NSMutableArray *)binarySamples addObject:v4];
}

- (void)addFitnessFriendActivitySnapshots:(id)a3
{
  id v4 = a3;
  fitnessFriendActivitySnapshots = self->_fitnessFriendActivitySnapshots;
  id v8 = v4;
  if (!fitnessFriendActivitySnapshots)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_fitnessFriendActivitySnapshots;
    self->_fitnessFriendActivitySnapshots = v6;

    id v4 = v8;
    fitnessFriendActivitySnapshots = self->_fitnessFriendActivitySnapshots;
  }
  [(NSMutableArray *)fitnessFriendActivitySnapshots addObject:v4];
}

- (void)addFitnessFriendAchievements:(id)a3
{
  id v4 = a3;
  fitnessFriendAchievements = self->_fitnessFriendAchievements;
  id v8 = v4;
  if (!fitnessFriendAchievements)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_fitnessFriendAchievements;
    self->_fitnessFriendAchievements = v6;

    id v4 = v8;
    fitnessFriendAchievements = self->_fitnessFriendAchievements;
  }
  [(NSMutableArray *)fitnessFriendAchievements addObject:v4];
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (id)decodedObjects
{
  uint64_t v258 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HDCodableObjectCollection_HDCodingSupport__decodedObjects__block_invoke;
  aBlock[3] = &unk_1E62FF770;
  id v160 = v3;
  id v238 = v160;
  id v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v233 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  uint64_t v5 = [(HDCodableObjectCollection *)self categorySamples];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v233 objects:v257 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v234;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v234 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v233 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v12 = [MEMORY[0x1E4F2ACB0] createWithCodable:v10];
        v4[2](v4, v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v233 objects:v257 count:16];
    }
    while (v7);
  }

  long long v232 = 0u;
  long long v231 = 0u;
  long long v230 = 0u;
  long long v229 = 0u;
  uint64_t v13 = [(HDCodableObjectCollection *)self quantitySamples];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v229 objects:v256 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v230;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v230 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v229 + 1) + 8 * j);
        uint64_t v19 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v20 = [MEMORY[0x1E4F2B388] createWithCodable:v18];
        if (!v20)
        {
          uint64_t v20 = [MEMORY[0x1E4F2B388] migrateCodableObject:v18];
        }
        v4[2](v4, v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v229 objects:v256 count:16];
    }
    while (v15);
  }

  long long v228 = 0u;
  long long v227 = 0u;
  long long v226 = 0u;
  long long v225 = 0u;
  uint64_t v21 = [(HDCodableObjectCollection *)self workouts];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v225 objects:v255 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v226;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v226 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v225 + 1) + 8 * k);
        uint64_t v27 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v28 = [MEMORY[0x1E4F2B718] createWithCodable:v26];
        v4[2](v4, v28);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v225 objects:v255 count:16];
    }
    while (v23);
  }

  long long v223 = 0u;
  long long v224 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  uint64_t v29 = [(HDCodableObjectCollection *)self correlations];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v221 objects:v254 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v222;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v222 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v221 + 1) + 8 * m);
        v35 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v36 = [MEMORY[0x1E4F2AE50] createWithCodable:v34];
        v4[2](v4, v36);
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v221 objects:v254 count:16];
    }
    while (v31);
  }

  long long v219 = 0u;
  long long v220 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  uint64_t v37 = [(HDCodableObjectCollection *)self activityCaches];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v217 objects:v253 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v218;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v218 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v217 + 1) + 8 * n);
        uint64_t v43 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v44 = [MEMORY[0x1E4F2AB98] createWithCodable:v42];
        v4[2](v4, v44);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v217 objects:v253 count:16];
    }
    while (v39);
  }

  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  v45 = [(HDCodableObjectCollection *)self activityGoalSchedules];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v213 objects:v252 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v214;
    do
    {
      for (iuint64_t i = 0; ii != v47; ++ii)
      {
        if (*(void *)v214 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v213 + 1) + 8 * ii);
        uint64_t v51 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v52 = [MEMORY[0x1E4F2ABA0] createWithCodable:v50];
        v4[2](v4, v52);
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v213 objects:v252 count:16];
    }
    while (v47);
  }

  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  uint64_t v53 = [(HDCodableObjectCollection *)self pauseRingsSchedules];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v209 objects:v251 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v210;
    do
    {
      for (juint64_t j = 0; jj != v55; ++jj)
      {
        if (*(void *)v210 != v56) {
          objc_enumerationMutation(v53);
        }
        uint64_t v58 = *(void *)(*((void *)&v209 + 1) + 8 * jj);
        uint64_t v59 = (void *)MEMORY[0x1C187C0E0]();
        v60 = [MEMORY[0x1E4F2B320] createWithCodable:v58];
        v4[2](v4, v60);
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v209 objects:v251 count:16];
    }
    while (v55);
  }

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  uint64_t v61 = [(HDCodableObjectCollection *)self binarySamples];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v205 objects:v250 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v206;
    do
    {
      for (kuint64_t k = 0; kk != v63; ++kk)
      {
        if (*(void *)v206 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = *(void *)(*((void *)&v205 + 1) + 8 * kk);
        uint64_t v67 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v68 = [MEMORY[0x1E4F2B420] createWithCodable:v66];
        v4[2](v4, v68);
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v205 objects:v250 count:16];
    }
    while (v63);
  }

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  uint64_t v69 = [(HDCodableObjectCollection *)self ecgSamples];
  uint64_t v70 = [v69 countByEnumeratingWithState:&v201 objects:v249 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v202;
    do
    {
      for (muint64_t m = 0; mm != v71; ++mm)
      {
        if (*(void *)v202 != v72) {
          objc_enumerationMutation(v69);
        }
        uint64_t v74 = *(void *)(*((void *)&v201 + 1) + 8 * mm);
        v75 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v76 = [MEMORY[0x1E4F2AF88] createWithCodable:v74];
        v4[2](v4, v76);
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v201 objects:v249 count:16];
    }
    while (v71);
  }

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  uint64_t v77 = [(HDCodableObjectCollection *)self locationSeries];
  uint64_t v78 = [v77 countByEnumeratingWithState:&v197 objects:v248 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v198;
    do
    {
      for (nuint64_t n = 0; nn != v79; ++nn)
      {
        if (*(void *)v198 != v80) {
          objc_enumerationMutation(v77);
        }
        uint64_t v82 = *(void *)(*((void *)&v197 + 1) + 8 * nn);
        uint64_t v83 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v84 = [MEMORY[0x1E4F2B7A0] createWithCodable:v82];
        v4[2](v4, v84);
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v197 objects:v248 count:16];
    }
    while (v79);
  }

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  v85 = [(HDCodableObjectCollection *)self cdaDocumentSamples];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v193 objects:v247 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v194;
    do
    {
      for (uint64_t i1 = 0; i1 != v87; ++i1)
      {
        if (*(void *)v194 != v88) {
          objc_enumerationMutation(v85);
        }
        uint64_t v90 = *(void *)(*((void *)&v193 + 1) + 8 * i1);
        uint64_t v91 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v92 = [MEMORY[0x1E4F2AC90] createWithCodable:v90];
        v4[2](v4, v92);
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v193 objects:v247 count:16];
    }
    while (v87);
  }

  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  uint64_t v93 = [(HDCodableObjectCollection *)self fitnessFriendAchievements];
  uint64_t v94 = [v93 countByEnumeratingWithState:&v189 objects:v246 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v190;
    do
    {
      for (uint64_t i2 = 0; i2 != v95; ++i2)
      {
        if (*(void *)v190 != v96) {
          objc_enumerationMutation(v93);
        }
        uint64_t v98 = *(void *)(*((void *)&v189 + 1) + 8 * i2);
        uint64_t v99 = (void *)MEMORY[0x1C187C0E0]();
        v100 = [MEMORY[0x1E4F2B8F0] createWithCodable:v98];
        v4[2](v4, v100);
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v189 objects:v246 count:16];
    }
    while (v95);
  }

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  uint64_t v101 = [(HDCodableObjectCollection *)self fitnessFriendActivitySnapshots];
  uint64_t v102 = [v101 countByEnumeratingWithState:&v185 objects:v245 count:16];
  if (v102)
  {
    uint64_t v103 = v102;
    uint64_t v104 = *(void *)v186;
    do
    {
      for (uint64_t i3 = 0; i3 != v103; ++i3)
      {
        if (*(void *)v186 != v104) {
          objc_enumerationMutation(v101);
        }
        uint64_t v106 = *(void *)(*((void *)&v185 + 1) + 8 * i3);
        long long v107 = (void *)MEMORY[0x1C187C0E0]();
        long long v108 = [MEMORY[0x1E4F2B8F8] createWithCodable:v106];
        v4[2](v4, v108);
      }
      uint64_t v103 = [v101 countByEnumeratingWithState:&v185 objects:v245 count:16];
    }
    while (v103);
  }

  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v109 = [(HDCodableObjectCollection *)self fitnessFriendWorkouts];
  uint64_t v110 = [v109 countByEnumeratingWithState:&v181 objects:v244 count:16];
  if (v110)
  {
    uint64_t v111 = v110;
    uint64_t v112 = *(void *)v182;
    do
    {
      for (uint64_t i4 = 0; i4 != v111; ++i4)
      {
        if (*(void *)v182 != v112) {
          objc_enumerationMutation(v109);
        }
        uint64_t v114 = *(void *)(*((void *)&v181 + 1) + 8 * i4);
        long long v115 = (void *)MEMORY[0x1C187C0E0]();
        long long v116 = [MEMORY[0x1E4F2B900] createWithCodable:v114];
        v4[2](v4, v116);
      }
      uint64_t v111 = [v109 countByEnumeratingWithState:&v181 objects:v244 count:16];
    }
    while (v111);
  }

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  long long v117 = [(HDCodableObjectCollection *)self sleepSchedules];
  uint64_t v118 = [v117 countByEnumeratingWithState:&v177 objects:v243 count:16];
  if (v118)
  {
    uint64_t v119 = v118;
    uint64_t v120 = *(void *)v178;
    do
    {
      for (uint64_t i5 = 0; i5 != v119; ++i5)
      {
        if (*(void *)v178 != v120) {
          objc_enumerationMutation(v117);
        }
        uint64_t v122 = *(void *)(*((void *)&v177 + 1) + 8 * i5);
        long long v123 = (void *)MEMORY[0x1C187C0E0]();
        long long v124 = [MEMORY[0x1E4F2B550] createWithCodable:v122];
        v4[2](v4, v124);
      }
      uint64_t v119 = [v117 countByEnumeratingWithState:&v177 objects:v243 count:16];
    }
    while (v119);
  }

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v125 = [(HDCodableObjectCollection *)self visionSamples];
  uint64_t v126 = [v125 countByEnumeratingWithState:&v173 objects:v242 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v174;
    do
    {
      for (uint64_t i6 = 0; i6 != v127; ++i6)
      {
        if (*(void *)v174 != v128) {
          objc_enumerationMutation(v125);
        }
        uint64_t v130 = *(void *)(*((void *)&v173 + 1) + 8 * i6);
        long long v131 = (void *)MEMORY[0x1C187C0E0]();
        long long v132 = [MEMORY[0x1E4F2B700] createWithCodable:v130];
        v4[2](v4, v132);
      }
      uint64_t v127 = [v125 countByEnumeratingWithState:&v173 objects:v242 count:16];
    }
    while (v127);
  }

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v133 = [(HDCodableObjectCollection *)self stateOfMindLogs];
  uint64_t v134 = [v133 countByEnumeratingWithState:&v169 objects:v241 count:16];
  if (v134)
  {
    uint64_t v135 = v134;
    uint64_t v136 = *(void *)v170;
    do
    {
      for (uint64_t i7 = 0; i7 != v135; ++i7)
      {
        if (*(void *)v170 != v136) {
          objc_enumerationMutation(v133);
        }
        uint64_t v138 = *(void *)(*((void *)&v169 + 1) + 8 * i7);
        long long v139 = (void *)MEMORY[0x1C187C0E0]();
        long long v140 = [MEMORY[0x1E4F2B590] createWithCodable:v138];
        v4[2](v4, v140);
      }
      uint64_t v135 = [v133 countByEnumeratingWithState:&v169 objects:v241 count:16];
    }
    while (v135);
  }

  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v141 = [(HDCodableObjectCollection *)self scoredAssessmentSamples];
  uint64_t v142 = [v141 countByEnumeratingWithState:&v165 objects:v240 count:16];
  if (v142)
  {
    uint64_t v143 = v142;
    uint64_t v144 = *(void *)v166;
    do
    {
      for (uint64_t i8 = 0; i8 != v143; ++i8)
      {
        if (*(void *)v166 != v144) {
          objc_enumerationMutation(v141);
        }
        uint64_t v146 = *(void *)(*((void *)&v165 + 1) + 8 * i8);
        long long v147 = (void *)MEMORY[0x1C187C0E0]();
        long long v148 = [MEMORY[0x1E4F2B458] createWithCodable:v146];
        v4[2](v4, v148);
      }
      uint64_t v143 = [v141 countByEnumeratingWithState:&v165 objects:v240 count:16];
    }
    while (v143);
  }

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v149 = [(HDCodableObjectCollection *)self workoutZones];
  uint64_t v150 = [v149 countByEnumeratingWithState:&v161 objects:v239 count:16];
  if (v150)
  {
    uint64_t v151 = v150;
    uint64_t v152 = *(void *)v162;
    do
    {
      for (uint64_t i9 = 0; i9 != v151; ++i9)
      {
        if (*(void *)v162 != v152) {
          objc_enumerationMutation(v149);
        }
        uint64_t v154 = *(void *)(*((void *)&v161 + 1) + 8 * i9);
        long long v155 = (void *)MEMORY[0x1C187C0E0]();
        long long v156 = [MEMORY[0x1E4F2B810] createWithCodable:v154];
        v4[2](v4, v156);
      }
      uint64_t v151 = [v149 countByEnumeratingWithState:&v161 objects:v239 count:16];
    }
    while (v151);
  }

  long long v157 = [(HDCodableGeneratedObjectCollection *)self->_generatedObjectCollection decodedObjects];
  [v160 addObjectsFromArray:v157];

  id v158 = v160;
  return v158;
}

- (NSMutableArray)categorySamples
{
  return self->_categorySamples;
}

- (NSMutableArray)quantitySamples
{
  return self->_quantitySamples;
}

uint64_t __60__HDCodableObjectCollection_HDCodingSupport__decodedObjects__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (NSMutableArray)workouts
{
  return self->_workouts;
}

- (NSMutableArray)correlations
{
  return self->_correlations;
}

- (NSMutableArray)activityCaches
{
  return self->_activityCaches;
}

- (NSMutableArray)binarySamples
{
  return self->_binarySamples;
}

- (NSMutableArray)locationSeries
{
  return self->_locationSeries;
}

- (NSMutableArray)cdaDocumentSamples
{
  return self->_cdaDocumentSamples;
}

- (NSMutableArray)fitnessFriendAchievements
{
  return self->_fitnessFriendAchievements;
}

- (NSMutableArray)fitnessFriendActivitySnapshots
{
  return self->_fitnessFriendActivitySnapshots;
}

- (NSMutableArray)fitnessFriendWorkouts
{
  return self->_fitnessFriendWorkouts;
}

- (void)setSource:(id)a3
{
}

- (void)setProvenance:(id)a3
{
}

- (void)addActivityCaches:(id)a3
{
  id v4 = a3;
  activityCaches = self->_activityCaches;
  id v8 = v4;
  if (!activityCaches)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_activityCaches;
    self->_activityCaches = v6;

    id v4 = v8;
    activityCaches = self->_activityCaches;
  }
  [(NSMutableArray *)activityCaches addObject:v4];
}

- (HDCodableSource)source
{
  return self->_source;
}

- (HDCodableProvenance)provenance
{
  return self->_provenance;
}

- (void)addWorkouts:(id)a3
{
  id v4 = a3;
  workouts = self->_workouts;
  id v8 = v4;
  if (!workouts)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_workouts;
    self->_workouts = v6;

    id v4 = v8;
    workouts = self->_workouts;
  }
  [(NSMutableArray *)workouts addObject:v4];
}

- (void)addDeletedSamples:(id)a3
{
  id v4 = a3;
  deletedSamples = self->_deletedSamples;
  id v8 = v4;
  if (!deletedSamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_deletedSamples;
    self->_deletedSamples = v6;

    id v4 = v8;
    deletedSamples = self->_deletedSamples;
  }
  [(NSMutableArray *)deletedSamples addObject:v4];
}

- (BOOL)hasSourceBundleIdentifier
{
  return self->_sourceBundleIdentifier != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)clearCategorySamples
{
}

- (unint64_t)categorySamplesCount
{
  return [(NSMutableArray *)self->_categorySamples count];
}

- (id)categorySamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categorySamples objectAtIndex:a3];
}

+ (Class)categorySamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearQuantitySamples
{
}

- (unint64_t)quantitySamplesCount
{
  return [(NSMutableArray *)self->_quantitySamples count];
}

- (id)quantitySamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_quantitySamples objectAtIndex:a3];
}

+ (Class)quantitySamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearWorkouts
{
}

- (unint64_t)workoutsCount
{
  return [(NSMutableArray *)self->_workouts count];
}

- (id)workoutsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_workouts objectAtIndex:a3];
}

+ (Class)workoutsType
{
  return (Class)objc_opt_class();
}

- (void)clearCorrelations
{
}

- (void)addCorrelations:(id)a3
{
  id v4 = a3;
  correlations = self->_correlations;
  id v8 = v4;
  if (!correlations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_correlations;
    self->_correlations = v6;

    id v4 = v8;
    correlations = self->_correlations;
  }
  [(NSMutableArray *)correlations addObject:v4];
}

- (unint64_t)correlationsCount
{
  return [(NSMutableArray *)self->_correlations count];
}

- (id)correlationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_correlations objectAtIndex:a3];
}

+ (Class)correlationsType
{
  return (Class)objc_opt_class();
}

- (void)clearActivityCaches
{
}

- (unint64_t)activityCachesCount
{
  return [(NSMutableArray *)self->_activityCaches count];
}

- (id)activityCachesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activityCaches objectAtIndex:a3];
}

+ (Class)activityCachesType
{
  return (Class)objc_opt_class();
}

- (void)clearBinarySamples
{
}

- (unint64_t)binarySamplesCount
{
  return [(NSMutableArray *)self->_binarySamples count];
}

- (id)binarySamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_binarySamples objectAtIndex:a3];
}

+ (Class)binarySamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearDeletedSamples
{
}

- (unint64_t)deletedSamplesCount
{
  return [(NSMutableArray *)self->_deletedSamples count];
}

- (id)deletedSamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deletedSamples objectAtIndex:a3];
}

+ (Class)deletedSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearLocationSeries
{
}

- (void)addLocationSeries:(id)a3
{
  id v4 = a3;
  locationSeries = self->_locationSeries;
  id v8 = v4;
  if (!locationSeries)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_locationSeries;
    self->_locationSeries = v6;

    id v4 = v8;
    locationSeries = self->_locationSeries;
  }
  [(NSMutableArray *)locationSeries addObject:v4];
}

- (unint64_t)locationSeriesCount
{
  return [(NSMutableArray *)self->_locationSeries count];
}

- (id)locationSeriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locationSeries objectAtIndex:a3];
}

+ (Class)locationSeriesType
{
  return (Class)objc_opt_class();
}

- (void)clearCdaDocumentSamples
{
}

- (void)addCdaDocumentSamples:(id)a3
{
  id v4 = a3;
  cdaDocumentSamples = self->_cdaDocumentSamples;
  id v8 = v4;
  if (!cdaDocumentSamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_cdaDocumentSamples;
    self->_cdaDocumentSamples = v6;

    id v4 = v8;
    cdaDocumentSamples = self->_cdaDocumentSamples;
  }
  [(NSMutableArray *)cdaDocumentSamples addObject:v4];
}

- (unint64_t)cdaDocumentSamplesCount
{
  return [(NSMutableArray *)self->_cdaDocumentSamples count];
}

- (id)cdaDocumentSamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cdaDocumentSamples objectAtIndex:a3];
}

+ (Class)cdaDocumentSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearFitnessFriendActivitySnapshots
{
}

- (unint64_t)fitnessFriendActivitySnapshotsCount
{
  return [(NSMutableArray *)self->_fitnessFriendActivitySnapshots count];
}

- (id)fitnessFriendActivitySnapshotsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fitnessFriendActivitySnapshots objectAtIndex:a3];
}

+ (Class)fitnessFriendActivitySnapshotsType
{
  return (Class)objc_opt_class();
}

- (void)clearFitnessFriendAchievements
{
}

- (unint64_t)fitnessFriendAchievementsCount
{
  return [(NSMutableArray *)self->_fitnessFriendAchievements count];
}

- (id)fitnessFriendAchievementsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fitnessFriendAchievements objectAtIndex:a3];
}

+ (Class)fitnessFriendAchievementsType
{
  return (Class)objc_opt_class();
}

- (void)clearFitnessFriendWorkouts
{
}

- (void)addFitnessFriendWorkouts:(id)a3
{
  id v4 = a3;
  fitnessFriendWorkouts = self->_fitnessFriendWorkouts;
  id v8 = v4;
  if (!fitnessFriendWorkouts)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_fitnessFriendWorkouts;
    self->_fitnessFriendWorkouts = v6;

    id v4 = v8;
    fitnessFriendWorkouts = self->_fitnessFriendWorkouts;
  }
  [(NSMutableArray *)fitnessFriendWorkouts addObject:v4];
}

- (unint64_t)fitnessFriendWorkoutsCount
{
  return [(NSMutableArray *)self->_fitnessFriendWorkouts count];
}

- (id)fitnessFriendWorkoutsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fitnessFriendWorkouts objectAtIndex:a3];
}

+ (Class)fitnessFriendWorkoutsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGeneratedObjectCollection
{
  return self->_generatedObjectCollection != 0;
}

- (BOOL)hasProvenance
{
  return self->_provenance != 0;
}

- (void)clearSleepSchedules
{
}

- (void)addSleepSchedules:(id)a3
{
  id v4 = a3;
  sleepSchedules = self->_sleepSchedules;
  id v8 = v4;
  if (!sleepSchedules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_sleepSchedules;
    self->_sleepSchedules = v6;

    id v4 = v8;
    sleepSchedules = self->_sleepSchedules;
  }
  [(NSMutableArray *)sleepSchedules addObject:v4];
}

- (unint64_t)sleepSchedulesCount
{
  return [(NSMutableArray *)self->_sleepSchedules count];
}

- (id)sleepSchedulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sleepSchedules objectAtIndex:a3];
}

+ (Class)sleepSchedulesType
{
  return (Class)objc_opt_class();
}

- (void)clearEcgSamples
{
}

- (void)addEcgSamples:(id)a3
{
  id v4 = a3;
  ecgSamples = self->_ecgSamples;
  id v8 = v4;
  if (!ecgSamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_ecgSamples;
    self->_ecgSamples = v6;

    id v4 = v8;
    ecgSamples = self->_ecgSamples;
  }
  [(NSMutableArray *)ecgSamples addObject:v4];
}

- (unint64_t)ecgSamplesCount
{
  return [(NSMutableArray *)self->_ecgSamples count];
}

- (id)ecgSamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ecgSamples objectAtIndex:a3];
}

+ (Class)ecgSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearVisionSamples
{
}

- (void)addVisionSamples:(id)a3
{
  id v4 = a3;
  visionSamples = self->_visionSamples;
  id v8 = v4;
  if (!visionSamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_visionSamples;
    self->_visionSamples = v6;

    id v4 = v8;
    visionSamples = self->_visionSamples;
  }
  [(NSMutableArray *)visionSamples addObject:v4];
}

- (unint64_t)visionSamplesCount
{
  return [(NSMutableArray *)self->_visionSamples count];
}

- (id)visionSamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visionSamples objectAtIndex:a3];
}

+ (Class)visionSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearStateOfMindLogs
{
}

- (void)addStateOfMindLogs:(id)a3
{
  id v4 = a3;
  stateOfMindLogs = self->_stateOfMindLogs;
  id v8 = v4;
  if (!stateOfMindLogs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_stateOfMindLogs;
    self->_stateOfMindLogs = v6;

    id v4 = v8;
    stateOfMindLogs = self->_stateOfMindLogs;
  }
  [(NSMutableArray *)stateOfMindLogs addObject:v4];
}

- (unint64_t)stateOfMindLogsCount
{
  return [(NSMutableArray *)self->_stateOfMindLogs count];
}

- (id)stateOfMindLogsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stateOfMindLogs objectAtIndex:a3];
}

+ (Class)stateOfMindLogsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (void)clearScoredAssessmentSamples
{
}

- (void)addScoredAssessmentSamples:(id)a3
{
  id v4 = a3;
  scoredAssessmentSamples = self->_scoredAssessmentSamples;
  id v8 = v4;
  if (!scoredAssessmentSamples)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_scoredAssessmentSamples;
    self->_scoredAssessmentSamples = v6;

    id v4 = v8;
    scoredAssessmentSamples = self->_scoredAssessmentSamples;
  }
  [(NSMutableArray *)scoredAssessmentSamples addObject:v4];
}

- (unint64_t)scoredAssessmentSamplesCount
{
  return [(NSMutableArray *)self->_scoredAssessmentSamples count];
}

- (id)scoredAssessmentSamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scoredAssessmentSamples objectAtIndex:a3];
}

+ (Class)scoredAssessmentSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearWorkoutZones
{
}

- (void)addWorkoutZones:(id)a3
{
  id v4 = a3;
  workoutZones = self->_workoutZones;
  id v8 = v4;
  if (!workoutZones)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_workoutZones;
    self->_workoutZones = v6;

    id v4 = v8;
    workoutZones = self->_workoutZones;
  }
  [(NSMutableArray *)workoutZones addObject:v4];
}

- (unint64_t)workoutZonesCount
{
  return [(NSMutableArray *)self->_workoutZones count];
}

- (id)workoutZonesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_workoutZones objectAtIndex:a3];
}

+ (Class)workoutZonesType
{
  return (Class)objc_opt_class();
}

- (void)clearActivityGoalSchedules
{
}

- (void)addActivityGoalSchedules:(id)a3
{
  id v4 = a3;
  activityGoalSchedules = self->_activityGoalSchedules;
  id v8 = v4;
  if (!activityGoalSchedules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_activityGoalSchedules;
    self->_activityGoalSchedules = v6;

    id v4 = v8;
    activityGoalSchedules = self->_activityGoalSchedules;
  }
  [(NSMutableArray *)activityGoalSchedules addObject:v4];
}

- (unint64_t)activityGoalSchedulesCount
{
  return [(NSMutableArray *)self->_activityGoalSchedules count];
}

- (id)activityGoalSchedulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activityGoalSchedules objectAtIndex:a3];
}

+ (Class)activityGoalSchedulesType
{
  return (Class)objc_opt_class();
}

- (void)clearPauseRingsSchedules
{
}

- (void)addPauseRingsSchedules:(id)a3
{
  id v4 = a3;
  pauseRingsSchedules = self->_pauseRingsSchedules;
  id v8 = v4;
  if (!pauseRingsSchedules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_pauseRingsSchedules;
    self->_pauseRingsSchedules = v6;

    id v4 = v8;
    pauseRingsSchedules = self->_pauseRingsSchedules;
  }
  [(NSMutableArray *)pauseRingsSchedules addObject:v4];
}

- (unint64_t)pauseRingsSchedulesCount
{
  return [(NSMutableArray *)self->_pauseRingsSchedules count];
}

- (id)pauseRingsSchedulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pauseRingsSchedules objectAtIndex:a3];
}

+ (Class)pauseRingsSchedulesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectCollection;
  id v4 = [(HDCodableObjectCollection *)&v8 description];
  uint64_t v5 = [(HDCodableObjectCollection *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v256 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier) {
    [v3 setObject:sourceBundleIdentifier forKey:@"sourceBundleIdentifier"];
  }
  source = self->_source;
  if (source)
  {
    uint64_t v7 = [(HDCodableSource *)source dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"source"];
  }
  if ([(NSMutableArray *)self->_categorySamples count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_categorySamples, "count"));
    long long v232 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    uint64_t v9 = self->_categorySamples;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v232 objects:v255 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v233;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v233 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v232 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v232 objects:v255 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"categorySamples"];
  }
  if ([(NSMutableArray *)self->_quantitySamples count])
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_quantitySamples, "count"));
    long long v228 = 0u;
    long long v229 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    uint64_t v16 = self->_quantitySamples;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v228 objects:v254 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v229;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v229 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v228 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v228 objects:v254 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"quantitySamples"];
  }
  if ([(NSMutableArray *)self->_workouts count])
  {
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_workouts, "count"));
    long long v224 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    uint64_t v23 = self->_workouts;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v224 objects:v253 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v225;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v225 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v224 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v224 objects:v253 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"workouts"];
  }
  if ([(NSMutableArray *)self->_correlations count])
  {
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_correlations, "count"));
    long long v220 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    uint64_t v30 = self->_correlations;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v220 objects:v252 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v221;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v221 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v220 + 1) + 8 * m) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v220 objects:v252 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"correlations"];
  }
  if ([(NSMutableArray *)self->_activityCaches count])
  {
    uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_activityCaches, "count"));
    long long v216 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    uint64_t v37 = self->_activityCaches;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v216 objects:v251 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v217;
      do
      {
        for (uint64_t n = 0; n != v39; ++n)
        {
          if (*(void *)v217 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = [*(id *)(*((void *)&v216 + 1) + 8 * n) dictionaryRepresentation];
          [v36 addObject:v42];
        }
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v216 objects:v251 count:16];
      }
      while (v39);
    }

    [v4 setObject:v36 forKey:@"activityCaches"];
  }
  if ([(NSMutableArray *)self->_binarySamples count])
  {
    uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_binarySamples, "count"));
    long long v212 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    uint64_t v44 = self->_binarySamples;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v212 objects:v250 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v213;
      do
      {
        for (iuint64_t i = 0; ii != v46; ++ii)
        {
          if (*(void *)v213 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = [*(id *)(*((void *)&v212 + 1) + 8 * ii) dictionaryRepresentation];
          [v43 addObject:v49];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v212 objects:v250 count:16];
      }
      while (v46);
    }

    [v4 setObject:v43 forKey:@"binarySamples"];
  }
  if ([(NSMutableArray *)self->_deletedSamples count])
  {
    uint64_t v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_deletedSamples, "count"));
    long long v208 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    uint64_t v51 = self->_deletedSamples;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v208 objects:v249 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v209;
      do
      {
        for (juint64_t j = 0; jj != v53; ++jj)
        {
          if (*(void *)v209 != v54) {
            objc_enumerationMutation(v51);
          }
          uint64_t v56 = [*(id *)(*((void *)&v208 + 1) + 8 * jj) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v208 objects:v249 count:16];
      }
      while (v53);
    }

    [v4 setObject:v50 forKey:@"deletedSamples"];
  }
  if ([(NSMutableArray *)self->_locationSeries count])
  {
    uint64_t v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locationSeries, "count"));
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    uint64_t v58 = self->_locationSeries;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v204 objects:v248 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v205;
      do
      {
        for (kuint64_t k = 0; kk != v60; ++kk)
        {
          if (*(void *)v205 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v63 = [*(id *)(*((void *)&v204 + 1) + 8 * kk) dictionaryRepresentation];
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v204 objects:v248 count:16];
      }
      while (v60);
    }

    [v4 setObject:v57 forKey:@"locationSeries"];
  }
  if ([(NSMutableArray *)self->_cdaDocumentSamples count])
  {
    uint64_t v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cdaDocumentSamples, "count"));
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    v65 = self->_cdaDocumentSamples;
    uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v200 objects:v247 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v201;
      do
      {
        for (muint64_t m = 0; mm != v67; ++mm)
        {
          if (*(void *)v201 != v68) {
            objc_enumerationMutation(v65);
          }
          uint64_t v70 = [*(id *)(*((void *)&v200 + 1) + 8 * mm) dictionaryRepresentation];
          [v64 addObject:v70];
        }
        uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v200 objects:v247 count:16];
      }
      while (v67);
    }

    [v4 setObject:v64 forKey:@"cdaDocumentSamples"];
  }
  if ([(NSMutableArray *)self->_fitnessFriendActivitySnapshots count])
  {
    uint64_t v71 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fitnessFriendActivitySnapshots, "count"));
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    uint64_t v72 = self->_fitnessFriendActivitySnapshots;
    uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v196 objects:v246 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v197;
      do
      {
        for (nuint64_t n = 0; nn != v74; ++nn)
        {
          if (*(void *)v197 != v75) {
            objc_enumerationMutation(v72);
          }
          uint64_t v77 = [*(id *)(*((void *)&v196 + 1) + 8 * nn) dictionaryRepresentation];
          [v71 addObject:v77];
        }
        uint64_t v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v196 objects:v246 count:16];
      }
      while (v74);
    }

    [v4 setObject:v71 forKey:@"fitnessFriendActivitySnapshots"];
  }
  if ([(NSMutableArray *)self->_fitnessFriendAchievements count])
  {
    uint64_t v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fitnessFriendAchievements, "count"));
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    uint64_t v79 = self->_fitnessFriendAchievements;
    uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v192 objects:v245 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v193;
      do
      {
        for (uint64_t i1 = 0; i1 != v81; ++i1)
        {
          if (*(void *)v193 != v82) {
            objc_enumerationMutation(v79);
          }
          uint64_t v84 = [*(id *)(*((void *)&v192 + 1) + 8 * i1) dictionaryRepresentation];
          [v78 addObject:v84];
        }
        uint64_t v81 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v192 objects:v245 count:16];
      }
      while (v81);
    }

    [v4 setObject:v78 forKey:@"fitnessFriendAchievements"];
  }
  if ([(NSMutableArray *)self->_fitnessFriendWorkouts count])
  {
    v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fitnessFriendWorkouts, "count"));
    long long v188 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    uint64_t v86 = self->_fitnessFriendWorkouts;
    uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v188 objects:v244 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v189;
      do
      {
        for (uint64_t i2 = 0; i2 != v88; ++i2)
        {
          if (*(void *)v189 != v89) {
            objc_enumerationMutation(v86);
          }
          uint64_t v91 = [*(id *)(*((void *)&v188 + 1) + 8 * i2) dictionaryRepresentation];
          [v85 addObject:v91];
        }
        uint64_t v88 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v188 objects:v244 count:16];
      }
      while (v88);
    }

    [v4 setObject:v85 forKey:@"fitnessFriendWorkouts"];
  }
  generatedObjectCollectiouint64_t n = self->_generatedObjectCollection;
  if (generatedObjectCollection)
  {
    uint64_t v93 = [(HDCodableGeneratedObjectCollection *)generatedObjectCollection dictionaryRepresentation];
    [v4 setObject:v93 forKey:@"generatedObjectCollection"];
  }
  provenance = self->_provenance;
  if (provenance)
  {
    uint64_t v95 = [(HDCodableProvenance *)provenance dictionaryRepresentation];
    [v4 setObject:v95 forKey:@"provenance"];
  }
  if ([(NSMutableArray *)self->_sleepSchedules count])
  {
    uint64_t v96 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sleepSchedules, "count"));
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    uint64_t v97 = self->_sleepSchedules;
    uint64_t v98 = [(NSMutableArray *)v97 countByEnumeratingWithState:&v184 objects:v243 count:16];
    if (v98)
    {
      uint64_t v99 = v98;
      uint64_t v100 = *(void *)v185;
      do
      {
        for (uint64_t i3 = 0; i3 != v99; ++i3)
        {
          if (*(void *)v185 != v100) {
            objc_enumerationMutation(v97);
          }
          uint64_t v102 = [*(id *)(*((void *)&v184 + 1) + 8 * i3) dictionaryRepresentation];
          [v96 addObject:v102];
        }
        uint64_t v99 = [(NSMutableArray *)v97 countByEnumeratingWithState:&v184 objects:v243 count:16];
      }
      while (v99);
    }

    [v4 setObject:v96 forKey:@"sleepSchedules"];
  }
  if ([(NSMutableArray *)self->_ecgSamples count])
  {
    uint64_t v103 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_ecgSamples, "count"));
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    uint64_t v104 = self->_ecgSamples;
    uint64_t v105 = [(NSMutableArray *)v104 countByEnumeratingWithState:&v180 objects:v242 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v181;
      do
      {
        for (uint64_t i4 = 0; i4 != v106; ++i4)
        {
          if (*(void *)v181 != v107) {
            objc_enumerationMutation(v104);
          }
          long long v109 = [*(id *)(*((void *)&v180 + 1) + 8 * i4) dictionaryRepresentation];
          [v103 addObject:v109];
        }
        uint64_t v106 = [(NSMutableArray *)v104 countByEnumeratingWithState:&v180 objects:v242 count:16];
      }
      while (v106);
    }

    [v4 setObject:v103 forKey:@"ecgSamples"];
  }
  if ([(NSMutableArray *)self->_visionSamples count])
  {
    uint64_t v110 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_visionSamples, "count"));
    long long v176 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    uint64_t v111 = self->_visionSamples;
    uint64_t v112 = [(NSMutableArray *)v111 countByEnumeratingWithState:&v176 objects:v241 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v177;
      do
      {
        for (uint64_t i5 = 0; i5 != v113; ++i5)
        {
          if (*(void *)v177 != v114) {
            objc_enumerationMutation(v111);
          }
          long long v116 = [*(id *)(*((void *)&v176 + 1) + 8 * i5) dictionaryRepresentation];
          [v110 addObject:v116];
        }
        uint64_t v113 = [(NSMutableArray *)v111 countByEnumeratingWithState:&v176 objects:v241 count:16];
      }
      while (v113);
    }

    [v4 setObject:v110 forKey:@"visionSamples"];
  }
  if ([(NSMutableArray *)self->_stateOfMindLogs count])
  {
    long long v117 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_stateOfMindLogs, "count"));
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    uint64_t v118 = self->_stateOfMindLogs;
    uint64_t v119 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v172 objects:v240 count:16];
    if (v119)
    {
      uint64_t v120 = v119;
      uint64_t v121 = *(void *)v173;
      do
      {
        for (uint64_t i6 = 0; i6 != v120; ++i6)
        {
          if (*(void *)v173 != v121) {
            objc_enumerationMutation(v118);
          }
          long long v123 = [*(id *)(*((void *)&v172 + 1) + 8 * i6) dictionaryRepresentation];
          [v117 addObject:v123];
        }
        uint64_t v120 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v172 objects:v240 count:16];
      }
      while (v120);
    }

    [v4 setObject:v117 forKey:@"stateOfMindLogs"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    long long v125 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v125 forKey:@"syncIdentity"];
  }
  if ([(NSMutableArray *)self->_scoredAssessmentSamples count])
  {
    uint64_t v126 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_scoredAssessmentSamples, "count"));
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    uint64_t v127 = self->_scoredAssessmentSamples;
    uint64_t v128 = [(NSMutableArray *)v127 countByEnumeratingWithState:&v168 objects:v239 count:16];
    if (v128)
    {
      uint64_t v129 = v128;
      uint64_t v130 = *(void *)v169;
      do
      {
        for (uint64_t i7 = 0; i7 != v129; ++i7)
        {
          if (*(void *)v169 != v130) {
            objc_enumerationMutation(v127);
          }
          long long v132 = [*(id *)(*((void *)&v168 + 1) + 8 * i7) dictionaryRepresentation];
          [v126 addObject:v132];
        }
        uint64_t v129 = [(NSMutableArray *)v127 countByEnumeratingWithState:&v168 objects:v239 count:16];
      }
      while (v129);
    }

    [v4 setObject:v126 forKey:@"scoredAssessmentSamples"];
  }
  if ([(NSMutableArray *)self->_workoutZones count])
  {
    long long v133 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_workoutZones, "count"));
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    uint64_t v134 = self->_workoutZones;
    uint64_t v135 = [(NSMutableArray *)v134 countByEnumeratingWithState:&v164 objects:v238 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = *(void *)v165;
      do
      {
        for (uint64_t i8 = 0; i8 != v136; ++i8)
        {
          if (*(void *)v165 != v137) {
            objc_enumerationMutation(v134);
          }
          long long v139 = [*(id *)(*((void *)&v164 + 1) + 8 * i8) dictionaryRepresentation];
          [v133 addObject:v139];
        }
        uint64_t v136 = [(NSMutableArray *)v134 countByEnumeratingWithState:&v164 objects:v238 count:16];
      }
      while (v136);
    }

    [v4 setObject:v133 forKey:@"workoutZones"];
  }
  if ([(NSMutableArray *)self->_activityGoalSchedules count])
  {
    long long v140 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_activityGoalSchedules, "count"));
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v141 = self->_activityGoalSchedules;
    uint64_t v142 = [(NSMutableArray *)v141 countByEnumeratingWithState:&v160 objects:v237 count:16];
    if (v142)
    {
      uint64_t v143 = v142;
      uint64_t v144 = *(void *)v161;
      do
      {
        for (uint64_t i9 = 0; i9 != v143; ++i9)
        {
          if (*(void *)v161 != v144) {
            objc_enumerationMutation(v141);
          }
          uint64_t v146 = [*(id *)(*((void *)&v160 + 1) + 8 * i9) dictionaryRepresentation];
          [v140 addObject:v146];
        }
        uint64_t v143 = [(NSMutableArray *)v141 countByEnumeratingWithState:&v160 objects:v237 count:16];
      }
      while (v143);
    }

    [v4 setObject:v140 forKey:@"activityGoalSchedules"];
  }
  if ([(NSMutableArray *)self->_pauseRingsSchedules count])
  {
    long long v147 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pauseRingsSchedules, "count"));
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v148 = self->_pauseRingsSchedules;
    uint64_t v149 = [(NSMutableArray *)v148 countByEnumeratingWithState:&v156 objects:v236 count:16];
    if (v149)
    {
      uint64_t v150 = v149;
      uint64_t v151 = *(void *)v157;
      do
      {
        for (uint64_t i10 = 0; i10 != v150; ++i10)
        {
          if (*(void *)v157 != v151) {
            objc_enumerationMutation(v148);
          }
          long long v153 = objc_msgSend(*(id *)(*((void *)&v156 + 1) + 8 * i10), "dictionaryRepresentation", (void)v156);
          [v147 addObject:v153];
        }
        uint64_t v150 = [(NSMutableArray *)v148 countByEnumeratingWithState:&v156 objects:v236 count:16];
      }
      while (v150);
    }

    [v4 setObject:v147 forKey:@"pauseRingsSchedules"];
  }
  id v154 = v4;

  return v154;
}

- (void)copyTo:(id)a3
{
  id v84 = a3;
  if (self->_sourceBundleIdentifier) {
    objc_msgSend(v84, "setSourceBundleIdentifier:");
  }
  if (self->_source) {
    objc_msgSend(v84, "setSource:");
  }
  if ([(HDCodableObjectCollection *)self categorySamplesCount])
  {
    [v84 clearCategorySamples];
    unint64_t v4 = [(HDCodableObjectCollection *)self categorySamplesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableObjectCollection *)self categorySamplesAtIndex:i];
        [v84 addCategorySamples:v7];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self quantitySamplesCount])
  {
    [v84 clearQuantitySamples];
    unint64_t v8 = [(HDCodableObjectCollection *)self quantitySamplesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HDCodableObjectCollection *)self quantitySamplesAtIndex:j];
        [v84 addQuantitySamples:v11];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self workoutsCount])
  {
    [v84 clearWorkouts];
    unint64_t v12 = [(HDCodableObjectCollection *)self workoutsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(HDCodableObjectCollection *)self workoutsAtIndex:k];
        [v84 addWorkouts:v15];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self correlationsCount])
  {
    [v84 clearCorrelations];
    unint64_t v16 = [(HDCodableObjectCollection *)self correlationsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(HDCodableObjectCollection *)self correlationsAtIndex:m];
        [v84 addCorrelations:v19];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self activityCachesCount])
  {
    [v84 clearActivityCaches];
    unint64_t v20 = [(HDCodableObjectCollection *)self activityCachesCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(HDCodableObjectCollection *)self activityCachesAtIndex:n];
        [v84 addActivityCaches:v23];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self binarySamplesCount])
  {
    [v84 clearBinarySamples];
    unint64_t v24 = [(HDCodableObjectCollection *)self binarySamplesCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(HDCodableObjectCollection *)self binarySamplesAtIndex:ii];
        [v84 addBinarySamples:v27];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self deletedSamplesCount])
  {
    [v84 clearDeletedSamples];
    unint64_t v28 = [(HDCodableObjectCollection *)self deletedSamplesCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(HDCodableObjectCollection *)self deletedSamplesAtIndex:jj];
        [v84 addDeletedSamples:v31];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self locationSeriesCount])
  {
    [v84 clearLocationSeries];
    unint64_t v32 = [(HDCodableObjectCollection *)self locationSeriesCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (kuint64_t k = 0; kk != v33; ++kk)
      {
        v35 = [(HDCodableObjectCollection *)self locationSeriesAtIndex:kk];
        [v84 addLocationSeries:v35];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self cdaDocumentSamplesCount])
  {
    [v84 clearCdaDocumentSamples];
    unint64_t v36 = [(HDCodableObjectCollection *)self cdaDocumentSamplesCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (muint64_t m = 0; mm != v37; ++mm)
      {
        uint64_t v39 = [(HDCodableObjectCollection *)self cdaDocumentSamplesAtIndex:mm];
        [v84 addCdaDocumentSamples:v39];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self fitnessFriendActivitySnapshotsCount])
  {
    [v84 clearFitnessFriendActivitySnapshots];
    unint64_t v40 = [(HDCodableObjectCollection *)self fitnessFriendActivitySnapshotsCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (nuint64_t n = 0; nn != v41; ++nn)
      {
        uint64_t v43 = [(HDCodableObjectCollection *)self fitnessFriendActivitySnapshotsAtIndex:nn];
        [v84 addFitnessFriendActivitySnapshots:v43];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self fitnessFriendAchievementsCount])
  {
    [v84 clearFitnessFriendAchievements];
    unint64_t v44 = [(HDCodableObjectCollection *)self fitnessFriendAchievementsCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i1 = 0; i1 != v45; ++i1)
      {
        uint64_t v47 = [(HDCodableObjectCollection *)self fitnessFriendAchievementsAtIndex:i1];
        [v84 addFitnessFriendAchievements:v47];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self fitnessFriendWorkoutsCount])
  {
    [v84 clearFitnessFriendWorkouts];
    unint64_t v48 = [(HDCodableObjectCollection *)self fitnessFriendWorkoutsCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i2 = 0; i2 != v49; ++i2)
      {
        uint64_t v51 = [(HDCodableObjectCollection *)self fitnessFriendWorkoutsAtIndex:i2];
        [v84 addFitnessFriendWorkouts:v51];
      }
    }
  }
  if (self->_generatedObjectCollection) {
    objc_msgSend(v84, "setGeneratedObjectCollection:");
  }
  if (self->_provenance) {
    objc_msgSend(v84, "setProvenance:");
  }
  if ([(HDCodableObjectCollection *)self sleepSchedulesCount])
  {
    [v84 clearSleepSchedules];
    unint64_t v52 = [(HDCodableObjectCollection *)self sleepSchedulesCount];
    if (v52)
    {
      unint64_t v53 = v52;
      for (uint64_t i3 = 0; i3 != v53; ++i3)
      {
        uint64_t v55 = [(HDCodableObjectCollection *)self sleepSchedulesAtIndex:i3];
        [v84 addSleepSchedules:v55];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self ecgSamplesCount])
  {
    [v84 clearEcgSamples];
    unint64_t v56 = [(HDCodableObjectCollection *)self ecgSamplesCount];
    if (v56)
    {
      unint64_t v57 = v56;
      for (uint64_t i4 = 0; i4 != v57; ++i4)
      {
        uint64_t v59 = [(HDCodableObjectCollection *)self ecgSamplesAtIndex:i4];
        [v84 addEcgSamples:v59];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self visionSamplesCount])
  {
    [v84 clearVisionSamples];
    unint64_t v60 = [(HDCodableObjectCollection *)self visionSamplesCount];
    if (v60)
    {
      unint64_t v61 = v60;
      for (uint64_t i5 = 0; i5 != v61; ++i5)
      {
        uint64_t v63 = [(HDCodableObjectCollection *)self visionSamplesAtIndex:i5];
        [v84 addVisionSamples:v63];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self stateOfMindLogsCount])
  {
    [v84 clearStateOfMindLogs];
    unint64_t v64 = [(HDCodableObjectCollection *)self stateOfMindLogsCount];
    if (v64)
    {
      unint64_t v65 = v64;
      for (uint64_t i6 = 0; i6 != v65; ++i6)
      {
        uint64_t v67 = [(HDCodableObjectCollection *)self stateOfMindLogsAtIndex:i6];
        [v84 addStateOfMindLogs:v67];
      }
    }
  }
  if (self->_syncIdentity) {
    objc_msgSend(v84, "setSyncIdentity:");
  }
  if ([(HDCodableObjectCollection *)self scoredAssessmentSamplesCount])
  {
    [v84 clearScoredAssessmentSamples];
    unint64_t v68 = [(HDCodableObjectCollection *)self scoredAssessmentSamplesCount];
    if (v68)
    {
      unint64_t v69 = v68;
      for (uint64_t i7 = 0; i7 != v69; ++i7)
      {
        uint64_t v71 = [(HDCodableObjectCollection *)self scoredAssessmentSamplesAtIndex:i7];
        [v84 addScoredAssessmentSamples:v71];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self workoutZonesCount])
  {
    [v84 clearWorkoutZones];
    unint64_t v72 = [(HDCodableObjectCollection *)self workoutZonesCount];
    if (v72)
    {
      unint64_t v73 = v72;
      for (uint64_t i8 = 0; i8 != v73; ++i8)
      {
        uint64_t v75 = [(HDCodableObjectCollection *)self workoutZonesAtIndex:i8];
        [v84 addWorkoutZones:v75];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self activityGoalSchedulesCount])
  {
    [v84 clearActivityGoalSchedules];
    unint64_t v76 = [(HDCodableObjectCollection *)self activityGoalSchedulesCount];
    if (v76)
    {
      unint64_t v77 = v76;
      for (uint64_t i9 = 0; i9 != v77; ++i9)
      {
        uint64_t v79 = [(HDCodableObjectCollection *)self activityGoalSchedulesAtIndex:i9];
        [v84 addActivityGoalSchedules:v79];
      }
    }
  }
  if ([(HDCodableObjectCollection *)self pauseRingsSchedulesCount])
  {
    [v84 clearPauseRingsSchedules];
    unint64_t v80 = [(HDCodableObjectCollection *)self pauseRingsSchedulesCount];
    if (v80)
    {
      unint64_t v81 = v80;
      for (uint64_t i10 = 0; i10 != v81; ++i10)
      {
        uint64_t v83 = [(HDCodableObjectCollection *)self pauseRingsSchedulesAtIndex:i10];
        [v84 addPauseRingsSchedules:v83];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourceBundleIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[20];
  v5[20] = v6;

  id v8 = [(HDCodableSource *)self->_source copyWithZone:a3];
  unint64_t v9 = (void *)v5[19];
  v5[19] = v8;

  long long v216 = 0u;
  long long v215 = 0u;
  long long v214 = 0u;
  long long v213 = 0u;
  uint64_t v10 = self->_categorySamples;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v213 objects:v236 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v214;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v214 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v213 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addCategorySamples:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v213 objects:v236 count:16];
    }
    while (v12);
  }

  long long v212 = 0u;
  long long v211 = 0u;
  long long v210 = 0u;
  long long v209 = 0u;
  unint64_t v16 = self->_quantitySamples;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v209 objects:v235 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v210;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v210 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = (void *)[*(id *)(*((void *)&v209 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addQuantitySamples:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v209 objects:v235 count:16];
    }
    while (v18);
  }

  long long v208 = 0u;
  long long v207 = 0u;
  long long v206 = 0u;
  long long v205 = 0u;
  uint64_t v22 = self->_workouts;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v205 objects:v234 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v206;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v206 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v205 + 1) + 8 * v26) copyWithZone:a3];
        [v5 addWorkouts:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v205 objects:v234 count:16];
    }
    while (v24);
  }

  long long v204 = 0u;
  long long v203 = 0u;
  long long v202 = 0u;
  long long v201 = 0u;
  unint64_t v28 = self->_correlations;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v201 objects:v233 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v202;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v202 != v31) {
          objc_enumerationMutation(v28);
        }
        unint64_t v33 = (void *)[*(id *)(*((void *)&v201 + 1) + 8 * v32) copyWithZone:a3];
        [v5 addCorrelations:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v201 objects:v233 count:16];
    }
    while (v30);
  }

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  uint64_t v34 = self->_activityCaches;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v197 objects:v232 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v198;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v198 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = (void *)[*(id *)(*((void *)&v197 + 1) + 8 * v38) copyWithZone:a3];
        [v5 addActivityCaches:v39];

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v197 objects:v232 count:16];
    }
    while (v36);
  }

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  unint64_t v40 = self->_binarySamples;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v193 objects:v231 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v194;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v194 != v43) {
          objc_enumerationMutation(v40);
        }
        unint64_t v45 = (void *)[*(id *)(*((void *)&v193 + 1) + 8 * v44) copyWithZone:a3];
        [v5 addBinarySamples:v45];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v193 objects:v231 count:16];
    }
    while (v42);
  }

  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  uint64_t v46 = self->_deletedSamples;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v189 objects:v230 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v190;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v190 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = (void *)[*(id *)(*((void *)&v189 + 1) + 8 * v50) copyWithZone:a3];
        [v5 addDeletedSamples:v51];

        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v189 objects:v230 count:16];
    }
    while (v48);
  }

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  unint64_t v52 = self->_locationSeries;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v185 objects:v229 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v186;
    do
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v186 != v55) {
          objc_enumerationMutation(v52);
        }
        unint64_t v57 = (void *)[*(id *)(*((void *)&v185 + 1) + 8 * v56) copyWithZone:a3];
        [v5 addLocationSeries:v57];

        ++v56;
      }
      while (v54 != v56);
      uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v185 objects:v229 count:16];
    }
    while (v54);
  }

  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  uint64_t v58 = self->_cdaDocumentSamples;
  uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v181 objects:v228 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v182;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v182 != v61) {
          objc_enumerationMutation(v58);
        }
        uint64_t v63 = (void *)[*(id *)(*((void *)&v181 + 1) + 8 * v62) copyWithZone:a3];
        [v5 addCdaDocumentSamples:v63];

        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v181 objects:v228 count:16];
    }
    while (v60);
  }

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  unint64_t v64 = self->_fitnessFriendActivitySnapshots;
  uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v177 objects:v227 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v178;
    do
    {
      uint64_t v68 = 0;
      do
      {
        if (*(void *)v178 != v67) {
          objc_enumerationMutation(v64);
        }
        unint64_t v69 = (void *)[*(id *)(*((void *)&v177 + 1) + 8 * v68) copyWithZone:a3];
        [v5 addFitnessFriendActivitySnapshots:v69];

        ++v68;
      }
      while (v66 != v68);
      uint64_t v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v177 objects:v227 count:16];
    }
    while (v66);
  }

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  uint64_t v70 = self->_fitnessFriendAchievements;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v173 objects:v226 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v174;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v174 != v73) {
          objc_enumerationMutation(v70);
        }
        uint64_t v75 = (void *)[*(id *)(*((void *)&v173 + 1) + 8 * v74) copyWithZone:a3];
        [v5 addFitnessFriendAchievements:v75];

        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v173 objects:v226 count:16];
    }
    while (v72);
  }

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  unint64_t v76 = self->_fitnessFriendWorkouts;
  uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v169 objects:v225 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v170;
    do
    {
      uint64_t v80 = 0;
      do
      {
        if (*(void *)v170 != v79) {
          objc_enumerationMutation(v76);
        }
        unint64_t v81 = (void *)[*(id *)(*((void *)&v169 + 1) + 8 * v80) copyWithZone:a3];
        [v5 addFitnessFriendWorkouts:v81];

        ++v80;
      }
      while (v78 != v80);
      uint64_t v78 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v169 objects:v225 count:16];
    }
    while (v78);
  }

  id v82 = [(HDCodableGeneratedObjectCollection *)self->_generatedObjectCollection copyWithZone:a3];
  uint64_t v83 = (void *)v5[12];
  v5[12] = v82;

  id v84 = [(HDCodableProvenance *)self->_provenance copyWithZone:a3];
  v85 = (void *)v5[15];
  v5[15] = v84;

  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  uint64_t v86 = self->_sleepSchedules;
  uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v165 objects:v224 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v166;
    do
    {
      uint64_t v90 = 0;
      do
      {
        if (*(void *)v166 != v89) {
          objc_enumerationMutation(v86);
        }
        uint64_t v91 = (void *)[*(id *)(*((void *)&v165 + 1) + 8 * v90) copyWithZone:a3];
        [v5 addSleepSchedules:v91];

        ++v90;
      }
      while (v88 != v90);
      uint64_t v88 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v165 objects:v224 count:16];
    }
    while (v88);
  }

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  uint64_t v92 = self->_ecgSamples;
  uint64_t v93 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v161 objects:v223 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v162;
    do
    {
      uint64_t v96 = 0;
      do
      {
        if (*(void *)v162 != v95) {
          objc_enumerationMutation(v92);
        }
        uint64_t v97 = (void *)[*(id *)(*((void *)&v161 + 1) + 8 * v96) copyWithZone:a3];
        [v5 addEcgSamples:v97];

        ++v96;
      }
      while (v94 != v96);
      uint64_t v94 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v161 objects:v223 count:16];
    }
    while (v94);
  }

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  uint64_t v98 = self->_visionSamples;
  uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v157 objects:v222 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v158;
    do
    {
      uint64_t v102 = 0;
      do
      {
        if (*(void *)v158 != v101) {
          objc_enumerationMutation(v98);
        }
        uint64_t v103 = (void *)[*(id *)(*((void *)&v157 + 1) + 8 * v102) copyWithZone:a3];
        [v5 addVisionSamples:v103];

        ++v102;
      }
      while (v100 != v102);
      uint64_t v100 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v157 objects:v222 count:16];
    }
    while (v100);
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  uint64_t v104 = self->_stateOfMindLogs;
  uint64_t v105 = [(NSMutableArray *)v104 countByEnumeratingWithState:&v153 objects:v221 count:16];
  if (v105)
  {
    uint64_t v106 = v105;
    uint64_t v107 = *(void *)v154;
    do
    {
      uint64_t v108 = 0;
      do
      {
        if (*(void *)v154 != v107) {
          objc_enumerationMutation(v104);
        }
        long long v109 = (void *)[*(id *)(*((void *)&v153 + 1) + 8 * v108) copyWithZone:a3];
        [v5 addStateOfMindLogs:v109];

        ++v108;
      }
      while (v106 != v108);
      uint64_t v106 = [(NSMutableArray *)v104 countByEnumeratingWithState:&v153 objects:v221 count:16];
    }
    while (v106);
  }

  id v110 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  uint64_t v111 = (void *)v5[22];
  v5[22] = v110;

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  uint64_t v112 = self->_scoredAssessmentSamples;
  uint64_t v113 = [(NSMutableArray *)v112 countByEnumeratingWithState:&v149 objects:v220 count:16];
  if (v113)
  {
    uint64_t v114 = v113;
    uint64_t v115 = *(void *)v150;
    do
    {
      uint64_t v116 = 0;
      do
      {
        if (*(void *)v150 != v115) {
          objc_enumerationMutation(v112);
        }
        long long v117 = (void *)[*(id *)(*((void *)&v149 + 1) + 8 * v116) copyWithZone:a3];
        [v5 addScoredAssessmentSamples:v117];

        ++v116;
      }
      while (v114 != v116);
      uint64_t v114 = [(NSMutableArray *)v112 countByEnumeratingWithState:&v149 objects:v220 count:16];
    }
    while (v114);
  }

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  uint64_t v118 = self->_workoutZones;
  uint64_t v119 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v145 objects:v219 count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    uint64_t v121 = *(void *)v146;
    do
    {
      uint64_t v122 = 0;
      do
      {
        if (*(void *)v146 != v121) {
          objc_enumerationMutation(v118);
        }
        long long v123 = (void *)[*(id *)(*((void *)&v145 + 1) + 8 * v122) copyWithZone:a3];
        [v5 addWorkoutZones:v123];

        ++v122;
      }
      while (v120 != v122);
      uint64_t v120 = [(NSMutableArray *)v118 countByEnumeratingWithState:&v145 objects:v219 count:16];
    }
    while (v120);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v124 = self->_activityGoalSchedules;
  uint64_t v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v141 objects:v218 count:16];
  if (v125)
  {
    uint64_t v126 = v125;
    uint64_t v127 = *(void *)v142;
    do
    {
      uint64_t v128 = 0;
      do
      {
        if (*(void *)v142 != v127) {
          objc_enumerationMutation(v124);
        }
        uint64_t v129 = (void *)[*(id *)(*((void *)&v141 + 1) + 8 * v128) copyWithZone:a3];
        [v5 addActivityGoalSchedules:v129];

        ++v128;
      }
      while (v126 != v128);
      uint64_t v126 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v141 objects:v218 count:16];
    }
    while (v126);
  }

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  uint64_t v130 = self->_pauseRingsSchedules;
  uint64_t v131 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v137 objects:v217 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v138;
    do
    {
      uint64_t v134 = 0;
      do
      {
        if (*(void *)v138 != v133) {
          objc_enumerationMutation(v130);
        }
        uint64_t v135 = objc_msgSend(*(id *)(*((void *)&v137 + 1) + 8 * v134), "copyWithZone:", a3, (void)v137);
        [v5 addPauseRingsSchedules:v135];

        ++v134;
      }
      while (v132 != v134);
      uint64_t v132 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v137 objects:v217 count:16];
    }
    while (v132);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if ((unint64_t)sourceBundleIdentifier | v4[20])
  {
    if (!-[NSString isEqual:](sourceBundleIdentifier, "isEqual:")) {
      goto LABEL_52;
    }
  }
  source = self->_source;
  if ((unint64_t)source | v4[19] && !-[HDCodableSource isEqual:](source, "isEqual:")) {
    goto LABEL_52;
  }
  categorySamples = self->_categorySamples;
  if ((unint64_t)categorySamples | v4[4]
    && !-[NSMutableArray isEqual:](categorySamples, "isEqual:"))
  {
    goto LABEL_52;
  }
  quantitySamples = self->_quantitySamples;
  if ((unint64_t)quantitySamples | v4[16]
    && !-[NSMutableArray isEqual:](quantitySamples, "isEqual:"))
  {
    goto LABEL_52;
  }
  workouts = self->_workouts;
  if ((unint64_t)workouts | v4[25] && !-[NSMutableArray isEqual:](workouts, "isEqual:")) {
    goto LABEL_52;
  }
  correlations = self->_correlations;
  if ((unint64_t)correlations | v4[6] && !-[NSMutableArray isEqual:](correlations, "isEqual:")) {
    goto LABEL_52;
  }
  activityCaches = self->_activityCaches;
  if ((unint64_t)activityCaches | v4[1] && !-[NSMutableArray isEqual:](activityCaches, "isEqual:")) {
    goto LABEL_52;
  }
  binarySamples = self->_binarySamples;
  if ((unint64_t)binarySamples | v4[3] && !-[NSMutableArray isEqual:](binarySamples, "isEqual:")) {
    goto LABEL_52;
  }
  deletedSamples = self->_deletedSamples;
  if ((unint64_t)deletedSamples | v4[7] && !-[NSMutableArray isEqual:](deletedSamples, "isEqual:")) {
    goto LABEL_52;
  }
  locationSeries = self->_locationSeries;
  if ((unint64_t)locationSeries | v4[13]
    && !-[NSMutableArray isEqual:](locationSeries, "isEqual:"))
  {
    goto LABEL_52;
  }
  cdaDocumentSamples = self->_cdaDocumentSamples;
  if ((unint64_t)cdaDocumentSamples | v4[5]
    && !-[NSMutableArray isEqual:](cdaDocumentSamples, "isEqual:"))
  {
    goto LABEL_52;
  }
  fitnessFriendActivitySnapshots = self->_fitnessFriendActivitySnapshots;
  if ((unint64_t)fitnessFriendActivitySnapshots | v4[10]
    && !-[NSMutableArray isEqual:](fitnessFriendActivitySnapshots, "isEqual:"))
  {
    goto LABEL_52;
  }
  fitnessFriendAchievements = self->_fitnessFriendAchievements;
  if ((unint64_t)fitnessFriendAchievements | v4[9]
    && !-[NSMutableArray isEqual:](fitnessFriendAchievements, "isEqual:"))
  {
    goto LABEL_52;
  }
  fitnessFriendWorkouts = self->_fitnessFriendWorkouts;
  if ((unint64_t)fitnessFriendWorkouts | v4[11]
    && !-[NSMutableArray isEqual:](fitnessFriendWorkouts, "isEqual:"))
  {
    goto LABEL_52;
  }
  generatedObjectCollectiouint64_t n = self->_generatedObjectCollection;
  if ((unint64_t)generatedObjectCollection | v4[12]
    && !-[HDCodableGeneratedObjectCollection isEqual:](generatedObjectCollection, "isEqual:"))
  {
    goto LABEL_52;
  }
  provenance = self->_provenance;
  if ((unint64_t)provenance | v4[15] && !-[HDCodableProvenance isEqual:](provenance, "isEqual:")) {
    goto LABEL_52;
  }
  sleepSchedules = self->_sleepSchedules;
  if ((unint64_t)sleepSchedules | v4[18]
    && !-[NSMutableArray isEqual:](sleepSchedules, "isEqual:"))
  {
    goto LABEL_52;
  }
  if (((ecgSamples = self->_ecgSamples, !((unint64_t)ecgSamples | v4[8]))
     || -[NSMutableArray isEqual:](ecgSamples, "isEqual:"))
    && ((visionSamples = self->_visionSamples, !((unint64_t)visionSamples | v4[23]))
     || -[NSMutableArray isEqual:](visionSamples, "isEqual:"))
    && ((stateOfMindLogs = self->_stateOfMindLogs, !((unint64_t)stateOfMindLogs | v4[21]))
     || -[NSMutableArray isEqual:](stateOfMindLogs, "isEqual:"))
    && ((syncIdentity = self->_syncIdentity, !((unint64_t)syncIdentity | v4[22]))
     || -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
    && ((scoredAssessmentSamples = self->_scoredAssessmentSamples, !((unint64_t)scoredAssessmentSamples | v4[17]))
     || -[NSMutableArray isEqual:](scoredAssessmentSamples, "isEqual:"))
    && ((workoutZones = self->_workoutZones, !((unint64_t)workoutZones | v4[24]))
     || -[NSMutableArray isEqual:](workoutZones, "isEqual:"))
    && ((activityGoalSchedules = self->_activityGoalSchedules, !((unint64_t)activityGoalSchedules | v4[2]))
     || -[NSMutableArray isEqual:](activityGoalSchedules, "isEqual:")))
  {
    pauseRingsSchedules = self->_pauseRingsSchedules;
    if ((unint64_t)pauseRingsSchedules | v4[14]) {
      char v30 = -[NSMutableArray isEqual:](pauseRingsSchedules, "isEqual:");
    }
    else {
      char v30 = 1;
    }
  }
  else
  {
LABEL_52:
    char v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceBundleIdentifier hash];
  unint64_t v4 = [(HDCodableSource *)self->_source hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_categorySamples hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_quantitySamples hash];
  uint64_t v7 = [(NSMutableArray *)self->_workouts hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_correlations hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_activityCaches hash];
  uint64_t v10 = [(NSMutableArray *)self->_binarySamples hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_deletedSamples hash];
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_locationSeries hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSMutableArray *)self->_cdaDocumentSamples hash];
  uint64_t v14 = [(NSMutableArray *)self->_fitnessFriendActivitySnapshots hash];
  uint64_t v15 = v14 ^ [(NSMutableArray *)self->_fitnessFriendAchievements hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_fitnessFriendWorkouts hash];
  unint64_t v17 = v16 ^ [(HDCodableGeneratedObjectCollection *)self->_generatedObjectCollection hash];
  unint64_t v18 = v13 ^ v17 ^ [(HDCodableProvenance *)self->_provenance hash];
  uint64_t v19 = [(NSMutableArray *)self->_sleepSchedules hash];
  uint64_t v20 = v19 ^ [(NSMutableArray *)self->_ecgSamples hash];
  uint64_t v21 = v20 ^ [(NSMutableArray *)self->_visionSamples hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_stateOfMindLogs hash];
  unint64_t v23 = v22 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  uint64_t v24 = v18 ^ v23 ^ [(NSMutableArray *)self->_scoredAssessmentSamples hash];
  uint64_t v25 = [(NSMutableArray *)self->_workoutZones hash];
  uint64_t v26 = v25 ^ [(NSMutableArray *)self->_activityGoalSchedules hash];
  return v24 ^ v26 ^ [(NSMutableArray *)self->_pauseRingsSchedules hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 20)) {
    -[HDCodableObjectCollection setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:");
  }
  source = self->_source;
  uint64_t v6 = *((void *)v4 + 19);
  if (source)
  {
    if (v6) {
      -[HDCodableSource mergeFrom:](source, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableObjectCollection setSource:](self, "setSource:");
  }
  long long v192 = 0u;
  long long v191 = 0u;
  long long v190 = 0u;
  long long v189 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v189 objects:v212 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v190;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v190 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDCodableObjectCollection *)self addCategorySamples:*(void *)(*((void *)&v189 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v189 objects:v212 count:16];
    }
    while (v9);
  }

  long long v188 = 0u;
  long long v187 = 0u;
  long long v186 = 0u;
  long long v185 = 0u;
  id v12 = *((id *)v4 + 16);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v185 objects:v211 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v186;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v186 != v15) {
          objc_enumerationMutation(v12);
        }
        [(HDCodableObjectCollection *)self addQuantitySamples:*(void *)(*((void *)&v185 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v185 objects:v211 count:16];
    }
    while (v14);
  }

  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  id v17 = *((id *)v4 + 25);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v181 objects:v210 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v182;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v182 != v20) {
          objc_enumerationMutation(v17);
        }
        [(HDCodableObjectCollection *)self addWorkouts:*(void *)(*((void *)&v181 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v181 objects:v210 count:16];
    }
    while (v19);
  }

  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v177 = 0u;
  id v22 = *((id *)v4 + 6);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v177 objects:v209 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v178;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v178 != v25) {
          objc_enumerationMutation(v22);
        }
        [(HDCodableObjectCollection *)self addCorrelations:*(void *)(*((void *)&v177 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v177 objects:v209 count:16];
    }
    while (v24);
  }

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v27 = *((id *)v4 + 1);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v173 objects:v208 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v174;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v174 != v30) {
          objc_enumerationMutation(v27);
        }
        [(HDCodableObjectCollection *)self addActivityCaches:*(void *)(*((void *)&v173 + 1) + 8 * n)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v173 objects:v208 count:16];
    }
    while (v29);
  }

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id v32 = *((id *)v4 + 3);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v169 objects:v207 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v170;
    do
    {
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        if (*(void *)v170 != v35) {
          objc_enumerationMutation(v32);
        }
        [(HDCodableObjectCollection *)self addBinarySamples:*(void *)(*((void *)&v169 + 1) + 8 * ii)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v169 objects:v207 count:16];
    }
    while (v34);
  }

  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v37 = *((id *)v4 + 7);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v165 objects:v206 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v166;
    do
    {
      for (juint64_t j = 0; jj != v39; ++jj)
      {
        if (*(void *)v166 != v40) {
          objc_enumerationMutation(v37);
        }
        [(HDCodableObjectCollection *)self addDeletedSamples:*(void *)(*((void *)&v165 + 1) + 8 * jj)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v165 objects:v206 count:16];
    }
    while (v39);
  }

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v42 = *((id *)v4 + 13);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v161 objects:v205 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v162;
    do
    {
      for (kuint64_t k = 0; kk != v44; ++kk)
      {
        if (*(void *)v162 != v45) {
          objc_enumerationMutation(v42);
        }
        [(HDCodableObjectCollection *)self addLocationSeries:*(void *)(*((void *)&v161 + 1) + 8 * kk)];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v161 objects:v205 count:16];
    }
    while (v44);
  }

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v47 = *((id *)v4 + 5);
  uint64_t v48 = [v47 countByEnumeratingWithState:&v157 objects:v204 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v158;
    do
    {
      for (muint64_t m = 0; mm != v49; ++mm)
      {
        if (*(void *)v158 != v50) {
          objc_enumerationMutation(v47);
        }
        [(HDCodableObjectCollection *)self addCdaDocumentSamples:*(void *)(*((void *)&v157 + 1) + 8 * mm)];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v157 objects:v204 count:16];
    }
    while (v49);
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v52 = *((id *)v4 + 10);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v153 objects:v203 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v154;
    do
    {
      for (nuint64_t n = 0; nn != v54; ++nn)
      {
        if (*(void *)v154 != v55) {
          objc_enumerationMutation(v52);
        }
        [(HDCodableObjectCollection *)self addFitnessFriendActivitySnapshots:*(void *)(*((void *)&v153 + 1) + 8 * nn)];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v153 objects:v203 count:16];
    }
    while (v54);
  }

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v57 = *((id *)v4 + 9);
  uint64_t v58 = [v57 countByEnumeratingWithState:&v149 objects:v202 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v150;
    do
    {
      for (uint64_t i1 = 0; i1 != v59; ++i1)
      {
        if (*(void *)v150 != v60) {
          objc_enumerationMutation(v57);
        }
        [(HDCodableObjectCollection *)self addFitnessFriendAchievements:*(void *)(*((void *)&v149 + 1) + 8 * i1)];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v149 objects:v202 count:16];
    }
    while (v59);
  }

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v62 = *((id *)v4 + 11);
  uint64_t v63 = [v62 countByEnumeratingWithState:&v145 objects:v201 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v146;
    do
    {
      for (uint64_t i2 = 0; i2 != v64; ++i2)
      {
        if (*(void *)v146 != v65) {
          objc_enumerationMutation(v62);
        }
        [(HDCodableObjectCollection *)self addFitnessFriendWorkouts:*(void *)(*((void *)&v145 + 1) + 8 * i2)];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v145 objects:v201 count:16];
    }
    while (v64);
  }

  generatedObjectCollectiouint64_t n = self->_generatedObjectCollection;
  uint64_t v68 = *((void *)v4 + 12);
  if (generatedObjectCollection)
  {
    if (v68) {
      -[HDCodableGeneratedObjectCollection mergeFrom:](generatedObjectCollection, "mergeFrom:");
    }
  }
  else if (v68)
  {
    -[HDCodableObjectCollection setGeneratedObjectCollection:](self, "setGeneratedObjectCollection:");
  }
  provenance = self->_provenance;
  uint64_t v70 = *((void *)v4 + 15);
  if (provenance)
  {
    if (v70) {
      -[HDCodableProvenance mergeFrom:](provenance, "mergeFrom:");
    }
  }
  else if (v70)
  {
    -[HDCodableObjectCollection setProvenance:](self, "setProvenance:");
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v71 = *((id *)v4 + 18);
  uint64_t v72 = [v71 countByEnumeratingWithState:&v141 objects:v200 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v142;
    do
    {
      for (uint64_t i3 = 0; i3 != v73; ++i3)
      {
        if (*(void *)v142 != v74) {
          objc_enumerationMutation(v71);
        }
        [(HDCodableObjectCollection *)self addSleepSchedules:*(void *)(*((void *)&v141 + 1) + 8 * i3)];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v141 objects:v200 count:16];
    }
    while (v73);
  }

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v76 = *((id *)v4 + 8);
  uint64_t v77 = [v76 countByEnumeratingWithState:&v137 objects:v199 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v138;
    do
    {
      for (uint64_t i4 = 0; i4 != v78; ++i4)
      {
        if (*(void *)v138 != v79) {
          objc_enumerationMutation(v76);
        }
        [(HDCodableObjectCollection *)self addEcgSamples:*(void *)(*((void *)&v137 + 1) + 8 * i4)];
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v137 objects:v199 count:16];
    }
    while (v78);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v81 = *((id *)v4 + 23);
  uint64_t v82 = [v81 countByEnumeratingWithState:&v133 objects:v198 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)v134;
    do
    {
      for (uint64_t i5 = 0; i5 != v83; ++i5)
      {
        if (*(void *)v134 != v84) {
          objc_enumerationMutation(v81);
        }
        [(HDCodableObjectCollection *)self addVisionSamples:*(void *)(*((void *)&v133 + 1) + 8 * i5)];
      }
      uint64_t v83 = [v81 countByEnumeratingWithState:&v133 objects:v198 count:16];
    }
    while (v83);
  }

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v86 = *((id *)v4 + 21);
  uint64_t v87 = [v86 countByEnumeratingWithState:&v129 objects:v197 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v130;
    do
    {
      for (uint64_t i6 = 0; i6 != v88; ++i6)
      {
        if (*(void *)v130 != v89) {
          objc_enumerationMutation(v86);
        }
        [(HDCodableObjectCollection *)self addStateOfMindLogs:*(void *)(*((void *)&v129 + 1) + 8 * i6)];
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v129 objects:v197 count:16];
    }
    while (v88);
  }

  syncIdentity = self->_syncIdentity;
  uint64_t v92 = *((void *)v4 + 22);
  if (syncIdentity)
  {
    if (v92) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v92)
  {
    -[HDCodableObjectCollection setSyncIdentity:](self, "setSyncIdentity:");
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v93 = *((id *)v4 + 17);
  uint64_t v94 = [v93 countByEnumeratingWithState:&v125 objects:v196 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v126;
    do
    {
      for (uint64_t i7 = 0; i7 != v95; ++i7)
      {
        if (*(void *)v126 != v96) {
          objc_enumerationMutation(v93);
        }
        [(HDCodableObjectCollection *)self addScoredAssessmentSamples:*(void *)(*((void *)&v125 + 1) + 8 * i7)];
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v125 objects:v196 count:16];
    }
    while (v95);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v98 = *((id *)v4 + 24);
  uint64_t v99 = [v98 countByEnumeratingWithState:&v121 objects:v195 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v122;
    do
    {
      for (uint64_t i8 = 0; i8 != v100; ++i8)
      {
        if (*(void *)v122 != v101) {
          objc_enumerationMutation(v98);
        }
        [(HDCodableObjectCollection *)self addWorkoutZones:*(void *)(*((void *)&v121 + 1) + 8 * i8)];
      }
      uint64_t v100 = [v98 countByEnumeratingWithState:&v121 objects:v195 count:16];
    }
    while (v100);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v103 = *((id *)v4 + 2);
  uint64_t v104 = [v103 countByEnumeratingWithState:&v117 objects:v194 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    uint64_t v106 = *(void *)v118;
    do
    {
      for (uint64_t i9 = 0; i9 != v105; ++i9)
      {
        if (*(void *)v118 != v106) {
          objc_enumerationMutation(v103);
        }
        [(HDCodableObjectCollection *)self addActivityGoalSchedules:*(void *)(*((void *)&v117 + 1) + 8 * i9)];
      }
      uint64_t v105 = [v103 countByEnumeratingWithState:&v117 objects:v194 count:16];
    }
    while (v105);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v108 = *((id *)v4 + 14);
  uint64_t v109 = [v108 countByEnumeratingWithState:&v113 objects:v193 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v114;
    do
    {
      for (uint64_t i10 = 0; i10 != v110; ++i10)
      {
        if (*(void *)v114 != v111) {
          objc_enumerationMutation(v108);
        }
        -[HDCodableObjectCollection addPauseRingsSchedules:](self, "addPauseRingsSchedules:", *(void *)(*((void *)&v113 + 1) + 8 * i10), (void)v113);
      }
      uint64_t v110 = [v108 countByEnumeratingWithState:&v113 objects:v193 count:16];
    }
    while (v110);
  }
}

- (void)setCategorySamples:(id)a3
{
}

- (void)setQuantitySamples:(id)a3
{
}

- (void)setWorkouts:(id)a3
{
}

- (void)setCorrelations:(id)a3
{
}

- (void)setActivityCaches:(id)a3
{
}

- (void)setBinarySamples:(id)a3
{
}

- (NSMutableArray)deletedSamples
{
  return self->_deletedSamples;
}

- (void)setDeletedSamples:(id)a3
{
}

- (void)setLocationSeries:(id)a3
{
}

- (void)setCdaDocumentSamples:(id)a3
{
}

- (void)setFitnessFriendActivitySnapshots:(id)a3
{
}

- (void)setFitnessFriendAchievements:(id)a3
{
}

- (void)setFitnessFriendWorkouts:(id)a3
{
}

- (HDCodableGeneratedObjectCollection)generatedObjectCollection
{
  return self->_generatedObjectCollection;
}

- (void)setGeneratedObjectCollection:(id)a3
{
}

- (NSMutableArray)sleepSchedules
{
  return self->_sleepSchedules;
}

- (void)setSleepSchedules:(id)a3
{
}

- (NSMutableArray)ecgSamples
{
  return self->_ecgSamples;
}

- (void)setEcgSamples:(id)a3
{
}

- (NSMutableArray)visionSamples
{
  return self->_visionSamples;
}

- (void)setVisionSamples:(id)a3
{
}

- (NSMutableArray)stateOfMindLogs
{
  return self->_stateOfMindLogs;
}

- (void)setStateOfMindLogs:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (NSMutableArray)scoredAssessmentSamples
{
  return self->_scoredAssessmentSamples;
}

- (void)setScoredAssessmentSamples:(id)a3
{
}

- (NSMutableArray)workoutZones
{
  return self->_workoutZones;
}

- (void)setWorkoutZones:(id)a3
{
}

- (NSMutableArray)activityGoalSchedules
{
  return self->_activityGoalSchedules;
}

- (void)setActivityGoalSchedules:(id)a3
{
}

- (NSMutableArray)pauseRingsSchedules
{
  return self->_pauseRingsSchedules;
}

- (void)setPauseRingsSchedules:(id)a3
{
}

- (void)addMedicationDoseEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDCodableObjectCollection *)self generatedObjectCollection];

  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(HDCodableGeneratedObjectCollection);
    [(HDCodableObjectCollection *)self setGeneratedObjectCollection:v6];
  }
  id v7 = [(HDCodableObjectCollection *)self generatedObjectCollection];
  [v7 addMedicationDoseEvent:v4];
}

- (BOOL)unitTest_isEquivalentToObjectCollection:(id)a3
{
  v33[19] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    goto LABEL_28;
  }
  source = self->_source;
  id v7 = (HDCodableSource *)*((void *)v5 + 19);
  if (source != v7 && (!v7 || !-[HDCodableSource isEqual:](source, "isEqual:"))) {
    goto LABEL_28;
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  uint64_t v9 = (NSString *)*((void *)v5 + 20);
  if (sourceBundleIdentifier != v9 && (!v9 || !-[NSString isEqual:](sourceBundleIdentifier, "isEqual:"))) {
    goto LABEL_28;
  }
  provenance = self->_provenance;
  uint64_t v11 = (HDCodableProvenance *)*((void *)v5 + 15);
  if (provenance != v11 && (!v11 || !-[HDCodableProvenance isEqual:](provenance, "isEqual:"))) {
    goto LABEL_28;
  }
  generatedObjectCollectiouint64_t n = self->_generatedObjectCollection;
  uint64_t v13 = generatedObjectCollection;
  if (!generatedObjectCollection)
  {
    uint64_t v14 = [v5 generatedObjectCollection];
    if (!v14) {
      goto LABEL_16;
    }
    NSUInteger v3 = (void *)v14;
    uint64_t v13 = self->_generatedObjectCollection;
  }
  uint64_t v15 = [v5 generatedObjectCollection];
  BOOL v16 = [(HDCodableGeneratedObjectCollection *)v13 unitTest_isEquivalentToGeneratedObjectCollection:v15];

  if (generatedObjectCollection)
  {
    if (v16) {
      goto LABEL_16;
    }
LABEL_28:
    BOOL v18 = 0;
    goto LABEL_29;
  }

  if (!v16) {
    goto LABEL_28;
  }
LABEL_16:
  v33[0] = self->_categorySamples;
  v33[1] = self->_quantitySamples;
  v33[2] = self->_workouts;
  v33[3] = self->_correlations;
  v33[4] = self->_activityCaches;
  v33[5] = self->_activityGoalSchedules;
  v33[6] = self->_pauseRingsSchedules;
  v33[7] = self->_binarySamples;
  v33[8] = self->_deletedSamples;
  v33[9] = self->_locationSeries;
  v33[10] = self->_cdaDocumentSamples;
  v33[11] = self->_fitnessFriendAchievements;
  v33[12] = self->_fitnessFriendActivitySnapshots;
  v33[13] = self->_fitnessFriendWorkouts;
  v33[14] = self->_ecgSamples;
  v33[15] = self->_sleepSchedules;
  v33[16] = self->_visionSamples;
  v33[17] = self->_stateOfMindLogs;
  v33[18] = self->_scoredAssessmentSamples;
  v32[0] = *((id *)v5 + 4);
  v32[1] = *((id *)v5 + 16);
  v32[2] = *((id *)v5 + 25);
  v32[3] = *((id *)v5 + 6);
  v32[4] = *((id *)v5 + 1);
  v32[5] = *((id *)v5 + 2);
  v32[6] = *((id *)v5 + 14);
  v32[7] = *((id *)v5 + 3);
  v32[8] = *((id *)v5 + 7);
  v32[9] = *((id *)v5 + 13);
  v32[10] = *((id *)v5 + 5);
  v32[11] = *((id *)v5 + 9);
  v32[12] = *((id *)v5 + 10);
  v32[13] = *((id *)v5 + 11);
  v32[14] = *((id *)v5 + 8);
  v32[15] = *((id *)v5 + 18);
  v32[16] = *((id *)v5 + 23);
  v32[17] = *((id *)v5 + 21);
  unint64_t v17 = 0;
  BOOL v18 = 0;
  v32[18] = *((id *)v5 + 17);
  id v19 = (id)MEMORY[0x1E4F1CBF0];
  while (1)
  {
    id v20 = (id)v33[v17];
    id v21 = (id)v32[v17];
    if (v20 != v21)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v23 = v20 ? v20 : v19;
      uint64_t v24 = (void *)[v22 initWithArray:v23];
      id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v26 = v21 ? v21 : v19;
      id v27 = (void *)[v25 initWithArray:v26];
      int v28 = [v24 isEqualToSet:v27];

      if (!v28) {
        break;
      }
    }

    BOOL v18 = v17++ > 0x11;
    if (v17 == 19)
    {
      BOOL v18 = 1;
      goto LABEL_31;
    }
  }

LABEL_31:
  for (uint64_t i = 18; i != -1; --i)

  for (uint64_t j = 18; j != -1; --j)
LABEL_29:

  return v18;
}

@end