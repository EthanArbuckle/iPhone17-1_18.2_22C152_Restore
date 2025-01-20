@interface IMMessagePartHistoricalContent
- (IMMessagePartHistoricalContent)initWithMessagePartText:(id)a3 dateSent:(id)a4 backwardCompatibleMessageGUID:(id)a5;
- (IMMessagePartHistoricalContent)initWithMessageSummaryInfoDictionary:(id)a3;
- (NSAttributedString)messagePartText;
- (NSDate)dateSent;
- (NSString)backwardCompatibleMessageGUID;
- (id)copyWithUpdatedMessagePartText:(id)a3;
- (id)description;
- (id)messageSummaryInfoDictionaryRepresentation;
- (void)setBackwardCompatibleMessageGUID:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setMessagePartText:(id)a3;
@end

@implementation IMMessagePartHistoricalContent

- (IMMessagePartHistoricalContent)initWithMessagePartText:(id)a3 dateSent:(id)a4 backwardCompatibleMessageGUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMMessagePartHistoricalContent;
  v11 = [(IMMessagePartHistoricalContent *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    messagePartText = v11->_messagePartText;
    v11->_messagePartText = (NSAttributedString *)v12;

    objc_storeStrong((id *)&v11->_dateSent, a4);
    uint64_t v14 = [v10 copy];
    backwardCompatibleMessageGUID = v11->_backwardCompatibleMessageGUID;
    v11->_backwardCompatibleMessageGUID = (NSString *)v14;
  }
  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMMessagePartHistoricalContent %p> {date: %@ guid: %@}", self, self->_dateSent, self->_backwardCompatibleMessageGUID];
}

- (NSAttributedString)messagePartText
{
  return self->_messagePartText;
}

- (void)setMessagePartText:(id)a3
{
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
}

- (NSString)backwardCompatibleMessageGUID
{
  return self->_backwardCompatibleMessageGUID;
}

- (void)setBackwardCompatibleMessageGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backwardCompatibleMessageGUID, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);

  objc_storeStrong((id *)&self->_messagePartText, 0);
}

- (IMMessagePartHistoricalContent)initWithMessageSummaryInfoDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "__immphc_attributedStringForKey:", @"t");
  v6 = objc_msgSend(v4, "__immphc_dateForKey:", @"d");
  v7 = [v4 _stringForKey:@"bcg"];

  id v8 = [(IMMessagePartHistoricalContent *)self initWithMessagePartText:v5 dateSent:v6 backwardCompatibleMessageGUID:v7];
  return v8;
}

- (id)messageSummaryInfoDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  messagePartText = self->_messagePartText;
  if (messagePartText) {
    objc_msgSend(v3, "__immphc_setAttributedString:forKey:", messagePartText, @"t");
  }
  dateSent = self->_dateSent;
  if (dateSent) {
    objc_msgSend(v4, "__immphc_setDate:forKey:", dateSent, @"d");
  }
  backwardCompatibleMessageGUID = self->_backwardCompatibleMessageGUID;
  if (backwardCompatibleMessageGUID) {
    [v4 setObject:backwardCompatibleMessageGUID forKey:@"bcg"];
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (id)copyWithUpdatedMessagePartText:(id)a3
{
  id v4 = a3;
  v5 = [[IMMessagePartHistoricalContent alloc] initWithMessagePartText:v4 dateSent:self->_dateSent backwardCompatibleMessageGUID:self->_backwardCompatibleMessageGUID];

  return v5;
}

@end