@interface CKLogic
+ (id)ifExistsLink:(id)a3 to:(id)a4;
+ (id)ifNotExistsLink:(id)a3 to:(id)a4;
- (CKLogic)init;
- (NSString)identifier;
- (id)and:(id)a3;
- (id)andExistsLink:(id)a3 to:(id)a4 error:(id *)a5;
- (id)andNotExistsLink:(id)a3 to:(id)a4 error:(id *)a5;
- (int64_t)hash;
@end

@implementation CKLogic

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1A77FA5C0();

  return v3;
}

- (NSString)identifier
{
  v2 = self;
  sub_1A77FA8EC();

  int64_t v3 = (void *)sub_1A78317DC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)ifExistsLink:(id)a3 to:(id)a4
{
  return sub_1A77FAB60((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1A77FA9B4);
}

- (id)andExistsLink:(id)a3 to:(id)a4 error:(id *)a5
{
  return sub_1A77FAD80(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, id))sub_1A77FAA7C);
}

+ (id)ifNotExistsLink:(id)a3 to:(id)a4
{
  return sub_1A77FAB60((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1A77FAABC);
}

- (id)andNotExistsLink:(id)a3 to:(id)a4 error:(id *)a5
{
  return sub_1A77FAD80(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, id))sub_1A77FABEC);
}

- (id)and:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1A77FAE74();

  return v6;
}

- (CKLogic)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end