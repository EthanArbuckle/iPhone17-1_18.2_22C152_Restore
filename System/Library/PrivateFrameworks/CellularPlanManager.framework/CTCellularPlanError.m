@interface CTCellularPlanError
+ (id)errorForCode:(int64_t)a3;
+ (id)errorForCode:(int64_t)a3 withDescription:(id)a4;
@end

@implementation CTCellularPlanError

+ (id)errorForCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorForCode:withDescription:");
}

+ (id)errorForCode:(int64_t)a3 withDescription:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v6;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = [v8 errorWithDomain:@"CTCellularPlanError" code:a3 userInfo:v9];
  }
  else
  {
    v10 = [a1 errorForCode:a3];
  }

  return v10;
}

@end