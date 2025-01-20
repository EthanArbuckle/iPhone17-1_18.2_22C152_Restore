@interface VNRecognizedAnimalBodyPointsSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)_stringRepresentationForRequestRevision:(unint64_t)a3 petsKeypointType:(int)a4 error:(id *)a5;
+ (id)supportedAnimalPoseKeypointsRev1;
- (BOOL)isEqual:(id)a3;
- (VNRecognizedAnimalBodyPointsSpecifier)initWithCoder:(id)a3;
- (VNRecognizedAnimalBodyPointsSpecifier)initWithVCPPetsObservation:(id)a3 originatingRequestSpecifier:(id)a4;
- (id)availableGroupKeys;
- (id)pointKeyGroupLabelsMapping;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedAnimalBodyPointsSpecifier

- (void).cxx_destruct
{
}

- (VNRecognizedAnimalBodyPointsSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  v5 = [(VNRecognizedPointsSpecifier *)&v15 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"OrderedAnimalKeypoints"];
    orderedAnimalKeypoints = v5->_orderedAnimalKeypoints;
    v5->_orderedAnimalKeypoints = (NSArray *)v10;

    if (v5->_orderedAnimalKeypoints)
    {
      v12 = v5;
    }
    else
    {
      v13 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"ordered animal keypoints are not available"];
      [v4 failWithError:v13];

      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  [(VNRecognizedPointsSpecifier *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_orderedAnimalKeypoints forKey:@"OrderedAnimalKeypoints"];
}

- (id)pointKeyGroupLabelsMapping
{
  if (-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::onceToken != -1) {
    dispatch_once(&-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::onceToken, &__block_literal_global_65);
  }
  v2 = (void *)-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::mapping;

  return v2;
}

void __67__VNRecognizedAnimalBodyPointsSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"animal_joint_left_ear_top", @"animal_joint_right_ear_top", @"animal_joint_left_ear_middle", @"animal_joint_right_ear_middle", @"animal_joint_left_ear_bottom", @"animal_joint_right_ear_bottom", @"animal_joint_left_eye", @"animal_joint_right_eye", @"animal_joint_nose", 0, @"animal_joint_group_head");
  v8[0] = v0;
  v7[1] = @"animal_joint_group_trunk";
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"animal_joint_heck", 0);
  v8[1] = v1;
  v7[2] = @"animal_joint_group_gorelegs";
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"animal_joint_left_front_elbow", @"animal_joint_right_front_elbow", @"animal_joint_left_front_knee", @"animal_joint_right_front_knee", @"animal_joint_left_front_paw", @"animal_joint_right_front_paw", 0);
  v8[2] = v2;
  v7[3] = @"animal_joint_group_hindlegs";
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"animal_joint_left_back_elbow", @"animal_joint_right_back_elbow", @"animal_joint_left_back_knee", @"animal_joint_right_back_knee", @"animal_joint_left_back_paw", @"animal_joint_right_back_paw", 0);
  v8[3] = v3;
  v7[4] = @"animal_joint_group_tail";
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"animal_joint_tail_top", @"animal_joint_tail_middle", @"animal_joint_tail_bottom", 0);
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::mapping;
  -[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::mapping = v5;
}

- (id)availableGroupKeys
{
  if (-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::onceToken != -1) {
    dispatch_once(&-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::onceToken, &__block_literal_global_62);
  }
  v2 = (void *)-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::groupKeys;

  return v2;
}

void __59__VNRecognizedAnimalBodyPointsSpecifier_availableGroupKeys__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"animal_joint_group_head";
  v2[1] = @"animal_joint_group_trunk";
  v2[2] = @"animal_joint_group_gorelegs";
  v2[3] = @"animal_joint_group_hindlegs";
  v2[4] = @"animal_joint_group_tail";
  v2[5] = @"VNIPOAll";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::groupKeys;
  -[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::groupKeys = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNRecognizedAnimalBodyPointsSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
    BOOL v5 = [(VNRecognizedPointsSpecifier *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NSArray *)self->_orderedAnimalKeypoints isEqualToArray:v4->_orderedAnimalKeypoints];
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  return [(NSArray *)self->_orderedAnimalKeypoints hash] ^ __ROR8__([(VNRecognizedPointsSpecifier *)&v3 hash], 51);
}

- (VNRecognizedAnimalBodyPointsSpecifier)initWithVCPPetsObservation:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v30 = a3;
  id v31 = a4;
  id v6 = [v30 keypoints];
  v32 = v6;
  uint64_t v7 = [v6 count];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v7];
  uint64_t v10 = [v31 requestRevision];
  if (v7)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      v13 = [v6 objectAtIndex:v12];
      [v13 location];
      double v15 = v14;
      double v17 = v16;
      [v13 confidence];
      int v19 = v18;
      v20 = objc_opt_class();
      id v34 = 0;
      v21 = [v20 _stringRepresentationForRequestRevision:v11 petsKeypointType:v12 error:&v34];
      id v22 = v34;
      v23 = v22;
      if (!v21) {
        break;
      }
      v24 = [VNRecognizedPoint alloc];
      LODWORD(v25) = v19;
      v26 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v24, "initWithLocation:confidence:identifier:", v21, v15, v17, v25);
      [v9 setObject:v26 forKey:v21];
      [v8 addObject:v26];

      ++v12;
      id v6 = v32;
      if (v7 == v12) {
        goto LABEL_5;
      }
    }

    id v27 = 0;
    id v6 = v32;
    goto LABEL_8;
  }
LABEL_5:
  v33.receiver = self;
  v33.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  id v27 = [(VNRecognizedPointsSpecifier *)&v33 initWithOriginatingRequestSpecifier:v31 allRecognizedPoints:v9];
  if (v27)
  {
    uint64_t v28 = [v8 copy];
    self = (VNRecognizedAnimalBodyPointsSpecifier *)*((void *)v27 + 3);
    *((void *)v27 + 3) = v28;
LABEL_8:
  }
  return (VNRecognizedAnimalBodyPointsSpecifier *)v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_stringRepresentationForRequestRevision:(unint64_t)a3 petsKeypointType:(int)a4 error:(id *)a5
{
  if (a3 == 1)
  {
    uint64_t v5 = *(void *)&a4;
    id v6 = [(id)objc_opt_class() supportedAnimalPoseKeypointsRev1];
    uint64_t v7 = [NSNumber numberWithInt:v5];
    uint64_t v8 = [v6 objectForKey:v7];
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequestClass:objc_opt_class()];
    uint64_t v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)supportedAnimalPoseKeypointsRev1
{
  if (+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::onceToken != -1) {
    dispatch_once(&+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::onceToken, &__block_literal_global_1025);
  }
  v2 = (void *)+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::supportedAnimalPoseKeypointsRev1;

  return v2;
}

void __73__VNRecognizedAnimalBodyPointsSpecifier_supportedAnimalPoseKeypointsRev1__block_invoke()
{
  v3[25] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7A6CB0;
  v2[1] = &unk_1EF7A6CC8;
  v3[0] = @"animal_joint_left_ear_top";
  v3[1] = @"animal_joint_left_ear_middle";
  v2[2] = &unk_1EF7A6CE0;
  v2[3] = &unk_1EF7A6CF8;
  v3[2] = @"animal_joint_left_ear_bottom";
  v3[3] = @"animal_joint_right_ear_top";
  v2[4] = &unk_1EF7A6D10;
  v2[5] = &unk_1EF7A6D28;
  v3[4] = @"animal_joint_right_ear_middle";
  v3[5] = @"animal_joint_right_ear_bottom";
  v2[6] = &unk_1EF7A6D40;
  void v2[7] = &unk_1EF7A6D58;
  v3[6] = @"animal_joint_left_eye";
  v3[7] = @"animal_joint_right_eye";
  v2[8] = &unk_1EF7A6D70;
  v2[9] = &unk_1EF7A6D88;
  v3[8] = @"animal_joint_nose";
  v3[9] = @"animal_joint_heck";
  v2[10] = &unk_1EF7A6DA0;
  v2[11] = &unk_1EF7A6DB8;
  v3[10] = @"animal_joint_left_front_elbow";
  v3[11] = @"animal_joint_left_front_knee";
  v2[12] = &unk_1EF7A6DD0;
  v2[13] = &unk_1EF7A6DE8;
  v3[12] = @"animal_joint_left_front_paw";
  v3[13] = @"animal_joint_right_front_elbow";
  v2[14] = &unk_1EF7A6E00;
  v2[15] = &unk_1EF7A6E18;
  v3[14] = @"animal_joint_right_front_knee";
  v3[15] = @"animal_joint_right_front_paw";
  v2[16] = &unk_1EF7A6E30;
  v2[17] = &unk_1EF7A6E48;
  v3[16] = @"animal_joint_left_back_elbow";
  v3[17] = @"animal_joint_left_back_knee";
  v2[18] = &unk_1EF7A6E60;
  v2[19] = &unk_1EF7A6E78;
  v3[18] = @"animal_joint_left_back_paw";
  v3[19] = @"animal_joint_right_back_elbow";
  v2[20] = &unk_1EF7A6E90;
  v2[21] = &unk_1EF7A6EA8;
  v3[20] = @"animal_joint_right_back_knee";
  v3[21] = @"animal_joint_right_back_paw";
  v2[22] = &unk_1EF7A6EC0;
  v2[23] = &unk_1EF7A6ED8;
  v3[22] = @"animal_joint_tail_top";
  v3[23] = @"animal_joint_tail_middle";
  v2[24] = &unk_1EF7A6EF0;
  v3[24] = @"animal_joint_tail_bottom";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:25];
  v1 = (void *)+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::supportedAnimalPoseKeypointsRev1;
  +[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::supportedAnimalPoseKeypointsRev1 = v0;
}

@end