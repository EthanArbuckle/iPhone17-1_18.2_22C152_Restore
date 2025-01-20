@interface HKCDADocumentSampleComparisonFilter
@end

@implementation HKCDADocumentSampleComparisonFilter

BOOL __71___HKCDADocumentSampleComparisonFilter_areValidTypes_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = [v4 code];
  if (v5 != 107) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"unexpected data type '%@' for CDA document filter", v4);
  }

  return v5 == 107;
}

@end