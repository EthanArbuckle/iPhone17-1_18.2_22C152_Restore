@interface FBKBugForm
+ (id)entityName;
+ (int64_t)bugFormRoleFromString:(id)a3;
+ (int64_t)bugFormTypeFromString:(id)a3;
- (BOOL)canTakeForTeam:(id)a3;
- (BOOL)collectsFiles;
- (BOOL)generatingTemp;
- (BOOL)isSurveyAvailable;
- (BOOL)matchesFormStubSignature:(id)a3;
- (BOOL)requiresPreview;
- (NSArray)questionGroups;
- (NSNumber)boxedFormRole;
- (NSString)cachedAnnouncementHTML;
- (NSString)fullAnnouncementHTML;
- (NSString)surveyAnnouncementHTML;
- (NSURL)announcementTempFile;
- (NSURL)cachedAnnouncementFile;
- (id)completedResponsesContentItems;
- (id)completedResponsesContentItemsForTeam:(id)a3;
- (id)description;
- (id)draftResponsesContentItems;
- (id)draftResponsesContentItemsForTeam:(id)a3;
- (id)feedbackTypeRank;
- (id)issueAreaDisplayNameForKeyword:(id)a3;
- (id)localizedFeedbackTypeName;
- (id)localizedFeedbackTypeShortName;
- (id)questionForQuestionID:(id)a3;
- (id)questionGroupForQuestionID:(id)a3;
- (id)questionWithRole:(id)a3;
- (id)signatureDescription;
- (id)surveyActionTextForTeam:(id)a3;
- (int64_t)feedbackType;
- (int64_t)role;
- (void)setAnnouncementTempFile:(id)a3;
- (void)setBoxedFormRole:(id)a3;
- (void)setCachedAnnouncementHTML:(id)a3;
- (void)setFeedbackType:(int64_t)a3;
- (void)setGeneratingTemp:(BOOL)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setQuestionGroups:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)updateResolvableQuestions;
@end

@implementation FBKBugForm

+ (id)entityName
{
  return @"BugForm";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  v55[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(FBKBugForm *)self setAnnouncementTempFile:0];
  [(FBKBugForm *)self setCachedAnnouncementHTML:0];
  [(FBKBugForm *)self setGeneratingTemp:0];
  v5 = [v4 objectForKeyedSubscript:@"name"];
  uint64_t v6 = FBKNilIfNSNull(v5);

  v50 = (void *)v6;
  [(FBKBugForm *)self setName:v6];
  v7 = [v4 objectForKeyedSubscript:@"is_active"];
  LODWORD(v6) = FBKJSONObjectIsNil(v7);

  v8 = NSNumber;
  if (v6)
  {
    v9 = [NSNumber numberWithInteger:0];
  }
  else
  {
    v10 = [v4 objectForKeyedSubscript:@"is_active"];
    v9 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue"));
  }
  -[FBKBugForm setActive:](self, "setActive:", [v9 BOOLValue]);
  v11 = [v4 objectForKeyedSubscript:@"text"];
  v12 = FBKNilIfNSNull(v11);

  [(FBKBugForm *)self setText:v12];
  v49 = [v4 objectForKeyedSubscript:@"form_type"];
  [(FBKBugForm *)self setFeedbackType:+[FBKBugForm bugFormTypeFromString:](FBKBugForm, "bugFormTypeFromString:")];
  v13 = [v4 objectForKeyedSubscript:@"form_role"];
  uint64_t v14 = FBKNilIfNSNull(v13);

  if (v14) {
    int64_t v15 = +[FBKBugForm bugFormRoleFromString:v14];
  }
  else {
    int64_t v15 = 0;
  }
  [(FBKBugForm *)self setRole:v15];
  v16 = [v4 objectForKeyedSubscript:@"repeat_per"];
  uint64_t v17 = FBKNilIfNSNull(v16);

  v53 = (void *)v17;
  [(FBKBugForm *)self setRepeatPer:v17];
  v18 = [v4 objectForKeyedSubscript:@"should_repeat"];
  LODWORD(v17) = FBKJSONObjectIsNil(v18);

  v19 = NSNumber;
  if (v17)
  {
    v20 = [NSNumber numberWithBool:0];
  }
  else
  {
    v21 = [v4 objectForKeyedSubscript:@"should_repeat"];
    v20 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v21, "BOOLValue"));
  }
  v52 = v20;
  -[FBKBugForm setShouldRepeat:](self, "setShouldRepeat:", [v20 BOOLValue]);
  v22 = [v4 objectForKeyedSubscript:@"platform"];
  v23 = FBKNilIfNSNull(v22);

  if (!v23
    || ([v23 isEqualToString:&stru_26DDF6A30] & 1) != 0
    || [v23 isEqualToString:@"unspecified"])
  {
    v24 = (void *)*MEMORY[0x263F3A100];
    v25 = self;
  }
  else
  {
    v46 = [MEMORY[0x263F3A138] allPlatforms];
    char v47 = [v46 containsObject:v23];

    if ((v47 & 1) == 0)
    {
      v48 = +[FBKLog ded];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[FBKBugForm setPropertiesFromJSONObject:](v48);
      }
    }
    v25 = self;
    v24 = v23;
  }
  [(FBKBugForm *)v25 setPlatform:v24];
  v26 = [v4 objectForKeyedSubscript:@"updated_at"];
  v27 = FBKNilIfNSNull(v26);

  v51 = v23;
  if (v27)
  {
    v28 = FBKDateFromServerString(v27);
  }
  else
  {
    v28 = 0;
  }
  v29 = [v4 objectForKeyedSubscript:@"question_groups"];

  v54 = (void *)v14;
  if (v29)
  {
    v30 = [v4 objectForKeyedSubscript:@"question_groups"];
    [(FBKBugForm *)self managedObjectContext];
    v31 = v12;
    v33 = v32 = v9;
    v34 = +[FBKManagedFeedbackObject importFromJSONArray:v30 intoContext:v33];

    v35 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortOrder" ascending:1];
    v55[0] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
    [v34 sortedArrayUsingDescriptors:v36];
    v38 = v37 = v28;
    [(FBKBugForm *)self setQuestionGroups:v38];

    v28 = v37;
    v9 = v32;
    v12 = v31;
  }
  else
  {
    v34 = +[FBKLog appHandle];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[FBKBugForm setPropertiesFromJSONObject:](self, v34);
    }
  }

  [(FBKBugForm *)self setUpdatedAt:v28];
  v39 = [v4 objectForKeyedSubscript:@"file_predicates"];

  if (v39)
  {
    v40 = [v4 objectForKeyedSubscript:@"file_predicates"];
    [(FBKBugForm *)self managedObjectContext];
    v42 = v41 = v28;
    v43 = +[FBKManagedFeedbackObject importFromJSONArray:v40 intoContext:v42];
    [(FBKBugForm *)self setFilePredicates:v43];

    v28 = v41;
  }
  else
  {
    v40 = [MEMORY[0x263EFFA08] set];
    [(FBKBugForm *)self setFilePredicates:v40];
  }

  v44 = [v4 objectForKeyedSubscript:@"signature"];

  if (v44)
  {
    v45 = [v4 objectForKeyedSubscript:@"signature"];
    [(FBKBugForm *)self setSignature:v45];
  }
}

+ (int64_t)bugFormTypeFromString:(id)a3
{
  id v3 = a3;
  if (bugFormTypeFromString__onceToken != -1) {
    dispatch_once(&bugFormTypeFromString__onceToken, &__block_literal_global_34);
  }
  id v4 = [(id)bugFormTypeFromString__mapping objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

void __36__FBKBugForm_bugFormTypeFromString___block_invoke()
{
  v8[5] = *MEMORY[0x263EF8340];
  v7[0] = @"Bug";
  v0 = [NSNumber numberWithInteger:0];
  v8[0] = v0;
  v7[1] = @"ER";
  v1 = [NSNumber numberWithInteger:1];
  v8[1] = v1;
  v7[2] = @"Loc";
  v2 = [NSNumber numberWithInteger:2];
  v8[2] = v2;
  v7[3] = @"Quality";
  id v3 = [NSNumber numberWithInteger:3];
  v8[3] = v3;
  v7[4] = @"Profile";
  id v4 = [NSNumber numberWithInteger:4];
  v8[4] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  int64_t v6 = (void *)bugFormTypeFromString__mapping;
  bugFormTypeFromString__mapping = v5;
}

+ (int64_t)bugFormRoleFromString:(id)a3
{
  id v3 = a3;
  if (bugFormRoleFromString__onceToken != -1) {
    dispatch_once(&bugFormRoleFromString__onceToken, &__block_literal_global_90);
  }
  id v4 = [(id)bugFormRoleFromString__mapping objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

void __36__FBKBugForm_bugFormRoleFromString___block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"Issue";
  v0 = [NSNumber numberWithInteger:0];
  v4[1] = @"Survey";
  v5[0] = v0;
  v1 = [NSNumber numberWithInteger:1];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = (void *)bugFormRoleFromString__mapping;
  bugFormRoleFromString__mapping = v2;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)FBKBugForm;
  id v4 = [(FBKBugForm *)&v11 description];
  uint64_t v5 = [(FBKBugForm *)self name];
  unsigned int v6 = [(FBKBugForm *)self active];
  v7 = [(FBKBugForm *)self text];
  v8 = [(FBKBugForm *)self questionGroups];
  objc_msgSend(v3, "stringWithFormat:", @"%@ name=%@; active=%i; text=%@; %lu question groups",
    v4,
    v5,
    v6,
    v7,
  v9 = [v8 count]);

  return v9;
}

- (id)questionGroupForQuestionID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(FBKBugForm *)self questionGroups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_super v11 = [v10 questions];
        v12 = [v11 valueForKey:@"ID"];
        char v13 = [v12 containsObject:v4];

        if (v13)
        {
          id v14 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)questionForQuestionID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = -[FBKBugForm questionGroupForQuestionID:](self, "questionGroupForQuestionID:", v4, 0);
  uint64_t v6 = [v5 questions];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_super v11 = [v10 ID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)questionWithRole:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(FBKBugForm *)self questionGroups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) questionWithRole:v4];
        if (v10)
        {
          objc_super v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  objc_super v11 = 0;
LABEL_11:

  return v11;
}

- (int64_t)feedbackType
{
  [(FBKBugForm *)self willAccessValueForKey:@"feedbackType"];
  id v3 = [(FBKBugForm *)self primitiveFeedbackType];
  int64_t v4 = [v3 integerValue];

  [(FBKBugForm *)self didAccessValueForKey:@"feedbackType"];
  return v4;
}

- (void)setFeedbackType:(int64_t)a3
{
  [(FBKBugForm *)self willChangeValueForKey:@"feedbackType"];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  [(FBKBugForm *)self setPrimitiveFeedbackType:v5];

  [(FBKBugForm *)self didChangeValueForKey:@"feedbackType"];
}

- (int64_t)role
{
  [(FBKBugForm *)self willAccessValueForKey:@"role"];
  id v3 = [(FBKBugForm *)self primitiveValueForKey:@"role"];
  int64_t v4 = [v3 integerValue];

  [(FBKBugForm *)self didAccessValueForKey:@"role"];
  return v4;
}

- (void)setRole:(int64_t)a3
{
  [(FBKBugForm *)self willChangeValueForKey:@"role"];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  [(FBKBugForm *)self setPrimitiveValue:v5 forKey:@"role"];

  [(FBKBugForm *)self didChangeValueForKey:@"role"];
}

- (NSArray)questionGroups
{
  [(FBKBugForm *)self willAccessValueForKey:@"questionGroups"];
  id v3 = [(FBKBugForm *)self primitiveQuestionGroups];
  int64_t v4 = [v3 array];

  [(FBKBugForm *)self didAccessValueForKey:@"questionGroups"];

  return (NSArray *)v4;
}

- (void)setQuestionGroups:(id)a3
{
  id v4 = a3;
  [(FBKBugForm *)self willChangeValueForKey:@"questionGroups"];
  uint64_t v5 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];

  [(FBKBugForm *)self setPrimitiveQuestionGroups:v5];

  [(FBKBugForm *)self didChangeValueForKey:@"questionGroups"];
}

- (id)completedResponsesContentItems
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(FBKManagedFeedbackObject *)self ID];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  uint64_t v5 = [(FBKBugForm *)self managedObjectContext];
  uint64_t v6 = +[FBKContentItem contentItemsWithFormIDs:v4 fromContext:v5];
  uint64_t v7 = objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_117);

  return v7;
}

BOOL __44__FBKBugForm_completedResponsesContentItems__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 itemType] & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)draftResponsesContentItems
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(FBKManagedFeedbackObject *)self ID];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  uint64_t v5 = [(FBKBugForm *)self managedObjectContext];
  uint64_t v6 = +[FBKContentItem contentItemsWithFormIDs:v4 fromContext:v5];
  uint64_t v7 = objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_119);

  return v7;
}

BOOL __40__FBKBugForm_draftResponsesContentItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemType] == 1;
}

- (id)completedResponsesContentItemsForTeam:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FBKManagedFeedbackObject *)self ID];
  v14[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  uint64_t v7 = [(FBKBugForm *)self managedObjectContext];
  uint64_t v8 = +[FBKContentItem contentItemsWithFormIDs:v6 fromContext:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__FBKBugForm_completedResponsesContentItemsForTeam___block_invoke;
  v12[3] = &unk_264876118;
  id v13 = v4;
  id v9 = v4;
  uint64_t v10 = objc_msgSend(v8, "ded_selectItemsPassingTest:", v12);

  return v10;
}

uint64_t __52__FBKBugForm_completedResponsesContentItemsForTeam___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 itemType] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id v4 = [v3 singleTeam];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)draftResponsesContentItemsForTeam:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FBKManagedFeedbackObject *)self ID];
  v14[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  uint64_t v7 = [(FBKBugForm *)self managedObjectContext];
  uint64_t v8 = +[FBKContentItem contentItemsWithFormIDs:v6 fromContext:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__FBKBugForm_draftResponsesContentItemsForTeam___block_invoke;
  v12[3] = &unk_264876118;
  id v13 = v4;
  id v9 = v4;
  uint64_t v10 = objc_msgSend(v8, "ded_selectItemsPassingTest:", v12);

  return v10;
}

uint64_t __48__FBKBugForm_draftResponsesContentItemsForTeam___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 itemType] == 1)
  {
    id v4 = [v3 singleTeam];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)requiresPreview
{
  return [(FBKBugForm *)self role] == 0;
}

- (BOOL)matchesFormStubSignature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FBKLog model];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(FBKBugForm *)self matchesFormStubSignature:v5];
  }

  if ([(FBKBugForm *)self role] == 1)
  {
    char v6 = 1;
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = [v4 signature];

      uint64_t v8 = [(FBKBugForm *)self signature];
      id v9 = v8;
      if (v7)
      {
        uint64_t v10 = [v4 signature];
        char v6 = [v9 isEqualToString:v10];
      }
      else
      {
        char v6 = v8 == 0;
      }
    }
    else
    {
      id v9 = +[FBKLog model];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FBKBugForm matchesFormStubSignature:](self, v9);
      }
      char v6 = 1;
    }
  }
  return v6;
}

- (id)signatureDescription
{
  id v3 = NSString;
  id v4 = [(FBKManagedFeedbackObject *)self ID];
  uint64_t v5 = [v4 intValue];
  char v6 = [(FBKBugForm *)self signature];
  uint64_t v7 = [v3 stringWithFormat:@"BugForm [%i] <%@>", v5, v6];

  return v7;
}

- (BOOL)collectsFiles
{
  return [(FBKBugForm *)self role] != 1;
}

- (NSNumber)boxedFormRole
{
  return self->boxedFormRole;
}

- (void)setBoxedFormRole:(id)a3
{
}

- (NSString)cachedAnnouncementHTML
{
  return self->cachedAnnouncementHTML;
}

- (void)setCachedAnnouncementHTML:(id)a3
{
}

- (NSURL)announcementTempFile
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAnnouncementTempFile:(id)a3
{
}

- (BOOL)generatingTemp
{
  return self->generatingTemp;
}

- (void)setGeneratingTemp:(BOOL)a3
{
  self->generatingTemp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->announcementTempFile, 0);
  objc_storeStrong((id *)&self->cachedAnnouncementHTML, 0);

  objc_storeStrong((id *)&self->boxedFormRole, 0);
}

- (id)issueAreaDisplayNameForKeyword:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FBKBugForm *)self questionWithRole:@":area"];
  char v6 = v5;
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(v5, "allChoices", 0);
    uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_super v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          char v12 = [v11 value];
          char v13 = [v12 isEqual:v4];

          if (v13)
          {
            uint64_t v8 = [v11 title];
            goto LABEL_12;
          }
        }
        uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)feedbackTypeRank
{
  int64_t v2 = [(FBKBugForm *)self feedbackType];
  if ((unint64_t)(v2 + 1) > 5) {
    return &unk_26DE1E930;
  }
  else {
    return (id)qword_264876138[v2 + 1];
  }
}

- (id)localizedFeedbackTypeName
{
  switch([(FBKBugForm *)self feedbackType])
  {
    case -1:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Other";
      goto LABEL_7;
    case 0:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Bug Report";
      goto LABEL_7;
    case 1:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Enhancement Request";
      goto LABEL_7;
    case 2:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Localization Feedback";
      goto LABEL_7;
    case 3:
    case 4:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Survey";
LABEL_7:
      int64_t v2 = [v3 localizedStringForKey:v5 value:&stru_26DDF6A30 table:@"CommonStrings"];

      break;
    default:
      break;
  }

  return v2;
}

- (id)localizedFeedbackTypeShortName
{
  switch([(FBKBugForm *)self feedbackType])
  {
    case -1:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Other";
      goto LABEL_7;
    case 0:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Bug";
      goto LABEL_7;
    case 1:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"ER";
      goto LABEL_7;
    case 2:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Loc";
      goto LABEL_7;
    case 3:
    case 4:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      uint64_t v5 = @"Survey";
LABEL_7:
      int64_t v2 = [v3 localizedStringForKey:v5 value:&stru_26DDF6A30 table:@"CommonStrings"];

      break;
    default:
      break;
  }

  return v2;
}

- (void)updateResolvableQuestions
{
  int64_t v2 = +[FBKLog appHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[FBKBugForm(FBKClientSideResolvers) updateResolvableQuestions](v2);
  }
}

- (BOOL)canTakeForTeam:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(FBKBugForm *)self isSurveyAvailable])
  {
    if ([(FBKBugForm *)self shouldRepeat])
    {
      BOOL v5 = 1;
    }
    else
    {
      char v6 = [(FBKBugForm *)self draftResponsesContentItemsForTeam:v4];
      uint64_t v7 = [(FBKBugForm *)self completedResponsesContentItemsForTeam:v4];
      if ([v6 count] || objc_msgSend(v7, "count"))
      {
        uint64_t v8 = [(FBKBugForm *)self repeatPer];
        uint64_t v9 = [v8 caseInsensitiveCompare:@"build"];

        if (v9)
        {
          BOOL v5 = [v7 count] == 0;
        }
        else
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v10 = v7;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            v22 = v7;
            v23 = v6;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) feedback];
                long long v16 = v15;
                if (v15)
                {
                  long long v17 = [v15 build];
                  long long v18 = +[FBKSSharedConstants swVers];
                  uint64_t v19 = [v17 caseInsensitiveCompare:v18];

                  if (!v19)
                  {

                    BOOL v5 = 0;
                    goto LABEL_23;
                  }
                }
                else
                {
                  uint64_t v20 = +[FBKLog appHandle];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                    -[FBKBugForm(Survey) canTakeForTeam:](v28, self, v29, v20);
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
            }
            while (v12);
            BOOL v5 = 1;
LABEL_23:
            uint64_t v7 = v22;
            char v6 = v23;
          }
          else
          {
            BOOL v5 = 1;
          }
        }
      }
      else
      {
        BOOL v5 = 1;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSurveyAvailable
{
  int64_t v2 = [(FBKBugForm *)self surveyContentItem];
  char v3 = [v2 isSurveyAvailable];

  return v3;
}

- (id)surveyActionTextForTeam:(id)a3
{
  id v4 = a3;
  if ([(FBKBugForm *)self isSurveyAvailable])
  {
    if ([(FBKBugForm *)self canTakeForTeam:v4])
    {
      BOOL v5 = [(FBKBugForm *)self draftResponsesContentItemsForTeam:v4];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v8 = v7;
        uint64_t v9 = @"SURVEY_CONTINUE_BUTTON";
      }
      else
      {
        uint64_t v12 = [(FBKBugForm *)self completedResponsesContentItemsForTeam:v4];
        uint64_t v13 = [v12 count];

        uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v8 = v7;
        if (v13) {
          uint64_t v9 = @"SURVEY_TAKE_AGAIN_BUTTON";
        }
        else {
          uint64_t v9 = @"SURVEY_TAKE_BUTTON";
        }
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v8 = v7;
      uint64_t v9 = @"SURVEY_COMPLETED";
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = v7;
    uint64_t v9 = @"SURVEY_CLOSED";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_26DDF6A30 table:@"CommonStrings"];

  return v10;
}

- (NSString)surveyAnnouncementHTML
{
  if (surveyAnnouncementHTML_onceToken != -1) {
    dispatch_once(&surveyAnnouncementHTML_onceToken, &__block_literal_global_252);
  }
  uint64_t v3 = [(FBKBugForm *)self cachedAnnouncementHTML];
  if (!v3
    || (id v4 = (void *)v3,
        [(FBKBugForm *)self cachedAnnouncementHTML],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    uint64_t v7 = [(FBKBugForm *)self text];
    uint64_t v8 = [v7 rangeOfString:@"<html>" options:1];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = (void *)surveyAnnouncementHTML__announcementTemplate;
      id v10 = [(FBKBugForm *)self text];
      uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:@"{{ANNOUNCEMENT_CONTENT}}" withString:v10];
      [(FBKBugForm *)self setCachedAnnouncementHTML:v11];

      uint64_t v12 = [(FBKBugForm *)self cachedAnnouncementHTML];
      uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"target=\"_blank\"" withString:&stru_26DDF6A30];
      [(FBKBugForm *)self setCachedAnnouncementHTML:v13];
    }
    else
    {
      uint64_t v12 = [(FBKBugForm *)self text];
      [(FBKBugForm *)self setCachedAnnouncementHTML:v12];
    }
  }
  long long v14 = [(FBKBugForm *)self cachedAnnouncementHTML];

  return (NSString *)v14;
}

void __44__FBKBugForm_Survey__surveyAnnouncementHTML__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 URLForResource:@"AnnouncementContent" withExtension:@"html"];

  id v6 = 0;
  uint64_t v2 = [NSString stringWithContentsOfURL:v1 encoding:4 error:&v6];
  id v3 = v6;
  id v4 = (void *)surveyAnnouncementHTML__announcementTemplate;
  surveyAnnouncementHTML__announcementTemplate = v2;

  if (v3)
  {
    BOOL v5 = (void *)surveyAnnouncementHTML__announcementTemplate;
    surveyAnnouncementHTML__announcementTemplate = (uint64_t)&stru_26DDF6A30;
  }
}

- (NSURL)cachedAnnouncementFile
{
  id v3 = [(FBKBugForm *)self announcementTempFile];
  if (v3)
  {
  }
  else if (![(FBKBugForm *)self generatingTemp])
  {
    [(FBKBugForm *)self setGeneratingTemp:1];
    id v4 = [(FBKBugForm *)self fullAnnouncementHTML];
    BOOL v5 = (void *)[v4 copy];

    id v6 = dispatch_get_global_queue(-32768, 0);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke;
    uint64_t v13 = &unk_264874270;
    id v14 = v5;
    long long v15 = self;
    id v7 = v5;
    dispatch_async(v6, &v10);
  }
  uint64_t v8 = [(FBKBugForm *)self announcementTempFile];

  return (NSURL *)v8;
}

void __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke(uint64_t a1)
{
  uint64_t v2 = NSString;
  id v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];
  BOOL v5 = [v2 stringWithFormat:@"%@.html", v4];

  id v6 = NSURL;
  id v7 = NSTemporaryDirectory();
  uint64_t v8 = [v6 fileURLWithPath:v7];
  uint64_t v9 = [v8 URLByAppendingPathComponent:v5];

  uint64_t v10 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  LODWORD(v8) = [v10 writeToURL:v9 atomically:1];

  if (v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke_2;
    block[3] = &unk_264874270;
    block[4] = *(void *)(a1 + 40);
    id v12 = v9;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setAnnouncementTempFile:v2];

  id v3 = *(void **)(a1 + 32);

  return [v3 setGeneratingTemp:0];
}

- (NSString)fullAnnouncementHTML
{
  if (fullAnnouncementHTML_onceToken != -1) {
    dispatch_once(&fullAnnouncementHTML_onceToken, &__block_literal_global_274);
  }
  uint64_t v3 = [(FBKBugForm *)self cachedAnnouncementHTML];
  if (v3
    && (id v4 = (void *)v3,
        [(FBKBugForm *)self cachedAnnouncementHTML],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = [(FBKBugForm *)self cachedAnnouncementHTML];
  }
  else
  {
    uint64_t v8 = [(FBKBugForm *)self text];
    uint64_t v9 = [v8 rangeOfString:@"<html>" options:1];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = (void *)fullAnnouncementHTML__announcementTemplate;
      uint64_t v11 = [(FBKBugForm *)self text];
      id v12 = [v10 stringByReplacingOccurrencesOfString:@"{{ANNOUNCEMENT_CONTENT}}" withString:v11];
      [(FBKBugForm *)self setCachedAnnouncementHTML:v12];

      uint64_t v13 = [(FBKBugForm *)self cachedAnnouncementHTML];
      id v14 = [v13 stringByReplacingOccurrencesOfString:@"target=\"_blank\"" withString:&stru_26DDF6A30];
      [(FBKBugForm *)self setCachedAnnouncementHTML:v14];
    }
    else
    {
      uint64_t v13 = [(FBKBugForm *)self text];
      [(FBKBugForm *)self setCachedAnnouncementHTML:v13];
    }

    long long v15 = NSString;
    long long v16 = +[FBKSharedConstants darkModeCSS];
    long long v17 = [v15 stringWithFormat:@"%@</style>", v16];

    long long v18 = [(FBKBugForm *)self cachedAnnouncementHTML];
    uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:@" </style>" withString:v17];
    [(FBKBugForm *)self setCachedAnnouncementHTML:v19];

    id v7 = [(FBKBugForm *)self cachedAnnouncementHTML];
  }

  return (NSString *)v7;
}

void __42__FBKBugForm_Survey__fullAnnouncementHTML__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 URLForResource:@"AnnouncementContent" withExtension:@"html"];

  id v6 = 0;
  uint64_t v2 = [NSString stringWithContentsOfURL:v1 encoding:4 error:&v6];
  id v3 = v6;
  id v4 = (void *)fullAnnouncementHTML__announcementTemplate;
  fullAnnouncementHTML__announcementTemplate = v2;

  if (v3)
  {
    BOOL v5 = (void *)fullAnnouncementHTML__announcementTemplate;
    fullAnnouncementHTML__announcementTemplate = (uint64_t)&stru_26DDF6A30;
  }
}

- (void)setPropertiesFromJSONObject:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 ID];
  v4[0] = 67109120;
  v4[1] = [v3 intValue];
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "no question_groups for form [%i]", (uint8_t *)v4, 8u);
}

- (void)setPropertiesFromJSONObject:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "bug form has unsupported platform value", v1, 2u);
}

- (void)matchesFormStubSignature:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 signatureDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Given form stub is nil, cannot compare signatures on [%{public}@]", (uint8_t *)&v4, 0xCu);
}

- (void)matchesFormStubSignature:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 ID];
  int v7 = [v6 intValue];
  uint64_t v8 = [a1 signature];
  uint64_t v9 = [a2 signature];
  v10[0] = 67109634;
  v10[1] = v7;
  __int16 v11 = 2114;
  id v12 = v8;
  __int16 v13 = 2114;
  id v14 = v9;
  _os_log_debug_impl(&dword_22A36D000, a3, OS_LOG_TYPE_DEBUG, "Comparing Form [%i] signature: [%{public}@] to [%{public}@]", (uint8_t *)v10, 0x1Cu);
}

@end