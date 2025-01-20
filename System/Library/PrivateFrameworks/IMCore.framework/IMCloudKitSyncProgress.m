@interface IMCloudKitSyncProgress
- (BOOL)isHidden;
- (BOOL)shouldShowIndeterminateProgress;
- (BOOL)shouldShowProgressBar;
- (BOOL)shouldShowUserActionLabel;
- (BOOL)shouldShowUserMessageLabel;
- (IMCloudKitSyncProgress)init;
- (IMCloudKitSyncProgress)initWithType:(int64_t)a3 syncState:(id)a4 syncStatistics:(id)a5;
- (IMCloudKitSyncState)syncState;
- (IMCloudKitSyncStatistics)syncStatistics;
- (NSArray)errors;
- (NSString)actionLabel;
- (NSString)description;
- (NSString)percentCompleteString;
- (NSString)progressLabel;
- (NSString)userMessageLabel;
- (double)broadcastDeferralOverride;
- (double)percentComplete;
- (double)progressBarMax;
- (double)progressBarValue;
- (double)remainingItems;
- (int64_t)type;
@end

@implementation IMCloudKitSyncProgress

- (IMCloudKitSyncState)syncState
{
  return (IMCloudKitSyncState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___IMCloudKitSyncProgress_syncState));
}

- (IMCloudKitSyncStatistics)syncStatistics
{
  return (IMCloudKitSyncStatistics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___IMCloudKitSyncProgress_syncStatistics));
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncProgress_type);
}

- (double)progressBarValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncProgress_progressBarValue);
}

- (double)progressBarMax
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncProgress_progressBarMax);
}

- (BOOL)shouldShowProgressBar
{
  return self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 16];
}

- (BOOL)shouldShowIndeterminateProgress
{
  return self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 17];
}

- (BOOL)shouldShowUserMessageLabel
{
  return *(void *)&self->type[OBJC_IVAR___IMCloudKitSyncProgress_descriptor] != 0;
}

- (BOOL)shouldShowUserActionLabel
{
  return *(void *)&self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 8] != 0;
}

- (NSString)progressLabel
{
  return (NSString *)sub_1A4C9F2EC(self, (uint64_t)a2, (void (*)(void))sub_1A4C9EE00);
}

- (NSString)userMessageLabel
{
  if (*(void *)&self->type[OBJC_IVAR___IMCloudKitSyncProgress_descriptor])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)actionLabel
{
  if (*(void *)&self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (double)broadcastDeferralOverride
{
  return *(double *)&self->descriptor[OBJC_IVAR___IMCloudKitSyncProgress_descriptor + 24];
}

- (BOOL)isHidden
{
  return (id)[(IMCloudKitSyncProgress *)self type] == (id)2;
}

- (double)percentComplete
{
  v2 = self;
  [(IMCloudKitSyncProgress *)v2 progressBarMax];
  if (v3 == 0.0)
  {

    return 1.0;
  }
  else
  {
    [(IMCloudKitSyncProgress *)v2 progressBarValue];
    double v6 = v5;
    [(IMCloudKitSyncProgress *)v2 progressBarMax];
    double v8 = v7;

    return v6 / v8;
  }
}

- (double)remainingItems
{
  v2 = self;
  [(IMCloudKitSyncProgress *)v2 progressBarMax];
  double v4 = v3;
  [(IMCloudKitSyncProgress *)v2 progressBarValue];
  double v6 = v5;

  return v4 - v6;
}

- (NSString)percentCompleteString
{
  sub_1A4B0C510(0, (unint64_t *)&qword_1E965DA70);
  double v3 = self;
  MEMORY[0x1A62627E0]([(IMCloudKitSyncProgress *)v3 percentComplete]);
  uint64_t v5 = v4;

  if (v5)
  {
    double v6 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }

  return (NSString *)v6;
}

- (NSArray)errors
{
  v2 = self;
  double v3 = [(IMCloudKitSyncProgress *)v2 syncState];
  if (v3
    && (uint64_t v4 = v3,
        uint64_t v5 = [(IMCloudKitSyncState *)v3 errors],
        v4,
        v5))
  {
    sub_1A4B0E048(&qword_1E965B4A8);
    sub_1A4CBB15C();

    double v6 = (void *)sub_1A4CBB14C();
    swift_bridgeObjectRelease();
  }
  else
  {

    double v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSString)description
{
  return (NSString *)sub_1A4C9F2EC(self, (uint64_t)a2, (void (*)(void))IMCloudKitSyncProgress.description.getter);
}

- (IMCloudKitSyncProgress)init
{
  result = (IMCloudKitSyncProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (IMCloudKitSyncProgress)initWithType:(int64_t)a3 syncState:(id)a4 syncStatistics:(id)a5
{
  id v8 = objc_allocWithZone((Class)IMCloudKitSyncProgress);
  id v9 = a4;
  id v10 = a5;
  v11 = (IMCloudKitSyncProgress *)sub_1A4C9FCD8(a3, a4, a5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

@end