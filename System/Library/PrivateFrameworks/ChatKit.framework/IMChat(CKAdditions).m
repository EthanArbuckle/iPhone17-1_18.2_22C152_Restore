@interface IMChat(CKAdditions)
+ (id)waterMarkMessageIDCache;
+ (id)waterMarkTimeCache;
- (id)__ck_watermarkDate;
- (uint64_t)__ck_sendReadReceipts;
- (uint64_t)__ck_watermarkMessageID;
- (void)__ck_saveWatermark;
- (void)__ck_updateWatermarkToMessageID:()CKAdditions date:;
@end

@implementation IMChat(CKAdditions)

- (id)__ck_watermarkDate
{
  v2 = [(id)objc_opt_class() waterMarkTimeCache];
  v3 = [a1 guid];
  v4 = [v2 objectForKey:v3];

  if ((v4
     || ([a1 valueForChatProperty:@"CKChatWatermarkTime"],
         (v4 = objc_claimAutoreleasedReturnValue()) != 0))
    && ([v4 doubleValue], v5 > 0.0))
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 doubleValue];
    v7 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)waterMarkTimeCache
{
  if (waterMarkTimeCache_onceToken != -1) {
    dispatch_once(&waterMarkTimeCache_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)waterMarkTimeCache__waterMarkTimeCache;

  return v0;
}

+ (id)waterMarkMessageIDCache
{
  if (waterMarkMessageIDCache_onceToken != -1) {
    dispatch_once(&waterMarkMessageIDCache_onceToken, &__block_literal_global_156);
  }
  v0 = (void *)waterMarkMessageIDCache__waterMarkMessageIDCache;

  return v0;
}

- (uint64_t)__ck_watermarkMessageID
{
  v2 = [(id)objc_opt_class() waterMarkMessageIDCache];
  v3 = [a1 guid];
  v4 = [v2 objectForKey:v3];

  if (v4
    || ([a1 valueForChatProperty:@"CKChatWatermarkMessageID"],
        uint64_t result = objc_claimAutoreleasedReturnValue(),
        (v4 = (void *)result) != 0))
  {
    uint64_t v6 = [v4 longLongValue];

    return v6;
  }
  return result;
}

- (void)__ck_updateWatermarkToMessageID:()CKAdditions date:
{
  id v18 = a4;
  uint64_t v6 = [a1 guid];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(a1, "__ck_watermarkMessageID");
    if (v7 > a3) {
      a3 = v7;
    }
    v8 = [(id)objc_opt_class() waterMarkMessageIDCache];
    v9 = [NSNumber numberWithLongLong:a3];
    v10 = [a1 guid];
    [v8 setValue:v9 forKey:v10];

    v11 = objc_msgSend(a1, "__ck_watermarkDate");
    if (v11)
    {
      v12 = v11;
      id v13 = [v11 laterDate:v18];

      if (v13)
      {
LABEL_6:
        v14 = NSNumber;
        [v13 timeIntervalSince1970];
        v15 = objc_msgSend(v14, "numberWithDouble:");
LABEL_9:
        v16 = [(id)objc_opt_class() waterMarkTimeCache];
        v17 = [a1 guid];
        [v16 setValue:v15 forKey:v17];

        goto LABEL_10;
      }
    }
    else
    {
      id v13 = v18;
      if (v13) {
        goto LABEL_6;
      }
    }
    v15 = &unk_1EDF17278;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)__ck_saveWatermark
{
  v2 = [(id)objc_opt_class() waterMarkMessageIDCache];
  v3 = [a1 guid];
  id v11 = [v2 objectForKey:v3];

  v4 = [(id)objc_opt_class() waterMarkTimeCache];
  double v5 = [a1 guid];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v11)
  {
    [a1 setValue:v11 forChatProperty:@"CKChatWatermarkMessageID"];
    uint64_t v7 = [(id)objc_opt_class() waterMarkMessageIDCache];
    v8 = [a1 guid];
    [v7 removeObjectForKey:v8];
  }
  if (v6)
  {
    [a1 setValue:v6 forChatProperty:@"CKChatWatermarkTime"];
    v9 = [(id)objc_opt_class() waterMarkTimeCache];
    v10 = [a1 guid];
    [v9 removeObjectForKey:v10];
  }
}

- (uint64_t)__ck_sendReadReceipts
{
  if (IMGetDomainBoolForKey()) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = IMGetDomainBoolForKey();
  }
  v3 = [a1 valueForChatProperty:*MEMORY[0x1E4F6CD30]];
  v4 = v3;
  if (v3) {
    uint64_t v2 = [v3 BOOLValue];
  }

  return v2;
}

@end