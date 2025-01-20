@interface EKEventDetailAttendeesCellModel
+ (unint64_t)computeStatusHash:(id)a3;
- (BOOL)_eventDifferent:(id)a3;
- (BOOL)_groupAndSort;
- (BOOL)_needsGroupAndSort;
- (BOOL)sortAttendeesWithCompletion:(id)a3;
- (EKEventDetailAttendeesCellModel)init;
- (NSArray)attendeesNotIncludingOrganizerOrLocationsOrResources;
- (void)_sortAccepted:(id)a3 maybe:(id)a4 declined:(id)a5 noReply:(id)a6 ungrouped:(id)a7 event:(id)a8 generation:(int)a9 synchronous:(BOOL)a10;
- (void)callCallbacksWithGeneration:(int)a3;
- (void)setEvent:(id)a3;
- (void)sortAccepted:(id)a3 maybe:(id)a4 declined:(id)a5 noReply:(id)a6 ungrouped:(id)a7 synchronous:(BOOL)a8;
@end

@implementation EKEventDetailAttendeesCellModel

- (EKEventDetailAttendeesCellModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailAttendeesCellModel;
  result = [(EKEventDetailAttendeesCellModel *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  if ([(EKEventDetailAttendeesCellModel *)self _eventDifferent:v5])
  {
    objc_storeStrong((id *)&self->_event, a3);
    ++self->_generation;
    pendingCallbackBlocks = self->_pendingCallbackBlocks;
    if (pendingCallbackBlocks)
    {
      v7 = pendingCallbackBlocks;
      v8 = self->_pendingCallbackBlocks;
      self->_pendingCallbackBlocks = 0;
    }
    self->_groupAndSortQueued = 0;
    accepted = self->_accepted;
    self->_accepted = 0;

    maybe = self->_maybe;
    self->_maybe = 0;

    declined = self->_declined;
    self->_declined = 0;

    noReply = self->_noReply;
    self->_noReply = 0;

    ungrouped = self->_ungrouped;
    self->_ungrouped = 0;

    cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
    self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = 0;

    os_unfair_lock_unlock(&self->_lock);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = pendingCallbackBlocks;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v19) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * v19));
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)_eventDifferent:(id)a3
{
  if (self->_event == a3)
  {
    id v5 = [a3 attendeesNotIncludingOrganizerOrLocationsOrResources];
    uint64_t v6 = [v5 count];
    if (v6 == [(NSArray *)self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources count])
    {
      if (!v6)
      {
LABEL_8:
        BOOL v3 = [(id)objc_opt_class() computeStatusHash:v5] != self->_statusHash;
LABEL_10:

        return v3;
      }
      uint64_t v7 = 0;
      while (1)
      {
        v8 = [v5 objectAtIndexedSubscript:v7];
        v9 = [(NSArray *)self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources objectAtIndexedSubscript:v7];

        if (v8 != v9) {
          break;
        }
        if (v6 == ++v7) {
          goto LABEL_8;
        }
      }
    }
    BOOL v3 = 1;
    goto LABEL_10;
  }
  return 1;
}

- (BOOL)sortAttendeesWithCompletion:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(EKEventDetailAttendeesCellModel *)self _needsGroupAndSort]
    && (self->_groupAndSortQueued || ![(EKEventDetailAttendeesCellModel *)self _groupAndSort]))
  {
    pendingCallbackBlocks = self->_pendingCallbackBlocks;
    if (!pendingCallbackBlocks)
    {
      uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v18 = self->_pendingCallbackBlocks;
      self->_pendingCallbackBlocks = v17;

      pendingCallbackBlocks = self->_pendingCallbackBlocks;
    }
    uint64_t v19 = _Block_copy(v4);
    [(NSMutableArray *)pendingCallbackBlocks addObject:v19];

    os_unfair_lock_unlock(p_lock);
    BOOL v15 = 0;
  }
  else
  {
    accepted = self->_accepted;
    maybe = self->_maybe;
    declined = self->_declined;
    noReply = self->_noReply;
    v10 = self->_ungrouped;
    v11 = noReply;
    v12 = declined;
    v13 = maybe;
    v14 = accepted;
    os_unfair_lock_unlock(p_lock);
    (*((void (**)(id, NSArray *, NSArray *, NSArray *, NSArray *, NSArray *))v4 + 2))(v4, v14, v13, v12, v11, v10);

    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)_needsGroupAndSort
{
  return !self->_accepted && self->_ungrouped == 0;
}

- (BOOL)_groupAndSort
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKEventDetailAttendeesCellModel *)self attendeesNotIncludingOrganizerOrLocationsOrResources];
  unint64_t v4 = [v3 count];
  id v5 = [(EKEvent *)self->_event calendar];
  uint64_t v6 = [v5 source];
  uint64_t v7 = [v6 constraints];
  if ([v7 statusesAreAccurate])
  {
    int v8 = CanSeeAttendeeStatuses((uint64_t)self->_event);

    if (v8)
    {
      v30 = self;
      unint64_t v31 = v4;
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v12 = v3;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            unint64_t v18 = objc_msgSend(v17, "participantType", v30);
            if (v18 <= 4 && ((1 << v18) & 0x13) != 0)
            {
              [v17 participantStatus];
              long long v20 = v9;
              switch((unint64_t)v9)
              {
                case 0uLL:
                case 1uLL:
                  long long v20 = v11;
                  goto LABEL_16;
                case 2uLL:
                  goto LABEL_16;
                case 3uLL:
                  long long v20 = v10;
                  goto LABEL_16;
                case 4uLL:
                  long long v20 = v32;
LABEL_16:
                  [v20 addObject:v17];
                  break;
                default:
                  continue;
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v14);
      }
      unint64_t v4 = v31;

      [(EKEventDetailAttendeesCellModel *)v30 sortAccepted:v9 maybe:v32 declined:v10 noReply:v11 ungrouped:0 synchronous:v31 < 0x19];
      goto LABEL_35;
    }
  }
  else
  {
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v3;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        uint64_t v27 = [v26 participantType];
        if (v27 == 4 || v27 == 1) {
          [v9 addObject:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }

  [(EKEventDetailAttendeesCellModel *)self sortAccepted:0 maybe:0 declined:0 noReply:0 ungrouped:v9 synchronous:v4 < 0x19];
LABEL_35:

  return v4 < 0x19;
}

- (void)sortAccepted:(id)a3 maybe:(id)a4 declined:(id)a5 noReply:(id)a6 ungrouped:(id)a7 synchronous:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v8)
  {
    BYTE4(v28) = 1;
    LODWORD(v28) = self->_generation;
    -[EKEventDetailAttendeesCellModel _sortAccepted:maybe:declined:noReply:ungrouped:event:generation:synchronous:](self, "_sortAccepted:maybe:declined:noReply:ungrouped:event:generation:synchronous:", v14, v15, v16, v17, v18, self->_event, v28);
  }
  else
  {
    self->_groupAndSortQueued = 1;
    if (!self->_sortAttendeesQueue)
    {
      uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      long long v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);

      id v21 = (OS_dispatch_queue *)dispatch_queue_create("sortAttendeesQueue", v20);
      sortAttendeesQueue = self->_sortAttendeesQueue;
      self->_sortAttendeesQueue = v21;
    }
    uint64_t v23 = self->_event;
    int generation = self->_generation;
    uint64_t v25 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v39 = generation;
      _os_log_impl(&dword_1B3F4C000, v25, OS_LOG_TYPE_INFO, "Kicking off asynchronous sort of attendees with generation %i", buf, 8u);
    }
    v26 = self->_sortAttendeesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke;
    block[3] = &unk_1E60888B8;
    block[4] = self;
    id v30 = v14;
    id v31 = v15;
    id v32 = v16;
    id v33 = v17;
    id v34 = v18;
    long long v35 = v23;
    int v36 = generation;
    char v37 = 0;
    uint64_t v27 = v23;
    dispatch_async(v26, block);
  }
}

void __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke(uint64_t a1)
{
  BYTE4(v2) = *(unsigned char *)(a1 + 92);
  LODWORD(v2) = *(_DWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "_sortAccepted:maybe:declined:noReply:ungrouped:event:generation:synchronous:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke_2;
  block[3] = &unk_1E6088890;
  block[4] = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 88);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callCallbacksWithGeneration:*(unsigned int *)(a1 + 40)];
}

- (void)_sortAccepted:(id)a3 maybe:(id)a4 declined:(id)a5 noReply:(id)a6 ungrouped:(id)a7 event:(id)a8 generation:(int)a9 synchronous:(BOOL)a10
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v22 = v21;
  if (v16)
  {
    obuint64_t j = [v21 sortedEKParticipantsDisplayStringsIgnoringNonHumans:v16];
    if (v17) {
      goto LABEL_3;
    }
LABEL_6:
    id v36 = 0;
    if (v18) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  obuint64_t j = 0;
  if (!v17) {
    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v22, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v17, obj);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
LABEL_4:
    objc_msgSend(v22, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v18, obj);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_7:
  id v35 = 0;
LABEL_8:
  id v34 = v16;
  if (v19)
  {
    uint64_t v23 = [v22 sortedEKParticipantsDisplayStringsIgnoringNonHumans:v19];
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v33 = v20;
  uint64_t v24 = v19;
  if (v20)
  {
    id v20 = [v22 sortedEKParticipantsDisplayStringsIgnoringNonHumans:v20];
  }
  id v25 = v18;
  if (!a10) {
    os_unfair_lock_lock(&self->_lock);
  }
  int generation = self->_generation;
  uint64_t v27 = kEKUILogHandle;
  BOOL v28 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO);
  if (generation == a9)
  {
    v29 = v25;
    if (v28)
    {
      *(_DWORD *)buf = 67109120;
      int v38 = a9;
      _os_log_impl(&dword_1B3F4C000, v27, OS_LOG_TYPE_INFO, "Completed sort of attendees with generation %i", buf, 8u);
    }
    id v30 = obj;
    objc_storeStrong((id *)&self->_accepted, obj);
    objc_storeStrong((id *)&self->_maybe, v36);
    objc_storeStrong((id *)&self->_declined, v35);
    objc_storeStrong((id *)&self->_noReply, v23);
    objc_storeStrong((id *)&self->_ungrouped, v20);
  }
  else
  {
    v29 = v25;
    id v30 = obj;
    if (v28)
    {
      int v31 = self->_generation;
      *(_DWORD *)buf = 67109376;
      int v38 = a9;
      __int16 v39 = 1024;
      int v40 = v31;
      _os_log_impl(&dword_1B3F4C000, v27, OS_LOG_TYPE_INFO, "Completed sort of attendees with generation %i, but the current generation is %i", buf, 0xEu);
    }
  }
  if (!a10) {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)callCallbacksWithGeneration:(int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_generation == a3)
  {
    uint64_t v6 = self->_accepted;
    uint64_t v7 = self->_maybe;
    BOOL v8 = self->_declined;
    id v9 = self->_noReply;
    id v10 = self->_ungrouped;
    id v11 = self->_pendingCallbackBlocks;
    pendingCallbackBlocks = self->_pendingCallbackBlocks;
    self->_pendingCallbackBlocks = 0;

    self->_groupAndSortQueued = 0;
    os_unfair_lock_unlock(p_lock);
    uint64_t v13 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      *(_DWORD *)buf = 134218240;
      *(void *)BOOL v28 = [(NSMutableArray *)v11 count];
      *(_WORD *)&v28[8] = 1024;
      int v29 = a3;
      _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_INFO, "Calling %lu attendee sort callbacks for generation %i", buf, 0x12u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v11;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v19) + 16))(*(void *)(*((void *)&v22 + 1) + 8 * v19));
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
  else
  {
    id v20 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      int generation = self->_generation;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)BOOL v28 = a3;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = generation;
      _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_INFO, "Not calling attendee sort callbacks because work completed for generation %i, but the current generation is %i", buf, 0xEu);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (NSArray)attendeesNotIncludingOrganizerOrLocationsOrResources
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
  if (!cachedAttendeesNotIncludingOrganizerOrLocationsOrResources)
  {
    int v4 = [(EKEvent *)self->_event attendeesNotIncludingOrganizerOrLocationsOrResources];
    id v5 = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
    self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = v4;

    self->_statusHash = [(id)objc_opt_class() computeStatusHash:self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources];
    cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
  }

  return cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
}

+ (unint64_t)computeStatusHash:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1E4F57BA8];
        id v12 = [v10 comment];
        uint64_t v13 = [v11 stringWithAutoCommentRemoved:v12];
        BOOL v14 = [v13 length] != 0;

        uint64_t v15 = (([v10 participantStatus] | (16 * v14)) << (4 * v5)) | v6;
        BOOL v16 = v5 == 15;
        if (v5 == 15) {
          uint64_t v5 = 0;
        }
        else {
          ++v5;
        }
        if (v16) {
          uint64_t v6 = 0;
        }
        else {
          uint64_t v6 = v15;
        }
        if (v16) {
          unint64_t v7 = v15 + 13 * v7;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
    if (v5) {
      unint64_t v7 = v6 + 11 * v7;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_ungrouped, 0);
  objc_storeStrong((id *)&self->_noReply, 0);
  objc_storeStrong((id *)&self->_declined, 0);
  objc_storeStrong((id *)&self->_maybe, 0);
  objc_storeStrong((id *)&self->_accepted, 0);
  objc_storeStrong((id *)&self->_sortAttendeesQueue, 0);
  objc_storeStrong((id *)&self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end