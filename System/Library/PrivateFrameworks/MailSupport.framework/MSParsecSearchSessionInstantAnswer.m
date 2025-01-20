@interface MSParsecSearchSessionInstantAnswer
+ (id)instantAnswerWithIdentifier:(id)a3 date:(id)a4 inlineCard:(id)a5 isInstantAnswerUpdated:(BOOL)a6;
- (BOOL)isInstantAnswerUpdated;
- (MSParsecSearchSessionInstantAnswer)initWithIdentifier:(id)a3 date:(id)a4 inlineCard:(id)a5 isInstantAnswerUpdated:(BOOL)a6;
- (SFCard)inlineCard;
- (id)feedbackResult;
@end

@implementation MSParsecSearchSessionInstantAnswer

+ (id)instantAnswerWithIdentifier:(id)a3 date:(id)a4 inlineCard:(id)a5 isInstantAnswerUpdated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 date:v11 inlineCard:v12 isInstantAnswerUpdated:v6];

  return v13;
}

- (MSParsecSearchSessionInstantAnswer)initWithIdentifier:(id)a3 date:(id)a4 inlineCard:(id)a5 isInstantAnswerUpdated:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSParsecSearchSessionInstantAnswer;
  id v12 = [(MSParsecSearchSessionMessageResult *)&v15 initResultWithIdentifier:a3 date:a4];
  v13 = (MSParsecSearchSessionInstantAnswer *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 4, a5);
    v13->_isInstantAnswerUpdated = a6;
  }

  return v13;
}

- (id)feedbackResult
{
  v6.receiver = self;
  v6.super_class = (Class)MSParsecSearchSessionInstantAnswer;
  v3 = [(MSParsecSearchSessionMessageResult *)&v6 feedbackResult];
  [v3 setIsInstantAnswer:1];
  [v3 setResultBundleId:@"com.apple.mail.search.instantanswer"];
  [v3 setSectionBundleIdentifier:@"instantanswer"];
  [v3 setInlineCard:self->_inlineCard];
  NSSelectorFromString(&cfstr_Ismailinstanta.isa);
  if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isInstantAnswerUpdated];
    [v3 setValue:v4 forKey:@"isMailInstantAnswerUpdated"];
  }
  return v3;
}

- (SFCard)inlineCard
{
  return self->_inlineCard;
}

- (BOOL)isInstantAnswerUpdated
{
  return self->_isInstantAnswerUpdated;
}

- (void).cxx_destruct
{
}

@end