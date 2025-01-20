@interface CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem
- (CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem)init;
- (NSNumber)errorCode;
- (NSString)destinationRecordID;
- (NSString)errorDomain;
- (NSString)errorMessage;
- (NSString)originRecordID;
- (void)setDestinationRecordID:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setOriginRecordID:(id)a3;
@end

@implementation CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem

- (NSString)originRecordID
{
  return (NSString *)sub_100142DC0();
}

- (void)setOriginRecordID:(id)a3
{
}

- (NSString)destinationRecordID
{
  return (NSString *)sub_100142DC0();
}

- (void)setDestinationRecordID:(id)a3
{
}

- (NSString)errorMessage
{
  return (NSString *)sub_100142DC0();
}

- (void)setErrorMessage:(id)a3
{
}

- (NSNumber)errorCode
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem_errorCode);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorDomain
{
  return (NSString *)sub_100142DC0();
}

- (void)setErrorDomain:(id)a3
{
}

- (CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem_originRecordID);
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR___CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem_destinationRecordID);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem_errorMessage);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  uint64_t v6 = OBJC_IVAR___CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem_errorCode;
  id v7 = objc_allocWithZone((Class)NSNumber);
  v8 = self;
  *(Class *)((char *)&self->super.isa + v6) = (Class)[v7 init];
  v9 = (Class *)((char *)&v8->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem_errorDomain);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem();
  return [(CPLCKPhotosSharedLibraryExitMoveBatchFeedbackItem *)&v11 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end