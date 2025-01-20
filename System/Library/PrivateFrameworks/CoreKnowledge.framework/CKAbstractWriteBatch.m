@interface CKAbstractWriteBatch
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CKAbstractWriteBatch

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    swift_retain();
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    id v6 = a4;
    swift_retain();
  }
  sub_1A78317EC();

  sub_1A78116D8((uint64_t)v7);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A77DA3E0((uint64_t)v7, &qword_1EB59FC90);
}

@end