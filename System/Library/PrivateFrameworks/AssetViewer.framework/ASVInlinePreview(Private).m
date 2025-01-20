@interface ASVInlinePreview(Private)
- (void)setAnimationObserverBlock:()Private;
- (void)setCurrentTime:()Private;
- (void)setEnableShadows:()Private;
- (void)setIsLooping:()Private;
- (void)setIsMuted:()Private;
@end

@implementation ASVInlinePreview(Private)

- (void)setEnableShadows:()Private
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__ASVInlinePreview_Private__setEnableShadows___block_invoke;
  v3[3] = &__block_descriptor_33_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  BOOL v4 = a3;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v3];
}

- (void)setIsLooping:()Private
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__ASVInlinePreview_Private__setIsLooping___block_invoke;
  v3[3] = &__block_descriptor_33_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  BOOL v4 = a3;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v3];
}

- (void)setIsMuted:()Private
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__ASVInlinePreview_Private__setIsMuted___block_invoke;
  v3[3] = &__block_descriptor_33_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  BOOL v4 = a3;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v3];
}

- (void)setAnimationObserverBlock:()Private
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v5 = _asvLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4 == 0;
    _os_log_impl(&dword_1E2840000, v5, OS_LOG_TYPE_INFO, "#Inline: setAnimationObserverBlock: isnil? %d", (uint8_t *)&buf, 8u);
  }
  v6 = _Block_copy(v4);
  id animationObserverBlock = self->_animationObserverBlock;
  self->_id animationObserverBlock = v6;

  if (v4)
  {
    objc_initWeak(&buf, self);
    v8 = (void *)MEMORY[0x1E4F1CB00];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke;
    v11[3] = &unk_1E6DD7920;
    objc_copyWeak(&v12, &buf);
    v9 = [v8 scheduledTimerWithTimeInterval:1 repeats:v11 block:0.5];
    animationUpdateTimer = self->_animationUpdateTimer;
    self->_animationUpdateTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&buf);
  }
  else
  {
    [(NSTimer *)self->_animationUpdateTimer invalidate];
  }
}

- (void)setCurrentTime:()Private
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__ASVInlinePreview_Private__setCurrentTime___block_invoke;
  v3[3] = &__block_descriptor_40_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  *(double *)&void v3[4] = a3;
  [(ASVInlinePreview *)self getSharedInlineServiceFailable:v3];
}

@end