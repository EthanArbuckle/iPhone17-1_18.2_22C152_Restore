@interface CSDelegationUtilities
+ (BOOL)sourceInListHasMoreThanOneWritableCalendar:(id)a3;
@end

@implementation CSDelegationUtilities

+ (BOOL)sourceInListHasMoreThanOneWritableCalendar:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "readWriteCalendarsForEntityType:", 0, (void)v10);
        id v8 = [v7 count];

        if ((unint64_t)v8 > 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

@end