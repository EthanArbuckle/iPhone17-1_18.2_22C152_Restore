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

- (void)fetchItemID:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_24D3DB8BC(v7, (uint64_t)sub_24D418088, v6);

  swift_release();

  swift_release();
}

- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v10 = _Block_copy(a6);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B1940B0);
  unint64_t v11 = sub_24DCC9C28();
  _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  sub_24D5B0C40((uint64_t)a3, v11, (uint64_t)self, v10, width, height);
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
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B1940B0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26986BE60);
  sub_24D5B3CD4();
  uint64_t v11 = sub_24DCC9578();
  _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  sub_24D5B0A60((uint64_t)a3, v11, (uint64_t)self, (void (**)(void, void))v10, width, height);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B1940B0);
  unint64_t v7 = sub_24DCC9C28();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  id v9 = a4;
  swift_retain();
  sub_24D5A4DB8(v7, v9, (uint64_t)sub_24D5B3FA0, v8);

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
  sub_24D5A5398(v11, a4, a5, (uint64_t)sub_24D5B3F94, v10);

  swift_release();

  swift_release();
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B199E90);
  sub_24DCC9C28();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = *(void **)self->backend;
  swift_retain();
  uint64_t v10 = (void *)sub_24DCC9C18();
  uint64_t v11 = *(void *)self->request;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_24D5B4110;
  *(void *)(v12 + 24) = v8;
  v14[4] = sub_24D5B3CA8;
  v14[5] = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_24D5A55E0;
  v14[3] = &block_descriptor_408;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_bulkItemChanges_changedFields_request_completionHandler_, v10, a4, v11, v13);
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
  *(void *)(v12 + 16) = sub_24D5B34A4;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_24D5B34A4;
  *(void *)(v13 + 24) = v11;
  *(void *)(v13 + 32) = a3;
  *(unsigned char *)(v13 + 40) = a4;
  *(void *)(v13 + 48) = self;
  *(unsigned char *)(v13 + 56) = a5;
  id v14 = a3;
  swift_retain_n();
  swift_retain_n();
  id v15 = v14;
  sub_24D622B40((uint64_t)"fetchHierarchy(for:recursively:ignoreAlternateContentURL:reply:)", 64, 2, (void (*)(void *, id))sub_24D5B34AC, v12, (uint64_t)sub_24D5B3520, v13);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_24DCC97E8();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  swift_retain();
  sub_24D5B0F08(v8, v10, v11, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7
{
  uint64_t v9 = _Block_copy(a7);
  uint64_t v20 = sub_24DCC97E8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_24DCC97E8();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v9;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_24D5B3F94;
  *(void *)(v16 + 24) = v15;
  v17 = (void *)swift_allocObject();
  v17[2] = self;
  v17[3] = v20;
  v17[4] = v11;
  v17[5] = v12;
  v17[6] = v14;
  v17[7] = a5;
  v17[8] = sub_24D5B3F94;
  v17[9] = v15;
  id v18 = a5;
  swift_retain_n();
  swift_retain_n();
  id v19 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D622700((uint64_t)"fetchDefaultContainer(forBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply:)", 91, 2, (void (*)(void *, id))sub_24D5B410C, v16, (uint64_t)sub_24D5B3328, (uint64_t)v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B1940B0);
  unint64_t v6 = sub_24DCC9C28();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = sub_24D5B32A4;
  v8[3] = v7;
  v8[4] = self;
  swift_retain_n();
  swift_retain();
  sub_24D628640(v6, (uint64_t)sub_24D5B32C4, (uint64_t)v8);
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
  *(void *)(v6 + 16) = sub_24D5B3230;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_24D5B3230;
  v7[4] = v5;
  swift_retain_n();
  swift_retain_n();
  sub_24D622F80((uint64_t)"fetchTrashIdentifiers(completionHandler:)", 41, 2, (void (*)(void *, id))sub_24D5B3FA4, v6, (uint64_t)sub_24D5B3298, (uint64_t)v7);
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
  v8[4] = sub_24D5B3204;
  v8[5] = v7;
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  swift_retain();
  sub_24D6233C0((uint64_t)"fetchPublishingURL(for:completionHandler:)", 42, 2, (void (*)(char *, id))sub_24D5B3204, v7, (uint64_t)sub_24D5B3224, (uint64_t)v8);

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
  id v10 = (void *)sub_24D5B1404(v9, a4, (uint64_t)self, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();

  return v10;
}

- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_24DCC97E8();
  uint64_t v8 = v7;
  _Block_copy(v5);
  swift_retain();
  sub_24D5B18F0(v6, v8, (uint64_t)self, (void (**)(void, void))v5);
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
  v10[5] = sub_24D5B3028;
  v10[6] = v9;
  id v11 = a3;
  swift_retain_n();
  id v12 = v11;
  swift_retain();
  sub_24D621EA4((uint64_t)"attemptRecovery(fromError:optionIndex:completionHandler:)", 57, 2, sub_24D5B3028, v9, (uint64_t)sub_24D5B310C, (uint64_t)v10);
  swift_release();

  swift_release();

  swift_release();
}

- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)aBlock
{
  uint64_t v15 = _Block_copy(aBlock);
  if (a4)
  {
    sub_24D3FB6F8(0, (unint64_t *)&unk_26B199E90);
    a4 = (id)sub_24DCC9C28();
  }
  if (a7) {
    a7 = (id)sub_24DCC9E78();
  }
  if (a8) {
    a8 = (id)sub_24DCC9E78();
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  swift_retain();
  sub_24D5A8A48(v17, a4, a5, a6, a7, a8, (uint64_t)sub_24D5B3020, v16);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  uint64_t v7 = _Block_copy(a6);
  sub_24D3FB6F8(0, (unint64_t *)&unk_26B1940B0);
  unint64_t v8 = sub_24DCC9C28();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  swift_retain();
  sub_24D5AB4BC(v8, a5, (uint64_t)sub_24D5B3F9C, v9);
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  unint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_24DCC97E8();
  uint64_t v11 = v10;
  type metadata accessor for NSFileProviderItemIdentifier(0);
  uint64_t v12 = sub_24DCC9C28();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  swift_retain();
  id v14 = a5;
  unint64_t v15 = sub_24D5B078C(v12, (uint64_t)self);
  id v16 = objc_msgSend(self, sel_progressWithTotalUnitCount_, 1);
  id v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = sub_24D5B2F8C;
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
  sub_24D628640(v15, (uint64_t)sub_24D5B2FEC, (uint64_t)v17);

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
  uint64_t v8 = sub_24DCC9C28();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_24D5B201C;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = self;
  *(unsigned char *)(v11 + 32) = a4;
  *(void *)(v11 + 40) = sub_24D5B201C;
  *(void *)(v11 + 48) = v9;
  swift_retain_n();
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_24D627410((uint64_t)"updateIgnoreStateOfItem(withIdentifiers:ignoreState:completionHandler:)", 71, 2, (void (*)(void *, uint64_t *, id))sub_24D5B2024, v10, (uint64_t)sub_24D5B2080, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end