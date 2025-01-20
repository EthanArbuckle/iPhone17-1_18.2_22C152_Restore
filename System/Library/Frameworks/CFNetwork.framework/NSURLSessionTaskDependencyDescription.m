@interface NSURLSessionTaskDependencyDescription
+ (id)taskDependencyDescriptionWithMimeType:(id)a3 parentMimeType:(id)a4;
+ (id)taskDependencyDescriptionWithMimeType:(id)a3 parentURLPath:(id)a4;
+ (id)taskDependencyDescriptionWithParentMimeType:(id)a3;
+ (id)taskDependencyDescriptionWithParentURLPath:(id)a3;
+ (id)taskDependencyDescriptionWithURLPath:(id)a3 parentMimeType:(id)a4;
+ (id)taskDependencyDescriptionWithURLPath:(id)a3 parentURLPath:(id)a4;
- (BOOL)exclusive;
- (NSString)dependentMimeType;
- (NSString)dependentURLPath;
- (NSString)parentMimeType;
- (NSString)parentURLPath;
- (float)priority;
- (id)description;
- (id)initWithURLPath:(void *)a3 mimeType:(void *)a4 parentURLPath:(void *)a5 parentMimeType:priority:exclusive:;
- (void)dealloc;
- (void)setExclusive:(BOOL)a3;
- (void)setPriority:(float)a3;
@end

@implementation NSURLSessionTaskDependencyDescription

- (NSString)parentMimeType
{
  return self->_parentMimeType;
}

- (NSString)parentURLPath
{
  return self->_parentURLPath;
}

- (NSString)dependentMimeType
{
  return self->_dependentMimeType;
}

- (NSString)dependentURLPath
{
  return self->_dependentURLPath;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (float)priority
{
  return self->_priority;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Dependent: %@, Parent: %@, priority: %f, exclusive: %hhd", self->_dependent, self->_parent, self->_priority, self->_exclusive];
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 16);
    objc_setProperty_nonatomic(self, v3, 0, 24);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLSessionTaskDependencyDescription;
  [(NSURLSessionTaskDependencyDescription *)&v4 dealloc];
}

+ (id)taskDependencyDescriptionWithParentMimeType:(id)a3
{
  id v3 = -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, 0, 0, a3);

  return v3;
}

- (id)initWithURLPath:(void *)a3 mimeType:(void *)a4 parentURLPath:(void *)a5 parentMimeType:priority:exclusive:
{
  if (!a1) {
    return 0;
  }
  v15.receiver = a1;
  v15.super_class = (Class)NSURLSessionTaskDependencyDescription;
  id v9 = objc_msgSendSuper2(&v15, sel_init);
  if (v9)
  {
    id v10 = -[__NSURLSessionTaskDependencyResourceIdentifier initWitURLPath:mimeType:]([__NSURLSessionTaskDependencyResourceIdentifier alloc], a2, a3);
    objc_setProperty_nonatomic(v9, v11, v10, 16);
    id v12 = -[__NSURLSessionTaskDependencyResourceIdentifier initWitURLPath:mimeType:]([__NSURLSessionTaskDependencyResourceIdentifier alloc], a4, a5);
    objc_setProperty_nonatomic(v9, v13, v12, 24);
    *((_DWORD *)v9 + 3) = 1056964608;
    *((unsigned char *)v9 + 8) = 0;
  }
  return v9;
}

+ (id)taskDependencyDescriptionWithParentURLPath:(id)a3
{
  id v3 = -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, 0, a3, 0);

  return v3;
}

+ (id)taskDependencyDescriptionWithMimeType:(id)a3 parentMimeType:(id)a4
{
  id v4 = -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, a3, 0, a4);

  return v4;
}

+ (id)taskDependencyDescriptionWithMimeType:(id)a3 parentURLPath:(id)a4
{
  id v4 = -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], 0, a3, a4, 0);

  return v4;
}

+ (id)taskDependencyDescriptionWithURLPath:(id)a3 parentMimeType:(id)a4
{
  id v4 = -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], a3, 0, 0, a4);

  return v4;
}

+ (id)taskDependencyDescriptionWithURLPath:(id)a3 parentURLPath:(id)a4
{
  id v4 = -[NSURLSessionTaskDependencyDescription initWithURLPath:mimeType:parentURLPath:parentMimeType:priority:exclusive:]([NSURLSessionTaskDependencyDescription alloc], a3, 0, a4, 0);

  return v4;
}

@end