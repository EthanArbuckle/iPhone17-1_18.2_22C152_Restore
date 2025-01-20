@interface NSArray(SFExtras)
- (id)sf_asCardSections:()SFExtras;
@end

@implementation NSArray(SFExtras)

- (id)sf_asCardSections:()SFExtras
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NSArray_SFExtras__sf_asCardSections___block_invoke;
  v8[3] = &unk_1E59001E0;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "parsec_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

@end