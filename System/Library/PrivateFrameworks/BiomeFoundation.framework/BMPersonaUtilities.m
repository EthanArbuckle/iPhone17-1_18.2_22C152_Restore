@interface BMPersonaUtilities
+ (BOOL)currentPersonaIsDefault;
+ (BOOL)isUserPersonaIdentifier:(id)a3;
+ (id)allProfilesWithError:(id *)a3;
+ (id)currentPersonaIdentifier;
+ (id)currentPersonaIdentifierLoggingDescription;
+ (void)runAsPersonaIdentifier:(id)a3 block:(id)a4;
@end

@implementation BMPersonaUtilities

+ (id)currentPersonaIdentifierLoggingDescription
{
  return 0;
}

+ (id)currentPersonaIdentifier
{
  return 0;
}

+ (void)runAsPersonaIdentifier:(id)a3 block:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

+ (BOOL)currentPersonaIsDefault
{
  return 0;
}

+ (BOOL)isUserPersonaIdentifier:(id)a3
{
  return 0;
}

+ (id)allProfilesWithError:(id *)a3
{
  return 0;
}

@end