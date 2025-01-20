@interface AVTAvatarPhysicalizedPose
- (AVTAvatarPhysicalizedPose)initWithPose:(id)a3 physicsStates:(id)a4;
- (AVTAvatarPhysicalizedPose)initWithPoseRepresentation:(id)a3 physicsStatesRepresentation:(id)a4;
- (AVTAvatarPhysicalizedPose)initWithSceneAtURL:(id)a3;
- (AVTAvatarPose)pose;
- (NSDictionary)physicsStates;
- (void)applyToAvatar:(id)a3;
- (void)applyWithTransitionToAvatar:(id)a3 duration:(double)a4 completionHandler:(id)a5;
@end

@implementation AVTAvatarPhysicalizedPose

- (AVTAvatarPhysicalizedPose)initWithSceneAtURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTAvatarPhysicalizedPose;
  v5 = [(AVTAvatarPhysicalizedPose *)&v13 init];
  if (v5)
  {
    id v12 = 0;
    v6 = objc_msgSend(MEMORY[0x263F16AD8], "avt_newSceneWithURL:options:error:", v4, 0, &v12);
    id v7 = v12;
    objc_msgSend(v6, "avt_fixQuirksOfNewUSDSchemaWithOptions:handler:", 0, 0);
    if (v7)
    {
      v8 = avt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatarPoseAnimation initWithSceneAtURL:usdaMetadata:](v4, v7, v8);
      }
    }
    v9 = [[AVTAvatarPose alloc] initWithScene:v6];
    pose = v5->_pose;
    v5->_pose = v9;
  }
  return v5;
}

- (AVTAvatarPhysicalizedPose)initWithPose:(id)a3 physicsStates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarPhysicalizedPose;
  v9 = [(AVTAvatarPhysicalizedPose *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pose, a3);
    objc_storeStrong((id *)&v10->_physicsStates, a4);
  }

  return v10;
}

- (AVTAvatarPhysicalizedPose)initWithPoseRepresentation:(id)a3 physicsStatesRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarPhysicalizedPose;
  id v8 = [(AVTAvatarPhysicalizedPose *)&v18 init];
  if (v8)
  {
    if (v6)
    {
      v9 = [[AVTAvatarPose alloc] initWithDictionaryRepresentation:v6];
      pose = v8->_pose;
      v8->_pose = v9;
    }
    if (v7)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __84__AVTAvatarPhysicalizedPose_initWithPoseRepresentation_physicsStatesRepresentation___block_invoke;
      v16[3] = &unk_26401FF28;
      objc_super v12 = v11;
      v17 = v12;
      [v7 enumerateKeysAndObjectsUsingBlock:v16];
      physicsStates = v8->_physicsStates;
      v8->_physicsStates = v12;
      v14 = v12;
    }
  }

  return v8;
}

void __84__AVTAvatarPhysicalizedPose_initWithPoseRepresentation_physicsStatesRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[AVTAvatarPhysicsState alloc] initWithDictionaryRepresentation:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (void)applyToAvatar:(id)a3
{
}

- (void)applyWithTransitionToAvatar:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  v14 = (void (**)(void))a5;
  pose = self->_pose;
  id v9 = a3;
  v10 = v9;
  if (a4 <= 0.0)
  {
    [v9 setPose:pose];
    physicsStates = self->_physicsStates;
    objc_super v12 = [v10 stickerPhysicsStateIdentifier];
    uint64_t v13 = [(NSDictionary *)physicsStates objectForKeyedSubscript:v12];

    [v10 resetToPhysicsState:v13 assumeRestStateIfNil:1];
    if (v14) {
      v14[2]();
    }
    v10 = (void *)v13;
  }
  else
  {
    [v9 transitionFromPose:0 toPose:pose duration:v14 delay:a4 completionHandler:0.0];
  }
}

- (AVTAvatarPose)pose
{
  return self->_pose;
}

- (NSDictionary)physicsStates
{
  return self->_physicsStates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicsStates, 0);

  objc_storeStrong((id *)&self->_pose, 0);
}

@end