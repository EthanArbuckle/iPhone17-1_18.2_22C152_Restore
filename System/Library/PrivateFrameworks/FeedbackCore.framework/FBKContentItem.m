@interface FBKContentItem
+ (NSPredicate)isSurveyAvailablePredicate;
+ (NSPredicate)needsActionPredicate;
+ (id)_predicateForAnnouncementsWithTeam:(id)a3;
+ (id)_predicateForFeedbackInInboxWithTeam:(id)a3;
+ (id)_predicateForFeedbackWithTeam:(id)a3;
+ (id)_predicateForSurveysWithTeam:(id)a3;
+ (id)assignedPredicateForUser:(id)a3;
+ (id)contentItemsWithFormIDs:(id)a3 fromContext:(id)a4;
+ (id)draftsPredicateWithTeam:(id)a3;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)inboxPredicateWithTeam:(id)a3;
+ (id)keyPathsForValuesAffectingNeedsActionFromMe;
+ (id)outboxPredicateWithTeam:(id)a3;
+ (id)submittedPredicateWithTeam:(id)a3;
+ (id)unreadContentItemsPredicateForUser:(id)a3;
+ (id)unreadInboxPredicateWithTeam:(id)a3;
- (BOOL)allowUnsolicitedFollowup;
- (BOOL)canCloseFeedback;
- (BOOL)canDeleteFiles;
- (BOOL)canDemoteFeedback;
- (BOOL)canDownloadFiles;
- (BOOL)canPromoteFeedback;
- (BOOL)canReassignFeedback;
- (BOOL)canResolveNeedsAction;
- (BOOL)canRespondToFollowup;
- (BOOL)currentUserIsStakeholder;
- (BOOL)hasFollowupPending;
- (BOOL)isClosedFeedback;
- (BOOL)isEqualToItem:(id)a3;
- (BOOL)isSurveyAvailable;
- (BOOL)isSurveyDraft;
- (BOOL)isTargetedSurvey;
- (BOOL)needsAction;
- (BOOL)needsActionFromMe;
- (BOOL)shouldShowAssigneeLabel;
- (BOOL)supportsClosing;
- (NSDateFormatter)mailboxSortDateFormatter;
- (NSString)contentInfoString;
- (NSString)displayTitle;
- (NSString)feedbackIDAndTitleString;
- (NSString)feedbackIDString;
- (NSString)formattedCreationDate;
- (NSString)formattedMailboxSortDate;
- (NSString)mailboxKind;
- (NSString)visibleFeedbackClosedStatus;
- (id)assigneeName;
- (id)assigneeNameAndTeamName;
- (id)detailedItem;
- (id)generateSearchText;
- (id)keyPathsAffectingClosedOrOpenString;
- (id)keyPathsAffectingContentInfoString;
- (id)keyPathsForValuesAffectingDisplayTitle;
- (id)keyPathsForValuesAffectingFeedbackIDAndTitleString;
- (id)keyPathsForValuesAffectingFeedbackIDString;
- (id)keyPathsForValuesAffectingHasFollowupPending;
- (id)keyPathsForValuesAffectingIsSurveyAvailable;
- (id)keyPathsForValuesAffectingItemSubtitle;
- (id)keyPathsForValuesAffectingItemTitle;
- (id)keyPathsForValuesAffectingItemTitleColor;
- (id)keyPathsForValuesAffectingItemType;
- (id)keyPathsForValuesAffectingMailboxKind;
- (id)keyPathsForValuesAffectingMailboxSortDate;
- (id)keyPathsForValuesAffectingNeedsAction;
- (id)keyPathsForValuesAffectingSecondaryTextColor;
- (id)searchableFeedbackClosedStatus;
- (id)shortDescription;
- (id)singleTeam;
- (id)teamForItemPreferringTeam:(id)a3;
- (unint64_t)draftType;
- (unint64_t)itemType;
- (void)detailedItem;
- (void)markAsRead;
- (void)setAttributesFromJSONObject:(id)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKContentItem

+ (id)unreadInboxPredicateWithTeam:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 _predicateForSurveysWithTeam:v4];
  v25[0] = v5;
  v6 = +[FBKContentItem needsActionPredicate];
  v25[1] = v6;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

  v7 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v21];
  v8 = [a1 _predicateForAnnouncementsWithTeam:v4];
  v24[0] = v8;
  v9 = +[FBKContentItem needsActionPredicate];
  v24[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];

  v11 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v10];
  v12 = [a1 _predicateForFeedbackInInboxWithTeam:v4];
  v23[0] = v12;
  v13 = +[FBKContentItem needsActionPredicate];
  v23[1] = v13;
  v14 = [v4 user];

  v15 = [a1 assignedPredicateForUser:v14];
  v23[2] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];

  v17 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v16];
  v22[0] = v7;
  v22[1] = v11;
  v22[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  v19 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:2 subpredicates:v18];

  return v19;
}

+ (id)inboxPredicateWithTeam:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 _predicateForSurveysWithTeam:v4];
  v6 = objc_msgSend(a1, "_predicateForFeedbackInInboxWithTeam:", v4, v5);
  v11[1] = v6;
  v7 = [a1 _predicateForAnnouncementsWithTeam:v4];

  v11[2] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

  v9 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:2 subpredicates:v8];

  return v9;
}

+ (id)draftsPredicateWithTeam:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN teams AND type == %@", a3, &unk_26DE1E810];
}

+ (id)submittedPredicateWithTeam:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08730];
  id v4 = [a1 _predicateForFeedbackWithTeam:a3];
  v11[0] = v4;
  v5 = (void *)MEMORY[0x263F08730];
  v6 = +[FBKContentItem needsActionPredicate];
  v7 = [v5 notPredicateWithSubpredicate:v6];
  v11[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v9 = [v3 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)outboxPredicateWithTeam:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN teams AND type == %@ AND formResponse.uploadTask.localSubmissionStage IN %@", a3, &unk_26DE1E828, &unk_26DE1EE68];
}

+ (id)_predicateForAnnouncementsWithTeam:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN teams AND type == %@", a3, &unk_26DE1E840];
}

+ (id)_predicateForSurveysWithTeam:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"teams CONTAINS %@ AND type == %@", a3, &unk_26DE1E8B8];
}

+ (id)_predicateForFeedbackInInboxWithTeam:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08730];
  id v4 = [a1 _predicateForFeedbackWithTeam:a3];
  v9[0] = v4;
  v5 = +[FBKContentItem needsActionPredicate];
  v9[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)_predicateForFeedbackWithTeam:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08730];
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN teams", a3];
  v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"type IN %@", &unk_26DE1EE80, v4];
  v9[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)teamForItemPreferringTeam:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(FBKContentItem *)self teams];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(FBKContentItem *)self teams];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (![v13 teamType])
          {
            id v14 = v13;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v8 = [(FBKContentItem *)self teams];
    id v14 = [v8 anyObject];
LABEL_13:
    id v7 = v14;
  }

  return v7;
}

+ (id)entityName
{
  return @"ContentItem";
}

- (BOOL)isClosedFeedback
{
  int v3 = [(FBKContentItem *)self supportsClosing];
  if (v3)
  {
    LOBYTE(v3) = [(FBKContentItem *)self closed];
  }
  return v3;
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v52 = 0;
  v5 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"type", &v52);
  int v6 = v52;

  if (v5)
  {
    id v7 = [NSNumber numberWithUnsignedInteger:FBKContentItemTypeFromString(v6)];
    [(FBKContentItem *)self setType:v7];
  }
  v51 = 0;
  v8 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"title", &v51);
  uint64_t v9 = v51;

  if (v8)
  {
    uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    [(FBKContentItem *)self setTitle:v10];
  }
  v50 = 0;
  uint64_t v11 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"subtitle", &v50);
  v12 = v50;

  if (v11) {
    [(FBKContentItem *)self setSubtitle:v12];
  }
  v49 = 0;
  v13 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"modified_at", &v49);
  id v14 = v49;

  if (v13)
  {
    v15 = FBKDateFromServerString(v14);
    [(FBKContentItem *)self setModifiedAt:v15];
  }
  v48 = 0;
  long long v16 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"created_at", &v48);
  long long v17 = v48;

  if (v16)
  {
    long long v18 = FBKDateFromServerString(v17);
    [(FBKContentItem *)self setCreatedAt:v18];
  }
  v47 = 0;
  long long v19 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"updated_at", &v47);
  v20 = v47;

  if (v19)
  {
    uint64_t v21 = FBKDateFromServerString(v20);
    [(FBKContentItem *)self setUpdatedAt:v21];
  }
  v46 = 0;
  v22 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"owner", &v46);
  v23 = v46;

  if (v22)
  {
    v45 = v17;
    v24 = [v23 objectForKeyedSubscript:@"type"];
    v25 = [v24 uppercaseString];

    if ([v25 isEqualToString:@"TEAM"])
    {
      v40 = v12;
      v41 = v9;
      v43 = v6;
      v26 = [(FBKContentItem *)self managedObjectContext];
      v27 = +[FBKTeam entityName];
      v28 = [v23 objectForKeyedSubscript:@"id"];
      v29 = [v26 feedbackObjectWithEntityName:v27 remoteID:v28 creatingIfNeeded:0];

      if (v29)
      {
        uint64_t v30 = [MEMORY[0x263EFFA08] setWithObject:v29];
      }
      else
      {
        v37 = +[FBKLog appHandle];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[FBKContentItem setPropertiesFromJSONObject:](self, v23);
        }

        uint64_t v30 = [MEMORY[0x263EFFA08] set];
      }
      v38 = (void *)v30;
      [(FBKContentItem *)self setTeams:v30];

      int v6 = v43;
      v12 = v40;

      uint64_t v9 = v41;
    }
    else if ([v25 isEqualToString:@"PARTICIPANT"])
    {
      [(FBKContentItem *)self user];
      v31 = v42 = v9;
      [(FBKContentItem *)self managedObjectContext];
      v44 = v6;
      v32 = v14;
      v34 = v33 = v12;
      v35 = +[FBKTeam personalTeamForUser:v31 inContext:v34];

      v12 = v33;
      id v14 = v32;
      int v6 = v44;

      v36 = [MEMORY[0x263EFFA08] setWithObject:v35];
      [(FBKContentItem *)self setTeams:v36];

      uint64_t v9 = v42;
    }

    long long v17 = v45;
  }
  [(FBKContentItem *)self setAttributesFromJSONObject:v4];
  v39 = [(FBKContentItem *)self generateSearchText];
  [(FBKContentItem *)self setSearchText:v39];
}

- (void)setAttributesFromJSONObject:(id)a3
{
  v50 = 0;
  id v41 = a3;
  id v4 = FBKContentItemAssignAttributeObjectForKey(v41, @"form", &v50);
  v5 = v50;

  if (v4)
  {
    int v6 = [v5 objectForKeyedSubscript:@"id"];
    id v7 = FBKNilIfNSNull(v6);
    [(FBKContentItem *)self setFormID:v7];

    v8 = [v5 objectForKeyedSubscript:@"tat"];
    uint64_t v9 = FBKNilIfNSNull(v8);
    [(FBKContentItem *)self setFormTat:v9];
  }
  v40 = v5;
  v49 = 0;
  uint64_t v10 = FBKContentItemAssignAttributeObjectForKey(v41, @"originator", &v49);
  uint64_t v11 = v49;

  if (v10)
  {
    v12 = [(FBKContentItem *)self managedObjectContext];
    v13 = +[FBKManagedFeedbackObject importFromJSONObject:v11 intoContext:v12];
    [(FBKContentItem *)self setOriginator:v13];
  }
  id v14 = objc_msgSend(v41, "objectForKeyedSubscript:", @"attributes", v11);
  v15 = [v14 objectForKeyedSubscript:@"assignee"];

  if (v15)
  {
    long long v16 = [MEMORY[0x263EFF9D0] null];

    if (v15 == v16)
    {
      [(FBKContentItem *)self setAssignee:0];
    }
    else
    {
      long long v17 = [(FBKContentItem *)self managedObjectContext];
      long long v18 = +[FBKManagedFeedbackObject importFromJSONObject:v15 intoContext:v17];
      [(FBKContentItem *)self setAssignee:v18];
    }
  }
  v48 = 0;
  long long v19 = FBKContentItemAssignAttributeObjectForKey(v41, @"unread", &v48);
  v20 = v48;

  if (v19) {
    -[FBKContentItem setUnread:](self, "setUnread:", [v20 BOOLValue]);
  }
  v47 = 0;
  uint64_t v21 = FBKContentItemAssignAttributeObjectForKey(v41, @"orphan", &v47);
  v22 = v47;

  if (v21) {
    -[FBKContentItem setIsOrphaned:](self, "setIsOrphaned:", [v22 BOOLValue]);
  }
  v46 = 0;
  v23 = FBKContentItemAssignAttributeObjectForKey(v41, @"pending_info", &v46);
  v24 = v46;

  if (v23) {
    -[FBKContentItem setPendingInfo:](self, "setPendingInfo:", [v24 BOOLValue]);
  }
  v45 = 0;
  v25 = FBKContentItemAssignAttributeObjectForKey(v41, @"closed", &v45);
  v26 = v45;

  if (v25) {
    -[FBKContentItem setClosed:](self, "setClosed:", [v26 BOOLValue]);
  }
  v44 = 0;
  v27 = FBKContentItemAssignAttributeObjectForKey(v41, @"draft_type", &v44);
  v28 = v44;

  if (v27)
  {
    v29 = NSNumber;
    uint64_t v30 = [v28 uppercaseString];
    if ([v30 isEqualToString:@"ISSUE"])
    {
      uint64_t v31 = 1;
    }
    else if ([v30 isEqualToString:@"SURVEY"])
    {
      uint64_t v31 = 2;
    }
    else
    {
      uint64_t v31 = 0;
    }

    v32 = [v29 numberWithUnsignedInteger:v31];
    [(FBKContentItem *)self setDraftTypeEnum:v32];
  }
  v43 = 0;
  v33 = FBKContentItemAssignAttributeObjectForKey(v41, @"area", &v43);
  v34 = v43;

  if (v33)
  {
    v35 = FBKNilIfNSNull(v34);
    [(FBKContentItem *)self setArea:v35];
  }
  v42 = 0;
  v36 = FBKContentItemAssignAttributeObjectForKey(v41, @"source", &v42);
  v37 = v42;

  if (v36)
  {
    v38 = FBKNilIfNSNull(v37);
    [(FBKContentItem *)self setSource:v38];
  }
}

- (id)keyPathsForValuesAffectingItemType
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"type"];
}

- (unint64_t)itemType
{
  [(FBKContentItem *)self willAccessValueForKey:@"itemType"];
  int v3 = [(FBKContentItem *)self type];
  unint64_t v4 = [v3 unsignedIntegerValue];

  [(FBKContentItem *)self didAccessValueForKey:@"itemType"];
  return v4;
}

- (unint64_t)draftType
{
  [(FBKContentItem *)self willAccessValueForKey:@"draftType"];
  int v3 = [(FBKContentItem *)self draftTypeEnum];
  unint64_t v4 = [v3 longValue];

  [(FBKContentItem *)self didAccessValueForKey:@"draftType"];
  return v4;
}

- (void)markAsRead
{
}

- (id)keyPathsForValuesAffectingHasFollowupPending
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"pendingInfo"];
}

- (BOOL)hasFollowupPending
{
  [(FBKContentItem *)self willAccessValueForKey:@"hasFollowupPending"];
  char v3 = [(FBKContentItem *)self pendingInfo];
  [(FBKContentItem *)self didAccessValueForKey:@"hasFollowupPending"];
  return v3;
}

- (id)keyPathsForValuesAffectingNeedsAction
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"unread", @"hasFollowupPending", 0);
}

- (BOOL)needsAction
{
  [(FBKContentItem *)self willAccessValueForKey:@"needsAction"];
  if ([(FBKContentItem *)self unread])
  {
    LOBYTE(v3) = 1;
  }
  else if ([(FBKContentItem *)self hasFollowupPending])
  {
    BOOL v3 = ![(FBKContentItem *)self isClosedFeedback];
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  [(FBKContentItem *)self didAccessValueForKey:@"needsAction"];
  return v3;
}

+ (id)keyPathsForValuesAffectingNeedsActionFromMe
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"needsAction", @"teams", @"assignee", @"user", 0);
}

- (BOOL)needsActionFromMe
{
  unint64_t v3 = [(FBKContentItem *)self itemType];
  BOOL v4 = [(FBKContentItem *)self needsAction];
  char v5 = v3 != 4 && v4;
  if (v3 == 4 && v4)
  {
    int v6 = [(FBKContentItem *)self singleTeam];
    if ([v6 teamType])
    {
      id v7 = [(FBKContentItem *)self assignee];
      v8 = [v7 ID];
      uint64_t v9 = [(FBKContentItem *)self user];
      uint64_t v10 = [v9 ID];
      char v5 = [v8 isEqualToNumber:v10];
    }
    else
    {
      char v5 = 1;
    }
  }
  return v5;
}

+ (NSPredicate)needsActionPredicate
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08730];
  unint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"unread == YES"];
  v8[0] = v3;
  BOOL v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"pendingInfo == YES AND closed == NO"];
  v8[1] = v4;
  char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  int v6 = [v2 orPredicateWithSubpredicates:v5];

  return (NSPredicate *)v6;
}

- (id)detailedItem
{
  switch([(FBKContentItem *)self itemType])
  {
    case 1uLL:
      unint64_t v3 = [(FBKContentItem *)self formResponseStub];
      break;
    case 2uLL:
      unint64_t v3 = [(FBKContentItem *)self announcement];
      break;
    case 3uLL:
      unint64_t v3 = [(FBKContentItem *)self surveyBugForm];
      break;
    case 4uLL:
    case 5uLL:
      unint64_t v3 = [(FBKContentItem *)self feedback];
      break;
    default:
      BOOL v4 = +[FBKLog appHandle];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[FBKContentItem detailedItem](self);
      }

      unint64_t v3 = 0;
      break;
  }

  return v3;
}

+ (id)contentItemsWithFormIDs:(id)a3 fromContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__5;
    long long v17 = __Block_byref_object_dispose__5;
    id v18 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke;
    void v9[3] = &unk_264876590;
    id v10 = v5;
    id v11 = v6;
    v12 = &v13;
    [v11 performBlockAndWait:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = (id)objc_opt_new();
  }

  return v7;
}

void __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke(void *a1)
{
  v2 = +[FBKContentItem fetchRequest];
  unint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"formID in %@", a1[4]];
  [v2 setPredicate:v3];

  [v2 setPropertiesToFetch:&unk_26DE1EF58];
  BOOL v4 = (void *)a1[5];
  id v13 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  }
  else
  {
    id v7 = objc_opt_new();
  }
  v8 = v7;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);

  if (v6)
  {
    uint64_t v9 = +[FBKLog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke_cold_1((uint64_t)v6, v9);
    }

    uint64_t v10 = objc_opt_new();
    uint64_t v11 = *(void *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (BOOL)canCloseFeedback
{
  if ([(FBKContentItem *)self supportsClosing])
  {
    unint64_t v3 = [(FBKContentItem *)self singleTeam];
    BOOL v4 = [v3 permissions];
    if (([v4 canClose] & 1) != 0
      || [(FBKContentItem *)self currentUserIsStakeholder])
    {
      BOOL v5 = ![(FBKContentItem *)self isClosedFeedback];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)allowUnsolicitedFollowup
{
  if ([(FBKContentItem *)self itemType] != 4 || [(FBKContentItem *)self isClosedFeedback]) {
    return 0;
  }

  return [(FBKContentItem *)self canRespondToFollowup];
}

- (BOOL)canRespondToFollowup
{
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  BOOL v4 = [v3 permissions];
  BOOL v5 = ([v4 canRespond] & 1) != 0
    || [(FBKContentItem *)self currentUserIsStakeholder];

  return v5;
}

- (id)shortDescription
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(FBKContentItem *)self itemType] - 1;
  if (v4 > 4) {
    BOOL v5 = @"UNKNOWN";
  }
  else {
    BOOL v5 = off_264877678[v4];
  }
  id v6 = [(FBKManagedFeedbackObject *)self ID];
  id v7 = [v3 stringWithFormat:@"ContentItem: type:%@ ID:%@", v5, v6];

  return v7;
}

- (id)keyPathsForValuesAffectingIsSurveyAvailable
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"type", @"closed", 0);
}

- (BOOL)isSurveyAvailable
{
  if ([(FBKContentItem *)self itemType] == 3) {
    return [(FBKContentItem *)self closed] ^ 1;
  }
  else {
    return 0;
  }
}

+ (NSPredicate)isSurveyAvailablePredicate
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08730];
  unint64_t v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type == %lu", 3);
  v8[0] = v3;
  unint64_t v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"closed == NO"];
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  id v6 = [v2 andPredicateWithSubpredicates:v5];

  return (NSPredicate *)v6;
}

- (BOOL)isSurveyDraft
{
  return [(FBKContentItem *)self draftType] == 2;
}

- (BOOL)supportsClosing
{
  return [(FBKContentItem *)self itemType] == 4;
}

- (BOOL)canDownloadFiles
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  unint64_t v4 = [v3 permissions];
  BOOL v5 = ([v4 canDownload] & 1) != 0
    || [(FBKContentItem *)self currentUserIsStakeholder];

  return v5;
}

- (BOOL)canDeleteFiles
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  unint64_t v4 = [v3 permissions];
  char v5 = [v4 canDelete];

  return v5;
}

- (BOOL)canPromoteFeedback
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  unint64_t v4 = [(FBKContentItem *)self user];
  if ([v4 hasManagedTeams]) {
    BOOL v5 = [v3 teamType] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canDemoteFeedback
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  unint64_t v4 = [v3 permissions];
  char v5 = [v4 canDemote];

  return v5;
}

- (BOOL)canReassignFeedback
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  if ([v3 teamType])
  {
    unint64_t v4 = [v3 permissions];
    BOOL v5 = ([v4 canAssign] & 1) != 0
      || [(FBKContentItem *)self currentUserIsStakeholder];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowAssigneeLabel
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self singleTeam];
  BOOL v4 = [v3 teamType] != 0;

  return v4;
}

- (BOOL)isTargetedSurvey
{
  if ([(FBKContentItem *)self itemType] != 3) {
    return 0;
  }
  unint64_t v3 = [(FBKContentItem *)self source];
  char v4 = [v3 isEqualToString:@"targeted"];

  return v4;
}

- (id)singleTeam
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(FBKContentItem *)self teams];
  if ((unint64_t)[v3 count] > 1)
  {
    char v4 = +[FBKData sharedInstance];
    char v5 = [v4 isRefreshingContent];

    if (v5) {
      goto LABEL_6;
    }
    unint64_t v3 = +[FBKLog model];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FBKManagedFeedbackObject *)self ID];
      uint64_t v7 = [v6 integerValue];
      v8 = [(FBKContentItem *)self teams];
      int v12 = 134218240;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = [v8 count];
      _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Content item [%ld] belongs to [%lu] teams, expected to be 1.", (uint8_t *)&v12, 0x16u);
    }
  }

LABEL_6:
  uint64_t v9 = [(FBKContentItem *)self teams];
  uint64_t v10 = [v9 anyObject];

  return v10;
}

- (BOOL)currentUserIsStakeholder
{
  if ([(FBKContentItem *)self itemType] == 4)
  {
    char v4 = [(FBKContentItem *)self singleTeam];
    char v5 = [v4 stakeholders];

    id v6 = [(FBKContentItem *)self user];
    uint64_t v7 = [v6 ID];

    int v8 = [v5 containsObject:@"ORIGINATOR"];
    if (v8)
    {
      id v6 = [(FBKContentItem *)self originator];
      v2 = [v6 ID];
      if ([v2 isEqualToNumber:v7])
      {
        char v9 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (([v5 containsObject:@"ASSIGNEE"] & 1) == 0)
      {
        char v9 = 0;
        goto LABEL_12;
      }
    }
    else if (![v5 containsObject:@"ASSIGNEE"])
    {
      char v9 = 0;
LABEL_13:

      return v9;
    }
    uint64_t v10 = [(FBKContentItem *)self assignee];
    uint64_t v11 = [v10 ID];
    char v9 = [v11 isEqualToNumber:v7];

    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  return 0;
}

- (id)generateSearchText
{
  v28 = NSString;
  uint64_t v3 = [(FBKContentItem *)self displayTitle];
  uint64_t v30 = (void *)v3;
  if (v3) {
    char v4 = (__CFString *)v3;
  }
  else {
    char v4 = &stru_26DDF6A30;
  }
  v27 = v4;
  uint64_t v5 = [(FBKContentItem *)self subtitle];
  v29 = (void *)v5;
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_26DDF6A30;
  }
  v26 = v6;
  v25 = [(FBKManagedFeedbackObject *)self ID];
  uint64_t v7 = [(FBKContentItem *)self feedbackIDString];
  int v8 = (void *)v7;
  if (v7) {
    char v9 = (__CFString *)v7;
  }
  else {
    char v9 = &stru_26DDF6A30;
  }
  v24 = v9;
  uint64_t v10 = [(FBKContentItem *)self contentInfoString];
  uint64_t v11 = (void *)v10;
  if (v10) {
    int v12 = (__CFString *)v10;
  }
  else {
    int v12 = &stru_26DDF6A30;
  }
  uint64_t v13 = [(FBKContentItem *)self searchableFeedbackClosedStatus];
  __int16 v14 = [(FBKContentItem *)self assignee];
  uint64_t v15 = [v14 givenName];
  uint64_t v16 = (void *)v15;
  if (v15) {
    long long v17 = (__CFString *)v15;
  }
  else {
    long long v17 = &stru_26DDF6A30;
  }
  id v18 = [(FBKContentItem *)self assignee];
  uint64_t v19 = [v18 familyName];
  v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  else {
    uint64_t v21 = &stru_26DDF6A30;
  }
  v22 = [v28 stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@", v27, v26, v25, v24, v12, v13, v17, v21];

  return v22;
}

- (id)keyPathsForValuesAffectingMailboxKind
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"type"];
}

- (NSString)mailboxKind
{
  v2 = NSString;
  uint64_t v3 = [(FBKContentItem *)self type];
  char v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (id)keyPathsForValuesAffectingItemTitle
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"title"];
}

- (id)keyPathsForValuesAffectingItemSubtitle
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"subtitle"];
}

- (id)keyPathsForValuesAffectingFeedbackIDString
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"ID"];
}

- (NSString)feedbackIDString
{
  if ([(FBKContentItem *)self itemType] == 4)
  {
    uint64_t v3 = NSString;
    char v4 = [(FBKManagedFeedbackObject *)self ID];
    uint64_t v5 = [v3 stringWithFormat:@"FB%@", v4];
  }
  else
  {
    uint64_t v5 = &stru_26DDF6A30;
  }

  return (NSString *)v5;
}

- (id)keyPathsForValuesAffectingFeedbackIDAndTitleString
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"ID", @"displayTitle", 0);
}

- (NSString)feedbackIDAndTitleString
{
  if ([(FBKContentItem *)self itemType] == 4)
  {
    uint64_t v3 = NSString;
    char v4 = [(FBKContentItem *)self feedbackIDString];
    uint64_t v5 = [(FBKContentItem *)self displayTitle];
    id v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];
  }
  else
  {
    id v6 = &stru_26DDF6A30;
  }

  return (NSString *)v6;
}

- (id)keyPathsAffectingContentInfoString
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"itemType", @"ID", 0);
}

- (NSString)contentInfoString
{
  switch([(FBKContentItem *)self itemType])
  {
    case 1uLL:
      BOOL v6 = [(FBKContentItem *)self isSurveyDraft];
      uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v4 = v3;
      if (v6) {
        uint64_t v5 = @"SURVEY_DRAFT";
      }
      else {
        uint64_t v5 = @"FEEDBACK_DRAFT";
      }
      goto LABEL_10;
    case 2uLL:
      uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v4 = v3;
      uint64_t v5 = @"ANNOUNCEMENT";
      goto LABEL_10;
    case 3uLL:
    case 5uLL:
      uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v4 = v3;
      uint64_t v5 = @"SURVEY";
LABEL_10:
      uint64_t v10 = [v3 localizedStringForKey:v5 value:&stru_26DDF6A30 table:@"CommonStrings"];
      goto LABEL_11;
    case 4uLL:
      uint64_t v7 = NSString;
      char v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v8 = [v4 localizedStringForKey:@"FEEDBACK" value:&stru_26DDF6A30 table:@"CommonStrings"];
      char v9 = [(FBKContentItem *)self feedbackIDString];
      uint64_t v10 = [v7 stringWithFormat:@"%@ · %@", v8, v9];

LABEL_11:
      break;
    default:
      uint64_t v10 = &stru_26DDF6A30;
      break;
  }

  return (NSString *)v10;
}

- (id)keyPathsAffectingClosedOrOpenString
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"closed", 0);
}

- (NSString)visibleFeedbackClosedStatus
{
  if ([(FBKContentItem *)self supportsClosing]
    && [(FBKContentItem *)self isClosedFeedback])
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v4 = [v3 localizedStringForKey:@"CLOSED_FEEDBACK_TAG" value:&stru_26DDF6A30 table:@"CommonStrings"];
    uint64_t v5 = [v4 uppercaseString];
  }
  else
  {
    uint64_t v5 = &stru_26DDF6A30;
  }

  return (NSString *)v5;
}

- (id)searchableFeedbackClosedStatus
{
  if ([(FBKContentItem *)self supportsClosing])
  {
    BOOL v3 = [(FBKContentItem *)self isClosedFeedback];
    char v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    if (v3) {
      BOOL v6 = @"CLOSED_FEEDBACK_TAG";
    }
    else {
      BOOL v6 = @"OPEN_FEEDBACK_TAG";
    }
    uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26DDF6A30 table:@"CommonStrings"];
  }
  else
  {
    uint64_t v7 = &stru_26DDF6A30;
  }

  return v7;
}

- (id)keyPathsForValuesAffectingMailboxSortDate
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"modifiedAt"];
}

- (id)keyPathsForValuesAffectingItemTitleColor
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"type", @"closed", 0);
}

- (id)keyPathsForValuesAffectingSecondaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"closed", 0);
}

- (id)keyPathsForValuesAffectingDisplayTitle
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"title", @"draftTypeEnum", 0);
}

- (NSString)displayTitle
{
  uint64_t v3 = [(FBKContentItem *)self title];
  if (v3
    && (char v4 = (void *)v3,
        [(FBKContentItem *)self title],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [(FBKContentItem *)self title];
    int v8 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    char v9 = [v7 stringByTrimmingCharactersInSet:v8];
  }
  else
  {
    BOOL v10 = [(FBKContentItem *)self isSurveyDraft];
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = v11;
    if (v10) {
      int v12 = @"UNFINISHED_SURVEY";
    }
    else {
      int v12 = @"UNTITLED_FEEDBACK";
    }
    char v9 = [v11 localizedStringForKey:v12 value:&stru_26DDF6A30 table:@"CommonStrings"];
  }

  return (NSString *)v9;
}

- (id)assigneeName
{
  v2 = [(FBKContentItem *)self assignee];
  uint64_t v3 = [v2 fullName];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v6 localizedStringForKey:@"UNASSIGNED" value:&stru_26DDF6A30 table:@"CommonStrings"];
  }

  return v5;
}

- (id)assigneeNameAndTeamName
{
  if ([(FBKContentItem *)self itemType] == 4)
  {
    uint64_t v3 = NSString;
    char v4 = [(FBKContentItem *)self assigneeName];
    id v5 = [(FBKContentItem *)self singleTeam];
    uint64_t v6 = [v5 name];
    uint64_t v7 = [v3 stringWithFormat:@"%@, %@", v4, v6];
  }
  else
  {
    uint64_t v7 = &stru_26DDF6A30;
  }

  return v7;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKManagedFeedbackObject *)self ID];
  int v6 = [v5 intValue];
  uint64_t v7 = [v4 ID];
  if (v6 == [v7 intValue])
  {
    unint64_t v8 = [(FBKContentItem *)self itemType];
    BOOL v9 = v8 == [v4 itemType];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)unreadContentItemsPredicateForUser:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08A98];
  id v5 = a3;
  int v6 = [v4 predicateWithFormat:@"unread == YES"];
  uint64_t v7 = (void *)MEMORY[0x263F08730];
  unint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"pendingInfo == YES"];
  v18[0] = v8;
  BOOL v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"closed == NO"];
  v18[1] = v9;
  BOOL v10 = [a1 assignedPredicateForUser:v5];

  v18[2] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  int v12 = [v7 andPredicateWithSubpredicates:v11];

  uint64_t v13 = (void *)MEMORY[0x263F08730];
  v17[0] = v12;
  v17[1] = v6;
  __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  uint64_t v15 = [v13 orPredicateWithSubpredicates:v14];

  return v15;
}

+ (id)assignedPredicateForUser:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08730];
  id v4 = (void *)MEMORY[0x263F08A98];
  id v5 = a3;
  int v6 = objc_msgSend(v4, "predicateWithFormat:", @"ANY teams.teamTypeEnum == %ld", 0);
  v13[0] = v6;
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  unint64_t v8 = [v5 ID];

  BOOL v9 = [v7 predicateWithFormat:@"assignee.remoteID == %@", v8];
  v13[1] = v9;
  BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  uint64_t v11 = [v3 orPredicateWithSubpredicates:v10];

  return v11;
}

- (NSString)formattedCreationDate
{
  uint64_t v3 = [(FBKContentItem *)self createdAt];

  if (v3)
  {
    if (FBKHeaderDateFormatter_onceToken != -1) {
      dispatch_once(&FBKHeaderDateFormatter_onceToken, &__block_literal_global_47);
    }
    id v4 = (id)FBKHeaderDateFormatter_fmt;
    id v5 = [(FBKContentItem *)self createdAt];
    int v6 = [v4 stringFromDate:v5];
  }
  else
  {
    int v6 = &stru_26DDF6A30;
  }

  return (NSString *)v6;
}

- (NSString)formattedMailboxSortDate
{
  uint64_t v3 = [(FBKContentItem *)self mailboxSortDate];

  if (v3)
  {
    id v4 = [(FBKContentItem *)self mailboxSortDateFormatter];
    id v5 = [(FBKContentItem *)self mailboxSortDate];
    int v6 = [v4 stringFromDate:v5];
  }
  else
  {
    int v6 = &stru_26DDF6A30;
  }

  return (NSString *)v6;
}

- (NSDateFormatter)mailboxSortDateFormatter
{
  uint64_t v3 = [(FBKContentItem *)self mailboxSortDate];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = (void *)v3;
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v6 = [(FBKContentItem *)self mailboxSortDate];
  int v7 = [v5 isDateInToday:v6];

  if (v7)
  {
    if (FBKContentItemDisplayDateTodayFormatter_onceToken != -1) {
      dispatch_once(&FBKContentItemDisplayDateTodayFormatter_onceToken, &__block_literal_global_440);
    }
    unint64_t v8 = &FBKContentItemDisplayDateTodayFormatter_f;
  }
  else
  {
LABEL_6:
    if (FBKContentItemDisplayDateFormatter_onceToken != -1) {
      dispatch_once(&FBKContentItemDisplayDateFormatter_onceToken, &__block_literal_global_442);
    }
    unint64_t v8 = &FBKContentItemDisplayDateFormatter_f;
  }
  BOOL v9 = (void *)*v8;

  return (NSDateFormatter *)v9;
}

- (BOOL)canResolveNeedsAction
{
  if ([(FBKContentItem *)self itemType] != 4) {
    return 1;
  }
  uint64_t v3 = [(FBKContentItem *)self singleTeam];
  uint64_t v4 = [v3 teamType];
  id v5 = [(FBKContentItem *)self assignee];
  int v6 = [v5 ID];
  int v7 = [(FBKContentItem *)self user];
  unint64_t v8 = [v7 ID];
  char v9 = [v6 isEqualToNumber:v8];

  if (v4) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 1;
  }
  if (-[FBKContentItem isOrphaned](self, "isOrphaned") && [v3 role] == 2) {
    BOOL v10 = 1;
  }

  return v10;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ContentItem"];
}

- (void)setPropertiesFromJSONObject:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 ID];
  [v3 integerValue];
  uint64_t v4 = [a2 objectForKeyedSubscript:@"ID"];
  [v4 integerValue];
  OUTLINED_FUNCTION_4_0(&dword_22A36D000, v5, v6, "Server says [%ld] belongs to team [%ld], but FBK is unaware of that team. Removing all team associations.", v7, v8, v9, v10, 0);
}

- (void)detailedItem
{
  uint64_t v7 = [a1 type];
  OUTLINED_FUNCTION_4_0(&dword_22A36D000, v1, v2, "%s for %@ not IMPLEMENTED", v3, v4, v5, v6, 2u);
}

void __54__FBKContentItem_contentItemsWithFormIDs_fromContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch Summary Items with error %@", (uint8_t *)&v2, 0xCu);
}

@end