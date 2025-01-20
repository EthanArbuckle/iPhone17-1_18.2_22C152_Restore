@interface CSPerson(Suggestions)
- (SGSimpleNamedEmailAddress)sg_namedEmailAddress;
- (id)sg_emailAddress;
- (id)sg_initWithNamedEmailAddress:()Suggestions;
- (id)sg_initWithSerializedForm:()Suggestions;
- (id)sg_serialized;
@end

@implementation CSPerson(Suggestions)

- (id)sg_initWithSerializedForm:()Suggestions
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = SGDelimitedStringsDeserialize(a3);
  if ([v4 count] == 3)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      v7 = [v4 objectAtIndexedSubscript:0];
    }
    else
    {
      v7 = 0;
    }
    v9 = [v4 objectAtIndexedSubscript:1];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = [v4 objectAtIndexedSubscript:1];
    }
    else
    {
      v11 = 0;
    }
    v12 = [v4 objectAtIndexedSubscript:2];
    if (v11)
    {
      v15[0] = v11;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      v13 = 0;
    }
    v8 = (void *)[a1 initWithDisplayName:v7 handles:v13 handleIdentifier:v12];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sg_serialized
{
  uint64_t v3 = [a1 displayName];
  v4 = (void *)v3;
  v5 = &stru_1EF915628;
  if (v3) {
    uint64_t v6 = (__CFString *)v3;
  }
  else {
    uint64_t v6 = &stru_1EF915628;
  }
  v7 = [a1 handles];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    v1 = [a1 handles];
    v5 = [v1 objectAtIndexedSubscript:0];
  }
  v18 = [a1 handleIdentifier];
  v16 = SGDelimitedStringsSerialize(v6, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);

  if (v8)
  {
  }

  return v16;
}

- (id)sg_initWithNamedEmailAddress:()Suggestions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a3;
  uint64_t v6 = [v5 name];
  v7 = [v5 emailAddress];

  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = (void *)[v4 initWithDisplayName:v6 handles:v8 handleIdentifier:@"emailAddresses"];

  return v9;
}

- (SGSimpleNamedEmailAddress)sg_namedEmailAddress
{
  v2 = objc_msgSend(a1, "sg_emailAddress");
  if (v2)
  {
    uint64_t v3 = [SGSimpleNamedEmailAddress alloc];
    id v4 = [a1 displayName];
    id v5 = [(SGSimpleNamedEmailAddress *)v3 initWithName:v4 emailAddress:v2];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)sg_emailAddress
{
  v2 = [a1 handleIdentifier];
  int v3 = [v2 isEqualToString:@"emailAddresses"];

  if (v3
    && ([a1 handles],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    uint64_t v6 = [a1 handles];
    v7 = [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end