@interface CNMemojiMetadataUtilities
+ (id)avatarRecordForIdentifier:(id)a3;
+ (id)dataForMemojiMetadata:(id)a3;
+ (id)dataForMemojiMetadata:(id)a3 backgroundColorDescription:(id)a4 cropTransform:(CGAffineTransform *)a5;
+ (id)dataForPoseConfiguration:(id)a3;
+ (id)memojiMetadataDataForAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5;
+ (id)memojiMetadataDataForAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6;
+ (id)memojiMetadataDataForAvatarRecordIdentifier:(id)a3 poseConfigurationData:(id)a4 backgroundColorDescription:(id)a5;
+ (id)memojiMetadataDataForAvatarRecordIdentifier:(id)a3 poseConfigurationData:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6;
+ (id)memojiMetadataFromData:(id)a3;
+ (id)os_log;
+ (id)physicsStatesDictionaryRepresentationForPose:(id)a3;
+ (id)poseConfigurationForData:(id)a3 withAvatarRecord:(id)a4;
+ (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4 pose:(id)a5;
+ (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4 stickerPack:(id)a5;
@end

@implementation CNMemojiMetadataUtilities

+ (id)os_log
{
  if (os_log_cn_once_token_2_2 != -1) {
    dispatch_once(&os_log_cn_once_token_2_2, &__block_literal_global_83);
  }
  v2 = (void *)os_log_cn_once_object_2_2;

  return v2;
}

uint64_t __35__CNMemojiMetadataUtilities_os_log__block_invoke()
{
  os_log_cn_once_object_2_2 = (uint64_t)os_log_create("com.apple.contacts", "CNMemojiMetadataUtilities");

  return MEMORY[0x1F41817F8]();
}

+ (id)memojiMetadataDataForAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v6 = [a1 memojiMetadataDataForAvatarRecord:a3 poseConfiguration:a4 backgroundColorDescription:a5 cropTransform:v8];

  return v6;
}

+ (id)memojiMetadataDataForAvatarRecordIdentifier:(id)a3 poseConfigurationData:(id)a4 backgroundColorDescription:(id)a5
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v6 = [a1 memojiMetadataDataForAvatarRecordIdentifier:a3 poseConfigurationData:a4 backgroundColorDescription:a5 cropTransform:v8];

  return v6;
}

+ (id)dataForMemojiMetadata:(id)a3
{
  id v7 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    long long v5 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities dataForMemojiMetadata:]();
    }
  }

  return v3;
}

+ (id)dataForMemojiMetadata:(id)a3 backgroundColorDescription:(id)a4 cropTransform:(CGAffineTransform *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [CNMemojiMetadata alloc];
  v10 = [v8 avatarRecord];
  v11 = [v8 poseName];
  v12 = [v8 pose];

  long long v13 = *(_OWORD *)&a5->c;
  v17[0] = *(_OWORD *)&a5->a;
  v17[1] = v13;
  v17[2] = *(_OWORD *)&a5->tx;
  v14 = [(CNMemojiMetadata *)v9 initWithAvatarRecord:v10 poseName:v11 pose:v12 backgroundColorDescription:v7 cropTransform:v17];

  v15 = [(id)objc_opt_class() dataForMemojiMetadata:v14];

  return v15;
}

+ (id)memojiMetadataDataForAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    long long v13 = [CNMemojiMetadata alloc];
    long long v14 = *(_OWORD *)&a6->c;
    *(_OWORD *)v18 = *(_OWORD *)&a6->a;
    *(_OWORD *)&v18[16] = v14;
    long long v19 = *(_OWORD *)&a6->tx;
    v15 = [(CNMemojiMetadata *)v13 initWithAvatarRecord:v9 poseConfiguration:v10 backgroundColorDescription:v12 cropTransform:v18];
    v16 = [(id)objc_opt_class() dataForMemojiMetadata:v15];
  }
  else
  {
    v15 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 138412802;
      *(void *)&v18[4] = v9;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v10;
      *(_WORD *)&v18[22] = 2112;
      *(void *)&v18[24] = v12;
      _os_log_error_impl(&dword_1909E3000, v15, OS_LOG_TYPE_ERROR, "Error creating Memoji metadata for avatarRecord: %@, poseConfiguration: %@, backgroundColorDescription: %@ : received nil argument", v18, 0x20u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)memojiMetadataDataForAvatarRecordIdentifier:(id)a3 poseConfigurationData:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[CNMemojiMetadataUtilities avatarRecordForIdentifier:v9];
  if (v12)
  {
    long long v13 = +[CNMemojiMetadataUtilities poseConfigurationForData:v10 withAvatarRecord:v12];
    if (v13)
    {
      long long v14 = [CNMemojiMetadata alloc];
      long long v15 = *(_OWORD *)&a6->c;
      v19[0] = *(_OWORD *)&a6->a;
      v19[1] = v15;
      v19[2] = *(_OWORD *)&a6->tx;
      v16 = [(CNMemojiMetadata *)v14 initWithAvatarRecord:v12 poseConfiguration:v13 backgroundColorDescription:v11 cropTransform:v19];
      v17 = [(id)objc_opt_class() dataForMemojiMetadata:v16];
    }
    else
    {
      v16 = +[CNMemojiMetadataUtilities os_log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[CNMemojiMetadataUtilities memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:]();
      }
      v17 = 0;
    }
  }
  else
  {
    long long v13 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:]();
    }
    v17 = 0;
  }

  return v17;
}

+ (id)memojiMetadataFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    long long v5 = v8;
    if (!v4)
    {
      v6 = +[CNMemojiMetadataUtilities os_log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[CNMemojiMetadataUtilities memojiMetadataFromData:]();
      }
    }
  }
  else
  {
    long long v5 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities memojiMetadataFromData:]();
    }
    id v4 = 0;
  }

  return v4;
}

+ (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4 pose:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    if ([v9 isEqualToString:@"custom_capture"])
    {
      v12 = (void *)[objc_alloc(getAVTStickerConfigurationClass()) initWithName:v9 pose:v11 props:0 shaders:0 camera:0 options:0];
      goto LABEL_18;
    }
    long long v14 = getkAVTStickerPackPoses();
    v12 = [a1 stickerConfigurationForAvatarRecord:v8 stickerName:v9 stickerPack:v14];

    if (!v12)
    {
      if (softLinkAVTUIShowPrereleaseStickerPack_once())
      {
        long long v15 = getkAVTStickerPackPosesPrerelease();
        v12 = [a1 stickerConfigurationForAvatarRecord:v8 stickerName:v9 stickerPack:v15];

        if (v12) {
          goto LABEL_18;
        }
        v16 = +[CNMemojiMetadataUtilities os_log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:stickerName:pose:]();
        }
      }
      else
      {
        v16 = +[CNMemojiMetadataUtilities os_log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:stickerName:pose:]();
        }
        v12 = 0;
      }
    }
  }
  else
  {
    long long v13 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_1909E3000, v13, OS_LOG_TYPE_ERROR, "Error creating pose configuration for avatarRecord: %@, poseName: %@, pose: %@ : received nil argument", (uint8_t *)&v18, 0x20u);
    }

    v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4 stickerPack:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  int v10 = [v7 isEditable];
  Class AVTStickerConfigurationClass = getAVTStickerConfigurationClass();
  Class v12 = AVTStickerConfigurationClass;
  if (v10)
  {
    long long v13 = [(objc_class *)AVTStickerConfigurationClass stickerConfigurationForMemojiInStickerPack:v8 stickerName:v9];
  }
  else
  {
    uint64_t v14 = [v7 identifier];
    long long v13 = [(objc_class *)v12 stickerConfigurationForAnimojiNamed:v14 inStickerPack:v8 stickerName:v9];

    id v8 = v9;
    id v9 = (id)v14;
  }

  return v13;
}

+ (id)dataForPoseConfiguration:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [[CNSerializedPoseConfiguration alloc] initWithPoseConfiguration:v3];
    id v9 = 0;
    long long v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
    id v6 = v9;
    if (!v5)
    {
      id v7 = +[CNMemojiMetadataUtilities os_log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CNMemojiMetadataUtilities dataForPoseConfiguration:]();
      }
    }
  }
  else
  {
    id v4 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities dataForPoseConfiguration:]();
    }
    long long v5 = 0;
  }

  return v5;
}

+ (id)poseConfigurationForData:(id)a3 withAvatarRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v14 = 0;
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v14];
    id v9 = v14;
    if (v8)
    {
      int v10 = [v8 poseName];
      id v11 = [v8 pose];
      Class v12 = +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:v7 stickerName:v10 pose:v11];
    }
    else
    {
      int v10 = +[CNMemojiMetadataUtilities os_log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CNMemojiMetadataUtilities poseConfigurationForData:withAvatarRecord:]();
      }
      Class v12 = 0;
    }
  }
  else
  {
    id v9 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities poseConfigurationForData:withAvatarRecord:]();
    }
    Class v12 = 0;
  }

  return v12;
}

+ (id)avatarRecordForIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(getAVTPAvatarStoreClass());
    id v5 = [(objc_class *)getAVTAvatarFetchRequestClass() requestForAvatarWithIdentifier:v3];
    id v11 = 0;
    id v6 = [v4 avatarsForFetchRequest:v5 error:&v11];
    id v7 = v11;
    if (v6)
    {
      id v8 = [v6 firstObject];
    }
    else
    {
      id v9 = +[CNMemojiMetadataUtilities os_log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CNMemojiMetadataUtilities avatarRecordForIdentifier:]();
      }

      id v8 = 0;
    }
  }
  else
  {
    id v4 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities avatarRecordForIdentifier:]();
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)physicsStatesDictionaryRepresentationForPose:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    id v5 = [v3 physicsStates];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v5 objectForKeyedSubscript:v10];
          Class v12 = [v11 dictionaryRepresentation];
          [v4 setValue:v12 forKey:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = +[CNMemojiMetadataUtilities os_log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:]();
    }
  }

  return v4;
}

+ (void)dataForMemojiMetadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error archiving Memoji metadata: %@", v2, v3, v4, v5, v6);
}

+ (void)memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error creating Memoji metadata: could not find avatar record for identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error creating Memoji metadata: pose configuration is nil", v2, v3, v4, v5, v6);
}

+ (void)memojiMetadataFromData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error creating Memoji metadata from data: data is nil", v2, v3, v4, v5, v6);
}

+ (void)memojiMetadataFromData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error unarchiving Memoji metadata: %@", v2, v3, v4, v5, v6);
}

+ (void)stickerConfigurationForAvatarRecord:stickerName:pose:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Error finding sticker configuration for poseName: %@, avatarRecord: %@ in pack kAVTStickerPackPoses");
}

+ (void)dataForPoseConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error creating data from pose configuration: pose configuration is nil", v2, v3, v4, v5, v6);
}

+ (void)dataForPoseConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error archiving pose configuration: %@", v2, v3, v4, v5, v6);
}

+ (void)poseConfigurationForData:withAvatarRecord:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error unarchiving pose configuration: %@", v2, v3, v4, v5, v6);
}

+ (void)poseConfigurationForData:withAvatarRecord:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Error retrieving pose configuration from data: %@, avatarRecord: %@ : received nil argument");
}

+ (void)avatarRecordForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Avatar record could not be fetched: record identifier is nil", v2, v3, v4, v5, v6);
}

+ (void)avatarRecordForIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Avatar record could not be fetched: %@", v2, v3, v4, v5, v6);
}

+ (void)physicsStatesDictionaryRepresentationForPose:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error retrieving physics states dictionary from pose: pose is nil", v2, v3, v4, v5, v6);
}

@end