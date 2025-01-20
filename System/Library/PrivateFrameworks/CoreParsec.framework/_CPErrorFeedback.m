@interface _CPErrorFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)relatedStartNetworkSearchFeedbackId;
- (_CPError)error;
- (_CPError)underlyingError;
- (_CPErrorFeedback)init;
- (_CPErrorFeedback)initWithError:(id)a3;
- (_CPErrorFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setError:(id)a3;
- (void)setRelatedStartNetworkSearchFeedbackId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUnderlyingError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPErrorFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedStartNetworkSearchFeedbackId, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setRelatedStartNetworkSearchFeedbackId:(id)a3
{
}

- (NSString)relatedStartNetworkSearchFeedbackId
{
  return self->_relatedStartNetworkSearchFeedbackId;
}

- (void)setUnderlyingError:(id)a3
{
}

- (_CPError)underlyingError
{
  return self->_underlyingError;
}

- (void)setError:(id)a3
{
}

- (_CPError)error
{
  return self->_error;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = 2654435761u * self->_timestamp;
  unint64_t v4 = [(_CPError *)self->_error hash];
  unint64_t v5 = v4 ^ [(_CPError *)self->_underlyingError hash];
  return v5 ^ [(NSString *)self->_relatedStartNetworkSearchFeedbackId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_18;
  }
  v6 = [(_CPErrorFeedback *)self error];
  v7 = [v4 error];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(_CPErrorFeedback *)self error];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPErrorFeedback *)self error];
    v11 = [v4 error];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_CPErrorFeedback *)self underlyingError];
  v7 = [v4 underlyingError];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_CPErrorFeedback *)self underlyingError];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPErrorFeedback *)self underlyingError];
    v16 = [v4 underlyingError];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_CPErrorFeedback *)self relatedStartNetworkSearchFeedbackId];
  v7 = [v4 relatedStartNetworkSearchFeedbackId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(_CPErrorFeedback *)self relatedStartNetworkSearchFeedbackId];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(_CPErrorFeedback *)self relatedStartNetworkSearchFeedbackId];
    v21 = [v4 relatedStartNetworkSearchFeedbackId];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if ([(_CPErrorFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPErrorFeedback *)self error];

  if (v4)
  {
    unint64_t v5 = [(_CPErrorFeedback *)self error];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(_CPErrorFeedback *)self underlyingError];

  if (v6)
  {
    v7 = [(_CPErrorFeedback *)self underlyingError];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(_CPErrorFeedback *)self relatedStartNetworkSearchFeedbackId];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPErrorFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPErrorFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPErrorFeedback;
  v2 = [(_CPErrorFeedback *)&v5 init];
  if (v2)
  {
    [(_CPErrorFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPErrorFeedback)initWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_CPErrorFeedback *)self init];
  if (v5)
  {
    [(_CPErrorFeedback *)v5 setTimestamp:mach_absolute_time()];
    if (v4)
    {
      v6 = [[_CPError alloc] initWithFacade:v4];
      [(_CPErrorFeedback *)v5 setError:v6];
    }
    v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v8)
    {
      v9 = [[_CPError alloc] initWithFacade:v8];
      [(_CPErrorFeedback *)v5 setUnderlyingError:v9];
    }
    id v10 = v5;
  }
  return v5;
}

- (_CPErrorFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 error];
  v6 = [(_CPErrorFeedback *)self initWithError:v5];

  if (v6)
  {
    -[_CPErrorFeedback setTimestamp:](v6, "setTimestamp:", [v4 timestamp]);
    v7 = v6;
  }

  return v6;
}

@end