@interface OrgApacheLuceneUtilFrequencyTrackingRingBuffer
+ (void)initialize;
- (OrgApacheLuceneUtilFrequencyTrackingRingBuffer)initWithInt:(int)a3 withInt:(int)a4;
- (id)asFrequencyMap;
- (int)frequencyWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)addWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilFrequencyTrackingRingBuffer

- (OrgApacheLuceneUtilFrequencyTrackingRingBuffer)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (int64_t)ramBytesUsed
{
  frequencies = self->frequencies_;
  if (!frequencies) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = qword_10055FDF0;
  v5 = (char *)[(OrgApacheLuceneUtilFrequencyTrackingRingBuffer_IntBag *)frequencies ramBytesUsed] + v4;
  return (int64_t)&v5[OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->buffer_)];
}

- (void)addWithInt:(int)a3
{
  buffer = self->buffer_;
  if (!buffer) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)&a3;
  int position = self->position_;
  uint64_t size = buffer->super.size_;
  if (position < 0 || position >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, position);
  }
  frequencies = self->frequencies_;
  if (!frequencies) {
LABEL_11:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer_IntBag *)frequencies removeWithInt:*((unsigned int *)&buffer->super.size_ + position + 1)];
  v9 = self->buffer_;
  int v10 = self->position_;
  uint64_t v11 = v9->super.size_;
  if (v10 < 0 || v10 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, v10);
  }
  *(&v9->super.size_ + v10 + 1) = v4;
  [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer_IntBag *)self->frequencies_ addWithInt:v4];
  int v12 = self->position_;
  if (v12 + 1 == self->maxSize_) {
    int v13 = 0;
  }
  else {
    int v13 = v12 + 1;
  }
  self->position_ = v13;
}

- (int)frequencyWithInt:(int)a3
{
  frequencies = self->frequencies_;
  if (!frequencies) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer_IntBag *)frequencies frequencyWithInt:*(void *)&a3];
}

- (id)asFrequencyMap
{
  frequencies = self->frequencies_;
  if (!frequencies) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer_IntBag *)frequencies asMap];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFrequencyTrackingRingBuffer;
  [(OrgApacheLuceneUtilFrequencyTrackingRingBuffer *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilFrequencyTrackingRingBuffer_class_();
    qword_10055FDF0 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilFrequencyTrackingRingBuffer__initialized);
  }
}

@end