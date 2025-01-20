@interface CalUMCalendarDataContainerProvider
+ (CalUMCalendarDataContainerProvider)sharedInstance;
- (BOOL)accountUsesDataSeparatedContainer:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)containerForAccountIdentifier:(id)a3;
- (id)containerInfoForAccount:(id)a3;
- (id)containerInfoForAccountIdentifier:(id)a3;
- (id)containerInfoForPersonaIdentifier:(id)a3;
- (unint64_t)hash;
@end

@implementation CalUMCalendarDataContainerProvider

+ (CalUMCalendarDataContainerProvider)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CalUMCalendarDataContainerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return (CalUMCalendarDataContainerProvider *)v2;
}

uint64_t __52__CalUMCalendarDataContainerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)containerForAccountIdentifier:(id)a3
{
  v3 = [(CalUMCalendarDataContainerProvider *)self containerInfoForAccountIdentifier:a3];
  v4 = [v3 containerURL];

  return v4;
}

- (BOOL)accountUsesDataSeparatedContainer:(id)a3
{
  v3 = [(CalUMCalendarDataContainerProvider *)self containerInfoForAccountIdentifier:a3];
  char v4 = [v3 usesDataSeparatedContainer];

  return v4;
}

- (id)containerInfoForAccountIdentifier:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F179C8];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    v6 = [v5 accountWithIdentifier:v4];
  }
  else
  {
    v6 = 0;
  }
  v7 = [[CalUMCalendarDataContainerInfo alloc] initWithAccount:v6];

  return v7;
}

- (id)containerInfoForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [[CalUMCalendarDataContainerInfo alloc] initWithAccount:v3];

  return v4;
}

- (id)containerInfoForPersonaIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[CalUMCalendarDataContainerInfo alloc] initWithPersonaID:v3];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

@end