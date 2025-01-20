@interface JavaFieldMetadata
- (JavaFieldMetadata)initWithMetadata:(const J2ObjcFieldInfo *)a3;
- (const)getConstantValue;
- (const)staticRef;
- (id)genericSignature;
- (id)iosName;
- (id)javaName;
- (id)name;
- (id)type;
- (int)modifiers;
@end

@implementation JavaFieldMetadata

- (JavaFieldMetadata)initWithMetadata:(const J2ObjcFieldInfo *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JavaFieldMetadata;
  result = [(JavaFieldMetadata *)&v5 init];
  if (result) {
    result->data_ = a3;
  }
  return result;
}

- (id)name
{
  data = self->data_;
  var1 = data->var1;
  if (!var1) {
    var1 = data->var0;
  }
  return +[NSString stringWithUTF8String:var1];
}

- (id)iosName
{
  return +[NSString stringWithUTF8String:self->data_->var0];
}

- (id)javaName
{
  if (self->data_->var1) {
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  }
  else {
    return 0;
  }
}

- (int)modifiers
{
  return self->data_->var2;
}

- (id)type
{
  return JreTypeForString(self->data_->var3);
}

- (const)staticRef
{
  return self->data_->var4;
}

- (const)getConstantValue
{
  return &self->data_->var6;
}

- (id)genericSignature
{
  if (self->data_->var5) {
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  }
  else {
    return 0;
  }
}

@end