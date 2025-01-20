@interface CLSServiceManager
+ (BOOL)canAccessContactsStore;
+ (id)locationCacheForSwiftOnlyWithParentURL:(id)a3;
- (BOOL)hasAddressesForMePerson;
- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4;
- (BOOL)routineIsAvailable;
- (CLSPersonIdentity)mePerson;
- (CLSRoutineService)routineService;
- (CLSServiceManager)initWithLocationCache:(id)a3;
- (double)pinningVisitsRatio;
- (id)contactsForIdentifiers:(id)a3;
- (id)eventsForClueCollection:(id)a3;
- (id)eventsForDates:(id)a3;
- (id)fetchImportantLocationsOfInterest;
- (id)fetchLocationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4;
- (id)inferredDeviceOwnerForPhotoLibrary:(id)a3 ignoreContactLinking:(BOOL)a4;
- (id)lastLocationOfInterestVisit;
- (id)locationOfInterestAtLocation:(id)a3;
- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4;
- (id)matchingDictionaryForContactIdentifier:(id)a3;
- (id)mePersonAddressesOfType:(unint64_t)a3;
- (id)mePersonFetchContactIfNeeeded:(BOOL)a3;
- (id)mePersonForGraphIngest;
- (id)personForIdentifier:(id)a3;
- (id)personForName:(id)a3 inPhotoLibrary:(id)a4;
- (id)personForPersonHandle:(id)a3;
- (id)personLocalIdentifierMatchingContactPictureForContactIdentifier:(id)a3;
- (id)personResultForName:(id)a3 inPhotoLibrary:(id)a4;
- (id)personResultsForName:(id)a3 inPhotoLibrary:(id)a4;
- (id)personsFromEventParticipants:(id)a3 excludeCurrentUser:(BOOL)a4;
- (id)personsInContactStoreForContactIdentifiers:(id)a3 needsRefetching:(BOOL)a4 progressBlock:(id)a5;
- (id)predominantLocationMobilityForDateInterval:(id)a3 confidence:(double *)a4;
- (id)workCalendarEventsMatchingContactIdentifiers:(id)a3 fromUniversalDate:(id)a4 toUniversalDate:(id)a5;
- (unint64_t)numberOfCloseByLocationMatches;
- (unint64_t)numberOfLocationsOfInterest;
- (unint64_t)numberOfMatchRequests;
- (unint64_t)numberOfRemoteLocationMatches;
- (unint64_t)numberOfTimeMatches;
- (unint64_t)numberOfVisits;
- (unint64_t)relationshipHintForPerson:(id)a3 usingLocales:(id)a4;
- (unint64_t)sexHintForPerson:(id)a3 usingLocales:(id)a4;
- (void)enumerateAllPersonsUsingBlock:(id)a3;
- (void)enumerateEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 usingBlock:(id)a5;
- (void)enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersonsAndRelationshipUsingBlock:(id)a3;
- (void)enumeratePersonsForFullname:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersonsForIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)invalidateCacheForPersonInContactStoreWithContactIdentifiers:(id)a3;
- (void)invalidateMePerson;
- (void)invalidateMomentaryMemoryCaches;
- (void)invalidatePermanentMemoryCaches;
- (void)invalidatePersonsCacheForPersonsWithContactIdentifiers:(id)a3;
- (void)invalidatePersonsCacheForPersonsWithNames:(id)a3;
- (void)postProcessLocationsOfInterest;
- (void)prefetchEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 forAssetCollectionsSortedByStartDate:(id)a5 usingBlock:(id)a6;
- (void)setMePerson:(id)a3;
@end

@implementation CLSServiceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mePerson, 0);
  objc_storeStrong((id *)&self->_personsCache, 0);
  objc_storeStrong((id *)&self->_coreNameParserService, 0);
  objc_storeStrong((id *)&self->_routineService, 0);
  objc_storeStrong((id *)&self->_calendarService, 0);
  objc_storeStrong((id *)&self->_contactsService, 0);
}

- (void)setMePerson:(id)a3
{
}

- (CLSRoutineService)routineService
{
  return (CLSRoutineService *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)relationshipHintForPerson:(id)a3 usingLocales:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  unint64_t v9 = [(CLSSocialServiceCoreNameParser *)v8->_coreNameParserService relationshipHintForPerson:v6 usingLocales:v7];
  objc_sync_exit(v8);

  return v9;
}

- (unint64_t)sexHintForPerson:(id)a3 usingLocales:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  unint64_t v9 = [(CLSSocialServiceCoreNameParser *)v8->_coreNameParserService sexHintForPerson:v6 usingLocales:v7];
  objc_sync_exit(v8);

  return v9;
}

- (id)mePersonAddressesOfType:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (a3 >= 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CLSRoutineService *)v4->_routineService placemarksOfInterestOfType:a3];
  }
  objc_sync_exit(v4);

  if (v5)
  {
    id v6 = [v5 allObjects];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (BOOL)hasAddressesForMePerson
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CLSRoutineService *)v2->_routineService hasLocationsOfInterestInformation];
  objc_sync_exit(v2);

  return v3;
}

- (id)personsInContactStoreForContactIdentifiers:(id)a3 needsRefetching:(BOOL)a4 progressBlock:(id)a5
{
  return [(CLSSocialServiceContacts *)self->_contactsService personsInContactStoreForContactIdentifiers:a3 needsRefetching:a4 progressBlock:a5];
}

- (id)personForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSSocialServiceContacts *)v5->_contactsService personForIdentifier:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)enumeratePersonsForIdentifiers:(id)a3 usingBlock:(id)a4
{
}

- (id)personsFromEventParticipants:(id)a3 excludeCurrentUser:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  v8 = [(CLSSocialServiceCalendar *)v7->_calendarService personsFromEventParticipants:v6 excludeCurrentUser:v4 serviceManager:v7];
  objc_sync_exit(v7);

  return v8;
}

- (id)workCalendarEventsMatchingContactIdentifiers:(id)a3 fromUniversalDate:(id)a4 toUniversalDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v12 = [(CLSSocialServiceCalendar *)v11->_calendarService workCalendarEventsMatchingContactIdentifiers:v8 fromUniversalDate:v9 toUniversalDate:v10 contactsService:v11->_contactsService];
  objc_sync_exit(v11);

  return v12;
}

- (id)eventsForClueCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(CLSSocialServiceCalendar *)v5->_calendarService eventsForClueCollection:v4];
  id v7 = (void *)v6;
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  objc_sync_exit(v5);
  return v9;
}

- (void)prefetchEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 forAssetCollectionsSortedByStartDate:(id)a5 usingBlock:(id)a6
{
}

- (void)enumerateEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 usingBlock:(id)a5
{
}

- (id)lastLocationOfInterestVisit
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CLSRoutineService *)v2->_routineService lastLocationOfInterestVisit];
  objc_sync_exit(v2);

  return v3;
}

- (void)postProcessLocationsOfInterest
{
  obj = self;
  objc_sync_enter(obj);
  [(CLSRoutineService *)obj->_routineService postProcessLocationsOfInterest];
  objc_sync_exit(obj);
}

- (id)fetchImportantLocationsOfInterest
{
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(CLSRoutineService *)v4->_routineService locationsOfInterestOfType:0];
  if ([v5 count]) {
    [v3 unionSet:v5];
  }
  uint64_t v6 = [(CLSRoutineService *)v4->_routineService locationsOfInterestOfType:1];
  if ([v6 count]) {
    [v3 unionSet:v6];
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)predominantLocationMobilityForDateInterval:(id)a3 confidence:(double *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  unint64_t v8 = [(CLSRoutineService *)v7->_routineService predominantTransportationModeForDateInterval:v6 confidence:a4];
  if (v8 > 2) {
    id v9 = 0;
  }
  else {
    id v9 = *off_1E690EA30[v8];
  }
  objc_sync_exit(v7);

  return v9;
}

- (id)fetchLocationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(CLSRoutineService *)v8->_routineService locationOfInterestVisitsAtLocation:v6 inDateInterval:v7];
  objc_sync_exit(v8);

  return v9;
}

- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(CLSRoutineService *)v8->_routineService locationOfInterestCloseToLocation:v6 inDateInterval:v7];
  objc_sync_exit(v8);

  return v9;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSRoutineService *)v5->_routineService locationOfInterestAtLocation:v4];
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = [(CLSRoutineService *)v8->_routineService isRemoteLocation:v6 inDateInterval:v7];
  objc_sync_exit(v8);

  return v9;
}

- (id)matchingDictionaryForContactIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSSocialServiceContacts *)v5->_contactsService matchingDictionaryForContactIdentifier:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)contactsForIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSSocialServiceContacts *)v5->_contactsService contactsForIdentifiers:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:(id)a3 usingBlock:(id)a4
{
}

- (void)enumeratePersonsForFullname:(id)a3 usingBlock:(id)a4
{
}

- (id)personForPersonHandle:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSSocialServiceContacts *)v5->_contactsService personForPersonHandle:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)personLocalIdentifierMatchingContactPictureForContactIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSSocialServiceContacts *)v5->_contactsService personLocalIdentifierMatchingContactPictureForContactIdentifier:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)enumeratePersonsAndRelationshipUsingBlock:(id)a3
{
}

- (void)enumerateAllPersonsUsingBlock:(id)a3
{
}

- (id)personResultsForName:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self->_personsCache;
  objc_sync_enter(v8);
  BOOL v9 = [(CLSLRUMemoryCache *)self->_personsCache objectForKey:v6];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = self;
    objc_sync_enter(v12);
    v13 = [(CLSSocialServiceContacts *)v12->_contactsService personResultsForName:v6 inPhotoLibrary:v7];
    objc_sync_exit(v12);

    id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    [(CLSLRUMemoryCache *)self->_personsCache setObject:v11 forKey:v6];
  }
  objc_sync_exit(v8);

  return v11;
}

- (id)personResultForName:(id)a3 inPhotoLibrary:(id)a4
{
  id v4 = [(CLSServiceManager *)self personResultsForName:a3 inPhotoLibrary:a4];
  if ([v4 count] == 1)
  {
    v5 = [v4 anyObject];
    goto LABEL_10;
  }
  unint64_t v6 = [v4 count];
  BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (v6 < 2)
  {
    if (v7)
    {
      __int16 v12 = 0;
      unint64_t v8 = MEMORY[0x1E4F14500];
      BOOL v9 = "No CLSPersonIdentity found";
      id v10 = (uint8_t *)&v12;
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    __int16 v13 = 0;
    unint64_t v8 = MEMORY[0x1E4F14500];
    BOOL v9 = "No unique CLSPersonIdentity found";
    id v10 = (uint8_t *)&v13;
LABEL_8:
    _os_log_impl(&dword_1D2150000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (id)personForName:(id)a3 inPhotoLibrary:(id)a4
{
  id v4 = [(CLSServiceManager *)self personResultForName:a3 inPhotoLibrary:a4];
  v5 = [v4 person];

  return v5;
}

- (id)eventsForDates:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(CLSSocialServiceCalendar *)v5->_calendarService eventsForDates:v4];
  BOOL v7 = (void *)v6;
  unint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    unint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  objc_sync_exit(v5);
  return v9;
}

- (id)inferredDeviceOwnerForPhotoLibrary:(id)a3 ignoreContactLinking:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isSystemPhotoLibrary])
  {
    BOOL v7 = self;
    objc_sync_enter(v7);
    unint64_t v8 = [(CLSSocialServiceContacts *)v7->_contactsService inferredDeviceOwnerForPhotoLibrary:v6 ignoreContactLinking:v4];
    objc_sync_exit(v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (CLSPersonIdentity)mePerson
{
  return (CLSPersonIdentity *)[(CLSServiceManager *)self mePersonFetchContactIfNeeeded:0];
}

- (id)mePersonForGraphIngest
{
  v2 = [(CLSServiceManager *)self mePersonFetchContactIfNeeeded:1];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[CLSPersonIdentity mePerson];
  }
  v5 = v4;

  return v5;
}

- (id)mePersonFetchContactIfNeeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  mePerson = v4->_mePerson;
  if (!mePerson)
  {
    if (v3) {
      [(CLSSocialServiceContacts *)v4->_contactsService refreshMeContactIfNeeded];
    }
    uint64_t v6 = [(CLSSocialServiceContacts *)v4->_contactsService mePerson];
    BOOL v7 = v4->_mePerson;
    v4->_mePerson = (CLSPersonIdentity *)v6;

    mePerson = v4->_mePerson;
  }
  unint64_t v8 = mePerson;
  objc_sync_exit(v4);

  return v8;
}

- (void)invalidateCacheForPersonInContactStoreWithContactIdentifiers:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(CLSSocialServiceContacts *)v4->_contactsService invalidateCacheForPersonInContactStoreWithContactIdentifiers:v5];
  objc_sync_exit(v4);
}

- (void)invalidatePersonsCacheForPersonsWithContactIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_personsCache;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        -[CLSLRUMemoryCache removeObjectForKey:](self->_personsCache, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
  id v10 = self;
  objc_sync_enter(v10);
  [(CLSSocialServiceContacts *)v10->_contactsService invalidateCacheForPersonWithContactIdentifiers:v6];
  objc_sync_exit(v10);
}

- (void)invalidatePersonsCacheForPersonsWithNames:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_personsCache;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        -[CLSLRUMemoryCache removeObjectForKey:](self->_personsCache, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
  id v10 = self;
  objc_sync_enter(v10);
  [(CLSSocialServiceContacts *)v10->_contactsService invalidateCacheForPersonWithLocalIdentifiers:v6];
  objc_sync_exit(v10);
}

- (void)invalidateMomentaryMemoryCaches
{
  obj = self;
  objc_sync_enter(obj);
  [(CLSRoutineService *)obj->_routineService invalidateLocationsOfInterest];
  objc_sync_exit(obj);
}

- (void)invalidatePermanentMemoryCaches
{
  obj = self;
  objc_sync_enter(obj);
  [(CLSSocialServiceCalendar *)obj->_calendarService invalidateMemoryCaches];
  [(CLSSocialServiceContacts *)obj->_contactsService invalidateMemoryCaches];
  [(CLSSocialServiceCoreNameParser *)obj->_coreNameParserService invalidateMemoryCaches];
  [(CLSRoutineService *)obj->_routineService invalidateLocationsOfInterest];
  [(CLSLRUMemoryCache *)obj->_personsCache removeAllObjects];
  objc_sync_exit(obj);
}

- (void)invalidateMePerson
{
  obj = self;
  objc_sync_enter(obj);
  [(CLSSocialServiceContacts *)obj->_contactsService invalidateMePerson];
  mePerson = obj->_mePerson;
  obj->_mePerson = 0;

  objc_sync_exit(obj);
}

- (CLSServiceManager)initWithLocationCache:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSServiceManager;
  id v5 = [(CLSServiceManager *)&v21 init];
  if (v5)
  {
    if (+[CLSSocialServiceContacts canAccessContactsStore])
    {
      id v6 = [[CLSSocialServiceContacts alloc] initWithLocationCache:v4];
      contactsService = v5->_contactsService;
      v5->_contactsService = v6;

      [(CLSSocialServiceContacts *)v5->_contactsService setDelegate:v5];
    }
    uint64_t v8 = objc_alloc_init(CLSSocialServiceCalendar);
    calendarService = v5->_calendarService;
    v5->_calendarService = v8;

    id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
    long long v11 = [MEMORY[0x1E4F1C9C8] date];
    long long v12 = [v11 dateByAddingTimeInterval:-31536000.0];
    long long v13 = (void *)[v10 initWithStartDate:v12 duration:31536000.0];

    long long v14 = [[CLSRoutineService alloc] initWithFetchDateInterval:v13 locationCache:v4];
    routineService = v5->_routineService;
    v5->_routineService = v14;

    uint64_t v16 = objc_alloc_init(CLSSocialServiceCoreNameParser);
    coreNameParserService = v5->_coreNameParserService;
    v5->_coreNameParserService = v16;

    v18 = objc_alloc_init(CLSLRUMemoryCache);
    personsCache = v5->_personsCache;
    v5->_personsCache = v18;
  }
  return v5;
}

+ (BOOL)canAccessContactsStore
{
  return +[CLSSocialServiceContacts canAccessContactsStore];
}

+ (id)locationCacheForSwiftOnlyWithParentURL:(id)a3
{
  id v3 = a3;
  id v4 = [CLSLocationCache alloc];
  id v5 = +[CLSDBCache urlWithParentURL:v3];

  id v6 = [(CLSDBCache *)v4 initWithURL:v5];
  return v6;
}

- (double)pinningVisitsRatio
{
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }

  return 0.0;
}

- (unint64_t)numberOfMatchRequests
{
  long long v5 = 0u;
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }
  else {
    long long v5 = 0u;
  }

  return *((void *)&v5 + 1);
}

- (unint64_t)numberOfRemoteLocationMatches
{
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }

  return 0;
}

- (unint64_t)numberOfCloseByLocationMatches
{
  long long v5 = 0u;
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }
  else {
    long long v5 = 0u;
  }

  return *((void *)&v5 + 1);
}

- (unint64_t)numberOfTimeMatches
{
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }

  return 0;
}

- (unint64_t)numberOfVisits
{
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }

  return 0;
}

- (unint64_t)numberOfLocationsOfInterest
{
  long long v5 = 0u;
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }
  else {
    long long v5 = 0u;
  }

  return *((void *)&v5 + 1);
}

- (BOOL)routineIsAvailable
{
  v2 = [(CLSServiceManager *)self routineService];
  id v3 = v2;
  if (v2) {
    [v2 statistics];
  }

  return 0;
}

@end