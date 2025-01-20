@interface VNRecognizedBodyPointsSpecifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNRecognizedBodyPointsSpecifier)initWithCoder:(id)a3;
- (VNRecognizedBodyPointsSpecifier)initWithVCPPersonObservation:(id)a3 originatingRequestSpecifier:(id)a4;
- (id)availableGroupKeys;
- (id)pointKeyGroupLabelsMapping;
- (id)populatedMLMultiArrayAndReturnError:(id *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedBodyPointsSpecifier

- (void).cxx_destruct
{
}

- (VNRecognizedBodyPointsSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  v5 = [(VNRecognizedPointsSpecifier *)&v15 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"OrderedKeypoints"];
    orderedPersonKeypoints = v5->_orderedPersonKeypoints;
    v5->_orderedPersonKeypoints = (NSArray *)v10;

    if (!v5->_orderedPersonKeypoints)
    {
      v13 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"ordered keypoints are not available"];
      [v4 failWithError:v13];

      v12 = 0;
      goto LABEL_6;
    }
  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  id v4 = a3;
  [(VNRecognizedPointsSpecifier *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderedPersonKeypoints, @"OrderedKeypoints", v5.receiver, v5.super_class);
}

- (id)populatedMLMultiArrayAndReturnError:(id *)a3
{
  v46[3] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(VNRecognizedPointsSpecifier *)self originatingRequestSpecifier];
  uint64_t v6 = [v5 requestRevision];
  if (v6 == 3737841664 || v6 == 1)
  {
    NSUInteger v8 = [(NSArray *)self->_orderedPersonKeypoints count];
    id v9 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    v46[0] = &unk_1EF7A6BF0;
    v46[1] = &unk_1EF7A6C08;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8 + 1];
    v46[2] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    v12 = (void *)[v9 initWithShape:v11 dataType:65600 error:a3];

    if (v12)
    {
      v42 = a3;
      v45 = v12;
      id v13 = v12;
      uint64_t v14 = [v13 dataPointer];
      v43 = v13;
      objc_super v15 = [v13 strides];
      v16 = [v15 objectAtIndexedSubscript:2];
      int v17 = [v16 intValue];

      v44 = v15;
      v18 = [v15 objectAtIndexedSubscript:1];
      int v19 = [v18 intValue];

      uint64_t v20 = v17;
      uint64_t v21 = v19;
      uint64_t v22 = 2 * v19;
      if (v8)
      {
        uint64_t v23 = 0;
        double v24 = 0.0;
        double v25 = 3.40282347e38;
        double v26 = 0.0;
        while (2)
        {
          v27 = [(NSArray *)self->_orderedPersonKeypoints objectAtIndex:v23];
          [v27 location];
          double v29 = v28;
          double v31 = v30;
          [v27 confidence];
          double v33 = v32;
          uint64_t v34 = v23;
          switch((int)v23)
          {
            case 0:
              goto LABEL_30;
            case 1:
              uint64_t v34 = 15;
              goto LABEL_30;
            case 2:
              uint64_t v34 = 14;
              goto LABEL_30;
            case 3:
              uint64_t v34 = 17;
              goto LABEL_30;
            case 4:
              uint64_t v34 = 16;
              goto LABEL_30;
            case 5:
              if (v25 > v33) {
                double v25 = v33;
              }
              double v26 = v26 + v29;
              double v24 = v24 + v31;
              uint64_t v34 = 5;
              goto LABEL_30;
            case 6:
              if (v25 > v33) {
                double v25 = v33;
              }
              double v26 = v26 + v29;
              double v24 = v24 + v31;
              uint64_t v34 = 2;
              goto LABEL_30;
            case 7:
              uint64_t v34 = 6;
              goto LABEL_30;
            case 8:
              uint64_t v34 = 3;
              goto LABEL_30;
            case 9:
              uint64_t v34 = 7;
              goto LABEL_30;
            case 10:
              uint64_t v34 = 4;
              goto LABEL_30;
            case 11:
              uint64_t v34 = 11;
              goto LABEL_30;
            case 12:
              uint64_t v34 = 8;
              goto LABEL_30;
            case 13:
              uint64_t v34 = 12;
              goto LABEL_30;
            case 14:
              uint64_t v34 = 9;
              goto LABEL_30;
            case 15:
              uint64_t v34 = 13;
              goto LABEL_30;
            case 16:
              uint64_t v34 = 10;
LABEL_30:
              uint64_t v35 = v34 * v20;
              *(double *)(v14 + 8 * v35) = v29;
              *(double *)(v14 + 8 * (v35 + v21)) = v31;
              *(double *)(v14 + 8 * (v35 + v22)) = v33;

              if (v8 == ++v23) {
                goto LABEL_36;
              }
              continue;
            default:
              v37 = v44;
              if (v42)
              {
                v39 = NSString;
                v40 = objc_msgSend(NSNumber, "numberWithInt:", v23, v33);
                v41 = [v39 stringWithFormat:@"unexpected keypoint type %@", v40];

                id *v42 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v41];
              }
              id v36 = 0;
              v12 = v45;
              goto LABEL_37;
          }
        }
      }
      double v26 = 0.0;
      double v25 = 3.40282347e38;
      double v24 = 0.0;
LABEL_36:
      *(double *)(v14 + 8 * v20) = v26 * 0.5;
      *(double *)(v14 + 8 * (v21 + v20)) = v24 * 0.5;
      *(double *)(v14 + 8 * (v22 + v20)) = v25;
      id v36 = v43;
      v37 = v44;
      v12 = v45;
LABEL_37:
    }
    else
    {
      id v36 = 0;
    }
  }
  else if (a3)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v5];
    id v36 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (id)pointKeyGroupLabelsMapping
{
  if (pointKeyGroupLabelsMapping_onceToken != -1) {
    dispatch_once(&pointKeyGroupLabelsMapping_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)pointKeyGroupLabelsMapping_mapping;

  return v2;
}

void __61__VNRecognizedBodyPointsSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"VNBLKFACE";
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"head_joint", @"left_eye_joint", @"right_eye_joint", @"left_ear_joint", @"right_ear_joint", 0);
  v9[0] = v0;
  v8[1] = @"VNBLKTORSO";
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"left_shoulder_1_joint", @"right_shoulder_1_joint", @"neck_1_joint", @"left_upLeg_joint", @"right_upLeg_joint", @"root", 0);
  v9[1] = v1;
  v8[2] = @"VNBLKLARM";
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"left_shoulder_1_joint", @"left_forearm_joint", @"left_hand_joint", 0);
  v9[2] = v2;
  v8[3] = @"VNBLKRARM";
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"right_shoulder_1_joint", @"right_forearm_joint", @"right_hand_joint", 0);
  v9[3] = v3;
  v8[4] = @"VNBLKLLEG";
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"left_upLeg_joint", @"left_leg_joint", @"left_foot_joint", 0);
  v9[4] = v4;
  v8[5] = @"VNBLKRLEG";
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"right_upLeg_joint", @"right_leg_joint", @"right_foot_joint", 0);
  v9[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  uint64_t v7 = (void *)pointKeyGroupLabelsMapping_mapping;
  pointKeyGroupLabelsMapping_mapping = v6;
}

- (id)availableGroupKeys
{
  if (availableGroupKeys_onceToken != -1) {
    dispatch_once(&availableGroupKeys_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)availableGroupKeys_groupKeys;

  return v2;
}

void __53__VNRecognizedBodyPointsSpecifier_availableGroupKeys__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNBLKFACE";
  v2[1] = @"VNBLKTORSO";
  v2[2] = @"VNBLKLARM";
  v2[3] = @"VNBLKRARM";
  v2[4] = @"VNBLKLLEG";
  v2[5] = @"VNBLKRLEG";
  v2[6] = @"VNIPOAll";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)availableGroupKeys_groupKeys;
  availableGroupKeys_groupKeys = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNRecognizedBodyPointsSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizedBodyPointsSpecifier;
    BOOL v5 = [(VNRecognizedPointsSpecifier *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NSArray *)self->_orderedPersonKeypoints isEqualToArray:v4->_orderedPersonKeypoints];
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  return [(NSArray *)self->_orderedPersonKeypoints hash] ^ __ROR8__([(VNRecognizedPointsSpecifier *)&v3 hash], 51);
}

- (VNRecognizedBodyPointsSpecifier)initWithVCPPersonObservation:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 keypoints];
  uint64_t v8 = [v7 count];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8 + 2];
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v13 = [v6 requestRevision];
  if (v8)
  {
    uint64_t v14 = v13;
    v48 = v10;
    v43 = self;
    id v44 = v6;
    uint64_t v15 = 0;
    int v46 = 0;
    uint64_t v16 = 0;
    int v49 = 0;
    float v45 = 0.0;
    double v47 = v12;
    double v17 = v11;
    float v18 = 0.0;
    do
    {
      int v19 = objc_msgSend(v7, "objectAtIndex:", v16, v43, v44);
      [v19 location];
      double v21 = v20;
      double v23 = v22;
      [v19 confidence];
      float v25 = fminf(v24, 1.0);
      if ((v14 == 3737841664 || v14 == 1)
        && v16 <= 0x10
        && (double v26 = **(__CFString ***)((char *)off_1E5B1AAF8 + (v15 >> 29))) != 0)
      {
        v27 = (VNDetectedPoint *)v26;
        if (([(__CFString *)v26 isEqualToString:@"left_upLeg_joint"] & 1) != 0
          || [(VNDetectedPoint *)v27 isEqualToString:@"right_upLeg_joint"])
        {
          double v12 = v12 + v21;
          double v17 = v17 + v23;
          float v18 = v18 + v25;
          ++v49;
        }
        else if (([(VNDetectedPoint *)v27 isEqualToString:@"left_shoulder_1_joint"] & 1) != 0 {
               || [(VNDetectedPoint *)v27 isEqualToString:@"right_shoulder_1_joint"])
        }
        {
          double v47 = v47 + v21;
          double v11 = v11 + v23;
          float v45 = v45 + v25;
          ++v46;
        }
        double v28 = [VNRecognizedPoint alloc];
        *(float *)&double v29 = v25;
        double v30 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v28, "initWithLocation:confidence:identifier:", v27, v21, v23, v29);
        [v48 setObject:v30 forKey:v27];
        [v9 addObject:v30];
      }
      else
      {
        double v31 = [VNDetectedPoint alloc];
        *(float *)&double v32 = v25;
        v27 = -[VNDetectedPoint initWithLocation:confidence:](v31, "initWithLocation:confidence:", v21, v23, v32);
        [v9 addObject:v27];
      }

      ++v16;
      v15 += 0x100000000;
    }
    while (v8 != v16);
    uint64_t v10 = v48;
    if (v49 == 2)
    {
      double v33 = [VNRecognizedPoint alloc];
      *(float *)&double v34 = v18 * 0.5;
      uint64_t v35 = [(VNRecognizedPoint *)v33 initWithLocation:@"root", v12 * 0.5, v17 * 0.5, v34 confidence identifier];
      [v48 setObject:v35 forKey:@"root"];
    }
    self = v43;
    id v6 = v44;
    if (v46 == 2)
    {
      id v36 = [VNRecognizedPoint alloc];
      *(float *)&double v37 = v45 * 0.5;
      v38 = [(VNRecognizedPoint *)v36 initWithLocation:@"neck_1_joint", v47 * 0.5, v11 * 0.5, v37 confidence identifier];
      [v48 setObject:v38 forKey:@"neck_1_joint"];
    }
  }
  v50.receiver = self;
  v50.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  v39 = [(VNRecognizedPointsSpecifier *)&v50 initWithOriginatingRequestSpecifier:v6 allRecognizedPoints:v10];
  if (v39)
  {
    uint64_t v40 = [v9 copy];
    orderedPersonKeypoints = v39->_orderedPersonKeypoints;
    v39->_orderedPersonKeypoints = (NSArray *)v40;
  }
  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end