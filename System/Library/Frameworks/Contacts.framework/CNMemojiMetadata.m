@interface CNMemojiMetadata
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (AVTAvatar)avatar;
- (AVTAvatarDescriptor)avatarDescriptor;
- (AVTAvatarPhysicalizedPose)pose;
- (AVTAvatarRecord)avatarRecord;
- (AVTStickerConfiguration)poseConfiguration;
- (BOOL)avatarRecordIsEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)poseHasBody;
- (CGAffineTransform)cropTransform;
- (CNMemojiBackgroundParameters)backgroundParameters;
- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5;
- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6;
- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseName:(id)a4 pose:(id)a5 backgroundColorDescription:(id)a6;
- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseName:(id)a4 pose:(id)a5 backgroundColorDescription:(id)a6 cropTransform:(CGAffineTransform *)a7;
- (CNMemojiMetadata)initWithBackgroundColorDescription:(id)a3;
- (CNMemojiMetadata)initWithCoder:(id)a3;
- (NSData)avatarRecordData;
- (NSData)poseConfigurationData;
- (NSString)avatarRecordIdentifier;
- (NSString)backgroundColorDescription;
- (NSString)poseName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNMemojiMetadata

+ (id)log
{
  if (log_cn_once_token_2_0 != -1) {
    dispatch_once(&log_cn_once_token_2_0, &__block_literal_global_78);
  }
  v2 = (void *)log_cn_once_object_2_0;

  return v2;
}

uint64_t __23__CNMemojiMetadata_log__block_invoke()
{
  log_cn_once_object_2_0 = (uint64_t)os_log_create("com.apple.contacts.ui", "CNMemojiMetadata");

  return MEMORY[0x1F41817F8]();
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseName:(id)a4 pose:(id)a5 backgroundColorDescription:(id)a6
{
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [(CNMemojiMetadata *)self initWithAvatarRecord:a3 poseName:a4 pose:a5 backgroundColorDescription:a6 cropTransform:v8];
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseName:(id)a4 pose:(id)a5 backgroundColorDescription:(id)a6 cropTransform:(CGAffineTransform *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CNMemojiMetadata;
  v17 = [(CNMemojiMetadata *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_avatarRecord, a3);
    uint64_t v19 = [v14 copy];
    poseName = v18->_poseName;
    v18->_poseName = (NSString *)v19;

    objc_storeStrong((id *)&v18->_pose, a5);
    if (v16)
    {
      uint64_t v21 = [v16 copy];
    }
    else
    {
      uint64_t v21 = +[CNMemojiBackgroundParameters defaultBackgroundColorDescription];
    }
    backgroundColorDescription = v18->_backgroundColorDescription;
    v18->_backgroundColorDescription = (NSString *)v21;

    v23 = [[CNMemojiBackgroundParameters alloc] initWithColorDescription:v18->_backgroundColorDescription];
    backgroundParameters = v18->_backgroundParameters;
    v18->_backgroundParameters = v23;

    long long v25 = *(_OWORD *)&a7->a;
    long long v26 = *(_OWORD *)&a7->tx;
    *(_OWORD *)&v18->_cropTransform.c = *(_OWORD *)&a7->c;
    *(_OWORD *)&v18->_cropTransform.tx = v26;
    *(_OWORD *)&v18->_cropTransform.a = v25;
    v27 = v18;
  }

  return v18;
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 name];
  v12 = [v9 physicalizedPose];

  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v13;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v14 = [(CNMemojiMetadata *)self initWithAvatarRecord:v10 poseName:v11 pose:v12 backgroundColorDescription:v8 cropTransform:v16];

  return v14;
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  long long v13 = [v11 name];
  id v14 = [v11 physicalizedPose];

  long long v15 = *(_OWORD *)&a6->c;
  v18[0] = *(_OWORD *)&a6->a;
  v18[1] = v15;
  v18[2] = *(_OWORD *)&a6->tx;
  id v16 = [(CNMemojiMetadata *)self initWithAvatarRecord:v12 poseName:v13 pose:v14 backgroundColorDescription:v10 cropTransform:v18];

  return v16;
}

- (CNMemojiMetadata)initWithBackgroundColorDescription:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [(CNMemojiMetadata *)self initWithAvatarRecord:0 poseName:0 pose:0 backgroundColorDescription:a3 cropTransform:v5];
}

- (AVTStickerConfiguration)poseConfiguration
{
  long long v3 = [(CNMemojiMetadata *)self avatarRecord];
  v4 = [(CNMemojiMetadata *)self poseName];
  v5 = [(CNMemojiMetadata *)self pose];
  long long v6 = +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:v3 stickerName:v4 pose:v5];

  [v6 loadIfNeeded];

  return (AVTStickerConfiguration *)v6;
}

- (AVTAvatar)avatar
{
  long long v3 = [(CNMemojiMetadata *)self avatarRecord];

  if (v3)
  {
    Class AVTAvatarRecordRenderingClass = getAVTAvatarRecordRenderingClass();
    v5 = [(CNMemojiMetadata *)self avatarRecord];
    long long v6 = [(objc_class *)AVTAvatarRecordRenderingClass avatarForRecord:v5];
  }
  else
  {
    long long v6 = 0;
  }

  return (AVTAvatar *)v6;
}

- (AVTAvatarDescriptor)avatarDescriptor
{
  long long v3 = [(CNMemojiMetadata *)self avatarRecord];

  if (v3)
  {
    Class AVTAvatarRecordRenderingClass = getAVTAvatarRecordRenderingClass();
    v5 = [(CNMemojiMetadata *)self avatarRecord];
    long long v6 = [(objc_class *)AVTAvatarRecordRenderingClass avatarDescriptorForRecord:v5];
  }
  else
  {
    long long v6 = 0;
  }

  return (AVTAvatarDescriptor *)v6;
}

- (NSString)avatarRecordIdentifier
{
  v2 = [(CNMemojiMetadata *)self avatarRecord];
  long long v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSData)avatarRecordData
{
  Class AVTAvatarRecordSerializerClass = getAVTAvatarRecordSerializerClass();
  v4 = [(CNMemojiMetadata *)self avatarRecord];
  v5 = [(objc_class *)AVTAvatarRecordSerializerClass dataFromAvatarRecord:v4];

  return (NSData *)v5;
}

- (BOOL)avatarRecordIsEditable
{
  v2 = [(CNMemojiMetadata *)self avatarRecord];
  char v3 = [v2 isEditable];

  return v3;
}

- (NSData)poseConfigurationData
{
  v2 = [(CNMemojiMetadata *)self poseConfiguration];
  char v3 = +[CNMemojiMetadataUtilities dataForPoseConfiguration:v2];

  return (NSData *)v3;
}

- (BOOL)poseHasBody
{
  char v3 = [(CNMemojiMetadata *)self poseConfiguration];
  [v3 loadIfNeeded];

  v4 = [(CNMemojiMetadata *)self poseConfiguration];
  v5 = [v4 bodyPose];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMemojiMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"version"];
  if (v5 >= 3)
  {
    int v43 = v5;
    v44 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[CNMemojiMetadata initWithCoder:](v43, v44);
    }
    v45 = 0;
  }
  else
  {
    v48 = self;
    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColorDescription"];
    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avatarRecordData"];
    v50 = [(objc_class *)getAVTAvatarRecordSerializerClass() avatarRecordFromData:v51];
    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"poseName"];
    long long v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"poseRepresentation"];

    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"posePhysicsStatesRepresentation"];

    v20 = (void *)[objc_alloc(getAVTAvatarPhysicalizedPoseClass_0()) initWithPoseRepresentation:v12 physicsStatesRepresentation:v19];
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v22 = [v4 decodeArrayOfObjectsOfClasses:v21 forKey:@"cropTransformValues"];

    if (v22)
    {
      v23 = [v22 objectAtIndexedSubscript:0];
      [v23 doubleValue];
      uint64_t v25 = v24;
      long long v26 = [v22 objectAtIndexedSubscript:1];
      [v26 doubleValue];
      uint64_t v28 = v27;
      [v22 objectAtIndexedSubscript:2];
      objc_super v29 = v47 = v19;
      [v29 doubleValue];
      uint64_t v31 = v30;
      [v22 objectAtIndexedSubscript:3];
      v33 = v32 = v12;
      [v33 doubleValue];
      uint64_t v35 = v34;
      [v22 objectAtIndexedSubscript:4];
      v37 = v36 = v20;
      [v37 doubleValue];
      uint64_t v39 = v38;
      v40 = [v22 objectAtIndexedSubscript:5];
      [v40 doubleValue];
      uint64_t v42 = v41;

      v20 = v36;
      id v12 = v32;

      uint64_t v19 = v47;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4F1DAB8];
      uint64_t v28 = *(void *)(MEMORY[0x1E4F1DAB8] + 8);
      uint64_t v31 = *(void *)(MEMORY[0x1E4F1DAB8] + 16);
      uint64_t v35 = *(void *)(MEMORY[0x1E4F1DAB8] + 24);
      uint64_t v39 = *(void *)(MEMORY[0x1E4F1DAB8] + 32);
      uint64_t v42 = *(void *)(MEMORY[0x1E4F1DAB8] + 40);
    }
    v53[0] = v25;
    v53[1] = v28;
    v53[2] = v31;
    v53[3] = v35;
    v53[4] = v39;
    v53[5] = v42;
    v44 = v52;
    self = [(CNMemojiMetadata *)v48 initWithAvatarRecord:v50 poseName:v49 pose:v20 backgroundColorDescription:v52 cropTransform:v53];

    v45 = self;
  }

  return v45;
}

- (void)encodeWithCoder:(id)a3
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeInt:2 forKey:@"version"];
  [v4 encodeObject:self->_backgroundColorDescription forKey:@"backgroundColorDescription"];
  if (self->_avatarRecord)
  {
    int v5 = [(objc_class *)getAVTAvatarRecordSerializerClass() dataFromAvatarRecord:self->_avatarRecord];
    [v4 encodeObject:v5 forKey:@"avatarRecordData"];
  }
  [v4 encodeObject:self->_poseName forKey:@"poseName"];
  long long v6 = [(AVTAvatarPhysicalizedPose *)self->_pose pose];
  uint64_t v7 = [v6 dictionaryRepresentation];
  [v4 encodeObject:v7 forKey:@"poseRepresentation"];

  uint64_t v8 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:self->_pose];
  [v4 encodeObject:v8 forKey:@"posePhysicsStatesRepresentation"];

  uint64_t v9 = [NSNumber numberWithDouble:self->_cropTransform.a];
  v16[0] = v9;
  uint64_t v10 = [NSNumber numberWithDouble:self->_cropTransform.b];
  v16[1] = v10;
  id v11 = [NSNumber numberWithDouble:self->_cropTransform.c];
  v16[2] = v11;
  id v12 = [NSNumber numberWithDouble:self->_cropTransform.d];
  _OWORD v16[3] = v12;
  long long v13 = [NSNumber numberWithDouble:self->_cropTransform.tx];
  v16[4] = v13;
  uint64_t v14 = [NSNumber numberWithDouble:self->_cropTransform.ty];
  v16[5] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];

  [v4 encodeObject:v15 forKey:@"cropTransformValues"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNMemojiMetadata alloc];
  int v5 = [(CNMemojiMetadata *)self avatarRecord];
  long long v6 = [(CNMemojiMetadata *)self poseName];
  uint64_t v7 = [(CNMemojiMetadata *)self pose];
  uint64_t v8 = [(CNMemojiMetadata *)self backgroundColorDescription];
  [(CNMemojiMetadata *)self cropTransform];
  uint64_t v9 = [(CNMemojiMetadata *)v4 initWithAvatarRecord:v5 poseName:v6 pose:v7 backgroundColorDescription:v8 cropTransform:&v11];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNMemojiMetadata *)a3;
  if (self == v4)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t v5 = (unint64_t)[(CNMemojiMetadata *)self backgroundColorDescription];
    unint64_t v6 = (unint64_t)[(CNMemojiMetadata *)v4 backgroundColorDescription];
    if (v5 | v6)
    {
      if (![(id)v5 isEqual:v6]) {
        goto LABEL_11;
      }
    }
    unint64_t v7 = (unint64_t)[(CNMemojiMetadata *)self avatarRecord];
    unint64_t v8 = (unint64_t)[(CNMemojiMetadata *)v4 avatarRecord];
    if (v7 | v8)
    {
      if (![(id)v7 isEqual:v8]) {
        goto LABEL_11;
      }
    }
    unint64_t v9 = (unint64_t)[(CNMemojiMetadata *)self poseName];
    unint64_t v10 = (unint64_t)[(CNMemojiMetadata *)v4 poseName];
    if (v9 | v10)
    {
      if (![(id)v9 isEqual:v10]) {
        goto LABEL_11;
      }
    }
    uint64_t v11 = [(CNMemojiMetadata *)self pose];
    id v12 = [v11 pose];
    long long v13 = [v12 dictionaryRepresentation];
    uint64_t v14 = [(CNMemojiMetadata *)v4 pose];
    uint64_t v15 = [v14 pose];
    uint64_t v16 = [v15 dictionaryRepresentation];
    int v17 = [v13 isEqualToDictionary:v16];

    if (v17)
    {
      v18 = [(CNMemojiMetadata *)self pose];
      uint64_t v19 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:v18];
      v20 = [(CNMemojiMetadata *)v4 pose];
      uint64_t v21 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:v20];
      char v22 = [v19 isEqualToDictionary:v21];
    }
    else
    {
LABEL_11:
      char v22 = 0;
    }
  }

  return v22;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (NSString)poseName
{
  return self->_poseName;
}

- (AVTAvatarPhysicalizedPose)pose
{
  return self->_pose;
}

- (NSString)backgroundColorDescription
{
  return self->_backgroundColorDescription;
}

- (CNMemojiBackgroundParameters)backgroundParameters
{
  return self->_backgroundParameters;
}

- (CGAffineTransform)cropTransform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundParameters, 0);
  objc_storeStrong((id *)&self->_backgroundColorDescription, 0);
  objc_storeStrong((id *)&self->_pose, 0);
  objc_storeStrong((id *)&self->_poseName, 0);

  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Memoji metadata has a higher version number than we know how to handle: %ld", (uint8_t *)&v2, 0xCu);
}

@end