@interface EKConferenceDeserializationResult
- (EKConferenceDeserializationResult)initWithConference:(id)a3 range:(_NSRange)a4;
- (EKVirtualConference)conference;
- (_NSRange)range;
@end

@implementation EKConferenceDeserializationResult

- (EKConferenceDeserializationResult)initWithConference:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKConferenceDeserializationResult;
  v9 = [(EKConferenceDeserializationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conference, a3);
    v10->_range.NSUInteger location = location;
    v10->_range.NSUInteger length = length;
  }

  return v10;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (EKVirtualConference)conference
{
  return self->_conference;
}

- (void).cxx_destruct
{
}

@end