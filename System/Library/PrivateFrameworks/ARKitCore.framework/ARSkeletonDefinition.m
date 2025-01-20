@interface ARSkeletonDefinition
+ (ARSkeletonDefinition)defaultBody2DSkeletonDefinition;
+ (ARSkeletonDefinition)defaultBody3DSkeletonDefinition;
- (ARSkeleton3D)neutralBodySkeleton3D;
- (NSArray)jointNames;
- (NSArray)parentIndices;
- (NSUInteger)indexForJointName:(ARSkeletonJointName)jointName;
- (NSUInteger)jointCount;
- (id)initDefault2DSkeletonDefinition;
- (id)initDefault3DSkeletonDefinition;
@end

@implementation ARSkeletonDefinition

+ (ARSkeletonDefinition)defaultBody3DSkeletonDefinition
{
  if (+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::onceToken != -1) {
    dispatch_once(&+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::onceToken, &__block_literal_global_96);
  }
  v2 = (void *)+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::_defaultSkeletonDefinition;
  return (ARSkeletonDefinition *)v2;
}

void __55__ARSkeletonDefinition_defaultBody3DSkeletonDefinition__block_invoke()
{
  id v0 = [[ARSkeletonDefinition alloc] initDefault3DSkeletonDefinition];
  v1 = (void *)+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::_defaultSkeletonDefinition;
  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::_defaultSkeletonDefinition = (uint64_t)v0;
}

- (id)initDefault3DSkeletonDefinition
{
  v48.receiver = self;
  v48.super_class = (Class)ARSkeletonDefinition;
  v2 = [(ARSkeletonDefinition *)&v48 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = objc_opt_new();
    v47 = v2;
    v5 = objc_opt_new();
    v6 = objc_opt_new();
    uint64_t v7 = CoreIKCreateAltruisticSolverInstance();
    uint64_t TargetBufferSize = CoreIKSolverGetTargetBufferSize();
    if (TargetBufferSize)
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t TargetName = CoreIKSolverGetTargetName();
        v11 = [NSString stringWithUTF8String:TargetName];
        [v6 addObject:v11];

        uint64_t TargetParentName = CoreIKSolverGetTargetParentName();
        if (TargetParentName)
        {
          v13 = [NSString stringWithUTF8String:TargetParentName];
          v14 = [NSString stringWithUTF8String:TargetName];
          [v5 setObject:v13 forKey:v14];
        }
        ++v9;
      }
      while (TargetBufferSize != v9);
      if (TargetBufferSize)
      {
        for (uint64_t i = 0; i != TargetBufferSize; ++i)
        {
          v16 = [v6 objectAtIndex:i];
          v17 = [v5 objectForKey:v16];
          if ([v6 containsObject:v17])
          {
            uint64_t v18 = [v6 indexOfObject:v17];
            v19 = [NSNumber numberWithInteger:v18];
            [v4 addObject:v19];
          }
          else
          {
            [v4 addObject:&unk_1F125B870];
          }
          v20 = [v16 lastPathComponent];
          [v3 addObject:v20];
        }
      }
    }
    MEMORY[0x1BA9C4E90](v7);
    uint64_t v21 = [v3 copy];
    jointNames = v47->_jointNames;
    v47->_jointNames = (NSArray *)v21;

    uint64_t v23 = [v4 copy];
    parentIndices = v47->_parentIndices;
    v47->_parentIndices = (NSArray *)v23;

    v25 = [ARCoreRESkeletonResult alloc];
    uint64_t v33 = ARNeutralBodySkeleton3DModelTransforms((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
    uint64_t v41 = ARNeutralBodySkeleton3DLocalTransforms(v33, v34, v35, v36, v37, v38, v39, v40);
    v42 = objc_opt_new();
    v43 = [(ARCoreRESkeletonResult *)v25 initWithModelJointTransforms:v33 localJointTransformsSRT:v41 numberOfTransforms:91 liftedSkeletonData:0 identifier:v42];

    v44 = [[ARSkeleton3D alloc] initWithCoreRESkeletonResult:v43];
    neutralBodySkeleton3D = v47->_neutralBodySkeleton3D;
    v47->_neutralBodySkeleton3D = v44;

    v2 = v47;
  }
  return v2;
}

+ (ARSkeletonDefinition)defaultBody2DSkeletonDefinition
{
  if (+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::onceToken != -1) {
    dispatch_once(&+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::onceToken, &__block_literal_global_32_0);
  }
  v2 = (void *)+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::_defaultSkeletonDefinition;
  return (ARSkeletonDefinition *)v2;
}

void __55__ARSkeletonDefinition_defaultBody2DSkeletonDefinition__block_invoke()
{
  id v0 = [[ARSkeletonDefinition alloc] initDefault2DSkeletonDefinition];
  v1 = (void *)+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::_defaultSkeletonDefinition;
  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::_defaultSkeletonDefinition = (uint64_t)v0;
}

- (id)initDefault2DSkeletonDefinition
{
  v12[19] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)ARSkeletonDefinition;
  v2 = [(ARSkeletonDefinition *)&v10 init];
  if (v2)
  {
    if (ARLinkedOnOrAfterSydney())
    {
      v12[0] = @"head_joint";
      v12[1] = @"neck_1_joint";
      v12[2] = @"right_shoulder_1_joint";
      v12[3] = @"right_forearm_joint";
      v12[4] = @"right_hand_joint";
      v12[5] = @"left_shoulder_1_joint";
      v12[6] = @"left_forearm_joint";
      v12[7] = @"left_hand_joint";
      v12[8] = @"right_upLeg_joint";
      v12[9] = @"right_leg_joint";
      v12[10] = @"right_foot_joint";
      v12[11] = @"left_upLeg_joint";
      v12[12] = @"left_leg_joint";
      v12[13] = @"left_foot_joint";
      v12[14] = @"right_eye_joint";
      v12[15] = @"left_eye_joint";
      v12[16] = @"root";
      v12[17] = @"right_ear_joint";
      v12[18] = @"left_ear_joint";
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:19];
      jointNames = v2->_jointNames;
      v2->_jointNames = (NSArray *)v3;

      parentIndices = v2->_parentIndices;
      v6 = (NSArray *)&unk_1F125BFD8;
    }
    else
    {
      v11[0] = @"head_joint";
      v11[1] = @"neck_1_joint";
      v11[2] = @"right_shoulder_1_joint";
      v11[3] = @"right_forearm_joint";
      v11[4] = @"right_hand_joint";
      v11[5] = @"left_shoulder_1_joint";
      v11[6] = @"left_forearm_joint";
      v11[7] = @"left_hand_joint";
      v11[8] = @"right_upLeg_joint";
      v11[9] = @"right_leg_joint";
      v11[10] = @"right_foot_joint";
      v11[11] = @"left_upLeg_joint";
      v11[12] = @"left_leg_joint";
      v11[13] = @"left_foot_joint";
      v11[14] = @"right_eye_joint";
      v11[15] = @"left_eye_joint";
      v11[16] = @"root";
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:17];
      v8 = v2->_jointNames;
      v2->_jointNames = (NSArray *)v7;

      parentIndices = v2->_parentIndices;
      v6 = (NSArray *)&unk_1F125BFF0;
    }
    v2->_parentIndices = v6;
  }
  return v2;
}

- (NSUInteger)indexForJointName:(ARSkeletonJointName)jointName
{
  v4 = jointName;
  v5 = [(ARSkeletonDefinition *)self jointNames];
  NSUInteger v6 = [v5 indexOfObject:v4];

  return v6;
}

- (NSUInteger)jointCount
{
  v2 = [(ARSkeletonDefinition *)self jointNames];
  NSUInteger v3 = [v2 count];

  return v3;
}

- (NSArray)jointNames
{
  return self->_jointNames;
}

- (NSArray)parentIndices
{
  return self->_parentIndices;
}

- (ARSkeleton3D)neutralBodySkeleton3D
{
  return self->_neutralBodySkeleton3D;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neutralBodySkeleton3D, 0);
  objc_storeStrong((id *)&self->_parentIndices, 0);
  objc_storeStrong((id *)&self->_jointNames, 0);
}

@end