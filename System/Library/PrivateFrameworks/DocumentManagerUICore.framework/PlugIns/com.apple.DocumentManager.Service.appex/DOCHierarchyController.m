@interface DOCHierarchyController
- (BOOL)effectiveRootLocationIsHidingParentLocations;
- (BOOL)hasPendingLocationChange;
- (BOOL)isFetchingLocations;
- (BOOL)isLoadingDisabled;
- (BOOL)isResetBeingPerformed;
- (BOOL)shouldForceChangeInPreparationQueue;
- (DOCConcreteLocation)effectiveRootLocation;
- (DOCConcreteLocation)lastLocation;
- (DOCConcreteLocation)locationForDeterminingCurrentEffectiveTab;
- (NSArray)effectiveLocations;
- (NSArray)locations;
- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)pickerContext;
- (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController)init;
- (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController)initWithConfiguration:(id)a3 sourceObserver:(id)a4 minParentLocations:(unint64_t)a5;
- (_TtP33com_apple_DocumentManager_Service30DOCHierarchyControllerDelegate_)delegate;
- (unint64_t)defaultTab;
- (unint64_t)effectiveTabSwitcherTab;
- (void)dealloc;
- (void)invalidateAllAssertions;
- (void)invalidateLocations;
- (void)loadAllParentsHiddenByEffectiveRootLocation:(id)a3;
- (void)performWhileForcingChangeInPreparationQueue:(id)a3;
- (void)performWhilePreventingLoading:(id)a3;
- (void)receiveInvalidateLocationsNotification;
- (void)removeTrailingLocationCount:(int64_t)a3 animated:(BOOL)a4;
- (void)reset;
- (void)resetFromRootWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)resetWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)resetWith:(id)a3 effectiveRootLocation:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)resetWithDefaultLocationWithAnimated:(BOOL)a3;
- (void)restoreLastBrowsedStateForTab:(unint64_t)a3;
- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDefaultTab:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsResetBeingPerformed:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setPickerContext:(id)a3;
- (void)setShouldForceChangeInPreparationQueue:(BOOL)a3;
- (void)tagsDidChangeWithNotification:(id)a3;
@end

@implementation DOCHierarchyController

- (unint64_t)effectiveTabSwitcherTab
{
  v2 = self;
  v3 = (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController *)sub_10031D4D4();
  if (v3)
  {
    v4 = v3;
    unint64_t v5 = [(DOCHierarchyController *)v3 effectiveTabSwitcherTab];

    v2 = v4;
  }
  else
  {
    unint64_t v5 = *(unint64_t *)((char *)&v2->super.isa
                             + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_defaultTab);
  }

  return v5;
}

- (_TtP33com_apple_DocumentManager_Service30DOCHierarchyControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP33com_apple_DocumentManager_Service30DOCHierarchyControllerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)locations
{
  swift_beginAccess();
  sub_10003AE74(0, (unint64_t *)&unk_10062C260);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setLocations:(id)a3
{
  sub_10003AE74(0, (unint64_t *)&unk_10062C260);
  uint64_t v4 = sub_1004CD5C0();
  unint64_t v5 = self;
  DOCHierarchyController.locations.setter(v4);
}

- (NSArray)effectiveLocations
{
  NSArray v2 = self;
  sub_10031E65C();

  sub_10003AE74(0, (unint64_t *)&unk_10062C260);
  v3.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v3.super.isa;
}

- (unint64_t)defaultTab
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_defaultTab);
}

- (void)setDefaultTab:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_defaultTab) = (Class)a3;
}

- (BOOL)hasPendingLocationChange
{
  uint64_t v3 = sub_100027178(&qword_10062FDA0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_localOperation;
  swift_beginAccess();
  sub_10003B498((uint64_t)v6, (uint64_t)v5, &qword_10062FDA0);
  uint64_t v7 = type metadata accessor for DOCHierarchyController.FetchingOperationToken(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_10003B3B8((uint64_t)v5, &qword_10062FDA0);
  return (char)v6;
}

- (DOCConcreteLocation)locationForDeterminingCurrentEffectiveTab
{
  NSArray v2 = self;
  uint64_t v3 = (void *)sub_10031D4D4();

  return (DOCConcreteLocation *)v3;
}

- (DOCConcreteLocation)effectiveRootLocation
{
  NSArray v2 = self;
  uint64_t v3 = (void *)sub_10031D268();

  return (DOCConcreteLocation *)v3;
}

- (DOCConcreteLocation)lastLocation
{
  NSArray v2 = self;
  uint64_t v3 = (void *)sub_10031CBD4();

  return (DOCConcreteLocation *)v3;
}

- (BOOL)effectiveRootLocationIsHidingParentLocations
{
  NSArray v2 = self;
  char v3 = sub_10031AFC0();

  return v3 & 1;
}

- (void)loadAllParentsHiddenByEffectiveRootLocation:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10031CCB8((uint64_t)sub_100055C14, v5);

  swift_release();
}

- (BOOL)isResetBeingPerformed
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_isResetBeingPerformed);
}

- (void)setIsResetBeingPerformed:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_isResetBeingPerformed) = a3;
}

- (BOOL)isFetchingLocations
{
  NSArray v2 = self;
  char v3 = sub_10031C9B4();

  return v3 & 1;
}

- (BOOL)isLoadingDisabled
{
  NSArray v2 = self;
  char v3 = sub_1003200D0();

  return v3 & 1;
}

- (void)invalidateAllAssertions
{
  NSArray v2 = self;
  sub_1003202F8();
  sub_1004CB860();

  swift_release();
}

- (void)performWhilePreventingLoading:(id)a3
{
  uint64_t v4 = (void (**)(void))_Block_copy(a3);
  sub_1004CB0E0();
  swift_allocObject();
  uint64_t v5 = self;
  sub_1004CB0D0();
  sub_1003202F8();
  sub_1004CB880();
  swift_release();
  v4[2](v4);
  sub_1004CB0C0();
  swift_release();
  _Block_release(v4);
}

- (BOOL)shouldForceChangeInPreparationQueue
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_shouldForceChangeInPreparationQueue);
}

- (void)setShouldForceChangeInPreparationQueue:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_shouldForceChangeInPreparationQueue) = a3;
}

- (void)performWhileForcingChangeInPreparationQueue:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_shouldForceChangeInPreparationQueue;
  char v6 = *((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_shouldForceChangeInPreparationQueue);
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_shouldForceChangeInPreparationQueue) = 1;
  uint64_t v7 = (void (*)(void *))v4[2];
  v8 = self;
  v7(v4);
  *((unsigned char *)&self->super.isa + v5) = v6;
  _Block_release(v4);
}

- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)pickerContext
{
  return (_TtC33com_apple_DocumentManager_Service16DOCPickerContext *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_pickerContext);
}

- (void)setPickerContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_pickerContext);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_pickerContext) = (Class)a3;
  id v3 = a3;
}

- (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController)initWithConfiguration:(id)a3 sourceObserver:(id)a4 minParentLocations:(unint64_t)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = self;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v9 defaultManager];
  id v13 = [self sharedStore];
  id v14 = objc_allocWithZone(ObjectType);
  v15 = DOCHierarchyController.init(configuration:sourceObserver:minParentLocations:itemManager:userInterfaceStateStore:)(v10, v11, a5, v12, v13);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController *)v15;
}

- (void)dealloc
{
  NSArray v2 = self;
  DOCHierarchyController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003B3B8((uint64_t)self+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController__currentUpdateExpectation, (uint64_t *)&unk_100639798);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_effectiveRootLocationCandidate));
  sub_10003B3B8((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_loadingDisabledOperation, &qword_10062FDA0);
  sub_10003B3B8((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_localOperation, &qword_10062FDA0);
  sub_10003B0A8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_delayedLoadingBlock));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_locationChangePreparationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_nodeResolvingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_lastVisitedLocationSavingQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_itemManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_sourceObserverContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_sourceObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_userInterfaceStateStore));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_pickerContext));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_activeOrInflightAppend);
  id v4 = *(void **)&self->delegate[OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCHierarchyController_activeOrInflightAppend];
  sub_100153E38(v3, v4);
}

- (void)resetWithDefaultLocationWithAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_1003227C0(v3);
}

- (void)resetWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_100117074;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = self;
  sub_10031C418(v10, a3, v5, 1, 0, v8, v9);
  sub_10003B0A8((uint64_t)v8);
}

- (void)resetWith:(id)a3 effectiveRootLocation:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (*)(void))_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    id v10 = (void (*)(void))sub_100117074;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_10031C418(v12, a4, v6, 1, 0, v10, v11);
  sub_10003B0A8((uint64_t)v10);
}

- (void)resetFromRootWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_100117074;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_1003246BC(v10, a4, v8, v9);
  sub_10003B0A8((uint64_t)v8);
}

- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v8;
    v8 = (void (*)(void))sub_100116D98;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_100325DCC(v10, v5, v8, v9);
  sub_10003B0A8((uint64_t)v8);
}

- (void)reset
{
  NSArray v2 = self;
  sub_100327168();
}

- (void)removeTrailingLocationCount:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v5 = self;
  sub_10034838C(a3);
}

- (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController)init
{
  result = (_TtC33com_apple_DocumentManager_Service22DOCHierarchyController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)receiveInvalidateLocationsNotification
{
  BOOL v3 = self;
  id v4 = self;
  [v3 cancelPreviousPerformRequestsWithTarget:v4 selector:"invalidateLocations" object:0];
  [(DOCHierarchyController *)v4 performSelector:"invalidateLocations" withObject:0 afterDelay:0.2];
}

- (void)invalidateLocations
{
  NSArray v2 = self;
  sub_10033AFA4();
}

- (void)restoreLastBrowsedStateForTab:(unint64_t)a3
{
  id v4 = self;
  DOCHierarchyController.restoreLastBrowsedState(forTab:)((void *)a3);
}

- (void)tagsDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_10034D448();
}

@end