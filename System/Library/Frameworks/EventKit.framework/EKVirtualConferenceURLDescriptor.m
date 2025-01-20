@interface EKVirtualConferenceURLDescriptor
- (EKVirtualConferenceURLDescriptor)initWithTitle:(NSString *)title URL:(NSURL *)URL;
- (NSString)title;
- (NSURL)URL;
@end

@implementation EKVirtualConferenceURLDescriptor

- (EKVirtualConferenceURLDescriptor)initWithTitle:(NSString *)title URL:(NSURL *)URL
{
  v7 = title;
  v8 = URL;
  v13.receiver = self;
  v13.super_class = (Class)EKVirtualConferenceURLDescriptor;
  v9 = [(EKVirtualConferenceURLDescriptor *)&v13 init];
  if (v9)
  {
    v10 = [(NSURL *)v8 absoluteString];
    uint64_t v11 = [v10 length];

    if (!v11) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"url is empty"];
    }
    objc_storeStrong((id *)&v9->_title, title);
    objc_storeStrong((id *)&v9->_URL, URL);
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end