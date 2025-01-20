@interface IMDSpotlightDaemonClient
- (IMDSpotlightDaemonClient)init;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLsForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifiers:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4;
- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3;
@end

@implementation IMDSpotlightDaemonClient

- (IMDSpotlightDaemonClient)init
{
  sub_1D98DEAE0();
  return result;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1D9906DA0();
  unint64_t v9 = v8;
  uint64_t v10 = sub_1D9906DA0();
  unint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  v14 = self;
  sub_1D98DF030(v7, v9, v10, v12, (uint64_t)sub_1D98E3470, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  uint64_t v7 = _Block_copy(a6);
  uint64_t v8 = sub_1D9906F20();
  uint64_t v9 = sub_1D9906DA0();
  unint64_t v11 = v10;
  uint64_t v12 = sub_1D9906DA0();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  v16 = self;
  sub_1D98DF4CC(v8, v9, v11, v12, v14, (uint64_t)sub_1D98E33B4, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)provideFileURLsForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifiers:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  unint64_t v10 = _Block_copy(a8);
  uint64_t v11 = sub_1D9906DA0();
  unint64_t v13 = v12;
  uint64_t v14 = sub_1D9906DA0();
  unint64_t v16 = v15;
  uint64_t v17 = sub_1D9906F20();
  uint64_t v18 = sub_1D9906DA0();
  unint64_t v20 = v19;
  _Block_copy(v10);
  v21 = self;
  sub_1D98E2650(v11, v13, v14, v16, v17, v18, v20, a7, (uint64_t)v21, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  sub_1D968E084(0, &qword_1EA8C9FF0);
  unint64_t v6 = sub_1D9906F20();
  uint64_t v7 = self;
  sub_1D98DFCE4(v6, a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDSpotlightDaemonClient_queue);
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  sub_1D968E084(0, &qword_1EA8C88D8);
  sub_1D9906CD0();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  id v7 = (id)sub_1D9906CB0();
  objc_msgSend(v6, sel_updateChatsUsingMessageGUIDsAndSummaries_, v7);

  swift_bridgeObjectRelease();
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_1D9906F20();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  unint64_t v10 = self;
  sub_1D98E02E8(v8, a4, (uint64_t)sub_1D98E102C, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

@end