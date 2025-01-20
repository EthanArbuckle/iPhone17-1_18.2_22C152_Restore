@interface INStartCallPreferredCallProviderResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INStartCallPreferredCallProviderResolutionResult

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)INStartCallPreferredCallProviderResolutionResult;
  v4 = [(INIntentResolutionResult *)&v10 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    v5 = [v4 payloadUnsupported];
    [v5 setReason:1000];

    v6 = [v4 payloadUnsupported];
    unint64_t v7 = [(INIntentResolutionResult *)self unsupportedReason] - 1;
    if (v7 < 6) {
      uint64_t v8 = (v7 + 1);
    }
    else {
      uint64_t v8 = 0x7FFFFFFFLL;
    }
    [v6 setStartCallIntentPreferredCallProviderUnsupportedReason:v8];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INStartCallPreferredCallProviderResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v14 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    uint64_t v8 = [v6 payloadUnsupported];
    int v9 = [v8 hasStartCallIntentPreferredCallProviderUnsupportedReason];

    if (v9)
    {
      objc_super v10 = [v6 payloadUnsupported];
      uint64_t v11 = [v10 startCallIntentPreferredCallProviderUnsupportedReason] - 1;
      if (v11 < 6) {
        uint64_t v12 = v11 + 1;
      }
      else {
        uint64_t v12 = 0;
      }
      [v7 setUnsupportedReason:v12];
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

@end