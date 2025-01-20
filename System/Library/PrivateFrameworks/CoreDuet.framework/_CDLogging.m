@interface _CDLogging
+ (id)admissionCheckChannel;
+ (id)autoSUChannel;
+ (id)communicatorChannel;
+ (id)contextChannel;
+ (id)dataCollectionChannel;
+ (id)descriptionOfArray:(id)a3 redacted:(BOOL)a4;
+ (id)descriptionOfObject:(id)a3 redacted:(BOOL)a4;
+ (id)instrumentationChannel;
+ (id)interactionChannel;
+ (id)interactionSignpost;
+ (id)knowledgeChannel;
+ (id)knowledgeSignpost;
+ (id)mediaAnalysisChannel;
+ (id)spotlightReceiverChannel;
+ (id)syncChannel;
@end

@implementation _CDLogging

+ (id)contextChannel
{
  if (contextChannel_onceToken != -1) {
    dispatch_once(&contextChannel_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)contextChannel_contextChannel;
  return v2;
}

+ (id)knowledgeSignpost
{
  if (knowledgeSignpost_onceToken != -1) {
    dispatch_once(&knowledgeSignpost_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)knowledgeSignpost_knowledgeSignpost;
  return v2;
}

+ (id)instrumentationChannel
{
  if (instrumentationChannel_onceToken != -1) {
    dispatch_once(&instrumentationChannel_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)instrumentationChannel_instrumentationChannel;
  return v2;
}

+ (id)knowledgeChannel
{
  if (knowledgeChannel_onceToken != -1) {
    dispatch_once(&knowledgeChannel_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)knowledgeChannel_knowledgeChannel;
  return v2;
}

+ (id)spotlightReceiverChannel
{
  if (spotlightReceiverChannel_onceToken != -1) {
    dispatch_once(&spotlightReceiverChannel_onceToken, &__block_literal_global_20_1);
  }
  v2 = (void *)spotlightReceiverChannel_spotlightReceiverChannel;
  return v2;
}

+ (id)interactionChannel
{
  if (interactionChannel_onceToken != -1) {
    dispatch_once(&interactionChannel_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)interactionChannel_interactionChannel;
  return v2;
}

+ (id)mediaAnalysisChannel
{
  if (mediaAnalysisChannel__pasOnceToken52 != -1) {
    dispatch_once(&mediaAnalysisChannel__pasOnceToken52, &__block_literal_global_11_0);
  }
  v2 = (void *)mediaAnalysisChannel_mediaAnalysisChannel;
  return v2;
}

+ (id)autoSUChannel
{
  if (autoSUChannel_onceToken != -1) {
    dispatch_once(&autoSUChannel_onceToken, &__block_literal_global_16_0);
  }
  v2 = (void *)autoSUChannel_autoSUChannel;
  return v2;
}

+ (id)dataCollectionChannel
{
  if (dataCollectionChannel_onceToken != -1) {
    dispatch_once(&dataCollectionChannel_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)dataCollectionChannel_dataCollectionChannel;
  return v2;
}

+ (id)admissionCheckChannel
{
  if (admissionCheckChannel_onceToken != -1) {
    dispatch_once(&admissionCheckChannel_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)admissionCheckChannel_admissionCheckChannel;
  return v2;
}

+ (id)communicatorChannel
{
  if (communicatorChannel_onceToken != -1) {
    dispatch_once(&communicatorChannel_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)communicatorChannel_communicatorChannel;
  return v2;
}

+ (id)syncChannel
{
  if (syncChannel_onceToken != -1) {
    dispatch_once(&syncChannel_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)syncChannel_syncChannel;
  return v2;
}

+ (id)interactionSignpost
{
  if (interactionSignpost_onceToken != -1) {
    dispatch_once(&interactionSignpost_onceToken, &__block_literal_global_34_0);
  }
  v2 = (void *)interactionSignpost_interactionSignpost;
  return v2;
}

+ (id)descriptionOfObject:(id)a3 redacted:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v8 = @"nil";
    goto LABEL_9;
  }
  if (!a4)
  {
    uint64_t v7 = [v5 description];
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 redactedDescription];
LABEL_7:
    v8 = (__CFString *)v7;
    goto LABEL_9;
  }
  v8 = @"redacted";
LABEL_9:

  return v8;
}

+ (id)descriptionOfArray:(id)a3 redacted:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    if (v4 && [v5 count])
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42___CDLogging_descriptionOfArray_redacted___block_invoke;
      v11[3] = &unk_1E560FE20;
      v11[4] = &v12;
      uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v11);

      if (!*((unsigned char *)v13 + 24))
      {
        v8 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"redacted (%tu items)", objc_msgSend(v7, "count"));
        _Block_object_dispose(&v12, 8);
        goto LABEL_8;
      }
      _Block_object_dispose(&v12, 8);
    }
    else
    {
      uint64_t v7 = v6;
    }
    v8 = (__CFString *)[@"\n[\n" mutableCopy];
    v9 = objc_msgSend(v7, "_pas_componentsJoinedByString:", @",\n");
    [(__CFString *)v8 appendString:v9];

    [(__CFString *)v8 appendString:@"\n]"];
LABEL_8:

    goto LABEL_10;
  }
  v8 = @"nil";
LABEL_10:
  return v8;
}

@end