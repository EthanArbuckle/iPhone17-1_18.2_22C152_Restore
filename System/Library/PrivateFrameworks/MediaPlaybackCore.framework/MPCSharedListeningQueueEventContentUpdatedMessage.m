@interface MPCSharedListeningQueueEventContentUpdatedMessage
- (MPCSharedListeningQueueEventContentUpdatedMessage)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (id)description;
@end

@implementation MPCSharedListeningQueueEventContentUpdatedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningQueueEventContentUpdatedMessage: %p localizedTitle=\"%@\" localizedMessage=\"%@\">", self, self->_localizedTitle, self->_localizedMessage];
}

- (MPCSharedListeningQueueEventContentUpdatedMessage)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCSharedListeningQueueEventContentUpdatedMessage;
  v9 = [(MPCSharedListeningQueueEventContentUpdatedMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_localizedMessage, a4);
  }

  return v10;
}

@end