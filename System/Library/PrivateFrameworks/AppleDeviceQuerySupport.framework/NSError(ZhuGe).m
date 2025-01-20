@interface NSError(ZhuGe)
+ (__CFString)descriptionFromZhuGeErrorCode:()ZhuGe;
+ (id)errorWithZhuGeErrorCode:()ZhuGe underlyingError:;
- (id)_ZhuGeDescriptionWithLayer:()ZhuGe;
- (uint64_t)ZhuGeDescription;
@end

@implementation NSError(ZhuGe)

+ (id)errorWithZhuGeErrorCode:()ZhuGe underlyingError:
{
  v37[4] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.zhuge" code:0 userInfo:0];
  v7 = (uint64_t *)MEMORY[0x263F08338];
  v8 = (uint64_t *)MEMORY[0x263F08608];
  if (a3 == 1)
  {
    v9 = (uint64_t *)MEMORY[0x263F08608];
    id v10 = (id)qword_2692D4058;
    v11 = NSString;
    v12 = [NSNumber numberWithUnsignedInteger:1];
    v13 = [v11 stringWithFormat:@"Reserved ZhuGeErrorCode %@ shall not be the argument", v12];

    v14 = [NSString stringWithFormat:@"Please check newly added code that calling ZhuGeError API"];
LABEL_10:
    v18 = v6;
    goto LABEL_11;
  }
  if (a3 >= 0x51)
  {
    v9 = (uint64_t *)MEMORY[0x263F08608];
    id v10 = (id)qword_2692D4058;
    v15 = NSString;
    v16 = [NSNumber numberWithUnsignedInteger:a3];
    v13 = [v15 stringWithFormat:@"ZhuGeErrorCode %@ exceed maximum", v16];
LABEL_9:

    v14 = @"Please file a radar against \"ZhuGe|all\"";
    a3 = 1;
    goto LABEL_10;
  }
  v17 = (void *)((char *)&ZhuGeErrorTable + 32 * a3);
  if (*v17 != a3)
  {
    v9 = (uint64_t *)MEMORY[0x263F08608];
    id v10 = (id)qword_2692D4058;
    v20 = NSString;
    v16 = [NSNumber numberWithUnsignedInteger:a3];
    v21 = [NSNumber numberWithInteger:*v17];
    v13 = [v20 stringWithFormat:@"Index %@ of ZhuGeErrorCode table got a wrong code %@", v16, v21];

    goto LABEL_9;
  }
  v18 = v5;
  if (isObjectNilOrZhuGeNull(v5))
  {
    v9 = v8;
    id v19 = v6;

LABEL_18:
    v18 = v19;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = v8;
LABEL_19:
    v33 = (id *)((char *)&ZhuGeErrorTable + 32 * a3);
    id v10 = v33[1];
    v13 = (__CFString *)v33[2];
    v14 = (__CFString *)v33[3];
    id v5 = v18;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *v7;
    v36[0] = *MEMORY[0x263F08320];
    v36[1] = v30;
    v37[0] = v5;
    v37[1] = off_2692D4080[0];
    v9 = v8;
    uint64_t v31 = *v8;
    v36[2] = *MEMORY[0x263F08348];
    v36[3] = v31;
    v37[2] = off_2692D4088;
    v37[3] = v6;
    v32 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    id v19 = [v29 errorWithDomain:@"com.apple.zhuge" code:2 userInfo:v32];

    goto LABEL_18;
  }
  v9 = v8;
  id v10 = (id)qword_2692D4058;
  v14 = @"Please check latest code that using ZhuGe error API";
  a3 = 1;
  v18 = v6;
  v13 = @"UnderlyingError can only be NSError, NSString, ZHUGE_NULL or nil";
LABEL_11:
  id v22 = v18;
  v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = *MEMORY[0x263F08338];
  v34[0] = *MEMORY[0x263F08320];
  v34[1] = v24;
  v35[0] = v10;
  v35[1] = v13;
  uint64_t v25 = *v9;
  v34[2] = *MEMORY[0x263F08348];
  v34[3] = v25;
  v35[2] = v14;
  v35[3] = v22;
  v26 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
  v27 = [v23 errorWithDomain:@"com.apple.zhuge" code:a3 userInfo:v26];

  return v27;
}

+ (__CFString)descriptionFromZhuGeErrorCode:()ZhuGe
{
  if (a3 <= 0x50)
  {
    if (ZhuGeErrorTable[4 * a3] == (id)a3) {
      v4 = (__CFString *)ZhuGeErrorTable[4 * a3 + 1];
    }
    else {
      v4 = @"Invalid ZhuGe Error Code!";
    }
  }
  else
  {
    v4 = @"Illegal ZhuGe Error Code!";
  }
  return v4;
}

- (id)_ZhuGeDescriptionWithLayer:()ZhuGe
{
  uint64_t v5 = 4 * a3;
  v6 = [&stru_26FC2DCC0 stringByPaddingToLength:4 * a3 withString:@" " startingAtIndex:0];
  v7 = [&stru_26FC2DCC0 stringByPaddingToLength:(4 * a3) | 2 withString:@" " startingAtIndex:0];
  v8 = [&stru_26FC2DCC0 stringByPaddingToLength:v5 + 4 withString:@" " startingAtIndex:0];
  v9 = [a1 domain];
  char v10 = [v9 isEqualToString:@"com.apple.zhuge"];

  if (v10)
  {
    v11 = [a1 userInfo];
    v12 = [v11 objectForKey:*MEMORY[0x263F08320]];

    v13 = [a1 userInfo];
    uint64_t v25 = [v13 objectForKey:*MEMORY[0x263F08338]];

    v14 = [a1 userInfo];
    v15 = [v14 objectForKey:*MEMORY[0x263F08348]];

    v16 = [a1 userInfo];
    v17 = [v16 objectForKey:*MEMORY[0x263F08608]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 _ZhuGeDescriptionWithLayer:a3 + 1];

      v17 = (void *)v18;
    }
    uint64_t v24 = NSString;
    id v19 = [a1 domain];
    v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
    v21 = [v24 stringWithFormat:@"\n%@{\n%@Domain   = %@\n%@Code     = %@\n%@UserInfo = {\n%@Description        = %@\n%@FailureReason      = %@\n%@RecoverySuggestion = %@\n%@UnderlyingError    = %@\n%@}", v6, v7, v19, v7, v20, v7, v8, v12, v8, v25, v8, v15, v8, v17, v6];
  }
  else
  {
    id v22 = NSString;
    v12 = [a1 description];
    v21 = [v22 stringWithFormat:@"{\n%@%@\n%@}", v8, v12, v7];
  }

  return v21;
}

- (uint64_t)ZhuGeDescription
{
  return [a1 _ZhuGeDescriptionWithLayer:0];
}

@end