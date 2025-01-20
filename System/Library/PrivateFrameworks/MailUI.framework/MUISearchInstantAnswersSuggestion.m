@interface MUISearchInstantAnswersSuggestion
- (EMCollectionItemID)itemID;
- (EMMessage)message;
- (EMMessageList)messageList;
- (MUISearchInstantAnswer)instantAnswer;
- (MUISearchInstantAnswersSuggestion)initWithInstantAnswer:(id)a3;
- (MUISearchInstantAnswersSuggestion)initWithMessageList:(id)a3 itemID:(id)a4 instantAnswer:(id)a5;
- (SFCard)feedbackInlineCard;
- (id)_conversationID;
- (id)category;
- (void)populateInlineCard;
@end

@implementation MUISearchInstantAnswersSuggestion

- (MUISearchInstantAnswersSuggestion)initWithInstantAnswer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUISearchInstantAnswersSuggestion;
  v5 = [(MUISearchInstantAnswersSuggestion *)&v10 init];
  if (!v5) {
    goto LABEL_8;
  }
  if ([v4 instantAnswersKind])
  {
    if ([v4 instantAnswersKind] != 1) {
      goto LABEL_7;
    }
    v6 = [[MUISearchInstantAnswer alloc] initHotelAnswerWithCSInstantAnswer:v4];
  }
  else
  {
    v6 = [[MUISearchInstantAnswer alloc] initFlightAnswerWithCSInstantAnswer:v4];
  }
  instantAnswer = v5->_instantAnswer;
  v5->_instantAnswer = v6;

LABEL_7:
  if (!v5->_instantAnswer)
  {
    v8 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v8 = v5;
LABEL_10:

  return v8;
}

- (MUISearchInstantAnswersSuggestion)initWithMessageList:(id)a3 itemID:(id)a4 instantAnswer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MUISearchInstantAnswersSuggestion;
  v12 = [(MUISearchInstantAnswersSuggestion *)&v18 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v12->_messageList, a3);
  objc_storeStrong((id *)&v13->_itemID, a4);
  if (![v11 instantAnswersKind])
  {
    v14 = [[MUISearchInstantAnswer alloc] initFlightAnswerWithCSInstantAnswer:v11];
    goto LABEL_6;
  }
  if ([v11 instantAnswersKind] == 1)
  {
    v14 = [[MUISearchInstantAnswer alloc] initHotelAnswerWithCSInstantAnswer:v11];
LABEL_6:
    instantAnswer = v13->_instantAnswer;
    v13->_instantAnswer = v14;
  }
  if (!v13->_instantAnswer)
  {
    v16 = 0;
    goto LABEL_11;
  }
  [(MUISearchInstantAnswersSuggestion *)v13 populateInlineCard];
LABEL_9:
  v16 = v13;
LABEL_11:

  return v16;
}

- (id)category
{
  return +[MUISearchSuggestionCategory instantAnswersCategory];
}

- (id)_conversationID
{
  v2 = NSNumber;
  v3 = [(MUISearchInstantAnswersSuggestion *)self message];
  id v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "conversationID"));
  v5 = [v4 stringValue];

  return v5;
}

- (EMMessage)message
{
  v3 = [(MUISearchInstantAnswersSuggestion *)self messageList];
  id v4 = [(MUISearchInstantAnswersSuggestion *)self itemID];
  v5 = [v3 messageListItemForItemID:v4];
  v6 = [v5 result];

  return (EMMessage *)v6;
}

- (void)populateInlineCard
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F99F20]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F99F28]);
  v5 = [(MUISearchInstantAnswer *)self->_instantAnswer bodyCardSectionID];
  [v4 setCardSectionId:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F9A538]);
  [v4 setCommand:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F99EF8]);
  v8 = [(MUISearchInstantAnswer *)self->_instantAnswer buttonsCardSectionID];
  [v7 setCardSectionId:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F99FB0]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F9A538]);
  [v9 setCommand:v10];

  [v9 setUniqueId:1];
  int64_t v11 = [(MUISearchInstantAnswer *)self->_instantAnswer instantAnswersKind];
  instantAnswer = self->_instantAnswer;
  if (!v11)
  {
    v15 = [(MUISearchInstantAnswer *)instantAnswer flightCheckInUrl];
    if (v15)
    {

LABEL_7:
      id v14 = objc_alloc_init(MEMORY[0x1E4F99FB0]);
      id v16 = objc_alloc_init(MEMORY[0x1E4F9A1D8]);
      [v14 setCommand:v16];

      [v14 setUniqueId:2];
      v22[0] = v9;
      v22[1] = v14;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      [v7 setButtons:v17];

      goto LABEL_8;
    }
    instantAnswer = self->_instantAnswer;
  }
  if ([(MUISearchInstantAnswer *)instantAnswer instantAnswersKind] == 1)
  {
    v13 = [(MUISearchInstantAnswer *)self->_instantAnswer hotelReservationForAddress];

    if (v13) {
      goto LABEL_7;
    }
  }
  id v21 = v9;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v7 setButtons:v14];
LABEL_8:

  v20[0] = v4;
  v20[1] = v7;
  objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v3 setCardSections:v18];

  feedbackInlineCard = self->_feedbackInlineCard;
  self->_feedbackInlineCard = (SFCard *)v3;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (MUISearchInstantAnswer)instantAnswer
{
  return self->_instantAnswer;
}

- (SFCard)feedbackInlineCard
{
  return self->_feedbackInlineCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackInlineCard, 0);
  objc_storeStrong((id *)&self->_instantAnswer, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
}

@end