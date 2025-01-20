@interface EKUILocationEditItemModel
- (BOOL)displaysPlaceholder;
- (BOOL)hasMapLocation;
- (BOOL)hasVirtualConference;
- (BOOL)rowModelRepresentsConferenceRoom:(id)a3 onEvent:(id)a4;
- (BOOL)shouldDisplayRowModelWithConferenceCell:(id)a3 event:(id)a4;
- (EKUILocationEditItemModel)init;
- (EKUILocationRowModel)mapLocationRowModel;
- (EKUILocationRowModel)virtualConferenceRowModel;
- (NSMutableArray)rowModels;
- (NSMutableDictionary)conferenceRoomInfos;
- (NSString)placeholderCellText;
- (id)_conferenceRoomNameForLocation:(id)a3;
- (id)_participantForConferenceRoomName:(id)a3 event:(id)a4;
- (id)_rowModelForCell:(id)a3;
- (int64_t)indexOfPredictedLocation;
- (void)_deleteVirtualConferenceOnEvent:(id)a3 forRowModel:(id)a4;
- (void)_removeConferenceAttendeeOnEvent:(id)a3 forRowModel:(id)a4;
- (void)_updateConferenceDataOnEvent:(id)a3 forNewLocation:(id)a4;
- (void)_updateLocationsOnEvent:(id)a3;
- (void)rebuild:(id)a3;
- (void)refreshConferenceRoomCell:(id)a3 event:(id)a4;
- (void)removeConferenceRoomAttendeeIfNeeded:(id)a3 event:(id)a4;
- (void)removeRowModel:(id)a3 event:(id)a4;
- (void)removeRowModelAtIndex:(unint64_t)a3 event:(id)a4;
- (void)reorderRowModels;
- (void)reset;
- (void)setConferenceRoomInfos:(id)a3;
- (void)setRowModels:(id)a3;
- (void)updateAvailabilityInformation:(id)a3;
- (void)updateRowModel:(id)a3 withConferenceRoom:(id)a4 editItem:(id)a5;
- (void)updateRowModel:(id)a3 withMapLocation:(id)a4 event:(id)a5;
- (void)updateRowModel:(id)a3 withVirtualConference:(id)a4 event:(id)a5;
@end

@implementation EKUILocationEditItemModel

- (EKUILocationEditItemModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)EKUILocationEditItemModel;
  v2 = [(EKUILocationEditItemModel *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    conferenceRoomInfos = v2->_conferenceRoomInfos;
    v2->_conferenceRoomInfos = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    rowModels = v2->_rowModels;
    v2->_rowModels = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)reset
{
  [(NSMutableDictionary *)self->_conferenceRoomInfos enumerateKeysAndObjectsUsingBlock:&__block_literal_global_11];
  [(NSMutableArray *)self->_rowModels removeAllObjects];
  conferenceRoomInfos = self->_conferenceRoomInfos;

  [(NSMutableDictionary *)conferenceRoomInfos removeAllObjects];
}

void __34__EKUILocationEditItemModel_reset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 availabilityRequest];
  [v3 cancel];
}

- (void)rebuild:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EKUILocationEditItemModel *)self reset];
  v51 = v4;
  [v4 event];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v52 = long long v67 = 0u;
  uint64_t v5 = [v52 attendees];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if ([v10 participantType] == 2)
        {
          v11 = objc_alloc_init(EKUIConferenceRoomInfo);
          conferenceRoomInfos = self->_conferenceRoomInfos;
          v13 = [v10 name];
          [(NSMutableDictionary *)conferenceRoomInfos setObject:v11 forKey:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [MEMORY[0x1E4F1CA48] array];
  v16 = [v52 structuredLocation];
  v17 = [v52 preferredLocationWithoutPrediction];
  v18 = [v17 title];
  v19 = [v18 componentsSeparatedByString:@"; "];

  v20 = (void *)v14;
  long long v63 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  obuint64_t j = v19;
  uint64_t v21 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  v53 = (void *)v14;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v61 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v60 + 1) + 8 * j);
        v26 = [(NSMutableDictionary *)self->_conferenceRoomInfos objectForKey:v25];
        if (v26)
        {
          v27 = [[EKUILocationRowModel alloc] initWithConferenceRoom:v25];
          [v15 addObject:v27];

          [v20 addObject:v26];
        }
        else if (v16)
        {
          if ([v16 isPrediction])
          {
            rowModels = self->_rowModels;
            v29 = [[EKUILocationRowModel alloc] initWithSuggestedLocation:v25];
            [(NSMutableArray *)rowModels addObject:v29];
          }
          else
          {
            v30 = (void *)[v16 copy];
            [v30 setTitle:v25];
            v31 = self->_rowModels;
            v32 = [[EKUILocationRowModel alloc] initWithStructuredLocation:v30];
            [(NSMutableArray *)v31 addObject:v32];
          }
          v20 = v53;
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v22);
  }

  v33 = [(NSMutableDictionary *)self->_conferenceRoomInfos allValues];
  uint64_t v34 = [v20 count];
  if (v34 != [v33 count])
  {
    v35 = self->_conferenceRoomInfos;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __37__EKUILocationEditItemModel_rebuild___block_invoke;
    v57[3] = &unk_1E60883F0;
    id v58 = v20;
    id v59 = v15;
    [(NSMutableDictionary *)v35 enumerateKeysAndObjectsUsingBlock:v57];
  }
  v36 = [v52 preferredLocation];
  if ([v36 isStructured] && !obj)
  {
    int v37 = [v36 isPrediction];
    v38 = self->_rowModels;
    v39 = [EKUILocationRowModel alloc];
    if (v37)
    {
      v40 = [v36 title];
      uint64_t v41 = [(EKUILocationRowModel *)v39 initWithSuggestedLocation:v40];
    }
    else
    {
      v40 = (void *)[v36 copy];
      uint64_t v41 = [(EKUILocationRowModel *)v39 initWithStructuredLocation:v40];
    }
    v42 = (void *)v41;
    [(NSMutableArray *)v38 addObject:v41];

    v20 = v53;
  }
  v43 = [v52 virtualConference];
  v44 = v43;
  if (v43)
  {
    v45 = (void *)MEMORY[0x1E4F28F60];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __37__EKUILocationEditItemModel_rebuild___block_invoke_2;
    v55[3] = &unk_1E6088418;
    id v46 = v43;
    id v56 = v46;
    v47 = [v45 predicateWithBlock:v55];
    [v15 filterUsingPredicate:v47];

    v48 = [EKUILocationRowModel alloc];
    id v49 = v46;
    v20 = v53;
    v50 = [(EKUILocationRowModel *)v48 initWithVirtualConference:v49];
    [(NSMutableArray *)self->_rowModels addObject:v50];
  }
  [(NSMutableArray *)self->_rowModels addObjectsFromArray:v15];
  [(EKUILocationEditItemModel *)self reorderRowModels];
  [(EKUILocationEditItemModel *)self updateAvailabilityInformation:v51];
}

void __37__EKUILocationEditItemModel_rebuild___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) containsObject:a3] & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [[EKUILocationRowModel alloc] initWithConferenceRoom:v7];
    [v5 addObject:v6];
  }
}

uint64_t __37__EKUILocationEditItemModel_rebuild___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 serializationBlockTitle];
  uint64_t v5 = [v3 location];

  uint64_t v6 = [v5 title];
  uint64_t v7 = [v4 isEqualToString:v6] ^ 1;

  return v7;
}

- (BOOL)hasVirtualConference
{
  v2 = [(EKUILocationEditItemModel *)self virtualConferenceRowModel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (EKUILocationRowModel)virtualConferenceRowModel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_rowModels;
  id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "locationType", (void)v8) == 2)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (EKUILocationRowModel *)v3;
}

- (BOOL)hasMapLocation
{
  v2 = [(EKUILocationEditItemModel *)self mapLocationRowModel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (EKUILocationRowModel)mapLocationRowModel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_rowModels;
  id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "locationType", (void)v8) == 1)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (EKUILocationRowModel *)v3;
}

- (BOOL)displaysPlaceholder
{
  BOOL v3 = [(EKUILocationEditItemModel *)self hasVirtualConference];
  uint64_t v4 = [(NSMutableArray *)self->_rowModels count];
  BOOL result = v4 == 0;
  if (v4)
  {
    if (!v3) {
      return ![(EKUILocationEditItemModel *)self hasMapLocation];
    }
  }
  return result;
}

- (NSString)placeholderCellText
{
  if ([(EKUILocationEditItemModel *)self displaysPlaceholder])
  {
    v2 = EventKitUIBundle();
    BOOL v3 = [v2 localizedStringForKey:@"Location or Video Call" value:&stru_1F0CC2140 table:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (void)_updateConferenceDataOnEvent:(id)a3 forNewLocation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(EKUILocationEditItemModel *)self _conferenceRoomNameForLocation:a4];
  long long v8 = [(NSMutableDictionary *)self->_conferenceRoomInfos objectForKey:v7];

  if (!v8)
  {
    [v6 setClientLocation:0];
    long long v9 = [v6 travelStartLocation];

    if (v9)
    {
      long long v10 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Clearing start location and travel time on event: [%@]", (uint8_t *)&v11, 0xCu);
      }
      [v6 setTravelStartLocation:0];
      [v6 setTravelTime:0.0];
    }
  }
}

- (void)_removeConferenceAttendeeOnEvent:(id)a3 forRowModel:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 location];

  if (v7)
  {
    long long v8 = [v6 location];

    [(EKUILocationEditItemModel *)self _conferenceRoomNameForLocation:v8];
  }
  else
  {
    long long v8 = [v6 conference];

    [v8 serializationBlockTitle];
  long long v9 = };

  long long v10 = [(EKUILocationEditItemModel *)self _participantForConferenceRoomName:v9 event:v11];
  if (v10)
  {
    [v11 removeAttendee:v10];
    [(NSMutableDictionary *)self->_conferenceRoomInfos removeObjectForKey:v9];
  }
}

- (void)_deleteVirtualConferenceOnEvent:(id)a3 forRowModel:(id)a4
{
  id v5 = a3;
  if ([a4 locationType] == 2) {
    [v5 setVirtualConference:0];
  }
}

- (void)_updateLocationsOnEvent:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_rowModels, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = self->_rowModels;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v5)
  {
    uint64_t v7 = 0;
    v27 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  v27 = 0;
  uint64_t v8 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v4);
      }
      long long v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      unint64_t v11 = [v10 locationType];
      if (v11 > 1)
      {
        if (v11 != 2) {
          continue;
        }
        if ([(EKUILocationEditItemModel *)self rowModelRepresentsConferenceRoom:v10 onEvent:v26])
        {
          uint64_t v22 = [v10 conference];
          uint64_t v23 = [v22 serializationBlockTitle];
          [v28 addObject:v23];
        }
        [v10 conference];
        uint64_t v7 = v20 = v7;
        goto LABEL_15;
      }
      id v12 = [v10 location];
      uint64_t v13 = [v12 title];

      if (v13)
      {
        uint64_t v14 = [v10 location];
        v15 = [v14 title];
        [v28 addObject:v15];
      }
      conferenceRoomInfos = self->_conferenceRoomInfos;
      v17 = [v10 location];
      v18 = [v17 title];
      v19 = [(NSMutableDictionary *)conferenceRoomInfos objectForKey:v18];

      if (!v19)
      {
        v20 = [v10 location];
        uint64_t v21 = [v20 duplicate];

        v27 = (void *)v21;
LABEL_15:

        continue;
      }
    }
    uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v6);
LABEL_20:

  v24 = [MEMORY[0x1E4F25538] _locationStringForLocations:v28];
  uint64_t v25 = v27;
  if (!v27)
  {
    if ([v28 count])
    {
      uint64_t v25 = [MEMORY[0x1E4F25630] locationWithTitle:v24];
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  [v25 setTitle:v24];
  [v26 setStructuredLocation:v25];
  [v26 setVirtualConference:v7];
  if (v7) {
    +[EKUIDiscoverabilityUtilities sendDiscoverabilitySignalForConference:v7];
  }
}

- (void)removeRowModel:(id)a3 event:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [(NSMutableArray *)self->_rowModels indexOfObject:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [(EKUILocationEditItemModel *)self removeRowModelAtIndex:v6 event:v7];
  }
}

- (void)removeRowModelAtIndex:(unint64_t)a3 event:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [(NSMutableArray *)self->_rowModels objectAtIndex:a3];
  [(EKUILocationEditItemModel *)self _removeConferenceAttendeeOnEvent:v7 forRowModel:v6];
  if ([v6 locationType] == 1) {
    [(EKUILocationEditItemModel *)self _updateConferenceDataOnEvent:v7 forNewLocation:0];
  }
  [(EKUILocationEditItemModel *)self _deleteVirtualConferenceOnEvent:v7 forRowModel:v6];
  [(NSMutableArray *)self->_rowModels removeObjectAtIndex:a3];
  [(EKUILocationEditItemModel *)self _updateLocationsOnEvent:v7];
}

- (int64_t)indexOfPredictedLocation
{
  if (![(NSMutableArray *)self->_rowModels count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = [(NSMutableArray *)self->_rowModels objectAtIndex:v3];
    uint64_t v5 = [v4 locationType];

    if (v5 == 3) {
      break;
    }
    if (++v3 >= (unint64_t)[(NSMutableArray *)self->_rowModels count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (id)_rowModelForCell:(id)a3
{
  unint64_t v4 = [a3 tag];
  if (v4 >= [(NSMutableArray *)self->_rowModels count])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_rowModels objectAtIndex:v4];
  }

  return v5;
}

- (void)updateRowModel:(id)a3 withMapLocation:(id)a4 event:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Updating old row model [%@] with new map location: [%@]", (uint8_t *)&v14, 0x16u);
  }
  if (v8 || !v9)
  {
    if (v8 && v9)
    {
      [(EKUILocationEditItemModel *)self removeConferenceRoomAttendeeIfNeeded:v8 event:v10];
      [v8 setLocationType:1];
      [v8 setLocation:v9];
      [v8 setConference:0];
      [v8 setCell:0];
    }
  }
  else
  {
    id v12 = [[EKUILocationRowModel alloc] initWithStructuredLocation:v9];
    [(NSMutableArray *)self->_rowModels addObject:v12];
  }
  int64_t v13 = [(EKUILocationEditItemModel *)self indexOfPredictedLocation];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
    [(EKUILocationEditItemModel *)self removeRowModelAtIndex:v13 event:v10];
  }
  [(EKUILocationEditItemModel *)self _updateConferenceDataOnEvent:v10 forNewLocation:v9];
  [(EKUILocationEditItemModel *)self _updateLocationsOnEvent:v10];
  CalAnalyticsSendEvent();
}

- (void)updateRowModel:(id)a3 withVirtualConference:(id)a4 event:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Updating old row model [%@] with new virtual conference: [%@]", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    [(EKUILocationEditItemModel *)self removeConferenceRoomAttendeeIfNeeded:v8 event:v10];
    [v8 setLocationType:2];
    [v8 setConference:v9];
    [v8 setLocation:0];
    [v8 setCell:0];
  }
  else
  {
    id v12 = [EKUILocationRowModel alloc];
    if (v9) {
      uint64_t v13 = [(EKUILocationRowModel *)v12 initWithVirtualConference:v9];
    }
    else {
      uint64_t v13 = [(EKUILocationRowModel *)v12 initWithPendingConference:0];
    }
    id v8 = (id)v13;
    [(NSMutableArray *)self->_rowModels addObject:v13];
  }
  [(EKUILocationEditItemModel *)self _updateLocationsOnEvent:v10];
}

- (void)updateRowModel:(id)a3 withConferenceRoom:(id)a4 editItem:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Updating old row model [%@] with new conference room: [%@]", buf, 0x16u);
  }
  CalAnalyticsSendEvent();
  id v12 = [v9 location];
  uint64_t v13 = [v12 preferredAddress];

  int v14 = [v10 event];
  if (v13)
  {
    id v26 = v10;
    id v15 = [v9 location];
    __int16 v16 = [v15 displayName];

    uint64_t v25 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    id v17 = objc_msgSend(MEMORY[0x1E4F254A0], "attendeeWithName:url:", v16);
    [v17 setParticipantType:2];
    [v14 addAttendee:v17];
    uint64_t v18 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v17;
      _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_DEBUG, "Added conference room as attendee: [%@]", buf, 0xCu);
    }
    v19 = objc_alloc_init(EKUIConferenceRoomInfo);
    [(NSMutableDictionary *)self->_conferenceRoomInfos setObject:v19 forKey:v16];
    if (v8)
    {
      [(EKUILocationEditItemModel *)self removeConferenceRoomAttendeeIfNeeded:v8 event:v14];
      [v8 setLocationType:0];
      v20 = [MEMORY[0x1E4F25630] locationWithTitle:v16];
      [v8 setLocation:v20];

      [v8 setConference:0];
      [v8 setCell:0];
      uint64_t v21 = [v8 location];
    }
    else
    {
      uint64_t v23 = [[EKUILocationRowModel alloc] initWithConferenceRoom:v16];
      [(NSMutableArray *)self->_rowModels addObject:v23];
      uint64_t v21 = [(EKUILocationRowModel *)v23 location];
    }
    [(EKUILocationEditItemModel *)self _updateConferenceDataOnEvent:v14 forNewLocation:v21];
    [(EKUILocationEditItemModel *)self _updateLocationsOnEvent:v14];
    v24 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v16;
      _os_log_impl(&dword_1B3F4C000, v24, OS_LOG_TYPE_DEBUG, "Set structured location based on the new conference room.  Location: [%@]", buf, 0xCu);
    }

    id v10 = v26;
  }
  else
  {
    uint64_t v22 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_ERROR, "Could not find conference room's preferred address.  Will not update location.  Conference room: [%@]", buf, 0xCu);
    }
  }
  [(EKUILocationEditItemModel *)self updateAvailabilityInformation:v10];
}

- (void)reorderRowModels
{
}

uint64_t __45__EKUILocationEditItemModel_reorderRowModels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 locationType];
  unint64_t v7 = [v5 locationType];
  if (v6 | v7)
  {
    if (v6 >= v7) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = -1;
    }
    if (v6 <= v7) {
      uint64_t v12 = v13;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    id v8 = [v4 location];
    id v9 = [v8 title];
    id v10 = [v5 location];
    unint64_t v11 = [v10 title];
    uint64_t v12 = [v9 caseInsensitiveCompare:v11];
  }
  return v12;
}

- (void)updateAvailabilityInformation:(id)a3
{
  id v4 = a3;
  conferenceRoomInfos = self->_conferenceRoomInfos;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke;
  v7[3] = &unk_1E60883F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)conferenceRoomInfos enumerateKeysAndObjectsUsingBlock:v7];
}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v6 setAvailabilitySpans:0];
  unint64_t v7 = [v6 availabilityRequest];
  [v7 cancel];

  [v6 setAvailabilityRequest:0];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:v8];
      if (![v9 locationType])
      {
        id v10 = *(void **)(a1 + 32);
        unint64_t v11 = [v9 location];
        uint64_t v12 = [v10 _conferenceRoomNameForLocation:v11];
        int v13 = [v12 isEqualToString:v5];

        if (v13) {
          break;
        }
      }

      if (++v8 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) count]) {
        goto LABEL_6;
      }
    }
    v40 = [v9 cell];

    if (!v40) {
      id v41 = (id)[*(id *)(a1 + 40) cellForSubitemAtIndex:v8];
    }
    v42 = [v9 cell];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v54 = v42;
    }
    else {
      id v54 = 0;
    }
  }
  else
  {
LABEL_6:
    id v54 = 0;
  }
  int v14 = [*(id *)(a1 + 40) event];
  id v15 = [*(id *)(a1 + 32) _participantForConferenceRoomName:v5 event:v14];
  __int16 v16 = v15;
  if (!v15)
  {
    uint64_t v36 = kEKUILogEventEditorHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    int v37 = "There is no conference room on this event.  Will not issue an availability request.";
    v38 = v36;
    uint32_t v39 = 2;
LABEL_18:
    _os_log_impl(&dword_1B3F4C000, v38, OS_LOG_TYPE_DEBUG, v37, buf, v39);
    goto LABEL_30;
  }
  char v17 = [v15 needsResponse];
  uint64_t v18 = kEKUILogEventEditorHandle;
  BOOL v19 = os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG);
  if ((v17 & 1) == 0)
  {
    if (!v19) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138412290;
    long long v66 = v16;
    int v37 = "The conference room has already responded.  Will not issue an availability request.  Room: [%@]";
    v38 = v18;
    uint32_t v39 = 12;
    goto LABEL_18;
  }
  if (v19)
  {
    v20 = NSNumber;
    uint64_t v21 = v18;
    uint64_t v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v16, "participantStatus"));
    *(_DWORD *)buf = 138412546;
    long long v66 = v22;
    __int16 v67 = 2112;
    v68 = v16;
    _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_DEBUG, "This event's room's participation status is [%@].  It is a candidate for an availability request.  Room: [%@]", buf, 0x16u);
  }
  uint64_t v23 = [v16 URL];
  v53 = [v23 absoluteString];

  v24 = [*(id *)(a1 + 40) event];
  uint64_t v25 = [v24 calendar];
  id v26 = [v25 source];
  v27 = [v26 constraints];
  char v28 = [v27 supportsAvailabilityRequests];

  if (v28)
  {
    if (v53)
    {
      __int16 v29 = [v14 calendar];
      v52 = [v29 source];

      v51 = [v14 startDate];
      v50 = [v14 endDateUnadjustedForLegacyClients];
      id v30 = objc_alloc(MEMORY[0x1E4F25608]);
      long long v64 = v53;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_110;
      v61[3] = &unk_1E6088460;
      id v62 = v53;
      id v32 = v6;
      id v63 = v32;
      v33 = (void *)[v30 initWithSource:v52 startDate:v51 endDate:v50 ignoredEvent:v14 addresses:v31 resultsBlock:v61];
      [v32 setAvailabilityRequest:v33];

      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_initWeak(&location, v32);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_3;
      v55[3] = &unk_1E6088488;
      objc_copyWeak(&v58, (id *)buf);
      objc_copyWeak(&v59, &location);
      id v56 = v54;
      id v57 = v14;
      uint64_t v34 = [v32 availabilityRequest];
      [v34 setCompletionBlock:v55];

      v35 = [v32 availabilityRequest];
      [v35 start];

      objc_destroyWeak(&v59);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v47 = (void *)kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        v48 = v47;
        id v49 = [v16 URL];
        *(_DWORD *)buf = 138412290;
        long long v66 = v49;
        _os_log_impl(&dword_1B3F4C000, v48, OS_LOG_TYPE_DEBUG, "The conference room's address is nil.  Will not issue an availability request.  URL: [%@]", buf, 0xCu);
      }
    }
  }
  else
  {
    v43 = (void *)kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      v44 = v43;
      v45 = [v14 calendar];
      id v46 = [v45 source];
      *(_DWORD *)buf = 138412290;
      long long v66 = v46;
      _os_log_impl(&dword_1B3F4C000, v44, OS_LOG_TYPE_DEBUG, "This event's source does not support availability requests.  Will not send out an availability request.  Source: [%@]", buf, 0xCu);
    }
  }

LABEL_30:
  [*(id *)(a1 + 32) refreshConferenceRoomCell:v54 event:v14];
}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_110(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 objectForKey:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_2;
  v5[3] = &unk_1E6087D68;
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAvailabilitySpans:*(void *)(a1 + 40)];
}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_3(id *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_4;
  v2[3] = &unk_1E6088488;
  objc_copyWeak(&v5, a1 + 6);
  objc_copyWeak(&v6, a1 + 7);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    id v5 = (void *)kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      id v6 = v5;
      id v7 = [v4 availabilityRequest];
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Availability request completed: [%@]", (uint8_t *)&v11, 0xCu);
    }
    [v4 setAvailabilityRequest:0];
    uint64_t v8 = (void *)MEMORY[0x1E4F254B8];
    id v9 = [v4 availabilitySpans];
    uint64_t v10 = [v8 summarizedAvailabilityTypeForSpans:v9];

    [v4 setAvailabilityType:v10];
    [WeakRetained refreshConferenceRoomCell:*(void *)(a1 + 32) event:*(void *)(a1 + 40)];
  }
}

- (id)_conferenceRoomNameForLocation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F57740];
  id v4 = a3;
  id v5 = [v4 title];
  id v6 = [v4 address];

  id v7 = [v3 fullDisplayStringWithTitle:v5 address:v6];

  return v7;
}

- (id)_participantForConferenceRoomName:(id)a3 event:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 attendees];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__EKUILocationEditItemModel__participantForConferenceRoomName_event___block_invoke;
  v11[3] = &unk_1E60884B0;
  id v8 = v5;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __69__EKUILocationEditItemModel__participantForConferenceRoomName_event___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 participantType] == 2)
  {
    id v7 = [v9 name];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)refreshConferenceRoomCell:(id)a3 event:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [(EKUILocationEditItemModel *)self _rowModelForCell:v20];
  int v8 = v7;
  if (v7 && ![v7 locationType])
  {
    id v19 = [v8 location];
    id v9 = [(EKUILocationEditItemModel *)self _conferenceRoomNameForLocation:v19];
    uint64_t v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\n"];
    int v11 = [v9 stringByTrimmingCharactersInSet:v10];

    id v12 = [(EKUILocationEditItemModel *)self conferenceRoomInfos];
    uint64_t v13 = [v12 objectForKey:v9];

    uint64_t v14 = [v13 availabilityRequest];
    BOOL v15 = v14 != 0;

    uint64_t v16 = [v6 calendar];
    char v17 = [v16 source];
    uint64_t v18 = [v17 constraints];
    objc_msgSend(v20, "updateWithName:sourceSupportsAvailability:availabilityRequestInProgress:availabilityType:", v11, objc_msgSend(v18, "supportsAvailabilityRequests"), v15, objc_msgSend(v13, "availabilityType"));
  }
}

- (BOOL)shouldDisplayRowModelWithConferenceCell:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 locationType])
  {
    char v8 = 0;
  }
  else
  {
    id v9 = [v6 location];
    uint64_t v10 = [(EKUILocationEditItemModel *)self _conferenceRoomNameForLocation:v9];

    int v11 = [(NSMutableDictionary *)self->_conferenceRoomInfos objectForKey:v10];
    id v12 = [(EKUILocationEditItemModel *)self _participantForConferenceRoomName:v10 event:v7];
    uint64_t v13 = v12;
    char v8 = 0;
    if (v11 && v12)
    {
      if (EKUIAttendeeUtils_AttendeeHasResponded(v12))
      {
        char v8 = 0;
      }
      else
      {
        uint64_t v14 = [v7 calendar];
        BOOL v15 = [v14 source];
        uint64_t v16 = [v15 constraints];
        char v8 = [v16 supportsAvailabilityRequests];
      }
    }
  }
  return v8;
}

- (void)removeConferenceRoomAttendeeIfNeeded:(id)a3 event:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(EKUILocationEditItemModel *)self rowModelRepresentsConferenceRoom:v7 onEvent:v6])
  {
    [(EKUILocationEditItemModel *)self _removeConferenceAttendeeOnEvent:v6 forRowModel:v7];
  }
}

- (BOOL)rowModelRepresentsConferenceRoom:(id)a3 onEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 locationType])
  {
    char v8 = [v6 location];

    if (v8)
    {
      id v9 = [v6 location];
      [(EKUILocationEditItemModel *)self _conferenceRoomNameForLocation:v9];
    }
    else
    {
      id v9 = [v6 conference];
      [v9 serializationBlockTitle];
    int v11 = };

    id v12 = [(EKUILocationEditItemModel *)self _participantForConferenceRoomName:v11 event:v7];
    BOOL v10 = v12 != 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (NSMutableArray)rowModels
{
  return self->_rowModels;
}

- (void)setRowModels:(id)a3
{
}

- (NSMutableDictionary)conferenceRoomInfos
{
  return self->_conferenceRoomInfos;
}

- (void)setConferenceRoomInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceRoomInfos, 0);

  objc_storeStrong((id *)&self->_rowModels, 0);
}

@end