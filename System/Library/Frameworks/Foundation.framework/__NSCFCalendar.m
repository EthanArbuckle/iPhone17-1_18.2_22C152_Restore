@interface __NSCFCalendar
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (__NSCFCalendar)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __NSCFCalendar

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (__NSCFCalendar)initWithCoder:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);

  return (__NSCFCalendar *)[v4 initWithCoder:a3];
}

@end