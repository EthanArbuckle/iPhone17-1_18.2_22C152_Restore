@interface FBKQuestionAnswerPair
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequired;
- (BOOL)setPropertiesFromJSONObject:(id)a3;
- (FBKQuestionAnswerPair)initWithCoder:(id)a3;
- (FBKQuestionAnswerPair)initWithJSONObject:(id)a3;
- (FBKQuestionAnswerPair)initWithQuestionText:(id)a3 andAnswerText:(id)a4;
- (NSString)answerText;
- (NSString)questionText;
- (unint64_t)answerType;
- (void)encodeWithCoder:(id)a3;
- (void)setAnswerText:(id)a3;
- (void)setAnswerType:(unint64_t)a3;
- (void)setIsRequired:(BOOL)a3;
- (void)setQuestionText:(id)a3;
@end

@implementation FBKQuestionAnswerPair

- (FBKQuestionAnswerPair)initWithQuestionText:(id)a3 andAnswerText:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKQuestionAnswerPair;
  v9 = [(FBKQuestionAnswerPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_questionText, a3);
    objc_storeStrong((id *)&v10->_answerText, a4);
  }

  return v10;
}

- (FBKQuestionAnswerPair)initWithJSONObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionAnswerPair;
  v5 = [(FBKQuestionAnswerPair *)&v9 init];
  v6 = v5;
  if (v5 && ![(FBKQuestionAnswerPair *)v5 setPropertiesFromJSONObject:v4]) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }

  return v7;
}

- (BOOL)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v17 = 0;
  v5 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"question_text", &v17);
  v6 = v17;

  if (v5)
  {
    [(FBKQuestionAnswerPair *)self setQuestionText:v6];
    v16 = 0;
    id v7 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"answer_text", &v16);
    id v8 = v16;

    if (v7) {
      [(FBKQuestionAnswerPair *)self setAnswerText:v8];
    }
    v15 = 0;
    objc_super v9 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"required", &v15);
    v10 = v15;

    if (v9) {
      -[FBKQuestionAnswerPair setIsRequired:](self, "setIsRequired:", [v10 BOOLValue]);
    }
    v14 = 0;
    v11 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"answer_widget", &v14);
    objc_super v12 = v14;

    if (v11) {
      [(FBKQuestionAnswerPair *)self setAnswerType:+[FBKAnswer answerTypeFromString:v12]];
    }
  }
  else
  {
    id v8 = 0;
    v10 = 0;
    objc_super v12 = 0;
  }

  return v5 != 0;
}

- (NSString)answerText
{
  unint64_t v3 = [(FBKQuestionAnswerPair *)self answerType];
  switch(v3)
  {
    case 8uLL:
      id v4 = objc_alloc_init(MEMORY[0x263F088C0]);
      [v4 setFormatOptions:275];
      v5 = [v4 dateFromString:self->_answerText];
      id v7 = objc_opt_new();
      objc_super v9 = [v4 timeZone];
      [v7 setTimeZone:v9];

      [v7 setDateStyle:2];
      v10 = v7;
      uint64_t v11 = 0;
LABEL_8:
      [v10 setTimeStyle:v11];
      v13 = [v7 stringFromDate:v5];

      goto LABEL_10;
    case 0xAuLL:
      id v4 = objc_alloc_init(MEMORY[0x263F088C0]);
      [v4 setFormatOptions:544];
      v5 = [v4 dateFromString:self->_answerText];
      id v7 = objc_opt_new();
      objc_super v12 = [v4 timeZone];
      [v7 setTimeZone:v12];

      v6 = v7;
      uint64_t v8 = 0;
      goto LABEL_7;
    case 9uLL:
      id v4 = objc_alloc_init(MEMORY[0x263F088C0]);
      v5 = [v4 dateFromString:self->_answerText];
      v6 = objc_opt_new();
      id v7 = v6;
      uint64_t v8 = 2;
LABEL_7:
      [v6 setDateStyle:v8];
      v10 = v7;
      uint64_t v11 = 1;
      goto LABEL_8;
  }
  v13 = self->_answerText;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  questionText = self->_questionText;
  id v5 = a3;
  [v5 encodeObject:questionText forKey:@"question_text"];
  [v5 encodeObject:self->_answerText forKey:@"answer_text"];
  [v5 encodeBool:self->_isRequired forKey:@"required"];
  [v5 encodeInteger:self->_answerType forKey:@"answer_widget"];
}

- (FBKQuestionAnswerPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBKQuestionAnswerPair;
  id v5 = [(FBKQuestionAnswerPair *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"question_text"];
    questionText = v5->_questionText;
    v5->_questionText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"answer_text"];
    answerText = v5->_answerText;
    v5->_answerText = (NSString *)v8;

    v5->_isRequired = [v4 decodeBoolForKey:@"required"];
    v5->_answerType = [v4 decodeIntegerForKey:@"answer_widget"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(FBKQuestionAnswerPair *)self questionText];
    id v7 = [v5 questionText];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [(FBKQuestionAnswerPair *)self answerText];
      objc_super v9 = [v5 answerText];
      if ([v8 isEqualToString:v9])
      {
        unint64_t v10 = [(FBKQuestionAnswerPair *)self answerType];
        BOOL v11 = v10 == [v5 answerType];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)questionText
{
  return self->_questionText;
}

- (void)setQuestionText:(id)a3
{
}

- (void)setAnswerText:(id)a3
{
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (unint64_t)answerType
{
  return self->_answerType;
}

- (void)setAnswerType:(unint64_t)a3
{
  self->_answerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerText, 0);

  objc_storeStrong((id *)&self->_questionText, 0);
}

@end