@interface CALNMutableNotificationContent
- (CALNMutableNotificationContent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBody:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setDefaultActionURL:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setIconIdentifier:(id)a3;
- (void)setInterruptionLevel:(unint64_t)a3;
- (void)setPeopleIdentifiers:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setShouldHideTime:(BOOL)a3;
- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3;
- (void)setSound:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoValue:(id)a3 forKey:(id)a4;
@end

@implementation CALNMutableNotificationContent

- (CALNMutableNotificationContent)init
{
  v3.receiver = self;
  v3.super_class = (Class)CALNMutableNotificationContent;
  result = [(CALNMutableNotificationContent *)&v3 init];
  if (result) {
    result->super._interruptionLevel = 1;
  }
  return result;
}

- (void)setTitle:(id)a3
{
  self->super._title = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSubtitle:(id)a3
{
  self->super._subtitle = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setBody:(id)a3
{
  self->super._body = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setCategoryIdentifier:(id)a3
{
  self->super._categoryIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSectionIdentifier:(id)a3
{
  self->super._sectionIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setDate:(id)a3
{
  self->super._date = (NSDate *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setExpirationDate:(id)a3
{
  self->super._expirationDate = (NSDate *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setDefaultActionURL:(id)a3
{
  self->super._defaultActionURL = (NSURL *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setIconIdentifier:(id)a3
{
  self->super._iconIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setShouldHideTime:(BOOL)a3
{
  self->super._shouldHideTime = a3;
}

- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3
{
  self->super._shouldSuppressSyncDismissalWhenRemoved = a3;
}

- (void)setPeopleIdentifiers:(id)a3
{
  self->super._peopleIdentifiers = (NSArray *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSound:(id)a3
{
  self->super._sound = (CALNNotificationSound *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setUserInfo:(id)a3
{
  self->super._userInfo = (NSDictionary *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setThreadIdentifier:(id)a3
{
  self->super._threadIdentifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->super._interruptionLevel = a3;
}

- (void)setFilterCriteria:(id)a3
{
  self->super._filterCriteria = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20 = +[CALNNotificationContent allocWithZone:a3];
  v24 = [(CALNNotificationContent *)self title];
  v23 = [(CALNNotificationContent *)self subtitle];
  v22 = [(CALNNotificationContent *)self body];
  v19 = [(CALNNotificationContent *)self categoryIdentifier];
  v18 = [(CALNNotificationContent *)self sectionIdentifier];
  v17 = [(CALNNotificationContent *)self date];
  v15 = [(CALNNotificationContent *)self expirationDate];
  v13 = [(CALNNotificationContent *)self defaultActionURL];
  v12 = [(CALNNotificationContent *)self iconIdentifier];
  BOOL v16 = [(CALNNotificationContent *)self shouldHideTime];
  BOOL v14 = [(CALNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  v4 = [(CALNNotificationContent *)self peopleIdentifiers];
  v5 = [(CALNNotificationContent *)self sound];
  v6 = [(CALNNotificationContent *)self userInfo];
  v7 = [(CALNNotificationContent *)self threadIdentifier];
  unint64_t v8 = [(CALNNotificationContent *)self interruptionLevel];
  v9 = [(CALNNotificationContent *)self filterCriteria];
  BYTE1(v11) = v14;
  LOBYTE(v11) = v16;
  id v21 = -[CALNNotificationContent _initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:](v20, "_initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:", v24, v23, v22, v19, v18, v17, v15, v13, v12, v11, v4, v5, v6, v7, v8,
          v9);

  return v21;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(CALNNotificationContent *)self userInfo];
  if (v8)
  {
    v9 = v8;
    v10 = (void *)[v8 mutableCopy];
    [v10 setObject:v7 forKeyedSubscript:v6];

    uint64_t v11 = (void *)[v10 copy];
  }
  else
  {
    id v12 = v6;
    v13[0] = v7;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  [(CALNMutableNotificationContent *)self setUserInfo:v11];
}

@end