@interface NSDate(_ATXDateComparator)
- (BOOL)atx_isAfterDate:()_ATXDateComparator;
- (BOOL)atx_isBeforeDate:()_ATXDateComparator;
- (BOOL)atx_isOnOrAfterDate:()_ATXDateComparator;
- (uint64_t)atx_isInclusiveBetweenDate:()_ATXDateComparator andDate:;
@end

@implementation NSDate(_ATXDateComparator)

- (BOOL)atx_isBeforeDate:()_ATXDateComparator
{
  return a3 && objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)atx_isAfterDate:()_ATXDateComparator
{
  return a3 && objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)atx_isOnOrAfterDate:()_ATXDateComparator
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [a1 compare:v4] == 1 || objc_msgSend(a1, "compare:", v4) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)atx_isInclusiveBetweenDate:()_ATXDateComparator andDate:
{
  id v6 = a4;
  v7 = v6;
  uint64_t v8 = 0;
  if (a3 && v6)
  {
    if (objc_msgSend(a1, "atx_isBeforeDate:", a3)) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = objc_msgSend(a1, "atx_isAfterDate:", v7) ^ 1;
    }
  }

  return v8;
}

@end