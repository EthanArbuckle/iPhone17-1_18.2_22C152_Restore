@interface ASFriendListRow
- (ASFriend)friend;
- (BOOL)isEqual:(id)a3;
- (_HKFitnessFriendActivitySnapshot)snapshot;
- (void)setFriend:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation ASFriendListRow

- (_HKFitnessFriendActivitySnapshot)snapshot
{
  return self->_snapshot;
}

- (ASFriend)friend
{
  return self->_friend;
}

- (void)setSnapshot:(id)a3
{
}

- (void)setFriend:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = [a3 friend];
  v5 = [v4 UUID];
  v6 = [(ASFriendListRow *)self friend];
  v7 = [v6 UUID];
  char v8 = [v5 isEqual:v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_friend, 0);
}

@end