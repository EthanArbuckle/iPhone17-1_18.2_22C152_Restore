@interface CKPredicateValidatorInstance
- (BOOL)validate:(id)a3 error:(id *)a4;
- (NSString)description;
@end

@implementation CKPredicateValidatorInstance

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKPredicateValidatorInstance *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"CKObjectValidator.m", 111, @"Validate must be called on subclass");

  return 0;
}

@end