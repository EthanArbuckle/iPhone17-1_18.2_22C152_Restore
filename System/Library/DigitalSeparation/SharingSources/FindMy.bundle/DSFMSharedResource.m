@interface DSFMSharedResource
- (NSArray)participants;
- (NSString)description;
- (NSString)displayDetail;
- (NSString)displayName;
- (int64_t)visibility;
- (void)setParticipants:(id)a3;
@end

@implementation DSFMSharedResource

- (NSString)displayName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"DS_FIND_MY_NAME" value:&stru_4358 table:0];

  return (NSString *)v3;
}

- (int64_t)visibility
{
  return 1;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DSFMSharedResource *)self displayName];
  v6 = [(DSFMSharedResource *)self participants];
  v7 = +[NSString stringWithFormat:@"%@ <%p>: display-name: %@, participants: %@", v4, self, v5, v6];

  return (NSString *)v7;
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
  objc_storeStrong((id *)&self->displayName, 0);

  objc_storeStrong((id *)&self->displayDetail, 0);
}

@end