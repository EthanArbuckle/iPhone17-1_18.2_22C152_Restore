@interface JavaMethodMetadata
- (BOOL)isConstructor;
- (JavaMethodMetadata)initWithMetadata:(const J2ObjcMethodInfo *)a3;
- (SEL)selector;
- (id)exceptionTypes;
- (id)genericSignature;
- (id)javaName;
- (id)name;
- (id)objcName;
- (id)returnType;
- (int)modifiers;
@end

@implementation JavaMethodMetadata

- (JavaMethodMetadata)initWithMetadata:(const J2ObjcMethodInfo *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JavaMethodMetadata;
  result = [(JavaMethodMetadata *)&v5 init];
  if (result) {
    result->data_ = a3;
  }
  return result;
}

- (SEL)selector
{
  return sel_registerName(self->data_->var0);
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

- (id)javaName
{
  if (self->data_->var1) {
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  }
  else {
    return 0;
  }
}

- (id)objcName
{
  return +[NSString stringWithUTF8String:self->data_->var0];
}

- (int)modifiers
{
  return self->data_->var3;
}

- (id)returnType
{
  return JreTypeForString(self->data_->var2);
}

- (id)exceptionTypes
{
  var4 = self->data_->var4;
  if (!var4) {
    return 0;
  }
  int v4 = 0;
  do
  {
    objc_super v5 = strchr(var4, 59);
    var4 = v5 + 1;
    if (v5) {
      ++v4;
    }
  }
  while (v5 != (char *)-1 && v5 != 0);
  v7 = +[IOSObjectArray arrayWithLength:v4 type:JavaLangReflectType_class_()];
  v8 = self->data_->var4;
  if (v8)
  {
    int v9 = 0;
    do
    {
      v10 = strchr(v8, 59);
      if (!v10) {
        break;
      }
      v11 = v10;
      v12 = strndup(v8, v10 - v8 + 1);
      id v13 = JreTypeForString(v12);
      IOSObjectArray_Set((uint64_t)v7, v9, v13);
      free(v12);
      ++v9;
      v8 = v11 + 1;
    }
    while (v11 != (char *)-1);
  }
  return v7;
}

- (BOOL)isConstructor
{
  data = self->data_;
  var1 = data->var1;
  if (!var1) {
    var1 = data->var0;
  }
  return !strcmp(var1, "init") || strncmp(var1, "initWith", 8uLL) == 0;
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