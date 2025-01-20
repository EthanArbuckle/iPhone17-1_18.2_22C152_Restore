@interface _CPSearchSuggestionForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fbr;
- (NSString)identifier;
- (NSString)query;
- (NSString)suggestion;
- (NSString)topicIdentifier;
- (_CPSearchSuggestionForFeedback)initWithFacade:(id)a3;
- (double)score;
- (int)type;
- (unint64_t)hash;
- (void)setFbr:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQuery:(id)a3;
- (void)setScore:(double)a3;
- (void)setSuggestion:(id)a3;
- (void)setTopicIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSearchSuggestionForFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setTopicIdentifier:(id)a3
{
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setQuery:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setSuggestion:(id)a3
{
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_suggestion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_query hash];
  double score = self->_score;
  NSUInteger v7 = v4 ^ v5;
  double v8 = -score;
  if (score >= 0.0) {
    double v8 = self->_score;
  }
  long double v9 = round(v8);
  unint64_t v10 = (unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL);
  uint64_t v11 = 2654435761 * self->_type;
  NSUInteger v12 = [(NSString *)self->_fbr hash];
  return v7 ^ v12 ^ v11 ^ [(NSString *)self->_topicIdentifier hash] ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)self identifier];
  v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v7 = [(_CPSearchSuggestionForFeedback *)self identifier];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(_CPSearchSuggestionForFeedback *)self identifier];
    unint64_t v10 = [v4 identifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)self suggestion];
  v6 = [v4 suggestion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v12 = [(_CPSearchSuggestionForFeedback *)self suggestion];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPSearchSuggestionForFeedback *)self suggestion];
    v15 = [v4 suggestion];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)self query];
  v6 = [v4 query];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v17 = [(_CPSearchSuggestionForFeedback *)self query];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_CPSearchSuggestionForFeedback *)self query];
    v20 = [v4 query];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  double score = self->_score;
  [v4 score];
  if (score != v23) {
    goto LABEL_29;
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_29;
  }
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)self fbr];
  v6 = [v4 fbr];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v25 = [(_CPSearchSuggestionForFeedback *)self fbr];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_CPSearchSuggestionForFeedback *)self fbr];
    v28 = [v4 fbr];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)self topicIdentifier];
  v6 = [v4 topicIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v30 = [(_CPSearchSuggestionForFeedback *)self topicIdentifier];
    if (!v30)
    {

LABEL_32:
      BOOL v35 = 1;
      goto LABEL_30;
    }
    v31 = (void *)v30;
    v32 = [(_CPSearchSuggestionForFeedback *)self topicIdentifier];
    v33 = [v4 topicIdentifier];
    char v34 = [v32 isEqual:v33];

    if (v34) {
      goto LABEL_32;
    }
  }
  else
  {
LABEL_28:
  }
LABEL_29:
  BOOL v35 = 0;
LABEL_30:

  return v35;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_CPSearchSuggestionForFeedback *)self identifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)self suggestion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(_CPSearchSuggestionForFeedback *)self query];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  [(_CPSearchSuggestionForFeedback *)self score];
  if (v7 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_CPSearchSuggestionForFeedback *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  double v8 = [(_CPSearchSuggestionForFeedback *)self fbr];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  long double v9 = [(_CPSearchSuggestionForFeedback *)self topicIdentifier];

  unint64_t v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    unint64_t v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSearchSuggestionForFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPSearchSuggestionForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPSearchSuggestionForFeedback;
  NSUInteger v5 = [(_CPSearchSuggestionForFeedback *)&v18 init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      double v7 = [v4 identifier];
      [(_CPSearchSuggestionForFeedback *)v5 setIdentifier:v7];
    }
    double v8 = [v4 suggestion];

    if (v8)
    {
      long double v9 = [v4 suggestion];
      [(_CPSearchSuggestionForFeedback *)v5 setSuggestion:v9];
    }
    unint64_t v10 = [v4 query];

    if (v10)
    {
      id v11 = [v4 query];
      [(_CPSearchSuggestionForFeedback *)v5 setQuery:v11];
    }
    [v4 score];
    -[_CPSearchSuggestionForFeedback setScore:](v5, "setScore:");
    -[_CPSearchSuggestionForFeedback setType:](v5, "setType:", [v4 type]);
    uint64_t v12 = [v4 fbr];

    if (v12)
    {
      v13 = [v4 fbr];
      [(_CPSearchSuggestionForFeedback *)v5 setFbr:v13];
    }
    v14 = [v4 topicIdentifier];

    if (v14)
    {
      v15 = [v4 topicIdentifier];
      [(_CPSearchSuggestionForFeedback *)v5 setTopicIdentifier:v15];
    }
    int v16 = v5;
  }

  return v5;
}

@end