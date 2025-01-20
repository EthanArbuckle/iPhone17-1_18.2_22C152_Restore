@interface FMFFence
+ (BOOL)isAllowedAtLocation:(CLLocationCoordinate2D)a3;
+ (BOOL)supportsSecureCoding;
+ (NSString)genericFriendName;
+ (id)endDateForMuteTimespan:(unint64_t)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isMuted;
- (BOOL)isOnMe;
- (BOOL)isRecurring;
- (BOOL)isRegionAllowed;
- (BOOL)isSupported;
- (BOOL)shouldUseIDSTrigger;
- (CLLocation)location;
- (FMFFence)initWithCoder:(id)a3;
- (FMFFence)initWithDictionary:(id)a3;
- (FMFFence)initWithRecipient:(id)a3 location:(id)a4 placemark:(id)a5 label:(id)a6 trigger:(id)a7 type:(id)a8 locationType:(unint64_t)a9 recurring:(BOOL)a10;
- (FMFPlacemark)placemark;
- (FMFSchedule)schedule;
- (NSArray)followerIds;
- (NSArray)recipients;
- (NSDate)inviteDate;
- (NSDate)muteEndDate;
- (NSDate)timestamp;
- (NSString)acceptanceStatus;
- (NSString)ckRecordName;
- (NSString)ckRecordZoneOwnerName;
- (NSString)createdByIdentifier;
- (NSString)displayLocationName;
- (NSString)friendIdentifier;
- (NSString)identifier;
- (NSString)label;
- (NSString)pendingIdentifier;
- (NSString)trigger;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)handlesForArray:(id)a3;
- (id)localizedNotificationStringForFollower:(id)a3 locationName:(id)a4;
- (id)localizedRequestNotificationStringForFollower:(id)a3 locationName:(id)a4;
- (id)localizedSubtitleStringWithLocationName:(id)a3;
- (id)localizedWillBeNotifiedStringForFollower:(id)a3 locationName:(id)a4;
- (id)locationForDictionary:(id)a3;
- (unint64_t)hash;
- (unint64_t)locationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptanceStatus:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCkRecordName:(id)a3;
- (void)setCkRecordZoneOwnerName:(id)a3;
- (void)setCreatedByIdentifier:(id)a3;
- (void)setFollowerIds:(id)a3;
- (void)setFriendIdentifier:(id)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationType:(unint64_t)a3;
- (void)setMuteEndDate:(id)a3;
- (void)setPendingIdentifier:(id)a3;
- (void)setPlacemark:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRecurring:(BOOL)a3;
- (void)setSchedule:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrigger:(id)a3;
- (void)setType:(id)a3;
- (void)updateFenceLocation:(id)a3 placemark:(id)a4 label:(id)a5 trigger:(id)a6 type:(id)a7 locationType:(unint64_t)a8;
@end

@implementation FMFFence

- (NSString)displayLocationName
{
  v3 = [(FMFFence *)self label];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(FMFFence *)self label];
LABEL_3:
    v6 = 0;
    goto LABEL_11;
  }
  v7 = [(FMFFence *)self placemark];
  if (!v7)
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v11 localizedStringForKey:@"FENCE_GENERIC_LOCATION" value:&stru_26BEE3E40 table:0];

    goto LABEL_3;
  }
  v6 = v7;
  v8 = [v7 streetAddress];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = [v6 streetAddress];
LABEL_10:
    v5 = (__CFString *)v10;
    goto LABEL_11;
  }
  v12 = [v6 streetName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    uint64_t v10 = [v6 streetName];
    goto LABEL_10;
  }
  v15 = [v6 locality];
  uint64_t v16 = [v15 length];

  v17 = [v6 locality];
  v5 = v17;
  if (!v16)
  {
    uint64_t v18 = [(__CFString *)v17 length];

    if (v18)
    {
      uint64_t v10 = [v6 locality];
      goto LABEL_10;
    }
    v19 = [v6 administrativeArea];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      uint64_t v10 = [v6 administrativeArea];
      goto LABEL_10;
    }
    v5 = &stru_26BEE3E40;
  }
LABEL_11:

  return (NSString *)v5;
}

+ (NSString)genericFriendName
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"FENCE_GENERIC_FRIEND" value:&stru_26BEE3E40 table:0];

  return (NSString *)v3;
}

- (id)localizedNotificationStringForFollower:(id)a3 locationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(FMFFence *)self isRecurring];
  if (!v7)
  {
    id v7 = [(FMFFence *)self displayLocationName];
  }
  uint64_t v9 = [(FMFFence *)self trigger];
  if (!v6)
  {
    id v6 = +[FMFFence genericFriendName];
  }
  if ([v9 isEqualToString:@"enter"])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    v12 = @"FENCE_NOTIFY_FRIEND_WHEN_I_ARRIVE_AT_LOCATION";
    uint64_t v13 = @"FENCE_NOTIFY_FRIEND_WHEN_I_ARRIVE_AT_LOCATION_EVERY_TIME";
LABEL_9:
    if (v8) {
      v14 = v13;
    }
    else {
      v14 = v12;
    }
    v15 = [v10 localizedStringForKey:v14 value:&stru_26BEE3E40 table:0];

    objc_msgSend(NSString, "stringWithFormat:", v15, v6, v7);
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  if ([v9 isEqualToString:@"exit"])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    v12 = @"FENCE_NOTIFY_FRIEND_WHEN_I_LEAVE_LOCATION";
    uint64_t v13 = @"FENCE_NOTIFY_FRIEND_WHEN_I_LEAVE_LOCATION_EVERY_TIME";
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"scheduled"])
  {
    uint64_t v18 = [(FMFFence *)self schedule];
    uint64_t v19 = [v18 startHour];

    uint64_t v20 = [(FMFFence *)self schedule];
    uint64_t v21 = [v20 startMin];

    v22 = [(FMFFence *)self schedule];
    uint64_t v23 = [v22 endHour];

    v24 = [(FMFFence *)self schedule];
    uint64_t v25 = [v24 endMin];

    v26 = [(FMFFence *)self schedule];
    uint64_t v27 = [v26 daysOfWeek];

    v15 = +[FMFSchedule localizedTimeStringForHour:v19 andMinute:v21 timeStyle:1];
    if (v19 == v23 && v21 == v25)
    {
      if (v27 == 127)
      {
        v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v29 = [v28 localizedStringForKey:@"FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BY_TIME_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v29, v6, v7, v15);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = +[FMFSchedule localizedDaysOfWeekStringFor:v27];
        v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:@"FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BY_TIME_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v35, v6, v7, v15, v29);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v29 = +[FMFSchedule localizedTimeStringForHour:v23 andMinute:v25 timeStyle:1];
      if (v27 == 127)
      {
        v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v31 = [v30 localizedStringForKey:@"FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BETWEEN_TIMES_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v31, v6, v7, v15, v29);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = +[FMFSchedule localizedDaysOfWeekStringFor:v27];
        v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v33 = [v32 localizedStringForKey:@"FENCE_NOTIFY_FRIEND_WHEN_I_AM_NOT_AT_LOCATION_BETWEEN_TIMES_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v33, v6, v7, v15, v29, v31);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    goto LABEL_13;
  }
  uint64_t v16 = &stru_26BEE3E40;
LABEL_14:

  return v16;
}

- (id)localizedRequestNotificationStringForFollower:(id)a3 locationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(FMFFence *)self isRecurring];
  if (!v7)
  {
    id v7 = [(FMFFence *)self displayLocationName];
  }
  uint64_t v9 = [(FMFFence *)self trigger];
  if (!v6)
  {
    id v6 = +[FMFFence genericFriendName];
  }
  if ([v9 isEqualToString:@"enter"])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v8)
    {
      v11 = @"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARRIVE_AT_LOCATION_EVERY_TIME";
LABEL_11:
      v12 = @"Localizable-TINKER";
      uint64_t v13 = v10;
LABEL_20:
      v24 = [v13 localizedStringForKey:v11 value:&stru_26BEE3E40 table:v12];

      objc_msgSend(NSString, "stringWithFormat:", v24, v6, v7);
      uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
    v11 = @"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARRIVE_AT_LOCATION";
    goto LABEL_19;
  }
  if ([v9 isEqualToString:@"exit"])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v8)
    {
      v11 = @"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_LEAVE_LOCATION_EVERY_TIME";
      goto LABEL_11;
    }
    v11 = @"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_LEAVE_LOCATION";
LABEL_19:
    uint64_t v13 = v10;
    v12 = 0;
    goto LABEL_20;
  }
  if ([v9 isEqualToString:@"scheduled"])
  {
    v14 = [(FMFFence *)self schedule];
    uint64_t v15 = [v14 startHour];

    uint64_t v16 = [(FMFFence *)self schedule];
    uint64_t v17 = [v16 startMin];

    uint64_t v18 = [(FMFFence *)self schedule];
    uint64_t v19 = [v18 endHour];

    uint64_t v20 = [(FMFFence *)self schedule];
    uint64_t v21 = [v20 endMin];

    v22 = [(FMFFence *)self schedule];
    uint64_t v23 = [v22 daysOfWeek];

    v24 = +[FMFSchedule localizedTimeStringForHour:v15 andMinute:v17 timeStyle:1];
    if (v15 == v19 && v17 == v21)
    {
      if (v23 == 127)
      {
        uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v26, v6, v7, v24);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = +[FMFSchedule localizedDaysOfWeekStringFor:v23];
        v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v34 = [v33 localizedStringForKey:@"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v34, v6, v7, v24, v26);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v26 = +[FMFSchedule localizedTimeStringForHour:v19 andMinute:v21 timeStyle:1];
      if (v23 == 127)
      {
        v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v30 = [v29 localizedStringForKey:@"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v30, v6, v7, v24, v26);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = +[FMFSchedule localizedDaysOfWeekStringFor:v23];
        v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v32 = [v31 localizedStringForKey:@"FENCE_FRIEND_REQUESTS_NOTIFICATION_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v32, v6, v7, v24, v26, v30);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    goto LABEL_21;
  }
  uint64_t v27 = &stru_26BEE3E40;
LABEL_22:

  return v27;
}

- (id)localizedWillBeNotifiedStringForFollower:(id)a3 locationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(FMFFence *)self isRecurring];
  if (!v7)
  {
    id v7 = [(FMFFence *)self displayLocationName];
  }
  uint64_t v9 = [(FMFFence *)self trigger];
  if (!v6)
  {
    id v6 = +[FMFFence genericFriendName];
  }
  if ([v9 isEqualToString:@"enter"])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v8)
    {
      v11 = @"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARRIVE_AT_LOCATION_EVERY_TIME";
LABEL_11:
      v12 = @"Localizable-TINKER";
      uint64_t v13 = v10;
LABEL_20:
      v24 = [v13 localizedStringForKey:v11 value:&stru_26BEE3E40 table:v12];

      objc_msgSend(NSString, "stringWithFormat:", v24, v6, v7);
      uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
    v11 = @"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARRIVE_AT_LOCATION";
    goto LABEL_19;
  }
  if ([v9 isEqualToString:@"exit"])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v8)
    {
      v11 = @"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_LEAVE_LOCATION_EVERY_TIME";
      goto LABEL_11;
    }
    v11 = @"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_LEAVE_LOCATION";
LABEL_19:
    uint64_t v13 = v10;
    v12 = 0;
    goto LABEL_20;
  }
  if ([v9 isEqualToString:@"scheduled"])
  {
    v14 = [(FMFFence *)self schedule];
    uint64_t v15 = [v14 startHour];

    uint64_t v16 = [(FMFFence *)self schedule];
    uint64_t v17 = [v16 startMin];

    uint64_t v18 = [(FMFFence *)self schedule];
    uint64_t v19 = [v18 endHour];

    uint64_t v20 = [(FMFFence *)self schedule];
    uint64_t v21 = [v20 endMin];

    v22 = [(FMFFence *)self schedule];
    uint64_t v23 = [v22 daysOfWeek];

    v24 = +[FMFSchedule localizedTimeStringForHour:v15 andMinute:v17 timeStyle:1];
    if (v15 == v19 && v17 == v21)
    {
      if (v23 == 127)
      {
        uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v26, v6, v7, v24);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = +[FMFSchedule localizedDaysOfWeekStringFor:v23];
        v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v34 = [v33 localizedStringForKey:@"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BY_TIME_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v34, v6, v7, v24, v26);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v26 = +[FMFSchedule localizedTimeStringForHour:v19 andMinute:v21 timeStyle:1];
      if (v23 == 127)
      {
        v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v30 = [v29 localizedStringForKey:@"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v30, v6, v7, v24, v26);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = +[FMFSchedule localizedDaysOfWeekStringFor:v23];
        v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v32 = [v31 localizedStringForKey:@"FENCE_FRIEND_WILL_BE_NOTIFIED_WHEN_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v32, v6, v7, v24, v26, v30);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    goto LABEL_21;
  }
  uint64_t v27 = &stru_26BEE3E40;
LABEL_22:

  return v27;
}

- (id)localizedSubtitleStringWithLocationName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FMFFence *)self isRecurring];
  if (!v4)
  {
    id v4 = [(FMFFence *)self displayLocationName];
  }
  id v6 = [(FMFFence *)self trigger];
  if (([v6 isEqualToString:@"enter"] & 1) != 0
    || [v6 isEqualToString:@"exit"])
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = v7;
    if (v5) {
      uint64_t v9 = @"FENCE_NOTIFICATION_LOCATION_AND_EVERY_TIME";
    }
    else {
      uint64_t v9 = @"FENCE_NOTIFICATION_LOCATION_AND_NEXT_TIME";
    }
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_26BEE3E40 table:0];

    objc_msgSend(NSString, "stringWithFormat:", v10, v4);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"scheduled"])
  {
    uint64_t v13 = [(FMFFence *)self schedule];
    uint64_t v14 = [v13 startHour];

    uint64_t v15 = [(FMFFence *)self schedule];
    uint64_t v16 = [v15 startMin];

    uint64_t v17 = [(FMFFence *)self schedule];
    uint64_t v18 = [v17 endHour];

    uint64_t v19 = [(FMFFence *)self schedule];
    uint64_t v20 = [v19 endMin];

    uint64_t v21 = [(FMFFence *)self schedule];
    uint64_t v22 = [v21 daysOfWeek];

    uint64_t v10 = +[FMFSchedule localizedTimeStringForHour:v14 andMinute:v16 timeStyle:1];
    if (v14 == v18 && v16 == v20)
    {
      if (v22 == 127)
      {
        uint64_t v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v24 = [v23 localizedStringForKey:@"FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BY_TIME_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v24, v4, v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = +[FMFSchedule localizedDaysOfWeekStringFor:v22];
        v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v30 = [v29 localizedStringForKey:@"FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BY_TIME_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v30, v4, v10, v24);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v24 = +[FMFSchedule localizedTimeStringForHour:v18 andMinute:v20 timeStyle:1];
      if (v22 == 127)
      {
        uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BETWEEN_TIMES_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v26, v4, v10, v24);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = +[FMFSchedule localizedDaysOfWeekStringFor:v22];
        uint64_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v28 = [v27 localizedStringForKey:@"FENCE_NOTIFICATION_LOCATION_AND_SCHEDULE_BETWEEN_TIMES_ON_DAYSLIST" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];

        objc_msgSend(NSString, "stringWithFormat:", v28, v4, v10, v24, v26);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    goto LABEL_9;
  }
  v11 = &stru_26BEE3E40;
LABEL_10:

  return v11;
}

+ (id)endDateForMuteTimespan:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v4 = [MEMORY[0x263EFF910] now];
    BOOL v5 = [v3 startOfDayForDate:v4];

    id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v7 = [v6 dateByAddingUnit:16 value:1 toDate:v5 options:1024];

    if (v7)
    {
      BOOL v8 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v9 = [v8 dateByAddingUnit:64 value:-1 toDate:v7 options:4];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (FMFFence)initWithRecipient:(id)a3 location:(id)a4 placemark:(id)a5 label:(id)a6 trigger:(id)a7 type:(id)a8 locationType:(unint64_t)a9 recurring:(BOOL)a10
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v22 = [(FMFFence *)self init];
  if (v22)
  {
    uint64_t v23 = LogCategory_Daemon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v16;
      _os_log_impl(&dword_20AD87000, v23, OS_LOG_TYPE_DEFAULT, "FMFFence: initWithRecipient %@", (uint8_t *)&v28, 0xCu);
    }

    [(FMFFence *)v22 setRecipients:v16];
    [(FMFFence *)v22 setLocation:v17];
    [(FMFFence *)v22 setPlacemark:v18];
    [(FMFFence *)v22 setLabel:v19];
    [(FMFFence *)v22 setTrigger:v20];
    [(FMFFence *)v22 setType:v21];
    [(FMFFence *)v22 setLocationType:a9];
    [(FMFFence *)v22 setRecurring:a10];
    v24 = [MEMORY[0x263EFF910] date];
    [(FMFFence *)v22 setTimestamp:v24];

    uint64_t v25 = objc_opt_new();
    v26 = [v25 UUIDString];
    [(FMFFence *)v22 setPendingIdentifier:v26];

    [(FMFFence *)v22 setActive:1];
    [(FMFFence *)v22 setFromMe:1];
  }

  return v22;
}

- (FMFFence)initWithDictionary:(id)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(FMFFence *)self init];
  if (!v5) {
    goto LABEL_100;
  }
  id v6 = [v4 objectForKeyedSubscript:@"isOn"];
  id v7 = [MEMORY[0x263EFF9D0] null];
  if (v6 == v7)
  {
    v124 = 0;
  }
  else
  {
    v124 = [v4 objectForKeyedSubscript:@"isOn"];
  }

  BOOL v8 = [v4 objectForKeyedSubscript:@"onetimeonly"];
  uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  if (v8 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v4 objectForKeyedSubscript:@"onetimeonly"];
  }

  v11 = [v4 objectForKeyedSubscript:@"phoneNumbers"];
  v12 = [MEMORY[0x263EFF9D0] null];
  id v13 = (id)MEMORY[0x263EFFA68];
  if (v11 != v12)
  {
    uint64_t v14 = [v4 objectForKeyedSubscript:@"phoneNumbers"];
    uint64_t v15 = (void *)v14;
    if (v14) {
      id v16 = (void *)v14;
    }
    else {
      id v16 = v13;
    }
    id v13 = v16;
  }
  id v17 = [v4 objectForKeyedSubscript:@"emails"];
  id v18 = [MEMORY[0x263EFF9D0] null];
  id v19 = (void *)MEMORY[0x263EFFA68];
  if (v17 == v18)
  {
    id v24 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v20 = [v4 objectForKeyedSubscript:@"emails"];
    id v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = (void *)v20;
    }
    else {
      uint64_t v22 = v19;
    }
    id v23 = v22;

    id v24 = v23;
  }

  uint64_t v25 = [v13 arrayByAddingObjectsFromArray:v24];
  v26 = [v4 objectForKeyedSubscript:@"updateTimestamp"];
  uint64_t v27 = [MEMORY[0x263EFF9D0] null];
  if (v26 == v27)
  {
    v123 = 0;
  }
  else
  {
    v123 = [v4 objectForKeyedSubscript:@"updateTimestamp"];
  }

  int v28 = [v4 objectForKeyedSubscript:@"locationType"];
  id v29 = [MEMORY[0x263EFF9D0] null];
  v121 = v13;
  if (v28 == v29)
  {
    v122 = 0;
  }
  else
  {
    v122 = [v4 objectForKeyedSubscript:@"locationType"];
  }
  v120 = v24;

  -[FMFFence setActive:](v5, "setActive:", [v124 BOOLValue]);
  uint64_t v30 = [v4 objectForKeyedSubscript:@"createdById"];
  v31 = [MEMORY[0x263EFF9D0] null];
  if (v30 == v31)
  {
    [(FMFFence *)v5 setCreatedByIdentifier:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v32 = [v4 objectForKeyedSubscript:@"createdById"];
    v33 = (void *)v32;
    if (v32) {
      v34 = (__CFString *)v32;
    }
    else {
      v34 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setCreatedByIdentifier:v34];
  }
  v35 = [v4 objectForKeyedSubscript:@"followerIds"];
  v36 = [MEMORY[0x263EFF9D0] null];
  if (v35 == v36)
  {
    [(FMFFence *)v5 setFollowerIds:MEMORY[0x263EFFA68]];
  }
  else
  {
    uint64_t v37 = [v4 objectForKeyedSubscript:@"followerIds"];
    v38 = (void *)v37;
    if (v37) {
      uint64_t v39 = v37;
    }
    else {
      uint64_t v39 = (uint64_t)v19;
    }
    [(FMFFence *)v5 setFollowerIds:v39];
  }
  v40 = [v4 objectForKeyedSubscript:@"friendId"];
  v41 = [MEMORY[0x263EFF9D0] null];
  if (v40 == v41)
  {
    [(FMFFence *)v5 setFriendIdentifier:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v42 = [v4 objectForKeyedSubscript:@"friendId"];
    v43 = (void *)v42;
    if (v42) {
      v44 = (__CFString *)v42;
    }
    else {
      v44 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setFriendIdentifier:v44];
  }
  v45 = [v4 objectForKeyedSubscript:@"id"];
  v46 = [MEMORY[0x263EFF9D0] null];
  if (v45 == v46)
  {
    [(FMFFence *)v5 setIdentifier:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v47 = [v4 objectForKeyedSubscript:@"id"];
    v48 = (void *)v47;
    if (v47) {
      v49 = (__CFString *)v47;
    }
    else {
      v49 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setIdentifier:v49];
  }
  v50 = [v4 objectForKeyedSubscript:@"label"];
  v51 = [MEMORY[0x263EFF9D0] null];
  if (v50 == v51)
  {
    [(FMFFence *)v5 setLabel:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v52 = [v4 objectForKeyedSubscript:@"label"];
    v53 = (void *)v52;
    if (v52) {
      v54 = (__CFString *)v52;
    }
    else {
      v54 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setLabel:v54];
  }
  v55 = [(FMFFence *)v5 locationForDictionary:v4];
  [(FMFFence *)v5 setLocation:v55];

  v56 = [FMFPlacemark alloc];
  v57 = [v4 objectForKeyedSubscript:@"fullAddress"];
  v58 = [MEMORY[0x263EFF9D0] null];
  if (v57 == v58)
  {
    v59 = 0;
  }
  else
  {
    v59 = [v4 objectForKeyedSubscript:@"fullAddress"];
  }
  v60 = [(FMFPlacemark *)v56 initWithDictionary:v59];
  [(FMFFence *)v5 setPlacemark:v60];

  if (v57 != v58) {
  v61 = [(FMFFence *)v5 handlesForArray:v25];
  }
  [(FMFFence *)v5 setRecipients:v61];

  -[FMFFence setRecurring:](v5, "setRecurring:", [v10 BOOLValue] ^ 1);
  v62 = (void *)MEMORY[0x263EFF910];
  [v123 doubleValue];
  v64 = [v62 dateWithTimeIntervalSince1970:v63 / 1000.0];
  [(FMFFence *)v5 setTimestamp:v64];

  v65 = [v4 objectForKeyedSubscript:@"trigger"];
  v66 = [MEMORY[0x263EFF9D0] null];
  if (v65 == v66)
  {
    [(FMFFence *)v5 setTrigger:0];
  }
  else
  {
    v67 = [v4 objectForKeyedSubscript:@"trigger"];
    [(FMFFence *)v5 setTrigger:v67];
  }
  -[FMFFence setLocationType:](v5, "setLocationType:", (int)[v122 intValue]);
  v68 = [v4 objectForKeyedSubscript:@"ckRecordName"];
  v69 = [MEMORY[0x263EFF9D0] null];
  if (v68 == v69)
  {
    [(FMFFence *)v5 setCkRecordName:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v70 = [v4 objectForKeyedSubscript:@"ckRecordName"];
    v71 = (void *)v70;
    if (v70) {
      v72 = (__CFString *)v70;
    }
    else {
      v72 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setCkRecordName:v72];
  }
  v73 = [v4 objectForKeyedSubscript:@"ckRecordZoneOwnerName"];
  v74 = [MEMORY[0x263EFF9D0] null];
  if (v73 == v74)
  {
    [(FMFFence *)v5 setCkRecordZoneOwnerName:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v75 = [v4 objectForKeyedSubscript:@"ckRecordZoneOwnerName"];
    v76 = (void *)v75;
    if (v75) {
      v77 = (__CFString *)v75;
    }
    else {
      v77 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setCkRecordZoneOwnerName:v77];
  }
  v78 = [v4 objectForKeyedSubscript:@"acceptanceStatus"];
  v79 = [MEMORY[0x263EFF9D0] null];
  if (v78 == v79)
  {
    [(FMFFence *)v5 setAcceptanceStatus:&stru_26BEE3E40];
  }
  else
  {
    uint64_t v80 = [v4 objectForKeyedSubscript:@"acceptanceStatus"];
    v81 = (void *)v80;
    if (v80) {
      v82 = (__CFString *)v80;
    }
    else {
      v82 = &stru_26BEE3E40;
    }
    [(FMFFence *)v5 setAcceptanceStatus:v82];
  }
  v83 = [v4 objectForKeyedSubscript:@"type"];
  v84 = [MEMORY[0x263EFF9D0] null];
  if (v83 == v84)
  {
    v85 = 0;
  }
  else
  {
    v85 = [v4 objectForKeyedSubscript:@"type"];
  }

  v86 = [v85 lowercaseString];
  v87 = @"NotifyMe";
  v88 = [@"NotifyMe" lowercaseString];
  char v89 = [v86 isEqualToString:v88];

  if (v89) {
    goto LABEL_86;
  }
  v90 = [v85 lowercaseString];
  v87 = @"NotifyOthers";
  v91 = [@"NotifyOthers" lowercaseString];
  int v92 = [v90 isEqualToString:v91];

  if (v92) {
LABEL_86:
  }
    [(FMFFence *)v5 setType:v87];
  v93 = [v4 objectForKeyedSubscript:@"fenceTimeRange"];
  uint64_t v94 = [MEMORY[0x263EFF9D0] null];
  if (v93 == (void *)v94)
  {
  }
  else
  {
    v95 = (void *)v94;
    v96 = [v4 objectForKeyedSubscript:@"fenceTimeRange"];

    if (v96)
    {
      v97 = [[FMFSchedule alloc] initWithDictionary:v96];
      [(FMFFence *)v5 setSchedule:v97];

      goto LABEL_92;
    }
  }
  [(FMFFence *)v5 setSchedule:0];
  v96 = 0;
LABEL_92:
  v119 = v85;
  v98 = [v4 objectForKeyedSubscript:@"muteEndDate"];
  v99 = [MEMORY[0x263EFF9D0] null];
  if (v98 == v99)
  {
    [(FMFFence *)v5 setMuteEndDate:0];
  }
  else
  {
    v100 = [v4 objectForKeyedSubscript:@"muteEndDate"];
    [(FMFFence *)v5 setMuteEndDate:v100];
  }
  uint64_t v101 = [(FMFFence *)v5 trigger];
  if (!v101) {
    goto LABEL_103;
  }
  v102 = (void *)v101;
  uint64_t v103 = [(FMFFence *)v5 type];
  if (!v103)
  {
LABEL_102:

    goto LABEL_103;
  }
  v104 = (void *)v103;
  uint64_t v105 = [(FMFFence *)v5 location];
  if (!v105)
  {

    goto LABEL_102;
  }
  v106 = (void *)v105;
  v107 = [(FMFFence *)v5 timestamp];

  if (v107)
  {

LABEL_100:
    v108 = v5;
    goto LABEL_106;
  }
LABEL_103:
  v109 = LogCategory_Daemon();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v110 = [(FMFFence *)v5 identifier];
    v111 = [(FMFFence *)v5 trigger];
    v112 = [(FMFFence *)v5 type];
    [(FMFFence *)v5 location];
    v118 = v96;
    v113 = v10;
    v115 = v114 = v25;
    v116 = [(FMFFence *)v5 timestamp];
    *(_DWORD *)buf = 138413314;
    v126 = v110;
    __int16 v127 = 2112;
    v128 = v111;
    __int16 v129 = 2112;
    v130 = v112;
    __int16 v131 = 2112;
    v132 = v115;
    __int16 v133 = 2112;
    v134 = v116;
    _os_log_impl(&dword_20AD87000, v109, OS_LOG_TYPE_DEFAULT, "FMFFence: Cannot initialize fence with nil value (Identifier:%@, trigger: %@, type: %@, location: %@, timestamp: %@)", buf, 0x34u);

    uint64_t v25 = v114;
    uint64_t v10 = v113;
    v96 = v118;
  }
  v108 = 0;
LABEL_106:

  return v108;
}

- (FMFFence)initWithCoder:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(FMFFence *)self init];
  if (!v5) {
    goto LABEL_23;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAddress"];
  BOOL v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"recipients"];

  -[FMFFence setActive:](v5, "setActive:", [v4 decodeBoolForKey:@"isOn"]);
  -[FMFFence setFromMe:](v5, "setFromMe:", [v4 decodeBoolForKey:@"fromMe"]);
  -[FMFFence setRecurring:](v5, "setRecurring:", [v4 decodeBoolForKey:@"onetimeonly"]);
  uint64_t v12 = [v4 decodeObjectForKey:@"createdById"];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_26BEE3E40;
  }
  [(FMFFence *)v5 setCreatedByIdentifier:v14];

  uint64_t v15 = [v4 decodeObjectForKey:@"followerIds"];
  [(FMFFence *)v5 setFollowerIds:v15];

  uint64_t v16 = [v4 decodeObjectForKey:@"friendId"];
  id v17 = (void *)v16;
  if (v16) {
    id v18 = (__CFString *)v16;
  }
  else {
    id v18 = &stru_26BEE3E40;
  }
  [(FMFFence *)v5 setFriendIdentifier:v18];

  uint64_t v19 = [v4 decodeObjectForKey:@"id"];
  uint64_t v20 = (void *)v19;
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  else {
    id v21 = &stru_26BEE3E40;
  }
  [(FMFFence *)v5 setIdentifier:v21];

  uint64_t v22 = [v4 decodeObjectForKey:@"label"];
  id v23 = (void *)v22;
  if (v22) {
    id v24 = (__CFString *)v22;
  }
  else {
    id v24 = &stru_26BEE3E40;
  }
  [(FMFFence *)v5 setLabel:v24];

  uint64_t v25 = [v4 decodeObjectForKey:@"updateTimestamp"];
  [(FMFFence *)v5 setTimestamp:v25];

  v26 = [v4 decodeObjectForKey:@"trigger"];
  [(FMFFence *)v5 setTrigger:v26];

  -[FMFFence setLocationType:](v5, "setLocationType:", [v4 decodeIntegerForKey:@"locationType"]);
  uint64_t v27 = [v4 decodeObjectForKey:@"type"];
  int v28 = @"NotifyMe";
  if (([v27 isEqualToString:@"NotifyMe"] & 1) != 0
    || (int v28 = @"NotifyOthers", [v27 isEqualToString:@"NotifyOthers"]))
  {
    [(FMFFence *)v5 setType:v28];
  }
  id v29 = [v4 decodeObjectForKey:@"acceptanceStatus"];
  [(FMFFence *)v5 setAcceptanceStatus:v29];

  uint64_t v30 = [v4 decodeObjectForKey:@"ckRecordName"];
  [(FMFFence *)v5 setCkRecordName:v30];

  v31 = [v4 decodeObjectForKey:@"ckRecordZoneOwnerName"];
  [(FMFFence *)v5 setCkRecordZoneOwnerName:v31];

  uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fenceTimeRange"];
  [(FMFFence *)v5 setSchedule:v32];

  v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muteEndDate"];
  [(FMFFence *)v5 setMuteEndDate:v33];

  uint64_t v34 = [(FMFFence *)v5 trigger];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(FMFFence *)v5 type];

    if (v36)
    {
      if (v6 && v7 && v11)
      {
        [(FMFFence *)v5 setLocation:v6];
        [(FMFFence *)v5 setPlacemark:v7];
        [(FMFFence *)v5 setRecipients:v11];

LABEL_23:
        uint64_t v37 = v5;
        goto LABEL_27;
      }
    }
  }
  v38 = LogCategory_Daemon();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = [(FMFFence *)v5 identifier];
    [(FMFFence *)v5 trigger];
    v40 = v48 = v7;
    v41 = [(FMFFence *)v5 type];
    [(FMFFence *)v5 location];
    uint64_t v42 = v47 = v27;
    [(FMFFence *)v5 timestamp];
    v43 = v11;
    v45 = v44 = v6;
    *(_DWORD *)buf = 138413314;
    v50 = v39;
    __int16 v51 = 2112;
    uint64_t v52 = v40;
    __int16 v53 = 2112;
    v54 = v41;
    __int16 v55 = 2112;
    v56 = v42;
    __int16 v57 = 2112;
    v58 = v45;
    _os_log_impl(&dword_20AD87000, v38, OS_LOG_TYPE_DEFAULT, "FMFFence: Cannot initialize fence with nil value (Identifier:%@, trigger: %@, type: %@, location: %@, timestamp: %@)", buf, 0x34u);

    id v6 = v44;
    v11 = v43;

    uint64_t v27 = v47;
    id v7 = v48;
  }
  uint64_t v37 = 0;
LABEL_27:

  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL active = self->_active;
  id v5 = a3;
  [v5 encodeBool:active forKey:@"isOn"];
  [v5 encodeBool:self->_fromMe forKey:@"fromMe"];
  [v5 encodeBool:self->_recurring forKey:@"onetimeonly"];
  [v5 encodeObject:self->_createdByIdentifier forKey:@"createdById"];
  [v5 encodeObject:self->_followerIds forKey:@"followerIds"];
  [v5 encodeObject:self->_friendIdentifier forKey:@"friendId"];
  [v5 encodeObject:self->_identifier forKey:@"id"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_placemark forKey:@"fullAddress"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
  [v5 encodeObject:self->_timestamp forKey:@"updateTimestamp"];
  [v5 encodeObject:self->_trigger forKey:@"trigger"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_locationType forKey:@"locationType"];
  [v5 encodeObject:self->_acceptanceStatus forKey:@"acceptanceStatus"];
  [v5 encodeObject:self->_ckRecordName forKey:@"ckRecordName"];
  [v5 encodeObject:self->_ckRecordZoneOwnerName forKey:@"ckRecordZoneOwnerName"];
  [v5 encodeObject:self->_schedule forKey:@"fenceTimeRange"];
  [v5 encodeObject:self->_muteEndDate forKey:@"muteEndDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isOnMe
{
  BOOL v3 = [(FMFFence *)self isFromMe];
  id v4 = [(FMFFence *)self type];
  id v5 = v4;
  if (v3) {
    id v6 = @"NotifyOthers";
  }
  else {
    id v6 = @"NotifyMe";
  }
  char v7 = [v4 isEqualToString:v6];

  return v7;
}

- (BOOL)shouldUseIDSTrigger
{
  id v4 = [(FMFFence *)self type];
  int v5 = [v4 isEqualToString:@"NotifyMe"];
  if (!v5) {
    goto LABEL_6;
  }
  if (![(FMFFence *)self isRecurring])
  {
    v2 = [(FMFFence *)self trigger];
    if ([v2 isEqualToString:@"scheduled"])
    {
      char v6 = 1;
      goto LABEL_10;
    }
LABEL_6:
    char v7 = [(FMFFence *)self type];
    if ([v7 isEqualToString:@"NotifyOthers"])
    {
      BOOL v8 = [(FMFFence *)self trigger];
      char v6 = [v8 isEqualToString:@"scheduled"];

      if ((v5 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {

      char v6 = 0;
      if (!v5) {
        goto LABEL_11;
      }
    }
LABEL_10:

    goto LABEL_11;
  }
  char v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)isMuted
{
  BOOL v3 = [(FMFFence *)self muteEndDate];

  if (v3)
  {
    id v4 = [(FMFFence *)self muteEndDate];
    int v5 = [MEMORY[0x263EFF910] now];
    uint64_t v6 = [v4 compare:v5];

    if (v6 == 1) {
      return 1;
    }
    [(FMFFence *)self setMuteEndDate:0];
  }
  return 0;
}

- (NSDate)inviteDate
{
  BOOL v3 = [(FMFFence *)self trigger];
  int v4 = [v3 isEqualToString:@"scheduled"];

  if (v4)
  {
    int v5 = [(FMFFence *)self schedule];
    uint64_t v6 = [(FMFFence *)self timestamp];
    char v7 = [v5 nextStartDateFrom:v6 options:1024];
  }
  else
  {
    char v7 = 0;
  }

  return (NSDate *)v7;
}

- (BOOL)isSupported
{
  return 1;
}

- (BOOL)isRegionAllowed
{
  BOOL v3 = objc_opt_class();
  int v4 = [(FMFFence *)self location];
  [v4 coordinate];
  LOBYTE(v3) = objc_msgSend(v3, "isAllowedAtLocation:");

  return (char)v3;
}

+ (BOOL)isAllowedAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  int v5 = GEOSouthKoreaRegion();
  char v6 = objc_msgSend(v5, "containsCoordinate:", latitude, longitude) ^ 1;

  return v6;
}

- (void)updateFenceLocation:(id)a3 placemark:(id)a4 label:(id)a5 trigger:(id)a6 type:(id)a7 locationType:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  [(FMFFence *)self setLocation:a3];
  [(FMFFence *)self setPlacemark:v17];

  [(FMFFence *)self setLabel:v16];
  [(FMFFence *)self setTrigger:v15];

  [(FMFFence *)self setType:v14];

  [(FMFFence *)self setLocationType:a8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setActive:self->_active];
  [v4 setCreatedByIdentifier:self->_createdByIdentifier];
  [v4 setFollowerIds:self->_followerIds];
  [v4 setFriendIdentifier:self->_friendIdentifier];
  [v4 setIdentifier:self->_identifier];
  [v4 setLabel:self->_label];
  [v4 setLocation:self->_location];
  [v4 setPlacemark:self->_placemark];
  [v4 setRecipients:self->_recipients];
  [v4 setRecurring:self->_recurring];
  [v4 setTimestamp:self->_timestamp];
  [v4 setTrigger:self->_trigger];
  [v4 setType:self->_type];
  [v4 setLocationType:self->_locationType];
  int v5 = (void *)[(FMFSchedule *)self->_schedule copy];
  [v4 setSchedule:v5];

  char v6 = (void *)[(NSDate *)self->_muteEndDate copy];
  [v4 setMuteEndDate:v6];

  [v4 setAcceptanceStatus:self->_acceptanceStatus];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    char v6 = [(FMFFence *)self identifier];
    char v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v9 = [(FMFFence *)self pendingIdentifier];
      uint64_t v10 = [v5 pendingIdentifier];
      char v8 = [v9 isEqualToString:v10];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  BOOL v3 = [(FMFFence *)self identifier];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 hash];
  }
  else
  {
    char v6 = [(FMFFence *)self pendingIdentifier];
    unint64_t v5 = [v6 hash];
  }
  return v5;
}

- (id)locationForDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"latitude"];
  unint64_t v5 = [MEMORY[0x263EFF9D0] null];
  if (v4 == v5)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = [v3 objectForKeyedSubscript:@"latitude"];
  }

  char v7 = [v3 objectForKeyedSubscript:@"longitude"];
  char v8 = [MEMORY[0x263EFF9D0] null];
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v3 objectForKeyedSubscript:@"longitude"];
  }

  uint64_t v10 = [v3 objectForKeyedSubscript:@"radius"];
  v11 = [MEMORY[0x263EFF9D0] null];
  if (v10 == v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v3 objectForKeyedSubscript:@"radius"];
  }

  id v13 = 0;
  if (v6 && v9 && v12)
  {
    [v6 doubleValue];
    CLLocationDegrees v15 = v14;
    [v9 doubleValue];
    CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v15, v16);
    id v18 = objc_alloc(MEMORY[0x263F00A50]);
    [v12 doubleValue];
    double v20 = v19;
    id v21 = [MEMORY[0x263EFF910] date];
    id v13 = objc_msgSend(v18, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v21, v17.latitude, v17.longitude, 0.0, v20, -1.0);
  }

  return v13;
}

- (id)handlesForArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[FMFHandle handleWithId:](FMFHandle, "handleWithId:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  uint64_t v22 = NSString;
  id v21 = [(FMFFence *)self identifier];
  BOOL v20 = [(FMFFence *)self isActive];
  double v19 = [(FMFFence *)self location];
  unint64_t v18 = [(FMFFence *)self locationType];
  id v23 = [(FMFFence *)self label];
  uint64_t v17 = [(FMFFence *)self type];
  long long v12 = [(FMFFence *)self trigger];
  BOOL v15 = [(FMFFence *)self isRecurring];
  BOOL v13 = [(FMFFence *)self isFromMe];
  long long v14 = [(FMFFence *)self friendIdentifier];
  v11 = [(FMFFence *)self recipients];
  id v3 = [(FMFFence *)self followerIds];
  CLLocationDegrees v16 = [(FMFFence *)self schedule];
  id v4 = [v16 description];
  id v5 = [(FMFFence *)self muteEndDate];
  uint64_t v6 = [(FMFFence *)self ckRecordName];
  uint64_t v7 = [(FMFFence *)self ckRecordZoneOwnerName];
  uint64_t v8 = [(FMFFence *)self acceptanceStatus];
  objc_msgSend(v22, "stringWithFormat:", @"<FMFFence 0x%lX: identifier: %@, isActive: %d, location: %@,  locationType: %ld, label: %@, type: %@, trigger: %@, isRecurring: %d, isFromMe: %d, friendIdentifier: %@, recipient(s): %@, followerId(s): %@, schedule: %@, muteEndDate: %@, ckRecordName: %@ ckRecordZoneOwnerName: %@ acceptanceStatus: %@>", self, v21, v20, v19, v18, v23, v17, v12, v15, v13, v14, v11, v3, v4, v5, v6,
    v7,
  uint64_t v9 = v8);

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (FMFPlacemark)placemark
{
  return self->_placemark;
}

- (void)setPlacemark:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)followerIds
{
  return self->_followerIds;
}

- (void)setFollowerIds:(id)a3
{
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unint64_t)a3
{
  self->_locationType = a3;
}

- (NSString)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_BOOL active = a3;
}

- (BOOL)isRecurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (FMFSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (NSDate)muteEndDate
{
  return self->_muteEndDate;
}

- (void)setMuteEndDate:(id)a3
{
}

- (NSString)ckRecordName
{
  return self->_ckRecordName;
}

- (void)setCkRecordName:(id)a3
{
}

- (NSString)ckRecordZoneOwnerName
{
  return self->_ckRecordZoneOwnerName;
}

- (void)setCkRecordZoneOwnerName:(id)a3
{
}

- (NSString)friendIdentifier
{
  return self->_friendIdentifier;
}

- (void)setFriendIdentifier:(id)a3
{
}

- (NSString)createdByIdentifier
{
  return self->_createdByIdentifier;
}

- (void)setCreatedByIdentifier:(id)a3
{
}

- (NSString)pendingIdentifier
{
  return self->_pendingIdentifier;
}

- (void)setPendingIdentifier:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_pendingIdentifier, 0);
  objc_storeStrong((id *)&self->_createdByIdentifier, 0);
  objc_storeStrong((id *)&self->_friendIdentifier, 0);
  objc_storeStrong((id *)&self->_ckRecordZoneOwnerName, 0);
  objc_storeStrong((id *)&self->_ckRecordName, 0);
  objc_storeStrong((id *)&self->_muteEndDate, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_acceptanceStatus, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_followerIds, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end