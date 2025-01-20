@interface MessageCache
- (void)createSessionWith:(int64_t)a3;
- (void)destroySessionFor:(int64_t)a3;
- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4;
- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4;
- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6;
- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6;
- (void)setWithConfiguration:(id)a3 for:(int64_t)a4;
- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4;
- (void)startSessionFor:(int64_t)a3;
- (void)stopSessionFor:(int64_t)a3;
- (void)validateFor:(int64_t)a3 completion:(id)a4;
@end

@implementation MessageCache

- (void)createSessionWith:(int64_t)a3
{
}

- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  v5 = (void (*)(void *, void, uint64_t))v4[2];
  swift_retain();
  v5(v4, 0, 0xFFFFLL);
  _Block_release(v4);
  swift_release();
}

- (void)validateFor:(int64_t)a3 completion:(id)a4
{
  v4 = (void (**)(void *, void, void *))_Block_copy(a4);
  swift_retain();
  sub_22A5B7520(MEMORY[0x263F8EE78]);
  v5 = (void *)sub_22A5DA280();
  v4[2](v4, 0, v5);
  swift_bridgeObjectRelease();

  _Block_release(v4);
  swift_release();
}

- (void)setWithConfiguration:(id)a3 for:(int64_t)a4
{
  uint64_t v6 = sub_22A5DA2A0();
  uint64_t v7 = *(void *)self->caches;
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    v9 = (void *)(v7 + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v9, v9[3]);
      sub_22A5D54D8(v6, a4);
      v9 += 5;
      --v8;
    }
    while (v8);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4
{
  uint64_t v5 = a3;
  swift_retain();
  sub_22A5BFEDC(v5, a4);
  swift_release();
}

- (void)startSessionFor:(int64_t)a3
{
}

- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6
{
  uint64_t v9 = sub_22A5DA2A0();
  swift_retain();
  sub_22A5C06E8(v9, a4, a5, a6);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)stopSessionFor:(int64_t)a3
{
}

- (void)destroySessionFor:(int64_t)a3
{
}

- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6
{
  uint64_t v6 = (void (**)(void *, void, void *))_Block_copy(a6);
  swift_retain();
  sub_22A5B7520(MEMORY[0x263F8EE78]);
  uint64_t v7 = (void *)sub_22A5DA280();
  v6[2](v6, 0, v7);
  swift_bridgeObjectRelease();

  _Block_release(v6);
  swift_release();
}

- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = (void (*)(void *, void, void, void))v4[2];
  swift_retain();
  v5(v4, 0, 0, 0);
  _Block_release(v4);
  swift_release();
}

@end