@interface IDSVMRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidVMRequestPurpose:(unint64_t)a3;
- (IDSVMRequest)initWithCoder:(id)a3;
- (IDSVMRequest)initWithDataRepresentation:(id)a3;
- (IDSVMRequest)initWithPurpose:(unint64_t)a3;
- (IDSVMRequest)initWithPurpose:(unint64_t)a3 version:(unint64_t)a4;
- (NSData)dataRepresentation;
- (unint64_t)purpose;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSVMRequest

- (IDSVMRequest)initWithPurpose:(unint64_t)a3
{
  return [(IDSVMRequest *)self initWithPurpose:a3 version:1];
}

- (IDSVMRequest)initWithPurpose:(unint64_t)a3 version:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IDSVMRequest;
  result = [(IDSVMRequest *)&v7 init];
  if (result)
  {
    result->_version = a4;
    result->_purpose = a3;
  }
  return result;
}

- (IDSVMRequest)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    objc_super v7 = +[IMRGLog vm];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100715F40((uint64_t)v4, (uint64_t)v6, v7);
    }
  }
  return v5;
}

- (NSData)dataRepresentation
{
  id v6 = 0;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (!v2)
  {
    id v4 = +[IMRGLog vm];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100710CB4((uint64_t)v3, v4);
    }
  }

  return (NSData *)v2;
}

- (BOOL)isValidVMRequestPurpose:(unint64_t)a3
{
  return a3 == 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSVMRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"version"];
  id v6 = [v4 decodeIntegerForKey:@"purpose"];

  if ([(IDSVMRequest *)self isValidVMRequestPurpose:v6])
  {
    self = [(IDSVMRequest *)self initWithPurpose:v6 version:v5];
    objc_super v7 = self;
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeInteger:self->_purpose forKey:@"purpose"];
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

@end