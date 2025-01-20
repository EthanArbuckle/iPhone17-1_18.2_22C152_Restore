@interface JSDatabase
- (_TtC14amsengagementd10JSDatabase)init;
- (id)fetch:(id)a3;
- (id)fetchKeys:(id)a3;
- (id)fetchMatchingKeys:(id)a3;
- (void)removeKeys:(id)a3;
- (void)set:(id)a3 :(id)a4;
- (void)setValues:(id)a3;
@end

@implementation JSDatabase

- (id)fetch:(id)a3
{
  return sub_1000213E8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_10004C988);
}

- (void)set:(id)a3 :(id)a4
{
}

- (void)removeKeys:(id)a3
{
}

- (id)fetchMatchingKeys:(id)a3
{
  return sub_10001ABB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10001AC54);
}

- (void).cxx_destruct
{
}

- (id)fetchKeys:(id)a3
{
  return sub_1000DCFEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000DC5E0);
}

- (void)setValues:(id)a3
{
}

- (_TtC14amsengagementd10JSDatabase)init
{
}

@end