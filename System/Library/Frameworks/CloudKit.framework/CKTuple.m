@interface CKTuple
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
@end

@implementation CKTuple

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Subclass must implement", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"CKUtils.m", 2906, @"Expected to be overridden in subclass");

  return 0;
}

@end