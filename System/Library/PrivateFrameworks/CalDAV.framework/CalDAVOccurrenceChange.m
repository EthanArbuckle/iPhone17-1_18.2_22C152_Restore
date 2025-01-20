@interface CalDAVOccurrenceChange
+ (id)changeWithItem:(id)a3;
+ (id)changeWithOccurrenceID:(id)a3;
- (BOOL)attachmentsChanged;
- (BOOL)attendeesChanged;
- (BOOL)dateTimeChanged;
- (BOOL)descriptionChanged;
- (BOOL)didParameterChange:(id)a3 onProperty:(id)a4;
- (BOOL)didPropertyChange:(id)a3;
- (BOOL)endTimeChanged;
- (BOOL)isMaster;
- (BOOL)locationChanged;
- (BOOL)participationChanged;
- (BOOL)privateCommentChanged;
- (BOOL)proposedStartDateChanged;
- (BOOL)recurrenceChanged;
- (BOOL)startTimeChanged;
- (BOOL)statusChanged;
- (BOOL)summaryChanged;
- (BOOL)timeZoneChanged;
- (BOOL)urlChanged;
- (CalDAVOccurrenceChange)init;
- (CalDAVOccurrenceChange)initWithOccurrenceID:(id)a3;
- (ICSDate)recurrenceID;
- (NSMutableDictionary)changes;
- (void)addChangedParameter:(id)a3 ofProperty:(id)a4;
- (void)addChangedProperty:(id)a3;
- (void)setChanges:(id)a3;
- (void)setIsMaster:(BOOL)a3;
- (void)setRecurrenceID:(id)a3;
@end

@implementation CalDAVOccurrenceChange

- (CalDAVOccurrenceChange)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalDAVOccurrenceChange;
  v2 = [(CalDAVOccurrenceChange *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CalDAVOccurrenceChange *)v2 setIsMaster:0];
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(CalDAVOccurrenceChange *)v3 setChanges:v4];
  }
  return v3;
}

- (CalDAVOccurrenceChange)initWithOccurrenceID:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVOccurrenceChange *)self init];
  if (v5)
  {
    if ([v4 length])
    {
      id v6 = objc_alloc(MEMORY[0x263F886C8]);
      v7 = [MEMORY[0x263F886E0] dateFromICSString:v4];
      v8 = (void *)[v6 initWithValue:v7];
      [(CalDAVOccurrenceChange *)v5 setRecurrenceID:v8];
    }
    else
    {
      [(CalDAVOccurrenceChange *)v5 setIsMaster:1];
    }
  }

  return v5;
}

+ (id)changeWithOccurrenceID:(id)a3
{
  id v3 = a3;
  id v4 = [[CalDAVOccurrenceChange alloc] initWithOccurrenceID:v3];

  return v4;
}

+ (id)changeWithItem:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isMaster])
  {
    id v4 = 0;
  }
  else
  {
    v5 = [v3 recurrenceID];
    id v6 = [v5 payloadAsString];
    id v4 = [v6 trimWhiteSpace];
  }
  if (([v3 isMaster] & 1) != 0 || objc_msgSend(v4, "length"))
  {
    v26 = v4;
    if ([v3 isMaster]) {
      v7 = 0;
    }
    else {
      v7 = v4;
    }
    v8 = +[CalDAVOccurrenceChange changeWithOccurrenceID:v7];
    v9 = scheduleChangesLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CalDAVOccurrenceChange changeWithItem:](v8, v9);
    }

    id v27 = v3;
    v10 = [v3 changes];
    v11 = [v10 changedProperties];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v17 = [v16 nameAttribute];
          [v8 addChangedProperty:v17];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v18 = [v16 changedParameters];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = [*(id *)(*((void *)&v29 + 1) + 8 * j) nameAttribute];
                [v8 addChangedParameter:v23 ofProperty:v17];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v20);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }
    v24 = obj;

    id v4 = v26;
    id v3 = v27;
  }
  else
  {
    v24 = scheduleChangesLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[CalDAVOccurrenceChange changeWithItem:](v24);
    }
    v8 = 0;
  }

  return v8;
}

- (void)addChangedProperty:(id)a3
{
  id v4 = a3;
  if ([v4 length] && !-[CalDAVOccurrenceChange didPropertyChange:](self, "didPropertyChange:", v4))
  {
    v5 = scheduleChangesLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CalDAVOccurrenceChange addChangedProperty:]((uint64_t)v4, v5);
    }

    id v6 = [MEMORY[0x263EFF9D0] null];
    v7 = [(CalDAVOccurrenceChange *)self changes];
    [v7 setObject:v6 forKeyedSubscript:v4];
  }
}

- (void)addChangedParameter:(id)a3 ofProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v8 = [(CalDAVOccurrenceChange *)self changes];
    v9 = [v8 objectForKeyedSubscript:v7];

    if (!v9
      || ([MEMORY[0x263EFF9D0] null],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9 == v10))
    {
      v11 = [MEMORY[0x263EFF980] arrayWithObject:v6];
      uint64_t v12 = [(CalDAVOccurrenceChange *)self changes];
      [v12 setObject:v11 forKeyedSubscript:v7];
    }
    else
    {
      [v9 addObject:v6];
    }
    uint64_t v13 = scheduleChangesLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CalDAVOccurrenceChange addChangedParameter:ofProperty:]((uint64_t)v6, (uint64_t)v7, v13);
    }
  }
}

- (BOOL)didPropertyChange:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(CalDAVOccurrenceChange *)self changes];
  id v6 = [v5 objectForKeyedSubscript:v4];

  BOOL v7 = v6 != 0;
  return v7;
}

- (BOOL)didParameterChange:(id)a3 onProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v8 = [(CalDAVOccurrenceChange *)self changes];
    v9 = [v8 objectForKeyedSubscript:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v10 = [v9 containsObject:v6];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)dateTimeChanged
{
  if ([(CalDAVOccurrenceChange *)self startTimeChanged]) {
    return 1;
  }
  return [(CalDAVOccurrenceChange *)self endTimeChanged];
}

- (BOOL)startTimeChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88760]];
}

- (BOOL)endTimeChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88758]];
}

- (BOOL)timeZoneChanged
{
  uint64_t v3 = *MEMORY[0x263F88798];
  if ([(CalDAVOccurrenceChange *)self didParameterChange:*MEMORY[0x263F88798] onProperty:*MEMORY[0x263F88760]])
  {
    return 1;
  }
  uint64_t v5 = *MEMORY[0x263F88758];
  return [(CalDAVOccurrenceChange *)self didParameterChange:v3 onProperty:v5];
}

- (BOOL)locationChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88768]];
}

- (BOOL)urlChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F887A0]];
}

- (BOOL)summaryChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88790]];
}

- (BOOL)attendeesChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88748]];
}

- (BOOL)descriptionChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88750]];
}

- (BOOL)statusChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88788]];
}

- (BOOL)attachmentsChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88740]];
}

- (BOOL)recurrenceChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88780]];
}

- (BOOL)participationChanged
{
  return [(CalDAVOccurrenceChange *)self didParameterChange:*MEMORY[0x263F88770] onProperty:*MEMORY[0x263F88748]];
}

- (BOOL)privateCommentChanged
{
  return [(CalDAVOccurrenceChange *)self didPropertyChange:*MEMORY[0x263F88730]];
}

- (BOOL)proposedStartDateChanged
{
  return [(CalDAVOccurrenceChange *)self didParameterChange:*MEMORY[0x263F88738] onProperty:*MEMORY[0x263F88748]];
}

- (BOOL)isMaster
{
  return self->_isMaster;
}

- (void)setIsMaster:(BOOL)a3
{
  self->_isMaster = a3;
}

- (ICSDate)recurrenceID
{
  return self->_recurrenceID;
}

- (void)setRecurrenceID:(id)a3
{
}

- (NSMutableDictionary)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_recurrenceID, 0);
}

+ (void)changeWithItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = a1;
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = [a1 isMaster];
  if (v4)
  {
    uint64_t v5 = @"MASTER";
  }
  else
  {
    uint64_t v3 = [v3 recurrenceID];
    uint64_t v5 = [v3 value];
  }
  int v6 = 138412290;
  id v7 = v5;
  _os_log_debug_impl(&dword_213CEC000, a2, OS_LOG_TYPE_DEBUG, ":: ------- %@", (uint8_t *)&v6, 0xCu);
  if (!v4)
  {
  }
}

+ (void)changeWithItem:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213CEC000, log, OS_LOG_TYPE_ERROR, "invalid recurrence node - no master or recurrenceID specified", v1, 2u);
}

- (void)addChangedProperty:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_213CEC000, a2, OS_LOG_TYPE_DEBUG, ":: changed property \"%@\"", (uint8_t *)&v2, 0xCu);
}

- (void)addChangedParameter:(os_log_t)log ofProperty:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_213CEC000, log, OS_LOG_TYPE_DEBUG, ":: :: changed parameter \"%@\" of \"%@\"", (uint8_t *)&v3, 0x16u);
}

@end