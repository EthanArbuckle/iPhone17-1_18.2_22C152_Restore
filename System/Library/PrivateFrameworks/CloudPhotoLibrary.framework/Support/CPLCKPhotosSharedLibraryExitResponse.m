@interface CPLCKPhotosSharedLibraryExitResponse
- (CKRecordZoneID)stagingZoneID;
- (CPLCKPhotosSharedLibraryExitResponse)init;
- (NSError)error;
- (NSString)participantUserID;
- (void)setError:(id)a3;
- (void)setParticipantUserID:(id)a3;
- (void)setStagingZoneID:(id)a3;
@end

@implementation CPLCKPhotosSharedLibraryExitResponse

- (NSString)participantUserID
{
  return (NSString *)sub_100142DC0();
}

- (void)setParticipantUserID:(id)a3
{
}

- (CKRecordZoneID)stagingZoneID
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_stagingZoneID);
  swift_beginAccess();
  return (CKRecordZoneID *)*v2;
}

- (void)setStagingZoneID:(id)a3
{
}

- (NSError)error
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error);
  swift_beginAccess();
  if (*v2)
  {
    swift_errorRetain();
    v3 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSError *)v3;
}

- (void)setError:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error);
  swift_beginAccess();
  id *v4 = a3;
  id v5 = a3;
  swift_errorRelease();
}

- (CPLCKPhotosSharedLibraryExitResponse)init
{
  result = (CPLCKPhotosSharedLibraryExitResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_errorRelease();
}

@end