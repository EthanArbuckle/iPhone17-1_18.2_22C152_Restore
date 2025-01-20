@interface CTSuppServicesNotificationData
- (id)_linePresentationStringForValueNumber:(id)a3;
- (id)callBarringFacilityString;
- (id)callClassString;
- (id)callForwardingReasonString;
- (id)callingLineIDRestrictionString;
- (id)callingLinePresentationString;
- (id)callingNamePresentationString;
- (id)connectedLineIDRestrictionString;
- (id)connectedLinePresentationString;
- (id)enabledString;
- (id)mmiProcedureString;
- (id)ssServiceTypeString;
@end

@implementation CTSuppServicesNotificationData

- (id)callClassString
{
  v2 = [(CTSuppServicesNotificationData *)self callClass];
  v3 = v2;
  if (!v2)
  {
    v5 = &stru_100018540;
    goto LABEL_19;
  }
  int v4 = [v2 intValue];
  v5 = &stru_100018540;
  if (v4 > 15)
  {
    if (v4 > 63)
    {
      if (v4 == 64)
      {
        v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v7 = v6;
        CFStringRef v8 = @"Packet Access";
      }
      else
      {
        if (v4 != 128) {
          goto LABEL_19;
        }
        v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v7 = v6;
        CFStringRef v8 = @"Pad Access";
      }
    }
    else if (v4 == 16)
    {
      v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v7 = v6;
      CFStringRef v8 = @"Sync Data Circuit";
    }
    else
    {
      if (v4 != 32) {
        goto LABEL_19;
      }
      v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
      v7 = v6;
      CFStringRef v8 = @"Async Data Circuit";
    }
LABEL_18:
    v5 = [v6 localizedStringForKey:v8 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
    switch(v4)
    {
      case 1:
        v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v7 = v6;
        CFStringRef v8 = @"Voice";
        goto LABEL_18;
      case 2:
        v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v7 = v6;
        CFStringRef v8 = @"Data";
        goto LABEL_18;
      case 4:
        v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v7 = v6;
        CFStringRef v8 = @"Fax";
        goto LABEL_18;
      case 8:
        v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v7 = v6;
        CFStringRef v8 = @"SMS";
        goto LABEL_18;
      default:
        break;
    }
  }
LABEL_19:

  return v5;
}

- (id)callForwardingReasonString
{
  v2 = [(CTSuppServicesNotificationData *)self callForwardingReason];
  v3 = v2;
  if (v2)
  {
    switch([v2 intValue])
    {
      case 0u:
        int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"On All Calls";
        break;
      case 1u:
        int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"When Busy";
        break;
      case 2u:
        int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"When Unanswered";
        break;
      case 3u:
        int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"When Unreachable";
        break;
      case 4u:
        int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Calls";
        break;
      case 5u:
        int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Conditional Calls";
        break;
      default:
        goto LABEL_4;
    }
    v7 = [v4 localizedStringForKey:v6 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
LABEL_4:
    v7 = &stru_100018540;
  }

  return v7;
}

- (id)callingLinePresentationString
{
  v3 = [(CTSuppServicesNotificationData *)self callingLinePresentation];
  int v4 = [(CTSuppServicesNotificationData *)self _linePresentationStringForValueNumber:v3];

  return v4;
}

- (id)connectedLinePresentationString
{
  v3 = [(CTSuppServicesNotificationData *)self connectedLinePresentation];
  int v4 = [(CTSuppServicesNotificationData *)self _linePresentationStringForValueNumber:v3];

  return v4;
}

- (id)_linePresentationStringForValueNumber:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    switch([v3 intValue])
    {
      case 0u:
        v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        CFStringRef v6 = v5;
        CFStringRef v7 = @"Disabled";
        break;
      case 1u:
        v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        CFStringRef v6 = v5;
        CFStringRef v7 = @"Enabled";
        break;
      case 2u:
        v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        CFStringRef v6 = v5;
        CFStringRef v7 = @"Not Available";
        break;
      case 3u:
        v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        CFStringRef v6 = v5;
        CFStringRef v7 = @"Unknown";
        break;
      default:
        goto LABEL_4;
    }
    CFStringRef v8 = [v5 localizedStringForKey:v7 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
LABEL_4:
    CFStringRef v8 = &stru_100018540;
  }

  return v8;
}

- (id)connectedLineIDRestrictionString
{
  v2 = [(CTSuppServicesNotificationData *)self connectedLineIdRestriction];
  id v3 = v2;
  if (!v2) {
    goto LABEL_6;
  }
  unsigned int v4 = [v2 intValue];
  if (v4 == 2)
  {
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Unknown";
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Available";
    goto LABEL_9;
  }
  if (v4)
  {
LABEL_6:
    CFStringRef v8 = &stru_100018540;
    goto LABEL_10;
  }
  v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  CFStringRef v6 = v5;
  CFStringRef v7 = @"Not Available";
LABEL_9:
  CFStringRef v8 = [v5 localizedStringForKey:v7 value:&stru_100018540 table:@"SIMToolkitUI"];

LABEL_10:

  return v8;
}

- (id)enabledString
{
  v2 = [(CTSuppServicesNotificationData *)self enabled];
  id v3 = v2;
  if (v2)
  {
    unsigned int v4 = [v2 BOOLValue];
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    CFStringRef v6 = v5;
    if (v4) {
      CFStringRef v7 = @"Enabled";
    }
    else {
      CFStringRef v7 = @"Disabled";
    }
    CFStringRef v8 = [v5 localizedStringForKey:v7 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
    CFStringRef v8 = &stru_100018540;
  }

  return v8;
}

- (id)mmiProcedureString
{
  v2 = [(CTSuppServicesNotificationData *)self mmiProcedure];
  id v3 = v2;
  if (v2)
  {
    switch([v2 intValue])
    {
      case 1u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Activation";
        break;
      case 2u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Deactivation";
        break;
      case 3u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Interrogation";
        break;
      case 4u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Registration";
        break;
      case 5u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Erasure";
        break;
      default:
        goto LABEL_4;
    }
    CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
LABEL_4:
    CFStringRef v7 = &stru_100018540;
  }

  return v7;
}

- (id)ssServiceTypeString
{
  v2 = [(CTSuppServicesNotificationData *)self supplementaryServiceType];
  if (!v2) {
    goto LABEL_3;
  }
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  unsigned int v4 = [v3 localizedStringForKey:@"Type %d" value:&stru_100018540 table:@"SIMToolkitUI"];
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v2 intValue]);

  if (!v5)
  {
LABEL_3:
    CFStringRef v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    v5 = [v6 localizedStringForKey:@"No Service Specified" value:&stru_100018540 table:@"SIMToolkitUI"];
  }

  return v5;
}

- (id)callingNamePresentationString
{
  v2 = [(CTSuppServicesNotificationData *)self callingNamePresentation];
  id v3 = v2;
  if (!v2) {
    goto LABEL_6;
  }
  unsigned int v4 = [v2 intValue];
  if (v4 == 2)
  {
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Unknown";
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Enabled";
    goto LABEL_9;
  }
  if (v4)
  {
LABEL_6:
    CFStringRef v8 = &stru_100018540;
    goto LABEL_10;
  }
  v5 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  CFStringRef v6 = v5;
  CFStringRef v7 = @"Disabled";
LABEL_9:
  CFStringRef v8 = [v5 localizedStringForKey:v7 value:&stru_100018540 table:@"SIMToolkitUI"];

LABEL_10:

  return v8;
}

- (id)callBarringFacilityString
{
  v2 = [(CTSuppServicesNotificationData *)self callBarringFacility];
  id v3 = v2;
  if (v2)
  {
    switch([v2 intValue])
    {
      case 0u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Outgoing";
        break;
      case 1u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Outgoing International";
        break;
      case 2u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Outgoing International, Except Home Country";
        break;
      case 3u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Incoming";
        break;
      case 4u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Incoming While Roaming Outside Home Country";
        break;
      case 5u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Incoming, Not On SIM";
        break;
      case 6u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Services";
        break;
      case 7u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Outgoing Services";
        break;
      case 8u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"All Incoming Services";
        break;
      default:
        goto LABEL_4;
    }
    CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
LABEL_4:
    CFStringRef v7 = &stru_100018540;
  }

  return v7;
}

- (id)callingLineIDRestrictionString
{
  v2 = [(CTSuppServicesNotificationData *)self callingLineIdRestriction];
  id v3 = v2;
  if (v2)
  {
    switch([v2 intValue])
    {
      case 0u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Disabled";
        break;
      case 1u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Enabled";
        break;
      case 2u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Network Controlled";
        break;
      case 3u:
        unsigned int v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v5 = v4;
        CFStringRef v6 = @"Unknown";
        break;
      default:
        goto LABEL_4;
    }
    CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  else
  {
LABEL_4:
    CFStringRef v7 = &stru_100018540;
  }

  return v7;
}

@end