@interface MPSectionedIdentifierListTailEntry
+ (id)tailEntryWithSectionHeadEntry:(id)a3;
- (MPSectionedIdentifierListHeadEntry)sectionHeadEntry;
- (id)previousEntry;
- (int64_t)entryType;
- (void)setSectionHeadEntry:(id)a3;
@end

@implementation MPSectionedIdentifierListTailEntry

- (MPSectionedIdentifierListHeadEntry)sectionHeadEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionHeadEntry);

  return (MPSectionedIdentifierListHeadEntry *)WeakRetained;
}

- (id)previousEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionHeadEntry);
  v3 = [WeakRetained lastItemEntry];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 nextEntries];
    id v6 = v4;
    v7 = [v5 firstObject];

    if (v7)
    {
      do
      {
        v8 = [v5 firstObject];

        v9 = [v8 nextEntries];

        v10 = [v9 firstObject];

        id v6 = v8;
        v5 = v9;
      }
      while (v10);
      goto LABEL_9;
    }
LABEL_8:
    v9 = v5;
    v8 = v6;
    goto LABEL_9;
  }
  v11 = [WeakRetained nextEntries];
  v5 = objc_msgSend(v11, "msv_suffixFromIndex:", 1);

  id v6 = WeakRetained;
  v12 = [v5 firstObject];

  if (!v12) {
    goto LABEL_8;
  }
  do
  {
    v8 = [v5 firstObject];

    v9 = [v8 nextEntries];

    v13 = [v9 firstObject];

    id v6 = v8;
    v5 = v9;
  }
  while (v13);
LABEL_9:

  return v8;
}

- (int64_t)entryType
{
  return 4;
}

- (void)setSectionHeadEntry:(id)a3
{
}

+ (id)tailEntryWithSectionHeadEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = +[MPSectionedIdentifierListEntryPositionKey positionKeyWithDeviceIdentifier:&stru_1EE680640 generation:@"1"];
  v7 = [v4 sectionIdentifier];
  v8 = (id *)[v5 initWithPositionKey:v6 sectionIdentifier:v7];

  objc_storeWeak(v8 + 8, v4);

  return v8;
}

- (void).cxx_destruct
{
}

@end