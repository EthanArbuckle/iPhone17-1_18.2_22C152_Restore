@interface ProfileInformationSupport
+ (id)localizedFullNameOrAccountIdentifierWithFirstName:(id)a3 lastName:(id)a4 isContact:(BOOL)a5 accountIdentifier:(id)a6 shouldDisplaySuggestedName:(BOOL)a7 newlineBetweenNames:(BOOL)a8;
+ (id)localizedShortNameOrAccountIdentifierWithFirstName:(id)a3 lastName:(id)a4 isContact:(BOOL)a5 accountIdentifier:(id)a6 shouldDisplaySuggestedName:(BOOL)a7 newlineBetweenNames:(BOOL)a8;
- (_TtC17HealthAppServices25ProfileInformationSupport)init;
@end

@implementation ProfileInformationSupport

+ (id)localizedFullNameOrAccountIdentifierWithFirstName:(id)a3 lastName:(id)a4 isContact:(BOOL)a5 accountIdentifier:(id)a6 shouldDisplaySuggestedName:(BOOL)a7 newlineBetweenNames:(BOOL)a8
{
  return sub_1E0120D3C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, char))static ProfileInformationSupport.localizedFullNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:));
}

+ (id)localizedShortNameOrAccountIdentifierWithFirstName:(id)a3 lastName:(id)a4 isContact:(BOOL)a5 accountIdentifier:(id)a6 shouldDisplaySuggestedName:(BOOL)a7 newlineBetweenNames:(BOOL)a8
{
  return sub_1E0120D3C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, char))static ProfileInformationSupport.localizedShortNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:));
}

- (_TtC17HealthAppServices25ProfileInformationSupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfileInformationSupport();
  return [(ProfileInformationSupport *)&v3 init];
}

@end