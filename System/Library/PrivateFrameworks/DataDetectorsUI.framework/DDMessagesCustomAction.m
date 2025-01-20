@interface DDMessagesCustomAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
- (id)iconName;
- (id)localizedName;
- (void)performFromView:(id)a3;
@end

@implementation DDMessagesCustomAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  char HasType = (char)a4;
  if (a4)
  {
    v5 = +[DDDetectionController messagesActionHandler];
    if (v5) {
      char HasType = DDResultHasType();
    }
    else {
      char HasType = 0;
    }
  }
  return HasType;
}

- (id)localizedName
{
  v2 = NSString;
  v3 = DDLocalizedString(@"Send %@");
  v4 = objc_msgSend(v2, "stringWithFormat:", v3, DDResultGetMatchedString());

  return v4;
}

- (id)iconName
{
  return @"applepaycash";
}

- (void)performFromView:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->super._result)
  {
    v3 = +[DDDetectionController messagesActionHandler];
    if (v3)
    {
      if (DDResultHasType()) {
        DDResultCurrencyExtraction();
      }
    }
  }
}

@end