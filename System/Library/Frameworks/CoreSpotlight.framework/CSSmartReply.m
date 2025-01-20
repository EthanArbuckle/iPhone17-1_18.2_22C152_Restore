@interface CSSmartReply
+ (BOOL)supportsSecureCoding;
- (BOOL)isRichSmartReply;
- (CSSmartReply)initWithCoder:(id)a3;
- (CSSmartReply)initWithResponseText:(id)a3 isRichSmartReply:(BOOL)a4;
- (NSAttributedString)responseText;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRichSmartReply:(BOOL)a3;
- (void)setResponseText:(id)a3;
@end

@implementation CSSmartReply

- (CSSmartReply)initWithResponseText:(id)a3 isRichSmartReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSSmartReply;
  v7 = [(CSSmartReply *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CSSmartReply *)v7 setResponseText:v6];
    [(CSSmartReply *)v8 setIsRichSmartReply:v4];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(CSSmartReply *)self responseText];
  [v5 encodeObject:v4 forKey:@"responseText"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CSSmartReply isRichSmartReply](self, "isRichSmartReply"), @"isRichSmartReply");
}

- (CSSmartReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSSmartReply;
  id v5 = [(CSSmartReply *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseText"];
    [(CSSmartReply *)v5 setResponseText:v6];

    -[CSSmartReply setIsRichSmartReply:](v5, "setIsRichSmartReply:", [v4 decodeBoolForKey:@"isRichSmartReply"]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSSmartReply alloc];
  id v5 = [(CSSmartReply *)self responseText];
  id v6 = [(CSSmartReply *)v4 initWithResponseText:v5 isRichSmartReply:[(CSSmartReply *)self isRichSmartReply]];

  return v6;
}

- (NSAttributedString)responseText
{
  return self->_responseText;
}

- (void)setResponseText:(id)a3
{
}

- (BOOL)isRichSmartReply
{
  return self->_isRichSmartReply;
}

- (void)setIsRichSmartReply:(BOOL)a3
{
  self->_isRichSmartReply = a3;
}

- (void).cxx_destruct
{
}

@end