@interface NSUserActivity(IntentsAdditions)
- (BOOL)_hasInteraction;
- (id)_appIntent;
- (id)_intentsIdentifier;
- (id)_intents_copy;
- (id)interaction;
- (id)suggestedInvocationPhrase;
- (uint64_t)_accessedInteraction;
- (uint64_t)_executionContext;
- (uint64_t)_setAppIntent:()IntentsAdditions;
- (uint64_t)setInteraction:()IntentsAdditions;
- (uint64_t)shortcutAvailability;
- (void)_initWithIntent:()IntentsAdditions;
- (void)_intentsPrepareForEncoding;
- (void)_setAccessedInteraction:()IntentsAdditions;
- (void)_setExecutionContext:()IntentsAdditions;
- (void)_setInteraction:()IntentsAdditions donate:;
- (void)setShortcutAvailability:()IntentsAdditions;
- (void)setSuggestedInvocationPhrase:()IntentsAdditions;
@end

@implementation NSUserActivity(IntentsAdditions)

- (uint64_t)shortcutAvailability
{
  uint64_t v4 = 0;
  v1 = [a1 _payloadForIdentifier:@"UAINShortcutAvailabilityOptionsPayload"];
  uint64_t v2 = 0;
  if ([v1 length] == 8)
  {
    [v1 getBytes:&v4 length:8];
    uint64_t v2 = v4;
  }

  return v2;
}

- (id)suggestedInvocationPhrase
{
  v1 = [a1 _payloadForIdentifier:@"UAINSuggestedInvocationPhrasePayload"];
  if ([v1 length]) {
    uint64_t v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_intents_copy
{
  v1 = INUserActivitySerializeToData(a1);
  uint64_t v2 = INUserActivityDeserializeFromData(v1);

  return v2;
}

- (uint64_t)_executionContext
{
  uint64_t v4 = 0;
  v1 = [a1 _payloadForIdentifier:@"_UAINExecutionContextPayload"];
  uint64_t v2 = 0;
  if ([v1 length] == 8)
  {
    [v1 getBytes:&v4 length:8];
    uint64_t v2 = v4;
  }

  return v2;
}

- (void)_setExecutionContext:()IntentsAdditions
{
  uint64_t v5 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:8];
  [a1 _setPayload:v4 object:0 identifier:@"_UAINExecutionContextPayload"];
}

- (void)_intentsPrepareForEncoding
{
  id v2 = (id)[a1 _intentsIdentifier];
  id v4 = [a1 interaction];
  if (v4)
  {
    [a1 _setInteraction:0 donate:0];
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    [a1 _setPayload:v3 object:v4 identifier:@"UAINInteractionPayload"];
  }
}

- (id)_intentsIdentifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 _payloadForIdentifier:@"UAIntentsIdentifierPayload"];
  if (!v2) {
    goto LABEL_7;
  }
  id v12 = 0;
  v3 = objc_msgSend(MEMORY[0x1E4F28DC0], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v12);
  id v4 = v12;
  if (v4)
  {
    uint64_t v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[NSUserActivity(IntentsAdditions) _intentsIdentifier]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s Unable to unarchive intentsIdentifier with error: %@", buf, 0x16u);
    }
  }

  if (v3)
  {
    v6 = v2;
  }
  else
  {
LABEL_7:
    v7 = [MEMORY[0x1E4F29128] UUID];
    v3 = [v7 UUIDString];

    id v11 = 0;
    v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v11];
    id v8 = v11;

    if (v8)
    {
      v9 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[NSUserActivity(IntentsAdditions) _intentsIdentifier]";
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_error_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_ERROR, "%s Unable to archive intentsIdentifierPayload with error: %@", buf, 0x16u);
      }
    }
    [a1 _setPayload:v6 object:v3 identifier:@"UAIntentsIdentifierPayload"];
  }

  return v3;
}

- (void)setShortcutAvailability:()IntentsAdditions
{
  uint64_t v5 = a3;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:8];
  [a1 _setPayload:v4 object:0 identifier:@"UAINShortcutAvailabilityOptionsPayload"];
}

- (void)setSuggestedInvocationPhrase:()IntentsAdditions
{
  id v4 = a3;
  id v5 = [v4 dataUsingEncoding:4];
  [a1 _setPayload:v5 object:v4 identifier:@"UAINSuggestedInvocationPhrasePayload"];
}

- (uint64_t)setInteraction:()IntentsAdditions
{
  return [a1 _setInteraction:a3 donate:1];
}

- (void)_setAccessedInteraction:()IntentsAdditions
{
  id v2 = (const void *)_accessedInteractionPropertyKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

- (uint64_t)_accessedInteraction
{
  v1 = objc_getAssociatedObject(a1, (const void *)_accessedInteractionPropertyKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (BOOL)_hasInteraction
{
  v1 = [a1 _payloadForIdentifier:@"UAINInteractionPayload"];
  BOOL v2 = [v1 length] != 0;

  return v2;
}

- (void)_setInteraction:()IntentsAdditions donate:
{
  id v6 = a3;
  id v10 = v6;
  if (v6)
  {
    v7 = [v6 intent];
    INIssueSandboxExtensionsForFileURLEnumerable(v7);

    id v8 = [v10 intentResponse];
    v9 = v8;
    if (v8) {
      INIssueSandboxExtensionsForFileURLEnumerable(v8);
    }
    if (a4) {
      [v10 donateInteractionWithCompletion:0];
    }
    [a1 _setPayloadIdentifier:@"UAINInteractionPayload" object:v10 withBlock:&__block_literal_global_21];
  }
  else
  {
    [a1 _setPayload:0 object:0 identifier:@"UAINInteractionPayload"];
  }
}

- (id)interaction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [a1 _objectForIdentifier:@"UAINInteractionPayload"];
  if (v2)
  {
LABEL_2:
    id v3 = INTypedInteractionWithInteraction(v2);

    goto LABEL_3;
  }
  id v3 = [a1 _payloadForIdentifier:@"UAINInteractionPayload"];
  if (v3)
  {
    id v7 = 0;
    BOOL v2 = objc_msgSend(MEMORY[0x1E4F28DC0], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v7);
    id v5 = v7;
    if (v5)
    {
      id v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "-[NSUserActivity(IntentsAdditions) interaction]";
        __int16 v10 = 2112;
        id v11 = v5;
        _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s Unable to unarchive interactionPayloadData with error: %@", buf, 0x16u);
      }
    }

    if (v2) {
      goto LABEL_2;
    }
    id v3 = 0;
  }
LABEL_3:
  [a1 _setAccessedInteraction:1];

  return v3;
}

- (uint64_t)_setAppIntent:()IntentsAdditions
{
  if (a3) {
    return [a1 _setPayloadIdentifier:@"UAINAppIntentPayload" object:a3 withBlock:&__block_literal_global_18364];
  }
  else {
    return [a1 _setPayload:0 object:0 identifier:@"UAINAppIntentPayload"];
  }
}

- (id)_appIntent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [a1 _objectForIdentifier:@"UAINAppIntentPayload"];
  if (!v2)
  {
    id v3 = [a1 _payloadForIdentifier:@"UAINAppIntentPayload"];
    if (v3)
    {
      id v7 = 0;
      BOOL v2 = objc_msgSend(MEMORY[0x1E4F28DC0], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v7);
      id v4 = v7;
      if (v4)
      {
        id v5 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v9 = "-[NSUserActivity(IntentsAdditions) _appIntent]";
          __int16 v10 = 2112;
          id v11 = v4;
          _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s Unable to unarchive interactionPayloadData with error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      BOOL v2 = 0;
    }
  }

  return v2;
}

- (void)_initWithIntent:()IntentsAdditions
{
  id v4 = a3;
  id v5 = [v4 _className];
  id v6 = (void *)[a1 initWithActivityType:v5];

  if (v6)
  {
    id v7 = [[INInteraction alloc] initWithIntent:v4 response:0];
    [(INInteraction *)v7 setIntentHandlingStatus:5];
    [v6 _setInteraction:v7 donate:0];
    objc_msgSend(v6, "_setExecutionContext:", objc_msgSend(v4, "_executionContext"));
    id v8 = v6;
  }
  return v6;
}

@end