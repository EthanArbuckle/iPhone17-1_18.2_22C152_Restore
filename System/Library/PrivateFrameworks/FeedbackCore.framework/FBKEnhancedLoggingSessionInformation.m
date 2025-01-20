@interface FBKEnhancedLoggingSessionInformation
+ (BOOL)supportsSecureCoding;
- (FBKContentItem)contentItem;
- (FBKEnhancedLoggingSessionInformation)initWithCoder:(id)a3;
- (FBKEnhancedLoggingSessionInformation)initWithContentItem:(id)a3 followup:(id)a4 filePredicate:(id)a5 devices:(id)a6;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSNumber)feedbackID;
- (NSNumber)followupID;
- (NSSet)deviceIdentifiers;
- (NSSet)devices;
- (NSString)localizedWhenItWillGather;
- (NSString)subtitle;
- (NSString)title;
- (int64_t)enhancedLoggingDuration;
- (int64_t)enhancedLoggingRetryCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDeviceIdentifiers:(id)a3;
- (void)setEnhancedLoggingDuration:(int64_t)a3;
- (void)setEnhancedLoggingRetryCount:(int64_t)a3;
- (void)setFeedbackID:(id)a3;
- (void)setFollowupID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation FBKEnhancedLoggingSessionInformation

- (NSString)localizedWhenItWillGather
{
  v3 = [(FBKEnhancedLoggingSessionInformation *)self createdAt];
  v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[FBKEnhancedLoggingSessionInformation enhancedLoggingDuration](self, "enhancedLoggingDuration"));
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  if (v5 >= 30.0)
  {
    v7 = +[FBKMatcherPredicate shortestDateFormatter];
    v9 = [v7 stringFromTimeInterval:v6];
    v10 = [MEMORY[0x263F086E0] FeedbackCore];
    v11 = [v10 localizedStringForKey:@"GATHER_IN" value:@"In %@" table:0];

    v8 = objc_msgSend(NSString, "stringWithFormat:", v11, v9);
  }
  else
  {
    v7 = [MEMORY[0x263F086E0] FeedbackCore];
    v8 = [v7 localizedStringForKey:@"GATHER_SOON" value:@"Immediately" table:0];
  }

  return (NSString *)v8;
}

- (FBKEnhancedLoggingSessionInformation)initWithContentItem:(id)a3 followup:(id)a4 filePredicate:(id)a5 devices:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)FBKEnhancedLoggingSessionInformation;
  v14 = [(FBKEnhancedLoggingSessionInformation *)&v23 init];
  if (v14)
  {
    if ([v10 itemType] != 4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Enhanced logging session information must be created from feedback content items."];
    }
    v15 = [v10 ID];
    [(FBKEnhancedLoggingSessionInformation *)v14 setFeedbackID:v15];

    v16 = [v10 itemTitle];
    [(FBKEnhancedLoggingSessionInformation *)v14 setTitle:v16];

    v17 = [v10 itemSubtitle];
    [(FBKEnhancedLoggingSessionInformation *)v14 setSubtitle:v17];

    v18 = [v10 createdAt];
    [(FBKEnhancedLoggingSessionInformation *)v14 setCreatedAt:v18];

    v19 = [v10 updatedAt];
    [(FBKEnhancedLoggingSessionInformation *)v14 setUpdatedAt:v19];

    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingDuration:](v14, "setEnhancedLoggingDuration:", [v12 enhancedLoggingDuration]);
    [(FBKEnhancedLoggingSessionInformation *)v14 setEnhancedLoggingRetryCount:[(FBKEnhancedLoggingSessionInformation *)v14 enhancedLoggingRetryCount]];
    v20 = [v11 ID];
    [(FBKEnhancedLoggingSessionInformation *)v14 setFollowupID:v20];

    v21 = [v13 valueForKey:@"identifier"];
    [(FBKEnhancedLoggingSessionInformation *)v14 setDeviceIdentifiers:v21];
  }
  return v14;
}

- (FBKEnhancedLoggingSessionInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FBKEnhancedLoggingSessionInformation;
  double v5 = [(FBKEnhancedLoggingSessionInformation *)&v17 init];
  if (v5)
  {
    double v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", @"feedbackID"));
    [(FBKEnhancedLoggingSessionInformation *)v5 setFeedbackID:v6];

    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", @"followupID"));
    [(FBKEnhancedLoggingSessionInformation *)v5 setFollowupID:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(FBKEnhancedLoggingSessionInformation *)v5 setTitle:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    [(FBKEnhancedLoggingSessionInformation *)v5 setSubtitle:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdAt"];
    [(FBKEnhancedLoggingSessionInformation *)v5 setCreatedAt:v10];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedAt"];
    [(FBKEnhancedLoggingSessionInformation *)v5 setUpdatedAt:v11];

    id v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"deviceIdentifiers"];
    [(FBKEnhancedLoggingSessionInformation *)v5 setDeviceIdentifiers:v15];

    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingDuration:](v5, "setEnhancedLoggingDuration:", [v4 decodeInt64ForKey:@"enhancedLoggingDuration"]);
    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingRetryCount:](v5, "setEnhancedLoggingRetryCount:", [v4 decodeInt64ForKey:@"enhancedLoggingRetryCount"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(FBKEnhancedLoggingSessionInformation *)self feedbackID];
  objc_msgSend(v11, "encodeInteger:forKey:", objc_msgSend(v4, "integerValue"), @"feedbackID");

  double v5 = [(FBKEnhancedLoggingSessionInformation *)self followupID];
  objc_msgSend(v11, "encodeInteger:forKey:", objc_msgSend(v5, "integerValue"), @"followupID");

  double v6 = [(FBKEnhancedLoggingSessionInformation *)self title];
  [v11 encodeObject:v6 forKey:@"title"];

  v7 = [(FBKEnhancedLoggingSessionInformation *)self subtitle];
  [v11 encodeObject:v7 forKey:@"subtitle"];

  v8 = [(FBKEnhancedLoggingSessionInformation *)self deviceIdentifiers];
  [v11 encodeObject:v8 forKey:@"deviceIdentifiers"];

  v9 = [(FBKEnhancedLoggingSessionInformation *)self createdAt];
  [v11 encodeObject:v9 forKey:@"createdAt"];

  id v10 = [(FBKEnhancedLoggingSessionInformation *)self updatedAt];
  [v11 encodeObject:v10 forKey:@"updatedAt"];

  objc_msgSend(v11, "encodeInt64:forKey:", -[FBKEnhancedLoggingSessionInformation enhancedLoggingDuration](self, "enhancedLoggingDuration"), @"enhancedLoggingDuration");
  objc_msgSend(v11, "encodeInt64:forKey:", -[FBKEnhancedLoggingSessionInformation enhancedLoggingRetryCount](self, "enhancedLoggingRetryCount"), @"enhancedLoggingRetryCount");
}

- (FBKContentItem)contentItem
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = +[FBKData sharedInstance];
  id v4 = [v3 currentUser];
  double v5 = [v4 contentItems];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "ID", (void)v17);
        uint64_t v13 = [(FBKEnhancedLoggingSessionInformation *)self feedbackID];
        if ([v12 isEqualToNumber:v13])
        {
          uint64_t v14 = [v11 itemType];

          if (v14 == 4)
          {
            id v15 = v11;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  id v15 = 0;
LABEL_13:

  return (FBKContentItem *)v15;
}

- (NSSet)devices
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = [(FBKEnhancedLoggingSessionInformation *)self deviceIdentifiers];
  double v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(FBKEnhancedLoggingSessionInformation *)self deviceIdentifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = +[FBKDeviceManager sharedInstance];
        uint64_t v13 = [v12 groupedDeviceWithIdentifier:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return (NSSet *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)feedbackID
{
  return self->_feedbackID;
}

- (void)setFeedbackID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSNumber)followupID
{
  return self->_followupID;
}

- (void)setFollowupID:(id)a3
{
}

- (NSSet)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
}

- (int64_t)enhancedLoggingDuration
{
  return self->_enhancedLoggingDuration;
}

- (void)setEnhancedLoggingDuration:(int64_t)a3
{
  self->_enhancedLoggingDuration = a3;
}

- (int64_t)enhancedLoggingRetryCount
{
  return self->_enhancedLoggingRetryCount;
}

- (void)setEnhancedLoggingRetryCount:(int64_t)a3
{
  self->_enhancedLoggingRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_followupID, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_feedbackID, 0);
}

@end