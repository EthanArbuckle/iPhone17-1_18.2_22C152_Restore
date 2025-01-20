@interface EKAlarmEngine
@end

@implementation EKAlarmEngine

uint64_t __32___EKAlarmEngine_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_EKAlarmEngine);
  v1 = (void *)sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v0;

  v2 = (void *)sharedInstance___shared;
  return [v2 start];
}

id __22___EKAlarmEngine_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F04B98]);
  return v0;
}

void __23___EKAlarmEngine_start__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) settingForKey:@"LastDBSequence"];
  uint64_t v3 = [objc_alloc(MEMORY[0x263F2FD38]) initWithSerializedSequenceString:v2];
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  v6 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(*(void *)(a1 + 40) + 8) serializedSequenceString];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543618;
    v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Starting up. Last sequence was %{public}@, context is %@", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t __38___EKAlarmEngine_didRegisterForAlarms__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleTimer];
}

uint64_t __37___EKAlarmEngine_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v2 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "Updated next fire date: %@.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _timerFired];
}

uint64_t __50___EKAlarmEngine__protectedDataDidBecomeAvailable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleTimer];
}

void __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _eventStore];
  int v3 = [*(id *)(a1 + 32) _haveAlarmsChanged:v2];
  uint64_t v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    uint64_t v7 = v4[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke_35;
    block[3] = &unk_2645C0D98;
    block[4] = v4;
    dispatch_async(v7, block);
  }
  else if (([v4 _populateAlarmTable:v2] & 1) == 0)
  {
    uint64_t v6 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Alarm table population not started.  Will wait until the end of an existing population action to retry.", buf, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
  }
}

uint64_t __48___EKAlarmEngine__updateWithForceForAlarmTable___block_invoke_35(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleTimer];
}

void __37___EKAlarmEngine__haveAlarmsChanged___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  if (a2)
  {
    if (v11)
    {
      uint64_t v8 = [v11 objectForKey:*MEMORY[0x263F2FF18]];
      if (v8)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
      else
      {
        int v9 = [v11 objectForKey:*MEMORY[0x263F2FF20]];
        if (v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        }
        else
        {
          v10 = [v11 objectForKey:*MEMORY[0x263F2FF28]];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 != 0;
        }
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v2 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = v3;
    _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "There were %lu alarms found which will occur in the next 15 days", buf, 0xCu);
  }

  [*(id *)(a1 + 40) deleteAllAlarms];
  if ([*(id *)(a1 + 32) count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v4 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v44 = *(void *)v47;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v47 != v44) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v46 + 1) + 8 * v6);
          uint64_t v8 = [*(id *)(a1 + 40) insertNewAlarm];
          int v9 = [v7 ownerID];
          uint64_t v10 = [v9 entityID];

          id v11 = [v7 ownerDate];
          uint64_t v12 = [v7 ownerURI];
          uint64_t v13 = [v12 absoluteString];
          [v8 setEntityURI:v13];

          v14 = NSNumber;
          v15 = [v7 alarmID];
          v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "entityID"));
          [v8 setAlarmID:v16];

          v17 = [NSNumber numberWithInt:v10];
          [v8 setEntityID:v17];

          v18 = NSNumber;
          v19 = [v7 alarmID];
          v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "databaseID"));
          [v8 setDatabaseID:v20];

          [v8 setEntityDate:v11];
          v21 = [v7 ownerTimeZone];
          v22 = [v21 name];
          [v8 setEntityTimeZone:v22];

          v23 = [v7 fireDate];
          [v8 setFireTime:v23];

          v24 = [v7 externalID];
          [v8 setExternalID:v24];

          v25 = [v7 acknowledgedDate];
          [v8 setAcknowledgedDate:v25];

          ++v6;
        }
        while (v5 != v6);
        uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v5);
    }
  }
  uint64_t v26 = [*(id *)(a1 + 56) sequenceToken];
  uint64_t v27 = *(void *)(a1 + 48);
  v28 = *(void **)(v27 + 8);
  *(void *)(v27 + 8) = v26;

  v29 = [*(id *)(*(void *)(a1 + 48) + 8) serializedSequenceString];
  [*(id *)(a1 + 40) setSetting:v29 forKey:@"LastDBSequence"];
  v30 = *(void **)(a1 + 40);
  v31 = NSString;
  [*(id *)(a1 + 64) timeIntervalSinceReferenceDate];
  v33 = objc_msgSend(v31, "stringWithFormat:", @"%f", v32);
  [v30 setSetting:v33 forKey:@"CacheEndDate"];

  v34 = *(void **)(a1 + 40);
  id v45 = 0;
  LOBYTE(v30) = [v34 save:&v45];
  id v35 = v45;
  if ((v30 & 1) == 0)
  {
    v36 = +[CALNLogSubsystem alarmEngine];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke_cold_1((uint64_t)v35, v36, v37, v38, v39, v40, v41, v42);
    }
  }
}

uint64_t __35___EKAlarmEngine__populateFinished__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleTimer];
}

void __34___EKAlarmEngine__rescheduleTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nextAlarmFireTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) settingForKey:@"CacheEndDate"];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 doubleValue];
      double v8 = v7;
      int v9 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
      [v9 timeIntervalSinceReferenceDate];
      double v11 = v10;

      uint64_t v12 = +[CALNLogSubsystem alarmEngine];
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11 <= v8 + -3600.0)
      {
        if (v13)
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "No alarms found. Setting time to cache end date.", v18, 2u);
        }

        uint64_t v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v8];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "We're close to our cache end date. Going to attempt a rebuild.", buf, 2u);
        }

        [*(id *)(a1 + 40) _updateWithForceForAlarmTable:1];
      }
    }
    else
    {
      v14 = +[CALNLogSubsystem alarmEngine];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "No cache end date. This means we haven't populated the table. No timer will be set.", v20, 2u);
      }
    }
  }
}

uint64_t __44___EKAlarmEngine__installTimerWithFireDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_installTimerWithFireDate__dateFormatter;
  _installTimerWithFireDate__dateFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)_installTimerWithFireDate__dateFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

void __37___EKAlarmEngine__notifyAlarmsFired___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "Notifying: %lu alarms fired.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = [NSDictionary dictionaryWithObject:*(void *)(a1 + 32) forKey:@"EKAlarmEngineAlarmOccurrencesKey"];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"EKAlarmEngineAlarmsDidFireNotification" object:*(void *)(a1 + 40) userInfo:v4];
}

void __29___EKAlarmEngine__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  *(void *)((char *)&v141[2] + 4) = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) alarmsBetweenStartDate:*(void *)(*(void *)(v1 + 40) + 24) endDate:*(void *)(v1 + 48)];
  uint64_t v3 = +[CALNLogSubsystem alarmEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v141[0] = [v2 count];
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu alarm(s)", buf, 0xCu);
  }

  if ([v2 count])
  {
    v105 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v116 = [*(id *)(v1 + 40) _eventStore];
    id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
    uint64_t v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    int v6 = (void *)CalCopyTimeZone();
    v102 = v5;
    [v5 setTimeZone:v6];

    v104 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v103 = v2;
    id obj = v2;
    uint64_t v109 = [obj countByEnumeratingWithState:&v132 objects:v139 count:16];
    if (v109)
    {
      uint64_t v108 = *(void *)v133;
      do
      {
        for (uint64_t i = 0; i != v109; ++i)
        {
          if (*(void *)v133 != v108) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v132 + 1) + 8 * i);
          int v9 = [v8 entityTimeZone];
          if (v9)
          {
            double v10 = (void *)MEMORY[0x263EFFA18];
            double v11 = [v8 entityTimeZone];
            v126 = [v10 timeZoneWithName:v11];
          }
          else
          {
            v126 = 0;
          }

          uint64_t v12 = [v8 entityID];
          uint64_t v13 = [v12 intValue];

          v14 = [v8 databaseID];
          uint64_t v15 = [v14 intValue];

          uint64_t v16 = [MEMORY[0x263F04BA8] objectIDWithEntityType:2 rowID:v13 databaseID:v15];
          if ([*(id *)(v1 + 40) _isDataProtected])
          {
            v17 = [v8 entityURI];

            if (v17)
            {
              id v18 = objc_alloc(NSURL);
              v19 = [v8 entityURI];
              uint64_t v20 = [v18 initWithString:v19];
            }
            else
            {
              v19 = +[CALNLogSubsystem alarmEngine];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                id v35 = [v8 entityID];
                *(_DWORD *)v137 = 138412290;
                v138 = v35;
                _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Side alarm has no Entity URI, will not fire. rowID: %@", v137, 0xCu);
              }
              uint64_t v20 = 0;
            }

            v36 = [v8 allDay];
            unsigned int v37 = [v36 BOOLValue];

            v23 = [v8 acknowledgedDate];
            uint64_t v112 = 0;
            uint64_t v113 = 0;
            LOBYTE(v29) = 0;
            v122 = 0;
            v123 = 0;
            v119 = 0;
            v120 = 0;
            v121 = 0;
            v124 = 0;
            v125 = 0;
            double v31 = 0.0;
            double v34 = 0.0;
            BOOL v115 = v23 != 0;
          }
          else
          {
            uint64_t v21 = i;
            v22 = [v8 entityDate];
            v23 = [v116 eventForObjectID:v16 occurrenceDate:v22 checkValid:0];

            if (v23)
            {
              v125 = [v23 title];
              v24 = [v23 preferredLocationWithoutPrediction];
              v25 = [v24 address];
              id v26 = [v24 title];
              v123 = v25;
              if (![v26 length])
              {
                id v27 = v25;
                v28 = v26;
                id v26 = v27;
              }
              v124 = v26;
              BOOL v29 = +[CALNNotificationFilter shouldIgnoreNotificationForEvent:v23];
              if (v29)
              {
                [v104 addObject:v8];
                v30 = +[CALNLogSubsystem alarmEngine];
                double v31 = 0.0;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  [v8 entityID];
                  v33 = uint64_t v32 = v16;
                  *(_DWORD *)v137 = 138412290;
                  v138 = v33;
                  _os_log_impl(&dword_2216BB000, v30, OS_LOG_TYPE_DEFAULT, "Removing side alarm for junk or maybe junk event with rowID: %@", v137, 0xCu);

                  uint64_t v16 = v32;
                }
                uint64_t v112 = 0;
                uint64_t v113 = 0;
                v119 = 0;
                v120 = 0;
                v121 = 0;
                v122 = 0;
                uint64_t v20 = 0;
                double v34 = 0.0;
              }
              else
              {
                uint64_t v38 = v16;
                uint64_t v39 = [v23 participationStatus];
                uint64_t v40 = [v23 status];
                BYTE4(v113) = 0;
                if ([v23 isCurrentUserInvitedAttendee] && v39 == 3 && v40 != 3)
                {
                  uint64_t v41 = [v23 calendar];
                  uint64_t v42 = [v41 source];
                  v43 = [v42 constraints];
                  BYTE4(v113) = [v43 statusesAreAccurate];
                }
                uint64_t v20 = [v23 externalURL];
                v122 = [v23 endDate];
                v121 = [v24 mapKitHandle];
                uint64_t v44 = [v24 geoLocation];
                LODWORD(v113) = v44 != 0;

                id v45 = [v24 geoLocation];
                [v45 coordinate];
                double v34 = v46;

                long long v47 = [v24 geoLocation];
                [v47 coordinate];
                double v31 = v48;

                long long v49 = [v23 travelStartLocation];
                v120 = [v49 routing];

                HIDWORD(v112) = [v23 isSelfOrganized] ^ 1;
                v50 = [v23 organizer];
                v119 = [v50 emailAddress];

                v30 = [v23 calendar];
                LOBYTE(v112) = [v30 isSuggestedEventCalendar];
                uint64_t v16 = v38;
              }
            }
            else
            {
              v24 = +[CALNLogSubsystem alarmEngine];
              double v31 = 0.0;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                __29___EKAlarmEngine__timerFired__block_invoke_cold_2(buf, v8, v141, v24);
              }
              uint64_t v112 = 0;
              uint64_t v113 = 0;
              LOBYTE(v29) = 0;
              v122 = 0;
              v123 = 0;
              v119 = 0;
              v120 = 0;
              v121 = 0;
              uint64_t v20 = 0;
              v124 = 0;
              v125 = 0;
              double v34 = 0.0;
            }

            BOOL v115 = 0;
            unsigned int v37 = 0;
            uint64_t i = v21;
          }

          v51 = [v8 entityDate];
          v114 = (void *)v16;
          uint64_t v52 = [v116 eventForObjectID:v16 occurrenceDate:v51 checkValid:0];

          if (v52)
          {
            unsigned int v37 = [v52 isAllDay];
            [v52 travelTime];
            BOOL v54 = v53 > 0.0;
            v55 = [v52 calendar];
            v56 = [v55 source];

            BOOL v110 = v54;
            if ([v56 supportsAlarmAcknowledgedDate])
            {
              v118 = 0;
            }
            else
            {
              v118 = [v52 uniqueIdentifier];
            }
            v58 = v123;
            v57 = (void *)v20;
          }
          else
          {
            v57 = (void *)v20;
            v118 = 0;
            BOOL v110 = 0;
            v58 = v123;
          }
          v59 = [v8 acknowledgedDate];

          if (v59)
          {
            v60 = [v8 acknowledgedDate];
            v61 = [v8 fireTime];
            [v60 timeIntervalSinceDate:v61];
            BOOL v115 = v62 >= 0.0;
          }
          uint64_t v63 = [v8 acknowledgedDate];
          unsigned int v111 = v37;
          if (v63
            && (v64 = (void *)v63,
                [v8 acknowledgedDate],
                v65 = objc_claimAutoreleasedReturnValue(),
                [v65 timeIntervalSinceReferenceDate],
                double v67 = v66,
                v65,
                v64,
                v67 >= 1.0))
          {
            char v69 = 0;
          }
          else
          {
            v68 = [v8 refiring];
            char v69 = [v68 BOOLValue];
          }
          v117 = [*(id *)(v1 + 40) _alertInfoAlarmIDFromSideAlarm:v8];
          v70 = [v8 externalID];

          v71 = v57;
          if (v70)
          {
            v72 = [v8 externalID];
            v73 = [v116 alarmWithExternalID:v72];

            v70 = (void *)[v73 type];
          }
          if (v71) {
            char v74 = v29;
          }
          else {
            char v74 = 1;
          }
          if ((v74 & 1) == 0)
          {
            v75 = [EKCalendarItemAlertInfo alloc];
            v76 = [v8 entityDate];
            [v8 externalID];
            v78 = uint64_t v77 = v1;
            [v8 databaseID];
            v107 = v70;
            v80 = uint64_t v79 = i;
            BYTE2(v101) = v112;
            BYTE1(v101) = v69;
            LOBYTE(v101) = v110;
            BYTE4(v100) = v115;
            LODWORD(v100) = [v80 intValue];
            LOBYTE(v99) = BYTE4(v113);
            v81 = -[EKCalendarItemAlertInfo initWithTitle:location:date:endDate:timeZone:allDay:tentative:publisherBulletinID:entityID:appLink:proximity:externalID:databaseID:acknowledged:dismissalID:alarmID:isOffsetFromTravelTimeStart:refiring:pseudoEvent:](v75, "initWithTitle:location:date:endDate:timeZone:allDay:tentative:publisherBulletinID:entityID:appLink:proximity:externalID:databaseID:acknowledged:dismissalID:alarmID:isOffsetFromTravelTimeStart:refiring:pseudoEvent:", v125, v124, v76, v122, v126, v111, v99, 0, v71, 0, 0, v78, v100, v118, v117, v101);

            uint64_t i = v79;
            uint64_t v1 = v77;
            v58 = v123;

            [(EKCalendarItemAlertInfo *)v81 setMapKitHandle:v121];
            [(EKCalendarItemAlertInfo *)v81 setHasGeoLocationCoordinates:v113];
            -[EKCalendarItemAlertInfo setGeoLocationCoordinates:](v81, "setGeoLocationCoordinates:", v34, v31);
            [(EKCalendarItemAlertInfo *)v81 setHasOrganizerThatIsNotCurrentUser:HIDWORD(v112)];
            [(EKCalendarItemAlertInfo *)v81 setOrganizerEmailAddress:v119];
            [(EKCalendarItemAlertInfo *)v81 setStartLocationRouting:v120];
            [(EKCalendarItemAlertInfo *)v81 setLocationAddress:v123];
            [(EKCalendarItemAlertInfo *)v81 setTriggerType:v107];
            v82 = [v8 fireTime];
            [(EKCalendarItemAlertInfo *)v81 setFireDate:v82];

            [v105 addObject:v81];
          }
        }
        uint64_t v109 = [obj countByEnumeratingWithState:&v132 objects:v139 count:16];
      }
      while (v109);
    }

    [*(id *)(v1 + 40) _notifyAlarmsFired:v105];
    v83 = v104;
    if ([v104 count])
    {
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v84 = v104;
      uint64_t v85 = [v84 countByEnumeratingWithState:&v128 objects:v136 count:16];
      if (v85)
      {
        uint64_t v86 = v85;
        uint64_t v87 = *(void *)v129;
        do
        {
          for (uint64_t j = 0; j != v86; ++j)
          {
            if (*(void *)v129 != v87) {
              objc_enumerationMutation(v84);
            }
            [*(id *)(v1 + 32) deleteObject:*(void *)(*((void *)&v128 + 1) + 8 * j)];
          }
          uint64_t v86 = [v84 countByEnumeratingWithState:&v128 objects:v136 count:16];
        }
        while (v86);
      }

      v89 = *(void **)(v1 + 32);
      id v127 = 0;
      char v90 = [v89 save:&v127];
      id v91 = v127;
      if ((v90 & 1) == 0)
      {
        v92 = +[CALNLogSubsystem alarmEngine];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
          __29___EKAlarmEngine__timerFired__block_invoke_cold_1((uint64_t)v91, v92, v93, v94, v95, v96, v97, v98);
        }
      }
      v83 = v104;
    }

    uint64_t v2 = v103;
  }
}

void __45___EKAlarmEngine__timeDidChangeSignificantly__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 88);
  *(void *)(v1 + 88) = 0;
}

void __60___EKAlarmEngine__storeAlarms_nextScheduleLimit_eventStore___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __29___EKAlarmEngine__timerFired__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __29___EKAlarmEngine__timerFired__block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 entityID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2216BB000, a4, OS_LOG_TYPE_ERROR, "Could not fetch event from sideAlarm object. Somehow got an alarm for a non-event. rowID: %@", a1, 0xCu);
}

@end