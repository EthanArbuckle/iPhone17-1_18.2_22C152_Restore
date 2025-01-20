@interface NSUndoManager(ITK)
- (uint64_t)itk_isUndoingOrRedoing;
- (uint64_t)itk_performUndoGroup:()ITK;
- (void)itk_performUndoGroupWithActionName:()ITK undoGroup:;
@end

@implementation NSUndoManager(ITK)

- (uint64_t)itk_isUndoingOrRedoing
{
  if ([a1 isUndoing]) {
    return 1;
  }

  return [a1 isRedoing];
}

- (uint64_t)itk_performUndoGroup:()ITK
{
  return objc_msgSend(a1, "itk_performUndoGroupWithActionName:undoGroup:", 0, a3);
}

- (void)itk_performUndoGroupWithActionName:()ITK undoGroup:
{
  id v6 = a3;
  v7 = a4;
  uint64_t v8 = [a1 groupsByEvent];
  [a1 setGroupsByEvent:0];
  [a1 beginUndoGrouping];
  v7[2](v7);

  if ([v6 length]) {
    [a1 setActionName:v6];
  }
  if ([a1 groupingLevel])
  {
    [a1 endUndoGrouping];
  }
  else
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSUndoManager(ITK) itk_performUndoGroupWithActionName:undoGroup:](v9);
    }
  }
  [a1 setGroupsByEvent:v8];
}

- (void)itk_performUndoGroupWithActionName:()ITK undoGroup:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_252A65000, log, OS_LOG_TYPE_ERROR, "Attempted to endUndoGrouping for a non-0 groupingLevel undoManager", v1, 2u);
}

@end