@interface EMMessageSnippetHintZoneBuilder
+ (OS_os_log)log;
+ (id)authorHintsFromHintsBySnippetZone:(id)a3;
+ (id)snippetHintZoneFromString:(id)a3;
@end

@implementation EMMessageSnippetHintZoneBuilder

+ (id)authorHintsFromHintsBySnippetZone:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [v3 objectForKeyedSubscript:@"EMMessageSnippetHintZoneAuthor"];
    [v4 addObjectsFromArray:v5];

    v6 = [v3 objectForKeyedSubscript:@"EMMessageSnippetHintZoneAuthorEmailAddresses"];
    [v4 addObjectsFromArray:v6];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EMMessageSnippetHintZoneBuilder_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_28 != -1) {
    dispatch_once(&log_onceToken_28, block);
  }
  v2 = (void *)log_log_28;
  return (OS_os_log *)v2;
}

void __38__EMMessageSnippetHintZoneBuilder_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_28;
  log_log_28 = (uint64_t)v1;
}

+ (id)snippetHintZoneFromString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F22B30]] & 1) != 0
    || ([v3 isEqualToString:@"EMMessageSnippetHintZoneAuthor"] & 1) != 0)
  {
    v4 = @"EMMessageSnippetHintZoneAuthor";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F22B18]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneAuthorEmailAddresses"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneAuthorEmailAddresses";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F235C0]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneSubject"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneSubject";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F235F8]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneTextContent"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneTextContent";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F234B0]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneRecipients"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneRecipients";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F234A8]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneRecipientEmailAddresses"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneRecipientEmailAddresses";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F22D48]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneEmailAddresses"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneEmailAddresses";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F22AE0]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneAttachmentNames"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneAttachmentNames";
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F22AF0]] & 1) != 0 {
         || ([v3 isEqualToString:@"EMMessageSnippetHintZoneAttachmentTypes"] & 1) != 0)
  }
  {
    v4 = @"EMMessageSnippetHintZoneAttachmentTypes";
  }
  else
  {
    v6 = +[EMMessageSnippetHintZoneBuilder log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[EMMessageSnippetHintZoneBuilder snippetHintZoneFromString:]((uint64_t)v3, v6);
    }

    v4 = @"EMMessageSnippetHintZoneOther";
  }

  return v4;
}

+ (void)snippetHintZoneFromString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "[Snippet Hints] Unsupported snippet hint zone: %@", (uint8_t *)&v2, 0xCu);
}

@end