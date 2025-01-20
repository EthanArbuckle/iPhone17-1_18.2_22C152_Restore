@interface AuthorizationAuthenticator
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC19FamilyControlsAgent26AuthorizationAuthenticator)init;
- (void)didCompleteAuthenticationRequestWithStatus:(id)a3 error:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation AuthorizationAuthenticator

- (_TtC19FamilyControlsAgent26AuthorizationAuthenticator)init
{
  return (_TtC19FamilyControlsAgent26AuthorizationAuthenticator *)sub_100017084();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19FamilyControlsAgent26AuthorizationAuthenticator_anonymousListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19FamilyControlsAgent26AuthorizationAuthenticator_syncQueue));
  sub_100018E74(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19FamilyControlsAgent26AuthorizationAuthenticator_requestCompletionHandler));
  sub_100015758((uint64_t)self + OBJC_IVAR____TtC19FamilyControlsAgent26AuthorizationAuthenticator_requestResponse, (uint64_t *)&unk_100073EA0);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018F70(v4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100017958(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_10001916C(v6, (uint64_t)a4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_100018310((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)didCompleteAuthenticationRequestWithStatus:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = self;
  id v9 = a4;
  sub_10001866C(a3, (uint64_t)a4);
}

@end