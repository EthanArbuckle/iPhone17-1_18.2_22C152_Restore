@interface PHRecentCallDetailsView
- (CHRecentCall)recentCall;
- (NSArray)summaries;
- (NSCalendar)calendar;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)timeFormatter;
- (NSNumberFormatter)numberFormatter;
- (PHRecentCallDetailsView)initWithCoder:(id)a3;
- (PHRecentCallDetailsView)initWithFrame:(CGRect)a3;
- (PHRecentCallDetailsViewDelegate)delegate;
- (id)callOccurrences;
- (id)emergencyItemLabelText:(id)a3;
- (id)stringForDataUsage:(id)a3;
- (id)stringForTimeInterval:(double)a3;
- (void)_replaceSubviews;
- (void)addNotificationObservers;
- (void)dealloc;
- (void)handleFormattersDidChangeNotification:(id)a3;
- (void)loadSubviews;
- (void)presentConversationForUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setSummaries:(id)a3;
@end

@implementation PHRecentCallDetailsView

- (PHRecentCallDetailsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHRecentCallDetailsView;
  v3 = -[PHRecentCallDetailsView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PHRecentCallDetailsView *)v3 addNotificationObservers];
  }
  return v4;
}

- (PHRecentCallDetailsView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHRecentCallDetailsView;
  v3 = [(PHRecentCallDetailsView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PHRecentCallDetailsView *)v3 addNotificationObservers];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHRecentCallDetailsView;
  [(PHRecentCallDetailsView *)&v4 dealloc];
}

- (NSCalendar)calendar
{
  v2 = (void *)sPHRecentCallDetailsViewCalendar;
  if (!sPHRecentCallDetailsViewCalendar)
  {
    uint64_t v3 = +[NSCalendar currentCalendar];
    objc_super v4 = (void *)sPHRecentCallDetailsViewCalendar;
    sPHRecentCallDetailsViewCalendar = v3;

    v2 = (void *)sPHRecentCallDetailsViewCalendar;
  }

  return (NSCalendar *)v2;
}

- (NSDateFormatter)dateFormatter
{
  v2 = (void *)sPHRecentCallDetailsViewDateFormatter;
  if (!sPHRecentCallDetailsViewDateFormatter)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    objc_super v4 = (void *)sPHRecentCallDetailsViewDateFormatter;
    sPHRecentCallDetailsViewDateFormatter = (uint64_t)v3;

    [(id)sPHRecentCallDetailsViewDateFormatter setDateStyle:3];
    [(id)sPHRecentCallDetailsViewDateFormatter setDoesRelativeDateFormatting:1];
    [(id)sPHRecentCallDetailsViewDateFormatter setTimeStyle:0];
    v2 = (void *)sPHRecentCallDetailsViewDateFormatter;
  }

  return (NSDateFormatter *)v2;
}

- (NSNumberFormatter)numberFormatter
{
  v2 = (void *)sPHRecentCallDetailsViewNumberFormatter;
  if (!sPHRecentCallDetailsViewNumberFormatter)
  {
    id v3 = objc_alloc_init((Class)NSNumberFormatter);
    objc_super v4 = (void *)sPHRecentCallDetailsViewNumberFormatter;
    sPHRecentCallDetailsViewNumberFormatter = (uint64_t)v3;

    v2 = (void *)sPHRecentCallDetailsViewNumberFormatter;
  }

  return (NSNumberFormatter *)v2;
}

- (NSDateFormatter)timeFormatter
{
  v2 = (void *)sPHRecentCallDetailsViewTimeFormatter;
  if (!sPHRecentCallDetailsViewTimeFormatter)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    objc_super v4 = (void *)sPHRecentCallDetailsViewTimeFormatter;
    sPHRecentCallDetailsViewTimeFormatter = (uint64_t)v3;

    [(id)sPHRecentCallDetailsViewTimeFormatter setDateStyle:0];
    [(id)sPHRecentCallDetailsViewTimeFormatter setTimeStyle:1];
    v2 = (void *)sPHRecentCallDetailsViewTimeFormatter;
  }

  return (NSDateFormatter *)v2;
}

- (void)setRecentCall:(id)a3
{
  v5 = (CHRecentCall *)a3;
  p_recentCall = &self->_recentCall;
  if (self->_recentCall != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_recentCall, a3);
    p_recentCall = (CHRecentCall **)[(PHRecentCallDetailsView *)self loadSubviews];
    v5 = v7;
  }

  _objc_release_x1(p_recentCall, v5);
}

- (void)addNotificationObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleFormattersDidChangeNotification:" name:@"PHRecentCallDetailsViewFormattersDidChangeNotification" object:0];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  if (!sPHRecentCallDetailsViewCurrentLocaleDidChangeNotificationObserver)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    objc_super v6 = +[NSOperationQueue mainQueue];
    uint64_t v7 = [v5 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v6 usingBlock:&__block_literal_global_26];
    v8 = (void *)sPHRecentCallDetailsViewCurrentLocaleDidChangeNotificationObserver;
    sPHRecentCallDetailsViewCurrentLocaleDidChangeNotificationObserver = v7;
  }
  if (!sPHRecentCallDetailsViewSystemTimeZoneDidChangeNotificationObserver)
  {
    id v12 = +[NSNotificationCenter defaultCenter];
    v9 = +[NSOperationQueue mainQueue];
    uint64_t v10 = [v12 addObserverForName:NSSystemTimeZoneDidChangeNotification object:0 queue:v9 usingBlock:&__block_literal_global_26];
    v11 = (void *)sPHRecentCallDetailsViewSystemTimeZoneDidChangeNotificationObserver;
    sPHRecentCallDetailsViewSystemTimeZoneDidChangeNotificationObserver = v10;
  }
}

- (void)handleFormattersDidChangeNotification:(id)a3
{
  objc_super v4 = [(PHRecentCallDetailsView *)self recentCall];

  if (v4)
  {
    [(PHRecentCallDetailsView *)self _replaceSubviews];
  }
}

- (id)callOccurrences
{
  id v3 = +[NSSortDescriptor sortDescriptorWithKey:kCHCallOccurrenceDateKey ascending:0];
  objc_super v4 = [(PHRecentCallDetailsView *)self recentCall];
  v5 = [v4 callOccurrences];
  v9 = v3;
  objc_super v6 = +[NSArray arrayWithObjects:&v9 count:1];
  uint64_t v7 = [v5 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (void)loadSubviews
{
  uint64_t v3 = +[NSMutableArray array];
  v127 = self;
  objc_super v4 = [(PHRecentCallDetailsView *)self callOccurrences];
  v5 = +[UIApplication sharedApplication];
  objc_super v6 = [v5 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
  v8 = UIContextMenuInteraction_ptr;
  v9 = &_s10Foundation8IndexSetV0B0VSQAAMc_ptr;
  v126 = (void *)v3;
  if (!v7)
  {
    char v136 = 0;
    goto LABEL_69;
  }
  id v10 = v7;
  char v136 = 0;
  uint64_t v11 = *(void *)v144;
  uint64_t v12 = kCHCallOccurrenceDateKey;
  unsigned int v122 = kCHCallStatusUnknown;
  uint64_t v120 = kCHCallOccurrenceDurationKey;
  uint64_t v121 = kCHCallOccurrenceCallStatusKey;
  uint64_t v118 = kCHCallOccurrenceVerificationStatusKey;
  uint64_t v119 = kCHCallOccurrenceDataUsageKey;
  int v117 = kCHCallStatusAnsweredElsewhere;
  int v114 = kCHCallStatusCancelled;
  int v113 = kCHCallStatusMissed;
  int v112 = kCHCallStatusConnected;
  int v111 = kCHCallStatusConnectedIncoming;
  uint64_t v115 = CHCallScreenSharingTypeScreenShareOrRemoteControl;
  uint64_t v116 = kCHCallOccurrenceUniqueIdKey;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  uint64_t v123 = kCHCallOccurrenceDateKey;
  uint64_t v124 = *(void *)v144;
  do
  {
    v16 = 0;
    id v128 = v10;
    do
    {
      if (*(void *)v144 != v11) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v143 + 1) + 8 * (void)v16);
      v18 = [v17 objectForKeyedSubscript:v12];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (id v19 = v18) == 0)
      {
        v26 = 0;
        goto LABEL_55;
      }
      id v142 = v19;
      v20 = [v17 objectForKeyedSubscript:v121];
      objc_opt_class();
      unsigned int v21 = v122;
      if (objc_opt_isKindOfClass()) {
        unsigned int v21 = [v20 unsignedIntValue];
      }
      v22 = [v17 objectForKeyedSubscript:v120];
      objc_opt_class();
      double v23 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        [v22 doubleValue];
        double v23 = v24;
      }
      v25 = [v17 objectForKeyedSubscript:v119];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v137 = v25;
      }
      else {
        id v137 = 0;
      }
      v27 = [v17 objectForKeyedSubscript:v118];
      objc_opt_class();
      v134 = v22;
      v135 = v20;
      v132 = v27;
      v133 = v25;
      if (objc_opt_isKindOfClass()) {
        uint64_t v131 = [v27 unsignedIntValue];
      }
      else {
        uint64_t v131 = 0;
      }
      id v28 = objc_alloc_init((Class)UILabel);
      v29 = [v8[6] preferredSubheadline1Font];
      [v28 setFont:v29];

      v30 = [(PHRecentCallDetailsView *)v127 dateFormatter];
      v31 = [v30 stringFromDate:v142];
      [v28 setText:v31];

      [v28 setTextAlignment:4];
      [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v28 setAdjustsFontForContentSizeCategory:1];
      [v28 setNumberOfLines:0];
      [(PHRecentCallDetailsView *)v127 addSubview:v28];
      v32 = [v28 leadingAnchor];
      v33 = [(PHRecentCallDetailsView *)v127 leadingAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      [v34 setActive:1];

      v35 = [v28 trailingAnchor];
      v36 = [(PHRecentCallDetailsView *)v127 trailingAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      [v37 setActive:1];

      if (IsAccessibilityCategory)
      {
        v38 = [v28 topAnchor];
        v39 = [(PHRecentCallDetailsView *)v127 topAnchor];
        v40 = [v38 constraintEqualToAnchor:v39 constant:14.0];
        [v40 setActive:1];
      }
      else
      {
        v38 = [v28 bottomAnchor];
        v39 = [(PHRecentCallDetailsView *)v127 topAnchor];
        v40 = [v8[6] preferredSubheadline1Font];
        [v40 _scaledValueForValue:40.0];
        v42 = [v38 constraintEqualToAnchor:v39 constant:ceil(v41)];
        [v42 setActive:1];
      }
      if (v21 == v117)
      {
        v43 = [v9[388] mainBundle];
        id v44 = v43;
        CFStringRef v45 = @"CALL_STATUS_ANSWERED_ELSEWHERE";
        goto LABEL_28;
      }
      if (v21 == v114)
      {
        v43 = [v9[388] mainBundle];
        id v44 = v43;
        CFStringRef v45 = @"CALL_STATUS_CANCELLED";
        goto LABEL_28;
      }
      if (v21 == v113)
      {
        v43 = [v9[388] mainBundle];
        id v44 = v43;
        CFStringRef v45 = @"CALL_STATUS_MISSED";
LABEL_28:
        [v43 localizedStringForKey:v45 value:&stru_100285990 table:@"PHCallHistory"];
        v141 = v140 = 0;
LABEL_29:

        goto LABEL_30;
      }
      if ((v112 & v21) != 0)
      {
        v81 = [v9[388] mainBundle];
        v82 = v81;
        if (v21 == v111) {
          CFStringRef v83 = @"CALL_STATUS_CONNECTED_INCOMING";
        }
        else {
          CFStringRef v83 = @"CALL_STATUS_CONNECTED_OUTGOING";
        }
        v141 = [v81 localizedStringForKey:v83 value:&stru_100285990 table:@"PHCallHistory"];

        v84 = [(PHRecentCallDetailsView *)v127 stringForTimeInterval:v23];
        id v44 = v84;
        if (v137)
        {
          v85 = -[PHRecentCallDetailsView stringForDataUsage:](v127, "stringForDataUsage:");
          v86 = [v9[388] mainBundle];
          v87 = [v86 localizedStringForKey:@"DURATION_DATA_FORMAT_%@_(%@)" value:&stru_100285990 table:@"PHCallHistory"];

          v140 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v87, v44, v85);
        }
        else
        {
          id v44 = v84;
          v140 = v44;
        }
        goto LABEL_29;
      }
      v140 = 0;
      v141 = 0;
LABEL_30:
      v46 = [(PHRecentCallDetailsView *)v127 recentCall];
      unsigned int v47 = [v46 wasEmergencyCall];

      if (v47)
      {
        v139 = [(PHRecentCallDetailsView *)v127 emergencyItemLabelText:v17];
      }
      else
      {
        v139 = 0;
      }
      v48 = [(PHRecentCallDetailsView *)v127 recentCall];
      id v49 = [v48 screenSharingType];

      if (v49)
      {
        v50 = [(PHRecentCallDetailsView *)v127 recentCall];
        unint64_t v51 = (unint64_t)[v50 screenSharingType];

        if ((v115 & ~v51) == 0)
        {
          v52 = [v9[388] mainBundle];
          v53 = v52;
          CFStringRef v54 = @"SHARED_ALLOWED_REMOTE_CONTROL";
LABEL_40:
          v55 = [v52 localizedStringForKey:v54 value:&stru_100285990 table:@"PHCallHistory"];
          v56 = [(PHRecentCallDetailsView *)v127 recentCall];
          v57 = [v56 callerNameForDisplay];
          v138 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v55, v57);

LABEL_41:
          goto LABEL_42;
        }
        if ((v51 & 2) != 0)
        {
          v52 = [v9[388] mainBundle];
          v53 = v52;
          CFStringRef v54 = @"REMOTE_CONTROL";
          goto LABEL_40;
        }
        if (v51)
        {
          v53 = [v9[388] mainBundle];
          v138 = [v53 localizedStringForKey:@"SHARED_SCREEN" value:&stru_100285990 table:@"PHCallHistory"];
          goto LABEL_41;
        }
      }
      v138 = 0;
LABEL_42:
      v58 = [v17 objectForKeyedSubscript:v116];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v59 = v58;
      }
      else {
        id v59 = 0;
      }
      v130 = v58;
      if ([v59 length]
        && ([(PHRecentCallDetailsView *)v127 delegate],
            v60 = objc_claimAutoreleasedReturnValue(),
            [v60 rttConversationForUUID:v59],
            v61 = objc_claimAutoreleasedReturnValue(),
            v61,
            v60,
            v61))
      {
        v62 = [(PHRecentCallDetailsView *)v127 delegate];
        id v63 = [v62 recentCallTTYType];
      }
      else
      {
        id v63 = 0;
      }
      v64 = [PHRecentCallDetailsItemView alloc];
      v65 = [(PHRecentCallDetailsView *)v127 timeFormatter];
      v66 = [v65 stringFromDate:v142];
      LOBYTE(v110) = v131 == 1;
      v67 = -[PHRecentCallDetailsItemView initWithFrame:callUUID:ttyType:timeLabel:statusLabel:durationAndDataText:emergencyItemsText:verified:screenSharingTypeText:](v64, "initWithFrame:callUUID:ttyType:timeLabel:statusLabel:durationAndDataText:emergencyItemsText:verified:screenSharingTypeText:", v59, v63, v66, v141, v140, v139, CGRectZero.origin.x, y, width, height, v110, v138);

      if (v63) {
        [(PHRecentCallDetailsItemView *)v67 setDelegate:v127];
      }
      [(PHRecentCallDetailsItemView *)v67 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHRecentCallDetailsView *)v127 addSubview:v67];
      v68 = [(PHRecentCallDetailsItemView *)v67 leadingAnchor];
      v69 = [(PHRecentCallDetailsView *)v127 leadingAnchor];
      v70 = [v68 constraintEqualToAnchor:v69];
      [v70 setActive:1];

      v71 = [(PHRecentCallDetailsItemView *)v67 trailingAnchor];
      v72 = [(PHRecentCallDetailsView *)v127 trailingAnchor];
      v73 = [v71 constraintEqualToAnchor:v72];
      [v73 setActive:1];

      if ([v126 count])
      {
        v74 = [v126 lastObject];
        v75 = [(PHRecentCallDetailsItemView *)v67 topAnchor];
        v76 = [v74 bottomAnchor];
        v77 = [v75 constraintEqualToAnchor:v76 constant:16.0];
        [v77 setActive:1];
      }
      else
      {
        v78 = +[UIFont preferredSubheadline1Font];
        [v78 _scaledValueForValue:10.0];
        double v80 = v79;

        v74 = [(PHRecentCallDetailsItemView *)v67 topAnchor];
        v75 = [v28 bottomAnchor];
        v76 = [v74 constraintEqualToAnchor:v75 constant:ceil(v80)];
        [v76 setActive:1];
      }
      v136 |= v131 == 1;

      [v126 addObject:v67];
      v8 = UIContextMenuInteraction_ptr;
      v9 = &_s10Foundation8IndexSetV0B0VSQAAMc_ptr;
      id v10 = v128;
      uint64_t v12 = v123;
      uint64_t v11 = v124;
      v26 = v142;
LABEL_55:

      v16 = (char *)v16 + 1;
    }
    while (v10 != v16);
    id v88 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
    id v10 = v88;
  }
  while (v88);
LABEL_69:

  uint64_t v89 = [v126 lastObject];
  v90 = (void *)v89;
  if (v136)
  {
    id v91 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v8[6] preferredCaption1Font];
    v93 = v92 = v9;
    [v91 setFont:v93];

    [v91 setTranslatesAutoresizingMaskIntoConstraints:0];
    v94 = [v92[388] mainBundle];
    v95 = [v94 localizedStringForKey:@"VERIFIED_EXPLANATION" value:&stru_100285990 table:@"PHRecents"];
    [v91 setText:v95];

    v96 = +[UIColor dynamicSecondaryLabelColor];
    [v91 setTextColor:v96];

    [v91 setAdjustsFontForContentSizeCategory:1];
    [v91 setNumberOfLines:0];
    [(PHRecentCallDetailsView *)v127 addSubview:v91];
    v97 = [v91 leadingAnchor];
    v98 = [(PHRecentCallDetailsView *)v127 leadingAnchor];
    v99 = [v97 constraintEqualToAnchor:v98];
    [v99 setActive:1];

    v100 = [v91 trailingAnchor];
    v101 = [(PHRecentCallDetailsView *)v127 trailingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101];
    [v102 setActive:1];

    v103 = [v91 topAnchor];
    v104 = [v90 lastBaselineAnchor];
    v105 = [v103 constraintEqualToAnchor:v104 constant:18.5];
    [v105 setActive:1];

    v106 = [(PHRecentCallDetailsView *)v127 bottomAnchor];
    v107 = [v91 bottomAnchor];
    v108 = [v8[6] preferredSubheadline1Font];
    [v108 _scaledValueForValue:14.0];
    v109 = [v106 constraintEqualToAnchor:v107];
    [v109 setActive:1];

    goto LABEL_73;
  }
  if (v89)
  {
    id v91 = [(PHRecentCallDetailsView *)v127 bottomAnchor];
    v106 = [v90 bottomAnchor];
    v107 = [v8[6] preferredSubheadline1Font];
    [v107 _scaledValueForValue:14.0];
    v108 = [v91 constraintEqualToAnchor:v106];
    [v108 setActive:1];
LABEL_73:
  }
  [(PHRecentCallDetailsView *)v127 setSummaries:v126];
}

- (void)_replaceSubviews
{
  uint64_t v3 = [(PHRecentCallDetailsView *)self subviews];
  [v3 makeObjectsPerformSelector:"removeFromSuperview"];

  [(PHRecentCallDetailsView *)self loadSubviews];
}

- (id)stringForTimeInterval:(double)a3
{
  unint64_t v3 = (unint64_t)a3;
  if ((unint64_t)a3)
  {
    if (v3 > 0x3B)
    {
      if (v3 > 0xE0F)
      {
        id v19 = +[NSBundle mainBundle];
        v20 = v19;
        if (v3 - 7200 >= 0xFFFFFFFFFFFFF1F0) {
          CFStringRef v21 = @"%@_HOUR";
        }
        else {
          CFStringRef v21 = @"%@_HOURS";
        }
        v22 = [v19 localizedStringForKey:v21 value:&stru_100285990 table:@"PHCallHistory"];
        double v23 = [(PHRecentCallDetailsView *)self numberFormatter];
        double v24 = +[NSNumber numberWithUnsignedInteger:v3 / 0xE10];
        v25 = [v23 stringFromNumber:v24];
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v25);

        if (v3 % 0xE10 < 0x3C) {
          goto LABEL_22;
        }
        unint64_t v26 = v3 % 0xE10 / 0x3C;
        unint64_t v27 = v3 % 0xE10 - 120;
        id v28 = +[NSBundle mainBundle];
        v29 = v28;
        if (v27 >= 0xFFFFFFFFFFFFFFC4) {
          CFStringRef v30 = @"%@_MINUTE";
        }
        else {
          CFStringRef v30 = @"%@_MINUTES";
        }
        v31 = [v28 localizedStringForKey:v30 value:&stru_100285990 table:@"PHCallHistory"];
        v32 = [(PHRecentCallDetailsView *)self numberFormatter];
        v33 = +[NSNumber numberWithUnsignedInteger:v26];
        v34 = [v32 stringFromNumber:v33];
        objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v34);

        uint64_t v12 = +[NSString stringWithFormat:@"%@ %@", v8, v6];
      }
      else
      {
        uint64_t v13 = (unsigned __int16)(unint64_t)a3 / 0x3Cu;
        v14 = +[NSBundle mainBundle];
        objc_super v6 = v14;
        if (v3 <= 0x77) {
          CFStringRef v15 = @"%@_MINUTE";
        }
        else {
          CFStringRef v15 = @"%@_MINUTES";
        }
        v8 = [v14 localizedStringForKey:v15 value:&stru_100285990 table:@"PHCallHistory"];
        v16 = [(PHRecentCallDetailsView *)self numberFormatter];
        v17 = +[NSNumber numberWithUnsignedInteger:v13];
        v18 = [v16 stringFromNumber:v17];
        uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v18);
      }
    }
    else
    {
      v5 = +[NSBundle mainBundle];
      objc_super v6 = v5;
      if (v3 == 1) {
        CFStringRef v7 = @"%@_SECOND";
      }
      else {
        CFStringRef v7 = @"%@_SECONDS";
      }
      v8 = [v5 localizedStringForKey:v7 value:&stru_100285990 table:@"PHCallHistory"];
      v9 = [(PHRecentCallDetailsView *)self numberFormatter];
      id v10 = +[NSNumber numberWithUnsignedInteger:v3];
      uint64_t v11 = [v9 stringFromNumber:v10];
      uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v11);
    }
    v8 = (void *)v12;
  }
  else
  {
    v8 = 0;
  }
LABEL_22:

  return v8;
}

- (id)stringForDataUsage:(id)a3
{
  id v3 = [a3 longLongValue];

  return +[NSByteCountFormatter stringFromByteCount:v3 countStyle:0];
}

- (id)emergencyItemLabelText:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 objectForKeyedSubscript:kCHCallOccurrenceEmergencyVideosCountKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = [v4 integerValue];
  }
  else {
    id v5 = 0;
  }
  objc_super v6 = [v3 objectForKeyedSubscript:kCHCallOccurrenceEmergencyImagesCountKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 integerValue];
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = 0;
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (!v7)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Shared %lu videos" value:&stru_100285990 table:0];
LABEL_16:
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v5, v14);
    goto LABEL_17;
  }
LABEL_10:
  if (!v5 && v7)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Shared %lu photos" value:&stru_100285990 table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7, v14);
    id v10 = LABEL_17:;

    goto LABEL_18;
  }
  id v10 = 0;
  if (v5 && v7)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Shared %lu videos and %lu photos" value:&stru_100285990 table:0];
    id v14 = v7;
    goto LABEL_16;
  }
LABEL_18:
  uint64_t v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2112;
    v18 = v10;
    id v12 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ stringForEmergencyItemLabelText detailsItemViewEmergencyItemLabelText:%@", buf, 0x16u);
  }

  return v10;
}

- (void)presentConversationForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentCallDetailsView *)self delegate];
  [v5 presentConversationForUUID:v4];
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (PHRecentCallDetailsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHRecentCallDetailsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)summaries
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSummaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaries, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end