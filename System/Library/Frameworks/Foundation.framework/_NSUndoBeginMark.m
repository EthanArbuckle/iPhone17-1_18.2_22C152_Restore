@interface _NSUndoBeginMark
- (BOOL)isBeginMark;
- (BOOL)isDiscardable;
- (id)description;
- (id)groupIdentifier;
- (id)userInfo;
- (void)dealloc;
- (void)setDiscardable:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _NSUndoBeginMark

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSUndoBeginMark;
  [(_NSUndoBeginMark *)&v3 dealloc];
}

- (void)setGroupIdentifier:(id)a3
{
  id groupIdentifier = self->_groupIdentifier;
  self->_id groupIdentifier = (id)objc_msgSend(a3, "copyWithZone:", -[_NSUndoBeginMark zone](self, "zone"));
}

- (id)groupIdentifier
{
  id v2 = self->_groupIdentifier;

  return v2;
}

- (void)setUserInfo:(id)a3
{
  userInfo = self->_userInfo;
  self->_userInfo = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopyWithZone:", -[_NSUndoBeginMark zone](self, "zone"));
}

- (id)userInfo
{
  id v2 = self->_userInfo;

  return v2;
}

- (BOOL)isDiscardable
{
  return self->_isDiscardable;
}

- (void)setDiscardable:(BOOL)a3
{
  self->_isDiscardable = a3;
}

- (BOOL)isBeginMark
{
  return 1;
}

- (id)description
{
  id groupIdentifier = (__CFString *)self->_groupIdentifier;
  BOOL isDiscardable = self->_isDiscardable;
  userInfo = self->_userInfo;
  if (userInfo) {
    v5 = (__CFString *)[(NSMutableDictionary *)userInfo description];
  }
  else {
    v5 = &stru_1ECA5C228;
  }
  if (groupIdentifier) {
    v6 = groupIdentifier;
  }
  else {
    v6 = &stru_1ECA5C228;
  }
  v7 = "(discardable)";
  if (!isDiscardable) {
    v7 = "";
  }
  return +[NSString stringWithFormat:@"beginUndoGrouping %@ %s %@", v6, v7, v5];
}

@end