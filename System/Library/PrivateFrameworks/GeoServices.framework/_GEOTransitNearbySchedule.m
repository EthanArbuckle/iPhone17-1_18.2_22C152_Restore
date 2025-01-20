@interface _GEOTransitNearbySchedule
+ (id)nearbyScheduleCategoriesFromSchedule:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidents:(id)a6;
- (NSArray)categories;
- (_GEOTransitNearbySchedule)initWithNearbySchedule:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidents:(id)a6 stopInfo:(id)a7;
@end

@implementation _GEOTransitNearbySchedule

- (_GEOTransitNearbySchedule)initWithNearbySchedule:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidents:(id)a6 stopInfo:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_GEOTransitNearbySchedule;
  v15 = [(_GEOTransitNearbySchedule *)&v19 init];
  if (v15)
  {
    uint64_t v16 = +[_GEOTransitNearbySchedule nearbyScheduleCategoriesFromSchedule:v11 departureSequenceContainers:v12 scheduledDepartureSequences:v13 incidents:v14];
    categories = v15->_categories;
    v15->_categories = (NSArray *)v16;
  }
  return v15;
}

+ (id)nearbyScheduleCategoriesFromSchedule:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidents:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v31 = (id *)a3;
  id v36 = a4;
  id v35 = a5;
  id v30 = a6;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__74;
  v50 = __Block_byref_object_dispose__74;
  id v51 = [MEMORY[0x1E4F1CA60] dictionary];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __132___GEOTransitNearbySchedule_nearbyScheduleCategoriesFromSchedule_departureSequenceContainers_scheduledDepartureSequences_incidents___block_invoke;
  v45[3] = &unk_1E53EA268;
  v45[4] = &v46;
  [v30 enumerateObjectsUsingBlock:v45];
  v34 = (void *)[(id)v47[5] copy];
  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v10 = -[GEOPDTransitNearbySchedule groups](v31);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [[_GEOTransitNearbyScheduleGroup alloc] initWithTransitScheduleGroup:*(void *)(*((void *)&v41 + 1) + 8 * i) departureSequenceContainers:v36 scheduledDepartureSequences:v35 incidentsMap:v34];
        [v9 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v11);
  }

  v33 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v15 = -[GEOPDTransitNearbySchedule categorys](v31);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v38;
    obuint64_t j = v15;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        v20 = [MEMORY[0x1E4F1CA48] array];
        unint64_t v21 = 0;
        if (v19)
        {
LABEL_14:
          -[GEOPDTransitScheduleCategory _readGroupIndexs](v19);
          unint64_t v22 = *(void *)(v19 + 32);
          goto LABEL_15;
        }
        while (1)
        {
          unint64_t v22 = 0;
LABEL_15:
          if (v21 >= v22) {
            break;
          }
          unsigned int v23 = -[GEOPDTransitScheduleCategory groupIndexAtIndex:](v19, v21);
          if ([v9 count] > (unint64_t)v23)
          {
            v24 = objc_msgSend(v9, "objectAtIndex:");
            [v20 addObject:v24];
          }
          ++v21;
          if (v19) {
            goto LABEL_14;
          }
        }
        v25 = [_GEOTransitNearbyScheduleCategory alloc];
        v26 = -[GEOPDTransitScheduleCategory artwork]((id *)v19);
        v27 = [(_GEOTransitNearbyScheduleCategory *)v25 initWithTransitScheduleCategory:v19 nearbyScheduleGroups:v20 categoryArtwork:v26];
        [v33 addObject:v27];
      }
      v15 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v52 count:16];
    }
    while (v16);
  }

  v28 = (void *)[v33 copy];
  _Block_object_dispose(&v46, 8);

  return v28;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
}

@end