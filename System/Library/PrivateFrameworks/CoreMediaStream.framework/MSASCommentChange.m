@interface MSASCommentChange
- (MSASComment)comment;
- (id)description;
- (int)deletionIndex;
- (int)type;
- (void)setComment:(id)a3;
- (void)setDeletionIndex:(int)a3;
- (void)setType:(int)a3;
@end

@implementation MSASCommentChange

- (void).cxx_destruct
{
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setDeletionIndex:(int)a3
{
  self->_deletionIndex = a3;
}

- (int)deletionIndex
{
  return self->_deletionIndex;
}

- (void)setComment:(id)a3
{
}

- (MSASComment)comment
{
  return self->_comment;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MSASCommentChange;
  v4 = [(MSASCommentChange *)&v9 description];
  uint64_t v5 = [(MSASCommentChange *)self type];
  v6 = [(MSASCommentChange *)self comment];
  v7 = [v3 stringWithFormat:@"%@: Type: %d, comment: %@, deletion index: %d", v4, v5, v6, -[MSASCommentChange deletionIndex](self, "deletionIndex")];

  return v7;
}

@end