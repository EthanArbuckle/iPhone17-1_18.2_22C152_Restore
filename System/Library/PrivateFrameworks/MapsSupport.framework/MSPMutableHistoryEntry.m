@interface MSPMutableHistoryEntry
+ (Class)immutableObjectClass;
+ (Class)mutableObjectClass;
+ (id)immutableObjectProtocol;
+ (id)mutableHistoryEntryForStorage:(id)a3;
+ (id)mutableObjectProtocol;
- (BOOL)_isImmutable;
- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3;
- (BOOL)isUserVisibleDuplicateOfEntry:(id)a3;
- (BOOL)tracksRAPReportingOnly;
- (MSPHistoryEntryStorage)storage;
- (MSPMutableHistoryEntry)init;
- (MSPMutableHistoryEntry)initWithStorage:(id)a3;
- (NSDate)usageDate;
- (NSString)description;
- (id)copyIfValidWithError:(id *)a3;
- (id)debugTitle;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)storageIdentifier;
- (id)transferToImmutableIfValidWithError:(id *)a3;
- (void)_markImmutable;
- (void)_noteWillMutate;
- (void)ifMutableSearch:(id)a3 ifMutableRoute:(id)a4 ifMutablePlaceDisplay:(id)a5 ifMutableTransitLineItem:(id)a6;
- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6;
- (void)setTracksRAPReportingOnly:(BOOL)a3;
- (void)setUsageDate:(id)a3;
@end

@implementation MSPMutableHistoryEntry

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return 0;
}

+ (Class)mutableObjectClass
{
  return 0;
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntry)init
{
  return [(MSPMutableHistoryEntry *)self initWithStorage:0];
}

- (MSPMutableHistoryEntry)initWithStorage:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSPMutableHistoryEntry;
  v5 = [(MSPMutableHistoryEntry *)&v21 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];

    v7 = [v6 identifier];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F29128]);
      v9 = [v6 identifier];
      uint64_t v10 = [v8 initWithUUIDString:v9];
      storageIdentifier = v5->_storageIdentifier;
      v5->_storageIdentifier = (NSUUID *)v10;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
      v13 = v5->_storageIdentifier;
      v5->_storageIdentifier = (NSUUID *)v12;

      v9 = [(NSUUID *)v5->_storageIdentifier UUIDString];
      [v6 setIdentifier:v9];
    }

    int v14 = [v6 hasTimestamp];
    v15 = (void *)MEMORY[0x1E4F1C9C8];
    if (v14)
    {
      [v6 timestamp];
      uint64_t v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      usageDate = v5->_usageDate;
      v5->_usageDate = (NSDate *)v16;
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
      v19 = v5->_usageDate;
      v5->_usageDate = (NSDate *)v18;

      [(NSDate *)v5->_usageDate timeIntervalSinceReferenceDate];
      objc_msgSend(v6, "setTimestamp:");
    }
    objc_storeStrong((id *)&v5->_storage, v6);
  }
  else
  {
    v6 = v4;
  }

  return v5;
}

- (void)setUsageDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceReferenceDate];
  -[MSPHistoryEntryStorage setTimestamp:](self->_storage, "setTimestamp:");
  v5 = (NSDate *)[v4 copy];

  usageDate = self->_usageDate;
  self->_usageDate = v5;
}

- (void)ifSearch:(id)a3 ifRoute:(id)a4 ifPlaceDisplay:(id)a5 ifTransitLineItem:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    v15 = v26;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke;
    v26[3] = &unk_1E617D808;
    v19 = &v27;
    id v27 = v11;
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = 0;
    if (v12)
    {
LABEL_3:
      uint64_t v16 = v24;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_2;
      v24[3] = &unk_1E617D830;
      uint64_t v18 = &v25;
      id v25 = v12;
      if (v13) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  uint64_t v16 = 0;
  if (v13)
  {
LABEL_4:
    v17 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_3;
    v22[3] = &unk_1E617D858;
    v6 = &v23;
    id v23 = v13;
    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v17 = 0;
  if (v14)
  {
LABEL_5:
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_4;
    v20[3] = &unk_1E617D880;
    id v21 = v14;
    [(MSPMutableHistoryEntry *)self ifMutableSearch:v15 ifMutableRoute:v16 ifMutablePlaceDisplay:v17 ifMutableTransitLineItem:v20];

    if (!v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  [(MSPMutableHistoryEntry *)self ifMutableSearch:v15 ifMutableRoute:v16 ifMutablePlaceDisplay:v17 ifMutableTransitLineItem:0];
  if (v13) {
LABEL_6:
  }

LABEL_7:
  if (v12) {

  }
  if (v11) {
}
  }

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MSPMutableHistoryEntry_ifSearch_ifRoute_ifPlaceDisplay_ifTransitLineItem___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ifMutableSearch:(id)a3 ifMutableRoute:(id)a4 ifMutablePlaceDisplay:(id)a5 ifMutableTransitLineItem:(id)a6
{
  uint64_t v18 = (void (**)(id, MSPMutableHistoryEntry *))a3;
  uint64_t v10 = (void (**)(id, MSPMutableHistoryEntry *))a4;
  id v11 = (void (**)(id, MSPMutableHistoryEntry *))a5;
  id v12 = (void (**)(id, MSPMutableHistoryEntry *))a6;
  if (v18)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v14 = v18;
    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  if (v10)
  {
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();
    id v14 = v10;
    if (v15) {
      goto LABEL_9;
    }
  }
  if (v11 && (objc_opt_class(), v16 = objc_opt_isKindOfClass(), id v14 = v11, (v16 & 1) != 0)
    || v12 && (objc_opt_class(), v17 = objc_opt_isKindOfClass(), id v14 = v12, (v17 & 1) != 0))
  {
LABEL_9:
    v14[2](v14, self);
  }
}

+ (id)mutableHistoryEntryForStorage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 hasSearchType] && (unsigned int v5 = objc_msgSend(v4, "searchType") - 1, v5 <= 4)) {
    v6 = (void *)[objc_alloc(*off_1E617D8A0[v5]) initWithStorage:v4];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  unsigned int v5 = [(MSPMutableHistoryEntry *)self storage];
  v6 = [v4 mutableHistoryEntryForStorage:v5];

  return v6;
}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  }
  return 0;
}

- (id)copyIfValidWithError:(id *)a3
{
  id v4 = (void *)[(MSPMutableHistoryEntry *)self mutableCopy];
  unsigned int v5 = [v4 transferToImmutableIfValidWithError:a3];

  return v5;
}

- (BOOL)isUserVisibleDuplicateOfEntry:(id)a3
{
  id v4 = (MSPMutableHistoryEntry *)a3;
  if (self != v4)
  {
    if (![(MSPMutableHistoryEntry *)self isMemberOfClass:objc_opt_class()])
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    unsigned int v5 = [(MSPMutableHistoryEntry *)self storageIdentifier];
    v6 = [(MSPMutableHistoryEntry *)v4 storageIdentifier];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = [(MSPMutableHistoryEntry *)self _isUserVisibleDuplicateOfSameClassObject:v4];
      goto LABEL_7;
    }
  }
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  return 0;
}

- (BOOL)tracksRAPReportingOnly
{
  return [(MSPHistoryEntryStorage *)self->_storage tracksRAPRecordingOnly];
}

- (void)setTracksRAPReportingOnly:(BOOL)a3
{
  BOOL v3 = a3;
  [(MSPMutableHistoryEntry *)self _noteWillMutate];
  storage = self->_storage;

  [(MSPHistoryEntryStorage *)storage setTracksRAPRecordingOnly:v3];
}

- (void)_markImmutable
{
  self->_immutable = 1;
}

- (void)_noteWillMutate
{
}

- (id)debugTitle
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = self;
    id v4 = [(MSPMutableHistoryEntry *)v3 routeInformationSource];
    unsigned int v5 = [v4 ifRidesharingInformationSource];

    v6 = [(MSPMutableHistoryEntry *)v3 routeInformationSource];

    char v7 = [v6 ifGEOStorageRouteRequestStorage];

    if (v5)
    {
      BOOL v8 = NSString;
      v9 = [v5 _startWaypoint];
      uint64_t v10 = [v9 latLng];
      id v11 = [v5 _endWaypoint];
      id v12 = [(__CFString *)v11 latLng];
      id v13 = [v8 stringWithFormat:@"Route (ride sharing) from %@ to %@", v10, v12];
LABEL_17:

      goto LABEL_18;
    }
    if (v7)
    {
      id v14 = [v7 waypoints];
      v9 = [v14 firstObject];

      char v15 = [v7 waypoints];
      uint64_t v10 = [v15 lastObject];

      char v16 = NSString;
      uint64_t v17 = [v7 transportType];
      if (v17 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = off_1E617D8C8[(int)v17];
      }
      id v12 = [v9 latLng];
      v19 = [v10 latLng];
      id v13 = [v16 stringWithFormat:@"Route (%@) with waypoints: [ %@ ... %@ ]", v11, v12, v19];

      goto LABEL_17;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(MSPMutableHistoryEntry *)self query];
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [(MSPMutableHistoryEntry *)self geoMapItem];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = 0;
      goto LABEL_19;
    }
    uint64_t v18 = [(MSPMutableHistoryEntry *)self lineItem];
  }
  unsigned int v5 = v18;
  id v13 = [v18 name];
LABEL_18:

LABEL_19:

  return v13;
}

- (NSString)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPMutableHistoryEntry;
  id v4 = [(MSPMutableHistoryEntry *)&v8 description];
  unsigned int v5 = [(MSPMutableHistoryEntry *)self debugTitle];
  v6 = [v3 stringWithFormat:@"%@ { %@ }", v4, v5];

  return (NSString *)v6;
}

- (id)storageIdentifier
{
  return self->_storageIdentifier;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (BOOL)_isImmutable
{
  return self->_immutable;
}

- (MSPHistoryEntryStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_usageDate, 0);

  objc_storeStrong((id *)&self->_storageIdentifier, 0);
}

@end