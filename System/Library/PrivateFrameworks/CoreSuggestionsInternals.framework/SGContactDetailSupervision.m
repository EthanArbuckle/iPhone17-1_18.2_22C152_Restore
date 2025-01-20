@interface SGContactDetailSupervision
- (BOOL)isFirstPerson;
- (BOOL)isThirdPerson;
- (BOOL)isUnlikelyPhone;
- (BOOL)regexBelongsToSender;
- (BOOL)regexDoesNotBelongToSender;
- (NSArray)matchingContacts;
- (NSDate)matchDate;
- (NSString)senderDisplayName;
- (SGContactDetailSupervision)initWithMessage:(id)a3 ddMatch:(id)a4 isUnlikelyPhone:(BOOL)a5;
- (SGMContactDetailFoundIn_)metricsContactDetailFoundIn;
- (SGMContactDetailOwner_)metricsContactDetailOwner;
- (unint64_t)ignoreAfter;
- (void)setIgnoreAfter:(unint64_t)a3;
- (void)setIsFirstPerson:(BOOL)a3;
- (void)setIsThirdPerson:(BOOL)a3;
- (void)setIsUnlikelyPhone:(BOOL)a3;
- (void)setMatchDate:(id)a3;
- (void)setRegexBelongsToSender:(BOOL)a3;
- (void)setRegexDoesNotBelongToSender:(BOOL)a3;
- (void)setSenderDisplayName:(id)a3;
@end

@implementation SGContactDetailSupervision

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_senderDisplayName);
  objc_destroyWeak((id *)&self->_matchDate);
  objc_storeStrong((id *)&self->_matchingContacts, 0);
}

- (void)setSenderDisplayName:(id)a3
{
}

- (NSString)senderDisplayName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_senderDisplayName);
  return (NSString *)WeakRetained;
}

- (void)setMatchDate:(id)a3
{
}

- (NSDate)matchDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matchDate);
  return (NSDate *)WeakRetained;
}

- (void)setIgnoreAfter:(unint64_t)a3
{
  self->_ignoreAfter = a3;
}

- (unint64_t)ignoreAfter
{
  return self->_ignoreAfter;
}

- (void)setIsUnlikelyPhone:(BOOL)a3
{
  self->_isUnlikelyPhone = a3;
}

- (BOOL)isUnlikelyPhone
{
  return self->_isUnlikelyPhone;
}

- (NSArray)matchingContacts
{
  return self->_matchingContacts;
}

- (void)setIsThirdPerson:(BOOL)a3
{
  self->_isThirdPerson = a3;
}

- (BOOL)isThirdPerson
{
  return self->_isThirdPerson;
}

- (void)setIsFirstPerson:(BOOL)a3
{
  self->_isFirstPerson = a3;
}

- (BOOL)isFirstPerson
{
  return self->_isFirstPerson;
}

- (void)setRegexDoesNotBelongToSender:(BOOL)a3
{
  self->_regexDoesNotBelongToSender = a3;
}

- (BOOL)regexDoesNotBelongToSender
{
  return self->_regexDoesNotBelongToSender;
}

- (void)setRegexBelongsToSender:(BOOL)a3
{
  self->_regexBelongsToSender = a3;
}

- (BOOL)regexBelongsToSender
{
  return self->_regexBelongsToSender;
}

- (SGMContactDetailFoundIn_)metricsContactDetailFoundIn
{
  if ([(SGContactDetailSupervision *)self isFirstPerson])
  {
    v3 = (SGMContactDetailFoundIn_ *)MEMORY[0x1E4F5DCF8];
  }
  else
  {
    BOOL v4 = [(SGContactDetailSupervision *)self isThirdPerson];
    v3 = (SGMContactDetailFoundIn_ *)MEMORY[0x1E4F5DCE8];
    if (v4) {
      v3 = (SGMContactDetailFoundIn_ *)MEMORY[0x1E4F5DCF0];
    }
  }
  return (SGMContactDetailFoundIn_)v3->var0;
}

- (SGMContactDetailOwner_)metricsContactDetailOwner
{
  if ([(SGContactDetailSupervision *)self isFirstPerson])
  {
    v3 = (SGMContactDetailOwner_ *)MEMORY[0x1E4F5DD18];
  }
  else
  {
    BOOL v4 = [(SGContactDetailSupervision *)self isThirdPerson];
    v3 = (SGMContactDetailOwner_ *)MEMORY[0x1E4F5DD08];
    if (v4) {
      v3 = (SGMContactDetailOwner_ *)MEMORY[0x1E4F5DD10];
    }
  }
  return (SGMContactDetailOwner_)v3->var0;
}

- (SGContactDetailSupervision)initWithMessage:(id)a3 ddMatch:(id)a4 isUnlikelyPhone:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SGContactDetailSupervision;
  v10 = [(SGContactDetailSupervision *)&v34 init];
  if (v10)
  {
    v11 = (void *)MEMORY[0x1CB79B230]();
    [(SGContactDetailSupervision *)v10 setIsUnlikelyPhone:v5];
    -[SGContactDetailSupervision setIgnoreAfter:](v10, "setIgnoreAfter:", [v9 valueRange]);
    v12 = [v8 date];
    [(SGContactDetailSupervision *)v10 setMatchDate:v12];

    v13 = [v8 author];
    v14 = [v13 displayName];
    [(SGContactDetailSupervision *)v10 setSenderDisplayName:v14];

    v15 = [v9 valueString];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      v18 = (void *)MEMORY[0x1CB79B230]();
      v19 = [v8 textContent];
      uint64_t v20 = [v9 valueRange];
      objc_msgSend(v19, "substringWithRange:", v20, v21);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }

    [(SGContactDetailSupervision *)v10 setIsFirstPerson:0];
    [(SGContactDetailSupervision *)v10 setIsThirdPerson:0];
    if (hasMessageAndValidAuthorsName(v8))
    {
      unsigned int v22 = [v9 matchType];
      if (v22 >= 3) {
        uint64_t v23 = -1;
      }
      else {
        uint64_t v23 = v22;
      }
      v24 = +[SGContactPipelineHelper findContactsForDetailType:v23 andValue:v17];
      v25 = v24;
      if (v24 && [v24 count])
      {
        [(SGContactDetailSupervision *)v10 setIsUnlikelyPhone:0];
        v32 = [v8 author];
        [v32 displayName];
        v26 = v33 = v11;
        v27 = [v8 author];
        v28 = [v27 handles];
        v29 = [v28 firstObject];
        BOOL v30 = +[SGContactPipelineHelper personExistsInContacts:v25 name:v26 handle:v29];

        v11 = v33;
        [(SGContactDetailSupervision *)v10 setIsFirstPerson:v30];
        [(SGContactDetailSupervision *)v10 setIsThirdPerson:v30 ^ 1];
        objc_storeStrong((id *)&v10->_matchingContacts, v25);
      }
    }
  }

  return v10;
}

@end