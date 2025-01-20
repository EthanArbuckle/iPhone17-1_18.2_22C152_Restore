@interface FIPauseRingsCoordinator
+ (NSString)activitySummaryCacheChangedNotification;
+ (NSString)activitySummaryRangeNotificationKey;
+ (NSString)didUpdatePauseStateNotification;
+ (NSString)initialPauseStateLoadedNotification;
- (BOOL)isPaused;
- (BOOL)isPausedForActivitySummary:(id)a3;
- (BOOL)isPausedForActivitySummaryCacheIndex:(int64_t)a3;
- (BOOL)isPausedForActivitySummaryCacheIndexStart:(int64_t)a3 end:(int64_t)a4;
- (FIPauseRingsCoordinator)init;
- (FIPauseRingsCoordinator)initWithHealthStore:(id)a3;
- (NSDate)resumeDate;
- (id)formattedResumeDate;
- (void)dealloc;
- (void)pauseRingsUntilDate:(id)a3 completionHandler:(id)a4;
- (void)unpauseRingsWithCompletionHandler:(id)a3;
@end

@implementation FIPauseRingsCoordinator

+ (NSString)activitySummaryCacheChangedNotification
{
  v2 = (void *)sub_21C7818A0();
  return (NSString *)v2;
}

+ (NSString)didUpdatePauseStateNotification
{
  v2 = (void *)sub_21C7818A0();
  return (NSString *)v2;
}

+ (NSString)initialPauseStateLoadedNotification
{
  v2 = (void *)sub_21C7818A0();
  return (NSString *)v2;
}

+ (NSString)activitySummaryRangeNotificationKey
{
  v2 = (void *)sub_21C7818A0();
  return (NSString *)v2;
}

- (FIPauseRingsCoordinator)initWithHealthStore:(id)a3
{
  sub_21C7757C4(a3);
  return result;
}

- (void)dealloc
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FIPauseRingsCoordinator_query);
  if (v3)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIPauseRingsCoordinator_healthStore);
    v5 = self;
    objc_msgSend(v4, sel_stopQuery_, v3);
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)FIPauseRingsCoordinator;
  [(FIPauseRingsCoordinator *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIPauseRingsCoordinator_state);
  sub_21C77C3EC(v3);
}

- (BOOL)isPaused
{
  return [(FIPauseRingsCoordinator *)self isPausedForActivitySummary:0];
}

- (BOOL)isPausedForActivitySummary:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  sub_21C77754C(v3);
  LOBYTE(v3) = v7;

  return v3 & 1;
}

- (BOOL)isPausedForActivitySummaryCacheIndex:(int64_t)a3
{
  v4 = self;
  sub_21C777C90(a3);
  LOBYTE(a3) = v5;

  return a3 & 1;
}

- (BOOL)isPausedForActivitySummaryCacheIndexStart:(int64_t)a3 end:(int64_t)a4
{
  v6 = self;
  sub_21C777EFC(a3, a4);
  LOBYTE(a4) = v7;

  return a4 & 1;
}

- (void)pauseRingsUntilDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_21C781730();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t (*)())_Block_copy(a4);
  sub_21C781700();
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = sub_21C77FF44;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = self;
  sub_21C778188((uint64_t)v9, (uint64_t)v10, v11);
  sub_21C77F58C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)unpauseRingsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    char v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_21C77F59C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  sub_21C77926C((uint64_t)v7, v6);
  sub_21C77F58C((uint64_t)v7);
}

- (NSDate)resumeDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0A4A8);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  sub_21C779778((uint64_t)v5);

  uint64_t v7 = sub_21C781730();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_21C7816E0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (id)formattedResumeDate
{
  v2 = self;
  sub_21C779EB8();
  uint64_t v4 = v3;

  if (v4)
  {
    char v5 = (void *)sub_21C7818A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (FIPauseRingsCoordinator)init
{
  result = (FIPauseRingsCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end