@interface NSData(HMFCalendarCreation)
- (id)decodeArrayOfDateComponents;
- (uint64_t)decodeCalendar;
- (uint64_t)decodeDateComponents;
@end

@implementation NSData(HMFCalendarCreation)

- (uint64_t)decodeDateComponents
{
  return objc_msgSend(MEMORY[0x1E4F1C9D8], "hmf_unarchiveFromData:error:", a1, 0);
}

- (id)decodeArrayOfDateComponents
{
  v2 = (void *)MEMORY[0x1E4F28DC0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v6 = [v2 unarchivedObjectOfClasses:v5 fromData:a1 error:0];

  return v6;
}

- (uint64_t)decodeCalendar
{
  return objc_msgSend(MEMORY[0x1E4F1C9A8], "hmf_unarchiveFromData:error:", a1, 0);
}

@end