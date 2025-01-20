@interface HSPCHomeKitRoomProvider
- (HMRoom)suggestedRoom;
- (HSPCHomeKitRoomProvider)initWithCoordinator:(id)a3 configuration:(id)a4;
- (NSArray)existingRooms;
- (id)_generateRoomSuggestionsWithLimit:(int64_t)a3 existingRooms:(id)a4;
- (id)loadData;
- (id)userFacingStringForItem:(id)a3;
- (unint64_t)initialRowIndex;
@end

@implementation HSPCHomeKitRoomProvider

- (HSPCHomeKitRoomProvider)initWithCoordinator:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HSPCHomeKitRoomProvider;
  v8 = [(HSPCDataProvider *)&v22 initWithCoordinator:v6 configuration:v7];
  if (v8)
  {
    v9 = [v7 home];
    v10 = [v9 hf_dashboardSectionReorderableHomeKitObjectComparator];

    v11 = [v7 home];
    v12 = [v11 rooms];
    v13 = v10;
    if (!v10)
    {
      v13 = +[HFItemSection defaultItemComparator];
    }
    uint64_t v14 = [v12 sortedArrayUsingComparator:v13];
    existingRooms = v8->_existingRooms;
    v8->_existingRooms = (NSArray *)v14;

    if (!v10) {
    v16 = v8->_existingRooms;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005B27C;
    v20[3] = &unk_1000A9FB0;
    id v21 = v6;
    uint64_t v17 = [(NSArray *)v16 na_firstObjectPassingTest:v20];
    suggestedRoom = v8->_suggestedRoom;
    v8->_suggestedRoom = (HMRoom *)v17;
  }
  return v8;
}

- (id)loadData
{
  v3 = [(HSPCHomeKitRoomProvider *)self existingRooms];
  v4 = [(HSPCHomeKitRoomProvider *)self _generateRoomSuggestionsWithLimit:10 existingRooms:v3];

  v5 = [(HSPCHomeKitRoomProvider *)self existingRooms];
  id v6 = (char *)[v5 count];
  id v7 = &v6[(void)[v4 count]];

  v8 = +[NSMutableArray array];
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v10 = [(HSPCHomeKitRoomProvider *)self existingRooms];
      v11 = (char *)[v10 count];

      v12 = [(HSPCHomeKitRoomProvider *)self existingRooms];
      v13 = v12;
      if (i >= v11)
      {
        uint64_t v14 = (char *)(i - (unsigned char *)[v12 count]);
        v12 = v4;
      }
      else
      {
        uint64_t v14 = i;
      }
      v15 = [v12 objectAtIndexedSubscript:v14];

      v16 = [v15 name];
      [v8 addObject:v16];
    }
  }
  id v17 = [v8 copy];
  [(HSPCDataProvider *)self setItems:v17];

  [(HSPCDataProvider *)self setLoaded:1];
  v18 = +[NAFuture futureWithNoResult];

  return v18;
}

- (id)userFacingStringForItem:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(HSPCHomeKitRoomProvider *)self existingRooms];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) name];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v12 = v4;

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  HFLocalizedStringWithFormat();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (unint64_t)initialRowIndex
{
  v3 = [(HSPCHomeKitRoomProvider *)self existingRooms];
  id v4 = [v3 count];

  if (!v4)
  {
    v9 = [(HSPCDataProvider *)self items];
    goto LABEL_6;
  }
  v5 = [(HSPCHomeKitRoomProvider *)self suggestedRoom];

  if (!v5
    || ([(HSPCHomeKitRoomProvider *)self existingRooms],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(HSPCHomeKitRoomProvider *)self suggestedRoom],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v6 indexOfObject:v7],
        v7,
        v6,
        v8 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = [(HSPCHomeKitRoomProvider *)self existingRooms];
LABEL_6:
    v10 = v9;
    id v8 = (id)((unint64_t)[v9 count] >> 1);
  }
  return (unint64_t)v8;
}

- (id)_generateRoomSuggestionsWithLimit:(int64_t)a3 existingRooms:(id)a4
{
  v5 = [a4 na_map:&stru_1000AB4A8];
  id v6 = +[NSSet setWithArray:v5];

  id v7 = +[HFDefaultRoomSuggestionVendor homeAppSuggestionVendor];
  id v8 = [v7 roomSuggestions];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005B834;
  v18[3] = &unk_1000AB4D0;
  id v19 = v6;
  id v9 = v6;
  v10 = [v8 na_filter:v18];

  id v11 = [v9 count];
  int64_t v12 = (a3 - (void)v11) & ~((a3 - (uint64_t)v11) >> 63);
  v13 = [v10 allObjects];
  long long v14 = +[HFRoomSuggestion priorityComparator];
  long long v15 = [v13 sortedArrayUsingComparator:v14];
  long long v16 = [v15 subarrayWithRange:0, v12];

  return v16;
}

- (NSArray)existingRooms
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (HMRoom)suggestedRoom
{
  return (HMRoom *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRoom, 0);

  objc_storeStrong((id *)&self->_existingRooms, 0);
}

@end