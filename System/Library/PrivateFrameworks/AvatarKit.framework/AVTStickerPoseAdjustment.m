@interface AVTStickerPoseAdjustment
- (AVTAvatarPose)pose;
- (NSString)presetIdentifier;
- (id)description;
- (id)poseByApplyingToPose:(id)a3 forAvatar:(id)a4;
- (int64_t)presetCategory;
- (void)setPose:(id)a3;
- (void)setPresetCategory:(int64_t)a3;
- (void)setPresetIdentifier:(id)a3;
@end

@implementation AVTStickerPoseAdjustment

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = AVTPresetCategoryToString(self->_presetCategory);
  v7 = [v3 stringWithFormat:@"<%@: %p | %@ %@ → %@>", v5, self, v6, self->_presetIdentifier, self->_pose];

  return v7;
}

- (id)poseByApplyingToPose:(id)a3 forAvatar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 presetForCategory:self->_presetCategory];
    v9 = [v8 identifier];
    int v10 = [v9 isEqualToString:self->_presetIdentifier];

    if (v10)
    {
      id v11 = [v6 poseByMergingPose:self->_pose];

      goto LABEL_6;
    }
  }
  id v11 = v6;
LABEL_6:

  return v11;
}

- (int64_t)presetCategory
{
  return self->_presetCategory;
}

- (void)setPresetCategory:(int64_t)a3
{
  self->_presetCategory = a3;
}

- (NSString)presetIdentifier
{
  return self->_presetIdentifier;
}

- (void)setPresetIdentifier:(id)a3
{
}

- (AVTAvatarPose)pose
{
  return self->_pose;
}

- (void)setPose:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pose, 0);
  objc_storeStrong((id *)&self->_presetIdentifier, 0);
}

@end