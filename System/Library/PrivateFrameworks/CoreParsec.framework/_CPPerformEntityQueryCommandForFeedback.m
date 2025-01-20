@interface _CPPerformEntityQueryCommandForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tokenString;
- (_CPPerformEntityQueryCommandForFeedback)initWithFacade:(id)a3;
- (int)entityType;
- (unint64_t)hash;
- (void)setEntityType:(int)a3;
- (void)setTokenString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPPerformEntityQueryCommandForFeedback

- (void).cxx_destruct
{
}

- (void)setEntityType:(int)a3
{
  self->_entityType = a3;
}

- (int)entityType
{
  return self->_entityType;
}

- (void)setTokenString:(id)a3
{
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (unint64_t)hash
{
  return (2654435761 * self->_entityType) ^ [(NSString *)self->_tokenString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_CPPerformEntityQueryCommandForFeedback *)self tokenString];
    v6 = [v4 tokenString];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_CPPerformEntityQueryCommandForFeedback *)self tokenString];
      if (!v8)
      {

LABEL_10:
        int entityType = self->_entityType;
        BOOL v13 = entityType == [v4 entityType];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_CPPerformEntityQueryCommandForFeedback *)self tokenString];
      v11 = [v4 tokenString];
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_CPPerformEntityQueryCommandForFeedback *)self tokenString];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPPerformEntityQueryCommandForFeedback *)self entityType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPPerformEntityQueryCommandForFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPPerformEntityQueryCommandForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPPerformEntityQueryCommandForFeedback;
  id v5 = [(_CPPerformEntityQueryCommandForFeedback *)&v10 init];
  if (v5)
  {
    v6 = [v4 tokenString];

    if (v6)
    {
      v7 = [v4 tokenString];
      [(_CPPerformEntityQueryCommandForFeedback *)v5 setTokenString:v7];
    }
    -[_CPPerformEntityQueryCommandForFeedback setEntityType:](v5, "setEntityType:", [v4 entityType]);
    uint64_t v8 = v5;
  }

  return v5;
}

@end