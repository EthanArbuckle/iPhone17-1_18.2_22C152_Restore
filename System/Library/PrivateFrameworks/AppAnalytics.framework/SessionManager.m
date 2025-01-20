@interface SessionManager
- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4;
@end

@implementation SessionManager

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_1A90BA534;
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v10 = *(void *)self->accessQueue;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a3;
  v12[4] = v9;
  v12[5] = v8;
  id v13 = a3;
  swift_retain();
  swift_retain();
  sub_1A90A0418((uint64_t)v9);
  sub_1A908CAA8(v10, (uint64_t)sub_1A9090C10, (uint64_t)v12);
  swift_release();
  swift_release();
  sub_1A909E0EC((uint64_t)v9);

  swift_release();
}

@end