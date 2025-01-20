@interface BBMuteAssertion
+ (BOOL)supportsSecureCoding;
+ (id)assertionFromUNCMuteAssertion:(id)a3;
- (BBMuteAssertion)initWithCoder:(id)a3;
- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4;
- (id)_init;
- (id)toUNCMuteAssertion;
- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5;
@end

@implementation BBMuteAssertion

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)BBMuteAssertion;
  return [(BBMuteAssertion *)&v3 init];
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"BBMuteAssertion.m" lineNumber:30 description:@"use subclasses"];

  return 0;
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"BBMuteAssertion.m" lineNumber:35 description:@"use subclasses"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBMuteAssertion)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BBMuteAssertion;
  return [(BBMuteAssertion *)&v4 init];
}

+ (id)assertionFromUNCMuteAssertion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 expirationDate];
    uint64_t v7 = +[BBSectionMuteAssertion sectionMuteAssertionUntilDate:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:a2 object:a1 file:@"BBMuteAssertion.m" lineNumber:72 description:@"unsupported subclass"];
      v8 = 0;
      goto LABEL_9;
    }
    v6 = [v5 expirationDateByThreadID];
    uint64_t v7 = +[BBThreadsMuteAssertion threadsMuteAssertionWithExpirationDateByThreadID:v6];
  }
  v8 = (void *)v7;
LABEL_9:

LABEL_10:
  return v8;
}

- (id)toUNCMuteAssertion
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BBMuteAssertion.m" lineNumber:78 description:@"use subclasses"];

  return 0;
}

@end