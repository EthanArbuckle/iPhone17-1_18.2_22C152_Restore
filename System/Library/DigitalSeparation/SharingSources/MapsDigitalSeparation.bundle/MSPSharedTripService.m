@interface MSPSharedTripService
- (NSString)displayDetail;
- (NSString)displayName;
- (int64_t)visibility;
- (unint64_t)participationAccess;
- (void)_ds_stopSharingWithCompletion:(id)a3;
- (void)_ds_stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation MSPSharedTripService

- (NSString)displayDetail
{
  return (NSString *)@"Navigation";
}

- (NSString)displayName
{
  return 0;
}

- (int64_t)visibility
{
  return 1;
}

- (unint64_t)participationAccess
{
  return 1;
}

- (void)_ds_stopSharingWithCompletion:(id)a3
{
}

- (void)_ds_stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MSPSharedTripService *)self stopSharingWithContact:v7 reason:1 completion:v6];
  }
}

@end