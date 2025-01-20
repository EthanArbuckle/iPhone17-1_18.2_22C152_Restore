@interface CancelPhotoProcessing
@end

@implementation CancelPhotoProcessing

uint64_t __captureDeferredPhotoProcessor_CancelPhotoProcessing_block_invoke(void *a1)
{
  v2 = *(void **)(a1[5] + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __captureDeferredPhotoProcessor_CancelPhotoProcessing_block_invoke_2;
  v7[3] = &__block_descriptor_40_e56_B32__0__FigCaptureDeferredPhotoProcessorRequest_8Q16_B24l;
  v7[4] = a1[6];
  v3 = (void *)[v2 indexesOfObjectsPassingTest:v7];
  uint64_t v4 = [v3 count];
  uint64_t v5 = a1[5];
  if (v4) {
    return [*(id *)(v5 + 40) removeObjectsAtIndexes:v3];
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 48), "photoIdentifier"), "isEqualToString:", a1[6]);
  if (result) {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -16829;
  }
  return result;
}

BOOL __captureDeferredPhotoProcessor_CancelPhotoProcessing_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "photoIdentifier"), "isEqualToString:", *(void *)(a1 + 32))
      && ![a2 parent]
      || [a2 parent]
      && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "parent"), "photoIdentifier"), "isEqualToString:", *(void *)(a1 + 32)) & 1) != 0;
}

@end