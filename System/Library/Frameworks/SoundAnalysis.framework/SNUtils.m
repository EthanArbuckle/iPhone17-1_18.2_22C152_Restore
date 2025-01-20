@interface SNUtils
+ (BOOL)flushBytesFromPreciseTimeRangeInAudioFile:(id)a3 timeRange:(id *)a4 maxFramesPerBuffer:(unsigned int)a5 recycleBuffers:(BOOL)a6 prefixBufferPopulator:(id)a7 suffixBufferPopulator:(id)a8 intoSink:(id)a9 error:(id *)a10;
+ (BOOL)flushBytesFromStreamSource:(id)a3 toBuffer:(void *)a4 ofSizeInBytes:(int64_t)a5 error:(id *)a6;
+ (BOOL)isInternalBuild;
+ (BOOL)isRunningInDaemon;
+ (BOOL)multiArrayConstraintLastDimensionIsFlexible:(id)a3;
+ (_NSRange)lastDimensionSizeRange:(id)a3;
+ (id)createMultiArrayContainingPreciseTimeRangeOfAudioFile:(id)a3 timeRange:(id *)a4 maxFramesPerBuffer:(unsigned int)a5 recycleBuffers:(BOOL)a6 prefixBufferPopulator:(id)a7 suffixBufferPopulator:(id)a8 numDimensions:(int64_t)a9 error:(id *)a10;
+ (id)loadModelAtURL:(id)a3 withTimeout:(double)a4 error:(id *)a5;
+ (id)toFloatScalarConvertFromMLMultiArray:(id)a3 error:(id *)a4;
+ (id)toMLMultiArrayConvertFromFloatScalar:(id)a3 error:(id *)a4;
+ (id)userSuppliedInputFeatureNames:(id)a3;
+ (id)zeroBufferPopulator;
+ (int)numberOfElements:(id)a3;
+ (unsigned)modelBlockSize:(id)a3 channelCount:(unsigned int)a4;
+ (void)logKShotSegments:(id)a3 exemplarIndex:(int64_t)a4;
- (SNUtils)init;
@end

@implementation SNUtils

+ (void)logKShotSegments:(id)a3 exemplarIndex:(int64_t)a4
{
  type metadata accessor for SNKShotSegment(0);
  unint64_t v5 = sub_1DCB87C38();
  sub_1DCB23140(v5, a4);

  swift_bridgeObjectRelease();
}

+ (int)numberOfElements:(id)a3
{
  sub_1DC89C89C(0, (unint64_t *)&qword_1EAA9C7A0);
  unint64_t v3 = sub_1DCB87C38();
  int v4 = sub_1DCB212CC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (unsigned)modelBlockSize:(id)a3 channelCount:(unsigned int)a4
{
  sub_1DC89C89C(0, (unint64_t *)&qword_1EAA9C7A0);
  unint64_t v5 = sub_1DCB87C38();
  unsigned int v6 = sub_1DCB2395C(v5, a4);
  swift_bridgeObjectRelease();
  return v6;
}

+ (BOOL)multiArrayConstraintLastDimensionIsFlexible:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_1DCB21A60(v3);

  return v4;
}

+ (_NSRange)lastDimensionSizeRange:(id)a3
{
  id v3 = a3;
  id v4 = sub_1DCB21B6C(v3);
  NSUInteger v6 = v5;

  NSUInteger v7 = (NSUInteger)v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

+ (id)userSuppliedInputFeatureNames:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1DCB212B0(v4);

  NSUInteger v5 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return v5;
}

+ (BOOL)isRunningInDaemon
{
  return sub_1DCB21274(qword_1EAA9CFA8, (unsigned __int8 *)&byte_1EAAFFB70) & 1;
}

+ (BOOL)isInternalBuild
{
  return sub_1DCB21274(&qword_1EAA9CB50, (unsigned __int8 *)&byte_1EAAFF828) & 1;
}

+ (id)toMLMultiArrayConvertFromFloatScalar:(id)a3 error:(id *)a4
{
  return sub_1DCB2466C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1DCB242FC);
}

+ (id)toFloatScalarConvertFromMLMultiArray:(id)a3 error:(id *)a4
{
  return sub_1DCB2466C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, sub_1DCB24540);
}

+ (id)zeroBufferPopulator
{
  v4[4] = sub_1DCB2470C;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1DCB24828;
  v4[3] = &unk_1F37FB098;
  v2 = _Block_copy(v4);
  swift_release();

  return v2;
}

+ (BOOL)flushBytesFromStreamSource:(id)a3 toBuffer:(void *)a4 ofSizeInBytes:(int64_t)a5 error:(id *)a6
{
  NSUInteger v8 = _Block_copy(a3);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1DCB24AE8((uint64_t)a4, a5, ObjCClassMetadata, v8);
  return 1;
}

+ (BOOL)flushBytesFromPreciseTimeRangeInAudioFile:(id)a3 timeRange:(id *)a4 maxFramesPerBuffer:(unsigned int)a5 recycleBuffers:(BOOL)a6 prefixBufferPopulator:(id)a7 suffixBufferPopulator:(id)a8 intoSink:(id)a9 error:(id *)a10
{
  CMTimeEpoch var3 = a4->var1.var3;
  v23.start.value = a4->var0.var0;
  *(void *)&v23.start.timescale = *(void *)&a4->var0.var1;
  *(_OWORD *)&v23.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(void *)&v23.duration.timescale = *(void *)&a4->var1.var1;
  v23.duration.epoch = var3;
  v15 = _Block_copy(a7);
  v16 = _Block_copy(a8);
  v17 = _Block_copy(a9);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  swift_getObjCClassMetadata();
  id v21 = a3;
  sub_1DCB2506C(v21, &v23, a5, a6, (uint64_t (*)(void *, id, id *))sub_1DCB2723C, v18, (uint64_t (*)(void *, id, id *))sub_1DCB2723C, v19, (uint64_t)sub_1DCB26FF0, v20);
  swift_release();
  swift_release();
  swift_release();

  return 1;
}

+ (id)createMultiArrayContainingPreciseTimeRangeOfAudioFile:(id)a3 timeRange:(id *)a4 maxFramesPerBuffer:(unsigned int)a5 recycleBuffers:(BOOL)a6 prefixBufferPopulator:(id)a7 suffixBufferPopulator:(id)a8 numDimensions:(int64_t)a9 error:(id *)a10
{
  CMTimeEpoch var3 = a4->var1.var3;
  v22.start.value = a4->var0.var0;
  *(void *)&v22.start.timescale = *(void *)&a4->var0.var1;
  *(_OWORD *)&v22.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(void *)&v22.duration.timescale = *(void *)&a4->var1.var1;
  v22.duration.epoch = var3;
  v15 = _Block_copy(a7);
  v16 = _Block_copy(a8);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  swift_getObjCClassMetadata();
  id v19 = a3;
  uint64_t v20 = (void *)sub_1DCB25400(v19, &v22, a5, a6, (uint64_t (*)(void *, id, id *))sub_1DCB26FF0, v17, (uint64_t (*)(void *, id, id *))sub_1DCB2723C, v18, a9);
  swift_release();
  swift_release();

  return v20;
}

+ (id)loadModelAtURL:(id)a3 withTimeout:(double)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DCB86A18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB869B8();
  v10 = (void *)sub_1DCB25984((uint64_t)v9, a4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v10;
}

- (SNUtils)init
{
  return (SNUtils *)sub_1DC8CE788();
}

@end