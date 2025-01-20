@interface UMUserPersona(BRAdditions)
- (__CFString)br_personaID;
@end

@implementation UMUserPersona(BRAdditions)

- (__CFString)br_personaID
{
  v2 = @"__defaultPersonaID__";
  if ([a1 isDataSeparatedPersona])
  {
    uint64_t v3 = [a1 userPersonaUniqueString];
    v4 = (void *)v3;
    if (v3) {
      v5 = (__CFString *)v3;
    }
    else {
      v5 = @"__defaultPersonaID__";
    }
    v2 = v5;
  }

  return v2;
}

@end