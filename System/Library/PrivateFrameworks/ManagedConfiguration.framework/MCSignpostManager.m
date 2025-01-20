@interface MCSignpostManager
+ (id)signpostsForTypeFilter:(unint64_t)a3 featureFilter:(id)a4 duration:(double)a5 error:(id *)a6;
@end

@implementation MCSignpostManager

+ (id)signpostsForTypeFilter:(unint64_t)a3 featureFilter:(id)a4 duration:(double)a5 error:(id *)a6
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"signpost manager disabled";
    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1, a5);
    *a6 = [v7 errorWithDomain:@"MCSignpostManager" code:-1 userInfo:v8];
  }
  return 0;
}

@end