@interface SNTimeUtils
+ ($A0D62BC7BB322857EA05296DE7D5C3FF)addOffset:(SEL)a3 toTimeRange:(id *)a4;
+ ($A0D62BC7BB322857EA05296DE7D5C3FF)clipTimeRange:(SEL)a3 toBounds:(id *)a4;
+ ($A0D62BC7BB322857EA05296DE7D5C3FF)convertScaleForTimeRange:(SEL)a3 toValue:(id *)a4 preferShrinkingWhenRounding:(int)a5;
+ ($A0D62BC7BB322857EA05296DE7D5C3FF)standardizeTimeRange:(SEL)a3 directionShouldBePositive:(id *)a4 negativeShouldResideInTimescale:(BOOL)a5;
+ (void)clipTimeRange:(id *)a3 toBounds:(id *)a4 handler:(id)a5;
- (SNTimeUtils)init;
@end

@implementation SNTimeUtils

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)convertScaleForTimeRange:(SEL)a3 toValue:(id *)a4 preferShrinkingWhenRounding:(int)a5
{
  int64_t var3 = a4->var1.var3;
  v17[0] = a4->var0.var0;
  v17[1] = *(void *)&a4->var0.var1;
  long long v18 = *(_OWORD *)&a4->var0.var3;
  uint64_t v19 = *(void *)&a4->var1.var1;
  int64_t v20 = var3;
  result = ($A0D62BC7BB322857EA05296DE7D5C3FF *)sub_1DC8AB3D8(v17, (uint64_t)v13);
  int64_t v9 = v16;
  uint64_t v10 = v13[1];
  uint64_t v11 = v15;
  long long v12 = v14;
  retstr->var0.var0 = v13[0];
  *(void *)&retstr->var0.var1 = v10;
  *(_OWORD *)&retstr->var0.int64_t var3 = v12;
  *(void *)&retstr->var1.var1 = v11;
  retstr->var1.int64_t var3 = v9;
  return result;
}

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)standardizeTimeRange:(SEL)a3 directionShouldBePositive:(id *)a4 negativeShouldResideInTimescale:(BOOL)a5
{
  CMTimeEpoch var3 = a4->var1.var3;
  v10.start.value = a4->var0.var0;
  *(void *)&v10.start.timescale = *(void *)&a4->var0.var1;
  *(_OWORD *)&v10.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(void *)&v10.duration.timescale = *(void *)&a4->var1.var1;
  v10.duration.epoch = var3;
  sub_1DC8AB6F0(&v10, a5, a6);
  *retstr = v9;
  return result;
}

+ (void)clipTimeRange:(id *)a3 toBounds:(id *)a4 handler:(id)a5
{
  CMTimeValue var0 = a3->var0.var0;
  CMTimeValue v6 = a4->var0.var0;
  CMTimeEpoch var3 = a4->var1.var3;
  v10.duration.epoch = a3->var1.var3;
  v11.start.value = v6;
  *(void *)&v11.start.timescale = *(void *)&a4->var0.var1;
  *(_OWORD *)&v11.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(void *)&v11.duration.timescale = *(void *)&a4->var1.var1;
  v11.duration.epoch = var3;
  v10.start.value = var0;
  *(void *)&v10.start.timescale = *(void *)&a3->var0.var1;
  *(_OWORD *)&v10.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(void *)&v10.duration.timescale = *(void *)&a3->var1.var1;
  v8 = _Block_copy(a5);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1DC8AB81C(&v10, &v11, ObjCClassMetadata, v8);
}

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)clipTimeRange:(SEL)a3 toBounds:(id *)a4
{
  CMTimeValue var0 = a4->var0.var0;
  CMTimeEpoch var3 = a4->var1.var3;
  CMTimeEpoch v8 = a5->var1.var3;
  v12.start.value = a5->var0.var0;
  *(void *)&v12.start.timescale = *(void *)&a5->var0.var1;
  *(_OWORD *)&v12.start.epoch = *(_OWORD *)&a5->var0.var3;
  *(void *)&v12.duration.timescale = *(void *)&a5->var1.var1;
  v12.duration.epoch = v8;
  v11.start.value = var0;
  *(void *)&v11.start.timescale = *(void *)&a4->var0.var1;
  *(_OWORD *)&v11.start.epoch = *(_OWORD *)&a4->var0.var3;
  *(void *)&v11.duration.timescale = *(void *)&a4->var1.var1;
  v11.duration.epoch = var3;
  swift_getObjCClassMetadata();
  sub_1DC8AC858(&v11, &v12);
  *retstr = v10;
  return result;
}

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)addOffset:(SEL)a3 toTimeRange:(id *)a4
{
  CMTimeValue var0 = a4->var0;
  uint64_t v7 = *(void *)&a4->var1;
  CMTimeEpoch var3 = a4->var3;
  int64_t v9 = a5->var1.var3;
  v19[0] = a5->var0.var0;
  v19[1] = *(void *)&a5->var0.var1;
  long long v20 = *(_OWORD *)&a5->var0.var3;
  uint64_t v21 = *(void *)&a5->var1.var1;
  int64_t v22 = v9;
  sub_1DC8AC970(var0, v7, var3, v19, (uint64_t)v15);
  int64_t v11 = v18;
  uint64_t v12 = v15[1];
  uint64_t v13 = v17;
  long long v14 = v16;
  retstr->var0.CMTimeValue var0 = v15[0];
  *(void *)&retstr->var0.var1 = v12;
  *(_OWORD *)&retstr->var0.CMTimeEpoch var3 = v14;
  *(void *)&retstr->var1.var1 = v13;
  retstr->var1.CMTimeEpoch var3 = v11;
  return result;
}

- (SNTimeUtils)init
{
  return (SNTimeUtils *)SNTimeUtils.init()();
}

@end