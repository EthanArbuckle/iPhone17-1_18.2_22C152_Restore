@interface ATXOngoingCallSuggestionProducer
- (ATXOngoingCallSuggestionProducer)initWithEnvironment:(id)a3;
- (id)suggestionWithContact:(id)a3 score:(double)a4;
- (id)suggestionsForOngoingCall:(id)a3;
@end

@implementation ATXOngoingCallSuggestionProducer

- (ATXOngoingCallSuggestionProducer)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXOngoingCallSuggestionProducer;
  v6 = [(ATXOngoingCallSuggestionProducer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v8 = v7;
  }

  return v7;
}

- (id)suggestionsForOngoingCall:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v6 = [v4 count];
  if (v6 >= 4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = v6;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 80;
    do
    {
      objc_super v10 = [(ATXContextHeuristicsEnvironment *)self->_environment heuristicDevice];
      v11 = [v4 objectAtIndexedSubscript:v8];
      v12 = [v10 resolveContact:v11];

      v13 = [(ATXOngoingCallSuggestionProducer *)self suggestionWithContact:v12 score:(double)v9];
      [v5 addObject:v13];

      ++v8;
      --v9;
    }
    while (v7 != v8);
  }

  return v5;
}

- (id)suggestionWithContact:(id)a3 score:(double)a4
{
  id v5 = (void *)MEMORY[0x1E4F1B910];
  id v6 = a3;
  uint64_t v7 = [v5 stringFromContact:v6 style:0];
  uint64_t v8 = [v6 identifier];

  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithContactName:v7 contactIdentifier:v8 subtitle:0 criteria:0];
  objc_super v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"CONTEXT_ONGOING_CALL" value:&stru_1F2719D20 table:0];

  v12 = +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:v9 predictionReasons:0x80000 localizedReason:v11 score:0 dateInterval:a4];

  return v12;
}

- (void).cxx_destruct
{
}

@end