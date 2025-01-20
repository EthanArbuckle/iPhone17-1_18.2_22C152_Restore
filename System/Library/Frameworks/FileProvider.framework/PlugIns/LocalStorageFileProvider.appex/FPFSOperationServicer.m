@interface FPFSOperationServicer
- (id)disconnectDomainID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (id)fetchPublishingURLForItemID:(id)a3 completionHandler:(id)a4;
- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5;
- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6;
- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7;
- (void)fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 ignoreAlternateContentURL:(BOOL)a5 reply:(id)a6;
- (void)fetchItemID:(id)a3 reply:(id)a4;
- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3;
- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5;
- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4;
- (void)singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 completionHandler:(id)a6;
- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6;
- (void)startOperation:(id)a3 toFetchThumbnailsWithDictionary:(id)a4 size:(CGSize)a5 completionHandler:(id)a6;
- (void)updateIgnoreStateOfItemWithIdentifiers:(id)a3 ignoreState:(BOOL)a4 completionHandler:(id)a5;
- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5;
- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)aBlock;
- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation FPFSOperationServicer

- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v10 = _Block_copy(a6);
  sub_100011348(0, (unint64_t *)&unk_100ACEC40);
  unint64_t v11 = sub_10096C0A0();
  _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  sub_10021CDF8((uint64_t)a3, v11, (uint64_t)self, v10, width, height);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)startOperation:(id)a3 toFetchThumbnailsWithDictionary:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v10 = _Block_copy(a6);
  sub_100011348(0, (unint64_t *)&unk_100ACEC40);
  sub_10002B7CC((uint64_t *)&unk_100ACECD0);
  sub_10021FF58();
  uint64_t v11 = sub_10096B9C0();
  _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  sub_10021CC18((uint64_t)a3, v11, (uint64_t)self, (void (**)(void, void))v10, width, height);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5
{
  v6 = _Block_copy(a5);
  sub_100011348(0, (unint64_t *)&unk_100ACEC40);
  unint64_t v7 = sub_10096C0A0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  id v9 = a4;
  swift_retain();
  sub_1002102A8(v7, v9, (uint64_t)sub_1002201E4, v8);

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a3;
  swift_retain();
  sub_100210888(v11, a4, a5, (uint64_t)sub_1002201DC, v10);

  swift_release();

  swift_release();
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  sub_100011348(0, (unint64_t *)&unk_100ACD9F0);
  sub_10096C0A0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = *(void **)self->backend;
  swift_retain();
  Class isa = sub_10096C080().super.isa;
  uint64_t v11 = *(void *)self->request;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10022035C;
  *(void *)(v12 + 24) = v8;
  v14[4] = sub_10021FF2C;
  v14[5] = v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100210AD0;
  v14[3] = &unk_100A76810;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v9 bulkItemChanges:isa changedFields:a4 request:v11 completionHandler:v13];
  _Block_release(v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 ignoreAlternateContentURL:(BOOL)a5 reply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10021F728;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_10021F728;
  *(void *)(v13 + 24) = v11;
  *(void *)(v13 + 32) = a3;
  *(unsigned char *)(v13 + 40) = a4;
  *(void *)(v13 + 48) = self;
  *(unsigned char *)(v13 + 56) = a5;
  id v14 = a3;
  swift_retain_n();
  swift_retain_n();
  id v15 = v14;
  sub_10028F894((uint64_t)"fetchHierarchy(for:recursively:ignoreAlternateContentURL:reply:)", 64, 2, (void (*)(void *, id))sub_10021F730, v12, (uint64_t)sub_10021F7A4, v13);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  swift_retain();
  sub_10021D0C0(v8, v10, v11, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7
{
  uint64_t v9 = _Block_copy(a7);
  uint64_t v20 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v11 = v10;
  uint64_t v12 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v9;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1002201DC;
  *(void *)(v16 + 24) = v15;
  v17 = (void *)swift_allocObject();
  v17[2] = self;
  v17[3] = v20;
  v17[4] = v11;
  v17[5] = v12;
  v17[6] = v14;
  v17[7] = a5;
  v17[8] = sub_1002201DC;
  v17[9] = v15;
  id v18 = a5;
  swift_retain_n();
  swift_retain_n();
  id v19 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10028F454((uint64_t)"fetchDefaultContainer(forBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply:)", 91, 2, (void (*)(void *, id))sub_100220358, v16, (uint64_t)sub_10021F564, (uint64_t)v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchItemID:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_10021304C(v7, (uint64_t)sub_10021F504, v6);

  swift_release();

  swift_release();
}

- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_100011348(0, (unint64_t *)&unk_100ACEC40);
  unint64_t v6 = sub_10096C0A0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = sub_10021F4D8;
  v8[3] = v7;
  v8[4] = self;
  swift_retain_n();
  swift_retain();
  sub_100295C1C(v6, (uint64_t)sub_10021F4F8, (uint64_t)v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_10021F464;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_10021F464;
  v7[4] = v5;
  swift_retain_n();
  swift_retain_n();
  sub_10028FCD4((uint64_t)"fetchTrashIdentifiers(completionHandler:)", 41, 2, (void (*)(void *, id))sub_1002201E8, v6, (uint64_t)sub_10021F4CC, (uint64_t)v7);
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (id)fetchPublishingURLForItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1000717BC;
  v8[5] = v7;
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  swift_retain();
  sub_100290114((uint64_t)"fetchPublishingURL(for:completionHandler:)", 42, 2, (void (*)(char *, id))sub_1000717BC, v7, (uint64_t)sub_10021F458, (uint64_t)v8);

  swift_release();
  swift_release();
  swift_release();

  return 0;
}

- (id)disconnectDomainID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_retain();
  id v10 = (void *)sub_10021D5BC(v9, a4, (uint64_t)self, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();

  return v10;
}

- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v8 = v7;
  _Block_copy(v5);
  swift_retain();
  sub_10021DAA8(v6, v8, (uint64_t)self, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = (void *)swift_allocObject();
  v10[2] = self;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = sub_10021F214;
  v10[6] = v9;
  id v11 = a3;
  swift_retain_n();
  id v12 = v11;
  swift_retain();
  sub_10028EA68((uint64_t)"attemptRecovery(fromError:optionIndex:completionHandler:)", 57, 2, sub_10021F214, v9, (uint64_t)sub_10021F2F8, (uint64_t)v10);
  swift_release();

  swift_release();

  swift_release();
}

- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)aBlock
{
  uint64_t v15 = _Block_copy(aBlock);
  if (a4)
  {
    sub_100011348(0, (unint64_t *)&unk_100ACD9F0);
    a4 = (id)sub_10096C0A0();
  }
  if (a7) {
    a7 = (id)sub_10096C2F0();
  }
  if (a8) {
    a8 = (id)sub_10096C2F0();
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  swift_retain();
  sub_100214978(v17, (objc_class *)a4, a5, a6, (objc_class *)a7, (objc_class *)a8, (uint64_t)sub_10021F20C, v16);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7 = _Block_copy(a6);
  sub_100011348(0, (unint64_t *)&unk_100ACEC40);
  unint64_t v8 = sub_10096C0A0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  swift_retain();
  sub_1002173EC(v8, a5, (uint64_t)sub_100071B10, v9);
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  unint64_t v8 = _Block_copy(a6);
  uint64_t v9 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v11 = v10;
  type metadata accessor for NSFileProviderItemIdentifier(0);
  uint64_t v12 = sub_10096C0A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  swift_retain();
  id v14 = a5;
  uint64_t v15 = sub_10021C944(v12, (uint64_t)self);
  id v16 = [self progressWithTotalUnitCount:1];
  id v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = sub_1000640A8;
  v17[4] = v13;
  v17[5] = self;
  v17[6] = v9;
  v17[7] = v11;
  v17[8] = v14;
  swift_retain();
  id v18 = v14;
  id v19 = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100295C1C((unint64_t)v15, (uint64_t)sub_10021F1D8, (uint64_t)v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return v19;
}

- (void)updateIgnoreStateOfItemWithIdentifiers:(id)a3 ignoreState:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  uint64_t v8 = sub_10096C0A0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10021E230;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = self;
  *(unsigned char *)(v11 + 32) = a4;
  *(void *)(v11 + 40) = sub_10021E230;
  *(void *)(v11 + 48) = v9;
  swift_retain_n();
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_100294164((uint64_t)"updateIgnoreStateOfItem(withIdentifiers:ignoreState:completionHandler:)", 71, 2, (void (*)(void *, void **, id))sub_10021E238, v10, (uint64_t)sub_10021E294, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end