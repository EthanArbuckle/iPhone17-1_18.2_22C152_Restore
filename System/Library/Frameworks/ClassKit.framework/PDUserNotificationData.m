@interface PDUserNotificationData
- (id)description;
@end

@implementation PDUserNotificationData

- (id)description
{
  v3 = +[NSNumber numberWithInteger:self->_type];
  v4 = +[NSString stringWithFormat:@"Type: %@ Title: %@ Message %@ HandoutID: %@ ClassID: %@", v3, self->_title, self->_message, self->_handoutID, self->_classID];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end