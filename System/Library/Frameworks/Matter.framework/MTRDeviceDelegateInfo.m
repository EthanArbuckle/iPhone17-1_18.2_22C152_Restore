@interface MTRDeviceDelegateInfo
- (id)description;
@end

@implementation MTRDeviceDelegateInfo

- (id)description
{
  v4 = NSString;
  delegatePointerValue = self->_delegatePointerValue;
  uint64_t v6 = objc_msgSend_count(self->_interestedPathsForAttributes, a2, v2);
  uint64_t v9 = objc_msgSend_count(self->_interestedPathsForEvents, v7, v8);
  return (id)objc_msgSend_stringWithFormat_(v4, v10, @"<MTRDeviceDelegateInfo: %p delegate value %p interested attribute paths count %lu event paths count %lu>", self, delegatePointerValue, v6, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedPathsForEvents, 0);
  objc_storeStrong((id *)&self->_interestedPathsForAttributes, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak(&self->_delegate);
}

@end