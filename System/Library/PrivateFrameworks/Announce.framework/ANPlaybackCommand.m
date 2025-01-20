@interface ANPlaybackCommand
+ (ANPlaybackCommand)nextCommand;
+ (ANPlaybackCommand)previousCommand;
+ (ANPlaybackCommand)stopCommand;
+ (BOOL)supportsSecureCoding;
+ (id)playCommandWithOptions:(unint64_t)a3 announcementIdentifiers:(id)a4;
- (ANPlaybackCommand)initWithCoder:(id)a3;
- (ANPlaybackCommand)initWithPlaybackOperation:(unint64_t)a3 options:(unint64_t)a4 announcementIdentifiers:(id)a5;
- (ANPlaybackCommand)initWithPlaybackOperation:(unint64_t)a3 options:(unint64_t)a4 forRecipient:(id)a5;
- (NSArray)announcementIdentifiers;
- (NSString)clientIdentifier;
- (id)description;
- (unint64_t)operation;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setOperation:(unint64_t)a3;
@end

@implementation ANPlaybackCommand

- (ANPlaybackCommand)initWithPlaybackOperation:(unint64_t)a3 options:(unint64_t)a4 announcementIdentifiers:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ANPlaybackCommand;
  v10 = [(ANPlaybackCommand *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_operation = a3;
    v10->_options = a4;
    objc_storeStrong((id *)&v10->_announcementIdentifiers, a5);
  }

  return v11;
}

- (ANPlaybackCommand)initWithPlaybackOperation:(unint64_t)a3 options:(unint64_t)a4 forRecipient:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)ANPlaybackCommand;
  result = [(ANPlaybackCommand *)&v8 init];
  if (result)
  {
    result->_operation = a3;
    result->_options = a4;
  }
  return result;
}

- (id)description
{
  v3 = @"Stop";
  switch([(ANPlaybackCommand *)self operation])
  {
    case 0uLL:
      v4 = NSString;
      unint64_t v5 = [(ANPlaybackCommand *)self options];
      v6 = [(ANPlaybackCommand *)self announcementIdentifiers];
      uint64_t v7 = [v6 count];
      objc_super v8 = [(ANPlaybackCommand *)self announcementIdentifiers];
      [v4 stringWithFormat:@"Play [options = %lu, count = %lu, %@]", v5, v7, v8];
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      break;
    case 2uLL:
      v3 = @"Next";
      break;
    case 3uLL:
      v3 = @"Previous";
      break;
    default:
      v3 = @"Unknown";
      break;
  }

  return v3;
}

+ (id)playCommandWithOptions:(unint64_t)a3 announcementIdentifiers:(id)a4
{
  id v5 = a4;
  v6 = [[ANPlaybackCommand alloc] initWithPlaybackOperation:0 options:a3 announcementIdentifiers:v5];

  return v6;
}

+ (ANPlaybackCommand)stopCommand
{
  v2 = [ANPlaybackCommand alloc];
  v3 = [(ANPlaybackCommand *)v2 initWithPlaybackOperation:1 options:0 announcementIdentifiers:MEMORY[0x263EFFA68]];

  return v3;
}

+ (ANPlaybackCommand)nextCommand
{
  v2 = [ANPlaybackCommand alloc];
  v3 = [(ANPlaybackCommand *)v2 initWithPlaybackOperation:2 options:0 announcementIdentifiers:MEMORY[0x263EFFA68]];

  return v3;
}

+ (ANPlaybackCommand)previousCommand
{
  v2 = [ANPlaybackCommand alloc];
  v3 = [(ANPlaybackCommand *)v2 initWithPlaybackOperation:3 options:0 announcementIdentifiers:MEMORY[0x263EFFA68]];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t operation = self->_operation;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedInteger:operation];
  [v8 encodeObject:v6 forKey:@"Command"];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_options];
  [v8 encodeObject:v7 forKey:@"Options"];

  [v8 encodeObject:self->_announcementIdentifiers forKey:@"AnnouncementIdentifiers"];
}

- (ANPlaybackCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ANPlaybackCommand;
  id v5 = [(ANPlaybackCommand *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Command"];
    v5->_unint64_t operation = [v6 unsignedIntegerValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Options"];
    v5->_options = [v7 unsignedIntegerValue];
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"AnnouncementIdentifiers"];
    announcementIdentifiers = v5->_announcementIdentifiers;
    v5->_announcementIdentifiers = (NSArray *)v11;
  }
  return v5;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)announcementIdentifiers
{
  return self->_announcementIdentifiers;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_unint64_t operation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_announcementIdentifiers, 0);
}

@end