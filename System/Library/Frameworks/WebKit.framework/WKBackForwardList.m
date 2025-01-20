@interface WKBackForwardList
+ (BOOL)accessInstanceVariablesDirectly;
- (NSArray)backList;
- (NSArray)forwardList;
- (Object)_apiObject;
- (WKBackForwardListItem)backItem;
- (WKBackForwardListItem)currentItem;
- (WKBackForwardListItem)forwardItem;
- (WKBackForwardListItem)itemAtIndex:(NSInteger)index;
- (void)_clear;
- (void)_removeAllItems;
- (void)dealloc;
@end

@implementation WKBackForwardList

- (Object)_apiObject
{
  return (Object *)&self->_list;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKBackForwardList accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKBackForwardList accessInstanceVariablesDirectly]::didLogFault = 1;
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
    (**(void (***)(void))self->_list.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKBackForwardList;
    [(WKBackForwardList *)&v4 dealloc];
  }
}

- (WKBackForwardListItem)currentItem
{
  uint64_t v2 = *(void *)&self->_item.data.__lx[16];
  if (!v2 || !*(void *)(v2 + 8) || !LOBYTE(self[1].super.isa)) {
    return 0;
  }
  unint64_t v3 = *(void *)&self->_item.data.__lx[40];
  if (v3 < *(unsigned int *)&self->_item.data.__lx[36])
  {
    uint64_t v4 = *(void *)(*(void *)&self->_item.data.__lx[24] + 8 * v3);
    if (v4) {
      return *(WKBackForwardListItem **)(v4 + 8);
    }
    return 0;
  }
  __break(0xC471u);
  return self;
}

- (WKBackForwardListItem)backItem
{
  result = (WKBackForwardListItem *)WebKit::WebBackForwardList::backItem((uint64_t)&self->_list);
  if (result) {
    return *(WKBackForwardListItem **)result->_item.data.__lx;
  }
  return result;
}

- (WKBackForwardListItem)forwardItem
{
  result = (WKBackForwardListItem *)WebKit::WebBackForwardList::forwardItem((uint64_t)&self->_list);
  if (result) {
    return *(WKBackForwardListItem **)result->_item.data.__lx;
  }
  return result;
}

- (WKBackForwardListItem)itemAtIndex:(NSInteger)index
{
  result = (WKBackForwardListItem *)WebKit::WebBackForwardList::itemAtIndex((uint64_t)&self->_list, index);
  if (result) {
    return *(WKBackForwardListItem **)result->_item.data.__lx;
  }
  return result;
}

- (NSArray)backList
{
  WebKit::WebBackForwardList::backList((WebKit::WebBackForwardList *)&self->_list, &v6);
  uint64_t v2 = *(const void **)(v6 + 8);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  unint64_t v3 = (id)CFMakeCollectable(v2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    CFRelease(*(CFTypeRef *)(v4 + 8));
  }
  return v3;
}

- (NSArray)forwardList
{
  WebKit::WebBackForwardList::forwardList((WebKit::WebBackForwardList *)&self->_list, &v6);
  uint64_t v2 = *(const void **)(v6 + 8);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  unint64_t v3 = (id)CFMakeCollectable(v2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    CFRelease(*(CFTypeRef *)(v4 + 8));
  }
  return v3;
}

- (void)_removeAllItems
{
}

- (void)_clear
{
}

@end