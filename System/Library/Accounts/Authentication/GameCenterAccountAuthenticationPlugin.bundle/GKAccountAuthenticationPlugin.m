@interface GKAccountAuthenticationPlugin
- (BOOL)isPushSupportedForAccount:(id)a3;
- (GKAccountAuthenticationPlugin)init;
- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6;
- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation GKAccountAuthenticationPlugin

- (GKAccountAuthenticationPlugin)init
{
  return (GKAccountAuthenticationPlugin *)sub_3618();
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  sub_CD94();
  v16 = (uint64_t (*)())sub_CD20(v10, v11, v12, v13, v14, v15);
  if (v8) {
    sub_CFF0();
  }
  if (v16)
  {
    *(void *)(swift_allocObject() + 16) = v16;
    v16 = sub_C6A0;
  }
  id v17 = v7;
  id v18 = v6;
  id v19 = v9;
  sub_378C();
  sub_C554((uint64_t)v16);

  sub_CD68();
  swift_bridgeObjectRelease();
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  sub_CD94();
  v16 = sub_CD20(v10, v11, v12, v13, v14, v15);
  if (v8) {
    sub_CFF0();
  }
  if (v16)
  {
    *(void *)(swift_allocObject() + 16) = v16;
    v16 = sub_C54C;
  }
  id v17 = v7;
  id v18 = v6;
  id v19 = v9;
  sub_4390();
  sub_C554((uint64_t)v16);

  sub_CD68();
  swift_bridgeObjectRelease();
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_7CFC();

  return 1;
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = self;
  int v14 = (void *)sub_7E18((uint64_t)a3, a4);

  return v14;
}

- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  sub_CD94();
  uint64_t v7 = v6;
  v9 = v8;
  id v11 = v10;
  int v13 = v12;
  v15 = (void (*)(void, id))_Block_copy(v14);
  if (v7) {
    sub_CFF0();
  }
  if (v15)
  {
    *(void *)(swift_allocObject() + 16) = v15;
    v15 = (void (*)(void, id))sub_C54C;
  }
  id v16 = v11;
  id v17 = v9;
  id v18 = v13;
  sub_81F4((uint64_t)v18, v9, v19, v15);
  sub_C554((uint64_t)v15);

  sub_CD68();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GKAccountAuthenticationPlugin_followUpController);
}

@end