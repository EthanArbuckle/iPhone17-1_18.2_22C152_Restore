@interface CalCalendarLocalAccountInfo
+ (id)sharedInstance;
- (BOOL)addressIsAccountOwner:(id)a3;
- (BOOL)addressURLIsAccountOwner:(id)a3;
@end

@implementation CalCalendarLocalAccountInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __45__CalCalendarLocalAccountInfo_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  v3 = [a3 stringRemovingMailto];
  v4 = [MEMORY[0x1E4F576B0] defaultProvider];
  char v5 = [v4 matchesOneOfMyEmails:v3];

  return v5;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  v4 = [a3 absoluteString];
  LOBYTE(self) = [(CalCalendarLocalAccountInfo *)self addressIsAccountOwner:v4];

  return (char)self;
}

@end