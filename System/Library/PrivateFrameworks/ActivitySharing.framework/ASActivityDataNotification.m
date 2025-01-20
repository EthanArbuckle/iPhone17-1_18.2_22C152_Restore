@interface ASActivityDataNotification
- (ASFriend)friend;
- (id)sample;
- (void)setFriend:(id)a3;
- (void)setSample:(id)a3;
@end

@implementation ASActivityDataNotification

- (ASFriend)friend
{
  return self->_friend;
}

- (void)setFriend:(id)a3
{
}

- (id)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sample, 0);

  objc_storeStrong((id *)&self->_friend, 0);
}

@end