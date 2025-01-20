@interface SNError
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 message:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 message:(id)a6;
+ (id)exceptionFromError:(id)a3;
+ (void)autoreleasepoolWithError:(id *)a3 action:(id)a4;
+ (void)populateClientError:(id *)a3 withCode:(int64_t)a4 underlyingError:(id)a5 message:(id)a6;
+ (void)populateClientError:(id *)a3 withDomain:(id)a4 code:(int64_t)a5 underlyingError:(id)a6 message:(id)a7;
+ (void)wrapClientError:(id *)a3 withDomain:(id)a4 code:(int64_t)a5 message:(id)a6;
- (SNError)init;
@end

@implementation SNError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 message:(id)a6
{
  uint64_t v8 = sub_1DCB87938();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1DCB87938();
  unint64_t v13 = v12;
  id v14 = a5;
  id v15 = sub_1DCA14B2C(v8, v10, a4, a5, v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 message:(id)a5
{
  uint64_t v7 = sub_1DCB87938();
  unint64_t v9 = v8;
  id v10 = a4;
  id v11 = sub_1DCA150C4(a3, a4, v7, v9);

  swift_bridgeObjectRelease();

  return v11;
}

+ (void)populateClientError:(id *)a3 withDomain:(id)a4 code:(int64_t)a5 underlyingError:(id)a6 message:(id)a7
{
  uint64_t v10 = sub_1DCB87938();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1DCB87938();
  unint64_t v15 = v14;
  id v16 = a6;
  sub_1DCA15188(a3, v10, v12, a5, a6, v13, v15);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)wrapClientError:(id *)a3 withDomain:(id)a4 code:(int64_t)a5 message:(id)a6
{
  uint64_t v8 = sub_1DCB87938();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1DCB87938();
  sub_1DCA15284(a3, v8, v10, a5, v11, v12);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)populateClientError:(id *)a3 withCode:(int64_t)a4 underlyingError:(id)a5 message:(id)a6
{
  uint64_t v9 = sub_1DCB87938();
  unint64_t v11 = v10;
  id v12 = a5;
  sub_1DCA153A8(a3, a4, a5, v9, v11);

  swift_bridgeObjectRelease();
}

+ (void)autoreleasepoolWithError:(id *)a3 action:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();

  sub_1DCA15468(a3, ObjCClassMetadata, (void (**)(void, void))v5);
}

- (SNError)init
{
  return (SNError *)sub_1DCA15578();
}

+ (id)exceptionFromError:(id)a3
{
  id v4 = a3;
  id v5 = sub_1DCAC6818(a3);

  return v5;
}

@end