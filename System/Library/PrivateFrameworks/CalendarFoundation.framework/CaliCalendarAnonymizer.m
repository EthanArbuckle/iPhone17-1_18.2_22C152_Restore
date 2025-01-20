@interface CaliCalendarAnonymizer
+ (id)anonymizedAddressURL:(id)a3;
+ (id)anonymizedDescription:(id)a3;
+ (id)anonymizedEmail:(id)a3;
+ (id)anonymizedEmailCommonName:(id)a3;
+ (id)anonymizedLocation:(id)a3;
+ (id)anonymizedPhoneNumber:(id)a3;
+ (id)anonymizedString:(id)a3;
+ (id)anonymizedString:(id)a3 withAnonymizer:(id)a4;
+ (id)anonymizedSummary:(id)a3;
+ (id)anonymizedUID:(id)a3;
+ (id)anonymizedURNUID:(id)a3;
+ (id)anonymizedWebURL:(id)a3;
+ (id)sharedAnonymizedDomainName;
+ (id)sharedAnonymizedStrings;
+ (id)sharedAnonymizedStringsCount;
+ (void)dump;
@end

@implementation CaliCalendarAnonymizer

+ (id)sharedAnonymizedStrings
{
  if (sharedAnonymizedStrings_once != -1) {
    dispatch_once(&sharedAnonymizedStrings_once, &__block_literal_global_4);
  }
  v2 = (void *)gSharedAnonymizedStrings;

  return v2;
}

uint64_t __49__CaliCalendarAnonymizer_sharedAnonymizedStrings__block_invoke()
{
  srandom(0xF466u);
  gSharedAnonymizedStrings = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAnonymizedStringsCount
{
  if (sharedAnonymizedStringsCount_once != -1) {
    dispatch_once(&sharedAnonymizedStringsCount_once, &__block_literal_global_2);
  }
  v2 = (void *)gSharedAnonymizedStringsCount;

  return v2;
}

uint64_t __54__CaliCalendarAnonymizer_sharedAnonymizedStringsCount__block_invoke()
{
  gSharedAnonymizedStringsCount = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28BD0]);

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAnonymizedDomainName
{
  if (sharedAnonymizedDomainName_once != -1) {
    dispatch_once(&sharedAnonymizedDomainName_once, &__block_literal_global_5);
  }
  v2 = (void *)sharedAnonymizedDomainName_domain;

  return v2;
}

void __52__CaliCalendarAnonymizer_sharedAnonymizedDomainName__block_invoke()
{
  v3 = [[CalPreferences alloc] initWithDomain:0];
  uint64_t v0 = [(CalPreferences *)v3 getValueForPreference:@"CalAnonymizerDomain" expectedClass:objc_opt_class()];
  v1 = (void *)sharedAnonymizedDomainName_domain;
  sharedAnonymizedDomainName_domain = v0;

  if (![(id)sharedAnonymizedDomainName_domain length])
  {
    v2 = (void *)sharedAnonymizedDomainName_domain;
    sharedAnonymizedDomainName_domain = @"apple.com";
  }
}

+ (id)anonymizedString:(id)a3 withAnonymizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void *, id))MEMORY[0x192FD8850]();
  v8 = v7;
  if (v6)
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }

  v8 = (void (**)(void *, id))&__block_literal_global_14;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  v9 = +[CaliCalendarAnonymizer sharedAnonymizedStrings];
  v10 = +[CaliCalendarAnonymizer sharedAnonymizedStringsCount];
  id v11 = v9;
  objc_sync_enter(v11);
  v12 = [v11 objectForKeyedSubscript:v5];

  if (!v12 && v8)
  {
    v13 = v8[2](v8, v5);
    [v11 setObject:v13 forKeyedSubscript:v5];
  }
  v14 = [v11 objectForKeyedSubscript:v5];
  [v10 addObject:v5];
  objc_sync_exit(v11);

LABEL_9:

  return v14;
}

+ (id)anonymizedString:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_14];
}

+ (id)anonymizedSummary:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_20];
}

+ (id)anonymizedDescription:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_25_0];
}

+ (id)anonymizedUID:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_30];
}

+ (id)anonymizedURNUID:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_35];
}

+ (id)anonymizedEmailCommonName:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_40];
}

+ (id)anonymizedEmail:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_45];
}

+ (id)anonymizedLocation:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_51];
}

+ (id)anonymizedPhoneNumber:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:a3 withAnonymizer:&__block_literal_global_56];
}

+ (id)anonymizedWebURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [v3 scheme];
    id v5 = [v3 resourceSpecifier];

    id v6 = +[CaliCalendarAnonymizer anonymizedString:v5 withAnonymizer:&__block_literal_global_62];

    v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [NSString stringWithFormat:@"%@:%@", v4, v6];
    v9 = [v7 URLWithString:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)anonymizedAddressURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    if (objc_msgSend(v3, "cal_hasSchemeTel")) {
      v4 = &__block_literal_global_56;
    }
    else {
      v4 = &__block_literal_global_35;
    }
    id v5 = [v3 scheme];
    id v6 = [v3 resourceSpecifier];

    v7 = +[CaliCalendarAnonymizer anonymizedString:v6 withAnonymizer:v4];

    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [NSString stringWithFormat:@"%@:%@", v5, v7];
    v10 = [v8 URLWithString:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)dump
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = +[CaliCalendarAnonymizer sharedAnonymizedStrings];
  id v3 = +[CaliCalendarAnonymizer sharedAnonymizedStringsCount];
  id v4 = v2;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v3 countForObject:v9];
        id v11 = [v5 objectForKeyedSubscript:v9];
        NSLog(&cfstr_Lu.isa, v10, v11, v9);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v5);
}

@end