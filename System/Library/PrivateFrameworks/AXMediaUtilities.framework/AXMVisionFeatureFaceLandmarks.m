@interface AXMVisionFeatureFaceLandmarks
+ (BOOL)supportsSecureCoding;
+ (id)unitTestingFaceLandmarksIs3D:(BOOL)a3;
- (AXMVisionFeatureFaceLandmarks)initWithCoder:(id)a3;
- (AXMVisionFeatureFaceLandmarks)initWithVisionFaceLandmarks:(id)a3;
- (BOOL)is3DLandmarks;
- (NSDictionary)results;
- (id)localizedStringForLandmarkType:(unint64_t)a3;
- (id)pointValuesForFaceLandmarkType:(unint64_t)a3;
- (id)pointsArrayForRegion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIs3DLandmarks:(BOOL)a3;
- (void)setResults:(id)a3;
@end

@implementation AXMVisionFeatureFaceLandmarks

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureFaceLandmarks)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXMVisionFeatureFaceLandmarks;
  v5 = [(AXMVisionFeatureFaceLandmarks *)&v16 init];
  if (v5)
  {
    -[AXMVisionFeatureFaceLandmarks setIs3DLandmarks:](v5, "setIs3DLandmarks:", [v4 decodeBoolForKey:@"AXMVisionFeatureFaceLandmarksIs3DLandmarks"]);
    v6 = AXMSecureCodingClasses();
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"AXMVisionFeatureFaceLandmarksResults"];

    v8 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v9 = objc_opt_class();
    v10 = AXMSecureCodingClasses();
    id v15 = 0;
    v11 = [v8 axmSecurelyUnarchiveData:v7 withExpectedClass:v9 otherAllowedClasses:v10 error:&v15];
    id v12 = v15;

    if (v12)
    {
      v13 = AXMediaLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl(&dword_1B57D5000, v13, OS_LOG_TYPE_DEFAULT, "Error decoding face landmark dict: %@", buf, 0xCu);
      }
    }
    else
    {
      [(AXMVisionFeatureFaceLandmarks *)v5 setResults:v11];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionFeatureFaceLandmarks is3DLandmarks](self, "is3DLandmarks"), @"AXMVisionFeatureFaceLandmarksIs3DLandmarks");
  v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = [(AXMVisionFeatureFaceLandmarks *)self results];
  id v10 = 0;
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v10];
  id v8 = v10;

  if (v8)
  {
    uint64_t v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXMVisionFeatureFaceLandmarks encodeWithCoder:]((uint64_t)v8, v9);
    }
  }
  [v4 encodeObject:v7 forKey:@"AXMVisionFeatureFaceLandmarksResults"];
}

- (AXMVisionFeatureFaceLandmarks)initWithVisionFaceLandmarks:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AXMVisionFeatureFaceLandmarks;
  v5 = [(AXMVisionFeatureFaceLandmarks *)&v33 init];
  if (v5)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v6 = (void *)getVNFaceLandmarks2DClass_softClass;
    uint64_t v38 = getVNFaceLandmarks2DClass_softClass;
    if (!getVNFaceLandmarks2DClass_softClass)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __getVNFaceLandmarks2DClass_block_invoke;
      v34[3] = &unk_1E6116AD8;
      v34[4] = &v35;
      __getVNFaceLandmarks2DClass_block_invoke((uint64_t)v34);
      v6 = (void *)v36[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v35, 8);
    [(AXMVisionFeatureFaceLandmarks *)v5 setIs3DLandmarks:(objc_opt_isKindOfClass() & 1) == 0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (![(AXMVisionFeatureFaceLandmarks *)v5 is3DLandmarks])
    {
      id v9 = v4;
      id v10 = [v9 leftEye];
      v11 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v10];
      [v8 setObject:v11 forKey:&unk_1F0E93D48];

      id v12 = [v9 rightEye];
      v13 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v12];
      [v8 setObject:v13 forKey:&unk_1F0E93D60];

      v14 = [v9 leftEyebrow];
      id v15 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v14];
      [v8 setObject:v15 forKey:&unk_1F0E93D78];

      objc_super v16 = [v9 rightEyebrow];
      v17 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v16];
      [v8 setObject:v17 forKey:&unk_1F0E93D90];

      id v18 = [v9 nose];
      uint64_t v19 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v18];
      [v8 setObject:v19 forKey:&unk_1F0E93DA8];

      v20 = [v9 noseCrest];
      v21 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v20];
      [v8 setObject:v21 forKey:&unk_1F0E93DC0];

      v22 = [v9 medianLine];
      v23 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v22];
      [v8 setObject:v23 forKey:&unk_1F0E93DD8];

      v24 = [v9 outerLips];
      v25 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v24];
      [v8 setObject:v25 forKey:&unk_1F0E93DF0];

      v26 = [v9 innerLips];
      v27 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v26];
      [v8 setObject:v27 forKey:&unk_1F0E93E08];

      v28 = [v9 leftPupil];
      v29 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v28];
      [v8 setObject:v29 forKey:&unk_1F0E93E20];

      v30 = [v9 rightPupil];

      v31 = [(AXMVisionFeatureFaceLandmarks *)v5 pointsArrayForRegion:v30];
      [v8 setObject:v31 forKey:&unk_1F0E93E38];
    }
    [(AXMVisionFeatureFaceLandmarks *)v5 setResults:v8];
  }
  return v5;
}

- (id)pointsArrayForRegion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 pointCount])
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      id v7 = v3;
      uint64_t v8 = [v7 normalizedPoints];
      id v9 = objc_msgSend(MEMORY[0x1E4F29238], "axmValueWithCGPoint:", *(double *)(v8 + v5), *(double *)(v8 + v5 + 8));
      [v4 addObject:v9];

      ++v6;
      v5 += 16;
    }
    while (v6 < [v7 pointCount]);
  }

  return v4;
}

- (id)pointValuesForFaceLandmarkType:(unint64_t)a3
{
  if ([(AXMVisionFeatureFaceLandmarks *)self is3DLandmarks])
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = [(AXMVisionFeatureFaceLandmarks *)self results];
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v5 = [v6 objectForKey:v7];
  }

  return v5;
}

- (id)localizedStringForLandmarkType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.face";
      goto LABEL_14;
    case 1uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.lefteye";
      goto LABEL_14;
    case 2uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.righteye";
      goto LABEL_14;
    case 3uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.lefteyebrow";
      goto LABEL_14;
    case 4uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.righteyebrow";
      goto LABEL_14;
    case 5uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.nose";
      goto LABEL_14;
    case 6uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.nosecrest";
      goto LABEL_14;
    case 7uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.medianline";
      goto LABEL_14;
    case 8uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.mouth";
      goto LABEL_14;
    case 9uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.innerlips";
      goto LABEL_14;
    case 0xAuLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.leftpupil";
      goto LABEL_14;
    case 0xBuLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v4 = v3;
      uint64_t v5 = @"photo.landmarks.rightpupil";
LABEL_14:
      unint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F0E72D10 table:@"Accessibility"];

      break;
    default:
      unint64_t v6 = 0;
      break;
  }

  return v6;
}

+ (id)unitTestingFaceLandmarksIs3D:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(AXMVisionFeatureFaceLandmarks);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  [(AXMVisionFeatureFaceLandmarks *)v4 setResults:v5];

  [(AXMVisionFeatureFaceLandmarks *)v4 setIs3DLandmarks:v3];

  return v4;
}

- (BOOL)is3DLandmarks
{
  return self->_is3DLandmarks;
}

- (void)setIs3DLandmarks:(BOOL)a3
{
  self->_is3DLandmarks = a3;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Failed to archive face landmark results: %@", (uint8_t *)&v2, 0xCu);
}

@end