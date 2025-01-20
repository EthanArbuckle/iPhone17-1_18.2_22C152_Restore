@interface AVCPreviewCALayerHost
- (AVCPreviewCALayerHost)initWithPreview:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
@end

@implementation AVCPreviewCALayerHost

- (AVCPreviewCALayerHost)initWithPreview:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AVCPreviewCALayerHost;
  v4 = [(CALayerHost *)&v6 init];
  if (v4) {
    v4->_preview = (VCWeakObjectHolder *)(id)[MEMORY[0x1E4F47A30] weakObjectHolderWithObject:a3];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCPreviewCALayerHost;
  [(CALayerHost *)&v3 dealloc];
}

- (void)layoutSublayers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVConferencePreview [%s] %s:%d strong reference to AVConferencePreview is nil", v2, v3, v4, v5, v6);
}

@end