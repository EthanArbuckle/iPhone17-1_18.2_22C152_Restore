@interface AVTAvatarPoseAnimationController
- (AVTAvatarPoseAnimationController)initWithAvatar:(id)a3 animationKeys:(id)a4;
- (void)removeAnimationWithBlendOutDuration:(double)a3;
@end

@implementation AVTAvatarPoseAnimationController

- (AVTAvatarPoseAnimationController)initWithAvatar:(id)a3 animationKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarPoseAnimationController;
  v8 = [(AVTAvatarPoseAnimationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_avatar, v6);
    objc_storeStrong((id *)&v9->_animationKeys, a4);
  }

  return v9;
}

- (void)removeAnimationWithBlendOutDuration:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  id v6 = [WeakRetained avatarNode];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_animationKeys;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "removeAnimationForKey:blendOutDuration:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), a3, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationKeys, 0);
  objc_destroyWeak((id *)&self->_avatar);
}

@end