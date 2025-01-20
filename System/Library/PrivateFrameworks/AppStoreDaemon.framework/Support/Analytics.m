@interface Analytics
+ (void)postHashMismatchWithTaskInfo:(id)a3;
@end

@implementation Analytics

+ (void)postHashMismatchWithTaskInfo:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  v8[4] = sub_100042744;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100041B5C;
  v8[3] = &unk_1005127A8;
  v6 = _Block_copy(v8);
  id v7 = a3;
  swift_release();
  sub_10040EA60((uint64_t)a1, v6, 25);
  _Block_release(v6);
}

@end