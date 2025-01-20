@interface CNCropRectDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6;
- (CNCropRectDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)nilValue;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNCropRectDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F498E8];
  }
  return a3 != 0;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  [a3 rectValue];
  objc_msgSend(v5, "setCropRect:");
}

- (id)CNValueForContact:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29238];
  [a3 cropRect];

  return (id)objc_msgSend(v3, "valueWithRect:");
}

- (CNCropRectDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"cropRect" readSelector:sel_cropRect writeSelector:sel_setCropRect_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return CGRectEqualToRect(*(CGRect *)((char *)a3 + 264), *(CGRect *)((char *)a4 + 264));
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  v9 = a4;
  [a3 decodeRectForKey:@"_cropRect"];
  v9[33] = v5;
  v9[34] = v6;
  v9[35] = v7;
  v9[36] = v8;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return (id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
}

- (void)ABValueForABPerson:(void *)a3
{
  v3 = (const void *)ABPersonCopyImageDataAndCropRect();
  if (v3) {
    CFRelease(v3);
  }
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", (double)0, (double)0, (double)0, (double)0, 0, 0);
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a5;
  [v7 rectValue];
  objc_msgSend(v8, "setPendingCropRect:");

  return 1;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end