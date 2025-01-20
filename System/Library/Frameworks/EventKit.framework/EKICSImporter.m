@interface EKICSImporter
+ (id)allowedImportFileTypes;
- (BOOL)_doITIPFileImport;
- (BOOL)_doImportFiles;
- (BOOL)_isAnyAttendeeAddressFrom:(id)a3 organizer:(id)a4 equivalentTo:(id)a5;
- (BOOL)_message:(id)a3 hasNewSelfOrganizedEventForCalendar:(id)a4;
- (BOOL)_separateICalFilesForITIP;
- (BOOL)_sortFilesByImportCalendar;
- (BOOL)asynchronous;
- (BOOL)importICalFiles;
- (BOOL)shouldImportContinueGivenDecision:(int)a3 eventsAffected:(unint64_t)a4;
- (EKCalendar)calendar;
- (EKEventStore)eventStore;
- (EKICSImporter)initWithFilePaths:(id)a3 calendar:(id)a4 options:(unint64_t)a5;
- (EKICSImporter)initWithFilePaths:(id)a3 eventStore:(id)a4 options:(unint64_t)a5;
- (NSArray)importFilePaths;
- (NSError)importError;
- (NSMapTable)calendarToICalFiles;
- (NSMapTable)calendarToITIPFiles;
- (NSMapTable)calendarToVCalFiles;
- (NSMutableArray)filesWithReminders;
- (NSMutableArray)importedItems;
- (NSMutableArray)vCalFilesToImport;
- (NSMutableDictionary)iCalFilesToImport;
- (NSMutableDictionary)iTIPFiles;
- (NSMutableDictionary)nonITIPFiles;
- (NSMutableSet)existingEventIDs;
- (OS_dispatch_queue)async_queue;
- (id)_existingEventFromICSEvent:(id)a3 calendar:(id)a4;
- (id)_findBestEventFromEvents:(id)a3;
- (id)_findCalendarForExistingEvent:(id)a3;
- (id)_getImportedCalendarItems;
- (id)_initWithFilePaths:(id)a3 eventStore:(id)a4 calendar:(id)a5 options:(unint64_t)a6;
- (id)_matchingAttendeeAddressesFrom:(id)a3 organizer:(id)a4 inSource:(id)a5;
- (id)callbackQueue;
- (id)completionCallback;
- (id)eventFromDocument:(id)a3;
- (id)importDroppedReminders;
- (id)importFoundBackupFile;
- (id)importSetProgressAsIndeterminate;
- (id)importSetProgressValue;
- (id)infoForNewCalendarForFiles:(id)a3 forITIPFiles:(id)a4 nonITIPFiles:(id)a5;
- (id)makeDecision;
- (id)selectCalendar;
- (id)selectCalendarWithTitle:(id)a3 color:(id)a4 description:(id)a5 error:(id *)a6;
- (int)countReminders:(id)a3;
- (unint64_t)_separateFilesForImport:(id)a3;
- (unint64_t)droppedReminderCount;
- (unint64_t)numInvalidEvents;
- (unint64_t)options;
- (void)_createImportHandle;
- (void)_importWithCompletion:(id)a3;
- (void)_separateICalFilesForITIP;
- (void)_sortFilesByImportCalendar;
- (void)asyncImportWithCompletion:(id)a3;
- (void)callCompletionWithSuccess:(BOOL)a3;
- (void)callImportDroppedRemindersCallbackIfThereWereReminders;
- (void)importFoundBackupFile:(id)a3;
- (void)setAsync_queue:(id)a3;
- (void)setAsynchronous:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setCalendarToICalFiles:(id)a3;
- (void)setCalendarToITIPFiles:(id)a3;
- (void)setCalendarToVCalFiles:(id)a3;
- (void)setCompletionCallback:(id)a3;
- (void)setDroppedReminderCount:(unint64_t)a3;
- (void)setEventStore:(id)a3;
- (void)setExistingEventIDs:(id)a3;
- (void)setFilesWithReminders:(id)a3;
- (void)setICalFilesToImport:(id)a3;
- (void)setITIPFiles:(id)a3;
- (void)setImportDroppedReminders:(id)a3;
- (void)setImportError:(id)a3;
- (void)setImportFoundBackupFile:(id)a3;
- (void)setImportProgressAsIndeterminate;
- (void)setImportSetProgressAsIndeterminate:(id)a3;
- (void)setImportSetProgressValue:(id)a3;
- (void)setImportedItems:(id)a3;
- (void)setMakeDecision:(id)a3;
- (void)setNonITIPFiles:(id)a3;
- (void)setNumInvalidEvents:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSelectCalendar:(id)a3;
- (void)setVCalFilesToImport:(id)a3;
- (void)syncImportWithCompletion:(id)a3;
@end

@implementation EKICSImporter

+ (id)allowedImportFileTypes
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.ical.ics"];
  v3 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", @"com.apple.ical.vcs", v2);
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.ical.backup-package"];
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void)_createImportHandle
{
  if (_createImportHandle_onceToken != -1) {
    dispatch_once(&_createImportHandle_onceToken, &__block_literal_global_36);
  }
}

uint64_t __36__EKICSImporter__createImportHandle__block_invoke()
{
  os_log_t v0 = os_log_create(ekSubSystem, "ICSImport");
  uint64_t v1 = EKICSImportHandle;
  EKICSImportHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (EKICSImporter)initWithFilePaths:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  return (EKICSImporter *)[(EKICSImporter *)self _initWithFilePaths:a3 eventStore:a4 calendar:0 options:a5];
}

- (EKICSImporter)initWithFilePaths:(id)a3 calendar:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 eventStore];
  v11 = [(EKICSImporter *)self _initWithFilePaths:v9 eventStore:v10 calendar:v8 options:a5];

  return v11;
}

- (id)_initWithFilePaths:(id)a3 eventStore:(id)a4 calendar:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)EKICSImporter;
  v14 = [(EKICSImporter *)&v30 init];
  v15 = v14;
  if (v14)
  {
    [(EKICSImporter *)v14 _createImportHandle];
    objc_storeStrong((id *)&v15->_importFilePaths, a3);
    objc_storeStrong((id *)&v15->_calendar, a5);
    objc_storeStrong((id *)&v15->_eventStore, a4);
    v15->_options = a6;
    uint64_t v16 = objc_opt_new();
    nonITIPFiles = v15->_nonITIPFiles;
    v15->_nonITIPFiles = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    iTIPFiles = v15->_iTIPFiles;
    v15->_iTIPFiles = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    iCalFilesToImport = v15->_iCalFilesToImport;
    v15->_iCalFilesToImport = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    existingEventIDs = v15->_existingEventIDs;
    v15->_existingEventIDs = (NSMutableSet *)v22;

    uint64_t v24 = objc_opt_new();
    vCalFilesToImport = v15->_vCalFilesToImport;
    v15->_vCalFilesToImport = (NSMutableArray *)v24;

    uint64_t v26 = objc_opt_new();
    calendarToITIPFiles = v15->_calendarToITIPFiles;
    v15->_calendarToITIPFiles = (NSMapTable *)v26;

    importError = v15->_importError;
    v15->_importError = 0;
  }
  return v15;
}

- (void)asyncImportWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_create("com.apple.EventKit.ICSImporter", v5);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__EKICSImporter_asyncImportWithCompletion___block_invoke;
  v8[3] = &unk_1E5B96BA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __43__EKICSImporter_asyncImportWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAsynchronous:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _importWithCompletion:v3];
}

- (void)syncImportWithCompletion:(id)a3
{
  id v4 = a3;
  [(EKICSImporter *)self setAsynchronous:0];
  [(EKICSImporter *)self _importWithCompletion:v4];
}

- (void)_importWithCompletion:(id)a3
{
  id v4 = a3;
  [(EKICSImporter *)self setImportProgressAsIndeterminate];
  [(EKICSImporter *)self setCompletionCallback:v4];

  v5 = [(EKICSImporter *)self importFilePaths];
  unint64_t v6 = [(EKICSImporter *)self _separateFilesForImport:v5];

  if (v6)
  {
    if (v6 != 2)
    {
      if (v6 != 1) {
        return;
      }
      id v7 = EKICSImportHandle;
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "We completed the import during the file separation phase.", v11, 2u);
      }
      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
      -[EKICSImporter _importWithCompletion:]();
    }
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (![(EKICSImporter *)self importICalFiles]) {
    goto LABEL_11;
  }
  if (![(NSMutableArray *)self->_importedItems count])
  {
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
      -[EKICSImporter _importWithCompletion:]();
    }
    id v9 = [(EKICSImporter *)self importError];

    if (!v9)
    {
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:9 userInfo:0];
      [(EKICSImporter *)self setImportError:v10];
    }
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v8 = 1;
LABEL_12:
  [(EKICSImporter *)self callCompletionWithSuccess:v8];
}

- (BOOL)importICalFiles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)EKICSImportHandle;
  if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = [(EKICSImporter *)self iCalFilesToImport];
    unint64_t v6 = [v5 allKeys];
    id v7 = [(EKICSImporter *)self vCalFilesToImport];
    uint64_t v8 = [(EKICSImporter *)self calendar];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_DEFAULT, "Importing iCal files (%@) and vCal files (%@) to calendar %@", (uint8_t *)&v11, 0x20u);
  }
  BOOL v9 = [(EKICSImporter *)self _separateICalFilesForITIP];
  if (v9)
  {
    BOOL v9 = [(EKICSImporter *)self _sortFilesByImportCalendar];
    if (v9)
    {
      BOOL v9 = [(EKICSImporter *)self _doImportFiles];
      if (v9)
      {
        [(EKICSImporter *)self callImportDroppedRemindersCallbackIfThereWereReminders];
        LOBYTE(v9) = 1;
      }
    }
  }
  return v9;
}

- (BOOL)_sortFilesByImportCalendar
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  v90 = [(EKICSImporter *)self calendar];
  v2 = EKICSImportHandle;
  BOOL v3 = os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT);
  if (v90)
  {
    if (v3)
    {
      id v4 = v2;
      v5 = [v90 objectID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_DEFAULT, "Importing files to user-specified calendar with identifier(%@)", (uint8_t *)&buf, 0xCu);
    }
    unint64_t v6 = (void *)MEMORY[0x1E4F57730];
    id v7 = [(EKICSImporter *)self iTIPFiles];
    uint64_t v8 = [v7 allKeys];
    [v6 addArray:v8 withKey:v90 toStrongTableOfArrays:&self->_calendarToITIPFiles];

    BOOL v9 = (void *)MEMORY[0x1E4F57730];
    v10 = [(EKICSImporter *)self nonITIPFiles];
    int v11 = [v10 allKeys];
    [v9 addArray:v11 withKey:v90 toStrongTableOfArrays:&self->_calendarToICalFiles];

    id v12 = (void *)MEMORY[0x1E4F57730];
    __int16 v13 = [(EKICSImporter *)self vCalFilesToImport];
    [v12 addArray:v13 withKey:v90 toStrongTableOfArrays:&self->_calendarToVCalFiles];

    goto LABEL_5;
  }
  if (v3)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "No destination calendar provided.  Will attempt to choose appropriate calendars.", (uint8_t *)&buf, 2u);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__10;
  v124 = __Block_byref_object_dispose__10;
  id v125 = 0;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __43__EKICSImporter__sortFilesByImportCalendar__block_invoke;
  v114[3] = &unk_1E5B97CE8;
  v114[4] = self;
  v114[5] = &buf;
  v88 = (uint64_t (**)(void, void))MEMORY[0x1A6266730](v114);
  __int16 v15 = [(EKICSImporter *)self iTIPFiles];
  p_calendarToITIPFiles = (id *)&self->_calendarToITIPFiles;
  int v16 = ((uint64_t (**)(void, void *))v88)[2](v88, v15);

  if (!v16)
  {
    v58 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:10 userInfo:0];
    [(EKICSImporter *)self setImportError:v58];

    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
      -[EKICSImporter _sortFilesByImportCalendar]();
    }
    goto LABEL_90;
  }
  id v17 = *p_calendarToITIPFiles;
  uint64_t v18 = self;
  if (*p_calendarToITIPFiles)
  {
    id v113 = 0;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    obuint64_t j = v17;
    uint64_t v19 = [obj countByEnumeratingWithState:&v109 objects:v120 count:16];
    if (v19)
    {
      uint64_t v94 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v110 != v94) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v109 + 1) + 8 * i);
          uint64_t v22 = [v21 source];
          v23 = [v21 constraints];
          int v24 = [v23 requiresOutgoingInvitationsInDefaultCalendar];

          if (v24)
          {
            v25 = [v22 calendarsForEntityType:0];
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v26 = v25;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v105 objects:v119 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v106;
LABEL_18:
              uint64_t v29 = 0;
              while (1)
              {
                if (*(void *)v106 != v28) {
                  objc_enumerationMutation(v26);
                }
                objc_super v30 = *(void **)(*((void *)&v105 + 1) + 8 * v29);
                if ([v30 isDefaultSchedulingCalendar]) {
                  break;
                }
                if (v27 == ++v29)
                {
                  uint64_t v27 = [v26 countByEnumeratingWithState:&v105 objects:v119 count:16];
                  if (v27) {
                    goto LABEL_18;
                  }
                  goto LABEL_24;
                }
              }
              id v31 = v30;

              if (!v31) {
                goto LABEL_29;
              }
              v32 = [*p_calendarToITIPFiles objectForKey:v21];
              [MEMORY[0x1E4F57730] addArray:v32 withKey:v31 toStrongTableOfArrays:p_calendarToITIPFiles];
              v33 = [v31 objectID];
              v34 = [v21 objectID];
              char v35 = [v33 isEqual:v34];

              if ((v35 & 1) == 0) {
                [MEMORY[0x1E4F57730] addObject:v21 toArray:&v113];
              }
            }
            else
            {
LABEL_24:

LABEL_29:
              v36 = EKICSImportHandle;
              if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v117 = 138412290;
                uint64_t v118 = (uint64_t)v22;
                _os_log_error_impl(&dword_1A4E47000, v36, OS_LOG_TYPE_ERROR, "%@ doesn't have a default calendar to put the items into.", v117, 0xCu);
              }
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v109 objects:v120 count:16];
      }
      while (v19);
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v37 = v113;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v101 objects:v116 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v102;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v102 != v39) {
            objc_enumerationMutation(v37);
          }
          [*p_calendarToITIPFiles removeObjectForKey:*(void *)(*((void *)&v101 + 1) + 8 * j)];
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v101 objects:v116 count:16];
      }
      while (v38);
    }

    uint64_t v18 = self;
  }
  v41 = [(EKICSImporter *)v18 nonITIPFiles];
  p_calendarToICalFiles = &v18->_calendarToICalFiles;
  char v42 = ((uint64_t (**)(void, void *))v88)[2](v88, v41);

  if ((v42 & 1) == 0)
  {
    v59 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:10 userInfo:0];
    [(EKICSImporter *)self setImportError:v59];

    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
      -[EKICSImporter _sortFilesByImportCalendar]();
    }
    goto LABEL_90;
  }
  v43 = [(EKICSImporter *)self vCalFilesToImport];
  BOOL v44 = [v43 count] == 0;

  if (!v44)
  {
    v45 = (void *)MEMORY[0x1E4F57730];
    v46 = [(EKICSImporter *)self vCalFilesToImport];
    [v45 addArray:v46 toArray:*((void *)&buf + 1) + 40];
  }
  if (![*(id *)(*((void *)&buf + 1) + 40) count]) {
    goto LABEL_89;
  }
  v47 = [(EKICSImporter *)self selectCalendar];
  BOOL v48 = v47 == 0;

  v49 = EKICSImportHandle;
  if (v48)
  {
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v117 = 0;
      _os_log_impl(&dword_1A4E47000, v49, OS_LOG_TYPE_DEFAULT, "We don't know what calendar to import some files to and we don't have a callback for Calendar selection.  Bailing.", v117, 2u);
    }
    v60 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:3 userInfo:0];
    [(EKICSImporter *)self setImportError:v60];

    goto LABEL_90;
  }
  v50 = (id)EKICSImportHandle;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = [*(id *)(*((void *)&buf + 1) + 40) count];
    *(_DWORD *)v117 = 134217984;
    uint64_t v118 = v51;
    _os_log_impl(&dword_1A4E47000, v50, OS_LOG_TYPE_DEFAULT, "No destination calendar provided. We need to ask the user what calendar to import to for %lu files.", v117, 0xCu);
  }

  uint64_t v52 = *(void *)(*((void *)&buf + 1) + 40);
  v53 = [(EKICSImporter *)self iTIPFiles];
  v54 = [(EKICSImporter *)self nonITIPFiles];
  v89 = [(EKICSImporter *)self infoForNewCalendarForFiles:v52 forITIPFiles:v53 nonITIPFiles:v54];

  if (!v89)
  {
    v86 = 0;
    v87 = 0;
LABEL_62:
    v62 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "firstObject", v55);
    v63 = [v62 lastPathComponent];
    uint64_t v64 = [v63 stringByDeletingPathExtension];

    v55 = (void *)v64;
    goto LABEL_63;
  }
  v56 = objc_msgSend(v89, "x_apple_calendar_color");
  v57 = v56;
  if (v56)
  {
    [v56 red];
    [v57 green];
    [v57 blue];
    v86 = CalColorStringRepresentation();
  }
  else
  {
    v86 = 0;
  }
  uint64_t v61 = objc_msgSend(v89, "x_wr_calname");
  v87 = objc_msgSend(v89, "x_wr_caldesc");

  v55 = (void *)v61;
  if (!v61) {
    goto LABEL_62;
  }
LABEL_63:
  uint64_t v100 = 0;
  v84 = v55;
  v65 = -[EKICSImporter selectCalendarWithTitle:color:description:error:](self, "selectCalendarWithTitle:color:description:error:");
  id v85 = 0;
  if (v85) {
    BOOL v66 = 1;
  }
  else {
    BOOL v66 = v65 == 0;
  }
  int v67 = !v66;
  int v83 = v67;
  if (v66)
  {
    v81 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:3 userInfo:0];
    [(EKICSImporter *)self setImportError:v81];

    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
      -[EKICSImporter _sortFilesByImportCalendar]();
    }
  }
  else
  {
    v68 = (id)EKICSImportHandle;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = [v65 objectID];
      *(_DWORD *)v117 = 138412290;
      uint64_t v118 = (uint64_t)v69;
      _os_log_impl(&dword_1A4E47000, v68, OS_LOG_TYPE_DEFAULT, "User selected calendar: UID( %@)", v117, 0xCu);
    }
    v70 = EKICSImportHandle;
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v117 = 138412290;
      uint64_t v118 = (uint64_t)v65;
      _os_log_impl(&dword_1A4E47000, v70, OS_LOG_TYPE_DEFAULT, "User selected calendar %@", v117, 0xCu);
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v71 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v72 = [v71 countByEnumeratingWithState:&v96 objects:v115 count:16];
    if (v72)
    {
      uint64_t v73 = *(void *)v97;
      do
      {
        for (uint64_t k = 0; k != v72; ++k)
        {
          if (*(void *)v97 != v73) {
            objc_enumerationMutation(v71);
          }
          uint64_t v75 = *(void *)(*((void *)&v96 + 1) + 8 * k);
          v76 = [(EKICSImporter *)self iTIPFiles];
          v77 = [v76 objectForKeyedSubscript:v75];

          p_calendarToVCalFiles = &self->_calendarToITIPFiles;
          if (!v77)
          {
            v79 = [(EKICSImporter *)self nonITIPFiles];
            v80 = [v79 objectForKeyedSubscript:v75];

            if (v80) {
              p_calendarToVCalFiles = p_calendarToICalFiles;
            }
            else {
              p_calendarToVCalFiles = &self->_calendarToVCalFiles;
            }
          }
          [MEMORY[0x1E4F57730] addItem:v75 withKey:v65 toStrongTableOfArrays:p_calendarToVCalFiles];
        }
        uint64_t v72 = [v71 countByEnumeratingWithState:&v96 objects:v115 count:16];
      }
      while (v72);
    }
  }
  if (!v83)
  {
LABEL_90:

    _Block_object_dispose(&buf, 8);
    BOOL v14 = 0;
    goto LABEL_91;
  }
LABEL_89:

  _Block_object_dispose(&buf, 8);
LABEL_5:
  BOOL v14 = 1;
LABEL_91:

  return v14;
}

uint64_t __43__EKICSImporter__sortFilesByImportCalendar__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v5 objectForKeyedSubscript:v10];
        id v12 = [*(id *)(a1 + 32) _findCalendarForExistingEvent:v11];
        if (v12) {
          [MEMORY[0x1E4F57730] addItem:v10 withKey:v12 toStrongTableOfArrays:a3];
        }
        else {
          [MEMORY[0x1E4F57730] addObject:v10 toArray:*(void *)(*(void *)(a1 + 40) + 8) + 40];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return 1;
}

- (id)infoForNewCalendarForFiles:(id)a3 forITIPFiles:(id)a4 nonITIPFiles:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v28 = a4;
  id v27 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v31;
    id v12 = v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        long long v15 = [v12 objectForKeyedSubscript:v14];
        long long v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v27 objectForKeyedSubscript:v14];
        }
        uint64_t v18 = v17;

        if (v18) {
          BOOL v19 = v10 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (v19)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v20 = [v18 calendar];
          v21 = [v20 components];

          uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v35;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v35 != v24) {
                  objc_enumerationMutation(v21);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {

                  uint64_t v10 = [v18 calendar];
                  goto LABEL_24;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v39 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = 0;
LABEL_24:
          id v12 = v28;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
    id v12 = v28;
  }

  return v10;
}

- (id)_getImportedCalendarItems
{
  return self->_importedItems;
}

- (unint64_t)_separateFilesForImport:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    id v26 = self;
    id v27 = v4;
    p_iCalFilesToImport = &self->_iCalFilesToImport;
    p_vCalFilesToImport = &self->_vCalFilesToImport;
    unint64_t v8 = 0x1E4F1C000uLL;
    unint64_t v9 = 0x1E4FB7000uLL;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v28 = v6;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
      if ([v11 isPathToBackupFile]) {
        break;
      }
      if ([v11 isPathToICalData])
      {
        id v12 = [*(id *)(v8 + 2488) dataWithContentsOfFile:v11];
        __int16 v13 = (void *)[objc_alloc(*(Class *)(v9 + 3912)) initWithData:v12 options:0 error:0];
        uint64_t v14 = [v13 calendar];
        unint64_t v15 = v9;
        if (v14)
        {
          long long v16 = (void *)v14;
          [MEMORY[0x1E4F57730] setValue:v13 withKey:v11 inDictionary:p_iCalFilesToImport];

          unint64_t v9 = v15;
        }
        else
        {
          id v17 = (void *)[objc_alloc(*(Class *)(v9 + 3912)) initWithData:v12 options:1 error:0];
          uint64_t v18 = [v17 calendar];
          BOOL v19 = [v18 version];
          int v20 = [v19 isEqualToString:@"1.0"];

          v21 = EKICSImportHandle;
          if (!v20)
          {
            if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
              -[EKICSImporter _separateFilesForImport:]();
            }
            uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:0 userInfo:0];
            [(EKICSImporter *)v26 setImportError:v24];

            unint64_t v22 = 2;
            id v4 = v27;
LABEL_30:

            goto LABEL_31;
          }
          id v4 = v27;
          if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1A4E47000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to open version 1.0 .ics file.  Will treat it as a vcs file and import.", buf, 2u);
          }
          [MEMORY[0x1E4F57730] addObject:v11 toArray:p_vCalFilesToImport];

          uint64_t v6 = v28;
          unint64_t v8 = 0x1E4F1C000;
          unint64_t v9 = 0x1E4FB7000;
        }
      }
      else if ([v11 isPathToVCalData])
      {
        [MEMORY[0x1E4F57730] addObject:v11 toArray:p_vCalFilesToImport];
      }
      if (v6 == ++v10)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    if ((unint64_t)[v4 count] >= 2
      && os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKICSImporter _separateFilesForImport:]();
    }
    uint64_t v23 = [(EKICSImporter *)v26 importFoundBackupFile];

    if (v23)
    {
      id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
      [(EKICSImporter *)v26 importFoundBackupFile:v12];
      unint64_t v22 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
        -[EKICSImporter _separateFilesForImport:]();
      }
      unint64_t v22 = 2;
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:2 userInfo:0];
      [(EKICSImporter *)v26 setImportError:v12];
    }
    goto LABEL_30;
  }
LABEL_18:
  unint64_t v22 = 0;
LABEL_31:

  return v22;
}

- (BOOL)_separateICalFilesForITIP
{
  v2 = self;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = self->_iCalFilesToImport;
  uint64_t v33 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v37;
    p_filesWithReminders = &v2->_filesWithReminders;
    p_iTIPFiles = &v2->_iTIPFiles;
    p_nonITIPFiles = &v2->_nonITIPFiles;
    unint64_t v3 = 0x1E4F57000uLL;
    long long v31 = v2;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v6 = [(NSMutableDictionary *)v2->_iCalFilesToImport objectForKeyedSubscript:v5];
        uint64_t v7 = [v6 calendar];
        if (!v7)
        {
          uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:0 userInfo:0];
          [(EKICSImporter *)v2 setImportError:v24];

          v25 = EKICSImportHandle;
          if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v46 = v5;
            _os_log_impl(&dword_1A4E47000, v25, OS_LOG_TYPE_DEFAULT, "File %@ has no VCALENDAR.", buf, 0xCu);
          }
          goto LABEL_35;
        }
        int v8 = [(EKICSImporter *)v2 countReminders:v7];
        if (v8 >= 1)
        {
          unsigned int v9 = v8;
          [*(id *)(v3 + 1840) addObject:v5 toArray:p_filesWithReminders];
          v2->_droppedReminderCount += v9;
        }
        if ([v7 method] == 1 || !objc_msgSend(v7, "method"))
        {
          long long v35 = v6;
          __int16 v13 = EKICSImportHandle;
          if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v46 = v5;
            _os_log_impl(&dword_1A4E47000, v13, OS_LOG_TYPE_DEFAULT, "File %@ has method PUBLISH or NONE.", buf, 0xCu);
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v14 = [v7 components];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            int v17 = 0;
            uint64_t v18 = *(void *)v41;
LABEL_17:
            uint64_t v19 = 0;
            while (1)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(v14);
              }
              objc_opt_class();
              int isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass & v17) {
                break;
              }
              v17 |= isKindOfClass;
              if (v16 == ++v19)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:buf count:16];
                if (v16) {
                  goto LABEL_17;
                }

                id v12 = p_nonITIPFiles;
                uint64_t v6 = v35;
                v2 = v31;
                unint64_t v3 = 0x1E4F57000;
                if ((v17 & 1) == 0) {
                  goto LABEL_26;
                }
                goto LABEL_28;
              }
            }
          }

          v2 = v31;
          uint64_t v6 = v35;
          unint64_t v3 = 0x1E4F57000uLL;
LABEL_26:
          v21 = [(EKICSImporter *)v2 makeDecision];

          id v12 = p_nonITIPFiles;
          if (v21)
          {
            BOOL v22 = -[EKICSImporter shouldImportContinueGivenDecision:eventsAffected:](v2, "shouldImportContinueGivenDecision:eventsAffected:", 0, 1, p_nonITIPFiles);
            id v12 = p_nonITIPFiles;
            if (!v22)
            {
              [(EKICSImporter *)v2 setNumInvalidEvents:[(EKICSImporter *)v2 numInvalidEvents] + 1];
              id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:5 userInfo:0];
              [(EKICSImporter *)v2 setImportError:v26];

              if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
                -[EKICSImporter _separateICalFilesForITIP]();
              }
LABEL_35:

              BOOL v23 = 0;
              goto LABEL_36;
            }
          }
        }
        else
        {
          uint64_t v10 = EKICSImportHandle;
          BOOL v11 = os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT);
          id v12 = p_iTIPFiles;
          if (v11)
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v46 = v5;
            _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_DEFAULT, "File %@ is an iTIP message.", buf, 0xCu);
            id v12 = p_iTIPFiles;
          }
        }
LABEL_28:
        [*(id *)(v3 + 1840) setValue:v6 withKey:v5 inDictionary:v12];
      }
      uint64_t v33 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_36:

  return v23;
}

- (BOOL)_message:(id)a3 hasNewSelfOrganizedEventForCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 document];
  unsigned int v9 = [(EKICSImporter *)self _findCalendarForExistingEvent:v8];

  if (v9)
  {
    uint64_t v10 = [v6 event];
    BOOL v11 = [v10 organizer];

    id v12 = [v11 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v13 = [v7 ownerIdentityAddress];
      uint64_t v14 = [v11 value];
      char v15 = [v13 isEqual:v14];

      if (v15) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    int v17 = [v7 ownerIdentityEmail];
    uint64_t v18 = [v11 emailAddress];
    char v19 = [v17 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      int v20 = [v7 ownerIdentityPhoneNumber];
      v21 = [v11 phoneNumber];
      char v16 = [v20 isEqualToString:v21];

      goto LABEL_10;
    }
LABEL_8:
    char v16 = 1;
LABEL_10:

    goto LABEL_11;
  }
  char v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)_doITIPFileImport
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(NSMapTable *)self->_calendarToITIPFiles count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = [(EKICSImporter *)self calendarToITIPFiles];
    uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v26;
      uint64_t v3 = *MEMORY[0x1E4F574E8] | *MEMORY[0x1E4F574D0];
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = v4;
          uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * v4);
          id v6 = [(EKICSImporter *)self calendarToITIPFiles];
          id v7 = [v6 objectForKey:v5];

          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v22;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v22 != v11) {
                  objc_enumerationMutation(v8);
                }
                __int16 v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(*((void *)&v21 + 1) + 8 * v12)];
                uint64_t v14 = [(EKICSImporter *)self eventStore];
                char v15 = [v14 importICSData:v13 intoCalendar:v5 options:v3 | self->_options];

                if (v15) {
                  [(NSMutableArray *)self->_importedItems addObjectsFromArray:v15];
                }

                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v10);
          }

          uint64_t v4 = v20 + 1;
        }
        while (v20 + 1 != v19);
        uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v19);
    }
  }
  return 0;
}

- (BOOL)_doImportFiles
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  importedItems = self->_importedItems;
  self->_importedItems = v3;

  if (![(EKICSImporter *)self _doITIPFileImport])
  {
    uint64_t v5 = [(EKICSImporter *)self iTIPFiles];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = (void *)EKICSImportHandle;
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        uint64_t v9 = [(EKICSImporter *)self iTIPFiles];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v94 = v9;
        _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_DEFAULT, "We did not import the iTip files [%@].", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(EKICSImporter *)self calendarToVCalFiles];
  uint64_t v11 = [v10 count];

  uint64_t v61 = self;
  if (!v11) {
    goto LABEL_34;
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = [(EKICSImporter *)self calendarToVCalFiles];
  uint64_t v59 = [obj countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v59)
  {
    uint64_t v57 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v84 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        char v16 = [(EKICSImporter *)self calendarToVCalFiles];
        int v17 = [v16 objectForKey:v15];

        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v79 objects:v91 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v80;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v80 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(*((void *)&v79 + 1) + 8 * j)];
              if (v23)
              {
                [v13 addObject:v23];
                [v12 addObject:v15];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v79 objects:v91 count:16];
          }
          while (v20);
        }

        self = v61;
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v83 objects:v92 count:16];
    }
    while (v59);
  }

  long long v24 = [(EKICSImporter *)self eventStore];
  id v78 = 0;
  long long v25 = [v24 importVCSData:v13 intoCalendars:v12 error:&v78];
  id v26 = v78;

  if (!v25)
  {
    if (v26)
    {
      [(EKICSImporter *)self setImportError:v26];
    }
    else
    {
      long long v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:10 userInfo:0];
      [(EKICSImporter *)self setImportError:v27];
    }
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v28 = v25;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v74 objects:v90 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v75 != v31) {
          objc_enumerationMutation(v28);
        }
        [(NSMutableArray *)self->_importedItems addObjectsFromArray:*(void *)(*((void *)&v74 + 1) + 8 * k)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v74 objects:v90 count:16];
    }
    while (v30);
  }

  if (v25)
  {
LABEL_34:
    uint64_t v33 = [(EKICSImporter *)self calendarToICalFiles];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      long long v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
      long long v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obja = [(EKICSImporter *)self calendarToICalFiles];
      uint64_t v60 = [obja countByEnumeratingWithState:&v70 objects:v89 count:16];
      if (v60)
      {
        uint64_t v58 = *(void *)v71;
        do
        {
          for (uint64_t m = 0; m != v60; ++m)
          {
            if (*(void *)v71 != v58) {
              objc_enumerationMutation(obja);
            }
            uint64_t v38 = *(void *)(*((void *)&v70 + 1) + 8 * m);
            long long v39 = [(EKICSImporter *)self calendarToICalFiles];
            long long v40 = [v39 objectForKey:v38];

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v41 = v40;
            uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v88 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = *(void *)v67;
              do
              {
                for (uint64_t n = 0; n != v43; ++n)
                {
                  if (*(void *)v67 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v46 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(*((void *)&v66 + 1) + 8 * n)];
                  if (v46)
                  {
                    [v36 addObject:v46];
                    [v35 addObject:v38];
                  }
                }
                uint64_t v43 = [v41 countByEnumeratingWithState:&v66 objects:v88 count:16];
              }
              while (v43);
            }

            self = v61;
          }
          uint64_t v60 = [obja countByEnumeratingWithState:&v70 objects:v89 count:16];
        }
        while (v60);
      }

      long long v25 = [(EKICSImporter *)self eventStore];
      uint64_t v47 = [v25 importICSData:v36 intoCalendars:v35 options:*MEMORY[0x1E4F574D0] | self->_options];

      LOBYTE(v25) = v47 != 0;
      if (!v47)
      {
        BOOL v48 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKICSImportErrorDomain" code:10 userInfo:0];
        [(EKICSImporter *)self setImportError:v48];
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v49 = v47;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v62 objects:v87 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v63;
        do
        {
          for (iuint64_t i = 0; ii != v51; ++ii)
          {
            if (*(void *)v63 != v52) {
              objc_enumerationMutation(v49);
            }
            [(NSMutableArray *)self->_importedItems addObjectsFromArray:*(void *)(*((void *)&v62 + 1) + 8 * ii)];
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v62 objects:v87 count:16];
        }
        while (v51);
      }
    }
    else
    {
      LOBYTE(v25) = 1;
    }
  }
  return (char)v25;
}

- (id)_existingEventFromICSEvent:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uid];
  double v9 = *MEMORY[0x1E4F57888];
  uint64_t v10 = objc_msgSend(v6, "recurrence_id");

  double v11 = v9;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v6, "recurrence_id");
    double v11 = COERCE_DOUBLE(CalCreateDateTimeFromICSDate());

    CalDateTimeRelease();
  }
  if (v11 != v9 && v11 != 0.0)
  {
    uint64_t v13 = CalGetRecurrenceUIDFromRealUID();

    id v8 = (void *)v13;
  }
  if ([v8 length])
  {
    uint64_t v14 = [(EKEventStore *)self->_eventStore eventsWithExternalIdentifier:v8 inCalendars:0];
    uint64_t v15 = [(EKICSImporter *)self _findBestEventFromEvents:v14];
    if (v15)
    {
      char v16 = [(EKICSImporter *)self existingEventIDs];
      int v17 = [v15 objectID];
      [v16 addObject:v17];

      id v18 = v15;
    }
    else
    {
      uint64_t v20 = objc_msgSend(v6, "recurrence_id");

      if (!v20)
      {
        id v18 = 0;
        goto LABEL_10;
      }
      uint64_t v21 = [v6 uid];

      if (![v21 length])
      {
        id v18 = 0;
        id v8 = v21;
        goto LABEL_10;
      }
      uint64_t v22 = [(EKEventStore *)self->_eventStore eventsWithExternalIdentifier:v21 inCalendars:0];

      id v18 = [(EKICSImporter *)self _findBestEventFromEvents:v22];
      id v8 = v21;
      uint64_t v14 = (void *)v22;
    }

LABEL_10:
    goto LABEL_12;
  }
  id v18 = 0;
LABEL_12:

  return v18;
}

- (id)_findBestEventFromEvents:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_24;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      double v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      uint64_t v10 = objc_msgSend(v9, "calendar", (void)v17);
      if ([v10 allowsContentModifications])
      {
        double v11 = [v10 source];
        if (([v11 isEnabledForEvents] & 1) == 0) {
          goto LABEL_10;
        }
        uint64_t v12 = [v10 source];
        if ([v12 isDelegate])
        {

LABEL_10:
          goto LABEL_11;
        }
        if ([v10 sharingStatus] == 2)
        {
          int v13 = [v10 allowsScheduling];

          if (!v13) {
            goto LABEL_11;
          }
        }
        else
        {
        }
        if ([v9 isSelfOrganized])
        {
          id v15 = v9;

          id v6 = v15;
          goto LABEL_24;
        }
        if (!v6) {
          id v6 = v9;
        }
      }
LABEL_11:

      ++v8;
    }
    while (v5 != v8);
    uint64_t v14 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    uint64_t v5 = v14;
  }
  while (v14);
LABEL_24:

  return v6;
}

- (id)_findCalendarForExistingEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKICSImporter *)self eventFromDocument:v4];
  id v6 = [v4 calendar];

  uint64_t v7 = [(EKICSImporter *)self _existingEventFromICSEvent:v5 calendar:v6];

  if (v7)
  {
    uint64_t v8 = [v7 calendar];
    double v9 = EKICSImportHandle;
    BOOL v10 = os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        double v11 = v9;
        uint64_t v12 = [v8 objectID];
        int v14 = 138412290;
        id v15 = v12;
        _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "Importing pre-existing event.  Will stay on current calendar: objectID(%@)", (uint8_t *)&v14, 0xCu);
      }
    }
    else if (v10)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "Importing a pre-existing event but there were no eligible writeable calendars.", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_isAnyAttendeeAddressFrom:(id)a3 organizer:(id)a4 equivalentTo:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (v9)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__EKICSImporter__isAnyAttendeeAddressFrom_organizer_equivalentTo___block_invoke;
    v23[3] = &unk_1E5B97D10;
    id v24 = v9;
    double v11 = (uint64_t (**)(void, void))MEMORY[0x1A6266730](v23);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          if (v11[2](v11, *(void *)(*((void *)&v19 + 1) + 8 * i)))
          {

            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    if (((uint64_t (**)(void, id))v11)[2](v11, v8)) {
LABEL_13:
    }
      BOOL v17 = 1;
    else {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

uint64_t __66__EKICSImporter__isAnyAttendeeAddressFrom_organizer_equivalentTo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v5 = [v3 value];
  if (([*(id *)(a1 + 32) compareToLocalURL:v5] & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v4 emailAddress];
    LOBYTE(v6) = objc_msgSend(v6, "cal_isEquivalentToEmailAddress:", v7);

    if ((v6 & 1) == 0)
    {
      id v9 = *(void **)(a1 + 32);
      BOOL v10 = [v4 phoneNumber];
      LOBYTE(v9) = objc_msgSend(v9, "cal_isEquivalentToPhoneNumber:", v10);

      if (v9) {
        goto LABEL_5;
      }
LABEL_7:
      uint64_t v8 = 0;
      goto LABEL_8;
    }
  }

LABEL_5:
  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

- (id)_matchingAttendeeAddressesFrom:(id)a3 organizer:(id)a4 inSource:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  uint64_t v8 = [a5 ownerAddresses];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        if (v15) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __67__EKICSImporter__matchingAttendeeAddressesFrom_organizer_inSource___block_invoke;
  v33[3] = &unk_1E5B97D38;
  id v16 = v9;
  id v34 = v16;
  BOOL v17 = (void (**)(void, void))MEMORY[0x1A6266730](v33);
  id v32 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = v17[2](v17, *(void *)(*((void *)&v28 + 1) + 8 * j));
        if (v23) {
          [MEMORY[0x1E4F57730] addObject:v23 toSet:&v32];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v20);
  }

  id v24 = ((void (**)(void, id))v17)[2](v17, v27);
  if (v24) {
    [MEMORY[0x1E4F57730] addObject:v24 toSet:&v32];
  }
  id v25 = v32;

  return v25;
}

id __67__EKICSImporter__matchingAttendeeAddressesFrom_organizer_inSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  id v6 = [v4 value];
  id v7 = [v5 emailAddress];
  uint64_t v8 = [v5 phoneNumber];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v10)
  {
    int v14 = 1;
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      v2 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v6, "compareToLocalURL:", v2, (void)v17))
      {
        id v15 = [v6 absoluteString];
LABEL_17:
        v2 = v15;
        int v14 = 0;
        goto LABEL_18;
      }
      if (objc_msgSend(v2, "cal_isEquivalentToEmailAddress:", v7))
      {
        id v15 = v7;
        goto LABEL_17;
      }
      if (objc_msgSend(v2, "cal_isEquivalentToPhoneNumber:", v8))
      {
        id v15 = v8;
        goto LABEL_17;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    int v14 = 1;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_18:

  if (v14) {
LABEL_19:
  }
    v2 = 0;

  return v2;
}

- (id)eventFromDocument:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 calendar];
  id v4 = [v3 componentKeys];
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v3 componentForKey:v5];

    if (!v6)
    {
      uint64_t v13 = [v4 objectAtIndexedSubscript:0];
      int v14 = [v3 componentOccurrencesForKey:v13];

      if (![v14 count])
      {

        id v6 = 0;
        goto LABEL_14;
      }
      id v6 = [v14 objectAtIndexedSubscript:0];

      if (!v6) {
        goto LABEL_14;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = (void *)EKICSImportHandle;
      if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v7;
        int v16 = 138412290;
        id v17 = (id)objc_opt_class();
        id v9 = v17;
        _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_DEFAULT, "Expected an event but got %@", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v10 = 0;
      goto LABEL_15;
    }
LABEL_14:
    id v6 = v6;
    uint64_t v10 = v6;
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v11 = (void *)EKICSImportHandle;
  if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    int v16 = 134217984;
    id v17 = (id)[v4 count];
    _os_log_impl(&dword_1A4E47000, v12, OS_LOG_TYPE_DEFAULT, "ICS calendar expected to contain a single item, but instead it contained %lu", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v10 = 0;
LABEL_16:

  return v10;
}

- (int)countReminders:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 componentKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [v3 componentForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        objc_opt_class();
        v7 += objc_opt_isKindOfClass() & 1;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)callbackQueue
{
  async_queue = self->_async_queue;
  if (async_queue)
  {
    id v3 = async_queue;
  }
  else
  {
    id v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }

  return v3;
}

- (void)callCompletionWithSuccess:(BOOL)a3
{
  uint64_t v5 = [(EKICSImporter *)self _getImportedCalendarItems];
  unint64_t v6 = [(EKICSImporter *)self numInvalidEvents];
  int v7 = [(EKICSImporter *)self importError];
  if (!a3)
  {
    uint64_t v8 = (void *)EKICSImportHandle;
    if (os_log_type_enabled((os_log_t)EKICSImportHandle, OS_LOG_TYPE_ERROR)) {
      [(EKICSImporter *)v8 callCompletionWithSuccess:(uint64_t)v7];
    }
  }
  id v9 = [(EKICSImporter *)self completionCallback];

  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__EKICSImporter_callCompletionWithSuccess___block_invoke;
    v12[3] = &unk_1E5B97D60;
    v12[4] = self;
    BOOL v16 = a3;
    id v13 = v5;
    unint64_t v15 = v6;
    id v14 = v7;
    uint64_t v10 = (void (**)(void))MEMORY[0x1A6266730](v12);
    if ([(EKICSImporter *)self asynchronous])
    {
      uint64_t v11 = [(EKICSImporter *)self callbackQueue];
      dispatch_sync(v11, v10);
    }
    else
    {
      v10[2](v10);
    }
    [(EKICSImporter *)self setCompletionCallback:0];
  }
}

void __43__EKICSImporter_callCompletionWithSuccess___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionCallback];
  (*((void (**)(id, void, void, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (id)selectCalendarWithTitle:(id)a3 color:(id)a4 description:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__10;
  long long v38 = __Block_byref_object_dispose__10;
  id v39 = 0;
  id v13 = [(EKICSImporter *)self selectCalendar];

  if (v13)
  {
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    long long v31 = __Block_byref_object_copy__10;
    id v32 = __Block_byref_object_dispose__10;
    id v33 = 0;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __65__EKICSImporter_selectCalendarWithTitle_color_description_error___block_invoke;
    uint64_t v21 = &unk_1E5B97D88;
    uint64_t v26 = &v34;
    uint64_t v22 = self;
    id v23 = v10;
    id v24 = v11;
    id v25 = v12;
    id v27 = &v28;
    id v14 = (void (**)(void))MEMORY[0x1A6266730](&v18);
    if ([(EKICSImporter *)self asynchronous])
    {
      unint64_t v15 = [(EKICSImporter *)self callbackQueue];
      dispatch_sync(v15, v14);
    }
    else
    {
      v14[2](v14);
    }
    if (a6) {
      *a6 = (id) v29[5];
    }

    _Block_object_dispose(&v28, 8);
  }
  id v16 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v16;
}

void __65__EKICSImporter_selectCalendarWithTitle_color_description_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectCalendar];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  obuint64_t j = *(id *)(v6 + 40);
  uint64_t v7 = ((void (**)(void, uint64_t, uint64_t, uint64_t, id *))v2)[2](v2, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)importFoundBackupFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKICSImporter *)self importFoundBackupFile];

  if (v5)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __39__EKICSImporter_importFoundBackupFile___block_invoke;
    id v11 = &unk_1E5B97140;
    id v12 = self;
    id v13 = v4;
    uint64_t v6 = (void (**)(void))MEMORY[0x1A6266730](&v8);
    if ([(EKICSImporter *)self asynchronous])
    {
      uint64_t v7 = [(EKICSImporter *)self callbackQueue];
      dispatch_sync(v7, v6);
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __39__EKICSImporter_importFoundBackupFile___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) importFoundBackupFile];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)setImportProgressAsIndeterminate
{
  uint64_t v3 = [(EKICSImporter *)self importSetProgressAsIndeterminate];

  if (v3)
  {
    if ([(EKICSImporter *)self asynchronous])
    {
      dispatch_queue_t queue = [(EKICSImporter *)self callbackQueue];
      id v4 = [(EKICSImporter *)self importSetProgressAsIndeterminate];
      dispatch_sync(queue, v4);
    }
    else
    {
      dispatch_queue_t queue = [(EKICSImporter *)self importSetProgressAsIndeterminate];
      ((void (*)(void))queue[2].isa)();
    }
  }
}

- (BOOL)shouldImportContinueGivenDecision:(int)a3 eventsAffected:(unint64_t)a4
{
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v7 = [(EKICSImporter *)self makeDecision];

  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__EKICSImporter_shouldImportContinueGivenDecision_eventsAffected___block_invoke;
    v12[3] = &unk_1E5B97DB0;
    v12[4] = self;
    void v12[5] = &v14;
    v12[6] = a4;
    int v13 = a3;
    uint64_t v8 = (void (**)(void))MEMORY[0x1A6266730](v12);
    if ([(EKICSImporter *)self asynchronous])
    {
      uint64_t v9 = [(EKICSImporter *)self callbackQueue];
      dispatch_sync(v9, v8);
    }
    else
    {
      v8[2](v8);
    }
  }
  char v10 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

void __66__EKICSImporter_shouldImportContinueGivenDecision_eventsAffected___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) makeDecision];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*((uint64_t (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

- (void)callImportDroppedRemindersCallbackIfThereWereReminders
{
  uint64_t v3 = [(EKICSImporter *)self importDroppedReminders];
  if (v3)
  {
    unint64_t droppedReminderCount = self->_droppedReminderCount;

    if (droppedReminderCount)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __71__EKICSImporter_callImportDroppedRemindersCallbackIfThereWereReminders__block_invoke;
      v7[3] = &unk_1E5B96E08;
      void v7[4] = self;
      uint64_t v5 = (void (**)(void))MEMORY[0x1A6266730](v7);
      if ([(EKICSImporter *)self asynchronous])
      {
        uint64_t v6 = [(EKICSImporter *)self callbackQueue];
        dispatch_sync(v6, v5);
      }
      else
      {
        v5[2](v5);
      }
    }
  }
}

void __71__EKICSImporter_callImportDroppedRemindersCallbackIfThereWereReminders__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) importDroppedReminders];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(*(void *)(a1 + 32) + 192), *(void *)(*(void *)(a1 + 32) + 184));
}

- (NSError)importError
{
  return self->_importError;
}

- (void)setImportError:(id)a3
{
}

- (OS_dispatch_queue)async_queue
{
  return self->_async_queue;
}

- (void)setAsync_queue:(id)a3
{
}

- (id)selectCalendar
{
  return self->_selectCalendar;
}

- (void)setSelectCalendar:(id)a3
{
}

- (id)importFoundBackupFile
{
  return self->_importFoundBackupFile;
}

- (void)setImportFoundBackupFile:(id)a3
{
}

- (id)importDroppedReminders
{
  return self->_importDroppedReminders;
}

- (void)setImportDroppedReminders:(id)a3
{
}

- (id)makeDecision
{
  return self->_makeDecision;
}

- (void)setMakeDecision:(id)a3
{
}

- (id)importSetProgressValue
{
  return self->_importSetProgressValue;
}

- (void)setImportSetProgressValue:(id)a3
{
}

- (id)importSetProgressAsIndeterminate
{
  return self->_importSetProgressAsIndeterminate;
}

- (void)setImportSetProgressAsIndeterminate:(id)a3
{
}

- (BOOL)asynchronous
{
  return self->_asynchronous;
}

- (void)setAsynchronous:(BOOL)a3
{
  self->_asynchronous = a3;
}

- (unint64_t)numInvalidEvents
{
  return self->_numInvalidEvents;
}

- (void)setNumInvalidEvents:(unint64_t)a3
{
  self->_numInvalidEvents = a3;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
}

- (NSArray)importFilePaths
{
  return self->_importFilePaths;
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableDictionary)iCalFilesToImport
{
  return self->_iCalFilesToImport;
}

- (void)setICalFilesToImport:(id)a3
{
}

- (NSMutableArray)vCalFilesToImport
{
  return self->_vCalFilesToImport;
}

- (void)setVCalFilesToImport:(id)a3
{
}

- (NSMapTable)calendarToICalFiles
{
  return self->_calendarToICalFiles;
}

- (void)setCalendarToICalFiles:(id)a3
{
}

- (NSMapTable)calendarToITIPFiles
{
  return self->_calendarToITIPFiles;
}

- (void)setCalendarToITIPFiles:(id)a3
{
}

- (NSMapTable)calendarToVCalFiles
{
  return self->_calendarToVCalFiles;
}

- (void)setCalendarToVCalFiles:(id)a3
{
}

- (NSMutableSet)existingEventIDs
{
  return self->_existingEventIDs;
}

- (void)setExistingEventIDs:(id)a3
{
}

- (NSMutableDictionary)iTIPFiles
{
  return self->_iTIPFiles;
}

- (void)setITIPFiles:(id)a3
{
}

- (NSMutableDictionary)nonITIPFiles
{
  return self->_nonITIPFiles;
}

- (void)setNonITIPFiles:(id)a3
{
}

- (NSMutableArray)filesWithReminders
{
  return self->_filesWithReminders;
}

- (void)setFilesWithReminders:(id)a3
{
}

- (unint64_t)droppedReminderCount
{
  return self->_droppedReminderCount;
}

- (void)setDroppedReminderCount:(unint64_t)a3
{
  self->_unint64_t droppedReminderCount = a3;
}

- (NSMutableArray)importedItems
{
  return self->_importedItems;
}

- (void)setImportedItems:(id)a3
{
}

- (id)completionCallback
{
  return self->_completionCallback;
}

- (void)setCompletionCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong((id *)&self->_importedItems, 0);
  objc_storeStrong((id *)&self->_filesWithReminders, 0);
  objc_storeStrong((id *)&self->_nonITIPFiles, 0);
  objc_storeStrong((id *)&self->_iTIPFiles, 0);
  objc_storeStrong((id *)&self->_existingEventIDs, 0);
  objc_storeStrong((id *)&self->_calendarToVCalFiles, 0);
  objc_storeStrong((id *)&self->_calendarToITIPFiles, 0);
  objc_storeStrong((id *)&self->_calendarToICalFiles, 0);
  objc_storeStrong((id *)&self->_vCalFilesToImport, 0);
  objc_storeStrong((id *)&self->_iCalFilesToImport, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_importFilePaths, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong(&self->_importSetProgressAsIndeterminate, 0);
  objc_storeStrong(&self->_importSetProgressValue, 0);
  objc_storeStrong(&self->_makeDecision, 0);
  objc_storeStrong(&self->_importDroppedReminders, 0);
  objc_storeStrong(&self->_importFoundBackupFile, 0);
  objc_storeStrong(&self->_selectCalendar, 0);
  objc_storeStrong((id *)&self->_async_queue, 0);

  objc_storeStrong((id *)&self->_importError, 0);
}

- (void)_importWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "We failed to figure out the different types of files we were trying to import. Aborting import.", v2, v3, v4, v5, v6);
}

- (void)_importWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "We 'succeeded' at importing 0 items. Going to treat this as an error.", v2, v3, v4, v5, v6);
}

- (void)_sortFilesByImportCalendar
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Couldn't handle import for all iTIP files.  Bailing.", v2, v3, v4, v5, v6);
}

- (void)_separateFilesForImport:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Found a calendar archive to import but no method for restoring from the backup file.", v2, v3, v4, v5, v6);
}

- (void)_separateFilesForImport:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Found a calendar archive among multiple files to import. Ignoring the other files.", v2, v3, v4, v5, v6);
}

- (void)_separateFilesForImport:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Couldn't read calendar data from file \"%@\".  Aborting open.", v2, v3, v4, v5, v6);
}

- (void)_separateICalFilesForITIP
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Not importing file \"%@\" because it has either zero or more than one ICSEvent", v2, v3, v4, v5, v6);
}

- (void)callCompletionWithSuccess:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 importFilePaths];
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_ERROR, "Import of [%@] failed with error [%@]", v7, 0x16u);
}

@end