@interface COMessagingSessionInfo
- (BOOL)producedSession;
- (COClusterMember)member;
- (COMessagingSessionInfo)initWithSubTopic:(id)a3 member:(id)a4 produced:(BOOL)a5;
- (NSString)subTopic;
@end

@implementation COMessagingSessionInfo

- (COMessagingSessionInfo)initWithSubTopic:(id)a3 member:(id)a4 produced:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMessagingSessionInfo;
  v11 = [(COMessagingSessionInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subTopic, a3);
    objc_storeStrong((id *)&v12->_member, a4);
    v12->_producedSession = a5;
  }

  return v12;
}

- (NSString)subTopic
{
  return self->_subTopic;
}

- (COClusterMember)member
{
  return self->_member;
}

- (BOOL)producedSession
{
  return self->_producedSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);
  objc_storeStrong((id *)&self->_subTopic, 0);
}

@end