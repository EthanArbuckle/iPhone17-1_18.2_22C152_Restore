@interface ATXContextEventSuggestionProducer
- (ATXContextEventSuggestionProducer)initWithEvent:(id)a3 validFromStartDate:(id)a4 validToEndDate:(id)a5 environment:(id)a6;
- (BOOL)_isStringValidEmail:(id)a3;
- (double)scoreWithEventParticipantStatusPenalty:(double)a3;
- (id)_dateInterval;
- (id)_spotlightActionWithParticipant:(id)a3 subtitle:(id)a4;
- (id)_stringsWithPredictionReasons:(unint64_t)a3;
- (id)suggestionForConferenceWithScore:(double)a3 predictionReasons:(unint64_t)a4;
- (id)suggestionForDNDWithScore:(double)a3 predictionReasons:(unint64_t)a4;
- (id)suggestionForEventOrganizerWithScore:(double)a3 predictionReasons:(unint64_t)a4;
- (id)suggestionForEventParticipantWithScore:(double)a3 predictionReasons:(unint64_t)a4;
@end

@implementation ATXContextEventSuggestionProducer

- (ATXContextEventSuggestionProducer)initWithEvent:(id)a3 validFromStartDate:(id)a4 validToEndDate:(id)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ATXContextEventSuggestionProducer;
  v15 = [(ATXContextEventSuggestionProducer *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_event, a3);
    v17 = [v11 title];
    v18 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v19 = [v17 stringByTrimmingCharactersInSet:v18];
    eventTitle = v16->_eventTitle;
    v16->_eventTitle = (NSString *)v19;

    objc_storeStrong((id *)&v16->_validFromStartDate, a4);
    objc_storeStrong((id *)&v16->_validToEndDate, a5);
    objc_storeStrong((id *)&v16->_environment, a6);
  }

  return v16;
}

- (id)suggestionForEventOrganizerWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v7 = [(EKEvent *)self->_event organizer];

  if (!v7)
  {
    v10 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136446210;
      v28 = "-[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:]";
      id v11 = "%{public}s null _event.organizer: No suggestion";
      goto LABEL_7;
    }
LABEL_8:
    id v12 = 0;
    goto LABEL_9;
  }
  v8 = [(EKEvent *)self->_event organizer];
  int v9 = [v8 isCurrentUser];

  if (v9)
  {
    v10 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136446210;
      v28 = "-[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:]";
      id v11 = "%{public}s event organizer is current user: No suggestion";
LABEL_7:
      _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v14 = [(EKEvent *)self->_event organizer];
  v15 = [v14 name];
  BOOL v16 = [(ATXContextEventSuggestionProducer *)self _isStringValidEmail:v15];

  if (v16)
  {
    v10 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(EKEvent *)self->_event organizer];
      v18 = [v17 name];
      int v27 = 136446466;
      v28 = "-[ATXContextEventSuggestionProducer suggestionForEventOrganizerWithScore:predictionReasons:]";
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s event organizer name (%@) is an email address: No suggestion", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_8;
  }
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v19 = [v10 localizedStringForKey:@"SUGGESTION_EVENT_ORGANIZER_SUBTITLE" value:&stru_1F2719D20 table:0];
  v20 = [(EKEvent *)self->_event organizer];
  v21 = [(ATXContextEventSuggestionProducer *)self _spotlightActionWithParticipant:v20 subtitle:v19];

  if (v21)
  {
    objc_super v22 = self->_eventTitle;
    [(ATXContextEventSuggestionProducer *)self scoreWithEventParticipantStatusPenalty:a3];
    double v24 = v23;
    v25 = [(ATXContextEventSuggestionProducer *)self _dateInterval];
    id v12 = +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:v21 predictionReasons:a4 localizedReason:v22 score:v25 dateInterval:v24];
  }
  else
  {
    v26 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D0F43000, v26, OS_LOG_TYPE_DEFAULT, "_actionWithParticipant returned nil", (uint8_t *)&v27, 2u);
    }

    id v12 = 0;
  }

LABEL_9:

  return v12;
}

- (BOOL)_isStringValidEmail:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v3 = (void *)MEMORY[0x1E4F28BE8];
  id v4 = a3;
  v5 = [v3 dataDetectorWithTypes:32 error:0];
  v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  memset(v16, 0, sizeof(v16));
  if (![v6 countByEnumeratingWithState:v16 objects:v17 count:16]) {
    goto LABEL_5;
  }
  v7 = (void *)**((void **)&v16[0] + 1);
  v8 = [**((id **)&v16[0] + 1) URL];
  int v9 = [v8 scheme];
  v10 = [v9 lowercaseString];
  int v11 = [v10 isEqualToString:@"mailto"];

  if (v11)
  {
    id v12 = [v7 URL];
    id v13 = [v12 resourceSpecifier];
    BOOL v14 = [v13 length] != 0;
  }
  else
  {
LABEL_5:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)suggestionForEventParticipantWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v7 = objc_opt_new();
  v8 = [(EKEvent *)self->_event organizer];
  char v9 = [v8 isCurrentUser];

  if ((v9 & 1) == 0)
  {
    BOOL v16 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "-[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:]";
      v25 = "%{public}s You are not the organizer: No suggestion";
      v26 = v16;
      uint32_t v27 = 12;
LABEL_19:
      _os_log_impl(&dword_1D0F43000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }
LABEL_20:
    double v24 = 0;
    goto LABEL_25;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v10 = [(EKEvent *)self->_event attendees];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (([v15 isCurrentUser] & 1) == 0 && objc_msgSend(v15, "participantType") != 2) {
          [v7 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v12);
  }

  if ([v7 count] != 1)
  {
    BOOL v16 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v7 count];
      *(_DWORD *)buf = 136446466;
      v35 = "-[ATXContextEventSuggestionProducer suggestionForEventParticipantWithScore:predictionReasons:]";
      __int16 v36 = 2048;
      uint64_t v37 = v28;
      v25 = "%{public}s %lu other participants: No suggestion";
      v26 = v16;
      uint32_t v27 = 22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  BOOL v16 = [v7 firstObject];
  v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v18 = [v17 localizedStringForKey:@"SUGGESTION_EVENT_PARTICIPANT_SUBTITLE" value:&stru_1F2719D20 table:0];
  uint64_t v19 = [(ATXContextEventSuggestionProducer *)self _spotlightActionWithParticipant:v16 subtitle:v18];
  if (v19)
  {
    v20 = self->_eventTitle;
    [(ATXContextEventSuggestionProducer *)self scoreWithEventParticipantStatusPenalty:a3];
    double v22 = v21;
    double v23 = [(ATXContextEventSuggestionProducer *)self _dateInterval];
    double v24 = +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:v19 predictionReasons:a4 localizedReason:v20 score:v23 dateInterval:v22];
  }
  else
  {
    double v23 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "_actionWithParticipant returned nil", buf, 2u);
    }
    double v24 = 0;
  }

LABEL_25:

  return v24;
}

- (id)_spotlightActionWithParticipant:(id)a3 subtitle:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 name];

  if (v8)
  {
    char v9 = [(ATXContextHeuristicsEnvironment *)self->_environment heuristicDevice];
    v10 = [v9 contactForParticipant:v6];

    v8 = [v10 identifier];
  }
  uint64_t v11 = [v6 name];
  uint64_t v12 = [v6 emailAddress];
  uint64_t v13 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136446978;
    uint64_t v19 = "-[ATXContextEventSuggestionProducer _spotlightActionWithParticipant:subtitle:]";
    __int16 v20 = 2112;
    double v21 = v8;
    __int16 v22 = 2112;
    double v23 = v11;
    __int16 v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s participantID:%@ participantName:%@, participantEmail:%@", (uint8_t *)&v18, 0x2Au);
  }

  BOOL v14 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:self->_validFromStartDate endDate:self->_validToEndDate lockScreenEligible:0 predicate:0];
  if (v11 && v8)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithContactName:v11 contactIdentifier:v8 subtitle:v7 criteria:v14];
    goto LABEL_16;
  }
  if (v11 && v12)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithContactName:v11 contactEmail:v12 subtitle:v7 criteria:v14];
    if (v15) {
      goto LABEL_16;
    }
    BOOL v16 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "Updated api to create participant using email not available", (uint8_t *)&v18, 2u);
    }
  }
  else
  {
    BOOL v16 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicBirthdayContact _spotlightActionWithName:email:identifier:startDate:endDate:subtitle:](v16);
    }
  }

  v15 = 0;
LABEL_16:

  return v15;
}

- (id)_stringsWithPredictionReasons:(unint64_t)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  char v9 = __Block_byref_object_dispose__5;
  id v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __67__ATXContextEventSuggestionProducer__stringsWithPredictionReasons___block_invoke(uint64_t a1)
{
  stringForATXSuggestionPredictionReasonCode();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];
}

- (id)suggestionForDNDWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  id v6 = [(EKEvent *)self->_event endDate];
  uint64_t v7 = [(EKEvent *)self->_event startDate];
  v8 = [v7 dateByAddingTimeInterval:-900.0];

  eventTitle = self->_eventTitle;
  id v10 = [(EKEvent *)self->_event UUID];
  uint64_t v11 = [(EKEvent *)self->_event calendarItemIdentifier];
  [(ATXContextEventSuggestionProducer *)self scoreWithEventParticipantStatusPenalty:a3];
  double v13 = v12;
  BOOL v14 = self->_eventTitle;
  v15 = [(NSDate *)self->_validFromStartDate laterDate:v8];
  validToEndDate = self->_validToEndDate;
  v17 = [(ATXContextEventSuggestionProducer *)self _dateInterval];
  int v18 = +[ATXContextHeuristicSuggestionProducer suggestionForDNDWithTitle:eventTitle eventUniqueID:v10 identifier:v11 until:v6 score:a4 predictionReasons:v14 localizedReason:v13 validFromStartDate:v15 validToEndDate:validToEndDate dateInterval:v17];

  return v18;
}

- (id)suggestionForConferenceWithScore:(double)a3 predictionReasons:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1D25F43D0](self, a2);
  v8 = [(EKEvent *)self->_event virtualConference];
  char v9 = [v8 joinMethods];
  id v10 = [v9 firstObject];
  uint64_t v11 = [v10 URL];
  double v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(EKEvent *)self->_event conferenceURLForDisplay];
  }
  BOOL v14 = v13;

  v15 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = [(EKEvent *)self->_event eventIdentifier];
    v17 = [(EKEvent *)self->_event title];
    uint64_t v18 = [v17 hash];
    uint64_t v19 = [(EKEvent *)self->_event startDate];
    int v27 = 138413058;
    uint64_t v28 = v16;
    __int16 v29 = 2048;
    uint64_t v30 = v18;
    __int16 v31 = 2112;
    long long v32 = v19;
    __int16 v33 = 1024;
    BOOL v34 = v14 != 0;
    _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has conferenceURL:%{BOOL}i", (uint8_t *)&v27, 0x26u);
  }
  if (v14)
  {
    __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:self->_validFromStartDate endDate:self->_validToEndDate lockScreenEligible:0 predicate:0];
    [(ATXContextEventSuggestionProducer *)self scoreWithEventParticipantStatusPenalty:a3];
    double v22 = v21;
    eventTitle = self->_eventTitle;
    __int16 v24 = [(ATXContextEventSuggestionProducer *)self _dateInterval];
    v25 = +[ATXContextHeuristicSuggestionProducer suggestionForConferenceWithURL:v14 score:a4 predictionReasons:eventTitle localizedReason:v20 criteria:v24 dateInterval:v22];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (double)scoreWithEventParticipantStatusPenalty:(double)a3
{
  p_event = &self->_event;
  uint64_t v6 = [(EKEvent *)self->_event participationStatus];
  if (v6 != 2)
  {
    if (v6 == 4)
    {
      return a3 * 0.5;
    }
    else
    {
      uint64_t v7 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(ATXContextEventSuggestionProducer *)(uint64_t)self scoreWithEventParticipantStatusPenalty:v7];
      }
    }
  }
  return a3;
}

- (id)_dateInterval
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v4 = [(EKEvent *)self->_event startDate];
  uint64_t v5 = [(EKEvent *)self->_event endDate];
  uint64_t v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_validToEndDate, 0);
  objc_storeStrong((id *)&self->_validFromStartDate, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (void)scoreWithEventParticipantStatusPenalty:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = [*a2 participationStatus];
  int v6 = 136447234;
  uint64_t v7 = "-[ATXContextEventSuggestionProducer scoreWithEventParticipantStatusPenalty:]";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 2048;
  uint64_t v13 = 2;
  __int16 v14 = 2048;
  uint64_t v15 = 4;
  _os_log_fault_impl(&dword_1D0F43000, a3, OS_LOG_TYPE_FAULT, "%{public}s _event.participationStatus for %@ is %ld not one of {%ld, %ld}. No penalty aplied", (uint8_t *)&v6, 0x34u);
}

@end