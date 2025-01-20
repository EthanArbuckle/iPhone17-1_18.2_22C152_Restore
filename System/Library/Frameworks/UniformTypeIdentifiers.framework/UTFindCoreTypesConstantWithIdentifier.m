@interface UTFindCoreTypesConstantWithIdentifier
@end

@implementation UTFindCoreTypesConstantWithIdentifier

void ____UTFindCoreTypesConstantWithIdentifier_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  _UTGetAllCoreTypesConstants();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "initWithArray:");
  v2 = (void *)qword_1EB20A678;
  qword_1EB20A678 = v1;

  v3 = (void *)qword_1EB20A678;
  if (!qword_1EB20A678)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef __UTFindCoreTypesConstantWithIdentifier(NSString *const __strong _Nonnull, NSInteger)_block_invoke");
    [v7 handleFailureInFunction:v4 file:@"UTCoreTypes.mm" lineNumber:267 description:@"Failed to construct O(1) lookup table for constant UTType instances."];

    v3 = (void *)qword_1EB20A678;
  }
  if ([v3 count] != 172)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef __UTFindCoreTypesConstantWithIdentifier(NSString *const __strong _Nonnull, NSInteger)_block_invoke");
    [v8 handleFailureInFunction:v5 file:@"UTCoreTypes.mm" lineNumber:268 description:@"Lookup table is the wrong size."];
  }
}

@end