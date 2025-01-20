@interface SFSearchSuggestion(PARInitializers)
- (uint64_t)initWithSuggestion:()PARInitializers query:score:fbr:;
- (void)initWithIdentifier:()PARInitializers suggestion:query:score:fbr:;
@end

@implementation SFSearchSuggestion(PARInitializers)

- (uint64_t)initWithSuggestion:()PARInitializers query:score:fbr:
{
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = [v10 UUID];
  v15 = [v14 UUIDString];
  uint64_t v16 = [a1 initWithIdentifier:v15 suggestion:v13 query:v12 score:v11 fbr:a2];

  return v16;
}

- (void)initWithIdentifier:()PARInitializers suggestion:query:score:fbr:
{
  id v12 = a7;
  id v13 = (void *)[a1 initWithIdentifier:a4 suggestion:a5 query:a6 score:1 type:a2];
  v14 = v13;
  if (v13) {
    [v13 setFbr:v12];
  }

  return v14;
}

@end