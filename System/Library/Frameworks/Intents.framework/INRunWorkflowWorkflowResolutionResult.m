@interface INRunWorkflowWorkflowResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
@end

@implementation INRunWorkflowWorkflowResolutionResult

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)INRunWorkflowWorkflowResolutionResult;
  v4 = [(INIntentResolutionResult *)&v11 _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  if ([(INIntentResolutionResult *)self resolutionResultCode] == 1
    && [(INIntentResolutionResult *)self unsupportedReason])
  {
    v5 = [v4 payloadUnsupported];
    [v5 setReason:1000];

    v6 = [v4 payloadUnsupported];
    unint64_t v7 = [(INIntentResolutionResult *)self unsupportedReason];
    if (v7 == 2) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = 0x7FFFFFFF;
    }
    if (v7 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8;
    }
    [v6 setRunWorkflowIntentWorkflowUnsupportedReason:v9];
  }

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INRunWorkflowWorkflowResolutionResult;
  id v7 = [(INIntentResolutionResult *)&v14 _initWithIntentSlotResolutionResult:v6 slotDescription:a4];
  if (v7)
  {
    unsigned int v8 = [v6 payloadUnsupported];
    int v9 = [v8 hasRunWorkflowIntentWorkflowUnsupportedReason];

    if (v9)
    {
      v10 = [v6 payloadUnsupported];
      int v11 = [v10 runWorkflowIntentWorkflowUnsupportedReason];
      if (v11) {
        uint64_t v12 = 2 * (v11 == 1);
      }
      else {
        uint64_t v12 = 1;
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