@interface INSendMessageRecipientResolutionResult
+ (INSendMessageRecipientResolutionResult)unsupportedForReason:(INSendMessageRecipientUnsupportedReason)reason;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INSendMessageRecipientResolutionResult

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)INSendMessageRecipientResolutionResult;
  v4 = [(INIntentResolutionResult *)&v12 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    v5 = [v4 payloadUnsupported];
    [v5 setReason:1000];

    v6 = [v4 payloadUnsupported];
    uint64_t v7 = [(INIntentResolutionResult *)self unsupportedReason];
    uint64_t v8 = 0x7FFFFFFFLL;
    if (v7 > 999)
    {
      if (v7 == 1002) {
        int v9 = 9;
      }
      else {
        int v9 = 0x7FFFFFFF;
      }
      if (v7 == 1001) {
        unsigned int v10 = 8;
      }
      else {
        unsigned int v10 = v9;
      }
      if (v7 == 1000) {
        uint64_t v8 = 7;
      }
      else {
        uint64_t v8 = v10;
      }
    }
    else
    {
      switch(v7)
      {
        case 1:
          uint64_t v8 = 1;
          break;
        case 2:
          uint64_t v8 = 2;
          break;
        case 3:
          uint64_t v8 = 3;
          break;
        case 4:
          uint64_t v8 = 4;
          break;
        case 5:
          uint64_t v8 = 5;
          break;
        case 6:
          uint64_t v8 = 6;
          break;
        case 7:
          uint64_t v8 = 10;
          break;
        default:
          break;
      }
    }
    [v6 setSendMessageIntentRecipientUnsupportedReason:v8];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INSendMessageRecipientResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v14 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    uint64_t v8 = [v6 payloadUnsupported];
    int v9 = [v8 hasSendMessageIntentRecipientUnsupportedReason];

    if (v9)
    {
      unsigned int v10 = [v6 payloadUnsupported];
      unsigned int v11 = [v10 sendMessageIntentRecipientUnsupportedReason] - 1;
      if (v11 > 9) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = qword_18CFC4360[v11];
      }
      [v7 setUnsupportedReason:v12];
    }
  }

  return v7;
}

+ (INSendMessageRecipientResolutionResult)unsupportedForReason:(INSendMessageRecipientUnsupportedReason)reason
{
  v4 = [a1 unsupported];
  [v4 setUnsupportedReason:reason];

  return (INSendMessageRecipientResolutionResult *)v4;
}

@end