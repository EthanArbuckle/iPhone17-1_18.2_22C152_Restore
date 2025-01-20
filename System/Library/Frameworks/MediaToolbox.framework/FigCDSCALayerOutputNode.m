@interface FigCDSCALayerOutputNode
@end

@implementation FigCDSCALayerOutputNode

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_AddChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
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

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_RemoveChildNode_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) removeFromSuperlayer];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_RemoveAllChildNodes_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(DerivedStorage + 8) setSublayers:0];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_SetPosition_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(DerivedStorage + 8), "setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_SetSize_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(*(id *)(DerivedStorage + 8), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigCDSCALayerOutputNode_FigCDSOutputNodeProtocol_SetContent_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  [MEMORY[0x1E4F39CF8] begin];
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

@end