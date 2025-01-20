@interface MPModelSocialPerson
+ (id)__artworkCatalogBlock_KEY;
+ (id)__biography_KEY;
+ (id)__handle_KEY;
+ (id)__hasLightweightProfile_KEY;
+ (id)__pendingRequestsCount_KEY;
+ (id)__privatePerson_KEY;
+ (id)__uncensoredName_KEY;
+ (id)__verified_KEY;
+ (id)kind;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertySocialPersonArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonBiography__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonHandle__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonHasLightweightProfile__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonIsPrivate__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonIsVerified__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonPendingRequestsCount__MAPPING_MISSING__;
+ (void)__MPModelPropertySocialPersonUncensoredName__MAPPING_MISSING__;
- (id)artworkCatalog;
@end

@implementation MPModelSocialPerson

+ (id)__verified_KEY
{
  return @"MPModelPropertySocialPersonIsVerified";
}

+ (id)__uncensoredName_KEY
{
  return @"MPModelPropertySocialPersonUncensoredName";
}

+ (id)__privatePerson_KEY
{
  return @"MPModelPropertySocialPersonIsPrivate";
}

+ (id)__pendingRequestsCount_KEY
{
  return @"MPModelPropertySocialPersonPendingRequestsCount";
}

+ (id)__hasLightweightProfile_KEY
{
  return @"MPModelPropertySocialPersonHasLightweightProfile";
}

+ (id)__handle_KEY
{
  return @"MPModelPropertySocialPersonHandle";
}

+ (id)__biography_KEY
{
  return @"MPModelPropertySocialPersonBiography";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertySocialPersonArtwork";
}

+ (int64_t)genericObjectType
{
  return 17;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelSocialPerson *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelSocialPerson *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)kind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

+ (void)__MPModelPropertySocialPersonHasLightweightProfile__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:36 description:@"Translator was missing mapping for MPModelPropertySocialPersonHasLightweightProfile"];
}

+ (void)__MPModelPropertySocialPersonArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:35 description:@"Translator was missing mapping for MPModelPropertySocialPersonArtwork"];
}

+ (void)__MPModelPropertySocialPersonPendingRequestsCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:34 description:@"Translator was missing mapping for MPModelPropertySocialPersonPendingRequestsCount"];
}

+ (void)__MPModelPropertySocialPersonIsVerified__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:33 description:@"Translator was missing mapping for MPModelPropertySocialPersonIsVerified"];
}

+ (void)__MPModelPropertySocialPersonIsPrivate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:32 description:@"Translator was missing mapping for MPModelPropertySocialPersonIsPrivate"];
}

+ (void)__MPModelPropertySocialPersonBiography__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:31 description:@"Translator was missing mapping for MPModelPropertySocialPersonBiography"];
}

+ (void)__MPModelPropertySocialPersonHandle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertySocialPersonHandle"];
}

+ (void)__MPModelPropertySocialPersonUncensoredName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSocialPerson.m" lineNumber:29 description:@"Translator was missing mapping for MPModelPropertySocialPersonUncensoredName"];
}

@end