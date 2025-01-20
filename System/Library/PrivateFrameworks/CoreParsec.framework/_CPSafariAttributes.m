@interface _CPSafariAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPSafariAttributes)initWithFacade:(id)a3;
- (int)hideReason;
- (unint64_t)hash;
- (void)setHideReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSafariAttributes

- (void)setHideReason:(int)a3
{
  self->_hideReason = a3;
}

- (int)hideReason
{
  return self->_hideReason;
}

- (unint64_t)hash
{
  return 2654435761 * self->_hideReason;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int hideReason = self->_hideReason;
    BOOL v6 = hideReason == [v4 hideReason];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_CPSafariAttributes *)self hideReason]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSafariAttributesReadFrom(self, (uint64_t)a3);
}

- (_CPSafariAttributes)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPSafariAttributes *)self init];
  if (v5)
  {
    -[_CPSafariAttributes setHideReason:](v5, "setHideReason:", [v4 hideReason]);
    BOOL v6 = v5;
  }

  return v5;
}

@end