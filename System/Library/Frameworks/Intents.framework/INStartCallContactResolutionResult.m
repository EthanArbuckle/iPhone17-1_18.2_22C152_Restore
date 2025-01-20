@interface INStartCallContactResolutionResult
+ (INStartCallContactResolutionResult)unsupportedForReason:(INStartCallContactUnsupportedReason)reason;
+ (id)confirmationRequiredWithPersonToConfirm:(id)a3 forReason:(int64_t)a4;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INStartCallContactResolutionResult

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)INStartCallContactResolutionResult;
  v4 = [(INIntentResolutionResult *)&v14 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 3
    && [(INIntentResolutionResult *)self confirmationReason])
  {
    v5 = [v4 payloadConfirmation];
    [v5 setReason:1000];

    v6 = [v4 payloadConfirmation];
    unint64_t v7 = [(INIntentResolutionResult *)self confirmationReason] - 1;
    if (v7 < 5) {
      uint64_t v8 = (v7 + 1);
    }
    else {
      uint64_t v8 = 0x7FFFFFFFLL;
    }
    [v6 setStartCallIntentContactsConfirmationReason:v8];
  }
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    v9 = [v4 payloadUnsupported];
    [v9 setReason:1000];

    v10 = [v4 payloadUnsupported];
    unint64_t v11 = [(INIntentResolutionResult *)self unsupportedReason];
    switch(v11)
    {
      case 1uLL:
        uint64_t v12 = 1;
        break;
      case 2uLL:
        uint64_t v12 = 2;
        break;
      case 3uLL:
        uint64_t v12 = 3;
        break;
      case 4uLL:
        uint64_t v12 = 4;
        break;
      case 5uLL:
        uint64_t v12 = 5;
        break;
      case 6uLL:
        uint64_t v12 = 6;
        break;
      case 7uLL:
        uint64_t v12 = 7;
        break;
      case 8uLL:
        uint64_t v12 = 10;
        break;
      default:
        if (v11 == 1000) {
          uint64_t v12 = 8;
        }
        else {
          uint64_t v12 = 0x7FFFFFFFLL;
        }
        break;
    }
    [v10 setStartCallIntentContactsUnsupportedReason:v12];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INStartCallContactResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v19 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    uint64_t v8 = [v6 payloadConfirmation];
    int v9 = [v8 hasStartCallIntentContactsConfirmationReason];

    if (v9)
    {
      v10 = [v6 payloadConfirmation];
      uint64_t v11 = [v10 startCallIntentContactsConfirmationReason] - 1;
      if (v11 < 5) {
        uint64_t v12 = v11 + 1;
      }
      else {
        uint64_t v12 = 0;
      }
      [v7 setConfirmationReason:v12];
    }
    v13 = [v6 payloadUnsupported];
    int v14 = [v13 hasStartCallIntentContactsUnsupportedReason];

    if (v14)
    {
      v15 = [v6 payloadUnsupported];
      unsigned int v16 = [v15 startCallIntentContactsUnsupportedReason] - 1;
      if (v16 > 9) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = qword_18CFC50B0[v16];
      }
      [v7 setUnsupportedReason:v17];
    }
  }

  return v7;
}

+ (INStartCallContactResolutionResult)unsupportedForReason:(INStartCallContactUnsupportedReason)reason
{
  v4 = [a1 unsupported];
  [v4 setUnsupportedReason:reason];

  return (INStartCallContactResolutionResult *)v4;
}

+ (id)confirmationRequiredWithPersonToConfirm:(id)a3 forReason:(int64_t)a4
{
  v5 = [a1 confirmationRequiredWithPersonToConfirm:a3];
  [v5 setConfirmationReason:a4];

  return v5;
}

@end