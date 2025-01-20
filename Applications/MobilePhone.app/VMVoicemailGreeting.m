@interface VMVoicemailGreeting
- (BOOL)isEqual:(id)a3;
@end

@implementation VMVoicemailGreeting

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = VMVoicemailGreeting.isEqual(_:)((uint64_t)v8);

  outlined destroy of Locale?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6;
}

@end