@interface MFMailAccountProxy
+ (id)log;
- (BOOL)_isActive;
- (BOOL)_isRestricted;
- (BOOL)isDefaultDeliveryAccount;
- (BOOL)isManaged;
- (BOOL)restrictsRepliesAndForwards;
- (BOOL)supportsMailDrop;
- (BOOL)supportsThreadOperations;
- (NSArray)emailAddresses;
- (NSArray)fromEmailAddresses;
- (NSArray)fromEmailAddressesIncludingDisabled;
- (NSString)firstEmailAddress;
- (NSString)fullUserName;
- (NSString)uniqueID;
- (NSString)username;
- (id)_emailAddressesAndAliases;
- (id)_initWithProperties:(id)a3;
- (id)mailAccount;
@end

@implementation MFMailAccountProxy

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MFMailAccountProxy_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;

  return v2;
}

void __25__MFMailAccountProxy_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

- (id)_initWithProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailAccountProxy;
  v5 = [(MFMailAccountProxy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)isDefaultDeliveryAccount
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B08]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)fullUserName
{
  return (NSString *)[(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AF8]];
}

- (NSString)username
{
  return (NSString *)[(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B38]];
}

- (NSString)firstEmailAddress
{
  char v3 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AD0]];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(MFMailAccountProxy *)self emailAddresses];
    id v5 = [v6 firstObject];
  }

  return (NSString *)v5;
}

- (NSArray)emailAddresses
{
  return (NSArray *)[(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AD8]];
}

- (NSArray)fromEmailAddresses
{
  return (NSArray *)[(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AE8]];
}

- (NSArray)fromEmailAddressesIncludingDisabled
{
  return (NSArray *)[(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AF0]];
}

- (id)_emailAddressesAndAliases
{
  return [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AE0]];
}

- (NSString)uniqueID
{
  return (NSString *)[(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73AC8]];
}

- (BOOL)supportsThreadOperations
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B30]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)restrictsRepliesAndForwards
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B20]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)supportsMailDrop
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B28]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isManaged
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B10]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_isActive
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B00]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_isRestricted
{
  v2 = [(NSDictionary *)self->_properties objectForKeyedSubscript:*MEMORY[0x1E4F73B18]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)mailAccount
{
  if (MFIsMobileMail())
  {
    char v3 = (void *)MEMORY[0x1E4F77C70];
    id v4 = [(MFMailAccountProxy *)self firstEmailAddress];
    id v5 = [v3 accountContainingEmailAddress:v4 includingInactive:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end