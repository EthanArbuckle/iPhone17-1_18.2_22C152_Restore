@interface NSCoder(HealthRecordServices)
- (void)hrs_failWithCocoaInvalidValueError;
- (void)hrs_failWithCocoaValueNotFoundError;
@end

@implementation NSCoder(HealthRecordServices)

- (void)hrs_failWithCocoaValueNotFoundError
{
  objc_msgSend(MEMORY[0x263F087E8], "hrs_cocoaValueNotFoundError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 failWithError:v2];
}

- (void)hrs_failWithCocoaInvalidValueError
{
  objc_msgSend(MEMORY[0x263F087E8], "hrs_cocoaInvalidValueError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 failWithError:v2];
}

@end