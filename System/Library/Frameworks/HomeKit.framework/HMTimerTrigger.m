@interface HMTimerTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMTimerTrigger)init;
- (HMTimerTrigger)initWithCoder:(id)a3;
- (HMTimerTrigger)initWithDictionary:(id)a3 home:(id)a4;
- (HMTimerTrigger)initWithName:(NSString *)name fireDate:(NSDate *)fireDate recurrence:(NSDateComponents *)recurrence;
- (HMTimerTrigger)initWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrence:(id)a6;
- (HMTimerTrigger)initWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrences:(id)a6;
- (HMTimerTrigger)initWithName:(id)a3 significantEvent:(id)a4 significantEventOffset:(id)a5 recurrences:(id)a6;
- (NSArray)recurrences;
- (NSCalendar)recurrenceCalendar;
- (NSDate)fireDate;
- (NSDateComponents)recurrence;
- (NSDateComponents)significantEventOffset;
- (NSString)significantEvent;
- (NSTimeZone)timeZone;
- (id)_serializeForAdd;
- (void)_handleTriggerFired:(id)a3;
- (void)_updateFireDate:(id)a3 completionHandler:(id)a4;
- (void)_updateRecurrence:(id)a3 completionHandler:(id)a4;
- (void)_updateRecurrences:(id)a3 completionHandler:(id)a4;
- (void)_updateSignificantEvent:(id)a3 completionHandler:(id)a4;
- (void)_updateSignificantEventOffset:(id)a3 completionHandler:(id)a4;
- (void)_updateTimeZone:(id)a3 completionHandler:(id)a4;
- (void)_updateTimerTriggerPropertiesFromResponse:(id)a3;
- (void)_updateTimerTriggerWithResponse:(id)a3 payloadToSend:(id)a4;
- (void)setFireDate:(id)a3;
- (void)setRecurrence:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)setSignificantEvent:(id)a3;
- (void)setSignificantEventOffset:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)updateFireDate:(NSDate *)fireDate completionHandler:(void *)completion;
- (void)updateRecurrence:(NSDateComponents *)recurrence completionHandler:(void *)completion;
- (void)updateRecurrences:(id)a3 completionHandler:(id)a4;
- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4;
- (void)updateSignificantEventOffset:(id)a3 completionHandler:(id)a4;
- (void)updateTimeZone:(NSTimeZone *)timeZone completionHandler:(void *)completion;
@end

@implementation HMTimerTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrenceCalendar, 0);
  objc_storeStrong((id *)&self->_recurrence, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);

  objc_storeStrong((id *)&self->_recurrences, 0);
}

- (NSCalendar)recurrenceCalendar
{
  return self->_recurrenceCalendar;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)HMTimerTrigger;
  LODWORD(v5) = [(HMTrigger *)&v48 mergeFromNewObject:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    v7 = [(HMTimerTrigger *)self fireDate];
    v8 = [v6 fireDate];
    char v9 = [v7 isEqualToDate:v8];

    if ((v9 & 1) == 0)
    {
      v5 = [v6 fireDate];
      [(HMTimerTrigger *)self setFireDate:v5];

      LODWORD(v5) = 1;
    }
    v10 = [(HMTimerTrigger *)self timeZone];

    v11 = [v6 timeZone];
    v12 = v11;
    if (v10)
    {

      if (!v12)
      {
        [(HMTimerTrigger *)self setTimeZone:0];
        goto LABEL_11;
      }
      v13 = [(HMTimerTrigger *)self timeZone];
      v14 = [v6 timeZone];
      char v15 = [v13 isEqualToTimeZone:v14];

      if (v15)
      {
LABEL_12:
        v17 = [(HMTimerTrigger *)self recurrence];

        v18 = [v6 recurrence];
        v19 = v18;
        if (v17)
        {

          if (!v19)
          {
            [(HMTimerTrigger *)self setRecurrence:0];
            goto LABEL_19;
          }
          v20 = [(HMTimerTrigger *)self recurrence];
          v21 = [v6 recurrence];
          char v22 = [v20 isEqual:v21];

          if (v22)
          {
LABEL_20:
            v24 = [(HMTimerTrigger *)self recurrences];

            v25 = [v6 recurrences];
            v26 = v25;
            if (v24)
            {

              if (!v26)
              {
                [(HMTimerTrigger *)self setRecurrences:0];
                goto LABEL_27;
              }
              v27 = [(HMTimerTrigger *)self recurrences];
              v28 = [v6 recurrences];
              char v29 = [v27 isEqual:v28];

              if (v29)
              {
LABEL_28:
                v31 = [(HMTimerTrigger *)self significantEvent];

                v32 = [v6 significantEvent];
                v33 = v32;
                if (v31)
                {

                  if (!v33)
                  {
                    [(HMTimerTrigger *)self setSignificantEvent:0];
                    goto LABEL_35;
                  }
                  v34 = [(HMTimerTrigger *)self significantEvent];
                  v35 = [v6 significantEvent];
                  char v36 = [v34 isEqual:v35];

                  if (v36)
                  {
LABEL_36:
                    v38 = [(HMTimerTrigger *)self significantEventOffset];

                    v39 = [v6 significantEventOffset];
                    v40 = v39;
                    if (v38)
                    {

                      if (!v40)
                      {
                        [(HMTimerTrigger *)self setSignificantEventOffset:0];
                        goto LABEL_44;
                      }
                      v41 = [(HMTimerTrigger *)self significantEventOffset];
                      v42 = [v6 significantEventOffset];
                      char v43 = [v41 isEqual:v42];

                      if (v43) {
                        goto LABEL_39;
                      }
                    }
                    else
                    {

                      if (!v40)
                      {
LABEL_39:
                        if (!v5) {
                          goto LABEL_45;
                        }
                        goto LABEL_44;
                      }
                    }
                    v44 = [v6 significantEventOffset];
                    [(HMTimerTrigger *)self setSignificantEventOffset:v44];

LABEL_44:
                    v5 = [(HMTrigger *)self context];
                    v45 = [v5 queue];
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __37__HMTimerTrigger_mergeFromNewObject___block_invoke;
                    block[3] = &unk_1E59452E8;
                    block[4] = self;
                    dispatch_async(v45, block);

                    LOBYTE(v5) = 1;
LABEL_45:

                    goto LABEL_46;
                  }
                }
                else
                {

                  if (!v33) {
                    goto LABEL_36;
                  }
                }
                v37 = [v6 significantEvent];
                [(HMTimerTrigger *)self setSignificantEvent:v37];

LABEL_35:
                LODWORD(v5) = 1;
                goto LABEL_36;
              }
            }
            else
            {

              if (!v26) {
                goto LABEL_28;
              }
            }
            v30 = [v6 recurrences];
            [(HMTimerTrigger *)self setRecurrences:v30];

LABEL_27:
            LODWORD(v5) = 1;
            goto LABEL_28;
          }
        }
        else
        {

          if (!v19) {
            goto LABEL_20;
          }
        }
        v23 = [v6 recurrence];
        [(HMTimerTrigger *)self setRecurrence:v23];

LABEL_19:
        LODWORD(v5) = 1;
        goto LABEL_20;
      }
    }
    else
    {

      if (!v12) {
        goto LABEL_12;
      }
    }
    v16 = [v6 timeZone];
    [(HMTimerTrigger *)self setTimeZone:v16];

LABEL_11:
    LODWORD(v5) = 1;
    goto LABEL_12;
  }
LABEL_46:

  return (char)v5;
}

void __37__HMTimerTrigger_mergeFromNewObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  [v2 _notifyDelegateOfTriggerUpdated:*(void *)(a1 + 32)];
}

- (HMTimerTrigger)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMTimerTrigger;
  v5 = [(HMTrigger *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerInitialFireDate"];
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerTimeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.timerTriggerSignificantEvent"];
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.timerTriggerSignificantEventOffset"];
    significantEventOffset = v5->_significantEventOffset;
    v5->_significantEventOffset = (NSDateComponents *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerRepeatInterval"];
    recurrence = v5->_recurrence;
    v5->_recurrence = (NSDateComponents *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"HM.timerTriggerRecurrences"];
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v19;
  }
  return v5;
}

- (void)_handleTriggerFired:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMTimerTrigger;
  [(HMTrigger *)&v3 _handleTriggerFired:a3];
}

- (void)_updateTimerTriggerPropertiesFromResponse:(id)a3
{
  id v23 = a3;
  id v4 = objc_msgSend(v23, "hmf_dateForKey:", @"kTimerTriggerInitialFireDateKey");
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  [(HMTimerTrigger *)self setFireDate:v5];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAF0];
  v7 = [v23 objectForKeyedSubscript:@"kTimerTriggerTimeZoneDataKey"];
  uint64_t v8 = objc_msgSend(v6, "hmf_unarchiveFromData:error:", v7, 0);

  if (v8)
  {
    char v9 = self;
    uint64_t v10 = v8;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", @"kTimerTriggerResetTimeZoneDataKey")) {
      goto LABEL_9;
    }
    char v9 = self;
    uint64_t v10 = 0;
  }
  [(HMTimerTrigger *)v9 setTimeZone:v10];
LABEL_9:
  v11 = [v23 dateComponentsForKey:@"kTimerTriggerRecurrenceDataKey"];
  if (v11)
  {
    uint64_t v12 = self;
    v13 = v11;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", @"kTimerTriggerResetRecurrenceDataKey")) {
      goto LABEL_14;
    }
    uint64_t v12 = self;
    v13 = 0;
  }
  [(HMTimerTrigger *)v12 setRecurrence:v13];
LABEL_14:
  uint64_t v14 = [v23 arrayOfDateComponentsFromDataForKey:@"kTimerTriggerRecurrencesKey"];
  if (v14)
  {
    char v15 = self;
    v16 = v14;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", @"kTimerTriggerResetRecurrencesKey")) {
      goto LABEL_19;
    }
    char v15 = self;
    v16 = 0;
  }
  [(HMTimerTrigger *)v15 setRecurrences:v16];
LABEL_19:
  v17 = objc_msgSend(v23, "hmf_stringForKey:", @"kTimerTriggerSignificantEventKey");
  if (v17)
  {
    v18 = self;
    uint64_t v19 = v17;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", @"kTimerTriggerResetSignificantEventKey")) {
      goto LABEL_24;
    }
    v18 = self;
    uint64_t v19 = 0;
  }
  [(HMTimerTrigger *)v18 setSignificantEvent:v19];
LABEL_24:
  v20 = objc_msgSend(v23, "hmf_dateComponentsForKey:", @"kTimerTriggerSignificantEventOffsetKey");
  if (v20)
  {
    v21 = self;
    objc_super v22 = v20;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", @"kTimerTriggerResetSignificantEventOffsetKey")) {
      goto LABEL_29;
    }
    v21 = self;
    objc_super v22 = 0;
  }
  [(HMTimerTrigger *)v21 setSignificantEventOffset:v22];
LABEL_29:
}

- (id)_serializeForAdd
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA60];
  v28.receiver = self;
  v28.super_class = (Class)HMTimerTrigger;
  id v4 = [(HMTrigger *)&v28 _serializeForAdd];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMTimerTrigger *)self fireDate];

  if (v6)
  {
    v7 = [(HMTimerTrigger *)self fireDate];
    [v5 setObject:v7 forKeyedSubscript:@"kTimerTriggerInitialFireDateKey"];
  }
  uint64_t v8 = [(HMTimerTrigger *)self timeZone];

  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v10 = [(HMTimerTrigger *)self timeZone];
    v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
    [v5 setObject:v11 forKeyedSubscript:@"kTimerTriggerTimeZoneDataKey"];
  }
  else
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetTimeZoneDataKey"];
  }
  uint64_t v12 = [(HMTimerTrigger *)self recurrence];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v14 = [(HMTimerTrigger *)self recurrence];
    char v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
    [v5 setObject:v15 forKeyedSubscript:@"kTimerTriggerRecurrenceDataKey"];
  }
  else
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetRecurrenceDataKey"];
  }
  v16 = [(HMTimerTrigger *)self recurrences];

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F28DB0];
    v18 = [(HMTimerTrigger *)self recurrences];
    uint64_t v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
    [v5 setObject:v19 forKeyedSubscript:@"kTimerTriggerRecurrencesKey"];
  }
  else
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetRecurrencesKey"];
  }
  v20 = [(HMTimerTrigger *)self significantEvent];

  if (v20)
  {
    v21 = [(HMTimerTrigger *)self significantEvent];
    [v5 setObject:v21 forKeyedSubscript:@"kTimerTriggerSignificantEventKey"];
  }
  else
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetSignificantEventKey"];
  }
  objc_super v22 = [(HMTimerTrigger *)self significantEventOffset];

  if (v22)
  {
    id v23 = (void *)MEMORY[0x1E4F28DB0];
    v24 = [(HMTimerTrigger *)self significantEventOffset];
    v25 = [v23 archivedDataWithRootObject:v24 requiringSecureCoding:1 error:0];
    [v5 setObject:v25 forKeyedSubscript:@"kTimerTriggerSignificantEventOffsetKey"];
  }
  else
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetSignificantEventOffsetKey"];
  }
  v26 = (void *)[v5 copy];

  return v26;
}

- (void)_updateTimerTriggerWithResponse:(id)a3 payloadToSend:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4F654B0];
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    v11 = [(HMTrigger *)self uuid];
    uint64_t v12 = (void *)[v10 initWithTarget:v11];
    v13 = [v9 messageWithName:@"kScheduleTimerTriggerRequestKey" destination:v12 payload:v7];

    objc_initWeak((id *)location, self);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __64__HMTimerTrigger__updateTimerTriggerWithResponse_payloadToSend___block_invoke;
    objc_super v22 = &unk_1E5944188;
    objc_copyWeak(&v24, (id *)location);
    id v23 = v6;
    [v13 setResponseHandler:&v19];
    uint64_t v14 = objc_msgSend(v8, "messageDispatcher", v19, v20, v21, v22);
    [v14 sendMessage:v13 completionHandler:0];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
  else
  {
    char v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v18;
      __int16 v26 = 2080;
      v27 = "-[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __64__HMTimerTrigger__updateTimerTriggerWithResponse_payloadToSend___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update timer trigger properties : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (!v5 && v6) {
    [v9 _updateTimerTriggerPropertiesFromResponse:v6];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)_updateRecurrences:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger _updateRecurrences:completionHandler:]", @"clientCompletionHandler"];
    objc_super v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      __int16 v33 = 2112;
      v34 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(HMTrigger *)self home];
    if (v10)
    {
      v11 = (void *)v10;
      if (v6)
      {
        char v29 = @"kTimerTriggerRecurrencesKey";
        uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
        v30 = v12;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      }
      else
      {
        v27 = @"kTimerTriggerResetRecurrencesKey";
        uint64_t v28 = MEMORY[0x1E4F1CC38];
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      }
      [(HMTimerTrigger *)self _updateTimerTriggerWithResponse:v7 payloadToSend:v13];
    }
    else
    {
      v18 = [(HMTrigger *)self context];
      __int16 v19 = [v18 delegateCaller];
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v19 callCompletion:v7 error:v20];

      v11 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      __int16 v33 = 2080;
      v34 = "-[HMTimerTrigger _updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v11);
  }
}

- (void)updateRecurrences:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger updateRecurrences:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMTimerTrigger_updateRecurrences_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMTimerTrigger updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __54__HMTimerTrigger_updateRecurrences_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecurrences:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateRecurrence:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    id v9 = [(HMTrigger *)self home];
    if (v9)
    {
      if (v6)
      {
        id v21 = @"kTimerTriggerRecurrenceDataKey";
        uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
        objc_super v22 = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      }
      else
      {
        __int16 v19 = @"kTimerTriggerResetRecurrenceDataKey";
        uint64_t v20 = MEMORY[0x1E4F1CC38];
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      }
      [(HMTimerTrigger *)self _updateTimerTriggerWithResponse:v7 payloadToSend:v11];
    }
    else
    {
      uint64_t v16 = [(HMTrigger *)self context];
      __int16 v17 = [v16 delegateCaller];
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v17 callCompletion:v7 error:v18];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2080;
      id v26 = "-[HMTimerTrigger _updateRecurrence:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)updateRecurrence:(NSDateComponents *)recurrence completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = recurrence;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger updateRecurrence:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMTimerTrigger_updateRecurrence_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMTimerTrigger updateRecurrence:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __53__HMTimerTrigger_updateRecurrence_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecurrence:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateSignificantEventOffset:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    id v9 = [(HMTrigger *)self home];
    if (v9)
    {
      if (v6)
      {
        id v21 = @"kTimerTriggerSignificantEventOffsetKey";
        uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
        objc_super v22 = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      }
      else
      {
        __int16 v19 = @"kTimerTriggerResetSignificantEventOffsetKey";
        uint64_t v20 = MEMORY[0x1E4F1CC38];
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      }
      [(HMTimerTrigger *)self _updateTimerTriggerWithResponse:v7 payloadToSend:v11];
    }
    else
    {
      uint64_t v16 = [(HMTrigger *)self context];
      __int16 v17 = [v16 delegateCaller];
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v17 callCompletion:v7 error:v18];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2080;
      id v26 = "-[HMTimerTrigger _updateSignificantEventOffset:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)updateSignificantEventOffset:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger updateSignificantEventOffset:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMTimerTrigger_updateSignificantEventOffset_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMTimerTrigger updateSignificantEventOffset:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __65__HMTimerTrigger_updateSignificantEventOffset_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSignificantEventOffset:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    if (v6)
    {
      id v9 = [(HMTrigger *)self home];
      if (v9)
      {
        v18 = @"kTimerTriggerSignificantEventKey";
        id v19 = v6;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        [(HMTimerTrigger *)self _updateTimerTriggerWithResponse:v7 payloadToSend:v10];

LABEL_11:
        goto LABEL_12;
      }
      __int16 v15 = [(HMTrigger *)self context];
      uint64_t v16 = [v15 delegateCaller];
      __int16 v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v16 callCompletion:v7 error:v17];
    }
    else
    {
      id v9 = [(HMTrigger *)self context];
      __int16 v15 = [v9 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      [v15 callCompletion:v7 error:v16];
    }

    goto LABEL_11;
  }
  v11 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v21 = v14;
    __int16 v22 = 2080;
    id v23 = "-[HMTimerTrigger _updateSignificantEvent:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_12:
}

- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger updateSignificantEvent:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HMTimerTrigger_updateSignificantEvent_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMTimerTrigger updateSignificantEvent:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __59__HMTimerTrigger_updateSignificantEvent_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSignificantEvent:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateTimeZone:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (v8)
  {
    id v9 = [(HMTrigger *)self home];
    if (v9)
    {
      if (v6)
      {
        id v21 = @"kTimerTriggerTimeZoneDataKey";
        uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
        __int16 v22 = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      }
      else
      {
        id v19 = @"kTimerTriggerResetTimeZoneDataKey";
        uint64_t v20 = MEMORY[0x1E4F1CC38];
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      }
      [(HMTimerTrigger *)self _updateTimerTriggerWithResponse:v7 payloadToSend:v11];
    }
    else
    {
      uint64_t v16 = [(HMTrigger *)self context];
      __int16 v17 = [v16 delegateCaller];
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v17 callCompletion:v7 error:v18];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2080;
      id v26 = "-[HMTimerTrigger _updateTimeZone:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)updateTimeZone:(NSTimeZone *)timeZone completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = timeZone;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger updateTimeZone:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMTimerTrigger_updateTimeZone_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMTimerTrigger updateTimeZone:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __51__HMTimerTrigger_updateTimeZone_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTimeZone:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateFireDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger _updateFireDate:completionHandler:]", @"clientCompletionHandler"];
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v26;
      __int16 v32 = 2112;
      __int16 v33 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      __int16 v32 = 2080;
      __int16 v33 = "-[HMTimerTrigger _updateFireDate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v16 = [(HMTrigger *)self context];
    __int16 v17 = [v16 delegateCaller];
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    [v17 callCompletion:v7 error:v18];

LABEL_10:
    goto LABEL_13;
  }
  uint64_t v10 = [(HMTrigger *)self home];
  if (v10)
  {
    uint64_t v28 = @"kTimerTriggerInitialFireDateKey";
    id v29 = v6;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [(HMTimerTrigger *)self _updateTimerTriggerWithResponse:v7 payloadToSend:v11];
  }
  else
  {
    id v19 = [(HMTrigger *)self context];
    uint64_t v20 = [v19 delegateCaller];
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v20 callCompletion:v7 error:v21];
  }
LABEL_13:
}

- (void)updateFireDate:(NSDate *)fireDate completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = fireDate;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMTimerTrigger updateFireDate:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMTimerTrigger_updateFireDate_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMTimerTrigger updateFireDate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __51__HMTimerTrigger_updateFireDate_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFireDate:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)setSignificantEventOffset:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSDateComponents *)[v6 copy];
  significantEventOffset = self->_significantEventOffset;
  self->_significantEventOffset = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSDateComponents)significantEventOffset
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDateComponents *)self->_significantEventOffset copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDateComponents *)v4;
}

- (void)setSignificantEvent:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  significantEvent = self->_significantEvent;
  self->_significantEvent = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)significantEvent
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRecurrences:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  recurrences = self->_recurrences;
  self->_recurrences = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)recurrences
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_recurrences;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRecurrence:(id)a3
{
  id v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  recurrence = self->_recurrence;
  self->_recurrence = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSDateComponents)recurrence
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDateComponents *)self->_recurrence copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDateComponents *)v4;
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSTimeZone *)[v6 copy];
  timeZone = self->_timeZone;
  self->_timeZone = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSTimeZone)timeZone
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_timeZone;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setFireDate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSDate *)[v6 copy];
  fireDate = self->_fireDate;
  self->_fireDate = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSDate)fireDate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_fireDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMTimerTrigger)initWithDictionary:(id)a3 home:(id)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMTimerTrigger;
  id v7 = [(HMTrigger *)&v30 initWithDictionary:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"kTimerTriggerInitialFireDateKey"];
    fireDate = v7->_fireDate;
    v7->_fireDate = (NSDate *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAF0];
    v11 = objc_msgSend(v6, "hmf_dataForKey:", @"kTimerTriggerTimeZoneDataKey");
    uint64_t v12 = objc_msgSend(v10, "hmf_unarchiveFromData:error:", v11, 0);
    timeZone = v7->_timeZone;
    v7->_timeZone = (NSTimeZone *)v12;

    uint64_t v14 = (void *)MEMORY[0x1E4F1C9D8];
    __int16 v15 = objc_msgSend(v6, "hmf_dataForKey:", @"kTimerTriggerRecurrenceDataKey");
    uint64_t v16 = objc_msgSend(v14, "hmf_unarchiveFromData:error:", v15, 0);
    recurrence = v7->_recurrence;
    v7->_recurrence = (NSDateComponents *)v16;

    uint64_t v18 = objc_msgSend(v6, "hmf_stringForKey:", @"kTimerTriggerSignificantEventKey");
    significantEvent = v7->_significantEvent;
    v7->_significantEvent = (NSString *)v18;

    uint64_t v20 = (void *)MEMORY[0x1E4F1C9D8];
    id v21 = objc_msgSend(v6, "hmf_dataForKey:", @"kTimerTriggerSignificantEventOffsetKey");
    uint64_t v22 = objc_msgSend(v20, "hmf_unarchiveFromData:error:", v21, 0);
    significantEventOffset = v7->_significantEventOffset;
    v7->_significantEventOffset = (NSDateComponents *)v22;

    id v24 = objc_msgSend(v6, "hmf_numberForKey:", @"kTimerTriggerRecurrencesKey");
    __int16 v25 = v24;
    if (v24)
    {
      uint64_t v26 = [v24 unsignedIntegerValue];
      if (v26 == 127)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v27 = HMDaysOfTheWeekToDateComponents(v26);
    }
    else
    {
      uint64_t v27 = [v6 arrayOfDateComponentsFromDataForKey:@"kTimerTriggerRecurrencesKey"];
    }
    recurrences = v7->_recurrences;
    v7->_recurrences = (NSArray *)v27;

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (HMTimerTrigger)initWithName:(id)a3 significantEvent:(id)a4 significantEventOffset:(id)a5 recurrences:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    __int16 v25 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:3];
    id v26 = [v23 exceptionWithName:v24 reason:v25 userInfo:0];

    objc_exception_throw(v26);
  }
  uint64_t v14 = v13;
  v27.receiver = self;
  v27.super_class = (Class)HMTimerTrigger;
  __int16 v15 = [(HMTrigger *)&v27 initWithName:v10 configuredName:v10];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    significantEvent = v15->_significantEvent;
    v15->_significantEvent = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    significantEventOffset = v15->_significantEventOffset;
    v15->_significantEventOffset = (NSDateComponents *)v18;

    uint64_t v20 = [v14 copy];
    recurrences = v15->_recurrences;
    v15->_recurrences = (NSArray *)v20;
  }
  return v15;
}

- (HMTimerTrigger)initWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrences:(id)a6
{
  id v10 = a6;
  id v11 = [(HMTimerTrigger *)self initWithName:a3 fireDate:a4 timeZone:a5 recurrence:0];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    recurrences = v11->_recurrences;
    v11->_recurrences = (NSArray *)v12;
  }
  return v11;
}

- (HMTimerTrigger)initWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrence:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    __int16 v25 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:3];
    id v26 = [v23 exceptionWithName:v24 reason:v25 userInfo:0];

    objc_exception_throw(v26);
  }
  uint64_t v14 = v13;
  v27.receiver = self;
  v27.super_class = (Class)HMTimerTrigger;
  __int16 v15 = [(HMTrigger *)&v27 initWithName:v10 configuredName:v10];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    fireDate = v15->_fireDate;
    v15->_fireDate = (NSDate *)v16;

    uint64_t v18 = [v12 copy];
    timeZone = v15->_timeZone;
    v15->_timeZone = (NSTimeZone *)v18;

    uint64_t v20 = [v14 copy];
    recurrence = v15->_recurrence;
    v15->_recurrence = (NSDateComponents *)v20;
  }
  return v15;
}

- (HMTimerTrigger)initWithName:(NSString *)name fireDate:(NSDate *)fireDate recurrence:(NSDateComponents *)recurrence
{
  return [(HMTimerTrigger *)self initWithName:name fireDate:fireDate timeZone:0 recurrence:recurrence];
}

- (HMTimerTrigger)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end