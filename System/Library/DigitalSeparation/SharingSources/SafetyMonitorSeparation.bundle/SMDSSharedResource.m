@interface SMDSSharedResource
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (int64_t)visibility;
- (void)setParticipants:(id)a3;
@end

@implementation SMDSSharedResource

- (int64_t)visibility
{
  return 1;
}

- (NSString)displayName
{
  return self->displayName;
}

- (NSString)displayDetail
{
  return self->displayDetail;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->displayDetail, 0);

  objc_storeStrong((id *)&self->displayName, 0);
}

@end