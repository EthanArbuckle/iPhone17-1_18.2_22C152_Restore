@interface GCSElement(GameController)
- (void)initWithElement:()GameController;
@end

@implementation GCSElement(GameController)

- (void)initWithElement:()GameController
{
  id v4 = a3;
  v5 = [v4 unmappedNameLocalizationKey];
  if (v5)
  {
    v6 = [v4 unmappedSfSymbolsName];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = 1;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 0;
        }
      }
      v8 = [v4 primaryAlias];
      v9 = [v4 unmappedNameLocalizationKey];
      v10 = [v4 unmappedSfSymbolsName];
      a1 = (id)objc_msgSend(a1, "initWithName:nameLocalizationKey:sfSymbolsName:remappingKey:kind:", v8, v9, v10, objc_msgSend(v4, "remappingKey"), v7);

      v5 = a1;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end