@interface MFAssistantEmail
+ (int64_t)MSSendTypeForSAEMailType:(id)a3;
- (unint64_t)statusFlags;
- (void)setStatusFlags:(unint64_t)a3;
@end

@implementation MFAssistantEmail

+ (int64_t)MSSendTypeForSAEMailType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAEmailTypeReplyValue])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:SAEmailTypeForwardValue])
  {
    int64_t v4 = 3;
  }
  else
  {
    [v3 isEqualToString:SAEmailTypeNewValue];
    int64_t v4 = 1;
  }

  return v4;
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unint64_t)a3
{
  self->_statusFlags = a3;
}

@end