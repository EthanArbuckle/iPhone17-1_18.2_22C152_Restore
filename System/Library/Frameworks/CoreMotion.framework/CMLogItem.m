@interface CMLogItem
+ (BOOL)supportsSecureCoding;
- (CMLogItem)initWithCoder:(id)a3;
- (CMLogItem)initWithTimestamp:(double)a3;
- (NSTimeInterval)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLogItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMLogItem;
  [(CMLogItem *)&v3 dealloc];
}

- (CMLogItem)initWithTimestamp:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMLogItem;
  v4 = [(CMLogItem *)&v9 init];
  if (v4)
  {
    v5 = [CMLogItemInternal alloc];
    v4->_internalLogItem = (id)objc_msgSend_initWithTimestamp_(v5, v6, v7, a3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLogItem)initWithCoder:(id)a3
{
  objc_msgSend_decodeDoubleForKey_(a3, a2, @"kCMLogItemCodingKeyTimestamp");

  return (CMLogItem *)objc_msgSend_initWithTimestamp_(self, v4, v5);
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_timestamp(self, v8, v9);

  return (id)objc_msgSend_initWithTimestamp_(v7, v10, v11);
}

- (NSTimeInterval)timestamp
{
  return *((double *)self->_internalLogItem + 1);
}

@end