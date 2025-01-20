@interface AAUISignInProgressViewShim
+ (id)newSignInProgressViewWithFullName:(id)a3;
+ (id)newSignInProgressViewWithFullName:(id)a3 forAccount:(id)a4;
- (AAUISignInProgressViewShim)init;
@end

@implementation AAUISignInProgressViewShim

+ (id)newSignInProgressViewWithFullName:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  uint64_t v6 = sub_2098BF368();
  uint64_t v7 = v4;
  swift_getObjCClassMetadata();
  v9 = (void *)sub_2097F2968(v6, v7);
  swift_bridgeObjectRelease();

  return v9;
}

+ (id)newSignInProgressViewWithFullName:(id)a3 forAccount:(id)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = a4;
  uint64_t v8 = sub_2098BF368();
  uint64_t v9 = v6;
  swift_getObjCClassMetadata();
  v12 = (void *)sub_2097F2B44(v8, v9, a4);
  swift_bridgeObjectRelease();

  return v12;
}

- (AAUISignInProgressViewShim)init
{
  return (AAUISignInProgressViewShim *)SignInProgressViewShim.init()();
}

@end