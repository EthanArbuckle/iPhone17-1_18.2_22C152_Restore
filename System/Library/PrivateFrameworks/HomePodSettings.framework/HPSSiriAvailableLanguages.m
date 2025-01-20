@interface HPSSiriAvailableLanguages
+ (BOOL)supportsSecureCoding;
+ (id)valueClasses;
- (HPSSiriAvailableLanguages)initWithCoder:(id)a3;
@end

@implementation HPSSiriAvailableLanguages

- (HPSSiriAvailableLanguages)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HPSSiriAvailableLanguages;
  v3 = [(HPSSetting *)&v17 initWithCoder:a3];
  if (v3)
  {
    objc_opt_class();
    v4 = [(HPSSetting *)v3 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_14:
      v11 = 0;
      goto LABEL_15;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    v6 = [(HPSSiriAvailableLanguages *)v3 languages];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  v11 = v3;
LABEL_15:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)valueClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

@end