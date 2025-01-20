@interface CalConferenceDeserializationResult
- (BOOL)isEqual:(id)a3;
- (CalConferenceDeserializationResult)initWithConference:(id)a3 range:(_NSRange)a4 blockTitle:(id)a5;
- (CalVirtualConference)conference;
- (NSString)blockTitle;
- (_NSRange)range;
- (id)description;
@end

@implementation CalConferenceDeserializationResult

- (CalConferenceDeserializationResult)initWithConference:(id)a3 range:(_NSRange)a4 blockTitle:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalConferenceDeserializationResult;
  v12 = [(CalConferenceDeserializationResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conference, a3);
    v13->_range.NSUInteger location = location;
    v13->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v13->_blockTitle, a5);
  }

  return v13;
}

- (id)description
{
  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalConferenceDeserializationResult;
  v4 = [(CalConferenceDeserializationResult *)&v9 description];
  v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  [(CalDescriptionBuilder *)v5 setKey:@"conference" withObject:self->_conference];
  v6 = NSStringFromRange(self->_range);
  [(CalDescriptionBuilder *)v5 setKey:@"range" withString:v6];

  [(CalDescriptionBuilder *)v5 setKey:@"blockTitle" withString:self->_blockTitle];
  v7 = [(CalDescriptionBuilder *)v5 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CalConferenceDeserializationResult *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      conference = self->_conference;
      v7 = [(CalConferenceDeserializationResult *)v5 conference];
      if (CalEqualObjects(conference, v7))
      {
        blockTitle = self->_blockTitle;
        objc_super v9 = [(CalConferenceDeserializationResult *)v5 blockTitle];
        if (CalEqualStrings(blockTitle, v9)) {
          BOOL v12 = self->_range.location == [(CalConferenceDeserializationResult *)v5 range]
        }
             && self->_range.length == v10;
        else {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CalVirtualConference)conference
{
  return self->_conference;
}

- (NSString)blockTitle
{
  return self->_blockTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockTitle, 0);

  objc_storeStrong((id *)&self->_conference, 0);
}

@end