void sub_10D4(void *a1, void *a2)
{
  id v3;
  uint64_t vars8;

  if (a1)
  {
    v3 = a2;
    [a1 log:@"%@", v3];
    [a1 appendString:v3];
  }
}

void sub_113C(void *a1)
{
  if (a1)
  {
    sub_1650(a1, @"MEDICATIONS");
    sub_16B4((id *)a1);
    sub_1650(a1, @"SCHEDULES");
    sub_192C((id *)a1);
  }
}

void sub_119C(uint64_t a1)
{
  if (a1)
  {
    v2 = +[HKUserDomainConceptTypeIdentifier medicationUserDomainConceptTypeIdentifier];
    v3 = +[HKQuery predicateForUserDomainConceptsWithTypeIdentifier:v2];
    v9[0] = v3;
    v4 = +[HKQuery predicateForListUserDomainConceptWithListType:2];
    v9[1] = v4;
    v5 = +[NSArray arrayWithObjects:v9 count:2];
    v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 24));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_13EC;
    v8[3] = &unk_41E0;
    v8[4] = a1;
    id v7 = [objc_alloc((Class)HKUserDomainConceptQuery) initWithPredicate:v6 anchor:0 limit:0 sortDescriptors:0 resultsHandler:v8];
    [*(id *)(a1 + 8) executeQuery:v7];
  }
}

void sub_1334(uint64_t a1)
{
  if (a1)
  {
    id v2 = [objc_alloc((Class)HKMedicationScheduleControl) initWithHealthStore:*(void *)(a1 + 8)];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 24));
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_15AC;
    v3[3] = &unk_4208;
    v3[4] = a1;
    [v2 fetchAllSchedulesWithCompletion:v3];
  }
}

void sub_13EC(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v14 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11) {
    sub_14B4(*(void *)(a1 + 32), v11);
  }
  if (v13) {
    [*(id *)(a1 + 32) appendFormat:@"Error querying for meds and meds list: %@", v13];
  }
  if (a5) {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
  }
}

void sub_14B4(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = *(void **)(a1 + 32);
      if (!v3)
      {
        id v4 = objc_alloc_init((Class)NSMutableArray);
        v5 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v4;

        v3 = *(void **)(a1 + 32);
      }
      [v3 addObject:v9];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = *(void **)(a1 + 40);
      if (!v6)
      {
        id v7 = objc_alloc_init((Class)NSMutableArray);
        v8 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v7;

        v6 = *(void **)(a1 + 40);
      }
      [v6 addObject:v9];
    }
  }
}

void sub_15AC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  if (v6) {
    [*(id *)(a1 + 32) appendFormat:@"Error fetching schedules: %@", v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

id sub_1650(id result, void *a2)
{
  if (result)
  {
    id v2 = result;
    id v3 = a2;
    [v2 appendStrongSeparator];
    [v2 appendString:v3];

    [v2 appendStrongSeparator];
    return [v2 appendNewline];
  }
  return result;
}

void sub_16B4(id *a1)
{
  if (a1)
  {
    id v2 = &OBJC_INSTANCE_METHODS_HDDiagnosticOperationProvider;
    if (a1[5])
    {
      id v3 = sub_1C7C((uint64_t)a1);
      id v14 = [a1[5] mutableCopy];
      id v13 = objc_alloc_init((Class)NSMutableArray);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = [v3 linkCollection];
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v17;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            v10 = v2;
            id v11 = *(id *)((char *)a1 + (int)v2[133].entrysize);
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_1CE8;
            v15[3] = &unk_4230;
            v15[4] = v9;
            id v12 = objc_msgSend(v11, "hk_firstObjectPassingTest:", v15);
            if (v12)
            {
              [v14 removeObject:v12];
              [v13 addObject:v12];
            }

            id v2 = v10;
          }
          id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v6);
      }

      sub_1DBC(a1, v3);
      sub_1EC0(a1, v13, @"Active Meds");
      sub_1EC0(a1, v14, @"Archived Meds");
    }
    else
    {
      [a1 appendFormat:@"Found No Medications To Report\n"];
    }
  }
}

void sub_192C(id *a1)
{
  if (a1)
  {
    objc_msgSend(a1, "appendFormat:", @"Fetched %ld schedules", objc_msgSend(a1[6], "count"));
    if ([a1[6] count])
    {
      [a1 appendNewline];
      [a1 appendString:@"Schedules"];
      id v19 = [objc_alloc((Class)HKTableFormatter) initWithColumnTitles:&off_48C0];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v16 = a1;
      id obj = a1[6];
      id v20 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v20)
      {
        uint64_t v18 = *(void *)v25;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(obj);
            }
            id v3 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v23 = [v3 UUID];
            v22 = [v23 UUIDString];
            v28[0] = v22;
            [v3 creationTimestamp];
            v21 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
            id v4 = HKDiagnosticStringFromDate();
            v28[1] = v4;
            id v5 = [v3 medicationUUID];
            id v6 = [v5 UUIDString];
            v28[2] = v6;
            uint64_t v7 = [v3 createdUTCOffset];
            v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 secondsFromGMT]);
            uint64_t v9 = [v8 stringValue];
            v28[3] = v9;
            [v3 isDeleted];
            v10 = HKStringFromBool();
            v28[4] = v10;
            [v3 isUnavailable];
            id v11 = HKStringFromBool();
            v28[5] = v11;
            id v12 = +[NSArray arrayWithObjects:v28 count:6];

            [v19 appendRow:v12];
          }
          id v20 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v20);
      }

      [v16 appendNewline];
      id v13 = [v19 formattedTable];
      [v16 appendString:v13];

      [v16 appendNewline];
      id v14 = +[NSTimeZone localTimeZone];
      v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 secondsFromGMT]);
      [v16 appendFormat:@"Local TimeZone: '%@' with '%@' seconds offset from GMT", v14, v15];
    }
  }
}

id sub_1C7C(uint64_t a1)
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&stru_4270];
    id v2 = [v1 lastObject];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id sub_1CE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 UUID];
  id v5 = [*(id *)(a1 + 32) targetUUID];
  if (v4 == v5)
  {
    id v9 = &dword_0 + 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) targetUUID];
    if (v6)
    {
      uint64_t v7 = [v3 UUID];
      v8 = [*(id *)(a1 + 32) targetUUID];
      id v9 = [v7 isEqual:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

void sub_1DBC(void *a1, void *a2)
{
  id v7 = a2;
  if (a1)
  {
    [a1 appendString:@"List"];
    [a1 appendSeparator];
    if (v7)
    {
      id v3 = objc_alloc((Class)HKTableFormatter);
      self;
      id v4 = [v3 initWithColumnTitles:&off_4890];
      id v5 = sub_213C((uint64_t)HDMedicationsDiagnosticOperation, v7);
      [v4 appendRow:v5];

      id v6 = [v4 formattedTable];
      [a1 appendString:v6];

      [a1 appendNewline];
    }
    else
    {
      [a1 appendFormat:@"Found No Meds List To Report\n"];
    }
  }
}

void sub_1EC0(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    [a1 appendString:a3];
    [a1 appendSeparator];
    id v6 = objc_alloc((Class)HKTableFormatter);
    self;
    id v7 = [v6 initWithColumnTitles:&off_48A8];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [v13 UUID];
          sub_2418(a1, v14);

          v15 = [v13 semanticIdentifier];
          sub_24C4(a1, v15);

          long long v16 = sub_2578((uint64_t)HDMedicationsDiagnosticOperation, v13);
          [v7 appendRow:v16];
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    long long v17 = [v7 formattedTable];
    [a1 appendString:v17];

    [a1 appendNewline];
    id v5 = v18;
  }
}

int64_t sub_20BC(id a1, HKListUserDomainConcept *a2, HKListUserDomainConcept *a3)
{
  id v4 = a3;
  id v5 = [(HKListUserDomainConcept *)a2 modificationDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  id v8 = [(HKListUserDomainConcept *)v4 modificationDate];

  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v7 >= v10) {
    return 0;
  }
  else {
    return -1;
  }
}

id sub_213C(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  v28 = [v2 UUID];
  long long v27 = [v28 UUIDString];
  v29[0] = v27;
  long long v26 = [v2 creationDate];
  long long v25 = HKDiagnosticStringFromDate();
  v29[1] = v25;
  id v3 = objc_alloc((Class)NSString);
  long long v24 = [v2 creationDate];
  [v24 timeIntervalSinceReferenceDate];
  id v23 = objc_msgSend(v3, "initWithFormat:", @"%f", v4);
  v29[2] = v23;
  long long v22 = [v2 modificationDate];
  long long v21 = HKDiagnosticStringFromDate();
  v29[3] = v21;
  id v5 = objc_alloc((Class)NSString);
  long long v20 = [v2 modificationDate];
  [v20 timeIntervalSinceReferenceDate];
  id v19 = objc_msgSend(v5, "initWithFormat:", @"%f", v6);
  v29[4] = v19;
  id v18 = [v2 codingCollection];
  double v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 count]);
  id v8 = [v7 stringValue];
  v29[5] = v8;
  double v9 = [v2 linkCollection];
  double v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 count]);
  uint64_t v11 = [v10 stringValue];
  v29[6] = v11;
  id v12 = [v2 propertyCollection];
  id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 count]);
  id v14 = [v13 stringValue];
  v29[7] = v14;
  v15 = [v2 listName];

  v29[8] = v15;
  long long v16 = +[NSArray arrayWithObjects:v29 count:9];

  return v16;
}

void *sub_2418(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = (void *)a1[6];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_299C;
    v7[3] = &unk_4298;
    id v8 = v3;
    a1 = objc_msgSend(v5, "hk_containsObjectPassingTest:", v7);
  }
  return a1;
}

void *sub_24C4(void *a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = [a2 stringValue];
    uint64_t v4 = (void *)v2[6];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_2A24;
    v7[3] = &unk_4298;
    id v8 = v3;
    id v5 = v3;
    id v2 = objc_msgSend(v4, "hk_containsObjectPassingTest:", v7);
  }
  return v2;
}

id sub_2578(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  v40 = [v2 UUID];
  v39 = [v40 UUIDString];
  v41[0] = v39;
  v38 = [v2 creationDate];
  v37 = HKDiagnosticStringFromDate();
  v41[1] = v37;
  id v3 = objc_alloc((Class)NSString);
  v36 = [v2 creationDate];
  [v36 timeIntervalSinceReferenceDate];
  id v35 = objc_msgSend(v3, "initWithFormat:", @"%f", v4);
  v41[2] = v35;
  v34 = [v2 modificationDate];
  v33 = HKDiagnosticStringFromDate();
  v41[3] = v33;
  id v5 = objc_alloc((Class)NSString);
  v32 = [v2 modificationDate];
  [v32 timeIntervalSinceReferenceDate];
  id v31 = objc_msgSend(v5, "initWithFormat:", @"%f", v6);
  v41[4] = v31;
  v30 = [v2 codingCollection];
  v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 count]);
  v28 = [v29 stringValue];
  v41[5] = v28;
  long long v27 = [v2 linkCollection];
  long long v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v27 count]);
  long long v25 = [v26 stringValue];
  v41[6] = v25;
  long long v24 = [v2 propertyCollection];
  id v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 count]);
  long long v22 = [v23 stringValue];
  v41[7] = v22;
  long long v21 = [v2 firstOntologyCoding];
  long long v20 = HKStringFromBool();
  v41[8] = v20;
  id v19 = HKStringFromBool();
  v41[9] = v19;
  double v7 = HKStringFromBool();
  v41[10] = v7;
  id v8 = [v2 userSpecifiedName];
  double v9 = HKStringFromBool();
  v41[11] = v9;
  double v10 = [v2 userSpecifiedNotes];
  uint64_t v11 = HKStringFromBool();
  v41[12] = v11;
  id v12 = [v2 userVisualizationConfigJSONString];
  id v13 = HKStringFromBool();
  v41[13] = v13;
  id v14 = [v2 semanticIdentifier];

  v15 = [v14 stringValue];
  long long v16 = objc_msgSend(v15, "hk_SHA256Hash");
  v41[14] = v16;
  id v18 = +[NSArray arrayWithObjects:v41 count:15];

  return v18;
}

id sub_299C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 medicationUUID];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    id v7 = &dword_0 + 1;
  }
  else if (v5)
  {
    uint64_t v6 = [v3 medicationUUID];
    id v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id sub_2A24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 medicationIdentifier];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    id v7 = &dword_0 + 1;
  }
  else if (v5)
  {
    uint64_t v6 = [v3 medicationIdentifier];
    id v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t HKCreateConcurrentDispatchQueue()
{
  return _HKCreateConcurrentDispatchQueue();
}

uint64_t HKDiagnosticStringFromDate()
{
  return _HKDiagnosticStringFromDate();
}

uint64_t HKStringFromBool()
{
  return _HKStringFromBool();
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_appendNewline(void *a1, const char *a2, ...)
{
  return [a1 appendNewline];
}

id objc_msgSend_appendSeparator(void *a1, const char *a2, ...)
{
  return [a1 appendSeparator];
}

id objc_msgSend_appendStrongSeparator(void *a1, const char *a2, ...)
{
  return [a1 appendStrongSeparator];
}

id objc_msgSend_codingCollection(void *a1, const char *a2, ...)
{
  return [a1 codingCollection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createdUTCOffset(void *a1, const char *a2, ...)
{
  return [a1 createdUTCOffset];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_creationTimestamp(void *a1, const char *a2, ...)
{
  return [a1 creationTimestamp];
}

id objc_msgSend_firstOntologyCoding(void *a1, const char *a2, ...)
{
  return [a1 firstOntologyCoding];
}

id objc_msgSend_formattedTable(void *a1, const char *a2, ...)
{
  return [a1 formattedTable];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return [a1 isDeleted];
}

id objc_msgSend_isUnavailable(void *a1, const char *a2, ...)
{
  return [a1 isUnavailable];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_linkCollection(void *a1, const char *a2, ...)
{
  return [a1 linkCollection];
}

id objc_msgSend_listName(void *a1, const char *a2, ...)
{
  return [a1 listName];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_medicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 medicationIdentifier];
}

id objc_msgSend_medicationUUID(void *a1, const char *a2, ...)
{
  return [a1 medicationUUID];
}

id objc_msgSend_medicationUserDomainConceptTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 medicationUserDomainConceptTypeIdentifier];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_propertyCollection(void *a1, const char *a2, ...)
{
  return [a1 propertyCollection];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_semanticIdentifier(void *a1, const char *a2, ...)
{
  return [a1 semanticIdentifier];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_targetUUID(void *a1, const char *a2, ...)
{
  return [a1 targetUUID];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_userSpecifiedName(void *a1, const char *a2, ...)
{
  return [a1 userSpecifiedName];
}

id objc_msgSend_userSpecifiedNotes(void *a1, const char *a2, ...)
{
  return [a1 userSpecifiedNotes];
}

id objc_msgSend_userVisualizationConfigJSONString(void *a1, const char *a2, ...)
{
  return [a1 userVisualizationConfigJSONString];
}