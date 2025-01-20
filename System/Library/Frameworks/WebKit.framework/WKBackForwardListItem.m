@interface WKBackForwardListItem
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)_wasCreatedByJSWithoutUserInteraction;
- (CGImage)_copySnapshotForTesting;
- (CGPoint)_scrollPosition;
- (NSString)title;
- (NSURL)URL;
- (NSURL)initialURL;
- (Object)_apiObject;
- (void)_item;
- (void)dealloc;
@end

@implementation WKBackForwardListItem

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKBackForwardListItem accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKBackForwardListItem accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_item.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKBackForwardListItem;
    [(WKBackForwardListItem *)&v4 dealloc];
  }
}

- (NSURL)URL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", &self[1]._item);
}

- (NSString)title
{
  result = (NSString *)self[1].super.isa;
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (NSURL)initialURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", &self[1]._item.data.__lx[8]);
}

- (void)_item
{
  return &self->_item;
}

- (CGImage)_copySnapshotForTesting
{
  result = *(CGImage **)self[6]._item.data.__lx;
  if (result)
  {
    WebKit::ViewSnapshot::asImageForTesting(result, &v3);
    return v3;
  }
  return result;
}

- (CGPoint)_scrollPosition
{
  double v2 = (double)*(int *)&self[2]._item.data.__lx[40];
  double v3 = (double)*(int *)&self[2]._item.data.__lx[44];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_wasCreatedByJSWithoutUserInteraction
{
  return self[5]._item.data.__lx[40];
}

- (Object)_apiObject
{
  return (Object *)&self->_item;
}

@end