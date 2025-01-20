@interface AAInviteCompletionInfo
- (NSArray)recipients;
- (unint64_t)status;
- (unint64_t)transportType;
- (void)setRecipients:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTransportType:(unint64_t)a3;
@end

@implementation AAInviteCompletionInfo

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end