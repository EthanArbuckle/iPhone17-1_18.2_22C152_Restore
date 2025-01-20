@interface Passcode
+ (id)currentPasscode;
- (BOOL)isComplex;
- (Passcode)init;
- (int64_t)length;
- (int64_t)type;
@end

@implementation Passcode

- (Passcode)init
{
  v3.receiver = self;
  v3.super_class = (Class)Passcode;
  return [(Passcode *)&v3 init];
}

- (int64_t)type
{
  v2 = +[LAPasscodeHelper sharedInstance];
  objc_super v3 = (char *)[v2 passcodeType];

  int64_t result = (int64_t)(v3 - 1);
  if ((unint64_t)(v3 - 1) >= 4)
  {
    v5 = LALogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000617B8((uint64_t)v3, v5);
    }

    return 3;
  }
  return result;
}

- (int64_t)length
{
  int64_t v2 = [(Passcode *)self type];

  return _LACPasscodeTypeLength(v2);
}

- (BOOL)isComplex
{
  return ([(Passcode *)self type] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)currentPasscode
{
  int64_t v2 = objc_alloc_init(Passcode);

  return v2;
}

@end