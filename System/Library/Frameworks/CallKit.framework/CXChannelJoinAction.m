@interface CXChannelJoinAction
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (CXChannelJoinAction)initWithChannelUUID:(id)a3 name:(id)a4;
- (CXChannelJoinAction)initWithCoder:(id)a3;
- (CXChannelUpdate)channelUpdate;
- (NSString)name;
- (NSURL)imageURL;
- (id)archivedDataWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXChannelJoinAction

- (CXChannelJoinAction)initWithChannelUUID:(id)a3 name:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelJoinAction;
  v7 = [(CXChannelAction *)&v11 initWithChannelUUID:a3];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannelJoinAction initWithChannelUUID:name:]", @"name" format];
    }
    v8 = objc_alloc_init(CXChannelUpdate);
    channelUpdate = v7->_channelUpdate;
    v7->_channelUpdate = v8;

    [(CXChannelUpdate *)v7->_channelUpdate setName:v6];
  }

  return v7;
}

- (NSURL)imageURL
{
  v2 = [(CXChannelJoinAction *)self channelUpdate];
  v3 = [v2 imageURL];

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CXChannelJoinAction *)self channelUpdate];
  [v5 setImageURL:v4];
}

- (NSString)name
{
  v2 = [(CXChannelJoinAction *)self channelUpdate];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelJoinAction;
  id v6 = (id *)a3;
  [(CXChannelAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_storeStrong(v6 + 8, self->_channelUpdate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelJoinAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXChannelJoinAction;
  id v5 = [(CXChannelAction *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_channelUpdate);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    channelUpdate = v5->_channelUpdate;
    v5->_channelUpdate = (CXChannelUpdate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelJoinAction;
  id v4 = a3;
  [(CXChannelAction *)&v7 encodeWithCoder:v4];
  id v5 = [(CXChannelJoinAction *)self channelUpdate];
  uint64_t v6 = NSStringFromSelector(sel_channelUpdate);
  [v4 encodeObject:v5 forKey:v6];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (CXChannelUpdate)channelUpdate
{
  return self->_channelUpdate;
}

- (void).cxx_destruct
{
}

@end