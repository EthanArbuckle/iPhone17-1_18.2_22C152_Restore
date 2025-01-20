@interface VNRecognizedHandPointsSpecifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNRecognizedHandPointsSpecifier)initWithCoder:(id)a3;
- (VNRecognizedHandPointsSpecifier)initWithVCPHandObservation:(id)a3 originatingRequestSpecifier:(id)a4;
- (id)availableGroupKeys;
- (id)pointKeyGroupLabelsMapping;
- (id)populatedMLMultiArrayAndReturnError:(id *)a3;
- (int64_t)chirality;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedHandPointsSpecifier

- (void).cxx_destruct
{
}

- (VNRecognizedHandPointsSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNRecognizedHandPointsSpecifier;
  v5 = [(VNRecognizedPointsSpecifier *)&v19 initWithCoder:v4];
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"OrderedKeypoints"];
  orderedHandKeypoints = v5->_orderedHandKeypoints;
  v5->_orderedHandKeypoints = (NSArray *)v10;

  if (!v5->_orderedHandKeypoints)
  {
    v14 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"ordered keypoints are not available"];
    [v4 failWithError:v14];
    goto LABEL_9;
  }
  if ([v4 containsValueForKey:@"Chirality"])
  {
    uint64_t v12 = [v4 decodeIntegerForKey:@"Chirality"];
    if ((unint64_t)(v12 + 1) <= 2)
    {
      v5->_chirality = v12;
      goto LABEL_6;
    }
    v16 = NSString;
    v17 = [NSNumber numberWithInteger:v12];
    v14 = [v16 stringWithFormat:@"%@ has an invalid value of %@", @"Chirality", v17];

    v18 = +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:v14];
    [v4 failWithError:v18];

LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
LABEL_6:

LABEL_7:
  v13 = v5;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedHandPointsSpecifier;
  id v4 = a3;
  [(VNRecognizedPointsSpecifier *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderedHandKeypoints, @"OrderedKeypoints", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_chirality forKey:@"Chirality"];
}

- (id)populatedMLMultiArrayAndReturnError:(id *)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(VNRecognizedPointsSpecifier *)self originatingRequestSpecifier];
  if (![v5 specifiesRequestClass:objc_opt_class()]
    || [v5 requestRevision] != 1)
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v5];
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  NSUInteger v6 = [(NSArray *)self->_orderedHandKeypoints count];
  id v7 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v30[0] = &unk_1EF7A7718;
  v30[1] = &unk_1EF7A7730;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  v30[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  uint64_t v10 = (void *)[v7 initWithShape:v9 dataType:65600 error:a3];

  if (!v10)
  {
LABEL_10:
    v26 = 0;
    goto LABEL_11;
  }
  id v11 = v10;
  uint64_t v12 = (void *)[v11 dataPointer];
  id v29 = v11;
  v13 = [v11 strides];
  v14 = [v13 objectAtIndexedSubscript:2];
  int v15 = [v14 intValue];

  v28 = v13;
  v16 = [v13 objectAtIndexedSubscript:1];
  int v17 = [v16 intValue];

  if (v6)
  {
    uint64_t v18 = 0;
    uint64_t v19 = v17;
    uint64_t v20 = 2 * v17;
    uint64_t v21 = 8 * v15;
    do
    {
      v22 = [(NSArray *)self->_orderedHandKeypoints objectAtIndex:v18];
      [v22 location];
      *uint64_t v12 = v23;
      v12[v19] = v24;
      [v22 confidence];
      *(double *)&v12[v20] = v25;

      ++v18;
      uint64_t v12 = (void *)((char *)v12 + v21);
    }
    while (v6 != v18);
  }

  v26 = v29;
LABEL_11:

  return v26;
}

- (id)pointKeyGroupLabelsMapping
{
  if (pointKeyGroupLabelsMapping_onceToken_30417 != -1) {
    dispatch_once(&pointKeyGroupLabelsMapping_onceToken_30417, &__block_literal_global_38);
  }
  v2 = (void *)pointKeyGroupLabelsMapping_groupKeys;

  return v2;
}

void __61__VNRecognizedHandPointsSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"VNHLRKT";
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"VNHLKTCMC", @"VNHLKTMP", @"VNHLKTIP", @"VNHLKTTIP", 0);
  v8[0] = v0;
  v7[1] = @"VNHLRKM";
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"VNHLKMMCP", @"VNHLKMPIP", @"VNHLKMDIP", @"VNHLKMTIP", 0);
  v8[1] = v1;
  v7[2] = @"VNHLRKI";
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"VNHLKIMCP", @"VNHLKIPIP", @"VNHLKIDIP", @"VNHLKITIP", 0);
  v8[2] = v2;
  v7[3] = @"VNHLRKR";
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"VNHLKRMCP", @"VNHLKRPIP", @"VNHLKRDIP", @"VNHLKRTIP", 0);
  v8[3] = v3;
  v7[4] = @"VNHLRKP";
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"VNHLKPMCP", @"VNHLKPPIP", @"VNHLKPDIP", @"VNHLKPTIP", 0);
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  NSUInteger v6 = (void *)pointKeyGroupLabelsMapping_groupKeys;
  pointKeyGroupLabelsMapping_groupKeys = v5;
}

- (id)availableGroupKeys
{
  if (availableGroupKeys_onceToken_30419 != -1) {
    dispatch_once(&availableGroupKeys_onceToken_30419, &__block_literal_global_30420);
  }
  v2 = (void *)availableGroupKeys_groupKeys_30421;

  return v2;
}

void __53__VNRecognizedHandPointsSpecifier_availableGroupKeys__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNHLRKT";
  v2[1] = @"VNHLRKM";
  v2[2] = @"VNHLRKI";
  v2[3] = @"VNHLRKR";
  v2[4] = @"VNHLRKP";
  v2[5] = @"VNIPOAll";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)availableGroupKeys_groupKeys_30421;
  availableGroupKeys_groupKeys_30421 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNRecognizedHandPointsSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizedHandPointsSpecifier;
    BOOL v5 = [(VNRecognizedPointsSpecifier *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NSArray *)self->_orderedHandKeypoints isEqualToArray:v4->_orderedHandKeypoints];
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedHandPointsSpecifier;
  return [(NSArray *)self->_orderedHandKeypoints hash] ^ __ROR8__([(VNRecognizedPointsSpecifier *)&v3 hash], 51);
}

- (int64_t)chirality
{
  return self->_chirality;
}

- (VNRecognizedHandPointsSpecifier)initWithVCPHandObservation:(id)a3 originatingRequestSpecifier:(id)a4
{
  v36 = self;
  id v5 = a3;
  id v6 = a4;
  v38 = v5;
  objc_super v7 = [v5 keypoints];
  uint64_t v8 = [v7 count];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  v37 = v6;
  uint64_t v10 = [v6 requestRevision];
  if (v8)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    v14 = &off_1E5B19000;
    do
    {
      int v15 = objc_msgSend(v7, "objectAtIndex:", v13, v36);
      [v15 location];
      double v17 = v16;
      double v19 = v18;
      [v15 confidence];
      int v21 = v20;
      if (v11 == 1
        && v13 <= 0x14
        && (v22 = **(__CFString ***)((char *)off_1E5B1F0A8 + (v12 >> 29))) != 0)
      {
        uint64_t v23 = v22;
        uint64_t v24 = [VNRecognizedPoint alloc];
        LODWORD(v25) = v21;
        v26 = v14;
        v27 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v24, "initWithLocation:confidence:identifier:", v23, v17, v19, v25);
        [v9 addObject:v27];
        [v39 setObject:v27 forKey:v23];

        v14 = v26;
      }
      else
      {
        id v28 = objc_alloc((Class)v14[192]);
        LODWORD(v29) = v21;
        uint64_t v23 = (__CFString *)objc_msgSend(v28, "initWithLocation:confidence:", v17, v19, v29);
        [v9 addObject:v23];
      }

      ++v13;
      v12 += 0x100000000;
    }
    while (v8 != v13);
  }
  v40.receiver = v36;
  v40.super_class = (Class)VNRecognizedHandPointsSpecifier;
  v30 = -[VNRecognizedPointsSpecifier initWithOriginatingRequestSpecifier:allRecognizedPoints:](&v40, sel_initWithOriginatingRequestSpecifier_allRecognizedPoints_, v37, v39, v36);
  if (v30)
  {
    uint64_t v31 = [v9 copy];
    orderedHandKeypoints = v30->_orderedHandKeypoints;
    v30->_orderedHandKeypoints = (NSArray *)v31;

    if (objc_opt_respondsToSelector())
    {
      int v33 = [v38 chirality];
      if (v33 == -1)
      {
        uint64_t v34 = -1;
        goto LABEL_15;
      }
      if (v33 == 1)
      {
        uint64_t v34 = 1;
LABEL_15:
        v30->_chirality = v34;
      }
    }
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end