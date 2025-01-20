@interface ComAppleContextkitCategoriesConstellation_Request_$1
- (ComAppleContextkitCategoriesConstellation_Request_$1)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4 withJavaUtilSet:(id)a5;
- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request_$1

- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  sub_1000C6730(&self->this$0_->super.isa, *(uint64_t *)&a5, self->val$weight_, self->val$seen_);
  seenOrder = self->this$0_->seenOrder_;
  if (!seenOrder) {
    JreThrowNullPointerException();
  }
  uint64_t size = seenOrder->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  if (!*(&seenOrder->super.size_ + (int)v5 + 1))
  {
    v9 = self->this$0_;
    int v10 = v9->seenCounter_ + 1;
    v9->seenCounter_ = v10;
    v11 = self->this$0_->seenOrder_;
    uint64_t v12 = v11->super.size_;
    if ((v5 & 0x80000000) != 0 || (int)v12 <= (int)v5) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v5);
    }
    *(&v11->super.size_ + (int)v5 + 1) = v10;
  }
}

- (ComAppleContextkitCategoriesConstellation_Request_$1)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withInt:(int)a4 withJavaUtilSet:(id)a5
{
  self->val$weight_ = a4;
  JreStrongAssign((id *)&self->val$seen_, a5);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request__1;
  [(ComAppleContextkitCategoriesConstellation_Request_$1 *)&v3 dealloc];
}

@end