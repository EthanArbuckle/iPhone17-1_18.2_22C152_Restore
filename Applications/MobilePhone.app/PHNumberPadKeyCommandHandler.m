@interface PHNumberPadKeyCommandHandler
- (PHNumberPadKeyCommandHandler)init;
- (PHNumberPadKeyCommandHandler)initWithViewController:(id)a3 selector:(SEL)a4;
- (char)characterForNumberPadCharacter:(int64_t)a3;
- (int64_t)numberPadCharacterForString:(id)a3;
- (void)handleKeyCommand:(id)a3 receivedCharacterBlock:(id)a4 receivedSpecialCharacterBlock:(id)a5;
@end

@implementation PHNumberPadKeyCommandHandler

- (PHNumberPadKeyCommandHandler)initWithViewController:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  if (initWithViewController_selector__onceToken != -1) {
    dispatch_once(&initWithViewController_selector__onceToken, &__block_literal_global_33);
  }
  v14.receiver = self;
  v14.super_class = (Class)PHNumberPadKeyCommandHandler;
  v7 = [(PHNumberPadKeyCommandHandler *)&v14 init];
  if (v7)
  {
    if ([(id)initWithViewController_selector__commandCharacters length])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [initWithViewController_selector__commandCharacters substringWithRange:v8];
        v10 = +[UIKeyCommand keyCommandWithInput:v9 modifierFlags:0 action:a4];
        [v6 addKeyCommand:v10];

        ++v8;
      }
      while (v8 < (unint64_t)[(id)initWithViewController_selector__commandCharacters length]);
    }
    v11 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:a4];
    [v6 addKeyCommand:v11];
    v12 = +[UIKeyCommand keyCommandWithInput:@"\b" modifierFlags:0 action:a4];

    [v6 addKeyCommand:v12];
  }

  return v7;
}

void __64__PHNumberPadKeyCommandHandler_initWithViewController_selector___block_invoke(id a1)
{
  id v6 = +[NSMutableString stringWithString:@"01234567890abcdefghijklmnopqrstuvwxyz+*#"];
  for (uint64_t i = 0; i != 12; ++i)
  {
    v2 = +[TPNumberPadButton localizedLettersForCharacter:TPNumberPadCharacters[i]];
    [v6 appendString:v2];
  }
  v3 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v4 = [v6 stringByTrimmingCharactersInSet:v3];
  v5 = (void *)initWithViewController_selector__commandCharacters;
  initWithViewController_selector__commandCharacters = v4;
}

- (PHNumberPadKeyCommandHandler)init
{
  uint64_t v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PHNumberPadKeyCommandHandler.m" lineNumber:15 description:@"%s is not available. Use a designated initializer instead."];

  return 0;
}

- (void)handleKeyCommand:(id)a3 receivedCharacterBlock:(id)a4 receivedSpecialCharacterBlock:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void))a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling key command - %@", (uint8_t *)&v23, 0xCu);
  }

  if (v10)
  {
    v12 = [v8 input];
    unsigned int v13 = [v12 isEqualToString:@"\r"];

    if (v13)
    {
      objc_super v14 = PHDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling callback for PHNumberPadKeyCommandHandlerSpecialCharacterDial", (uint8_t *)&v23, 2u);
      }
      uint64_t v15 = 1;
LABEL_12:

      v10[2](v10, v15);
      goto LABEL_13;
    }
    v16 = [v8 input];
    unsigned int v17 = [v16 isEqualToString:@"\b"];

    if (v17)
    {
      objc_super v14 = PHDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling callback for PHNumberPadKeyCommandHandlerSpecialCharacterBackspace", (uint8_t *)&v23, 2u);
      }
      uint64_t v15 = 0;
      goto LABEL_12;
    }
  }
LABEL_13:
  if (v9)
  {
    v18 = [v8 input];
    int64_t v19 = [(PHNumberPadKeyCommandHandler *)self numberPadCharacterForString:v18];

    uint64_t v20 = [(PHNumberPadKeyCommandHandler *)self characterForNumberPadCharacter:v19];
    if (v20)
    {
      uint64_t v21 = v20;
      v22 = PHDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 67109120;
        LODWORD(v24) = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Calling callback for character '%c'", (uint8_t *)&v23, 8u);
      }

      v9[2](v9, v21);
    }
  }
}

- (char)characterForNumberPadCharacter:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return 48;
  }
  else {
    return a1234567890[a3];
  }
}

- (int64_t)numberPadCharacterForString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:&off_10028D080];
  for (uint64_t i = 0; i != 12; ++i)
  {
    uint64_t v6 = TPNumberPadCharacters[i];
    v7 = +[TPNumberPadButton localizedLettersForCharacter:v6];
    id v8 = [v7 localizedLowercaseString];

    v9 = +[NSNumber numberWithInteger:v6];
    [v4 setObject:v9 forKeyedSubscript:v8];
  }
  v10 = [v3 localizedLowercaseString];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v11 = [v4 allKeys];
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    int64_t v15 = 13;
    while (2)
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
        if ([v17 containsString:v10])
        {
          v18 = [v4 objectForKeyedSubscript:v17];
          int64_t v15 = (int)[v18 intValue];

          goto LABEL_14;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v15 = 13;
  }
LABEL_14:

  return v15;
}

@end