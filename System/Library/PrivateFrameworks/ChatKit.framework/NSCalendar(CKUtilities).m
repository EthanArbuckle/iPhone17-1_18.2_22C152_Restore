@interface NSCalendar(CKUtilities)
+ (id)__ck_currentCalendar;
+ (void)__ck_setTestCalendar:()CKUtilities;
- (uint64_t)__ck_unitOfDisambiguityFromDate:()CKUtilities toDate:;
@end

@implementation NSCalendar(CKUtilities)

- (uint64_t)__ck_unitOfDisambiguityFromDate:()CKUtilities toDate:
{
  id v6 = a3;
  id v7 = a4;
  v24 = v6;
  v8 = [a1 components:30 fromDate:v6];
  v9 = [a1 components:30 fromDate:v7];
  v10 = (void *)[v8 copy];
  v11 = (void *)[v9 copy];
  [v10 setDay:0x7FFFFFFFFFFFFFFFLL];
  [v11 setDay:0x7FFFFFFFFFFFFFFFLL];
  v12 = [a1 dateFromComponents:v10];
  v13 = [a1 dateFromComponents:v11];
  uint64_t v14 = 4;
  v15 = [a1 components:4 fromDate:v12 toDate:v13 options:0];
  if ([v15 year] <= 0)
  {
    v23 = v11;
    v22 = v10;
    id v16 = v7;
    uint64_t v17 = [a1 dateFromComponents:v8];
    [a1 dateFromComponents:v9];
    v19 = v18 = (void *)v17;
    v20 = objc_msgSend(a1, "components:fromDate:toDate:options:", 8208, v17);
    if ([v20 weekOfYear] <= 0)
    {
      if ([v20 day] <= 0)
      {
        if ([v24 isEqualToDate:v16]) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = 128;
        }
      }
      else
      {
        uint64_t v14 = 16;
      }
    }
    else
    {
      uint64_t v14 = 8;
    }

    id v7 = v16;
    v10 = v22;
    v11 = v23;
  }

  return v14;
}

+ (id)__ck_currentCalendar
{
  if (__ck_currentCalendar_once != -1) {
    dispatch_once(&__ck_currentCalendar_once, &__block_literal_global_752);
  }
  if (sTestCalendar) {
    v0 = (void *)sTestCalendar;
  }
  else {
    v0 = (void *)__ck_currentCalendar_sCalendar;
  }

  return v0;
}

+ (void)__ck_setTestCalendar:()CKUtilities
{
  id v4 = a3;
  if ((id)sTestCalendar != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&sTestCalendar, a3);
    id v4 = v5;
  }
}

@end