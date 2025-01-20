@interface FigCaptionRendererCALayerOutputNode
@end

@implementation FigCaptionRendererCALayerOutputNode

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_AddChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) addSublayer:*(void *)(v3 + 8)];
  [MEMORY[0x1E4F39CF8] commit];
  v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(const void **)(a1 + 32);
  if (v5)
  {
    CFRelease(v5);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_RemoveChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) removeFromSuperlayer];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_RemoveAllChildNodes_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setSublayers:0];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetPosition_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(DerivedStorage + 8), "setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetSize_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(DerivedStorage + 8), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetClipToBounds_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setMasksToBounds:*(unsigned char *)(a1 + 40) != 0];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetContent_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setContents:*(void *)(a1 + 40)];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_BeginScene_block_invoke()
{
  return [MEMORY[0x1E4F39CF8] begin];
}

uint64_t __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_EndScene_block_invoke()
{
  return [MEMORY[0x1E4F39CF8] commit];
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetCornerRadius_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setCornerRadius:*(double *)(a1 + 40)];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetWindowOpacity_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setWindowOpacity:*(double *)(a1 + 40)];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetOptions_block_invoke(void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setNodeOptions:a1[5] forKeyPath:a1[6]];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = (const void *)a1[4];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[6];
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)a1[5];
  if (v5)
  {
    CFRelease(v5);
  }
}

void __FigCaptionRendererCALayerOutputNode_FigCaptionRendererOutputNodeProtocol_SetSeparated_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setNodeSeparated:*(unsigned char *)(a1 + 40) != 0];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

@end