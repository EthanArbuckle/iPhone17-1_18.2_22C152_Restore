@interface CNSerializedPoseConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (AVTAvatarPhysicalizedPose)pose;
- (BOOL)isEqual:(id)a3;
- (CNSerializedPoseConfiguration)initWithCoder:(id)a3;
- (CNSerializedPoseConfiguration)initWithPoseConfiguration:(id)a3;
- (CNSerializedPoseConfiguration)initWithPoseName:(id)a3 pose:(id)a4;
- (NSString)poseName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNSerializedPoseConfiguration

+ (id)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_15);
  }
  v2 = (void *)log_cn_once_object_1;

  return v2;
}

uint64_t __36__CNSerializedPoseConfiguration_log__block_invoke()
{
  log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.ui", "CNSerializedPoseConfiguration");

  return MEMORY[0x1F41817F8]();
}

- (CNSerializedPoseConfiguration)initWithPoseName:(id)a3 pose:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSerializedPoseConfiguration;
  v8 = [(CNSerializedPoseConfiguration *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    poseName = v8->_poseName;
    v8->_poseName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_pose, a4);
    v11 = v8;
  }

  return v8;
}

- (CNSerializedPoseConfiguration)initWithPoseConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  id v6 = [v4 physicalizedPose];

  id v7 = [(CNSerializedPoseConfiguration *)self initWithPoseName:v5 pose:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNSerializedPoseConfiguration *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    poseName = self->_poseName;
    if ((unint64_t)poseName | (unint64_t)v4->_poseName)
    {
      if (!-[NSString isEqual:](poseName, "isEqual:")) {
        goto LABEL_7;
      }
    }
    id v6 = [(AVTAvatarPhysicalizedPose *)self->_pose pose];
    id v7 = [v6 dictionaryRepresentation];
    v8 = [(AVTAvatarPhysicalizedPose *)v4->_pose pose];
    uint64_t v9 = [v8 dictionaryRepresentation];
    int v10 = [v7 isEqualToDictionary:v9];

    if (v10)
    {
      v11 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:self->_pose];
      v12 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:v4->_pose];
      char v13 = [v11 isEqualToDictionary:v12];
    }
    else
    {
LABEL_7:
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_poseName];
  id v4 = (void *)MEMORY[0x1E4F5A418];
  v5 = [(AVTAvatarPhysicalizedPose *)self->_pose pose];
  id v6 = [v5 dictionaryRepresentation];
  uint64_t v7 = [v4 dictionaryHash:v6] - v3 + 32 * v3;

  v8 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v9 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:self->_pose];
  unint64_t v10 = [v8 dictionaryHash:v9] - v7 + 32 * v7 + 506447;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNSerializedPoseConfiguration alloc];
  v5 = [(CNSerializedPoseConfiguration *)self poseName];
  id v6 = [(CNSerializedPoseConfiguration *)self pose];
  uint64_t v7 = [(CNSerializedPoseConfiguration *)v4 initWithPoseName:v5 pose:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSerializedPoseConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"poseName"];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  unint64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"poseRepresentation"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v16 forKey:@"posePhysicsStatesRepresentation"];

  v18 = (void *)[objc_alloc(getAVTAvatarPhysicalizedPoseClass()) initWithPoseRepresentation:v10 physicsStatesRepresentation:v17];
  v19 = [(CNSerializedPoseConfiguration *)self initWithPoseName:v21 pose:v18];

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  poseName = self->_poseName;
  id v5 = a3;
  [v5 encodeObject:poseName forKey:@"poseName"];
  uint64_t v6 = [(AVTAvatarPhysicalizedPose *)self->_pose pose];
  uint64_t v7 = [v6 dictionaryRepresentation];
  [v5 encodeObject:v7 forKey:@"poseRepresentation"];

  id v8 = +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:self->_pose];
  [v5 encodeObject:v8 forKey:@"posePhysicsStatesRepresentation"];
}

- (NSString)poseName
{
  return self->_poseName;
}

- (AVTAvatarPhysicalizedPose)pose
{
  return self->_pose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pose, 0);

  objc_storeStrong((id *)&self->_poseName, 0);
}

@end