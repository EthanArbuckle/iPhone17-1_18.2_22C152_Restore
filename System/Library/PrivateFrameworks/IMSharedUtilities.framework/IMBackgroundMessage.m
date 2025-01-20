@interface IMBackgroundMessage
+ (BOOL)supportsSecureCoding;
- (IMBackgroundMessage)initWithCoder:(id)a3;
- (NSString)messageText;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageText:(id)a3;
@end

@implementation IMBackgroundMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IMBackgroundMessage *)self messageText];
  [v4 encodeObject:v5 forKey:@"kIMBackgroundMessageMessageText"];
}

- (IMBackgroundMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMBackgroundMessage;
  id v5 = [(IMBackgroundMessage *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIMBackgroundMessageMessageText"];
    [(IMBackgroundMessage *)v5 setMessageText:v6];
  }
  return v5;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end