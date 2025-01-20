@interface CKSpotlightSearchResult
- (CKSpotlightSearchResult)initWithMessageGUID:(id)a3 chatGUID:(id)a4 messageTime:(id)a5 summery:(id)a6;
- (NSDate)messageDate;
- (NSString)chatGUID;
- (NSString)messageGUID;
- (NSString)summary;
- (int64_t)compare:(id)a3;
- (void)setChatGUID:(id)a3;
- (void)setMessageDate:(id)a3;
- (void)setMessageGUID:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation CKSpotlightSearchResult

- (CKSpotlightSearchResult)initWithMessageGUID:(id)a3 chatGUID:(id)a4 messageTime:(id)a5 summery:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKSpotlightSearchResult;
  v14 = [(CKSpotlightSearchResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(CKSpotlightSearchResult *)v14 setSummary:v13];
    [(CKSpotlightSearchResult *)v15 setMessageDate:v12];
    [(CKSpotlightSearchResult *)v15 setMessageGUID:v10];
    [(CKSpotlightSearchResult *)v15 setChatGUID:v11];
  }

  return v15;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKSpotlightSearchResult *)self messageDate];
  if (v5
    && (v6 = (void *)v5,
        [v4 messageDate],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [(CKSpotlightSearchResult *)self messageDate];
    v9 = [v4 messageDate];
    int64_t v10 = [v8 compare:v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (NSDate)messageDate
{
  return self->_messageDate;
}

- (void)setMessageDate:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_messageDate, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_chatGUID, 0);
}

@end