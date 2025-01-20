@interface CALNTriggeredEventNotificationMailtoURLProvider
- (CALNMailAccounts)mailAccounts;
- (CALNTriggeredEventNotificationMailtoURLProvider)initWithMailAccounts:(id)a3;
- (id)mailtoURLForEvent:(id)a3;
@end

@implementation CALNTriggeredEventNotificationMailtoURLProvider

- (CALNTriggeredEventNotificationMailtoURLProvider)initWithMailAccounts:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNTriggeredEventNotificationMailtoURLProvider;
  v6 = [(CALNTriggeredEventNotificationMailtoURLProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mailAccounts, a3);
  }

  return v7;
}

- (id)mailtoURLForEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 organizer];
  v6 = v5;
  if (!v5 || [v5 isCurrentUser])
  {
    v7 = +[CALNLogSubsystem calendar];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_20:
      v18 = 0;
      goto LABEL_21;
    }
    v8 = [v4 externalURL];
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_INFO, "Could not get mailto url for event. Event does not have an organizer that is not the current user. In other words, there is no organizer for this event or the current user is the organizer. event external URL = %{public}@", buf, 0xCu);
LABEL_19:

    goto LABEL_20;
  }
  objc_super v9 = [v6 emailAddress];
  v7 = v9;
  if (!v9 || ![v9 length])
  {
    v8 = +[CALNLogSubsystem calendar];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    v19 = [v4 externalURL];
    *(_DWORD *)buf = 138543362;
    v25 = v19;
    v20 = "Could not get mailto url because could not find organizer's email address. event external URL = %{public}@";
    v21 = v8;
    os_log_type_t v22 = OS_LOG_TYPE_INFO;
LABEL_18:
    _os_log_impl(&dword_2216BB000, v21, v22, v20, buf, 0xCu);

    goto LABEL_19;
  }
  v10 = [(CALNTriggeredEventNotificationMailtoURLProvider *)self mailAccounts];
  char v11 = [v10 canSendMail];

  if ((v11 & 1) == 0)
  {
    v8 = +[CALNLogSubsystem calendar];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v19 = [v4 externalURL];
    *(_DWORD *)buf = 138543362;
    v25 = v19;
    v20 = "Could not get mailto url because cannot send mail. event external URL = %{public}@";
    v21 = v8;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }
  v12 = [v4 title];
  v13 = v12;
  if (!v12 || ![v12 length])
  {
    v14 = +[CALNBundle bundle];
    uint64_t v15 = [v14 localizedStringForKey:@"Email sender unknown title" value:@"Event" table:0];

    v13 = (void *)v15;
  }
  if (mailtoURLForEvent__onceToken != -1) {
    dispatch_once(&mailtoURLForEvent__onceToken, &__block_literal_global_9);
  }
  v16 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:mailtoURLForEvent__allowedCharacters];
  v17 = [NSString stringWithFormat:@"mailto:%@?subject=%@", v7, v16];
  v18 = [NSURL URLWithString:v17];

LABEL_21:
  return v18;
}

void __69__CALNTriggeredEventNotificationMailtoURLProvider_mailtoURLForEvent___block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/?&:$+,;=@"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)mailtoURLForEvent__allowedCharacters;
  mailtoURLForEvent__allowedCharacters = v1;
}

- (CALNMailAccounts)mailAccounts
{
  return self->_mailAccounts;
}

- (void).cxx_destruct
{
}

@end