@interface FIValidation
+ (BOOL)performValidations:(id)a3 withObject:(id)a4 error:(id *)a5;
+ (id)validationWithName:(id)a3 test:(id)a4;
- (BOOL)validateObject:(id)a3 withError:(id *)a4;
- (NSString)name;
- (id)test;
@end

@implementation FIValidation

+ (id)validationWithName:(id)a3 test:(id)a4
{
  v5 = (NSString *)a3;
  id v6 = a4;
  v7 = objc_alloc_init(FIValidation);
  name = v7->_name;
  v7->_name = v5;
  v9 = v5;

  v10 = _Block_copy(v6);
  id test = v7->_test;
  v7->_id test = v10;

  return v7;
}

- (BOOL)validateObject:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(FIValidation *)self test];
  char v8 = ((uint64_t (**)(void, id))v7)[2](v7, v6);

  if ((v8 & 1) == 0)
  {
    v9 = NSString;
    v10 = [(FIValidation *)self name];
    v11 = [v9 stringWithFormat:@"Failed validation step: %@ for object %@", v10, v6];

    v12 = FIIntervalErrorWithDescription(v11);
    FISetOutErrorIfNotNull(a4, v12);
  }
  return v8;
}

+ (BOOL)performValidations:(id)a3 withObject:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "validateObject:withError:", v8, a5, (void)v16))
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (id)test
{
  return self->_test;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end