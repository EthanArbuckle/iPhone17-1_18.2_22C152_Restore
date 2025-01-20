@interface EKParticipant(MobileCal)
- (id)commentLabelString;
- (uint64_t)displayName;
- (uint64_t)displayNameWithDecomposedFirstName:()MobileCal lastName:department:;
@end

@implementation EKParticipant(MobileCal)

- (uint64_t)displayName
{
  return [MEMORY[0x1E4F57B30] displayStringForIdentity:a1 useAddressAsFallback:1 contactIdentifier:0];
}

- (uint64_t)displayNameWithDecomposedFirstName:()MobileCal lastName:department:
{
  return [MEMORY[0x1E4F57B30] displayStringForIdentityWithDecomposedName:a1 useAddressAsFallback:1 contactIdentifier:0 outFirstName:a3 outLastName:a4 outDepartment:a5];
}

- (id)commentLabelString
{
  v2 = [a1 inviterNameString];
  if ([v2 length])
  {
    v3 = NSString;
    v4 = EventKitUIBundle();
    v5 = [v4 localizedStringForKey:@"Invited by %@" value:&stru_1F0CC2140 table:0];
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  v7 = (void *)MEMORY[0x1E4F57BA8];
  v8 = [a1 comment];
  v9 = [v7 stringWithAutoCommentRemoved:v8];

  if (v9 && [v9 length])
  {
    v10 = NSString;
    v11 = EventKitUIBundle();
    v12 = [v11 localizedStringForKey:@"“%@”" value:&stru_1F0CC2140 table:0];
    v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);

    if (v6)
    {
      uint64_t v14 = [v6 stringByAppendingFormat:@"\n%@", v13];

      id v6 = (id)v14;
    }
    else
    {
      id v6 = v13;
    }
  }

  return v6;
}

@end