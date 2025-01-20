@interface SNValidateModel
+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 error:(id *)a5;
+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isFreelyShapedMultiArrayWithDataType:(int64_t)a5 error:(id *)a6;
+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isMultiArrayWithDataType:(int64_t)a5 dimensionSizeRanges:(id)a6 error:(id *)a7;
+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isMultiArrayWithDataType:(int64_t)a5 shapeOptions:(id)a6 error:(id *)a7;
+ (BOOL)ensureModelDescription:(id)a3 hasInputFeatureNames:(id)a4 hasOutputFeatureNames:(id)a5 error:(id *)a6;
+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 andDimensionSizeRanges:(id)a5 error:(id *)a6;
+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 andShapeOptions:(id)a5 error:(id *)a6;
+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 error:(id *)a5;
+ (BOOL)ensureMultiArrayIsFreelyShapedByShapeConstraint:(id)a3 error:(id *)a4;
+ (BOOL)ensureMultiArrayIsFreelyShapedWithConstraint:(id)a3 hasDataType:(int64_t)a4 error:(id *)a5;
+ (BOOL)ensureMultiArrayIsRequiredByFeatureDescription:(id)a3 error:(id *)a4;
+ (BOOL)ensureMultiArrayShapeConstraint:(id)a3 hasDimensionSizeRanges:(id)a4 error:(id *)a5;
+ (BOOL)ensureMultiArrayShapeConstraint:(id)a3 hasShapeOptions:(id)a4 error:(id *)a5;
- (SNValidateModel)init;
@end

@implementation SNValidateModel

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 error:(id *)a5
{
  id v6 = a3;
  sub_1DCA84A64(v6, a4);

  return 1;
}

+ (BOOL)ensureMultiArrayShapeConstraint:(id)a3 hasDimensionSizeRanges:(id)a4 error:(id *)a5
{
  sub_1DC89C89C(0, (unint64_t *)&qword_1EAA9CB90);
  unint64_t v6 = sub_1DCB87C38();
  id v7 = a3;
  sub_1DCA84BE4(v7, v6);
  swift_bridgeObjectRelease();

  return 1;
}

+ (BOOL)ensureMultiArrayShapeConstraint:(id)a3 hasShapeOptions:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1DCA85088(v6, v7);

  return 1;
}

+ (BOOL)ensureMultiArrayIsFreelyShapedByShapeConstraint:(id)a3 error:(id *)a4
{
  return sub_1DCA85488((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1DCA85288);
}

+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 error:(id *)a5
{
  return sub_1DCA85768((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_1DCA85310);
}

+ (BOOL)ensureMultiArrayIsRequiredByFeatureDescription:(id)a3 error:(id *)a4
{
  return sub_1DCA85488((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1DCA85400);
}

+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 andDimensionSizeRanges:(id)a5 error:(id *)a6
{
  return sub_1DCA85650((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (void (*)(id, uint64_t, id))sub_1DCA85504);
}

+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 andShapeOptions:(id)a5 error:(id *)a6
{
  return sub_1DCA85650((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (void (*)(id, uint64_t, id))sub_1DCA855CC);
}

+ (BOOL)ensureMultiArrayIsFreelyShapedWithConstraint:(id)a3 hasDataType:(int64_t)a4 error:(id *)a5
{
  return sub_1DCA85768((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_1DCA856F4);
}

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isMultiArrayWithDataType:(int64_t)a5 dimensionSizeRanges:(id)a6 error:(id *)a7
{
  return sub_1DCA858BC((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (void (*)(id, uint64_t, uint64_t))sub_1DCA85504);
}

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isMultiArrayWithDataType:(int64_t)a5 shapeOptions:(id)a6 error:(id *)a7
{
  return sub_1DCA858BC((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (void (*)(id, uint64_t, uint64_t))sub_1DCA855CC);
}

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isFreelyShapedMultiArrayWithDataType:(int64_t)a5 error:(id *)a6
{
  id v8 = a3;
  sub_1DCA85970(v8, a4, (void *)a5);

  return 1;
}

+ (BOOL)ensureModelDescription:(id)a3 hasInputFeatureNames:(id)a4 hasOutputFeatureNames:(id)a5 error:(id *)a6
{
  uint64_t v7 = sub_1DCB87C38();
  uint64_t v8 = sub_1DCB87C38();
  id v9 = a3;
  sub_1DCA85A84(v9, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (SNValidateModel)init
{
  return (SNValidateModel *)sub_1DCA85DD4();
}

@end