@interface _WKPageLoadTiming
- (NSDate)allSubresourcesFinishedLoading;
- (NSDate)documentFinishedLoading;
- (NSDate)firstMeaningfulPaint;
- (NSDate)firstVisualLayout;
- (NSDate)navigationStart;
- (id).cxx_construct;
- (id)_initWithTiming:(const void *)a3;
@end

@implementation _WKPageLoadTiming

- (id)_initWithTiming:(const void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WKPageLoadTiming;
  id result = [(_WKPageLoadTiming *)&v5 init];
  if (result)
  {
    *((void *)result + 1) = *(void *)a3;
    *((void *)result + 2) = *((void *)a3 + 1);
    *((void *)result + 3) = *((void *)a3 + 2);
    *((void *)result + 4) = *((void *)a3 + 3);
    *((void *)result + 5) = *((void *)a3 + 4);
  }
  return result;
}

- (NSDate)navigationStart
{
  if (self->_navigationStart.m_value == 0.0) {
    return 0;
  }
  else {
    return (NSDate *)objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
}

- (NSDate)firstVisualLayout
{
  if (self->_firstVisualLayout.m_value == 0.0) {
    return 0;
  }
  else {
    return (NSDate *)objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
}

- (NSDate)firstMeaningfulPaint
{
  if (self->_firstMeaningfulPaint.m_value == 0.0) {
    return 0;
  }
  else {
    return (NSDate *)objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
}

- (NSDate)documentFinishedLoading
{
  if (self->_documentFinishedLoading.m_value == 0.0) {
    return 0;
  }
  else {
    return (NSDate *)objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
}

- (NSDate)allSubresourcesFinishedLoading
{
  if (self->_allSubresourcesFinishedLoading.m_value == 0.0) {
    return 0;
  }
  else {
    return (NSDate *)objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end