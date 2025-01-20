@interface NSMutableDictionary(DNDSModeAssertionStoreRecord)
- (void)dnds_setSafeLocalDateForTimestamp:()DNDSModeAssertionStoreRecord key:;
@end

@implementation NSMutableDictionary(DNDSModeAssertionStoreRecord)

- (void)dnds_setSafeLocalDateForTimestamp:()DNDSModeAssertionStoreRecord key:
{
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = a4;
    [a3 doubleValue];
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v9 dateStyle:1 timeStyle:1];
    [a1 setObject:v8 forKey:v7];
  }
}

@end