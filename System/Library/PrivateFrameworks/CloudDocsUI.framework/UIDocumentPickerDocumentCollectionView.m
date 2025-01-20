@interface UIDocumentPickerDocumentCollectionView
@end

@implementation UIDocumentPickerDocumentCollectionView

id __52___UIDocumentPickerDocumentCollectionView_setFrame___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 contentSize];
  objc_msgSend(v2, "setAdjustedContentSize:withFrameSize:");
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)_UIDocumentPickerDocumentCollectionView;
  return objc_msgSendSuper2(&v4, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __53___UIDocumentPickerDocumentCollectionView_setBounds___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 contentSize];
  objc_msgSend(v2, "setAdjustedContentSize:withFrameSize:");
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)_UIDocumentPickerDocumentCollectionView;
  return objc_msgSendSuper2(&v4, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end