@interface INSendAnnouncementAnnouncementResolutionResult
+ (id)confirmationRequiredWithAnnouncementToConfirm:(id)a3 forReason:(int64_t)a4;
+ (id)unsupportedForReason:(int64_t)a3;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INSendAnnouncementAnnouncementResolutionResult

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)INSendAnnouncementAnnouncementResolutionResult;
  v4 = [(INIntentResolutionResult *)&v12 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 3
    && [(INIntentResolutionResult *)self confirmationReason])
  {
    v5 = [v4 payloadConfirmation];
    [v5 setReason:1000];

    v6 = [v4 payloadConfirmation];
    if ([(INIntentResolutionResult *)self confirmationReason] == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFLL;
    }
    [v6 setSendAnnouncementIntentAnnouncementConfirmationReason:v7];
  }
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    v8 = [v4 payloadUnsupported];
    [v8 setReason:1000];

    v9 = [v4 payloadUnsupported];
    if ([(INIntentResolutionResult *)self unsupportedReason] == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 0x7FFFFFFFLL;
    }
    [v9 setSendAnnouncementIntentAnnouncementUnsupportedReason:v10];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INSendAnnouncementAnnouncementResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v15 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    v8 = [v6 payloadConfirmation];
    int v9 = [v8 hasSendAnnouncementIntentAnnouncementConfirmationReason];

    if (v9)
    {
      uint64_t v10 = [v6 payloadConfirmation];
      objc_msgSend(v7, "setConfirmationReason:", objc_msgSend(v10, "sendAnnouncementIntentAnnouncementConfirmationReason") == 1);
    }
    v11 = [v6 payloadUnsupported];
    int v12 = [v11 hasSendAnnouncementIntentAnnouncementUnsupportedReason];

    if (v12)
    {
      v13 = [v6 payloadUnsupported];
      objc_msgSend(v7, "setUnsupportedReason:", objc_msgSend(v13, "sendAnnouncementIntentAnnouncementUnsupportedReason") == 1);
    }
  }

  return v7;
}

+ (id)unsupportedForReason:(int64_t)a3
{
  v4 = [a1 unsupported];
  [v4 setUnsupportedReason:a3];

  return v4;
}

+ (id)confirmationRequiredWithAnnouncementToConfirm:(id)a3 forReason:(int64_t)a4
{
  v5 = [a1 confirmationRequiredWithAnnouncementToConfirm:a3];
  [v5 setConfirmationReason:a4];

  return v5;
}

@end