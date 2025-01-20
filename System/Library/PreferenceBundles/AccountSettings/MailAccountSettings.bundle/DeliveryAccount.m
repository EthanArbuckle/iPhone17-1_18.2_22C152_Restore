@interface DeliveryAccount
+ (BOOL)validateValue:(id)a3 forPSSpecifier:(id)a4;
+ (Class)accountValidatorClass;
- (id)portNumberString;
- (void)setPortNumberString:(id)a3;
@end

@implementation DeliveryAccount

+ (Class)accountValidatorClass
{
  return (Class)objc_opt_class();
}

- (id)portNumberString
{
  return +[NSString stringWithFormat:@"%d", [(DeliveryAccount *)self portNumber]];
}

- (void)setPortNumberString:(id)a3
{
  id v4 = a3;
  -[DeliveryAccount setPortNumber:](self, "setPortNumber:", [v4 intValue]);
}

+ (BOOL)validateValue:(id)a3 forPSSpecifier:(id)a4
{
  id v5 = a3;
  v6 = (char *)a4;
  v7 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  v8 = *(char **)&v6[OBJC_IVAR___PSSpecifier_setter];
  BOOL v9 = "setHostname:" == v8 || "setPortNumberString:" == v8;
  BOOL v10 = v9 || "setUsername:" == v8;
  if (!v10 && "setPassword:" != v8) {
    goto LABEL_16;
  }
  if (![v5 length])
  {
    char v15 = 0;
    goto LABEL_17;
  }
  if (*(void *)&v7[OBJC_IVAR___PSSpecifier_keyboardType] == 2)
  {
    v12 = +[NSCharacterSet decimalDigitCharacterSet];
    [v5 rangeOfCharacterFromSet:v12];
    uint64_t v14 = v13;

    char v15 = v14 != 0;
  }
  else
  {
LABEL_16:
    char v15 = 1;
  }
LABEL_17:

  return v15;
}

@end