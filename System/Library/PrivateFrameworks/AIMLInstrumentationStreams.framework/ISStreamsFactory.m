@interface ISStreamsFactory
+ (void)constructWithFilter:(ISEventFilter *)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(int64_t)a6 lastN:(int64_t)a7 completionHandler:(id)a8;
+ (void)constructWithFilter:(ISEventFilter *)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(int64_t)a6 lastN:(int64_t)a7 storageURL:(NSURL *)a8 completionHandler:(id)a9;
+ (void)constructWithFilter:(ISEventFilter *)a3 startTimeRelativeToNow:(double)a4 completionHandler:(id)a5;
+ (void)constructWithFilter:(ISEventFilter *)a3 startTimeRelativeToNow:(double)a4 storageURL:(NSURL *)a5 completionHandler:(id)a6;
- (ISStreamsFactory)init;
@end

@implementation ISStreamsFactory

+ (void)constructWithFilter:(ISEventFilter *)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(int64_t)a6 lastN:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE30);
  MEMORY[0x270FA5388](v15 - 8, v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a8);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(double *)(v20 + 24) = a4;
  *(double *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  *(void *)(v20 + 48) = a7;
  *(void *)(v20 + 56) = v19;
  *(void *)(v20 + 64) = a1;
  uint64_t v21 = sub_22AEAA208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_268380888;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_268380890;
  v23[5] = v22;
  v24 = a3;
  sub_22A792170((uint64_t)v18, (uint64_t)&unk_268380898, (uint64_t)v23);
  swift_release();
}

+ (void)constructWithFilter:(ISEventFilter *)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(int64_t)a6 lastN:(int64_t)a7 storageURL:(NSURL *)a8 completionHandler:(id)a9
{
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE30);
  MEMORY[0x270FA5388](v17 - 8, v18);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = _Block_copy(a9);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a3;
  *(double *)(v22 + 24) = a4;
  *(double *)(v22 + 32) = a5;
  *(void *)(v22 + 40) = a6;
  *(void *)(v22 + 48) = a7;
  *(void *)(v22 + 56) = a8;
  *(void *)(v22 + 64) = v21;
  *(void *)(v22 + 72) = a1;
  uint64_t v23 = sub_22AEAA208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_268380868;
  v24[5] = v22;
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_268380870;
  v25[5] = v24;
  v26 = a3;
  v27 = a8;
  sub_22A792170((uint64_t)v20, (uint64_t)&unk_268380878, (uint64_t)v25);
  swift_release();
}

+ (void)constructWithFilter:(ISEventFilter *)a3 startTimeRelativeToNow:(double)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE30);
  MEMORY[0x270FA5388](v9 - 8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(double *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = a1;
  uint64_t v15 = sub_22AEAA208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268380848;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_268380850;
  v17[5] = v16;
  uint64_t v18 = a3;
  sub_22A792170((uint64_t)v12, (uint64_t)&unk_268380858, (uint64_t)v17);
  swift_release();
}

+ (void)constructWithFilter:(ISEventFilter *)a3 startTimeRelativeToNow:(double)a4 storageURL:(NSURL *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837FE30);
  MEMORY[0x270FA5388](v11 - 8, v12);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a6);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(double *)(v16 + 24) = a4;
  *(void *)(v16 + 32) = a5;
  *(void *)(v16 + 40) = v15;
  *(void *)(v16 + 48) = a1;
  uint64_t v17 = sub_22AEAA208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_268380818;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_26837FE48;
  v19[5] = v18;
  uint64_t v20 = a3;
  uint64_t v21 = a5;
  sub_22A792170((uint64_t)v14, (uint64_t)&unk_26837FE50, (uint64_t)v19);
  swift_release();
}

- (ISStreamsFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InstrumentationStreamsFactoryBridge();
  return [(ISStreamsFactory *)&v3 init];
}

@end