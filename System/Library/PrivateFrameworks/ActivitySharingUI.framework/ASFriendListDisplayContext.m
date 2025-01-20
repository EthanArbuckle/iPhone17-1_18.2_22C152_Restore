@interface ASFriendListDisplayContext
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)displayFilter;
- (int64_t)displayMode;
- (unint64_t)hash;
- (void)setDisplayFilter:(int64_t)a3;
- (void)setDisplayMode:(int64_t)a3;
@end

@implementation ASFriendListDisplayContext

- (unint64_t)hash
{
  return self->_displayMode + (self->_displayFilter << 15);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDisplayMode:", -[ASFriendListDisplayContext displayMode](self, "displayMode"));
  objc_msgSend(v4, "setDisplayFilter:", -[ASFriendListDisplayContext displayFilter](self, "displayFilter"));
  return v4;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (void)setDisplayFilter:(int64_t)a3
{
  self->_displayFilter = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t displayMode = self->_displayMode;
  if (displayMode == [v4 displayMode])
  {
    int64_t displayFilter = self->_displayFilter;
    BOOL v7 = displayFilter == [v4 displayFilter];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (int64_t)displayFilter
{
  return self->_displayFilter;
}

@end