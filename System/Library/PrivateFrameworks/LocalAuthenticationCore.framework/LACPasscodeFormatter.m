@interface LACPasscodeFormatter
+ (id)sharedInstance;
- (LACPasscodeFormatter)init;
- (id)localizePasscode:(id)a3 type:(int64_t)a4;
@end

@implementation LACPasscodeFormatter

- (LACPasscodeFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)LACPasscodeFormatter;
  v2 = [(LACPasscodeFormatter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = __28__LACPasscodeFormatter_init__block_invoke();
    formatter = v2->_formatter;
    v2->_formatter = (NSNumberFormatter *)v3;
  }
  return v2;
}

id __28__LACPasscodeFormatter_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en"];
  [v0 setLocale:v1];

  return v0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_5_1);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;
  return v2;
}

uint64_t __38__LACPasscodeFormatter_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4 = objc_alloc_init(LACPasscodeFormatter);
  return MEMORY[0x270F9A758]();
}

- (id)localizePasscode:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 3)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v7 length])
    {
      uint64_t v10 = 0;
      while (1)
      {
        __int16 v15 = 0;
        __int16 v15 = [v7 characterAtIndex:v10];
        v11 = [NSString stringWithCharacters:&v15 length:1];
        v12 = [(NSNumberFormatter *)self->_formatter numberFromString:v11];
        if (!v12) {
          break;
        }
        v13 = v12;
        objc_msgSend(v9, "appendFormat:", @"%d", objc_msgSend(v12, "intValue"));

        if (++v10 >= (unint64_t)[v7 length]) {
          goto LABEL_7;
        }
      }

      id v8 = 0;
    }
    else
    {
LABEL_7:
      id v8 = v9;
    }
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end