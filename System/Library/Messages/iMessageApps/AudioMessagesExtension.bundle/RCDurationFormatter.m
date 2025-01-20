@interface RCDurationFormatter
+ (id)_localizedDateTimeFormatForDurationFormattingStyle:(int64_t)a3;
+ (id)_localizedPositionalFormatStringForDurationFormattingStyle:(int64_t)a3;
+ (id)_localizedPositionalFormatStringForLocalizedDateTimeFormat:(id)a3;
+ (id)sharedFormatter;
- (RCDurationFormatter)init;
- (id)_hiddenComponentStringWithString:(id)a3;
- (id)_onQueuePositionalFormatStringForStyle:(int64_t)a3;
- (id)_onQueueStringFromDuration:(double)a3 byReplacingDigitsWithDigit:(int64_t)a4 hideComponentOptions:(int64_t)a5 style:(int64_t)a6;
- (id)_onQueueStringFromDuration:(double)a3 style:(int64_t)a4;
- (id)stringFromDuration:(double)a3 hideComponentOptions:(int64_t)a4 style:(int64_t)a5;
- (id)stringFromDuration:(double)a3 replacingDigitsWithDigit:(unint64_t)a4 style:(int64_t)a5;
- (id)stringFromDuration:(double)a3 style:(int64_t)a4;
- (void)_onQueueReloadLocalizedFormatStrings;
- (void)reloadLocalizedFormatStrings;
@end

@implementation RCDurationFormatter

- (RCDurationFormatter)init
{
  v15.receiver = self;
  v15.super_class = (Class)RCDurationFormatter;
  v2 = [(RCDurationFormatter *)&v15 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = +[NSOperationQueue mainQueue];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_1F10C;
    v12 = &unk_6D6A8;
    objc_copyWeak(&v13, &location);
    id v5 = [v3 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v4 usingBlock:&v9];

    dispatch_queue_t v6 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    [(RCDurationFormatter *)v2 reloadLocalizedFormatStrings];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedFormatter
{
  if (qword_82E90 != -1) {
    dispatch_once(&qword_82E90, &stru_6D6C8);
  }
  v2 = (void *)qword_82E98;

  return v2;
}

- (id)stringFromDuration:(double)a3 replacingDigitsWithDigit:(unint64_t)a4 style:(int64_t)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1F2D4;
  id v13 = sub_1F2E4;
  id v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F2EC;
  block[3] = &unk_6D6F0;
  block[4] = self;
  block[5] = &v9;
  *(double *)&block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_sync(queue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)stringFromDuration:(double)a3 hideComponentOptions:(int64_t)a4 style:(int64_t)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1F2D4;
  id v13 = sub_1F2E4;
  id v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F43C;
  block[3] = &unk_6D6F0;
  block[4] = self;
  block[5] = &v9;
  *(double *)&block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_sync(queue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)stringFromDuration:(double)a3 style:(int64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_1F2D4;
  v12 = sub_1F2E4;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F58C;
  v7[3] = &unk_6D558;
  v7[4] = self;
  v7[5] = &v8;
  *(double *)&v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)reloadLocalizedFormatStrings
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F654;
  block[3] = &unk_6D490;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_onQueueStringFromDuration:(double)a3 byReplacingDigitsWithDigit:(int64_t)a4 hideComponentOptions:(int64_t)a5 style:(int64_t)a6
{
  id v6 = (char *)a6;
  char v56 = a5;
  uint64_t v9 = (unint64_t)(a3 * 100.0) % 0x64;
  uint64_t v10 = @"0";
  unint64_t v11 = (unint64_t)a3;
  switch(a6)
  {
    case 0:
    case 2:
      goto LABEL_6;
    case 1:
      uint64_t v10 = @"00";
LABEL_6:
      unint64_t v14 = v11 / 0x3C;
      unint64_t v15 = v11 >> 4;
      v11 %= 0x3CuLL;
      uint64_t v13 = v14 - 60 * ((unint64_t)((v14 * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1);
      uint64_t v12 = (unint64_t)((v15 * (unsigned __int128)0x91A2B3C4D5E6F81uLL) >> 64) >> 3;
      break;
    case 3:
    case 4:
      uint64_t v12 = 0;
      uint64_t v13 = v11 / 0x3C;
      v11 %= 0x3CuLL;
      break;
    case 5:
    case 6:
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      break;
    default:
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      unint64_t v11 = 0;
      break;
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    v16 = (char *)[(__CFString *)v10 length];
    unint64_t v17 = RCNumberOfDigitsInInteger(v12);
    if ((unint64_t)v16 <= v17) {
      v18 = (char *)v17;
    }
    else {
      v18 = v16;
    }
    uint64_t v12 = a4;
    v19 = v18 - 1;
    if (v19)
    {
      uint64_t v20 = 10;
      uint64_t v12 = a4;
      do
      {
        v12 += v20 * a4;
        v20 *= 10;
        --v19;
      }
      while (v19);
    }
    unint64_t v21 = RCNumberOfDigitsInInteger(v13);
    uint64_t v22 = 2;
    if (v21 > 2) {
      uint64_t v22 = v21;
    }
    uint64_t v23 = v22 - 1;
    uint64_t v24 = 10;
    uint64_t v13 = a4;
    do
    {
      v13 += v24 * a4;
      v24 *= 10;
      --v23;
    }
    while (v23);
    unint64_t v25 = RCNumberOfDigitsInInteger(v11);
    uint64_t v26 = 2;
    if (v25 > 2) {
      uint64_t v26 = v25;
    }
    uint64_t v27 = v26 - 1;
    uint64_t v28 = 10;
    unint64_t v11 = a4;
    do
    {
      v11 += v28 * a4;
      v28 *= 10;
      --v27;
    }
    while (v27);
    unint64_t v29 = RCNumberOfDigitsInInteger(v9);
    uint64_t v30 = 2;
    if (v29 > 2) {
      uint64_t v30 = v29;
    }
    uint64_t v31 = v30 - 1;
    uint64_t v32 = 10;
    uint64_t v9 = a4;
    do
    {
      v9 += v32 * a4;
      v32 *= 10;
      --v31;
    }
    while (v31);
  }
  v33 = self;
  defaultFormatter = self->_defaultFormatter;
  p_defaultFormatter = (id *)&self->_defaultFormatter;
  v36 = +[NSNumber numberWithUnsignedInteger:v9];
  v37 = [(NSNumberFormatter *)defaultFormatter stringFromNumber:v36];

  v38 = v33;
  if (v56)
  {
    uint64_t v39 = [(RCDurationFormatter *)v33 _hiddenComponentStringWithString:v37];

    v37 = (void *)v39;
  }
  id v40 = *p_defaultFormatter;
  v41 = +[NSNumber numberWithUnsignedInteger:v11];
  v42 = [v40 stringFromNumber:v41];

  if ((v56 & 2) != 0)
  {
    uint64_t v43 = [(RCDurationFormatter *)v38 _hiddenComponentStringWithString:v42];

    v42 = (void *)v43;
  }
  id v44 = *p_defaultFormatter;
  v45 = +[NSNumber numberWithUnsignedInteger:v13];
  v46 = [v44 stringFromNumber:v45];

  if ((v56 & 4) != 0)
  {
    uint64_t v47 = [(RCDurationFormatter *)v38 _hiddenComponentStringWithString:v46];

    v46 = (void *)v47;
  }
  if (v6 == (unsigned char *)&def_3AC7C + 2) {
    goto LABEL_35;
  }
  if (v6 == (unsigned char *)&def_3AC7C + 1)
  {
LABEL_36:
    id v48 = *p_defaultFormatter;
    goto LABEL_38;
  }
  if (!v6)
  {
LABEL_35:
    p_defaultFormatter = (id *)&v38->_nonPaddedHourFormatter;
    goto LABEL_36;
  }
  id v48 = 0;
LABEL_38:
  v49 = +[NSNumber numberWithUnsignedInteger:v12];
  v50 = [v48 stringFromNumber:v49];

  v51 = v38;
  if ((v56 & 8) != 0)
  {
    uint64_t v52 = [(RCDurationFormatter *)v38 _hiddenComponentStringWithString:v50];

    v50 = (void *)v52;
  }
  v53 = [(RCDurationFormatter *)v51 _onQueuePositionalFormatStringForStyle:v6];
  switch((unint64_t)v6)
  {
    case 0uLL:
    case 5uLL:
    case 6uLL:
      v55 = v37;
      goto LABEL_42;
    case 1uLL:
    case 2uLL:
    case 4uLL:
LABEL_42:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v50, v46, v42, v55);
      goto LABEL_43;
    case 3uLL:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v46, v42, v37, v55);
LABEL_43:
      id v6 = (char *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

- (id)_hiddenComponentStringWithString:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableString string];
  id v5 = [v3 length];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1FBF8;
  v9[3] = &unk_6D620;
  id v10 = v4;
  id v6 = v4;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v9);

  id v7 = [v6 copy];

  return v7;
}

- (id)_onQueueStringFromDuration:(double)a3 style:(int64_t)a4
{
  return [(RCDurationFormatter *)self _onQueueStringFromDuration:-1 byReplacingDigitsWithDigit:0 hideComponentOptions:a4 style:a3];
}

- (id)_onQueuePositionalFormatStringForStyle:(int64_t)a3
{
  positionalParameterFormatStrings = self->_positionalParameterFormatStrings;
  v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)positionalParameterFormatStrings objectForKey:v4];

  return v5;
}

- (void)_onQueueReloadLocalizedFormatStrings
{
  id v3 = +[NSMutableDictionary dictionary];
  positionalParameterFormatStrings = self->_positionalParameterFormatStrings;
  self->_positionalParameterFormatStrings = v3;

  for (uint64_t i = 0; i != 7; ++i)
  {
    id v6 = [(id)objc_opt_class() _localizedPositionalFormatStringForDurationFormattingStyle:i];
    if (v6)
    {
      id v7 = self->_positionalParameterFormatStrings;
      uint64_t v8 = +[NSNumber numberWithInteger:i];
      [(NSMutableDictionary *)v7 setObject:v6 forKey:v8];
    }
  }
  uint64_t v9 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
  defaultFormatter = self->_defaultFormatter;
  self->_defaultFormatter = v9;

  [(NSNumberFormatter *)self->_defaultFormatter setNumberStyle:0];
  [(NSNumberFormatter *)self->_defaultFormatter setMinimumIntegerDigits:2];
  [(NSNumberFormatter *)self->_defaultFormatter setPositiveFormat:@"00"];
  unint64_t v11 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
  nonPaddedHourFormatter = self->_nonPaddedHourFormatter;
  self->_nonPaddedHourFormatter = v11;

  [(NSNumberFormatter *)self->_nonPaddedHourFormatter setNumberStyle:0];
  [(NSNumberFormatter *)self->_nonPaddedHourFormatter setMinimumIntegerDigits:1];
  uint64_t v13 = self->_nonPaddedHourFormatter;

  [(NSNumberFormatter *)v13 setPositiveFormat:@"0"];
}

+ (id)_localizedDateTimeFormatForDurationFormattingStyle:(int64_t)a3
{
  if (qword_82EA8 != -1) {
    dispatch_once(&qword_82EA8, &stru_6D710);
  }
  id v4 = objc_alloc((Class)NSLocale);
  id v5 = +[NSLocale currentLocale];
  id v6 = [v5 localeIdentifier];
  id v7 = [v4 initWithLocaleIdentifier:v6];

  uint64_t v8 = (void *)qword_82EA0;
  uint64_t v9 = +[NSNumber numberWithInteger:a3];
  id v10 = [v8 objectForKeyedSubscript:v9];

  DateFormatFromTemplate = (__CFString *)CFDateFormatterCreateDateFormatFromTemplate(kCFAllocatorDefault, v10, 0, (CFLocaleRef)v7);
  uint64_t v12 = [v7 localeIdentifier];
  if ([v12 hasPrefix:@"ee_"]
    && [(__CFString *)DateFormatFromTemplate hasPrefix:@"'aɖabaƒoƒo' "])
  {
    uint64_t v13 = -[__CFString substringFromIndex:](DateFormatFromTemplate, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);

    DateFormatFromTemplate = (__CFString *)v13;
  }

  return DateFormatFromTemplate;
}

+ (id)_localizedPositionalFormatStringForLocalizedDateTimeFormat:(id)a3
{
  id v3 = [a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"HH", @"%1$@", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"H", @"%1$@", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"mm", @"%2$@", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"m", @"%2$@", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"ss", @"%3$@", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"s", @"%3$@", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"SS", @"%4$@", 0, 0, objc_msgSend(v3, "length"));

  return v3;
}

+ (id)_localizedPositionalFormatStringForDurationFormattingStyle:(int64_t)a3
{
  id v4 = [(id)objc_opt_class() _localizedDateTimeFormatForDurationFormattingStyle:a3];
  id v5 = [a1 _localizedPositionalFormatStringForLocalizedDateTimeFormat:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonPaddedHourFormatter, 0);
  objc_storeStrong((id *)&self->_defaultFormatter, 0);
  objc_storeStrong((id *)&self->_positionalParameterFormatStrings, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end