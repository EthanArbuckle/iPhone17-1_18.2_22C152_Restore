@interface AVTAvatarPose
+ (id)friendlyPose;
+ (id)neutralPose;
+ (id)posesForAnimojiNamed:(id)a3 inPosePack:(id)a4;
+ (id)posesForMemojiInPosePack:(id)a3;
+ (id)posesInPosePack:(id)a3 avatarSelectionBlock:(id)a4;
- (AVTAvatarPose)init;
- (AVTAvatarPose)initWithDictionaryRepresentation:(id)a3;
- (AVTAvatarPose)initWithScene:(id)a3;
- (AVTAvatarPose)initWithWeights:(id)a3 neckPosition:neckOrientation:bakedAnimationBlendFactor:;
- (BOOL)affectsPhysicsSimulation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPose:(id)a3;
- (BOOL)isFriendlyPose;
- (BOOL)isNeutralPose;
- (__n128)neckOrientation;
- (__n128)neckPosition;
- (double)bakedAnimationBlendFactor;
- (double)weightForBlendShapeNamed:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hashString;
- (id)poseByMergingPose:(id)a3;
- (int8x16_t)setNeckOrientation:(int32x4_t)a3;
- (void)setBakedAnimationBlendFactor:(double)a3;
- (void)setNeckPosition:(AVTAvatarPose *)self;
- (void)setNeckPositionAndOrientationFromHierarchy:(id)a3;
- (void)setWeight:(double)a3 forBlendShapeNamed:(id)a4;
- (void)setWeights:(id)a3;
@end

@implementation AVTAvatarPose

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  weights = self->_weights;
  if (self->_hasNeckPosition) {
    neckPosition = self->_neckPosition;
  }
  else {
    neckPosition = 0;
  }
  if (self->_hasNeckOrientation) {
    v7 = self + 1;
  }
  else {
    v7 = 0;
  }
  double bakedAnimationBlendFactor = self->_bakedAnimationBlendFactor;
  return (id)[v4 initWithWeights:weights neckPosition:neckPosition neckOrientation:v7 bakedAnimationBlendFactor:bakedAnimationBlendFactor];
}

- (void)setWeights:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  weights = self->_weights;
  self->_weights = v4;
  MEMORY[0x270F9A758](v4, weights);
}

- (double)weightForBlendShapeNamed:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_weights objectForKeyedSubscript:a3];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void)setWeight:(double)a3 forBlendShapeNamed:(id)a4
{
  id v6 = a4;
  weights = self->_weights;
  id v12 = v6;
  if (a3 == 0.0)
  {
    [(NSMutableDictionary *)weights removeObjectForKey:v6];
  }
  else
  {
    if (!weights)
    {
      v9 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
      v10 = self->_weights;
      self->_weights = v9;

      weights = self->_weights;
    }
    *(float *)&double v7 = a3;
    v11 = [NSNumber numberWithFloat:v7];
    [(NSMutableDictionary *)weights setValue:v11 forKey:v12];
  }
}

- (void)setNeckPosition:(AVTAvatarPose *)self
{
  v3.i32[0] = 0;
  v4.i64[0] = 0x3400000034000000;
  v4.i64[1] = 0x3400000034000000;
  int32x4_t v5 = vcgtq_f32(vabsq_f32(v2), v4);
  v5.i32[3] = v5.i32[2];
  v5.i32[0] = vmaxvq_u32((uint32x4_t)v5);
  self->_hasNeckPosition = v5.i32[0] < 0;
  *(int8x16_t *)self->_neckPosition = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v3, v5), 0), (int8x16_t)v2, (int8x16_t)0);
}

- (int8x16_t)setNeckOrientation:(int32x4_t)a3
{
  a3.i32[0] = 0;
  v3.i64[0] = 0x3400000034000000;
  v3.i64[1] = 0x3400000034000000;
  int32x4_t v4 = vcgtq_f32(vabsq_f32(vaddq_f32(a2, (float32x4_t)xmmword_20B890720)), v3);
  v4.i32[0] = vmaxvq_u32((uint32x4_t)v4);
  int8x16_t result = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(a3, v4), 0), (int8x16_t)a2, (int8x16_t)xmmword_20B88FF70);
  a1->i8[9] = v4.i32[0] < 0;
  a1[3] = result;
  return result;
}

- (id)dictionaryRepresentation
{
  float32x4_t v3 = _AVTPoseRoundingBehaviour();
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  weights = self->_weights;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __41__AVTAvatarPose_dictionaryRepresentation__block_invoke;
  v17 = &unk_2640215B0;
  id v6 = v4;
  id v18 = v6;
  id v7 = v3;
  id v19 = v7;
  [(NSMutableDictionary *)weights enumerateKeysAndObjectsUsingBlock:&v14];
  if (self->_hasNeckPosition)
  {
    v8 = objc_msgSend(MEMORY[0x263EFF8C0], "avt_arrayWithFloat3:roundingBehavior:", v7, *(double *)self->_neckPosition, v14, v15, v16, v17, v18);
    [v6 setObject:v8 forKeyedSubscript:@"neckPosition"];
  }
  if (self->_hasNeckOrientation)
  {
    v9 = objc_msgSend(MEMORY[0x263EFF8C0], "avt_arrayWithFloat4:roundingBehavior:", v7, *(double *)&self[1].super.isa);
    [v6 setObject:v9 forKeyedSubscript:@"neckOrientation"];
  }
  double bakedAnimationBlendFactor = self->_bakedAnimationBlendFactor;
  *(float *)&double bakedAnimationBlendFactor = bakedAnimationBlendFactor;
  v11 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v7, bakedAnimationBlendFactor, v14, v15, v16, v17);
  [v6 setObject:v11 forKeyedSubscript:@"bakedAnimationBlendFactor"];

  id v12 = (void *)[v6 copy];
  return v12;
}

void __41__AVTAvatarPose_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  objc_msgSend(a3, "avt_numberByRoundingWithBehavior:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (AVTAvatarPose)init
{
  return [(AVTAvatarPose *)self initWithWeights:0 neckPosition:0 neckOrientation:0 bakedAnimationBlendFactor:0.0];
}

- (AVTAvatarPose)initWithWeights:(id)a3 neckPosition:neckOrientation:bakedAnimationBlendFactor:
{
  double v6 = v5;
  id v7 = v4;
  v8 = v3;
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarPose;
  v11 = [(AVTAvatarPose *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v10 mutableCopy];
    weights = v11->_weights;
    v11->_weights = (NSMutableDictionary *)v12;

    if (v8)
    {
      v14.i64[0] = 0x3400000034000000;
      v14.i64[1] = 0x3400000034000000;
      uint32x4_t v15 = (uint32x4_t)vcgtq_f32(vabsq_f32(*v8), v14);
      v15.i32[3] = v15.i32[2];
      int v16 = vmaxvq_u32(v15);
      v11->_hasNeckPosition = v16 < 0;
      float32x4_t v17 = 0uLL;
      if (v16 < 0) {
        float32x4_t v17 = *v8;
      }
    }
    else
    {
      v11->_hasNeckPosition = 0;
      float32x4_t v17 = 0uLL;
    }
    *(float32x4_t *)v11->_neckPosition = v17;
    if (v7)
    {
      v18.i64[0] = 0x3400000034000000;
      v18.i64[1] = 0x3400000034000000;
      int v19 = vmaxvq_u32((uint32x4_t)vcgtq_f32(vabsq_f32(vaddq_f32(*v7, (float32x4_t)xmmword_20B890720)), v18));
      v11->_hasNeckOrientation = v19 < 0;
      if (v19 < 0)
      {
        long long v20 = (__int128)*v7;
LABEL_11:
        *(_OWORD *)&v11[1].super.isa = v20;
        v11->_double bakedAnimationBlendFactor = v6;
        goto LABEL_12;
      }
    }
    else
    {
      v11->_hasNeckOrientation = 0;
    }
    long long v20 = xmmword_20B88FF70;
    goto LABEL_11;
  }
LABEL_12:

  return v11;
}

- (AVTAvatarPose)initWithScene:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __31__AVTAvatarPose_initWithScene___block_invoke;
  v24[3] = &unk_2640215D8;
  id v25 = v6;
  id v26 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [v5 rootNode];
  v11 = [v10 childNodeWithName:@"head_GES" recursively:1];

  __31__AVTAvatarPose_initWithScene___block_invoke((uint64_t)v24, v11);
  uint64_t v12 = [v5 rootNode];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __31__AVTAvatarPose_initWithScene___block_invoke_2;
  v23[3] = &__block_descriptor_40_e21_v24__0__SCNNode_8_B16lu32l8;
  v23[4] = v24;
  [v12 enumerateHierarchyUsingBlock:v23];

  v13 = [v5 rootNode];
  float32x4_t v14 = [v13 childNodeWithName:@"root_JNT" recursively:1];

  [v14 simdPosition];
  long long v22 = v15;
  int v16 = [v5 rootNode];

  float32x4_t v17 = [v16 childNodeWithName:@"head_JNT" recursively:1];

  [v17 simdOrientation];
  long long v21 = v18;
  int v19 = [(AVTAvatarPose *)self initWithWeights:v8 neckPosition:&v22 neckOrientation:&v21 bakedAnimationBlendFactor:0.0];

  return v19;
}

void __31__AVTAvatarPose_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  id v14 = [a2 morpher];
  float32x4_t v3 = [v14 weights];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v14 targets];
      id v7 = [v6 objectAtIndexedSubscript:v5];

      id v8 = [v7 name];
      if (AVTMorphTargetNameDefinesPose(v8)
        && ([*(id *)(a1 + 32) containsObject:v8] & 1) == 0)
      {
        id v9 = [v14 weights];
        id v10 = [v9 objectAtIndexedSubscript:v5];

        [v10 floatValue];
        if (v11 != 0.0)
        {
          [*(id *)(a1 + 40) setValue:v10 forKey:v8];
          [*(id *)(a1 + 32) addObject:v8];
        }
      }
      ++v5;
      uint64_t v12 = [v14 weights];
      unint64_t v13 = [v12 count];
    }
    while (v13 > v5);
  }
}

uint64_t __31__AVTAvatarPose_initWithScene___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setNeckPositionAndOrientationFromHierarchy:(id)a3
{
  id v4 = a3;
  id v6 = [v4 childNodeWithName:@"root_JNT" recursively:1];
  [v6 simdPosition];
  -[AVTAvatarPose setNeckPosition:](self, "setNeckPosition:");
  unint64_t v5 = [v4 childNodeWithName:@"head_JNT" recursively:1];

  [v5 simdOrientation];
  -[AVTAvatarPose setNeckOrientation:](self, "setNeckOrientation:");
}

- (AVTAvatarPose)initWithDictionaryRepresentation:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0uLL;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"neckPosition"];
  id v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "avt_float3");
    long long v20 = v7;
  }
  id v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"neckOrientation", 0, 0x3F80000000000000, v20);

  if (v8)
  {
    objc_msgSend(v8, "avt_float4");
    long long v19 = v9;
    id v10 = &v19;
  }
  else
  {
    id v10 = 0;
  }
  float v11 = objc_msgSend(v4, "objectForKeyedSubscript:", @"bakedAnimationBlendFactor", v19);
  [v11 doubleValue];
  double v13 = v12;

  id v14 = (void *)[v4 mutableCopy];
  v21[0] = @"neckPosition";
  v21[1] = @"neckOrientation";
  v21[2] = @"bakedAnimationBlendFactor";
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  [v14 removeObjectsForKeys:v15];

  if (v6) {
    int v16 = &v20;
  }
  else {
    int v16 = 0;
  }
  float32x4_t v17 = [(AVTAvatarPose *)self initWithWeights:v14 neckPosition:v16 neckOrientation:v10 bakedAnimationBlendFactor:v13];

  return v17;
}

- (BOOL)affectsPhysicsSimulation
{
  return self->_hasNeckPosition || self->_hasNeckOrientation;
}

+ (id)neutralPose
{
  if (neutralPose_onceToken_0 != -1) {
    dispatch_once(&neutralPose_onceToken_0, &__block_literal_global_49);
  }
  float32x4_t v2 = (void *)neutralPose_pose;
  return v2;
}

uint64_t __28__AVTAvatarPose_neutralPose__block_invoke()
{
  v0 = objc_alloc_init(AVTAvatarPose);
  uint64_t v1 = neutralPose_pose;
  neutralPose_pose = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)friendlyPose
{
  if (friendlyPose_onceToken != -1) {
    dispatch_once(&friendlyPose_onceToken, &__block_literal_global_52);
  }
  float32x4_t v2 = (void *)friendlyPose_pose;
  return v2;
}

uint64_t __29__AVTAvatarPose_friendlyPose__block_invoke()
{
  v0 = objc_alloc_init(AVTAvatarPose);
  uint64_t v1 = (void *)friendlyPose_pose;
  friendlyPose_pose = (uint64_t)v0;

  float32x4_t v2 = (void *)friendlyPose_pose;
  return [v2 setWeight:@"Emoji" forBlendShapeNamed:1.0];
}

- (BOOL)isNeutralPose
{
  float32x4_t v3 = +[AVTAvatarPose neutralPose];
  LOBYTE(self) = [(AVTAvatarPose *)self isEqualToPose:v3];

  return (char)self;
}

- (BOOL)isFriendlyPose
{
  float32x4_t v3 = +[AVTAvatarPose friendlyPose];
  LOBYTE(self) = [(AVTAvatarPose *)self isEqualToPose:v3];

  return (char)self;
}

- (BOOL)isEqualToPose:(id)a3
{
  id v4 = (AVTAvatarPose *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 {
         && self->_bakedAnimationBlendFactor == v4->_bakedAnimationBlendFactor
  }
         && (uint32x4_t v8 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_neckPosition, *(float32x4_t *)v4->_neckPosition)), v8.i32[3] = v8.i32[2], (vmaxvq_u32(v8) & 0x80000000) == 0)&& (vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&v4[1].super.isa))) & 0x80000000) == 0&& (v9 = -[NSMutableDictionary count](self->_weights, "count"), v9 == [p_isa[3] count]))
  {
    uint64_t v16 = 0;
    float32x4_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    weights = self->_weights;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __31__AVTAvatarPose_isEqualToPose___block_invoke;
    v13[3] = &unk_264021620;
    id v14 = p_isa;
    long long v15 = &v16;
    [(NSMutableDictionary *)weights enumerateKeysAndObjectsUsingBlock:v13];
    if (*((unsigned char *)v17 + 24))
    {
      id v11 = p_isa[3];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __31__AVTAvatarPose_isEqualToPose___block_invoke_2;
      v12[3] = &unk_264021620;
      v12[4] = self;
      v12[5] = &v16;
      [v11 enumerateKeysAndObjectsUsingBlock:v12];
      BOOL v6 = *((unsigned char *)v17 + 24) != 0;
    }
    else
    {
      BOOL v6 = 0;
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __31__AVTAvatarPose_isEqualToPose___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  [a3 floatValue];
  float v9 = v8;
  id v10 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v7];

  [v10 floatValue];
  float v12 = v11;

  if (vabds_f32(v9, v12) > 0.000001)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __31__AVTAvatarPose_isEqualToPose___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v8 = a3;
  float v9 = [v7 objectForKeyedSubscript:a2];
  [v9 floatValue];
  float v11 = v10;

  [v8 floatValue];
  float v13 = v12;

  if (vabds_f32(v11, v13) > 0.000001)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AVTAvatarPose *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(AVTAvatarPose *)self isEqualToPose:v5];

  return v6;
}

- (id)poseByMergingPose:(id)a3
{
  id v4 = a3;
  weights = self->_weights;
  if (weights)
  {
    BOOL v6 = (void *)[(NSMutableDictionary *)weights mutableCopy];
    [v6 addEntriesFromDictionary:*((void *)v4 + 3)];
  }
  else
  {
    BOOL v6 = (void *)[*((id *)v4 + 3) copy];
  }
  BOOL hasNeckPosition = self->_hasNeckPosition;
  long long v18 = *(_OWORD *)self->_neckPosition;
  BOOL v8 = hasNeckPosition;
  if (*((unsigned char *)v4 + 8))
  {
    long long v18 = *((_OWORD *)v4 + 2);
    BOOL v8 = 1;
  }
  BOOL hasNeckOrientation = self->_hasNeckOrientation;
  long long v17 = *(_OWORD *)&self[1].super.isa;
  BOOL v10 = hasNeckOrientation;
  if (*((unsigned char *)v4 + 9))
  {
    long long v17 = *((_OWORD *)v4 + 3);
    BOOL v10 = 1;
  }
  if (self->_bakedAnimationBlendFactor >= *((double *)v4 + 2)) {
    double bakedAnimationBlendFactor = self->_bakedAnimationBlendFactor;
  }
  else {
    double bakedAnimationBlendFactor = *((double *)v4 + 2);
  }
  id v12 = objc_alloc((Class)objc_opt_class());
  if (v8) {
    float v13 = &v18;
  }
  else {
    float v13 = 0;
  }
  if (v10) {
    id v14 = &v17;
  }
  else {
    id v14 = 0;
  }
  long long v15 = objc_msgSend(v12, "initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:", v6, v13, v14, bakedAnimationBlendFactor, v17, v18);

  return v15;
}

- (id)description
{
  float32x4_t v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26BFE2E80];
  id v4 = [(NSMutableDictionary *)self->_weights allKeys];
  unint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __28__AVTAvatarPose_description__block_invoke;
  long long v17 = &unk_264021648;
  BOOL v6 = v3;
  long long v18 = v6;
  char v19 = self;
  [v5 enumerateObjectsUsingBlock:&v14];
  if (self->_hasNeckPosition) {
    [(__CFString *)v6 appendFormat:@"\n\tNeck position : (%.2f, %.2f, %.2f)", *(float *)self->_neckPosition, *(float *)&self->_neckPosition[4], *(float *)&self->_neckPosition[8]];
  }
  if (self->_hasNeckOrientation) {
    [(__CFString *)v6 appendFormat:@"\n\tNeck orientation : (%.2f, %.2f, %.2f, %.2f)", *(float *)&self[1].super.isa, *((float *)&self[1].super.isa + 1), *(float *)&self[1]._hasNeckPosition, *(float *)(&self[1]._hasNeckOrientation + 3), v14, v15, v16, v17];
  }
  if (self->_bakedAnimationBlendFactor > 0.0) {
    [(__CFString *)v6 appendFormat:@"\n\tAnimation factor : %.2f", *(void *)&self->_bakedAnimationBlendFactor];
  }
  id v7 = NSString;
  BOOL v8 = (objc_class *)objc_opt_class();
  float v9 = NSStringFromClass(v8);
  uint64_t v10 = [(__CFString *)v6 length];
  float v11 = @" (empty pose)";
  if (v10) {
    float v11 = v6;
  }
  id v12 = [v7 stringWithFormat:@"<%@: %p%@>", v9, self, v11];

  return v12;
}

void __28__AVTAvatarPose_description__block_invoke(uint64_t a1, void *a2)
{
  float32x4_t v2 = *(void **)(a1 + 32);
  float32x4_t v3 = *(void **)(*(void *)(a1 + 40) + 24);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v2 appendFormat:@"\n\t%@ : %@", v4, v5];
}

- (id)hashString
{
  if ([(AVTAvatarPose *)self isNeutralPose])
  {
    float32x4_t v3 = @"neutral";
  }
  else if ([(AVTAvatarPose *)self isFriendlyPose])
  {
    float32x4_t v3 = @"friendly";
  }
  else
  {
    float32x4_t v3 = (__CFString *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26BFE2E80];
    for (uint64_t i = 0; i != 52; ++i)
    {
      id v5 = AVTBlendShapeLocationFromARIndex(i);
      BOOL v6 = [(NSMutableDictionary *)self->_weights objectForKeyedSubscript:v5];
      [v6 floatValue];
      float v8 = v7;

      if (v8 > 0.0)
      {
        if ([(__CFString *)v3 length]) {
          uint64_t v9 = 59;
        }
        else {
          uint64_t v9 = 0;
        }
        [(__CFString *)v3 appendFormat:@"%c%d:%.4f", v9, i, v8];
      }
    }
    uint64_t v10 = [(NSMutableDictionary *)self->_weights objectForKeyedSubscript:@"Emoji"];
    [v10 floatValue];
    float v12 = v11;

    if (v12 > 0.0)
    {
      uint64_t v13 = [(__CFString *)v3 length];
      uint64_t v14 = 59;
      if (!v13) {
        uint64_t v14 = 0;
      }
      [(__CFString *)v3 appendFormat:@"%c%@:%.4f", v14, @"Emoji", v12];
    }
    if (self->_hasNeckPosition) {
      -[__CFString appendFormat:](v3, "appendFormat:", @"%cpos:(%.4f;%.4f;%.4f)",
    }
        32 * ([(__CFString *)v3 length] != 0),
        *(float *)self->_neckPosition,
        *(float *)&self->_neckPosition[4],
        *(float *)&self->_neckPosition[8]);
    if (self->_hasNeckOrientation) {
      -[__CFString appendFormat:](v3, "appendFormat:", @"%crot:(%.4f;%.4f;%.4f;%.4f)",
    }
        32 * ([(__CFString *)v3 length] != 0),
        COERCE_FLOAT(*(_OWORD *)&self[1].super.isa),
        COERCE_FLOAT((unint64_t)self[1].super.isa >> 32),
        COERCE_FLOAT(*(void *)&self[1]._hasNeckPosition),
        COERCE_FLOAT(HIDWORD(*(_OWORD *)&self[1].super.isa)));
    if (self->_bakedAnimationBlendFactor > 0.0) {
      [(__CFString *)v3 appendFormat:@"%canim:%.3f", 32 * ([(__CFString *)v3 length] != 0), *(void *)&self->_bakedAnimationBlendFactor];
    }
  }
  return v3;
}

+ (id)posesForMemojiInPosePack:(id)a3
{
  return (id)[a1 posesInPosePack:a3 avatarSelectionBlock:&__block_literal_global_105];
}

uint64_t __42__AVTAvatarPose_posesForMemojiInPosePack___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"memoji"];
}

+ (id)posesForAnimojiNamed:(id)a3 inPosePack:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__AVTAvatarPose_posesForAnimojiNamed_inPosePack___block_invoke;
  v10[3] = &unk_264021690;
  id v11 = v6;
  id v7 = v6;
  float v8 = [a1 posesInPosePack:a4 avatarSelectionBlock:v10];

  return v8;
}

id __49__AVTAvatarPose_posesForAnimojiNamed_inPosePack___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"animoji"];
  }
  id v7 = v6;

  return v7;
}

+ (id)posesInPosePack:(id)a3 avatarSelectionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  if ([v5 isEqualToString:@"watchFaceToybox"]
    && (+[AVTResourceLocator sharedResourceLocator](),
        id v7 = objc_claimAutoreleasedReturnValue(),
        -[AVTResourceLocator pathForPoseResource:ofType:isDirectory:](v7, @"toybox-watch", @"plist", 0), float v8 = objc_claimAutoreleasedReturnValue(), v7, v8))
  {
    long long v18 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v8];
    uint64_t v9 = v6[2](v6);
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [[AVTAvatarPose alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else
  {
    float v8 = avt_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[AVTAvatarBodyPose posesInPosePack:]((uint64_t)v5, v8);
    }
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (__n128)neckPosition
{
  return a1[2];
}

- (__n128)neckOrientation
{
  return a1[3];
}

- (double)bakedAnimationBlendFactor
{
  return self->_bakedAnimationBlendFactor;
}

- (void)setBakedAnimationBlendFactor:(double)a3
{
  self->_double bakedAnimationBlendFactor = a3;
}

- (void).cxx_destruct
{
}

@end