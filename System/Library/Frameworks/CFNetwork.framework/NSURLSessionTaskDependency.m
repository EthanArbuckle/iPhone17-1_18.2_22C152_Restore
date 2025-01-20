@interface NSURLSessionTaskDependency
+ (NSURLSessionTaskDependency)taskDependencyWithMainDocumentTask:(id)a3;
+ (NSURLSessionTaskDependency)taskDependencyWithMainDocumentTask:(id)a3 taskDependencyDescription:(id)a4;
+ (NSURLSessionTaskDependency)taskDependencyWithParentTask:(id)a3 priority:(float)a4 exclusive:(BOOL)a5;
- (NSURLSessionTask)mainDocumentTask;
- (NSURLSessionTask)parentTask;
- (NSURLSessionTaskDependency)init;
- (NSURLSessionTaskDependencyDescription)taskDependencyDescription;
- (void)dealloc;
- (void)setTaskDependencyDescription:(id)a3;
@end

@implementation NSURLSessionTaskDependency

- (NSURLSessionTask)mainDocumentTask
{
  return self->_mainDocumentTask;
}

- (NSURLSessionTask)parentTask
{
  return self->_parentTask;
}

- (void)setTaskDependencyDescription:(id)a3
{
}

- (NSURLSessionTaskDependencyDescription)taskDependencyDescription
{
  return self->_taskDependencyDescription;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskDependency;
  [(NSURLSessionTaskDependency *)&v3 dealloc];
}

- (NSURLSessionTaskDependency)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskDependency;
  return [(NSURLSessionTaskDependency *)&v3 init];
}

+ (NSURLSessionTaskDependency)taskDependencyWithMainDocumentTask:(id)a3 taskDependencyDescription:(id)a4
{
  v6 = objc_alloc_init(NSURLSessionTaskDependency);
  v6->_mainDocumentTask = (NSURLSessionTask *)a3;
  v6->_taskDependencyDescription = (NSURLSessionTaskDependencyDescription *)a4;
  return v6;
}

+ (NSURLSessionTaskDependency)taskDependencyWithMainDocumentTask:(id)a3
{
  v4 = objc_alloc_init(NSURLSessionTaskDependency);
  v4->_mainDocumentTask = (NSURLSessionTask *)a3;
  return v4;
}

+ (NSURLSessionTaskDependency)taskDependencyWithParentTask:(id)a3 priority:(float)a4 exclusive:(BOOL)a5
{
  v8 = objc_alloc_init(NSURLSessionTaskDependency);
  v8->_parentTask = (NSURLSessionTask *)a3;
  v9 = [NSURLSessionTaskDependencyDescription alloc];
  if (v9)
  {
    v11.receiver = v9;
    v11.super_class = (Class)NSURLSessionTaskDependencyDescription;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    if (v9)
    {
      v9->_priority = a4;
      v9->_exclusive = a5;
    }
  }
  v8->_taskDependencyDescription = v9;
  return v8;
}

id ____NSURLSessionTaskDependency_FindParentStreamID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end