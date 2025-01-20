@interface _CPVisibleSectionHeaderFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionId;
- (_CPVisibleSectionHeaderFeedback)init;
- (_CPVisibleSectionHeaderFeedback)initWithFacade:(id)a3;
- (int)headerType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setHeaderType:(int)a3;
- (void)setSectionId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPVisibleSectionHeaderFeedback

- (void).cxx_destruct
{
}

- (void)setSectionId:(id)a3
{
}

- (NSString)sectionId
{
  return self->_sectionId;
}

- (void)setHeaderType:(int)a3
{
  self->_headerType = a3;
}

- (int)headerType
{
  return self->_headerType;
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
  unint64_t v2 = (2654435761 * self->_headerType) ^ (2654435761u * self->_timestamp);
  return v2 ^ [(NSString *)self->_sectionId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      int headerType = self->_headerType;
      if (headerType == [v4 headerType])
      {
        v7 = [(_CPVisibleSectionHeaderFeedback *)self sectionId];
        v8 = [v4 sectionId];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_CPVisibleSectionHeaderFeedback *)self sectionId];
          if (!v10)
          {

LABEL_12:
            BOOL v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          v12 = [(_CPVisibleSectionHeaderFeedback *)self sectionId];
          v13 = [v4 sectionId];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_CPVisibleSectionHeaderFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPVisibleSectionHeaderFeedback *)self headerType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPVisibleSectionHeaderFeedback *)self sectionId];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPVisibleSectionHeaderFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPVisibleSectionHeaderFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPVisibleSectionHeaderFeedback;
  unint64_t v2 = [(_CPVisibleSectionHeaderFeedback *)&v5 init];
  if (v2)
  {
    [(_CPVisibleSectionHeaderFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPVisibleSectionHeaderFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPVisibleSectionHeaderFeedback;
  objc_super v5 = [(_CPVisibleSectionHeaderFeedback *)&v10 init];
  if (v5)
  {
    -[_CPVisibleSectionHeaderFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    id v6 = [v4 section];
    v7 = [v6 identifier];
    [(_CPVisibleSectionHeaderFeedback *)v5 setSectionId:v7];

    -[_CPVisibleSectionHeaderFeedback setHeaderType:](v5, "setHeaderType:", [v4 headerType]);
    v8 = v5;
  }

  return v5;
}

@end