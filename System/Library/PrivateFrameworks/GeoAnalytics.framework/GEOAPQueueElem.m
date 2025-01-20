@interface GEOAPQueueElem
- (GEOAPQueueElem)init;
- (NSDate)createTime;
- (void)dealloc;
@end

@implementation GEOAPQueueElem

- (void)dealloc
{
  id dirty = self->_dirty;
  self->_id dirty = 0;

  v4.receiver = self;
  v4.super_class = (Class)GEOAPQueueElem;
  [(GEOAPQueueElem *)&v4 dealloc];
}

- (GEOAPQueueElem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAPQueueElem;
  v2 = [(GEOAPQueueElem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = _GEOCreateTransaction();
    id dirty = v2->_dirty;
    v2->_id dirty = (id)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dirty, 0);
  objc_storeStrong((id *)&self->_createTime, 0);
}

- (NSDate)createTime
{
  return self->_createTime;
}

@end