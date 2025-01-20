@interface IXProgressHint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)setPhaseProportionsForLoadingPhase:(id)a3 installingPhase:(id)a4 postProcessingPhase:(id)a5 error:(id *)a6;
- (IXProgressHint)init;
- (IXProgressHint)initWithCoder:(id)a3;
- (NSDictionary)progressProportionsDictionaryForLaunchServices;
- (NSNumber)compressedAppAssetSizeInBytes;
- (NSNumber)filesInAppAssetCount;
- (NSNumber)installingPhaseProportion;
- (NSNumber)loadingPhaseProportion;
- (NSNumber)postProcessingPhaseProportion;
- (NSNumber)totalExpectedEssentialAssetSizeInBytes;
- (NSNumber)totalODRAssetSizeInBytes;
- (NSNumber)uncompressedAppAssetSizeInBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressedAppAssetSizeInBytes:(id)a3;
- (void)setFilesInAppAssetCount:(id)a3;
- (void)setTotalExpectedEssentialAssetSizeInBytes:(id)a3;
- (void)setTotalODRAssetSizeInBytes:(id)a3;
- (void)setUncompressedAppAssetSizeInBytes:(id)a3;
@end

@implementation IXProgressHint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXProgressHint)init
{
  v3.receiver = self;
  v3.super_class = (Class)IXProgressHint;
  return [(IXProgressHint *)&v3 init];
}

- (IXProgressHint)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IXProgressHint;
  v5 = [(IXProgressHint *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compressedAppAssetSizeInBytes"];
    compressedAppAssetSizeInBytes = v5->_compressedAppAssetSizeInBytes;
    v5->_compressedAppAssetSizeInBytes = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uncompressedAppAssetSizeInBytes"];
    uncompressedAppAssetSizeInBytes = v5->_uncompressedAppAssetSizeInBytes;
    v5->_uncompressedAppAssetSizeInBytes = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filesInAppAssetCount"];
    filesInAppAssetCount = v5->_filesInAppAssetCount;
    v5->_filesInAppAssetCount = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalODRAssetSizeInBytes"];
    totalODRAssetSizeInBytes = v5->_totalODRAssetSizeInBytes;
    v5->_totalODRAssetSizeInBytes = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalExpectedEssentialAssetSizeInBytes"];
    totalExpectedEssentialAssetSizeInBytes = v5->_totalExpectedEssentialAssetSizeInBytes;
    v5->_totalExpectedEssentialAssetSizeInBytes = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loadingPhaseProportion"];
    loadingPhaseProportion = v5->_loadingPhaseProportion;
    v5->_loadingPhaseProportion = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installingPhaseProportion"];
    installingPhaseProportion = v5->_installingPhaseProportion;
    v5->_installingPhaseProportion = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postProcessingPhaseProportion"];
    postProcessingPhaseProportion = v5->_postProcessingPhaseProportion;
    v5->_postProcessingPhaseProportion = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXProgressHint *)self compressedAppAssetSizeInBytes];
  [v4 encodeObject:v5 forKey:@"compressedAppAssetSizeInBytes"];

  uint64_t v6 = [(IXProgressHint *)self uncompressedAppAssetSizeInBytes];
  [v4 encodeObject:v6 forKey:@"uncompressedAppAssetSizeInBytes"];

  v7 = [(IXProgressHint *)self filesInAppAssetCount];
  [v4 encodeObject:v7 forKey:@"filesInAppAssetCount"];

  uint64_t v8 = [(IXProgressHint *)self totalODRAssetSizeInBytes];
  [v4 encodeObject:v8 forKey:@"totalODRAssetSizeInBytes"];

  v9 = [(IXProgressHint *)self totalExpectedEssentialAssetSizeInBytes];
  [v4 encodeObject:v9 forKey:@"totalExpectedEssentialAssetSizeInBytes"];

  uint64_t v10 = [(IXProgressHint *)self loadingPhaseProportion];
  [v4 encodeObject:v10 forKey:@"loadingPhaseProportion"];

  v11 = [(IXProgressHint *)self installingPhaseProportion];
  [v4 encodeObject:v11 forKey:@"installingPhaseProportion"];

  id v12 = [(IXProgressHint *)self postProcessingPhaseProportion];
  [v4 encodeObject:v12 forKey:@"postProcessingPhaseProportion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(IXProgressHint *)self compressedAppAssetSizeInBytes];
  [v4 setCompressedAppAssetSizeInBytes:v5];

  uint64_t v6 = [(IXProgressHint *)self uncompressedAppAssetSizeInBytes];
  [v4 setUncompressedAppAssetSizeInBytes:v6];

  v7 = [(IXProgressHint *)self filesInAppAssetCount];
  [v4 setFilesInAppAssetCount:v7];

  uint64_t v8 = [(IXProgressHint *)self totalODRAssetSizeInBytes];
  [v4 setTotalODRAssetSizeInBytes:v8];

  v9 = [(IXProgressHint *)self totalExpectedEssentialAssetSizeInBytes];
  [v4 setTotalExpectedEssentialAssetSizeInBytes:v9];

  uint64_t v10 = [(IXProgressHint *)self loadingPhaseProportion];
  v11 = [(IXProgressHint *)self installingPhaseProportion];
  id v12 = [(IXProgressHint *)self postProcessingPhaseProportion];
  [v4 setPhaseProportionsForLoadingPhase:v10 installingPhase:v11 postProcessingPhase:v12 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXProgressHint *)a3;
  if (v4 == self)
  {
    BOOL v20 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v20 = 0;
    goto LABEL_21;
  }
  v5 = v4;
  uint64_t v6 = [(IXProgressHint *)self compressedAppAssetSizeInBytes];
  v7 = [(IXProgressHint *)v5 compressedAppAssetSizeInBytes];
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = v9;
  if ((v8 != 0) != (v9 != 0) || v8 && v9 && ![v8 isEqual:v9]) {
    goto LABEL_16;
  }

  v11 = [(IXProgressHint *)self uncompressedAppAssetSizeInBytes];
  id v12 = [(IXProgressHint *)v5 uncompressedAppAssetSizeInBytes];
  id v8 = v11;
  id v13 = v12;
  uint64_t v10 = v13;
  if ((v8 != 0) != (v13 != 0) || v8 && v13 && ![v8 isEqual:v13]) {
    goto LABEL_16;
  }

  uint64_t v14 = [(IXProgressHint *)self filesInAppAssetCount];
  v15 = [(IXProgressHint *)v5 filesInAppAssetCount];
  id v8 = v14;
  id v16 = v15;
  uint64_t v10 = v16;
  if ((v8 != 0) != (v16 != 0) || v8 && v16 && ![v8 isEqual:v16]) {
    goto LABEL_16;
  }

  v17 = [(IXProgressHint *)self totalODRAssetSizeInBytes];
  uint64_t v18 = [(IXProgressHint *)v5 totalODRAssetSizeInBytes];
  id v8 = v17;
  id v19 = v18;
  uint64_t v10 = v19;
  if ((v8 != 0) != (v19 != 0) || v8 && v19 && ![v8 isEqual:v19])
  {
LABEL_16:

    BOOL v20 = 0;
  }
  else
  {

    v22 = [(IXProgressHint *)self totalExpectedEssentialAssetSizeInBytes];
    objc_super v23 = [(IXProgressHint *)v5 totalExpectedEssentialAssetSizeInBytes];
    BOOL v24 = _CompareObjects(v22, v23);

    if (!v24) {
      goto LABEL_29;
    }
    v25 = [(IXProgressHint *)self loadingPhaseProportion];
    v26 = [(IXProgressHint *)v5 loadingPhaseProportion];
    BOOL v27 = _CompareObjects(v25, v26);

    if (!v27
      || ([(IXProgressHint *)self installingPhaseProportion],
          v28 = objc_claimAutoreleasedReturnValue(),
          [(IXProgressHint *)v5 installingPhaseProportion],
          v29 = objc_claimAutoreleasedReturnValue(),
          BOOL v30 = _CompareObjects(v28, v29),
          v29,
          v28,
          !v30))
    {
LABEL_29:
      BOOL v20 = 0;
      goto LABEL_18;
    }
    id v8 = [(IXProgressHint *)self postProcessingPhaseProportion];
    uint64_t v10 = [(IXProgressHint *)v5 postProcessingPhaseProportion];
    BOOL v20 = _CompareObjects(v8, v10);
  }

LABEL_18:
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  objc_super v3 = [(IXProgressHint *)self compressedAppAssetSizeInBytes];
  uint64_t v4 = [v3 hash];

  v5 = [(IXProgressHint *)self uncompressedAppAssetSizeInBytes];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(IXProgressHint *)self filesInAppAssetCount];
  uint64_t v8 = [v7 hash];

  id v9 = [(IXProgressHint *)self totalODRAssetSizeInBytes];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(IXProgressHint *)self totalExpectedEssentialAssetSizeInBytes];
  uint64_t v12 = [v11 hash];

  id v13 = [(IXProgressHint *)self loadingPhaseProportion];
  uint64_t v14 = v12 ^ [v13 hash];

  v15 = [(IXProgressHint *)self installingPhaseProportion];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];

  v17 = [(IXProgressHint *)self postProcessingPhaseProportion];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (NSDictionary)progressProportionsDictionaryForLaunchServices
{
  objc_super v3 = objc_opt_new();
  uint64_t v4 = [(IXProgressHint *)self loadingPhaseProportion];
  if (v4) {
    [v3 setObject:v4 forKey:&unk_1EFE06B28];
  }

  v5 = [(IXProgressHint *)self installingPhaseProportion];
  if (v5) {
    [v3 setObject:v5 forKey:&unk_1EFE06B40];
  }

  uint64_t v6 = [(IXProgressHint *)self postProcessingPhaseProportion];
  if (v6) {
    [v3 setObject:v6 forKey:&unk_1EFE06B58];
  }

  v7 = (void *)[v3 copy];

  return (NSDictionary *)v7;
}

- (BOOL)setPhaseProportionsForLoadingPhase:(id)a3 installingPhase:(id)a4 postProcessingPhase:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  [a3 doubleValue];
  double v13 = v12;
  [v11 doubleValue];
  double v15 = v14;

  if (v10) {
    [v10 doubleValue];
  }
  else {
    double v16 = 0.0;
  }
  if (v13 == 0.0)
  {
    v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]();
    }

    id v19 = @"The loading phase is required and thus cannot be 0 percent of the total progress.";
    uint64_t v20 = 176;
  }
  else if (v15 == 0.0)
  {
    v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]();
    }

    id v19 = @"The installing phase is required and thus cannot be 0 percent of the total progress.";
    uint64_t v20 = 180;
  }
  else if (v13 >= 0.0)
  {
    if (v15 >= 0.0)
    {
      if (v16 >= 0.0)
      {
        double v28 = v13 + v15 + v16;
        double v29 = v13 / v28;
        double v30 = v15 / v28;
        double v31 = v16 / v28;
        v32 = [NSNumber numberWithDouble:v29];
        loadingPhaseProportion = self->_loadingPhaseProportion;
        self->_loadingPhaseProportion = v32;

        v34 = [NSNumber numberWithDouble:v30];
        installingPhaseProportion = self->_installingPhaseProportion;
        self->_installingPhaseProportion = v34;

        v36 = [NSNumber numberWithDouble:v31];
        postProcessingPhaseProportion = self->_postProcessingPhaseProportion;
        self->_postProcessingPhaseProportion = v36;

        id v25 = 0;
        BOOL v26 = 1;
        goto LABEL_27;
      }
      BOOL v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.5();
      }

      id v19 = @"The post processing installation phase proportion cannot be negative.";
      uint64_t v20 = 193;
    }
    else
    {
      objc_super v23 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.4();
      }

      id v19 = @"The installing installation phase proportion cannot be negative.";
      uint64_t v20 = 189;
    }
  }
  else
  {
    v22 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]();
    }

    id v19 = @"The loading installation phase proportion cannot be negative.";
    uint64_t v20 = 185;
  }
  _CreateError((uint64_t)"-[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]", v20, @"IXErrorDomain", 0x37uLL, 0, 0, v19, v18, v38);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    id v25 = v25;
    BOOL v26 = 0;
    *a6 = v25;
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_27:

  return v26;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(IXProgressHint *)self loadingPhaseProportion];
  v7 = [(IXProgressHint *)self installingPhaseProportion];
  uint64_t v8 = [(IXProgressHint *)self postProcessingPhaseProportion];
  id v9 = [v3 stringWithFormat:@"<%@ loading:%@ installing:%@ postprocessing:%@>", v5, v6, v7, v8];

  return v9;
}

- (NSNumber)compressedAppAssetSizeInBytes
{
  return self->_compressedAppAssetSizeInBytes;
}

- (void)setCompressedAppAssetSizeInBytes:(id)a3
{
}

- (NSNumber)uncompressedAppAssetSizeInBytes
{
  return self->_uncompressedAppAssetSizeInBytes;
}

- (void)setUncompressedAppAssetSizeInBytes:(id)a3
{
}

- (NSNumber)filesInAppAssetCount
{
  return self->_filesInAppAssetCount;
}

- (void)setFilesInAppAssetCount:(id)a3
{
}

- (NSNumber)totalODRAssetSizeInBytes
{
  return self->_totalODRAssetSizeInBytes;
}

- (void)setTotalODRAssetSizeInBytes:(id)a3
{
}

- (NSNumber)totalExpectedEssentialAssetSizeInBytes
{
  return self->_totalExpectedEssentialAssetSizeInBytes;
}

- (void)setTotalExpectedEssentialAssetSizeInBytes:(id)a3
{
}

- (NSNumber)loadingPhaseProportion
{
  return self->_loadingPhaseProportion;
}

- (NSNumber)installingPhaseProportion
{
  return self->_installingPhaseProportion;
}

- (NSNumber)postProcessingPhaseProportion
{
  return self->_postProcessingPhaseProportion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingPhaseProportion, 0);
  objc_storeStrong((id *)&self->_installingPhaseProportion, 0);
  objc_storeStrong((id *)&self->_loadingPhaseProportion, 0);
  objc_storeStrong((id *)&self->_totalExpectedEssentialAssetSizeInBytes, 0);
  objc_storeStrong((id *)&self->_totalODRAssetSizeInBytes, 0);
  objc_storeStrong((id *)&self->_filesInAppAssetCount, 0);
  objc_storeStrong((id *)&self->_uncompressedAppAssetSizeInBytes, 0);

  objc_storeStrong((id *)&self->_compressedAppAssetSizeInBytes, 0);
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: The loading phase is required and thus cannot be 0 percent of the total progress. : %@", v2, v3, v4, v5, 2u);
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: The installing phase is required and thus cannot be 0 percent of the total progress. : %@", v2, v3, v4, v5, 2u);
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: The loading installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: The installing installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: The post processing installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
}

@end