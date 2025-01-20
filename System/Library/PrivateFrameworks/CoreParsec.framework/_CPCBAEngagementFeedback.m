@interface _CPCBAEngagementFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)url;
- (_CPCBAEngagementFeedback)init;
- (int)cbaType;
- (unint64_t)hash;
- (unint64_t)queryId;
- (unint64_t)timestamp;
- (void)setCbaType:(int)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCBAEngagementFeedback

- (void).cxx_destruct
{
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setCbaType:(int)a3
{
  self->_cbaType = a3;
}

- (int)cbaType
{
  return self->_cbaType;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
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
  unint64_t v2 = (2654435761u * self->_queryId) ^ (2654435761u * self->_timestamp);
  uint64_t v3 = 2654435761 * self->_cbaType;
  return v2 ^ v3 ^ [(NSString *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      unint64_t queryId = self->_queryId;
      if (queryId == [v4 queryId])
      {
        int cbaType = self->_cbaType;
        if (cbaType == [v4 cbaType])
        {
          v8 = [(_CPCBAEngagementFeedback *)self url];
          v9 = [v4 url];
          v10 = v9;
          if ((v8 == 0) != (v9 != 0))
          {
            uint64_t v11 = [(_CPCBAEngagementFeedback *)self url];
            if (!v11)
            {

LABEL_13:
              BOOL v16 = 1;
              goto LABEL_11;
            }
            v12 = (void *)v11;
            v13 = [(_CPCBAEngagementFeedback *)self url];
            v14 = [v4 url];
            char v15 = [v13 isEqual:v14];

            if (v15) {
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_CPCBAEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPCBAEngagementFeedback *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPCBAEngagementFeedback *)self cbaType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPCBAEngagementFeedback *)self url];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCBAEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCBAEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCBAEngagementFeedback;
  unint64_t v2 = [(_CPCBAEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCBAEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    uint64_t v3 = v2;
  }

  return v2;
}

@end