@interface JFX
@end

@implementation JFX

void __JFX_CaptureSessionInterruptionReasonsList_block_invoke()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"VideoDeviceNotAvailableInBackground";
  v2[1] = @"AudioDeviceInUseByAnotherClient";
  v2[2] = @"VideoDeviceInUseByAnotherClient";
  v2[3] = @"VideoDeviceNotAvailableWithMultipleForegroundApps";
  v2[4] = @"VideoDeviceNotAvailableDueToSystemPressure";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  v1 = (void *)JFX_CaptureSessionInterruptionReasonsList_interruptionReasonsArray;
  JFX_CaptureSessionInterruptionReasonsList_interruptionReasonsArray = v0;
}

uint64_t __JFX_LogCategory_block_invoke(uint64_t a1)
{
  **(void **)(a1 + 32) = os_log_create("com.apple.CameraEffectsKit", *(const char **)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

void __JFX_isDrawInstructionGraphNodesEnabled_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"JFX_DEBUG_DrawInstructionGraphNodes"];

  v1 = v2;
  if (v2)
  {
    JFX_isDrawInstructionGraphNodesEnabled_enabled = [v2 BOOLValue];
    v1 = v2;
  }
}

void __JFX_isShowHDRBadgeInPreviewEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  JFX_isShowHDRBadgeInPreviewEnabled_showHDRBadgeInPreview = [v0 BOOLForKey:@"JFX_ShowHDRBadgeInPreview"];
}

void __JFX_isDrawOverlayBoundsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"JFX_DEBUG_DrawOverlayBounds"];

  v1 = v2;
  if (v2)
  {
    JFX_isDrawOverlayBoundsEnabled_drawOverlayBounds = [v2 BOOLValue];
    v1 = v2;
  }
}

void __JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowDocumentBoundingBox"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowObjectAlignedBoundingBox"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTextBoundingBoxes"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaBoundingBox"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowFaceRect"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTapPoints"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowCornerPoints"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTextCornerPoints"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaPoints"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_n = v0;
}

void __JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"JFX_DEBUG_DrawOverlayBoundsOptionShowAdditionalRects"];
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_n = v0;
}

void __JFX_getFrontAndBackCameras_block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  v1 = (void *)JFX_getFrontAndBackCameras_s_group;
  JFX_getFrontAndBackCameras_s_group = (uint64_t)v0;

  id v2 = JFX_getFrontAndBackCameras_s_group;
  v3 = dispatch_get_global_queue(21, 0);
  dispatch_group_async(v2, v3, &__block_literal_global_664);
}

void __JFX_getFrontAndBackCameras_block_invoke_2()
{
  v6[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EF9648];
  v6[0] = *MEMORY[0x263EF9658];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x263EF9620];
  v6[2] = *MEMORY[0x263EF9628];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x263EF9660];
  v6[4] = *MEMORY[0x263EF9670];
  v6[5] = v2;
  v6[6] = *MEMORY[0x263EF9638];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [MEMORY[0x263EFA5A8] discoverySessionWithDeviceTypes:v3 mediaType:*MEMORY[0x263EF9D48] position:0];
  v5 = [v4 devices];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_668];
}

void __JFX_getFrontAndBackCameras_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id v12 = a2;
  uint64_t v6 = [v12 position];
  v7 = &JFX_getFrontAndBackCameras_s_frontCamera;
  if (JFX_getFrontAndBackCameras_s_frontCamera) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == 2;
  }
  if (v8
    || ((v7 = &JFX_getFrontAndBackCameras_s_backCamera, !JFX_getFrontAndBackCameras_s_backCamera)
      ? (BOOL v9 = v6 == 1)
      : (BOOL v9 = 0),
        v9))
  {
    objc_storeStrong((id *)v7, a2);
    objc_msgSend((id)*v7, "jfx_highestQualityColorSpace");
  }
  if (JFX_getFrontAndBackCameras_s_frontCamera) {
    BOOL v10 = JFX_getFrontAndBackCameras_s_backCamera == 0;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = !v10;
  *a4 = v11;
}

void __JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_block_invoke()
{
  id v0 = +[JFXVideoCameraController sharedInstance];
  JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_s_isStreamingMode = [v0 cameraMode] == 0;
}

uint64_t __JFX_LogCategory_block_invoke_0(uint64_t a1)
{
  **(void **)(a1 + 32) = os_log_create("com.apple.CameraEffectsKit", *(const char **)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

void __JFX_descriptionForEffectAssetContentType_block_invoke()
{
  id v0 = (void *)JFX_descriptionForEffectAssetContentType_values;
  JFX_descriptionForEffectAssetContentType_values = (uint64_t)&unk_26E802010;
}

void __JFX_descriptionForEffectAssetAspectRatio_block_invoke()
{
  id v0 = (void *)JFX_descriptionForEffectAssetAspectRatio_values;
  JFX_descriptionForEffectAssetAspectRatio_values = (uint64_t)&unk_26E802028;
}

void __JFX_descriptionForEffectAssetUsageMode_block_invoke()
{
  id v0 = (void *)JFX_descriptionForEffectAssetUsageMode_values;
  JFX_descriptionForEffectAssetUsageMode_values = (uint64_t)&unk_26E802040;
}

@end