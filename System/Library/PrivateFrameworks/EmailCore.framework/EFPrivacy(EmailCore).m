@interface EFPrivacy(EmailCore)
+ (__CFString)ec_partiallyRedactedStringForAddress:()EmailCore;
+ (id)_redactedMailboxPathForMailboxPath:()EmailCore;
+ (id)ec_partiallyRedactedStringForAddress:()EmailCore localPart:domain:;
+ (id)ec_partiallyRedactedStringForSubjectOrSummary:()EmailCore;
+ (id)ec_redactedStringForMailboxURL:()EmailCore;
+ (uint64_t)_isWellKnownMailboxName:()EmailCore;
@end

@implementation EFPrivacy(EmailCore)

+ (id)ec_redactedStringForMailboxURL:()EmailCore
{
  id v4 = a3;
  v5 = [v4 scheme];
  v6 = [v4 host];
  v7 = [v4 path];
  v8 = [a1 _redactedMailboxPathForMailboxPath:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v9 setScheme:v5];
  [v9 setHost:v6];
  v10 = [NSString stringWithFormat:@"/%@", v8];
  [v9 setPath:v10];

  v11 = [v4 absoluteString];
  v12 = [a1 partiallyRedactedStringForString:v11 maximumUnredactedLength:0];

  id v13 = [NSString alloc];
  v14 = [v9 string];
  v15 = (void *)[v13 initWithFormat:@"%@%@", v14, v12];

  return v15;
}

+ (id)_redactedMailboxPathForMailboxPath:()EmailCore
{
  id v4 = a3;
  if ([a1 _isWellKnownMailboxName:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v4];
  }
  v6 = v5;

  return v6;
}

+ (uint64_t)_isWellKnownMailboxName:()EmailCore
{
  return objc_msgSend(a3, "ef_caseInsensitiveIsEqualToString:", @"INBOX");
}

+ (id)ec_partiallyRedactedStringForSubjectOrSummary:()EmailCore
{
  v3 = [a1 partiallyRedactedStringForString:a3 maximumUnredactedLength:3];
  return v3;
}

+ (__CFString)ec_partiallyRedactedStringForAddress:()EmailCore
{
  id v4 = a3;
  id v5 = [v4 emailAddressValue];
  if (v5)
  {
    v6 = [v4 stringValue];
    v7 = [v5 localPart];
    v8 = [v5 domain];
    objc_msgSend(a1, "ec_partiallyRedactedStringForAddress:localPart:domain:", v6, v7, v8);
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = [v4 stringValue];
    if (v6)
    {
      id v9 = [a1 partiallyRedactedStringForString:v6];
    }
    else
    {
      id v9 = @"NULL";
    }
  }

  return v9;
}

+ (id)ec_partiallyRedactedStringForAddress:()EmailCore localPart:domain:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length])
  {
    uint64_t v10 = [v7 length];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithString:v7];
    if ([v8 length])
    {
      uint64_t v12 = [v8 rangeOfComposedCharacterSequenceAtIndex:0];
      v14 = [v8 substringToIndex:v12 + v13];
    }
    else
    {
      v14 = &stru_1F1A635E8;
    }
    v16 = NSString;
    uint64_t v17 = [v9 rangeOfComposedCharacterSequenceAtIndex:0];
    v19 = [v9 substringToIndex:v17 + v18];
    v20 = [v11 redactedStringValue];
    [v16 stringWithFormat:@"\"%@...@%@...\"<%lu chars, hash=%@>", v14, v19, v10, v20];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v7;
  }

  return v15;
}

@end