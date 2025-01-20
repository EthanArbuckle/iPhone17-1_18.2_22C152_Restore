@interface VOTNameSearcherElementSource
- (VOTElement)baseElement;
- (VOTElementFetcher)elementFetcher;
- (VOTNameSearcherElementSource)initWithElement:(id)a3;
- (VOTNameSearcherItemSourceDelegate)delegate;
- (double)selectSpeechDelay;
- (id)messageForMatchingItemsCount:(int64_t)a3;
- (id)messageForNoMatchingItems;
- (id)messageForSelectingItem:(id)a3;
- (void)elementsRetrieved:(id)a3 finished:(BOOL)a4;
- (void)retrieveAllEntries:(id)a3;
- (void)setBaseElement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementFetcher:(id)a3;
@end

@implementation VOTNameSearcherElementSource

- (VOTNameSearcherElementSource)initWithElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VOTNameSearcherElementSource;
  v5 = [(VOTNameSearcherElementSource *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(VOTNameSearcherElementSource *)v5 setBaseElement:v4];
    v7 = objc_opt_new();
    [(VOTNameSearcherElementSource *)v6 setElementFetcher:v7];

    v8 = [(VOTNameSearcherElementSource *)v6 elementFetcher];
    [v8 setDelegate:v6];

    v9 = v6;
  }

  return v6;
}

- (void)retrieveAllEntries:(id)a3
{
  [(VOTNameSearcherElementSource *)self setDelegate:a3];
  id v5 = [(VOTNameSearcherElementSource *)self elementFetcher];
  id v4 = [(id)VOTSharedWorkspace currentElement];
  objc_msgSend(v5, "retrieveElementsWithElement:groupNavigationStyle:", v4, objc_msgSend((id)VOTSharedWorkspace, "navigationStyleHonorsGroups"));
}

- (id)messageForMatchingItemsCount:(int64_t)a3
{
  id v4 = sub_100051804(off_1001EA9E8, @"handwrite.num.matching.items.count", 0);
  id v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, a3);

  return v5;
}

- (id)messageForNoMatchingItems
{
  return sub_100051804(off_1001EA9E8, @"handwrite.no.items", 0);
}

- (id)messageForSelectingItem:(id)a3
{
  v3 = off_1001EA9E8;
  id v4 = a3;
  id v5 = sub_100051804(v3, @"handwrite.choose.item", 0);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4);

  return v6;
}

- (void)elementsRetrieved:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4 && (unint64_t)[v6 count] <= 0x3E8)
  {
    v8 = sub_100053900(v7);
    id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v14);
          v16 = [VOTNameSearcherElementEntry alloc];
          v17 = -[VOTNameSearcherElementEntry initWithElement:](v16, "initWithElement:", v15, (void)v19);
          [v9 addObject:v17];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    v18 = [(VOTNameSearcherElementSource *)self delegate];
    [v18 didRetrieveAllEntries:v9];
  }
}

- (double)selectSpeechDelay
{
  return 0.0;
}

- (VOTElement)baseElement
{
  return self->_baseElement;
}

- (void)setBaseElement:(id)a3
{
}

- (VOTElementFetcher)elementFetcher
{
  return self->_elementFetcher;
}

- (void)setElementFetcher:(id)a3
{
}

- (VOTNameSearcherItemSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTNameSearcherItemSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementFetcher, 0);

  objc_storeStrong((id *)&self->_baseElement, 0);
}

@end