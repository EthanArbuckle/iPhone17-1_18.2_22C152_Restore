@interface PHContactsReportAndBlockTableViewModel
- (BOOL)shouldShowBlockAll;
- (BOOL)shouldShowBlockUnknown;
- (BOOL)shouldShowReportInitiator;
- (CHRecentCall)recentCall;
- (NSString)formattedInitiatorValue;
- (PHContactsReportAndBlockTableViewModel)init;
- (PHContactsReportAndBlockTableViewModel)initWithShouldShowBlockAll:(BOOL)a3 shouldShowReportInitiator:(BOOL)a4 shouldShowBlockUnknown:(BOOL)a5 recentCall:(id)a6 reportSpammer:(id)a7;
- (_TtP11MobilePhone18ReportSpamManaging_)reportSpammer;
- (int64_t)numberOfSections;
- (void)blockContacts:(id)a3;
- (void)reportWithRecentCall:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setReportSpammer:(id)a3;
- (void)setShouldShowBlockAll:(BOOL)a3;
- (void)setShouldShowBlockUnknown:(BOOL)a3;
- (void)setShouldShowReportInitiator:(BOOL)a3;
- (void)unblockWithContacts:(id)a3;
@end

@implementation PHContactsReportAndBlockTableViewModel

- (BOOL)shouldShowBlockAll
{
  v2 = (BOOL *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowBlockAll:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldShowReportInitiator
{
  v2 = (BOOL *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowReportInitiator:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldShowBlockUnknown
{
  v2 = (BOOL *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowBlockUnknown:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (CHRecentCall)recentCall
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall);
  swift_beginAccess();
  return (CHRecentCall *)*v2;
}

- (void)setRecentCall:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall);
  swift_beginAccess();
  v5 = *v4;
  BOOL *v4 = a3;
  id v6 = a3;
}

- (_TtP11MobilePhone18ReportSpamManaging_)reportSpammer
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP11MobilePhone18ReportSpamManaging_ *)v2;
}

- (void)setReportSpammer:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_reportSpammer);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (PHContactsReportAndBlockTableViewModel)initWithShouldShowBlockAll:(BOOL)a3 shouldShowReportInitiator:(BOOL)a4 shouldShowBlockUnknown:(BOOL)a5 recentCall:(id)a6 reportSpammer:(id)a7
{
  swift_getObjectType();
  id v13 = a6;
  swift_unknownObjectRetain();

  return (PHContactsReportAndBlockTableViewModel *)specialized ContactsReportAndBlockTableViewModel.init(shouldShowBlockAll:shouldShowReportInitiator:shouldShowBlockUnknown:recentCall:reportSpammer:)(a3, a4, a5, (uint64_t)v13, (uint64_t)a7, self);
}

- (int64_t)numberOfSections
{
  v3 = (char *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll;
  swift_beginAccess();
  if (*v3) {
    return 2;
  }
  v4 = (char *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown;
  swift_beginAccess();
  if (*v4 == 1) {
    return 2;
  }
  id v6 = (char *)self + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator;
  swift_beginAccess();
  if (*v6) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)blockContacts:(id)a3
{
}

- (void)unblockWithContacts:(id)a3
{
}

- (void)reportWithRecentCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  ContactsReportAndBlockTableViewModel.report(recentCall:)(v4);
}

- (NSString)formattedInitiatorValue
{
  return (NSString *)@objc ContactsReportAndBlockTableViewModel.formattedInitiatorValue.getter(self, (uint64_t)a2, (void (*)(void))ContactsReportAndBlockTableViewModel.formattedInitiatorValue.getter);
}

- (PHContactsReportAndBlockTableViewModel)init
{
  result = (PHContactsReportAndBlockTableViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end