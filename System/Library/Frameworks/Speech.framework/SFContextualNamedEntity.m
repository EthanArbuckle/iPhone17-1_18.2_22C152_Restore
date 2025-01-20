@interface SFContextualNamedEntity
- (SFContextualNamedEntity)init;
- (SFContextualNamedEntity)initWithPeopleSuggesterRecipientDisplayName:(id)a3;
- (SFContextualNamedEntity)initWithPersonalizationPortraitName:(id)a3 score:(double)a4 category:(unint64_t)a5 language:(id)a6;
@end

@implementation SFContextualNamedEntity

- (SFContextualNamedEntity)initWithPersonalizationPortraitName:(id)a3 score:(double)a4 category:(unint64_t)a5 language:(id)a6
{
  uint64_t v8 = sub_1B7237188();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1B7237188();
  return (SFContextualNamedEntity *)sub_1B71FB804(v8, v10, a5, v11, v12, a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (SFContextualNamedEntity)initWithPeopleSuggesterRecipientDisplayName:(id)a3
{
  uint64_t v3 = sub_1B7237188();
  return (SFContextualNamedEntity *)sub_1B71FBA0C(v3, v4);
}

- (SFContextualNamedEntity)init
{
}

@end