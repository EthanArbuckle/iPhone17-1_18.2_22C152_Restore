@interface JFXAnimojiEffect
+ (BOOL)isAvatarKitAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)animojiIDs;
+ (id)createAnimojiEffectForID:(id)a3;
+ (id)createMemojiEffectWithContentsOfFile:(id)a3 identifier:(id)a4;
- (BOOL)loadRenderEffect;
- (CGAffineTransform)_affineTransformFromEffectRect:(SEL)a3 toSize:(CGRect)a4 basisOrigin:(CGSize)a5;
- (CGAffineTransform)transform:(SEL)a3 basisOrigin:(CGRect)a4;
- (JFXAnimojiEffect)initWithCoder:(id)a3;
- (PVCGPointQuad)_convertRenderEffectPoints:(SEL)a3 toBasisRect:(PVCGPointQuad *)a4 basisOrigin:(CGRect)a5;
- (UIImage)thumbnail;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)renderEffect;
- (int)type;
- (int64_t)captureInterfaceOrientation;
- (unint64_t)avatarVersionNumber;
- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 fromBasisRect:(CGRect)a5 basisOrigin:(int)a6;
- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 toBasisRect:(CGRect)a5 basisOrigin:(int)a6;
- (void)encodeWithCoder:(id)a3;
- (void)loadRenderEffectInBackgroundWithCompletionOnMainQueue:(id)a3;
- (void)loadRenderEffectOnQueue:(id)a3 completion:(id)a4;
- (void)setCaptureInterfaceOrientation:(int64_t)a3;
@end

@implementation JFXAnimojiEffect

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXAnimojiEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JFXAnimojiEffect;
  v5 = [(JFXEffect *)&v8 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"kJFXCaptureInterfaceOrientationKey"]) {
      uint64_t v6 = [v4 decodeIntegerForKey:@"kJFXCaptureInterfaceOrientationKey"];
    }
    else {
      uint64_t v6 = 1;
    }
    [(JFXAnimojiEffect *)v5 setCaptureInterfaceOrientation:v6];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXAnimojiEffect;
  id v4 = a3;
  [(JFXEffect *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[JFXAnimojiEffect captureInterfaceOrientation](self, "captureInterfaceOrientation", v5.receiver, v5.super_class), @"kJFXCaptureInterfaceOrientationKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXAnimojiEffect;
  id v4 = [(JFXEffect *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setCaptureInterfaceOrientation:", -[JFXAnimojiEffect captureInterfaceOrientation](self, "captureInterfaceOrientation"));
  return v4;
}

+ (id)animojiIDs
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() isAvatarKitAvailable])
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v3 = objc_alloc_init(MEMORY[0x263F29790]);
    id v4 = [MEMORY[0x263F29778] requestForCustomAvatars];
    objc_super v5 = [v3 avatarsForFetchRequest:v4 error:0];
    objc_super v6 = [v5 reverseObjectEnumerator];
    v7 = [v6 allObjects];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) identifier];
          [v2 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    v14 = [MEMORY[0x263F29778] requestForPredefinedAvatars];
    v15 = [v3 avatarsForFetchRequest:v14 error:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v22 + 1) + 8 * j) identifier];
          [v2 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }
  }
  else
  {
    id v2 = &unk_26E801F20;
  }
  return v2;
}

+ (id)createAnimojiEffectForID:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F29790];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    objc_super v6 = [MEMORY[0x263F29778] requestForAvatarWithIdentifier:v4];

    id v21 = 0;
    v7 = [v5 avatarsForFetchRequest:v6 error:&v21];
    id v8 = v21;
    uint64_t v9 = [v7 firstObject];
    if (v9)
    {
      uint64_t v10 = AVTAvatarKitVersionNumber();
      uint64_t v11 = [MEMORY[0x263F29780] avatarForRecord:v9];
      uint64_t v12 = [v11 dataRepresentation];
      v13 = (void *)v12;
      id v20 = v8;
      if (v12)
      {
        v22[0] = @"JFXAnimojiEffectDataRepresentationKey";
        v22[1] = @"JFXAnimojiEffectAvatarVersionNumberKey";
        v23[0] = v12;
        v14 = [NSNumber numberWithUnsignedInteger:v10];
        v23[1] = v14;
        v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      }
      else
      {
        v15 = 0;
      }
      uint64_t v17 = +[JFXEffectFactory sharedInstance];
      uint64_t v18 = [v9 identifier];
      uint64_t v16 = [v17 createEffectForType:7 fromID:v18 withProperties:v15];

      id v8 = v20;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

+ (id)createMemojiEffectWithContentsOfFile:(id)a3 identifier:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_super v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a3];
  if (v6)
  {
    v12[0] = @"JFXAnimojiEffectDataRepresentationKey";
    v12[1] = @"JFXAnimojiEffectAvatarVersionNumberKey";
    v13[0] = v6;
    v7 = [NSNumber numberWithUnsignedInteger:AVTAvatarKitVersionNumber()];
    v13[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

    uint64_t v9 = +[JFXEffectFactory sharedInstance];
    uint64_t v10 = [v9 createEffectForType:7 fromID:v5 withProperties:v8];
  }
  else
  {
    id v8 = JFXLog_automation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[JFXAnimojiEffect createMemojiEffectWithContentsOfFile:identifier:](v8);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)isAvatarKitAvailable
{
  if (isAvatarKitAvailable_onceToken != -1) {
    dispatch_once(&isAvatarKitAvailable_onceToken, &__block_literal_global_32);
  }
  return isAvatarKitAvailable_s_IsAvatarKitAvailable;
}

Class __40__JFXAnimojiEffect_isAvatarKitAvailable__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Avtanimoji.isa);
  isAvatarKitAvailable_s_IsAvatarKitAvailable = result != 0;
  return result;
}

- (UIImage)thumbnail
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__JFXAnimojiEffect_thumbnail__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  if (thumbnail_onceToken != -1) {
    dispatch_once(&thumbnail_onceToken, block);
  }
  if (thumbnail_s_AvatarKitHasAnimojiThumbnails == 1)
  {
    id v3 = objc_opt_class();
    id v4 = [(JFXEffect *)self effectID];
    id v5 = [v3 thumbnailForAnimojiNamed:v4 options:0];
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x263F1C6B0];
    id v4 = [(JFXEffect *)self effectID];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v6 imageNamed:v4 inBundle:v7 compatibleWithTraitCollection:0];
  }
  return (UIImage *)v5;
}

uint64_t __29__JFXAnimojiEffect_thumbnail__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() isAvatarKitAvailable];
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      thumbnail_s_AvatarKitHasAnimojiThumbnails = 1;
    }
  }
  return result;
}

- (int)type
{
  return 7;
}

- (id)dataRepresentation
{
  id v2 = [(JFXEffect *)self effectParameters];
  id v3 = [v2 objectForKeyedSubscript:@"JFXAnimojiEffectDataRepresentationKey"];

  return v3;
}

- (unint64_t)avatarVersionNumber
{
  id v2 = [(JFXEffect *)self effectParameters];
  id v3 = [v2 objectForKeyedSubscript:@"JFXAnimojiEffectAvatarVersionNumberKey"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (id)renderEffect
{
  return 0;
}

- (BOOL)loadRenderEffect
{
  return 1;
}

- (void)loadRenderEffectInBackgroundWithCompletionOnMainQueue:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__JFXAnimojiEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke;
  block[3] = &unk_264C0A3F0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__JFXAnimojiEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadRenderEffectOnQueue:(id)a3 completion:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__JFXAnimojiEffect_loadRenderEffectOnQueue_completion___block_invoke;
  block[3] = &unk_264C0A3F0;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);
}

uint64_t __55__JFXAnimojiEffect_loadRenderEffectOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGAffineTransform)transform:(SEL)a3 basisOrigin:(CGRect)a4
{
  objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"not supported", 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (PVCGPointQuad)_convertRenderEffectPoints:(SEL)a3 toBasisRect:(PVCGPointQuad *)a4 basisOrigin:(CGRect)a5
{
  objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"not supported", 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 toBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"not supported", 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 fromBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"not supported", 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CGAffineTransform)_affineTransformFromEffectRect:(SEL)a3 toSize:(CGRect)a4 basisOrigin:(CGSize)a5
{
  objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"not supported", 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (int64_t)captureInterfaceOrientation
{
  return self->_captureInterfaceOrientation;
}

- (void)setCaptureInterfaceOrientation:(int64_t)a3
{
  self->_captureInterfaceOrientation = a3;
}

+ (void)createMemojiEffectWithContentsOfFile:(os_log_t)log identifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "Set Memoji Error: file not found", v1, 2u);
}

@end