@interface FigCaptureSinkConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)stringForSinkType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (FigCaptureSinkConfiguration)initWithCoder:(id)a3;
- (FigCaptureSinkConfiguration)initWithXPCEncoding:(id)a3;
- (NSString)description;
- (NSString)sinkID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int)sinkType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSinkID:(id)a3;
@end

@implementation FigCaptureSinkConfiguration

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(FigCaptureSinkConfiguration *)self sinkID];
  FigXPCMessageSetCFString();
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  xpc_dictionary_set_string(v3, "class", Name);
  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"SINK %p:%@", self, +[FigCaptureSinkConfiguration stringForSinkType:](FigCaptureSinkConfiguration, "stringForSinkType:", -[FigCaptureSinkConfiguration sinkType](self, "sinkType"))];
}

+ (id)stringForSinkType:(int)a3
{
  return (id)FigCaptureSinkTypeNameMap[a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSinkID:", -[FigCaptureSinkConfiguration sinkID](self, "sinkID"));
  return v4;
}

- (void)setSinkID:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v5 = [(FigCaptureSinkConfiguration *)self sinkType],
          v5 == [a3 sinkType]))
    {
      v6 = [(FigCaptureSinkConfiguration *)self sinkID];
      if (v6 == (NSString *)[a3 sinkID]
        || (int v7 = -[NSString isEqual:](-[FigCaptureSinkConfiguration sinkID](self, "sinkID"), "isEqual:", [a3 sinkID])) != 0)
      {
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (NSString)sinkID
{
  return self->_sinkID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSinkConfiguration;
  [(FigCaptureSinkConfiguration *)&v3 dealloc];
}

- (FigCaptureSinkConfiguration)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)FigCaptureSinkConfiguration;
    objc_super v3 = [(FigCaptureSinkConfiguration *)&v5 init];
    if (v3) {
      FigXPCMessageCopyCFString();
    }
  }
  else
  {

    return 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureSinkConfiguration)initWithCoder:(id)a3
{
  v4 = [(FigCaptureSinkConfiguration *)self init];
  if (v4) {
    v4->_sinkID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(NSString, "stringWithUTF8String:", "sinkID"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  sinkID = self->_sinkID;
  uint64_t v5 = [NSString stringWithUTF8String:"sinkID"];
  [a3 encodeObject:sinkID forKey:v5];
}

- (int)sinkType
{
  return 0;
}

- (unint64_t)hash
{
  return [(NSString *)self->_sinkID hash];
}

@end