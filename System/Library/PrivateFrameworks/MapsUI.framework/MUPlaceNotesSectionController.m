@interface MUPlaceNotesSectionController
- (BOOL)hasContent;
- (BOOL)hasContentBeforePersonalizedSuggestionArbitration;
- (BOOL)isImpressionable;
- (MULibraryAccessProviding)libraryAccessProvider;
- (MUUserInformationProvider)userInfoProvider;
- (NSArray)sectionViews;
- (_TtC6MapsUI29MUPlaceNotesSectionController)initWithMapItem:(id)a3;
- (_TtC6MapsUI29MUPlaceNotesSectionController)initWithMapItem:(id)a3 userInfoProvider:(id)a4 libraryAccessProvider:(id)a5;
- (_TtP6MapsUI37MUPlaceNotesSectionControllerDelegate_)notesSectionDelegate;
- (int)analyticsModuleType;
- (void)dealloc;
- (void)libraryAccessProvider:(id)a3 placeNoteDidChange:(id)a4;
- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4;
- (void)setLibraryAccessProvider:(id)a3;
- (void)setNotesSectionDelegate:(id)a3;
- (void)setUserInfoProvider:(id)a3;
@end

@implementation MUPlaceNotesSectionController

- (MUUserInformationProvider)userInfoProvider
{
  return (MUUserInformationProvider *)sub_19320DBB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_userInfoProvider);
}

- (void)setUserInfoProvider:(id)a3
{
}

- (_TtP6MapsUI37MUPlaceNotesSectionControllerDelegate_)notesSectionDelegate
{
  return (_TtP6MapsUI37MUPlaceNotesSectionControllerDelegate_ *)sub_19320DBB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_notesSectionDelegate);
}

- (void)setNotesSectionDelegate:(id)a3
{
}

- (MULibraryAccessProviding)libraryAccessProvider
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (MULibraryAccessProviding *)v2;
}

- (void)setLibraryAccessProvider:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_193210970(a3);

  swift_unknownObjectRelease();
}

- (_TtC6MapsUI29MUPlaceNotesSectionController)initWithMapItem:(id)a3 userInfoProvider:(id)a4 libraryAccessProvider:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC6MapsUI29MUPlaceNotesSectionController *)MUPlaceNotesSectionController.init(mapItem:userInfoProvider:libraryAccessProvider:)(v7, (uint64_t)a4, a5);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_libraryAccessProvider);
  swift_beginAccess();
  v5 = *v4;
  if (v5) {
    objc_msgSend(v5, sel_unregisterObserver_, self);
  }
  else {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = ObjectType;
  [(MUPlaceNotesSectionController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_userInfoProvider);
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController_notesSectionDelegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSArray)sectionViews
{
  sub_1931F9204(0, (unint64_t *)&qword_1EB4F6F20);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)hasContentBeforePersonalizedSuggestionArbitration
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController__sectionViews);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1933417D0();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (BOOL)hasContent
{
  unint64_t v2 = self;
  uint64_t v3 = [(MUPlaceSectionController *)v2 personalizedSuggestionsArbiterDelegate];
  if (v3)
  {
    unsigned __int8 v4 = [(MUPersonalizedSuggestionSectionArbiterDelegate *)v3 shouldShowPlaceNotesSection];

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {
    unint64_t v6 = *(unint64_t *)((char *)&v2->super.super.isa
                             + OBJC_IVAR____TtC6MapsUI29MUPlaceNotesSectionController__sectionViews);
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_1933417D0();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    return v7 != 0;
  }
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 45;
}

- (void)libraryAccessProvider:(id)a3 placeNoteDidChange:(id)a4
{
  if (a4)
  {
    uint64_t v5 = sub_1933413B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_unknownObjectRetain();
  v8 = self;
  sub_193210A14(v5, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  _s6MapsUI29MUPlaceNotesSectionControllerC21libraryAccessProvider_26savedStateOfPlaceDidChangeySo09MULibraryH9Providing_p_SbtF_0();
  swift_unknownObjectRelease();
}

- (_TtC6MapsUI29MUPlaceNotesSectionController)initWithMapItem:(id)a3
{
}

@end