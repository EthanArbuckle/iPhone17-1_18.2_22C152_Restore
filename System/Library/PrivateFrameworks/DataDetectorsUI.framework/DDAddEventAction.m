@interface DDAddEventAction
+ (BOOL)actionAvailableForEvent:(id)a3;
+ (BOOL)isAvailable;
+ (id)cachedEventForICSString:(id)a3;
+ (id)icsEventForICSString:(id)a3;
- (DDRemoteActionViewController)viewController;
- (id)compactTitle;
- (id)eventStartDateFromCache;
- (id)eventTitleFromCache;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (id)quickActionTitle;
- (id)variantIconName;
- (int)interactionType;
- (void)invalidate;
- (void)prepareViewControllerForActionController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation DDAddEventAction

- (void)invalidate
{
  v3 = [(DDAddEventAction *)self viewController];
  [v3 setAction:0];

  [(DDAddEventAction *)self setViewController:0];
}

- (id)localizedName
{
  return DDLocalizedString(@"Add to Calendar");
}

- (id)iconName
{
  return @"calendar.badge.plus";
}

- (id)variantIconName
{
  return @"calendar";
}

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable];
}

- (int)interactionType
{
  return 1;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3 = +[DDRemoteActionViewController prepareViewController:@"DDEventAddViewController" forAction:self actionController:a3];
}

+ (id)icsEventForICSString:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1A6236B60]();
  gotLoadHelper_x8__OBJC_CLASS___ICSDocument(v5);
  id v7 = objc_alloc(*(Class *)(v6 + 3912));
  uint64_t v16 = 0;
  v8 = (void *)[v7 initWithICSString:v3 options:0 error:&v16];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 calendar];
    unsigned int v11 = [v10 method];
    if (v11 > 5 || ((1 << v11) & 0x27) == 0)
    {
      v14 = 0;
    }
    else
    {
      v13 = [v10 components];
      v14 = [v13 firstObject];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)cachedEventForICSString:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    if ([MEMORY[0x1E4F25550] authorizationStatusForEntityType:0] == 3)
    {
      double v5 = (void *)[objc_alloc(MEMORY[0x1E4F25550]) initWithOptions:48 path:0];
      if (v5)
      {
        uint64_t v6 = [v4 dataUsingEncoding:4];
        id v7 = [v5 importICSData:v6 intoCalendar:0 options:0];
        v8 = [v7 firstObject];

        if (v8)
        {
          v14[0] = @"event";
          v14[1] = @"store";
          v15[0] = v8;
          v15[1] = v5;
          v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

LABEL_8:
          goto LABEL_11;
        }
      }
    }
    else
    {
      uint64_t v10 = [a1 icsEventForICSString:v4];
      if (v10)
      {
        double v5 = (void *)v10;
        v12 = @"icsEvent";
        uint64_t v13 = v10;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
        goto LABEL_8;
      }
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)eventTitleFromCache
{
  v2 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
  id v3 = _eventTitleFromCache(v2);

  return v3;
}

- (id)eventStartDateFromCache
{
  v2 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
  id v3 = _eventStartDateFromCache(v2);

  return v3;
}

- (id)compactTitle
{
  uint64_t v3 = [(DDAddEventAction *)self eventTitleFromCache];
  if (v3)
  {
    id v4 = (void *)v3;
    double v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];
    id v7 = [v6 firstObject];
    v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v9 = [v7 stringByTrimmingCharactersInSet:v8];

    if ([v9 length])
    {
      id v9 = v9;
      uint64_t v10 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = 0;
  }
  unsigned int v11 = [(DDAddEventAction *)self eventStartDateFromCache];
  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v10 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v11 dateStyle:1 timeStyle:1];
  if (![v10 length])
  {

LABEL_8:
    v13.receiver = self;
    v13.super_class = (Class)DDAddEventAction;
    uint64_t v10 = [(DDAction *)&v13 compactTitle];
  }

LABEL_10:
  return v10;
}

- (id)quickActionTitle
{
  __int16 v13 = 0;
  uint64_t v3 = [(DDAddEventAction *)self eventStartDateFromCache];
  if (v3) {
    goto LABEL_2;
  }
  id v9 = [(DDAction *)self associatedResults];
  uint64_t v10 = [(DDAction *)self context];
  uint64_t v3 = beginDateOfEventResults(v9, v10, (unsigned char *)&v13 + 1, (BOOL *)&v13, 0);

  if (!v3) {
    goto LABEL_8;
  }
  if (!(_BYTE)v13)
  {
LABEL_2:
    id v4 = (void *)MEMORY[0x1E4F28C10];
    BOOL v5 = HIBYTE(v13) != 1;
    uint64_t v6 = v3;
    uint64_t v7 = 3;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v6 = v3;
    uint64_t v7 = 0;
    BOOL v5 = 1;
  }
  v8 = [v4 localizedStringFromDate:v6 dateStyle:v7 timeStyle:v5];
  if ([v8 length]) {
    goto LABEL_9;
  }

LABEL_8:
  v12.receiver = self;
  v12.super_class = (Class)DDAddEventAction;
  v8 = [(DDAction *)&v12 quickActionTitle];
LABEL_9:

  return v8;
}

- (id)notificationTitle
{
  uint64_t v3 = [(DDAddEventAction *)self eventTitleFromCache];
  id v4 = [(DDAddEventAction *)self eventStartDateFromCache];
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v4 dateStyle:1 timeStyle:1];
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v6 = [v3 length];
  uint64_t v7 = [v5 length];
  v8 = NSString;
  if (v6 && v7)
  {
    id v9 = DDLocalizedString(@"Add “%@” on %@ to Calendar");
    __int16 v13 = v5;
LABEL_7:
    objc_msgSend(v8, "stringWithFormat:", v9, v3, v13);
    goto LABEL_11;
  }
  if (v7)
  {
    id v9 = DDLocalizedString(@"Add event on %@ to Calendar");
    objc_super v12 = v5;
  }
  else
  {
    if (v6)
    {
      id v9 = DDLocalizedString(@"Add “%@” to Calendar");
      goto LABEL_7;
    }
    id v9 = DDLocalizedString(@"Add an ICS event to Calendar");
  }
  objc_msgSend(v8, "stringWithFormat:", v9, v12, v13);
  uint64_t v10 = LABEL_11:;

  return v10;
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.mobilecal";
}

- (id)notificationURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"x-barcode-datadetectors-action:event"];
}

+ (BOOL)actionAvailableForEvent:(id)a3
{
  if (a3) {
    return [a1 isAvailable];
  }
  else {
    return 0;
  }
}

- (DDRemoteActionViewController)viewController
{
  return self->viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end