@interface CalVirtualConference
- (BOOL)isEqual:(id)a3;
- (BOOL)isWritable;
- (CalVirtualConference)initWithTitle:(id)a3 joinMethods:(id)a4 conferenceDetails:(id)a5 source:(unint64_t)a6 isWritable:(BOOL)a7;
- (NSArray)joinMethods;
- (NSString)conferenceDetails;
- (NSString)title;
- (id)description;
- (unint64_t)source;
@end

@implementation CalVirtualConference

- (CalVirtualConference)initWithTitle:(id)a3 joinMethods:(id)a4 conferenceDetails:(id)a5 source:(unint64_t)a6 isWritable:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CalVirtualConference;
  v16 = [(CalVirtualConference *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v17->_joinMethods, a4);
    objc_storeStrong((id *)&v17->_conferenceDetails, a5);
    v17->_source = a6;
    v17->_isWritable = a7;
  }

  return v17;
}

- (id)description
{
  v3 = [CalDescriptionBuilder alloc];
  v8.receiver = self;
  v8.super_class = (Class)CalVirtualConference;
  v4 = [(CalVirtualConference *)&v8 description];
  v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  [(CalDescriptionBuilder *)v5 setKey:@"title" withString:self->_title];
  [(CalDescriptionBuilder *)v5 setKey:@"joinMethods" withArray:self->_joinMethods];
  [(CalDescriptionBuilder *)v5 setKey:@"conferenceDetails" withString:self->_conferenceDetails];
  -[CalDescriptionBuilder setKey:withEnumNumericalValue:andStringValue:](v5, "setKey:withEnumNumericalValue:andStringValue:", @"source");
  [(CalDescriptionBuilder *)v5 setKey:@"isWritable" withBoolean:self->_isWritable];
  v6 = [(CalDescriptionBuilder *)v5 build];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CalVirtualConference *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      title = self->_title;
      v7 = [(CalVirtualConference *)v5 title];
      if (CalEqualStrings(title, v7))
      {
        joinMethods = self->_joinMethods;
        v9 = [(CalVirtualConference *)v5 joinMethods];
        if (CalEqualObjects(joinMethods, v9))
        {
          conferenceDetails = self->_conferenceDetails;
          v11 = [(CalVirtualConference *)v5 conferenceDetails];
          if (CalEqualStrings(conferenceDetails, v11)
            && (unint64_t source = self->_source, source == [(CalVirtualConference *)v5 source]))
          {
            BOOL isWritable = self->_isWritable;
            BOOL v14 = isWritable == [(CalVirtualConference *)v5 isWritable];
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)source
{
  return self->_source;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (NSArray)joinMethods
{
  return self->_joinMethods;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)conferenceDetails
{
  return self->_conferenceDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_joinMethods, 0);
}

@end