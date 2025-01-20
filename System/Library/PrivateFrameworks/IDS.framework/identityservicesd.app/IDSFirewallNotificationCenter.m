@interface IDSFirewallNotificationCenter
- (BOOL)_notificationShouldRedirect;
- (IDSContactsUtilities)contactUtilities;
- (IDSFirewallNotificationCenter)init;
- (IDSFirewallNotificationCenter)initWithNotificationCenter:(id)a3 serverBag:(id)a4;
- (IDSRateLimiter)firewallAggressiveRateLimiter;
- (IDSRateLimiter)firewallRateLimiter;
- (IDSServerBag)serverBag;
- (IDSUserNotificationsCenter)notificationCenter;
- (id)_notificationBodyForService:(id)a3 URI:(id)a4;
- (id)_notificationIconIdentifierForService:(id)a3;
- (id)_notificationSupportURL;
- (id)_notificationTitleForService:(id)a3;
- (id)_rateLimiterForService:(id)a3;
- (id)_rateLimitingKeyForURI:(id)a3 service:(id)a4;
- (int64_t)_notificationAggressiveLimitPerPeriod;
- (int64_t)_notificationAggressiveLimitTimePeriod;
- (int64_t)_notificationLimitPerPeriod;
- (int64_t)_notificationLimitTimePeriod;
- (void)postNotificationForURI:(id)a3 onService:(id)a4 shouldRateLimit:(BOOL)a5 command:(id)a6;
- (void)setContactUtilities:(id)a3;
- (void)setFirewallAggressiveRateLimiter:(id)a3;
- (void)setFirewallRateLimiter:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setServerBag:(id)a3;
@end

@implementation IDSFirewallNotificationCenter

- (IDSFirewallNotificationCenter)init
{
  v3 = +[IDSUserNotificationsCenter sharedInstance];
  v4 = +[IDSServerBag sharedInstance];
  v5 = [(IDSFirewallNotificationCenter *)self initWithNotificationCenter:v3 serverBag:v4];

  return v5;
}

- (IDSFirewallNotificationCenter)initWithNotificationCenter:(id)a3 serverBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IDSFirewallNotificationCenter;
  v9 = [(IDSFirewallNotificationCenter *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serverBag, a4);
    v11 = (IDSRateLimiter *)objc_msgSend(objc_alloc((Class)IDSRateLimiter), "initWithLimit:timeLimit:", -[IDSFirewallNotificationCenter _notificationLimitPerPeriod](v10, "_notificationLimitPerPeriod"), (double)-[IDSFirewallNotificationCenter _notificationLimitTimePeriod](v10, "_notificationLimitTimePeriod"));
    firewallRateLimiter = v10->_firewallRateLimiter;
    v10->_firewallRateLimiter = v11;

    v13 = (IDSRateLimiter *)objc_msgSend(objc_alloc((Class)IDSRateLimiter), "initWithLimit:timeLimit:", -[IDSFirewallNotificationCenter _notificationAggressiveLimitPerPeriod](v10, "_notificationAggressiveLimitPerPeriod"), (double)-[IDSFirewallNotificationCenter _notificationAggressiveLimitTimePeriod](v10, "_notificationAggressiveLimitTimePeriod"));
    firewallAggressiveRateLimiter = v10->_firewallAggressiveRateLimiter;
    v10->_firewallAggressiveRateLimiter = v13;

    objc_storeStrong((id *)&v10->_notificationCenter, a3);
    v15 = objc_alloc_init(IDSContactsUtilities);
    contactUtilities = v10->_contactUtilities;
    v10->_contactUtilities = v15;
  }
  return v10;
}

- (int64_t)_notificationLimitPerPeriod
{
  v2 = [(IDSFirewallNotificationCenter *)self serverBag];
  v3 = [v2 objectForKey:@"firewall-limit"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)_notificationLimitTimePeriod
{
  int64_t v2 = 86400;
  v3 = [(IDSFirewallNotificationCenter *)self serverBag];
  int64_t v4 = [v3 objectForKey:@"firewall-time-period"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v2 = (int64_t)[v4 integerValue];
    }
  }

  return v2;
}

- (int64_t)_notificationAggressiveLimitPerPeriod
{
  int64_t v2 = [(IDSFirewallNotificationCenter *)self serverBag];
  v3 = [v2 objectForKey:@"firewall-aggressive-limit"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)_notificationAggressiveLimitTimePeriod
{
  int64_t v2 = 604800;
  v3 = [(IDSFirewallNotificationCenter *)self serverBag];
  int64_t v4 = [v3 objectForKey:@"firewall-aggressive-time-period"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v2 = (int64_t)[v4 integerValue];
    }
  }

  return v2;
}

- (BOOL)_notificationShouldRedirect
{
  int64_t v2 = [(IDSFirewallNotificationCenter *)self serverBag];
  v3 = [v2 objectForKey:@"firewall-should-redirect"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_notificationSupportURL
{
  int64_t v2 = [(IDSFirewallNotificationCenter *)self serverBag];
  v3 = [v2 objectForKey:@"firewall-support-url"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = @"https://support.apple.com";
  }

  return v4;
}

- (id)_rateLimitingKeyForURI:(id)a3 service:(id)a4
{
  id v5 = a4;
  v6 = [a3 unprefixedURI];
  id v7 = [v5 identifier];

  id v8 = +[NSString stringWithFormat:@"%@,%@", v6, v7];

  return v8;
}

- (id)_rateLimiterForService:(id)a3
{
  id v4 = [a3 firewallNotificationRateLimitType];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 32;
  }
  else
  {
    uint64_t v5 = 24;
  }
  id v4 = *(id *)((char *)&self->super.isa + v5);
LABEL_6:

  return v4;
}

- (id)_notificationTitleForService:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  switch([v3 firewallNotificationStyle])
  {
    case 1u:
      uint64_t v5 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10070F108((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
      }

      break;
    default:
      break;
  }
  v12 = IMLocalizedStringFromTableInBundle();

  return v12;
}

- (id)_notificationBodyForService:(id)a3 URI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  switch([v6 firewallNotificationStyle])
  {
    case 0u:
      CFStringRef v9 = @"an unknown contact";
      uint64_t v10 = @"Lockdown Mode blocked %@ from contacting you.";
      goto LABEL_45;
    case 1u:
      uint64_t v11 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10070F108((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
      }

      objc_super v18 = IMLocalizedStringFromTableInBundle();
      v19 = [v7 unprefixedURI];
      v20 = IMFormattedDisplayStringForID();
      v21 = [v6 displayName];
      v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v20, v21);

      goto LABEL_55;
    case 2u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to collaborate using iCloud.";
      goto LABEL_45;
    case 3u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to request or send a payment.";
      goto LABEL_45;
    case 4u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share Apple Card or transaction information.";
      goto LABEL_45;
    case 5u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to SharePlay Music.";
      goto LABEL_45;
    case 6u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to FaceTime.";
      goto LABEL_45;
    case 7u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to FaceTime Audio call.";
      goto LABEL_45;
    case 8u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to send a FaceTime Video Message.";
      goto LABEL_45;
    case 9u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share a FaceTime Live Photo.";
      goto LABEL_45;
    case 0xAu:
    case 0xDu:
    case 0xFu:
    case 0x16u:
    case 0x20u:
    case 0x22u:
    case 0x23u:
      goto LABEL_34;
    case 0xBu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to screen share with you.";
      goto LABEL_45;
    case 0xCu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to Walkie-Talkie.";
      goto LABEL_45;
    case 0xEu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to request purchase authorization.";
      goto LABEL_45;
    case 0x10u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to share your location.";
      goto LABEL_45;
    case 0x11u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share an item using Find My.";
      goto LABEL_45;
    case 0x12u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to set up a share with you.";
      goto LABEL_45;
    case 0x13u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to access a Home.";
      goto LABEL_45;
    case 0x14u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to access a camera.";
      goto LABEL_45;
    case 0x15u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to invite you to a Home.";
      goto LABEL_45;
    case 0x17u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to share your Fitness Activity.";
      goto LABEL_45;
    case 0x18u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to start a Game Center chat.";
      goto LABEL_45;
    case 0x19u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to play a game.";
      goto LABEL_45;
    case 0x1Au:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to start a Game Center multiplayer game";
      goto LABEL_45;
    case 0x1Bu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to share your health data.";
      goto LABEL_45;
    case 0x1Cu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to share your Car Key.";
      goto LABEL_45;
    case 0x1Du:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share their ETA with you.";
      goto LABEL_45;
    case 0x1Eu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share something using AirDrop.";
      goto LABEL_45;
    case 0x1Fu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ invited you to a Shared Photo Stream.";
      goto LABEL_45;
    case 0x21u:
      v23 = +[FTDeviceSupport sharedInstance];
      [v23 deviceType];

LABEL_34:
      v22 = IMLocalizedStringFromTableInBundle();
      goto LABEL_55;
    case 0x24u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to collaborate with you using Freeform.";
      goto LABEL_45;
    case 0x25u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to collaborate with you using Notes.";
      goto LABEL_45;
    case 0x26u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share a password or passkey.";
      goto LABEL_45;
    case 0x27u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share a Safari Tab Group.";
      goto LABEL_45;
    case 0x28u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share control of Apple Music.";
      goto LABEL_45;
    case 0x29u:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to start a Check In.";
      goto LABEL_45;
    case 0x2Au:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share their Name and Photo.";
      goto LABEL_45;
    case 0x2Bu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to access an alarm or timer.";
      goto LABEL_45;
    case 0x2Cu:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to share a Contact Key Verification.";
      goto LABEL_45;
    case 0x2Du:
      CFStringRef v9 = @"An unknown contact";
      uint64_t v10 = @"%@ attempted to send an iMessage.";
      goto LABEL_45;
    default:
      uint64_t v10 = 0;
      CFStringRef v9 = @"An unknown contact";
LABEL_45:
      if ([v7 FZIDType] == (id)5)
      {
        v24 = +[IDSFoundationLog delivery];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v7;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Overriding URI %@ for pseudonym", buf, 0xCu);
        }

        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v9);
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v22 = IMLocalizedStringFromTableInBundle();
      }
      else
      {
        uint64_t v25 = [(IDSContactsUtilities *)self->_contactUtilities nameForContactMatchingURI:v7];
        if (v25)
        {
          v26 = (void *)v25;
          v27 = +[IDSFoundationLog delivery];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v7;
            __int16 v32 = 2112;
            v33 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Overriding URI %@ with contact name %@", buf, 0x16u);
          }
        }
        else
        {
          v27 = [v7 unprefixedURI];
          v26 = IMFormattedDisplayStringForID();
        }

        v28 = IMLocalizedStringFromTableInBundle();
        v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v26);
      }
LABEL_55:

      return v22;
  }
}

- (id)_notificationIconIdentifierForService:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = @"com.apple.Preferences";
  switch([v3 firewallNotificationStyle])
  {
    case 1u:
      uint64_t v5 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10070F108((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
      }

      CFStringRef v4 = @"com.apple.Preferences";
      break;
    case 2u:
      CFStringRef v4 = @"Collaboration%@";
      break;
    case 3u:
    case 4u:
    case 0x1Cu:
      CFStringRef v4 = @"com.apple.Passbook";
      break;
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      CFStringRef v4 = @"com.apple.facetime";
      break;
    case 0xAu:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x2Bu:
      CFStringRef v4 = @"com.apple.Home";
      break;
    case 0xBu:
    case 0x20u:
      CFStringRef v4 = @"Screen Sharing%@";
      break;
    case 0xDu:
      CFStringRef v4 = @"Classroom%@";
      break;
    case 0xEu:
      CFStringRef v4 = @"com.apple.MobileStore";
      break;
    case 0xFu:
    case 0x10u:
    case 0x11u:
      CFStringRef v4 = @"com.apple.findmy";
      break;
    case 0x17u:
      CFStringRef v4 = @"Fitness%@";
      break;
    case 0x18u:
    case 0x19u:
    case 0x1Au:
      CFStringRef v4 = @"Game Center%@";
      break;
    case 0x1Bu:
      CFStringRef v4 = @"Health%@";
      break;
    case 0x1Du:
      CFStringRef v4 = @"com.apple.Maps";
      break;
    case 0x1Eu:
      CFStringRef v4 = @"com.apple.AirDropUIRemoteNotification";
      break;
    case 0x1Fu:
      CFStringRef v4 = @"Photos%@";
      break;
    case 0x21u:
      CFStringRef v4 = @"Apple Care%@";
      break;
    case 0x22u:
      CFStringRef v4 = @"Focus%@";
      break;
    case 0x23u:
      CFStringRef v4 = @"Screen Time%@";
      break;
    case 0x24u:
      CFStringRef v4 = @"Freeform%@";
      break;
    case 0x25u:
      CFStringRef v4 = @"Notes%@";
      break;
    case 0x27u:
      CFStringRef v4 = @"Safari%@";
      break;
    case 0x28u:
      CFStringRef v4 = @"Music%@";
      break;
    case 0x2Du:
      CFStringRef v4 = @"com.apple.MobileSMS";
      break;
    default:
      break;
  }

  return (id)v4;
}

- (void)postNotificationForURI:(id)a3 onService:(id)a4 shouldRateLimit:(BOOL)a5 command:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Told to post firewall notification {uri: %@}", buf, 0xCu);
  }

  if ([v11 firewallNotificationStyle] == 1)
  {
    uint64_t v14 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v11 identifier];
      *(_DWORD *)buf = 138412546;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not posting firewall notification because service has a notification style of none {uri: %@, service: %@}", buf, 0x16u);
    }
  }
  else if (IDSCommandIsUserInteractiveCommand())
  {
    uint64_t v14 = [(IDSFirewallNotificationCenter *)self _rateLimitingKeyForURI:v10 service:v11];
    uint64_t v16 = [(IDSFirewallNotificationCenter *)self _rateLimiterForService:v11];
    uint64_t v17 = v16;
    if (v7 && ([v16 underLimitForItem:v14] & 1) == 0)
    {
      v19 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not posting firewall notification because we are over limit {uri: %@}", buf, 0xCu);
      }
    }
    else
    {
      v24 = v17;
      if ([(IDSFirewallNotificationCenter *)self _notificationShouldRedirect])
      {
        objc_super v18 = [(IDSFirewallNotificationCenter *)self _notificationSupportURL];
        v19 = +[NSURL URLWithString:v18];
      }
      else
      {
        v19 = 0;
      }
      v20 = [(IDSFirewallNotificationCenter *)self notificationCenter];
      v21 = [(IDSFirewallNotificationCenter *)self _notificationTitleForService:v11];
      v22 = [(IDSFirewallNotificationCenter *)self _notificationBodyForService:v11 URI:v10];
      v23 = [(IDSFirewallNotificationCenter *)self _notificationIconIdentifierForService:v11];
      [v20 postNotificationWithTitle:v21 body:v22 iconIdentifier:v23 shouldShowSubordinateIcon:1 actionURL:v19];

      uint64_t v17 = v24;
      if (v7) {
        [v24 noteItem:v14];
      }
    }
  }
  else
  {
    uint64_t v14 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not posting firewall notification because command is not initiated by the user {uri: %@, command: %@}", buf, 0x16u);
    }
  }
}

- (IDSUserNotificationsCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (IDSContactsUtilities)contactUtilities
{
  return self->_contactUtilities;
}

- (void)setContactUtilities:(id)a3
{
}

- (IDSRateLimiter)firewallRateLimiter
{
  return self->_firewallRateLimiter;
}

- (void)setFirewallRateLimiter:(id)a3
{
}

- (IDSRateLimiter)firewallAggressiveRateLimiter
{
  return self->_firewallAggressiveRateLimiter;
}

- (void)setFirewallAggressiveRateLimiter:(id)a3
{
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_firewallAggressiveRateLimiter, 0);
  objc_storeStrong((id *)&self->_firewallRateLimiter, 0);
  objc_storeStrong((id *)&self->_contactUtilities, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end