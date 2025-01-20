@interface CRGlobalContextObjC
+ (id)newObjCReplicaFor:(id)a3;
+ (id)objCRenames;
+ (id)renameObjCSequence:(id)a3 after:(int64_t)a4 in:(id)a5;
+ (int64_t)renameGeneration;
+ (void)releaseObjCSequence:(id)a3;
+ (void)retainObjCSequence:(id)a3;
+ (void)retainOrReleaseWithInitial:(id)a3 current:(id)a4 forReplica:(id)a5;
+ (void)retainOrReleaseWithInitial:(id)a3 current:(id)a4 forReplica:(id)a5 copyingFrom:(id)a6;
- (CRGlobalContextObjC)init;
@end

@implementation CRGlobalContextObjC

+ (id)newObjCReplicaFor:(id)a3
{
  uint64_t v3 = sub_1C4496678();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4496628();
  id v7 = sub_1C3FA4D74((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)objCRenames
{
  id v2 = sub_1C3FA7880();
  return v2;
}

+ (void)releaseObjCSequence:(id)a3
{
  id v3 = a3;
  sub_1C3FA79C0((uint64_t)v3, (void (*)(uint64_t))sub_1C3FA7AD8);
}

+ (int64_t)renameGeneration
{
  if (qword_1EBBC10F0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1C4497A58();
  swift_release();
  return v3;
}

+ (id)renameObjCSequence:(id)a3 after:(int64_t)a4 in:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = sub_1C3FD9A88();

  return v8;
}

+ (void)retainOrReleaseWithInitial:(id)a3 current:(id)a4 forReplica:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  sub_1C3FD9C38((uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
}

+ (void)retainOrReleaseWithInitial:(id)a3 current:(id)a4 forReplica:(id)a5 copyingFrom:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  sub_1C3FD9ED4((uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12);
}

+ (void)retainObjCSequence:(id)a3
{
  id v3 = a3;
  sub_1C3FA79C0((uint64_t)v3, (void (*)(uint64_t))sub_1C4131E60);
}

- (CRGlobalContextObjC)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CRGlobalContextObjC *)&v3 init];
}

@end