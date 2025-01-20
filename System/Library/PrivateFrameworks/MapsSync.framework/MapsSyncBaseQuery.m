@interface MapsSyncBaseQuery
+ (NSArray)additionalNotificationTypes;
+ (OS_os_log)signpostLog;
- (BOOL)isInitComplete;
- (BOOL)isReady;
- (NSPredicate)predicate;
- (_TtC8MapsSync17MapsSyncBaseQuery)init;
- (_TtC8MapsSync17MapsSyncBaseQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4;
- (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate)mapsSyncFetchedResultsControllerDelegate;
- (_TtP8MapsSync21MapsSyncQueryProtocol_)genericQuery;
- (_TtP8MapsSync25MapsSyncDataQueryDelegate_)delegate;
- (_TtP8MapsSync30MapsSyncDataQueryMergeDelegate_)mergeDelegate;
- (id)findDuplicates:(id)a3;
- (id)mergeDuplicateObjectsWithDuplicates:(id)a3;
- (uint64_t)queryContextDidChangeWithNotification:;
- (void)completeInit;
- (void)deleteAllObjectsWithCompletion:(id)a3;
- (void)fetchBaseContents:(id)a3;
- (void)fetchBaseContentsWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)fetchCountWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)fetchQueryBaseContents:(id)a3;
- (void)fetchQueryBaseContentsWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)fetchedResultsDidChangeObjectWithControllerDelegate:(id)a3 object:(id)a4 indexPath:(id)a5 changeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)fetchedResultsWillChangeWithControllerDelegate:(id)a3;
- (void)preFetchHook:(id)a3;
- (void)queryContentsDidChangeObjectWithNotification:(id)a3 object:(id)a4 indexPath:(id)a5 changeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)queryContentsDidChangeWithNotification:(id)a3;
- (void)queryContentsDidLoadWithNotification:(id)a3;
- (void)queryContentsWillChangeWithNotification:(id)a3;
- (void)queryIsReady;
- (void)reloadContentsWithCompletion:(id)a3 queue:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGenericQuery:(id)a3;
- (void)setMapsSyncFetchedResultsControllerDelegate:(id)a3;
- (void)setMergeDelegate:(id)a3;
- (void)setPredicate:(id)a3;
- (void)watchItemsMatchingPredicate:(id)a3;
@end

@implementation MapsSyncBaseQuery

- (_TtP8MapsSync30MapsSyncDataQueryMergeDelegate_)mergeDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mergeDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD0C7D70](v2);
  return (_TtP8MapsSync30MapsSyncDataQueryMergeDelegate_ *)v3;
}

- (void)setMergeDelegate:(id)a3
{
}

- (_TtP8MapsSync21MapsSyncQueryProtocol_)genericQuery
{
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP8MapsSync21MapsSyncQueryProtocol_ *)v2;
}

- (void)setGenericQuery:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_genericQuery) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtP8MapsSync25MapsSyncDataQueryDelegate_)delegate
{
  v2 = (void *)MEMORY[0x1AD0C7D70]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate, a2);
  return (_TtP8MapsSync25MapsSyncDataQueryDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_predicate));
}

- (void)setPredicate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_predicate) = (Class)a3;
  id v3 = a3;
}

- (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate)mapsSyncFetchedResultsControllerDelegate
{
  return (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate);
}

- (void)setMapsSyncFetchedResultsControllerDelegate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate) = (Class)a3;
  id v3 = a3;
}

- (_TtC8MapsSync17MapsSyncBaseQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  return (_TtC8MapsSync17MapsSyncBaseQuery *)sub_1A6F94BA0((uint64_t)a3, a4);
}

- (void)completeInit
{
  uint64_t v3 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete) = 1;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), sel_unlock);
}

- (BOOL)isInitComplete
{
  uint64_t v3 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  LOBYTE(v4) = *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete);
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), sel_unlock);

  return (char)v4;
}

- (void)preFetchHook:(id)a3
{
  id v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  id v6 = self;
  v5(v4);
  _Block_release(v4);
}

+ (NSArray)additionalNotificationTypes
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6703E0);
  v2 = (void *)sub_1A709D4C8();
  return (NSArray *)v2;
}

+ (OS_os_log)signpostLog
{
  sub_1A6EE80D0(0, (unint64_t *)&qword_1EB671810);
  v2 = (void *)sub_1A709D858();
  return (OS_os_log *)v2;
}

- (BOOL)isReady
{
  v2 = self;
  unsigned __int8 v3 = sub_1A6F95054();

  return v3 & 1;
}

- (id)mergeDuplicateObjectsWithDuplicates:(id)a3
{
  type metadata accessor for MapsSyncBaseItem();
  sub_1A709D4D8();
  id v4 = (char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mergeDelegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x1AD0C7D70](v4);
  if (v5)
  {
    id v6 = (void *)v5;
    v7 = self;
    v8 = (void *)sub_1A709D4C8();
    id v9 = objc_msgSend(v6, sel_mergeDuplicateObjectsWithQuery_duplicates_, v7, v8);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v9 = 0;
  }
  return v9;
}

- (void)fetchCountWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1A6F9B264(a3, v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)fetchBaseContents:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = sub_1A6F9CB58;
  v6[3] = v5;
  id v7 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F9CBE0, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchBaseContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1A6F9BDDC;
  v8[3] = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F9CBE0, v8, a3);

  swift_release();
  swift_release();
}

- (void)fetchQueryBaseContents:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (void *)swift_allocObject();
  v6[2] = sub_1A6F9CB50;
  v6[3] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F9CBE4, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchQueryBaseContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1A6F9BDAC;
  v8[3] = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A6F95778((void (*)(void, void))sub_1A6F9CBE4, v8, a3);

  swift_release();
  swift_release();
}

- (void)reloadContentsWithCompletion:(id)a3 queue:(id)a4
{
  id v6 = _Block_copy(a3);
  if (v6)
  {
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = v6;
    id v6 = sub_1A6F9BD7C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a4;
  id v9 = self;
  sub_1A6F95778((void (*)(void, void))v6, v7, a4);
  sub_1A6F339E8((uint64_t)v6);
}

- (void)deleteAllObjectsWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_1A6F95C84((uint64_t)sub_1A6F339E0, v5);

  swift_release();
}

- (void)watchItemsMatchingPredicate:(id)a3
{
  unsigned __int8 v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate);
  if (v3)
  {
    id v6 = a3;
    uint64_t v7 = self;
    id v8 = v3;
    sub_1A6F9659C(a3);
  }
}

- (void)queryIsReady
{
  unsigned __int8 v3 = (void *)MEMORY[0x1AD0C7D70]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate, a2);
  if (v3)
  {
    id v4 = v3;
    if (objc_msgSend(v3, sel_respondsToSelector_, sel_queryIsReadyWithQuery_))
    {
      uint64_t v5 = self;
      objc_msgSend(v4, sel_queryIsReadyWithQuery_, v5);
    }
    swift_unknownObjectRelease();
  }
}

- (void)queryContentsDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_1A709D088();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D048();
  id v8 = self;
  sub_1A6F95E34();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (uint64_t)queryContextDidChangeWithNotification:
{
  uint64_t v0 = sub_1A709D088();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  unsigned __int8 v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D048();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)queryContentsWillChangeWithNotification:(id)a3
{
}

- (void)queryContentsDidChangeObjectWithNotification:(id)a3 object:(id)a4 indexPath:(id)a5 changeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB66FCC0);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  v17 = (char *)&v27 - v16;
  uint64_t v28 = sub_1A709D088();
  uint64_t v18 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D048();
  if (a5)
  {
    sub_1A709D278();
    uint64_t v21 = sub_1A709D288();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 0, 1, v21);
  }
  else
  {
    uint64_t v22 = sub_1A709D288();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 1, 1, v22);
  }
  if (a7)
  {
    sub_1A709D278();
    uint64_t v23 = sub_1A709D288();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v15, 0, 1, v23);
  }
  else
  {
    uint64_t v24 = sub_1A709D288();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 1, 1, v24);
  }
  id v25 = a4;
  v26 = self;
  sub_1A6F96100((uint64_t)v26, (uint64_t)v25, (uint64_t)v17, a6, (uint64_t)v15);

  sub_1A6F22460((uint64_t)v15, &qword_1EB66FCC0);
  sub_1A6F22460((uint64_t)v17, &qword_1EB66FCC0);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v28);
}

- (void)queryContentsDidLoadWithNotification:(id)a3
{
}

- (void)fetchedResultsWillChangeWithControllerDelegate:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1AD0C7D70]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_queryContentsWillChangeWithQuery_))
    {
      id v7 = a3;
      id v8 = self;
      objc_msgSend(v6, sel_queryContentsWillChangeWithQuery_, v8);
    }
    swift_unknownObjectRelease();
  }
}

- (void)fetchedResultsDidChangeObjectWithControllerDelegate:(id)a3 object:(id)a4 indexPath:(id)a5 changeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB66FCC0);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)&v46 - v18;
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  uint64_t v22 = (char *)&v46 - v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v46 - v23;
  if (a5)
  {
    sub_1A709D278();
    uint64_t v25 = sub_1A709D288();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 0, 1, v25);
  }
  else
  {
    uint64_t v26 = sub_1A709D288();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v24, 1, 1, v26);
  }
  if (a7)
  {
    sub_1A709D278();
    uint64_t v27 = sub_1A709D288();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v22, 0, 1, v27);
  }
  else
  {
    uint64_t v28 = sub_1A709D288();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v22, 1, 1, v28);
  }
  v29 = (void *)MEMORY[0x1AD0C7D70]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate);
  if (!v29) {
    goto LABEL_17;
  }
  v30 = v29;
  if ((objc_msgSend(v29, sel_respondsToSelector_, sel_queryContentsDidChangeObjectWithQuery_object_indexPath_changeType_newIndexPath_) & 1) == 0)
  {
    swift_unknownObjectRelease();
LABEL_17:
    sub_1A6F22460((uint64_t)v22, &qword_1EB66FCC0);
    sub_1A6F22460((uint64_t)v24, &qword_1EB66FCC0);
    return;
  }
  id v50 = a3;
  id v51 = a4;
  v49 = v16;
  uint64_t v48 = sub_1A6F9B848(a6);
  if ((v31 & 1) == 0)
  {
    sub_1A6F9BCDC((uint64_t)v24, (uint64_t)v19);
    uint64_t v32 = sub_1A709D288();
    uint64_t v33 = *(void *)(v32 - 8);
    v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    int v35 = v34(v19, 1, v32);
    id v50 = v50;
    id v51 = v51;
    v47 = self;
    uint64_t v36 = 0;
    if (v35 != 1)
    {
      uint64_t v36 = sub_1A709D268();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v32);
    }
    v37 = (void *)v36;
    uint64_t v38 = (uint64_t)v49;
    sub_1A6F9BCDC((uint64_t)v22, (uint64_t)v49);
    if (v34((char *)v38, 1, v32) == 1)
    {
      v39 = 0;
    }
    else
    {
      v39 = (void *)sub_1A709D268();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v38, v32);
    }
    v40 = v47;
    id v41 = v50;
    id v42 = v51;
    objc_msgSend(v30, sel_queryContentsDidChangeObjectWithQuery_object_indexPath_changeType_newIndexPath_, v47, v51, v37, v48, v39);

    swift_unknownObjectRelease();
    goto LABEL_17;
  }
  id v43 = v50;
  id v44 = v51;
  v45 = self;
  swift_unknownObjectRelease();
  __break(1u);
}

- (id)findDuplicates:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB671190);
  unsigned __int8 v3 = (void *)sub_1A709D4C8();
  return v3;
}

- (_TtC8MapsSync17MapsSyncBaseQuery)init
{
  result = (_TtC8MapsSync17MapsSyncBaseQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A6F33A08((uint64_t)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mergeDelegate);
  swift_unknownObjectRelease();
  sub_1A6F33A08((uint64_t)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate));

  swift_release();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock);
}

@end