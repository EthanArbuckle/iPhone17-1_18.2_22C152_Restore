@interface NSArray(VCPPhotosPersistenceDelegateAdditions)
- (void)persistenceDelegate_enumerateInChunksOfSize:()VCPPhotosPersistenceDelegateAdditions withOverageAllowance:usingBlock:;
@end

@implementation NSArray(VCPPhotosPersistenceDelegateAdditions)

- (void)persistenceDelegate_enumerateInChunksOfSize:()VCPPhotosPersistenceDelegateAdditions withOverageAllowance:usingBlock:
{
  v8 = a5;
  unint64_t v9 = [a1 count];
  if (v9)
  {
    unint64_t v10 = 0;
    unsigned __int8 v14 = 0;
    do
    {
      if (v10 + a4 + a3 >= v9) {
        a3 = v9 - v10;
      }
      v11 = (void *)MEMORY[0x1C186D320]();
      v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v10, a3);
      v13 = [a1 objectsAtIndexes:v12];

      v8[2](v8, v13, v10, a3, &v14);
      LODWORD(v12) = v14;

      if (v12) {
        break;
      }
      v10 += a3;
    }
    while (v10 < v9);
  }
}

@end