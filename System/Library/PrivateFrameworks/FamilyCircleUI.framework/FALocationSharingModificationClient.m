@interface FALocationSharingModificationClient
- (FALocationSharingModificationClient)init;
- (void)isLocationSharingModificationAllowedForUserID:(id)a3 completionHandler:(id)a4;
- (void)setLocationSharingModificationAllowed:(BOOL)a3 forUserID:(id)a4 completionHandler:(id)a5;
@end

@implementation FALocationSharingModificationClient

- (FALocationSharingModificationClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)FALocationSharingModificationClient;
  v2 = [(FALocationSharingModificationClient *)&v6 init];
  id v3 = objc_alloc_init(MEMORY[0x263F671D0]);
  v4 = (void *)_stLocationSharingModificationClient;
  _stLocationSharingModificationClient = (uint64_t)v3;

  return v2;
}

- (void)isLocationSharingModificationAllowedForUserID:(id)a3 completionHandler:(id)a4
{
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forUserID:(id)a4 completionHandler:(id)a5
{
}

@end