@interface CLKTimeIntervalTextProvider
+ (BOOL)supportsSecureCoding;
+ (CLKTimeIntervalTextProvider)textProviderWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (CLKTimeIntervalTextProvider)textProviderWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate timeZone:(NSTimeZone *)timeZone;
+ (id)finalizedTextProviderWithStartDate:(id)a3 endDate:(id)a4;
+ (id)finalizedTextProviderWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5;
- (BOOL)_validate;
- (BOOL)isEqual:(id)a3;
- (CLKTimeIntervalTextProvider)initWithCoder:(id)a3;
- (CLKTimeIntervalTextProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
- (CLKTimeIntervalTextProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate timeZone:(NSTimeZone *)timeZone;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSTimeZone)timeZone;
- (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4;
- (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3;
- (_NSRange)_rangeOfHoursInAnnotatedTime:(id)a3;
- (id)JSONObjectRepresentation;
- (id)_attributedTextForSequenceItem:(int64_t)a3 style:(id)a4;
- (id)_dateIntervalAttributedTextWithStyle:(id)a3 narrow:(BOOL)a4;
- (id)_dateIntervalNarrowAttributedTextWithStyle:(id)a3;
- (id)_dateIntervalWideAttributedTextWithStyle:(id)a3;
- (id)_fallbackSequence;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)_startTimeDropMinutesAttributedTextWithStyle:(id)a3;
- (id)_startTimeFullAttributedTextWithStyle:(id)a3;
- (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4;
- (id)_timeIntervalAttributedTextWithStyle:(id)a3 dropMinutes:(BOOL)a4 onlyStartDate:(BOOL)a5;
- (id)_timeIntervalDropMinutesAttributedTextWithStyle:(id)a3;
- (id)_timeIntervalFullAttributedTextWithStyle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_validate;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(NSDate *)endDate;
- (void)setStartDate:(NSDate *)startDate;
- (void)setTimeZone:(NSTimeZone *)timeZone;
@end

@implementation CLKTimeIntervalTextProvider

- (CLKTimeIntervalTextProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return [(CLKTimeIntervalTextProvider *)self initWithStartDate:startDate endDate:endDate timeZone:0];
}

- (CLKTimeIntervalTextProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate timeZone:(NSTimeZone *)timeZone
{
  v8 = startDate;
  v9 = endDate;
  v10 = timeZone;
  v14.receiver = self;
  v14.super_class = (Class)CLKTimeIntervalTextProvider;
  v11 = [(CLKTextProvider *)&v14 initPrivate];
  v12 = v11;
  if (v11)
  {
    [(CLKTimeIntervalTextProvider *)v11 setStartDate:v8];
    [(CLKTimeIntervalTextProvider *)v12 setEndDate:v9];
    [(CLKTimeIntervalTextProvider *)v12 setTimeZone:v10];
  }

  return v12;
}

+ (CLKTimeIntervalTextProvider)textProviderWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (CLKTimeIntervalTextProvider *)[a1 textProviderWithStartDate:startDate endDate:endDate timeZone:0];
}

+ (CLKTimeIntervalTextProvider)textProviderWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate timeZone:(NSTimeZone *)timeZone
{
  v8 = timeZone;
  v9 = endDate;
  v10 = startDate;
  v11 = (void *)[objc_alloc((Class)a1) initWithStartDate:v10 endDate:v9 timeZone:v8];

  return (CLKTimeIntervalTextProvider *)v11;
}

+ (id)finalizedTextProviderWithStartDate:(id)a3 endDate:(id)a4
{
  return (id)[a1 finalizedTextProviderWithStartDate:a3 endDate:a4 timeZone:0];
}

+ (id)finalizedTextProviderWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  v5 = [a1 textProviderWithStartDate:a3 endDate:a4 timeZone:a5];
  [v5 finalize];

  return v5;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6 = a4;
  if (!self->_startDate || !self->_endDate) {
    goto LABEL_13;
  }
  if (!self->_dateFormatter)
  {
    v7 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v7;

    if (self->_timeZone) {
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:");
    }
  }
  fallbackSequence = self->_fallbackSequence;
  if (!fallbackSequence)
  {
    v10 = [(CLKTimeIntervalTextProvider *)self _fallbackSequence];
    v11 = self->_fallbackSequence;
    self->_fallbackSequence = v10;

    fallbackSequence = self->_fallbackSequence;
  }
  if ([(NSArray *)fallbackSequence count] > a3)
  {
    v12 = [(NSArray *)self->_fallbackSequence objectAtIndex:a3];
    uint64_t v13 = [v12 integerValue];

    objc_super v14 = [(CLKTimeIntervalTextProvider *)self _attributedTextForSequenceItem:v13 style:v6];
    if ([v6 shouldEmbedTintColors])
    {
      v15 = [(CLKTextProvider *)self tintColor];

      if (v15)
      {
        v16 = [(CLKTextProvider *)self tintColor];
        uint64_t v17 = [v14 _attributedStringWithForegroundColor:v16];

        objc_super v14 = (void *)v17;
      }
    }
    v18 = [v14 _attributedStringWithOtherAttributesFromStyle:v6];
  }
  else
  {
LABEL_13:
    v18 = 0;
  }

  return v18;
}

- (BOOL)_validate
{
  v9.receiver = self;
  v9.super_class = (Class)CLKTimeIntervalTextProvider;
  BOOL v3 = [(CLKTextProvider *)&v9 _validate];
  if (v3)
  {
    startDate = self->_startDate;
    if (startDate)
    {
      if (self->_endDate)
      {
        -[NSDate earlierDate:](startDate, "earlierDate:");
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
        endDate = self->_endDate;

        if (v5 != endDate)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        v7 = CLKLoggingObjectForDomain(10);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          [(CLKTimeIntervalTextProvider *)(uint64_t)self _validate];
        }
      }
      else
      {
        v7 = CLKLoggingObjectForDomain(10);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[CLKTimeIntervalTextProvider _validate]();
        }
      }
    }
    else
    {
      v7 = CLKLoggingObjectForDomain(10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[CLKTimeIntervalTextProvider _validate]();
      }
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3
{
  NSUInteger v3 = [(CLKTimeIntervalTextProvider *)self _rangeOfAnnontatedTime:a3 matchingPattern:&__block_literal_global_20];
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __65__CLKTimeIntervalTextProvider__rangeOfDesignatorInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"a"];
}

- (_NSRange)_rangeOfHoursInAnnotatedTime:(id)a3
{
  NSUInteger v3 = [(CLKTimeIntervalTextProvider *)self _rangeOfAnnontatedTime:a3 matchingPattern:&__block_literal_global_17_0];
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __60__CLKTimeIntervalTextProvider__rangeOfHoursInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 hasPrefix:@"H"] & 1) != 0
    || ([v2 hasPrefix:@"h"] & 1) != 0
    || ([v2 hasPrefix:@"K"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 hasPrefix:@"k"];
  }

  return v3;
}

- (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3010000000;
  v19 = &unk_21C61F6D6;
  long long v20 = xmmword_21C614BF0;
  uint64_t v7 = [v5 length];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__CLKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke;
  v13[3] = &unk_26440F0E0;
  id v8 = v6;
  id v14 = v8;
  v15 = &v16;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v13);
  NSUInteger v9 = v17[4];
  NSUInteger v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  NSUInteger v11 = v9;
  NSUInteger v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

void __70__CLKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = [a2 objectForKeyedSubscript:*MEMORY[0x263EFF460]];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v9 + 32) = a3;
    *(void *)(v9 + 40) = a4;
    *a5 = 1;
  }
}

- (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4
{
  NSUInteger v4 = objc_msgSend(a4, "stringByReplacingCharactersInRange:withString:", a3.location, a3.length, &stru_26CCC52F8);
  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (id)_fallbackSequence
{
  uint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  NSUInteger v4 = v3;
  if (self->_timeZone) {
    objc_msgSend(v3, "setTimeZone:");
  }
  id v5 = [v4 components:16 fromDate:self->_startDate toDate:self->_endDate options:0];
  uint64_t v6 = [v5 day];

  if (v6)
  {
    uint64_t v7 = &unk_26CCDC618;
    goto LABEL_9;
  }
  uint64_t v7 = [MEMORY[0x263EFF980] arrayWithObject:&unk_26CCDC100];
  uint64_t v8 = [v4 component:64 fromDate:self->_startDate];
  if (v8 | [v4 component:64 fromDate:self->_endDate])
  {
    [v7 addObject:&unk_26CCDC130];
    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {
    [v7 addObject:&unk_26CCDC118];
    [v7 addObject:&unk_26CCDC130];
  }
  [v7 addObject:&unk_26CCDC148];
LABEL_9:

  return v7;
}

- (id)_attributedTextForSequenceItem:(int64_t)a3 style:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v7 = [(CLKTimeIntervalTextProvider *)self _timeIntervalFullAttributedTextWithStyle:v6];
      goto LABEL_9;
    case 1:
      uint64_t v7 = [(CLKTimeIntervalTextProvider *)self _timeIntervalDropMinutesAttributedTextWithStyle:v6];
      goto LABEL_9;
    case 2:
      uint64_t v7 = [(CLKTimeIntervalTextProvider *)self _startTimeFullAttributedTextWithStyle:v6];
      goto LABEL_9;
    case 3:
      uint64_t v7 = [(CLKTimeIntervalTextProvider *)self _startTimeDropMinutesAttributedTextWithStyle:v6];
      goto LABEL_9;
    case 4:
      uint64_t v7 = [(CLKTimeIntervalTextProvider *)self _dateIntervalWideAttributedTextWithStyle:v6];
      goto LABEL_9;
    case 5:
      uint64_t v7 = [(CLKTimeIntervalTextProvider *)self _dateIntervalNarrowAttributedTextWithStyle:v6];
LABEL_9:
      uint64_t v8 = (void *)v7;
      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

- (id)_timeIntervalFullAttributedTextWithStyle:(id)a3
{
  return [(CLKTimeIntervalTextProvider *)self _timeIntervalAttributedTextWithStyle:a3 dropMinutes:0 onlyStartDate:0];
}

- (id)_timeIntervalDropMinutesAttributedTextWithStyle:(id)a3
{
  return [(CLKTimeIntervalTextProvider *)self _timeIntervalAttributedTextWithStyle:a3 dropMinutes:1 onlyStartDate:0];
}

- (id)_startTimeFullAttributedTextWithStyle:(id)a3
{
  return [(CLKTimeIntervalTextProvider *)self _timeIntervalAttributedTextWithStyle:a3 dropMinutes:0 onlyStartDate:1];
}

- (id)_startTimeDropMinutesAttributedTextWithStyle:(id)a3
{
  return [(CLKTimeIntervalTextProvider *)self _timeIntervalAttributedTextWithStyle:a3 dropMinutes:1 onlyStartDate:1];
}

- (id)_dateIntervalWideAttributedTextWithStyle:(id)a3
{
  return [(CLKTimeIntervalTextProvider *)self _dateIntervalAttributedTextWithStyle:a3 narrow:0];
}

- (id)_dateIntervalNarrowAttributedTextWithStyle:(id)a3
{
  return [(CLKTimeIntervalTextProvider *)self _dateIntervalAttributedTextWithStyle:a3 narrow:1];
}

- (id)_timeIntervalAttributedTextWithStyle:(id)a3 dropMinutes:(BOOL)a4 onlyStartDate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v110[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [v8 font];
  id v10 = [v9 CLKFontWithAlternativePunctuation];

  NSUInteger v11 = [(CLKTextProvider *)self fontFeatures];

  if (v11)
  {
    NSUInteger v12 = [(CLKTextProvider *)self fontFeatures];
    uint64_t v13 = [v10 CLKFontByApplyingFeatureSettings:v12];

    id v10 = (void *)v13;
  }
  id v14 = (void *)MEMORY[0x263F08790];
  if (v6) {
    v15 = &_CLKNoMinutesTimeFormatTemplate;
  }
  else {
    v15 = _CLKStandardTimeFormatTemplate;
  }
  uint64_t v16 = *v15;
  uint64_t v17 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v18 = [v14 dateFormatFromTemplate:v16 options:0 locale:v17];

  char v96 = 0;
  v19 = [(CLKTextProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:v18 designatorExists:&v96];

  [(NSDateFormatter *)self->_dateFormatter setDateFormat:v19];
  long long v20 = [(NSDateFormatter *)self->_dateFormatter _attributedStringWithFieldsFromDate:self->_startDate];
  v21 = [v20 string];

  if (v21)
  {
    uint64_t v23 = [(CLKTimeIntervalTextProvider *)self _rangeOfDesignatorInAnnotatedTime:v20];
    uint64_t v91 = v22;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = 0;
      if (!v5)
      {
LABEL_9:
        v94 = v10;
        v25 = v24;
        v26 = v19;
        id v27 = v8;
        p_endDate = (uint64_t *)&self->_endDate;
        v29 = [(NSDateFormatter *)self->_dateFormatter _attributedStringWithFieldsFromDate:self->_endDate];
        v30 = [v29 string];

        if (!v30)
        {
          v36 = CLKLoggingObjectForDomain(4);
          id v8 = v27;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:](p_endDate, v36);
          }
          id v34 = 0;
          v19 = v26;
          uint64_t v24 = (uint64_t)v25;
          v37 = v29;
          v38 = v36;
          id v10 = v94;
          goto LABEL_55;
        }
        uint64_t v90 = v23;
        uint64_t v31 = [(CLKTimeIntervalTextProvider *)self _rangeOfDesignatorInAnnotatedTime:v29];
        uint64_t v88 = v32;
        uint64_t v89 = 0x7FFFFFFFFFFFFFFFLL;
        v93 = v29;
        if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v33 = 0;
        }
        else
        {
          uint64_t v39 = v31;
          v40 = objc_msgSend(v29, "attributedSubstringFromRange:", v31, v32);
          uint64_t v33 = [v40 string];

          uint64_t v89 = v39;
        }
        id v8 = v27;
        v19 = v26;
        uint64_t v24 = (uint64_t)v25;
        id v10 = v94;
LABEL_22:
        v95 = CLKLocalizedString(@"INTERVAL_HYPHEN_NARROW");
        v92 = v33;
        if (!(v24 | v33))
        {
          if (v5)
          {
            v41 = [v20 string];
            v37 = v93;
          }
          else
          {
            v53 = NSString;
            v54 = [v20 string];
            v37 = v93;
            v55 = [v93 string];
            uint64_t v56 = [v53 stringWithFormat:@"%@%@%@", v54, v95, v55];

            v41 = (void *)v56;
          }
          id v57 = objc_alloc(MEMORY[0x263F086A0]);
          uint64_t v109 = *MEMORY[0x263F82270];
          v110[0] = v10;
          v58 = [NSDictionary dictionaryWithObjects:v110 forKeys:&v109 count:1];
          id v34 = (id)[v57 initWithString:v41 attributes:v58];
          v38 = v92;
          goto LABEL_54;
        }
        v84 = v19;
        uint64_t v42 = *MEMORY[0x263F82270];
        uint64_t v107 = *MEMORY[0x263F82270];
        v108 = v10;
        uint64_t v87 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        v43 = [v8 smallCapsBaseFont];
        v44 = [(CLKTextProvider *)self fontFeatures];

        if (v44)
        {
          v45 = [(CLKTextProvider *)self fontFeatures];
          [v43 CLKFontByApplyingFeatureSettings:v45];
          v47 = id v46 = v8;

          v43 = (void *)v47;
          id v8 = v46;
        }
        id v85 = v8;
        v86 = v43;
        if (CLKUsesFauxSmallCaps())
        {
          v48 = [v8 smallCapsBaseFont];
          v49 = [v8 font];
          int v50 = [v48 isEqual:v49];

          if (v50)
          {
            [v10 pointSize];
            id v52 = [v10 fontWithSize:v51 + -2.5];
          }
          else
          {
            id v52 = v43;
          }
          v59 = v52;
          v106[0] = v52;
          uint64_t v60 = *MEMORY[0x263F03998];
          v105[0] = v42;
          v105[1] = v60;
          uint64_t v103 = *MEMORY[0x263F03990];
          id v104 = v52;
          v61 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
          v106[1] = v61;
          v62 = NSDictionary;
          v63 = v106;
          v64 = v105;
        }
        else
        {
          if ((CTFontGetSymbolicTraits((CTFontRef)v10) & 1) == 0)
          {
            uint64_t v97 = v42;
            v59 = [v43 CLKFontWithLocalizedSmallCaps];
            v98 = v59;
            v58 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
            goto LABEL_38;
          }
          [v10 pointSize];
          v59 = [v10 fontWithSize:v65 * 0.75];
          v102[0] = v59;
          uint64_t v66 = *MEMORY[0x263F03998];
          v101[0] = v42;
          v101[1] = v66;
          uint64_t v99 = *MEMORY[0x263F03990];
          v100 = v59;
          v61 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          v102[1] = v61;
          v62 = NSDictionary;
          v63 = v102;
          v64 = v101;
        }
        v58 = [v62 dictionaryWithObjects:v63 forKeys:v64 count:2];

LABEL_38:
        id v67 = objc_alloc(MEMORY[0x263F089B8]);
        v68 = [v20 string];
        v69 = (void *)[v67 initWithString:v68 attributes:v87];

        objc_msgSend(v69, "addAttributes:range:", v58, v90, v91);
        if (v5)
        {
          id v34 = v69;
          v69 = v34;
          v19 = v84;
          v41 = (void *)v87;
          v38 = v92;
          v37 = v93;
LABEL_53:

          id v8 = v85;
LABEL_54:

LABEL_55:
          goto LABEL_56;
        }
        id v70 = objc_alloc(MEMORY[0x263F089B8]);
        v71 = [v93 string];
        v72 = (void *)[v70 initWithString:v71 attributes:v87];

        v83 = v72;
        objc_msgSend(v72, "addAttributes:range:", v58, v89, v88);
        v73 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v95 attributes:v87];
        v38 = v92;
        if (v92 && [(id)v24 isEqualToString:v92])
        {
          if (!CLKDropLeftRedundantDesignator())
          {
            v82 = v73;
            v19 = v84;
            if (v89 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v41 = (void *)v87;
LABEL_51:
              unint64_t v78 = 0x263F08000uLL;
              v73 = v82;
              goto LABEL_52;
            }
            v79 = [v93 string];
            v75 = -[CLKTimeIntervalTextProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v89, v88, v79);

            v41 = (void *)v87;
            uint64_t v80 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:v75 attributes:v87];
            v77 = v83;
            v83 = (void *)v80;
LABEL_50:

            v38 = v92;
            goto LABEL_51;
          }
          v19 = v84;
          if (v90 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v82 = v73;
            v74 = [v20 string];
            v75 = -[CLKTimeIntervalTextProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v90, v91, v74);

            v41 = (void *)v87;
            uint64_t v76 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:v75 attributes:v87];
            v77 = v69;
            v69 = (void *)v76;
            goto LABEL_50;
          }
        }
        else
        {
          v19 = v84;
        }
        v41 = (void *)v87;
        unint64_t v78 = 0x263F08000;
LABEL_52:
        id v34 = (id)[objc_alloc(*(Class *)(v78 + 2488)) initWithAttributedString:v69];
        [v34 appendAttributedString:v73];
        [v34 appendAttributedString:v83];

        v37 = v93;
        goto LABEL_53;
      }
    }
    else
    {
      v35 = objc_msgSend(v20, "attributedSubstringFromRange:", v23, v22);
      uint64_t v24 = [v35 string];

      if (!v5) {
        goto LABEL_9;
      }
    }
    uint64_t v90 = v23;
    uint64_t v33 = 0;
    v93 = 0;
    uint64_t v88 = 0;
    uint64_t v89 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  uint64_t v24 = CLKLoggingObjectForDomain(4);
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
    -[CLKTimeIntervalTextProvider _timeIntervalAttributedTextWithStyle:dropMinutes:onlyStartDate:]((uint64_t *)&self->_startDate, v24);
  }
  id v34 = 0;
LABEL_56:

  return v34;
}

- (id)_dateIntervalAttributedTextWithStyle:(id)a3 narrow:(BOOL)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  if (a4) {
    BOOL v5 = @"M/d";
  }
  else {
    BOOL v5 = @"MMM d";
  }
  dateFormatter = self->_dateFormatter;
  id v7 = a3;
  [(NSDateFormatter *)dateFormatter setLocalizedDateFormatFromTemplate:v5];
  id v8 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_startDate];
  uint64_t v9 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_endDate];
  id v10 = [v7 font];

  NSUInteger v11 = [(CLKTextProvider *)self fontFeatures];

  if (v11)
  {
    NSUInteger v12 = [(CLKTextProvider *)self fontFeatures];
    uint64_t v13 = [v10 CLKFontByApplyingFeatureSettings:v12];

    id v10 = (void *)v13;
  }
  id v14 = NSString;
  v15 = CLKLocalizedString(@"INTERVAL_HYPHEN_WIDE");
  uint64_t v16 = [v14 stringWithFormat:@"%@%@%@", v8, v15, v9];

  id v17 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v21 = *MEMORY[0x263F82270];
  v22[0] = v10;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v19 = (void *)[v17 initWithString:v16 attributes:v18];

  return v19;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CLKTimeIntervalTextProvider;
  id v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalTextProvider;
  objc_super v4 = [(CLKTextProvider *)&v7 copyWithZone:a3];
  p_isa = (id *)&v4->super.super.isa;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_startDate, self->_startDate);
    objc_storeStrong(p_isa + 19, self->_endDate);
    objc_storeStrong(p_isa + 20, self->_timeZone);
  }
  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalTextProvider;
  if ([(CLKTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_startDate, v4[18])
    && CLKEqualObjects(self->_endDate, v4[19]))
  {
    char v5 = CLKEqualObjects(self->_timeZone, v4[20]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)CLKTimeIntervalTextProvider;
  uint64_t v3 = [(CLKTextProvider *)&v7 hash];
  objc_super v4 = &v3[[(NSDate *)self->_startDate hash]];
  char v5 = &v4[4 * [(NSDate *)self->_endDate hash]];
  return (unint64_t)&v5[16 * [(NSTimeZone *)self->_timeZone hash]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKTimeIntervalTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"_startDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_endDate forKey:@"_endDate"];
  [v4 encodeObject:self->_timeZone forKey:@"_timeZone"];
}

- (CLKTimeIntervalTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeIntervalTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v10;
  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKTimeIntervalTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v16 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"startDate"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v6];
    uint64_t v8 = (void *)v5[18];
    v5[18] = v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"endDate"];
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v9];
    NSUInteger v11 = (void *)v5[19];
    v5[19] = v10;

    NSUInteger v12 = [v4 objectForKeyedSubscript:@"timeZone"];
    if (v12)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x263EFFA18]) initWithJSONObjectRepresentation:v12];
      id v14 = (void *)v5[20];
      v5[20] = v13;
    }
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)CLKTimeIntervalTextProvider;
  uint64_t v3 = [(CLKTextProvider *)&v8 JSONObjectRepresentation];
  id v4 = [(NSDate *)self->_startDate JSONObjectRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"startDate"];

  objc_super v5 = [(NSDate *)self->_endDate JSONObjectRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"endDate"];

  uint64_t v6 = [(NSTimeZone *)self->_timeZone JSONObjectRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"timeZone"];

  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(NSDate *)startDate
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(NSDate *)endDate
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_fallbackSequence, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)_validate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "Value of 'startDate' must be earlier than 'endDate' on %@", (uint8_t *)&v4, 0xCu);
}

- (void)_timeIntervalAttributedTextWithStyle:(uint64_t *)a1 dropMinutes:(NSObject *)a2 onlyStartDate:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "CLKTimeIntervalTextProvider unexpected nil annotated start string (startDate = %@)", (uint8_t *)&v3, 0xCu);
}

- (void)_timeIntervalAttributedTextWithStyle:(uint64_t *)a1 dropMinutes:(NSObject *)a2 onlyStartDate:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "CLKTimeIntervalTextProvider unexpected nil annotated end string (endDate = %@)", (uint8_t *)&v3, 0xCu);
}

@end