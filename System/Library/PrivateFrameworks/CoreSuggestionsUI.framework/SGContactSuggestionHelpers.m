@interface SGContactSuggestionHelpers
+ (id)contactFromSuggestedContact:(id)a3;
+ (id)formattedStringForPhone:(id)a3;
+ (id)retrieveContactStore;
+ (id)viewControllerForUpdatingContact:(id)a3 additionalContact:(id)a4;
@end

@implementation SGContactSuggestionHelpers

+ (id)formattedStringForPhone:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F1BA70];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithStringValue:v4];

    v6 = [v5 formattedStringValue];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)contactFromSuggestedContact:(id)a3
{
  return (id)[MEMORY[0x1E4F1B8F8] contactFromSuggestion:a3];
}

+ (id)retrieveContactStore
{
  id v2 = objc_alloc(MEMORY[0x1E4F1B980]);
  v3 = objc_opt_new();
  [v3 setIncludeSuggestedContacts:1];
  id v4 = (void *)[v2 initWithConfiguration:v3];

  return v4;
}

+ (id)viewControllerForUpdatingContact:(id)a3 additionalContact:(id)a4
{
  return (id)[MEMORY[0x1E4F1BBA8] viewControllerForUpdatingContact:a3 withPropertiesFromContact:a4];
}

@end