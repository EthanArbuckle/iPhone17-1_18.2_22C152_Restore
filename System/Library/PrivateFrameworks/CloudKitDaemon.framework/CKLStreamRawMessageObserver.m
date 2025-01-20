@interface CKLStreamRawMessageObserver
- (void)eventMatched:(id)a3;
@end

@implementation CKLStreamRawMessageObserver

- (void)eventMatched:(id)a3
{
  objc_msgSend_composedMessage(a3, a2, (uint64_t)a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasPrefix_(v10, v3, @"SIM: "))
  {
    uint64_t v5 = objc_msgSend_substringFromIndex_(v10, v4, 5);

    id v10 = (id)v5;
  }
  id v6 = objc_msgSend_initWithFormat_([NSString alloc], (const char *)v10, @"%@", v10);
  v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  puts(v9);
}

@end