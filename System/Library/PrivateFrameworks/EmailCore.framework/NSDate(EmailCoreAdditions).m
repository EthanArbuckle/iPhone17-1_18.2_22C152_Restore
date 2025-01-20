@interface NSDate(EmailCoreAdditions)
- (id)ec_descriptionForMimeHeaders;
- (uint64_t)ec_integerDate;
@end

@implementation NSDate(EmailCoreAdditions)

- (uint64_t)ec_integerDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timeIntervalSince1970];
  double v3 = floor(v2);
  return [v1 dateWithTimeIntervalSince1970:v3];
}

- (id)ec_descriptionForMimeHeaders
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"EEE, d MMM yyyy HH:mm:ss ZZ"];
  double v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale");
  [v2 setLocale:v3];

  v4 = [v2 stringFromDate:a1];

  return v4;
}

@end