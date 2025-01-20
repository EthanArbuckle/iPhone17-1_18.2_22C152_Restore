@interface MSPMutableHistoryEntryTransitLineItem
+ (Class)immutableObjectClass;
+ (Class)mutableObjectClass;
+ (id)immutableObjectProtocol;
+ (id)mutableObjectProtocol;
- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3;
- (GEOTransitLineItem)lineItem;
- (MSPMutableHistoryEntryTransitLineItem)initWithStorage:(id)a3;
- (id)transferToImmutableIfValidWithError:(id *)a3;
- (void)setLineItem:(id)a3;
@end

@implementation MSPMutableHistoryEntryTransitLineItem

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return &unk_1F1210CD8;
}

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntryTransitLineItem)initWithStorage:(id)a3
{
  v4 = (MSPHistoryEntryStorage *)a3;
  if (!v4)
  {
    v4 = objc_alloc_init(MSPHistoryEntryStorage);
    [(MSPHistoryEntryStorage *)v4 setSearchType:4];
    v5 = objc_alloc_init(MSPTransitStorageLineItem);
    [(MSPHistoryEntryStorage *)v4 setTransitLineItem:v5];
  }
  v14.receiver = self;
  v14.super_class = (Class)MSPMutableHistoryEntryTransitLineItem;
  v6 = [(MSPMutableHistoryEntry *)&v14 initWithStorage:v4];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  v8 = [(MSPMutableHistoryEntry *)v6 storage];
  int v9 = [v8 searchType];

  if (v9 != 4) {
    goto LABEL_7;
  }
  v10 = [(MSPMutableHistoryEntry *)v7 storage];
  v11 = [v10 transitLineItem];

  if (v11) {
LABEL_6:
  }
    v12 = v7;
  else {
LABEL_7:
  }
    v12 = 0;

  return v12;
}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(MSPMutableHistoryEntryTransitLineItem *)self lineItem];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(MSPMutableHistoryEntryTransitLineItem *)self lineItem];
    int v9 = [v8 name];
    if ([v9 length])
    {
      v10 = [(MSPMutableHistoryEntryTransitLineItem *)self lineItem];
      uint64_t v11 = [v10 muid];

      if (v11) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  [v5 addObject:@"lineItem"];
LABEL_7:
  if ([v5 count])
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v15[0] = @"MSPContainerUntransferableObject";
      v15[1] = @"MSPContainerUnavailableKeys";
      v16[0] = self;
      v16[1] = v5;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      *a3 = [v12 errorWithDomain:@"com.apple.MapsSupport.MSPContainer" code:1 userInfo:v13];

      a3 = 0;
    }
  }
  else
  {
    [(MSPMutableHistoryEntry *)self _markImmutable];
    a3 = self;
  }

  return a3;
}

- (GEOTransitLineItem)lineItem
{
  v2 = [(MSPMutableHistoryEntry *)self storage];
  v3 = [v2 transitLineItem];

  return (GEOTransitLineItem *)v3;
}

- (void)setLineItem:(id)a3
{
  id v4 = a3;
  [(MSPMutableHistoryEntry *)self _noteWillMutate];
  uint64_t v6 = [[MSPTransitStorageLineItem alloc] initWithLineItem:v4];

  id v5 = [(MSPMutableHistoryEntry *)self storage];
  [v5 setTransitLineItem:v6];
}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [v4 lineItem];
    uint64_t v6 = [(MSPMutableHistoryEntryTransitLineItem *)self lineItem];
    uint64_t v7 = [v6 muid];
    BOOL v8 = v7 == [v5 muid];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end