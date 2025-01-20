@interface ANAnnouncementRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithContent:(id)a3 destination:(id)a4;
- (ANAnnouncementContent)content;
- (ANAnnouncementDestination)destination;
- (ANAnnouncementRequest)initWithCoder:(id)a3;
- (ANAnnouncementRequest)initWithContent:(id)a3 destination:(id)a4;
- (NSString)clientID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClientID:(id)a3;
@end

@implementation ANAnnouncementRequest

- (ANAnnouncementRequest)initWithContent:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ANAnnouncementRequest;
  v9 = [(ANAnnouncementRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

+ (id)requestWithContent:(id)a3 destination:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ANAnnouncementRequest alloc] initWithContent:v6 destination:v5];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ANAnnouncementRequest *)self content];
  id v5 = [(ANAnnouncementRequest *)self destination];
  id v6 = [v3 stringWithFormat:@"Content = %@, Destination = %@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  content = self->_content;
  id v5 = a3;
  [v5 encodeObject:content forKey:@"Content"];
  [v5 encodeObject:self->_destination forKey:@"Destination"];
}

- (ANAnnouncementRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANAnnouncementRequest;
  id v5 = [(ANAnnouncementRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Content"];
    content = v5->_content;
    v5->_content = (ANAnnouncementContent *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Destination"];
    destination = v5->_destination;
    v5->_destination = (ANAnnouncementDestination *)v8;
  }
  return v5;
}

- (ANAnnouncementContent)content
{
  return self->_content;
}

- (ANAnnouncementDestination)destination
{
  return self->_destination;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end