@interface AXVoiceOverPunctuationBaseController
- (NSArray)customPunctuationGroups;
- (NSArray)systemPunctuationGroups;
@end

@implementation AXVoiceOverPunctuationBaseController

- (NSArray)systemPunctuationGroups
{
  v2 = +[AXSSPunctuationManager sharedDatabase];
  v3 = [v2 punctuationGroups];
  v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_26);

  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_271];

  return (NSArray *)v5;
}

BOOL __63__AXVoiceOverPunctuationBaseController_systemPunctuationGroups__block_invoke(id a1, AXSSPunctuationGroup *a2, unint64_t a3, BOOL *a4)
{
  return [(AXSSPunctuationGroup *)a2 isSystemPunctuationGroup];
}

int64_t __63__AXVoiceOverPunctuationBaseController_systemPunctuationGroups__block_invoke_2(id a1, AXSSPunctuationGroup *a2, AXSSPunctuationGroup *a3)
{
  v4 = a2;
  v5 = a3;
  v6 = [(AXSSPunctuationGroup *)v4 uuid];
  unsigned __int8 v7 = [v6 isEqual:AXSSVoiceOverPunctuationGroupAll];

  if (v7) {
    goto LABEL_4;
  }
  v8 = [(AXSSPunctuationGroup *)v4 uuid];
  if (([v8 isEqual:AXSSVoiceOverPunctuationGroupSome] & 1) == 0)
  {

    goto LABEL_6;
  }
  v9 = [(AXSSPunctuationGroup *)v5 uuid];
  unsigned int v10 = [v9 isEqual:AXSSVoiceOverPunctuationGroupAll];

  if (v10)
  {
LABEL_6:
    v12 = [(AXSSPunctuationGroup *)v4 uuid];
    unsigned int v13 = [v12 isEqual:AXSSVoiceOverPunctuationGroupNone];

    int64_t v11 = v13;
    goto LABEL_7;
  }
LABEL_4:
  int64_t v11 = -1;
LABEL_7:

  return v11;
}

- (NSArray)customPunctuationGroups
{
  v2 = +[AXSSPunctuationManager sharedDatabase];
  v3 = [v2 punctuationGroups];
  v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_273);
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_275];

  return (NSArray *)v5;
}

BOOL __63__AXVoiceOverPunctuationBaseController_customPunctuationGroups__block_invoke(id a1, AXSSPunctuationGroup *a2, unint64_t a3, BOOL *a4)
{
  return [(AXSSPunctuationGroup *)a2 isSystemPunctuationGroup] ^ 1;
}

int64_t __63__AXVoiceOverPunctuationBaseController_customPunctuationGroups__block_invoke_2(id a1, AXSSPunctuationGroup *a2, AXSSPunctuationGroup *a3)
{
  v4 = a3;
  v5 = [(AXSSPunctuationGroup *)a2 name];
  v6 = [(AXSSPunctuationGroup *)v4 name];

  id v7 = [v5 localizedCompare:v6];
  return (int64_t)v7;
}

@end