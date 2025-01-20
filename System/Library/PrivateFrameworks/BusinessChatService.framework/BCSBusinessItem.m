@interface BCSBusinessItem
+ (BOOL)supportsSecureCoding;
+ (id)businessItemsFromChatSuggestJSONObj:(id)a3;
+ (id)businessItemsFromChatSuggestMessageDictionary:(id)a3;
+ (id)businessItemsFromRecords:(id)a3;
- (BCSBusinessItem)initWithBizID:(id)a3 phoneNumber:(id)a4 name:(id)a5 phoneHash:(int64_t)a6 squareLogoURL:(id)a7 wideLogoURL:(id)a8 tintColor:(unint64_t)a9 backgroundColor:(unint64_t)a10 callToActions:(id)a11 messagingOpenHours:(id)a12 callingOpenHours:(id)a13 isVerified:(BOOL)a14 intentID:(id)a15 groupID:(id)a16 visibilityItems:(id)a17;
- (BCSBusinessItem)initWithChatSuggestMessage:(id)a3 bucketID:(id)a4;
- (BCSBusinessItem)initWithCoder:(id)a3;
- (BCSBusinessItem)initWithJSONObj:(id)a3;
- (BCSBusinessItemIdentifier)_businessItemIdentifier;
- (BCSOpenHours)callingOpenHours;
- (BCSOpenHours)messagingOpenHours;
- (BOOL)_isChatSuggestVisibleForVisibilityItem:(id)a3 messagesIdentifier:(id)a4 bizID:(id)a5;
- (BOOL)isAvailableForCalling;
- (BOOL)isAvailableForMessaging;
- (BOOL)isVerified;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSArray)callToActions;
- (NSArray)visibilityItems;
- (NSDate)dateWhenCallingAvailableNext;
- (NSDate)dateWhenMessagingAvailableNext;
- (NSString)bizID;
- (NSString)callSubtitle;
- (NSString)groupID;
- (NSString)intentID;
- (NSString)messageSubtitle;
- (NSString)messageTitle;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)messagesOpenURL;
- (NSURL)squareLogoURL;
- (NSURL)wideLogoURL;
- (id)_availableNextStringFromAvailableNextDate:(uint64_t)a1;
- (id)_escapedVersionOfInputString:(void *)a1;
- (id)_selectedVisibilityItemForLanguage:(id)a3 country:(id)a4;
- (id)callToAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)itemIdentifier;
- (int64_t)phoneHash;
- (int64_t)truncatedHash;
- (int64_t)type;
- (unint64_t)_integerForHexString:(id)a3;
- (unint64_t)backgroundColor;
- (unint64_t)tintColor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSBusinessItem

- (BCSBusinessItem)initWithChatSuggestMessage:(id)a3 bucketID:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 chatOpenHours];
  uint64_t v7 = [v6 count];

  v8 = [v5 phoneOpenHours];
  uint64_t v9 = [v8 count];

  if (v7)
  {
    v10 = [BCSOpenHours alloc];
    v11 = [v5 chatOpenHours];
    v12 = [v11 firstObject];
    v13 = [v5 timeZone];
    v53 = [(BCSOpenHours *)v10 initWithHoursPeriodMessage:v12 timeZone:v13];

    if (v9)
    {
LABEL_3:
      v14 = [BCSOpenHours alloc];
      v15 = [v5 phoneOpenHours];
      v16 = [v15 firstObject];
      v17 = [v5 timeZone];
      v52 = [(BCSOpenHours *)v14 initWithHoursPeriodMessage:v16 timeZone:v17];

      goto LABEL_6;
    }
  }
  else
  {
    v53 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  v52 = 0;
LABEL_6:
  v18 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v19 = [v5 callToActions];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v59;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v59 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [[BCSCallToActionItem alloc] initWithCallToAction:*(void *)(*((void *)&v58 + 1) + 8 * v23)];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v21);
  }

  v25 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v26 = [v5 visibilities];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v55;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v55 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = [[BCSVisibilityItem alloc] initWithVisibility:*(void *)(*((void *)&v54 + 1) + 8 * v30)];
        [v25 addObject:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v28);
  }

  v32 = [v5 tintColor];
  unint64_t v50 = [(BCSBusinessItem *)self _integerForHexString:v32];

  v33 = [v5 backgroundColor];
  unint64_t v49 = [(BCSBusinessItem *)self _integerForHexString:v33];

  v34 = NSURL;
  v35 = [v5 squareLogoUrl];
  v48 = [v34 URLWithString:v35];

  v36 = NSURL;
  v37 = [v5 wideLogoUrl];
  v47 = [v36 URLWithString:v37];

  [v5 bizId];
  v39 = v38 = v5;
  v40 = [v38 name];
  uint64_t v41 = [v38 phoneHash];
  char v42 = [v38 isVerified];
  v43 = [v38 intentId];
  v44 = [v38 group];
  LOBYTE(v46) = v42;
  v51 = [(BCSBusinessItem *)self initWithBizID:v39 phoneNumber:&stru_26C611188 name:v40 phoneHash:v41 squareLogoURL:v48 wideLogoURL:v47 tintColor:v50 backgroundColor:v49 callToActions:v18 messagingOpenHours:v53 callingOpenHours:v52 isVerified:v46 intentID:v43 groupID:v44 visibilityItems:v25];

  return v51;
}

+ (id)businessItemsFromChatSuggestJSONObj:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKeyedSubscript:@"records"];
  id v21 = (id)objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    uint64_t v7 = @"message";
    do
    {
      uint64_t v8 = 0;
      uint64_t v22 = v5;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v25 + 1) + 8 * v8) objectForKeyedSubscript:0x26C612AA8];
        v10 = [v9 objectForKeyedSubscript:v7];
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = v7;
          uint64_t v12 = v6;
          v13 = [v10 objectForKeyedSubscript:@"value"];
          v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v13 options:0];
          v15 = [[BCSChatSuggestMessage alloc] initWithData:v14];
          v16 = [BCSBusinessItem alloc];
          v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[BCSChatSuggestMessage phoneHash](v15, "phoneHash"));
          v18 = [(BCSBusinessItem *)v16 initWithChatSuggestMessage:v15 bucketID:v17];

          if (v18)
          {
            [v21 addObject:v18];
          }
          else
          {
            v19 = ABSLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_2154F4000, v19, OS_LOG_TYPE_ERROR, "BCSBusinessItemFromChatSuggestJSONObj: BusinessItem object didn't initialize correctly", buf, 2u);
            }
          }
          uint64_t v6 = v12;
          uint64_t v7 = v11;
          uint64_t v5 = v22;
        }
        else
        {
          v13 = ABSLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2154F4000, v13, OS_LOG_TYPE_ERROR, "BCSBusinessItemFromChatSuggestJSONObj: Message object is not a dictionary or not initialized", buf, 2u);
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  return v21;
}

+ (id)businessItemsFromChatSuggestMessageDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v17 = a3;
  [v17 objectForKeyedSubscript:@"records"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v23;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKeyedSubscript:0x26C612AA8];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"message"];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [v9 objectForKeyedSubscript:@"value"];
            uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v21 options:0];
            v10 = [[BCSChatSuggestMessage alloc] initWithData:v20];
            uint64_t v11 = v4;
            uint64_t v12 = v5;
            v13 = [BCSBusinessItem alloc];
            v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BCSChatSuggestMessage phoneHash](v10, "phoneHash"));
            v15 = [v14 stringValue];
            uint64_t v5 = [(BCSBusinessItem *)v13 initWithChatSuggestMessage:v10 bucketID:v15];

            uint64_t v4 = v11;
            uint64_t v6 = v18;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)businessItemsFromRecords:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * v8) objectForKeyedSubscript:@"message"];
        v10 = [[BCSChatSuggestMessage alloc] initWithData:v9];
        uint64_t v11 = [BCSBusinessItem alloc];
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BCSChatSuggestMessage phoneHash](v10, "phoneHash"));
        v13 = [v12 stringValue];
        v14 = [(BCSBusinessItem *)v11 initWithChatSuggestMessage:v10 bucketID:v13];

        if (v14)
        {
          [v4 addObject:v14];
        }
        else
        {
          v15 = ABSLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "BCSBusinessItemFromRecords: BusinessItem object didn't initialize correctly", buf, 2u);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  v16 = (void *)[v4 copy];

  return v16;
}

- (NSString)callSubtitle
{
  if ([(BCSBusinessItem *)self isAvailableForCalling]
    || ([(BCSBusinessItem *)self dateWhenCallingAvailableNext],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = [(BCSBusinessItem *)self dateWhenCallingAvailableNext];
    uint64_t v5 = -[BCSBusinessItem _availableNextStringFromAvailableNextDate:]((uint64_t)self, v4);
  }

  return (NSString *)v5;
}

- (id)_availableNextStringFromAvailableNextDate:(uint64_t)a1
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x263EFF910];
    id v3 = a2;
    uint64_t v4 = [v2 date];
    uint64_t v34 = [MEMORY[0x263EFF960] currentLocale];
    BOOL v5 = -[NSLocale isDevice24HourTime](v34);
    uint64_t v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v7 = +[BCSLocalizedStringProvider sharedInstance];
    id v8 = v3;
    id v9 = v7;
    v10 = @"h:mm a";
    if (v5) {
      v10 = @"H:mm";
    }
    uint64_t v11 = (objc_class *)MEMORY[0x263F08790];
    uint64_t v12 = v10;
    id v13 = v6;
    id v14 = v4;
    id v15 = objc_alloc_init(v11);
    [v15 setDateFormat:v12];

    uint64_t v33 = [v15 stringFromDate:v8];
    uint64_t v16 = [v13 component:32 fromDate:v8];
    if (v5) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = v16 % 12;
    }

    uint64_t v18 = (objc_class *)MEMORY[0x263F08790];
    id v19 = v8;
    id v20 = v14;
    id v21 = objc_alloc_init(v18);
    [v21 setDateFormat:@"EEEE"];
    long long v22 = [v21 stringFromDate:v20];
    long long v23 = [v21 stringFromDate:v19];
    [v19 timeIntervalSinceDate:v20];
    double v25 = v24;

    int v26 = [v23 isEqualToString:v22];
    if (v26 && fabs(v25) < 86400.0)
    {
      if (v17 == 1)
      {
        uint64_t v27 = (void *)v33;
        [v9 willOpenAtSameDaySingularWithFormattedTime:v33];
      }
      else
      {
        uint64_t v27 = (void *)v33;
        [v9 willOpenAtSameDayPluralWithFormattedTime:v33];
      uint64_t v30 = };
      v31 = (void *)v34;
    }
    else
    {
      id v28 = objc_alloc_init(MEMORY[0x263F08790]);
      [v28 setDateFormat:@"EEEE"];
      uint64_t v29 = [v28 stringFromDate:v19];
      if (v17 == 1)
      {
        uint64_t v27 = (void *)v33;
        [v9 willOpenAtDifferentDaySingularWithFormattedTime:v33 formattedDay:v29];
      }
      else
      {
        uint64_t v27 = (void *)v33;
        [v9 willOpenAtDifferentDayPluralWithFormattedTime:v33 formattedDay:v29];
      uint64_t v30 = };
      v31 = (void *)v34;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (NSString)messageTitle
{
  id v3 = [(BCSBusinessItem *)self callToAction];
  uint64_t v4 = [v3 title];
  if ([v4 length])
  {
    BOOL v5 = [(BCSBusinessItem *)self callToAction];
    [v5 title];
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"CHAT_NOW" value:&stru_26C611188 table:0];
  uint64_t v6 = };

  return (NSString *)v6;
}

- (NSString)messageSubtitle
{
  if ([(BCSBusinessItem *)self isAvailableForMessaging])
  {
    id v3 = [(BCSBusinessItem *)self callToAction];
    uint64_t v4 = [v3 subtitle];
LABEL_5:
    uint64_t v6 = (void *)v4;

    goto LABEL_7;
  }
  BOOL v5 = [(BCSBusinessItem *)self dateWhenMessagingAvailableNext];

  if (v5)
  {
    id v3 = [(BCSBusinessItem *)self dateWhenMessagingAvailableNext];
    uint64_t v4 = -[BCSBusinessItem _availableNextStringFromAvailableNextDate:]((uint64_t)self, v3);
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (BCSBusinessItem)initWithBizID:(id)a3 phoneNumber:(id)a4 name:(id)a5 phoneHash:(int64_t)a6 squareLogoURL:(id)a7 wideLogoURL:(id)a8 tintColor:(unint64_t)a9 backgroundColor:(unint64_t)a10 callToActions:(id)a11 messagingOpenHours:(id)a12 callingOpenHours:(id)a13 isVerified:(BOOL)a14 intentID:(id)a15 groupID:(id)a16 visibilityItems:(id)a17
{
  id v58 = a3;
  id v57 = a4;
  id v56 = a5;
  id v55 = a7;
  id v54 = a8;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v59.receiver = self;
  v59.super_class = (Class)BCSBusinessItem;
  uint64_t v27 = [(BCSItem *)&v59 init];
  if (v27)
  {
    id v28 = [v58 prefixedBizID];
    uint64_t v29 = [v28 copy];
    bizID = v27->_bizID;
    v27->_bizID = (NSString *)v29;

    uint64_t v31 = [v57 copy];
    phoneNumber = v27->_phoneNumber;
    v27->_phoneNumber = (NSString *)v31;

    uint64_t v33 = [v56 copy];
    name = v27->_name;
    v27->_name = (NSString *)v33;

    v27->_phoneHash = a6;
    uint64_t v35 = [v55 copy];
    squareLogoURL = v27->_squareLogoURL;
    v27->_squareLogoURL = (NSURL *)v35;

    uint64_t v37 = [v54 copy];
    wideLogoURL = v27->_wideLogoURL;
    v27->_wideLogoURL = (NSURL *)v37;

    v27->_tintColor = a9;
    v27->_backgroundColor = a10;
    uint64_t v39 = [v21 copy];
    callToActions = v27->_callToActions;
    v27->_callToActions = (NSArray *)v39;

    uint64_t v41 = [v22 copy];
    messagingOpenHours = v27->_messagingOpenHours;
    v27->_messagingOpenHours = (BCSOpenHours *)v41;

    uint64_t v43 = [v23 copy];
    callingOpenHours = v27->_callingOpenHours;
    v27->_callingOpenHours = (BCSOpenHours *)v43;

    v27->_isVerified = a14;
    uint64_t v45 = [v24 copy];
    intentID = v27->_intentID;
    v27->_intentID = (NSString *)v45;

    uint64_t v47 = [v25 copy];
    groupID = v27->_groupID;
    v27->_groupID = (NSString *)v47;

    uint64_t v49 = [v26 copy];
    visibilityItems = v27->_visibilityItems;
    v27->_visibilityItems = (NSArray *)v49;
  }
  return v27;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)BCSBusinessItem;
  uint64_t v4 = [(BCSBusinessItem *)&v9 description];
  BOOL v5 = [(BCSBusinessItem *)self bizID];
  uint64_t v6 = [(BCSBusinessItem *)self name];
  uint64_t v7 = [v3 stringWithFormat:@"%@ - bizID:%@ - name:%@", v4, v5, v6];

  return v7;
}

- (id)debugDescription
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v30 = (id)NSString;
  v38 = [(BCSBusinessItem *)self bizID];
  uint64_t v37 = [(BCSBusinessItem *)self name];
  int64_t v28 = [(BCSBusinessItem *)self phoneHash];
  uint64_t v34 = [(BCSBusinessItem *)self squareLogoURL];
  v36 = [v34 absoluteString];
  uint64_t v33 = [(BCSBusinessItem *)self wideLogoURL];
  uint64_t v35 = [v33 absoluteString];
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"0x%lX", -[BCSBusinessItem tintColor](self, "tintColor"));
  uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"0x%lX", -[BCSBusinessItem backgroundColor](self, "backgroundColor"));
  uint64_t v27 = [(BCSBusinessItem *)self callToAction];
  id v26 = [v27 language];
  id v25 = [(BCSBusinessItem *)self callToAction];
  id v24 = [v25 title];
  id v23 = [(BCSBusinessItem *)self callToAction];
  id v22 = [v23 subtitle];
  id v21 = [(BCSBusinessItem *)self messagingOpenHours];
  id v20 = [v21 debugDescription];
  id v19 = [(BCSBusinessItem *)self callingOpenHours];
  uint64_t v18 = [v19 debugDescription];
  BOOL v15 = [(BCSBusinessItem *)self isVerified];
  uint64_t v17 = [(BCSBusinessItem *)self groupID];
  uint64_t v16 = [(BCSBusinessItem *)self intentID];
  if (self)
  {
    id v3 = [(BCSBusinessItem *)self visibilityItems];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v40;
      uint64_t v7 = &stru_26C611188;
      do
      {
        uint64_t v8 = 0;
        objc_super v9 = v7;
        do
        {
          if (*(void *)v40 != v6) {
            objc_enumerationMutation(v3);
          }
          v10 = NSString;
          uint64_t v11 = [*(id *)(*((void *)&v39 + 1) + 8 * v8) description];
          uint64_t v12 = [v10 stringWithFormat:@"Visibility %@\n", v11];
          uint64_t v7 = [(__CFString *)v9 stringByAppendingString:v12];

          ++v8;
          objc_super v9 = v7;
        }
        while (v5 != v8);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v7 = &stru_26C611188;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v13 = @"NO";
  if (v15) {
    id v13 = @"YES";
  }
  id v31 = [v30 stringWithFormat:@"ID : \"%@\"\nName : \"%@\"\nBucket ID: %lld\nSquare Logo URL : \"%@\"\nWide Logo URL : \"%@\"\nTint color : %@\nBackground color: %@\nCall to Action (%@) : \"%@\" - \"%@\"\nMessaging Open Hours:\n%@\nCalling Open Hours:\n%@\nVerified : %@\nGroup ID : \"%@\"\nIntent ID : \"%@\"\nConfigured Visibility Items : \n%@\n", v38, v37, v28, v36, v35, v32, v29, v26, v24, v22, v20, v18, v13, v17, v16, v7];

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(BCSBusinessItem *)self bizID];
    uint64_t v7 = [v6 copyWithZone:a3];
    uint64_t v8 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v7;

    objc_super v9 = [(BCSBusinessItem *)self phoneNumber];
    uint64_t v10 = [v9 copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(BCSBusinessItem *)self name];
    uint64_t v13 = [v12 copyWithZone:a3];
    id v14 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v13;

    *(void *)(v5 + 40) = [(BCSBusinessItem *)self phoneHash];
    BOOL v15 = [(BCSBusinessItem *)self squareLogoURL];
    uint64_t v16 = [v15 copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v16;

    uint64_t v18 = [(BCSBusinessItem *)self wideLogoURL];
    uint64_t v19 = [v18 copyWithZone:a3];
    id v20 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v19;

    *(void *)(v5 + 64) = [(BCSBusinessItem *)self tintColor];
    *(void *)(v5 + 72) = [(BCSBusinessItem *)self backgroundColor];
    id v21 = [(BCSBusinessItem *)self callToActions];
    uint64_t v22 = [v21 copyWithZone:a3];
    id v23 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v22;

    id v24 = [(BCSBusinessItem *)self messagingOpenHours];
    uint64_t v25 = [v24 copyWithZone:a3];
    id v26 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v25;

    uint64_t v27 = [(BCSBusinessItem *)self callingOpenHours];
    uint64_t v28 = [v27 copyWithZone:a3];
    uint64_t v29 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v28;

    *(unsigned char *)(v5 + 112) = [(BCSBusinessItem *)self isVerified];
    uint64_t v30 = [(BCSBusinessItem *)self intentID];
    id v31 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v30;

    uint64_t v32 = [(BCSBusinessItem *)self groupID];
    uint64_t v33 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v32;

    uint64_t v34 = [(BCSBusinessItem *)self visibilityItems];
    uint64_t v35 = [v34 copyWithZone:a3];
    v36 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v35;
  }
  return (id)v5;
}

- (BOOL)isAvailableForMessaging
{
  id v3 = [MEMORY[0x263EFF910] date];
  if (self)
  {
    uint64_t v4 = [(BCSBusinessItem *)self messagingOpenHours];

    if (v4)
    {
      uint64_t v5 = [(BCSBusinessItem *)self messagingOpenHours];
      LOBYTE(self) = [v5 isOpenAtDate:v3];
    }
    else
    {
      LOBYTE(self) = 1;
    }
  }

  return (char)self;
}

- (NSDate)dateWhenMessagingAvailableNext
{
  id v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = v3;
  if (self)
  {
    id v5 = v3;
    uint64_t v6 = [(BCSBusinessItem *)self messagingOpenHours];
    self = [v6 dateWhenOpenNextAfterDate:v5];
  }

  return (NSDate *)self;
}

- (BOOL)isAvailableForCalling
{
  id v3 = [MEMORY[0x263EFF910] date];
  if (self)
  {
    uint64_t v4 = [(BCSBusinessItem *)self callingOpenHours];

    if (v4)
    {
      id v5 = [(BCSBusinessItem *)self callingOpenHours];
      LOBYTE(self) = [v5 isOpenAtDate:v3];
    }
    else
    {
      LOBYTE(self) = 1;
    }
  }

  return (char)self;
}

- (NSDate)dateWhenCallingAvailableNext
{
  id v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = v3;
  if (self)
  {
    id v5 = v3;
    uint64_t v6 = [(BCSBusinessItem *)self callingOpenHours];
    self = [v6 dateWhenOpenNextAfterDate:v5];
  }

  return (NSDate *)self;
}

- (NSURL)messagesOpenURL
{
  id v3 = NSString;
  uint64_t v4 = [(BCSBusinessItem *)self bizID];
  id v5 = [v4 prefixedBizID];
  if (self)
  {
    uint64_t v6 = [(BCSBusinessItem *)self intentID];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = NSString;
      objc_super v9 = [(BCSBusinessItem *)self intentID];
      uint64_t v10 = -[BCSBusinessItem _escapedVersionOfInputString:](v9);
      uint64_t v11 = [v8 stringWithFormat:@"&biz-intent-id=%@", v10];
      uint64_t v12 = [&stru_26C611188 stringByAppendingString:v11];
    }
    else
    {
      uint64_t v12 = &stru_26C611188;
    }
    uint64_t v13 = [(BCSBusinessItem *)self groupID];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      BOOL v15 = NSString;
      uint64_t v16 = [(BCSBusinessItem *)self groupID];
      uint64_t v17 = -[BCSBusinessItem _escapedVersionOfInputString:](v16);
      uint64_t v18 = [v15 stringWithFormat:@"&biz-group-id=%@", v17];
      uint64_t v19 = [(__CFString *)v12 stringByAppendingString:v18];

      uint64_t v12 = (__CFString *)v19;
    }
    id v20 = [(BCSBusinessItem *)self callToAction];
    id v21 = [v20 body];
    uint64_t v22 = [v21 length];

    if (v22)
    {
      id v23 = NSString;
      id v24 = [(BCSBusinessItem *)self callToAction];
      uint64_t v25 = [v24 body];
      id v26 = -[BCSBusinessItem _escapedVersionOfInputString:](v25);
      uint64_t v27 = [v23 stringWithFormat:@"&body=%@", v26];
      uint64_t v28 = [(__CFString *)v12 stringByAppendingString:v27];

      uint64_t v12 = (__CFString *)v28;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v29 = [v3 stringWithFormat:@"sms://open?service=iMessage&recipient=%@%@", v5, v12];

  uint64_t v30 = [NSURL URLWithString:v29];

  return (NSURL *)v30;
}

- (id)_escapedVersionOfInputString:(void *)a1
{
  v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 alphanumericCharacterSet];
  uint64_t v4 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  return v4;
}

- (id)itemIdentifier
{
  id v2 = [(BCSBusinessItem *)self _businessItemIdentifier];
  id v3 = [v2 itemIdentifier];

  return v3;
}

- (int64_t)truncatedHash
{
  id v2 = [(BCSBusinessItem *)self _businessItemIdentifier];
  int64_t v3 = [v2 truncatedHash];

  return v3;
}

- (int64_t)type
{
  id v2 = [(BCSBusinessItem *)self _businessItemIdentifier];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  id v5 = [(BCSBusinessItem *)self _businessItemIdentifier];
  char v6 = [v5 matchesItemIdentifying:v4];

  return v6;
}

- (BCSBusinessItemIdentifier)_businessItemIdentifier
{
  itemIdentifier = self->_itemIdentifier;
  if (!itemIdentifier)
  {
    +[BCSBusinessItemIdentifier identifierWithBusinessItem:]((uint64_t)BCSBusinessItemIdentifier, self);
    id v4 = (BCSBusinessItemIdentifier *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_itemIdentifier;
    self->_itemIdentifier = v4;

    itemIdentifier = self->_itemIdentifier;
  }

  return itemIdentifier;
}

- (id)callToAction
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  +[NSLocale currentLanguage]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(BCSBusinessItem *)self callToActions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v10 language];
          char v12 = [v11 isEqualToString:v3];

          if (v12)
          {
            id v14 = v10;

            goto LABEL_16;
          }
          if ([v10 isDefault])
          {
            id v13 = v10;

            id v7 = v13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v7 = 0;
    }

    id v7 = v7;
    id v14 = v7;
LABEL_16:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_isChatSuggestVisibleForVisibilityItem:(id)a3 messagesIdentifier:(id)a4 bizID:(id)a5
{
  if (!a3) {
    return 0;
  }
  id v7 = a3;
  uint64_t v8 = [a4 stringByAppendingString:a5];
  LOBYTE(a4) = [v7 isVisibleForDSID:v8];

  return (char)a4;
}

- (id)_selectedVisibilityItemForLanguage:(id)a3 country:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v30 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(BCSBusinessItem *)self visibilityItems];
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v6)
  {
    id v25 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v11 = [v10 language];
      char v12 = [v11 lowercaseString];
      id v13 = [v31 lowercaseString];
      int v14 = [v12 isEqualToString:v13];

      BOOL v15 = [v10 country];
      long long v16 = [v15 lowercaseString];
      long long v17 = [v30 lowercaseString];
      int v18 = [v16 isEqualToString:v17];

      long long v19 = [v10 language];
      int v20 = [v19 isEqualToString:@"*"];

      uint64_t v21 = [v10 country];
      int v22 = [v21 isEqualToString:@"*"];

      int v23 = v18 ^ 1;
      if (((v14 ^ 1) & 1) == 0 && (v23 & 1) == 0)
      {
        id v26 = ABSLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
          uint64_t v27 = "%s Selecting visibility item - equal language and country code";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      int v24 = v22 ^ 1;
      if (((v20 ^ 1) & 1) == 0 && (v24 & 1) == 0)
      {
        id v26 = ABSLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
          uint64_t v27 = "%s Selecting visibility item - language and country code are wildcard";
          goto LABEL_24;
        }
LABEL_25:

        id v25 = v10;
        goto LABEL_26;
      }
      if (((v14 ^ 1 | v24) & 1) == 0)
      {
        id v26 = ABSLogCommon();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
        uint64_t v27 = "%s Selecting visibility item - equal language and country code is wildcard";
LABEL_24:
        _os_log_impl(&dword_2154F4000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        goto LABEL_25;
      }
      if (((v20 ^ 1 | v23) & 1) == 0)
      {
        id v26 = ABSLogCommon();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
        uint64_t v27 = "%s Selecting visibility item - wildcard language and country code is equal";
        goto LABEL_24;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    id v25 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_26:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  bizID = self->_bizID;
  id v5 = a3;
  [v5 encodeObject:bizID forKey:@"kBCSBusinessItemBizIDCodingKey"];
  [v5 encodeObject:self->_phoneNumber forKey:@"kBCSBusinessItemPhoneNumberCodingKey"];
  [v5 encodeObject:self->_name forKey:@"kBCSBusinessItemNameCodingKey"];
  [v5 encodeInteger:self->_phoneHash forKey:@"kBCSBusinessItemBucketIDCodingKey"];
  [v5 encodeObject:self->_squareLogoURL forKey:@"kBCSBusinessItemSquareLogoURLCodingKey"];
  [v5 encodeObject:self->_wideLogoURL forKey:@"kBCSBusinessItemWideLogoURLCodingKey"];
  [v5 encodeInteger:self->_tintColor forKey:@"kBCSBusinessItemTintColorCodingKey"];
  [v5 encodeInteger:self->_backgroundColor forKey:@"kBCSBusinessItemBackgroundColorCodingKey"];
  [v5 encodeObject:self->_callToActions forKey:@"kBCSBusinessItemCallToActionCodingKey"];
  [v5 encodeObject:self->_messagingOpenHours forKey:@"kBCSBusinessItemMessagingOpenHoursCodingKey"];
  [v5 encodeObject:self->_callingOpenHours forKey:@"kBCSBusinessItemCallingOpenHoursCodingKey"];
  [v5 encodeBool:self->_isVerified forKey:@"kBCSBusinessItemIsVerifiedCodingKey"];
  [v5 encodeObject:self->_intentID forKey:@"kBCSBusinessItemIntentIDCodingKey"];
  [v5 encodeObject:self->_groupID forKey:@"kBCSBusinessItemGroupIDCodingKey"];
  [v5 encodeObject:self->_visibilityItems forKey:@"visibilityItems"];
}

- (BCSBusinessItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BCSBusinessItem;
  id v5 = [(BCSItem *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemBizIDCodingKey"];
    bizID = v5->_bizID;
    v5->_bizID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemPhoneNumberCodingKey"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemNameCodingKey"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v5->_phoneHash = [v4 decodeIntegerForKey:@"kBCSBusinessItemBucketIDCodingKey"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemSquareLogoURLCodingKey"];
    squareLogoURL = v5->_squareLogoURL;
    v5->_squareLogoURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemWideLogoURLCodingKey"];
    wideLogoURL = v5->_wideLogoURL;
    v5->_wideLogoURL = (NSURL *)v14;

    v5->_tintColor = [v4 decodeIntegerForKey:@"kBCSBusinessItemTintColorCodingKey"];
    v5->_backgroundColor = [v4 decodeIntegerForKey:@"kBCSBusinessItemBackgroundColorCodingKey"];
    long long v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    int v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kBCSBusinessItemCallToActionCodingKey"];
    callToActions = v5->_callToActions;
    v5->_callToActions = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemMessagingOpenHoursCodingKey"];
    messagingOpenHours = v5->_messagingOpenHours;
    v5->_messagingOpenHours = (BCSOpenHours *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemCallingOpenHoursCodingKey"];
    callingOpenHours = v5->_callingOpenHours;
    v5->_callingOpenHours = (BCSOpenHours *)v23;

    v5->_isVerified = [v4 decodeBoolForKey:@"kBCSBusinessItemIsVerifiedCodingKey"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemIntentIDCodingKey"];
    intentID = v5->_intentID;
    v5->_intentID = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSBusinessItemGroupIDCodingKey"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v27;

    uint64_t v29 = (void *)MEMORY[0x263EFFA08];
    uint64_t v30 = objc_opt_class();
    id v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"visibilityItems"];
    visibilityItems = v5->_visibilityItems;
    v5->_visibilityItems = (NSArray *)v32;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bizID
{
  return self->_bizID;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSURL)squareLogoURL
{
  return self->_squareLogoURL;
}

- (NSURL)wideLogoURL
{
  return self->_wideLogoURL;
}

- (unint64_t)tintColor
{
  return self->_tintColor;
}

- (unint64_t)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)callToActions
{
  return self->_callToActions;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSString)intentID
{
  return self->_intentID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (BCSOpenHours)messagingOpenHours
{
  return self->_messagingOpenHours;
}

- (BCSOpenHours)callingOpenHours
{
  return self->_callingOpenHours;
}

- (NSArray)visibilityItems
{
  return self->_visibilityItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_intentID, 0);
  objc_storeStrong((id *)&self->_callingOpenHours, 0);
  objc_storeStrong((id *)&self->_messagingOpenHours, 0);
  objc_storeStrong((id *)&self->_visibilityItems, 0);
  objc_storeStrong((id *)&self->_callToActions, 0);
  objc_storeStrong((id *)&self->_wideLogoURL, 0);
  objc_storeStrong((id *)&self->_squareLogoURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_bizID, 0);
}

- (unint64_t)_integerForHexString:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    unsigned int v8 = 0;
    id v4 = [MEMORY[0x263F08B08] scannerWithString:v3];
    [v4 scanHexInt:&v8];
    unint64_t v5 = v8;
  }
  else
  {
    uint64_t v6 = ABSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_2154F4000, v6, OS_LOG_TYPE_ERROR, "BCSBusinessItem hex string length <= 0 - %@", (uint8_t *)&v8, 0xCu);
    }

    unint64_t v5 = 0;
  }

  return v5;
}

- (BCSBusinessItem)initWithJSONObj:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [v4 objectForKeyedSubscript:0x26C612AA8];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:0x26C6142C8];
      unint64_t v50 = [v7 objectForKeyedSubscript:0x26C612A88];

      unsigned int v8 = [v6 objectForKeyedSubscript:0x26C6142E8];
      uint64_t v49 = [v8 objectForKeyedSubscript:0x26C612A88];

      id v9 = [v6 objectForKeyedSubscript:0x26C614308];
      long long v40 = [v9 objectForKeyedSubscript:0x26C612A88];

      uint64_t v10 = [v6 objectForKeyedSubscript:0x26C614328];
      uint64_t v39 = [v10 objectForKeyedSubscript:0x26C612A88];

      uint64_t v11 = [v6 objectForKeyedSubscript:0x26C614368];
      uint64_t v47 = [v11 objectForKeyedSubscript:0x26C612A88];

      uint64_t v12 = [v6 objectForKeyedSubscript:0x26C614348];
      long long v41 = [v12 objectForKeyedSubscript:0x26C612A88];

      id v13 = [v6 objectForKeyedSubscript:0x26C614268];
      uint64_t v43 = [v13 objectForKeyedSubscript:0x26C612A88];

      uint64_t v14 = [v6 objectForKeyedSubscript:0x26C614288];
      long long v42 = [v14 objectForKeyedSubscript:0x26C612A88];

      BOOL v15 = [v6 objectForKeyedSubscript:0x26C6135A8];
      v48 = [v15 objectForKeyedSubscript:0x26C612A88];

      uint64_t v46 = [v6 objectForKeyedSubscript:0x26C614388];
      uint64_t v45 = [v6 objectForKeyedSubscript:0x26C6143A8];
      unint64_t v38 = [(BCSBusinessItem *)self _integerForHexString:v43];
      unint64_t v37 = [(BCSBusinessItem *)self _integerForHexString:v42];
      id v44 = v4;
      v36 = [NSURL URLWithString:v50];
      objc_super v35 = [NSURL URLWithString:v49];
      char v32 = [v41 BOOLValue];
      uint64_t v30 = [[BCSOpenHours alloc] initWithJSONObj:v40 timeZone:v47];
      uint64_t v29 = [[BCSOpenHours alloc] initWithJSONObj:v39 timeZone:v47];
      long long v34 = [v6 objectForKeyedSubscript:0x26C614248];
      long long v16 = [v34 objectForKeyedSubscript:0x26C612A88];
      long long v33 = [v6 objectForKeyedSubscript:0x26C6111E8];
      uint64_t v17 = [v33 objectForKeyedSubscript:0x26C612A88];
      id v31 = [v6 objectForKeyedSubscript:0x26C611468];
      int v18 = [v31 objectForKeyedSubscript:0x26C612A88];
      uint64_t v19 = [v48 longLongValue];
      [v6 objectForKeyedSubscript:0x26C6142A8];
      v21 = int v20 = self;
      int v22 = [v21 objectForKeyedSubscript:0x26C612A88];
      LOBYTE(v28) = v32;
      uint64_t v23 = v19;
      id v4 = v44;
      int v24 = [(BCSBusinessItem *)v20 initWithBizID:v16 phoneNumber:v17 name:v18 phoneHash:v23 squareLogoURL:v36 wideLogoURL:v35 tintColor:v38 backgroundColor:v37 callToActions:v22 messagingOpenHours:v30 callingOpenHours:v29 isVerified:v28 intentID:v46 groupID:v45 visibilityItems:MEMORY[0x263EFFA68]];

      self = v24;
      uint64_t v25 = v24;
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    id v26 = ABSLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v26, OS_LOG_TYPE_ERROR, "BCSBusinessItem init JSON object is not dictionary", buf, 2u);
    }

    uint64_t v25 = 0;
  }

  return v25;
}

@end