@interface EKVirtualConferenceDescriptor
- (EKVirtualConferenceDescriptor)initWithTitle:(NSString *)title URLDescriptors:(NSArray *)URLDescriptors conferenceDetails:(NSString *)conferenceDetails;
- (NSArray)URLDescriptors;
- (NSString)conferenceDetails;
- (NSString)title;
@end

@implementation EKVirtualConferenceDescriptor

- (EKVirtualConferenceDescriptor)initWithTitle:(NSString *)title URLDescriptors:(NSArray *)URLDescriptors conferenceDetails:(NSString *)conferenceDetails
{
  v9 = title;
  v10 = URLDescriptors;
  v11 = conferenceDetails;
  v14.receiver = self;
  v14.super_class = (Class)EKVirtualConferenceDescriptor;
  v12 = [(EKVirtualConferenceDescriptor *)&v14 init];
  if (v12)
  {
    if (![(NSArray *)v10 count]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"No URLs provided"];
    }
    objc_storeStrong((id *)&v12->_title, title);
    objc_storeStrong((id *)&v12->_URLDescriptors, URLDescriptors);
    objc_storeStrong((id *)&v12->_conferenceDetails, conferenceDetails);
  }

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)URLDescriptors
{
  return self->_URLDescriptors;
}

- (NSString)conferenceDetails
{
  return self->_conferenceDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_URLDescriptors, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end