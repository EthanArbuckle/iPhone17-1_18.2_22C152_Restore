@interface BYMultilingualAnalyticsEvent
+ (id)identifierForAction:(unint64_t)a3;
+ (id)stringDescriptionForArray:(id)a3;
+ (id)stringDescriptionForNestedArray:(id)a3;
+ (id)stringNameForMultilingualPane:(unint64_t)a3;
+ (unint64_t)actionTypeForStarting:(id)a3 endingDataSet:(id)a4;
+ (void)recordExpressPaneShownUserCustomized:(BOOL)a3 withData:(id)a4 analyticsManager:(id)a5;
+ (void)recordMultilingualPane:(unint64_t)a3 startingData:(id)a4 modifiedData:(id)a5 analyticsManager:(id)a6;
- (BYMultilingualAnalyticsEvent)initWithWithEventName:(id)a3 sourcePane:(id)a4;
- (NSMutableDictionary)mutablePayload;
- (NSString)eventName;
- (id)description;
- (void)recordWithAnalyticsManager:(id)a3;
- (void)setEventName:(id)a3;
- (void)setMutablePayload:(id)a3;
@end

@implementation BYMultilingualAnalyticsEvent

- (BYMultilingualAnalyticsEvent)initWithWithEventName:(id)a3 sourcePane:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v5 = v14;
  id v14 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)BYMultilingualAnalyticsEvent;
  id v14 = [(BYMultilingualAnalyticsEvent *)&v11 init];
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    objc_storeStrong((id *)v14 + 2, location[0]);
    CFStringRef v15 = @"pane";
    id v16 = v12;
    v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v7 = [(NSDictionary *)v6 mutableCopy];
    v8 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v7;
  }
  v9 = (BYMultilingualAnalyticsEvent *)v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v9;
}

- (void)recordWithAnalyticsManager:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  v4 = [(BYMultilingualAnalyticsEvent *)v10 eventName];
  id v5 = [(BYMultilingualAnalyticsEvent *)v10 mutablePayload];
  id v6 = [(NSMutableDictionary *)v5 copy];
  [v3 addEvent:v4 withPayload:v6 persist:1];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(BYMultilingualAnalyticsEvent *)v10 description];
    sub_10004B238((uint64_t)buf, (uint64_t)v7);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "recording MultilingualAnalyticsEvent %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

+ (void)recordMultilingualPane:(unint64_t)a3 startingData:(id)a4 modifiedData:(id)a5 analyticsManager:(id)a6
{
  id v23 = a1;
  SEL v22 = a2;
  unint64_t v21 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  v8 = [BYMultilingualAnalyticsEvent alloc];
  id v9 = [v23 stringNameForMultilingualPane:v21];
  id v17 = [(BYMultilingualAnalyticsEvent *)v8 initWithWithEventName:@"com.apple.setupassistant.ios.multilingual.individual" sourcePane:v9];

  id v16 = [v23 actionTypeForStarting:location endingDataSet:v19];
  id v10 = [v17 mutablePayload];
  id v11 = [v23 identifierForAction:v16];
  [v10 setObject:v11 forKey:@"typeValue"];

  id v12 = [v17 mutablePayload];
  id v13 = [v23 stringDescriptionForArray:location];
  [v12 setObject:v13 forKey:@"startData"];

  id v14 = [v17 mutablePayload];
  id v15 = [v23 stringDescriptionForArray:v19];
  [v14 setObject:v15 forKey:@"endData"];

  [v17 recordWithAnalyticsManager:v18];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
}

+ (void)recordExpressPaneShownUserCustomized:(BOOL)a3 withData:(id)a4 analyticsManager:(id)a5
{
  id v17 = a1;
  SEL v16 = a2;
  BOOL v15 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = [v17 stringNameForMultilingualPane:3];
  id v11 = @"selectedDefaults";
  if (v15) {
    objc_storeStrong(&v11, @"selectedCustomize");
  }
  id v6 = [BYMultilingualAnalyticsEvent alloc];
  id v10 = [(BYMultilingualAnalyticsEvent *)v6 initWithWithEventName:@"com.apple.setupassistant.ios.multilingual.individual" sourcePane:v12];
  id v7 = [(BYMultilingualAnalyticsEvent *)v10 mutablePayload];
  [(NSMutableDictionary *)v7 setObject:v11 forKey:@"typeValue"];

  v8 = [(BYMultilingualAnalyticsEvent *)v10 mutablePayload];
  id v9 = [v17 stringDescriptionForNestedArray:location];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:@"endData"];

  [(BYMultilingualAnalyticsEvent *)v10 recordWithAnalyticsManager:v13];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

+ (unint64_t)actionTypeForStarting:(id)a3 endingDataSet:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = [v16 count];
  if (v5 <= [location[0] count])
  {
    id v6 = [v16 count];
    if (v6 >= [location[0] count])
    {
      id v7 = [v16 count];
      if (v7 == [location[0] count])
      {
        for (LODWORD(v15) = 0; ; LODWORD(v15) = v15 + 1)
        {
          unint64_t v8 = (int)v15;
          if (v8 >= (unint64_t)objc_msgSend(location[0], "count", v15)) {
            break;
          }
          id v9 = [v16 objectAtIndexedSubscript:(int)v15];
          id v10 = [v9 identifier];
          id v11 = [location[0] objectAtIndexedSubscript:(int)v15];
          id v12 = [v11 identifier];
          char v13 = [v10 isEqualToString:v12] ^ 1;

          if (v13)
          {
            unint64_t v18 = 2;
            goto LABEL_12;
          }
        }
      }
      unint64_t v18 = 3;
    }
    else
    {
      unint64_t v18 = 1;
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
LABEL_12:
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (id)description
{
  v2 = [(BYMultilingualAnalyticsEvent *)self mutablePayload];
  id v3 = [(NSMutableDictionary *)v2 description];

  return v3;
}

+ (id)identifierForAction:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = @"inserted";
      break;
    case 1uLL:
      v4 = @"deleted";
      break;
    case 2uLL:
      v4 = @"rearranged";
      break;
    case 3uLL:
      v4 = @"unchanged";
      break;
    default:
      break;
  }

  return v4;
}

+ (id)stringNameForMultilingualPane:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = @"Language";
      break;
    case 1uLL:
      v4 = @"Keyboard";
      break;
    case 2uLL:
      v4 = @"Dictation";
      break;
    case 3uLL:
      v4 = @"MultilingualExpress";
      break;
    default:
      break;
  }

  return v4;
}

+ (id)stringDescriptionForArray:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] valueForKey:@"identifier"];
  id v4 = [v3 componentsJoinedByString:@" "];

  objc_storeStrong(location, 0);

  return v4;
}

+ (id)stringDescriptionForNestedArray:(id)a3
{
  id v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = +[NSMutableString string];
  memset(v11, 0, sizeof(v11));
  id v3 = location[0];
  id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v11[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v7 = v13;
        id v8 = [v15 stringDescriptionForArray:v12];
        [v7 appendString:v8];

        [v13 appendString:@" | "];
      }
      id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = [v13 copy];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (NSMutableDictionary)mutablePayload
{
  return self->_mutablePayload;
}

- (void)setMutablePayload:(id)a3
{
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end