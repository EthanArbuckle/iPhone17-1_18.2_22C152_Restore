@interface ILCommunication
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommunication:(ILCommunication *)communication;
- (ILCommunication)init;
- (ILCommunication)initWithCoder:(id)a3;
- (ILCommunication)initWithSender:(id)a3 dateReceived:(id)a4;
- (NSDate)dateReceived;
- (NSString)sender;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ILCommunication

- (ILCommunication)initWithSender:(id)a3 dateReceived:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ILCommunication;
  v9 = [(ILCommunication *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sender, a3);
    objc_storeStrong((id *)&v10->_dateReceived, a4);
  }

  return v10;
}

- (ILCommunication)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ILCommunication *)self sender];
  v6 = [(ILCommunication *)self dateReceived];
  id v7 = [v3 stringWithFormat:@"<%@ %p sender=%@ dateReceived=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILCommunication *)self isEqualToCommunication:v4];

  return v5;
}

- (BOOL)isEqualToCommunication:(ILCommunication *)communication
{
  id v4 = communication;
  BOOL v5 = [(ILCommunication *)self dateReceived];
  v6 = [(ILCommunication *)v4 dateReceived];
  if ([v5 isEqualToDate:v6])
  {
    uint64_t v7 = [(ILCommunication *)self sender];
    uint64_t v8 = [(ILCommunication *)v4 sender];
    char v9 = (v7 | v8) == 0;
    if (v8) {
      char v9 = [(id)v7 isEqualToString:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(ILCommunication *)self dateReceived];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(ILCommunication *)self sender];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILCommunication)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ILCommunication;
  BOOL v5 = [(ILCommunication *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_sender);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_dateReceived);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ILCommunication *)self sender];
  uint64_t v6 = NSStringFromSelector(sel_sender);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(ILCommunication *)self dateReceived];
  uint64_t v7 = NSStringFromSelector(sel_dateReceived);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSString)sender
{
  return self->_sender;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateReceived, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end