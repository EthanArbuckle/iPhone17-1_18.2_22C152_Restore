@interface JavaClassMetadata
- (JavaClassMetadata)initWithMetadata:(J2ObjcClassInfo *)a3;
- (NSString)enclosingName;
- (NSString)packageName;
- (NSString)typeName;
- (const)findFieldInfo:(const char *)a3;
- (const)findMethodInfo:(id)a3;
- (id)allFields;
- (id)allMethods;
- (id)description;
- (id)findFieldMetadata:(const char *)a3;
- (id)findMethodMetadata:(id)a3;
- (id)findMethodMetadataWithJavaName:(id)a3 argCount:(int)a4;
- (id)genericSignature;
- (id)getEnclosingMethod;
- (id)getInnerClasses;
- (id)getSuperclassTypeArguments;
- (id)qualifiedName;
- (unsigned)fieldCount;
- (unsigned)methodCount;
- (unsigned)modifiers;
- (unsigned)version;
- (void)dealloc;
@end

@implementation JavaClassMetadata

- (JavaClassMetadata)initWithMetadata:(J2ObjcClassInfo *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)JavaClassMetadata;
  v4 = [(JavaClassMetadata *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->data_ = a3;
    v4->version = a3->var0;
    NSStringEncoding v6 = +[NSString defaultCStringEncoding];
    v5->typeName = (NSString *)[objc_alloc((Class)NSString) initWithCString:a3->var1 encoding:v6];
    if (a3->var2) {
      v5->packageName = (NSString *)[objc_alloc((Class)NSString) initWithCString:a3->var2 encoding:v6];
    }
    if (a3->var3) {
      v5->enclosingName = (NSString *)[objc_alloc((Class)NSString) initWithCString:a3->var3 encoding:v6];
    }
    v5->fieldCount = a3->var7;
    v5->methodCount = a3->var5;
    v5->modifiers = a3->var4;
  }
  return v5;
}

- (id)qualifiedName
{
  id v3 = +[NSMutableString string];
  if ([(NSString *)self->packageName length])
  {
    [v3 appendString:self->packageName];
    [v3 appendString:@"."];
  }
  if (self->enclosingName)
  {
    objc_msgSend(v3, "appendString:");
    [v3 appendString:@"$"];
  }
  [v3 appendString:self->typeName];
  return v3;
}

- (const)findMethodInfo:(id)a3
{
  v4 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"));
  data = self->data_;
  uint64_t var5 = data->var5;
  if (!data->var5) {
    return 0;
  }
  v7 = v4;
  for (i = data->var6; strcmp(v7, i->var0); ++i)
  {
    if (!--var5) {
      return 0;
    }
  }
  return i;
}

- (id)findMethodMetadata:(id)a3
{
  id result = [(JavaClassMetadata *)self findMethodInfo:a3];
  if (result)
  {
    v4 = [[JavaMethodMetadata alloc] initWithMetadata:result];
    return v4;
  }
  return result;
}

- (id)findMethodMetadataWithJavaName:(id)a3 argCount:(int)a4
{
  NSStringEncoding v6 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"));
  data = self->data_;
  if (!data->var5) {
    return 0;
  }
  objc_super v8 = v6;
  uint64_t v9 = 0;
  while (1)
  {
    v10 = &data->var6[v9];
    if (v10->var1 && !strcmp(v8, v10->var1))
    {
      int v11 = *(unsigned __int8 *)v10->var0;
      if (*v10->var0)
      {
        int v12 = 0;
        v13 = (unsigned __int8 *)(v10->var0 + 1);
        do
        {
          if (v11 == 58) {
            ++v12;
          }
          int v14 = *v13++;
          int v11 = v14;
        }
        while (v14);
      }
      else
      {
        int v12 = 0;
      }
      if (v12 == a4)
      {
        __strcpy_chk();
        __strcat_chk();
        data = self->data_;
        size_t v15 = strlen(__s);
        if (strncmp(__s, data->var6[v9].var0, v15)) {
          break;
        }
      }
    }
    if (++v9 >= (unint64_t)data->var5) {
      return 0;
    }
  }
  return [[JavaMethodMetadata alloc] initWithMetadata:&self->data_->var6[v9]];
}

- (const)findFieldInfo:(const char *)a3
{
  data = self->data_;
  uint64_t var7 = data->var7;
  if (!data->var7) {
    return 0;
  }
  uint64_t v6 = 0;
  var8 = data->var8;
  for (i = var8; ; ++i)
  {
    var1 = i->var1;
    if (var1)
    {
      if (!strcmp(a3, var1)) {
        break;
      }
    }
    v10 = &var8[v6];
    var0 = i->var0;
    if (!strcmp(a3, i->var0)) {
      return v10;
    }
    size_t v12 = strlen(var0) - 1;
    if (var0[v12] == 95 && strlen(a3) == v12 && !strncmp(a3, var0, v12)) {
      return v10;
    }
    ++v6;
    if (!--var7) {
      return 0;
    }
  }
  return i;
}

- (id)findFieldMetadata:(const char *)a3
{
  id result = [(JavaClassMetadata *)self findFieldInfo:a3];
  if (result)
  {
    v4 = [[JavaFieldMetadata alloc] initWithMetadata:result];
    return v4;
  }
  return result;
}

- (id)getSuperclassTypeArguments
{
  data = self->data_;
  uint64_t var9 = data->var9;
  if (!data->var9) {
    return 0;
  }
  v5 = +[IOSObjectArray arrayWithLength:var9 type:JavaLangReflectType_class_()];
  uint64_t v6 = 0;
  do
  {
    id v7 = JreTypeForString(self->data_->var10[v6]);
    IOSObjectArray_Set((uint64_t)v5, v6++, v7);
  }
  while (var9 != v6);
  return v5;
}

- (id)allFields
{
  id v3 = +[IOSObjectArray arrayWithLength:self->data_->var7 type:NSObject_class_()];
  data = self->data_;
  if (data->var7)
  {
    unint64_t v5 = 0;
    var8 = data->var8;
    do
      [(IOSObjectArray *)v3 replaceObjectAtIndex:v5++ withObject:[[JavaFieldMetadata alloc] initWithMetadata:var8++]];
    while (v5 < self->data_->var7);
  }
  return v3;
}

- (id)allMethods
{
  id v3 = +[IOSObjectArray arrayWithLength:self->data_->var5 type:NSObject_class_()];
  data = self->data_;
  if (data->var5)
  {
    unint64_t v5 = 0;
    var6 = data->var6;
    do
      [(IOSObjectArray *)v3 replaceObjectAtIndex:v5++ withObject:[[JavaMethodMetadata alloc] initWithMetadata:var6++]];
    while (v5 < self->data_->var5);
  }
  return v3;
}

- (id)getInnerClasses
{
  data = self->data_;
  uint64_t var11 = data->var11;
  if (!data->var11) {
    return 0;
  }
  unint64_t v5 = +[IOSObjectArray arrayWithLength:var11 type:JavaLangReflectType_class_()];
  uint64_t v6 = 0;
  do
  {
    id v7 = JreTypeForString(self->data_->var12[v6]);
    IOSObjectArray_Set((uint64_t)v5, v6++, v7);
  }
  while (var11 != v6);
  return v5;
}

- (id)getEnclosingMethod
{
  if (!self->data_->var13) {
    return 0;
  }
  v2 = [[JavaEnclosingMethodMetadata alloc] initWithMetadata:self->data_->var13];
  return v2;
}

- (id)genericSignature
{
  if (self->data_->var14) {
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  }
  else {
    return 0;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"{ typeName=%@ packageName=%@ modifiers=0x%x }", self->typeName, self->packageName, self->modifiers];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaClassMetadata;
  [(JavaClassMetadata *)&v3 dealloc];
}

- (unsigned)version
{
  return self->version;
}

- (NSString)typeName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)packageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)enclosingName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)fieldCount
{
  return self->fieldCount;
}

- (unsigned)methodCount
{
  return self->methodCount;
}

- (unsigned)modifiers
{
  return self->modifiers;
}

@end