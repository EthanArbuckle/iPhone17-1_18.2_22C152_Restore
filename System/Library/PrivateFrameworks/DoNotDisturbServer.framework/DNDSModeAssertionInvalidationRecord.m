@interface DNDSModeAssertionInvalidationRecord
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
+ (id)recordForInvalidation:(id)a3;
- (DNDSModeAssertionInvalidationDetailsRecord)details;
- (DNDSModeAssertionRecord)assertion;
- (DNDSModeAssertionSourceRecord)source;
- (NSNumber)invalidationDate;
- (NSString)reason;
- (NSString)reasonOverride;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setAssertion:(id)a3;
- (void)setDetails:(id)a3;
- (void)setInvalidationDate:(id)a3;
- (void)setReason:(id)a3;
- (void)setReasonOverride:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation DNDSModeAssertionInvalidationRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationRecord);
    v7 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var5.var0);
    v8 = +[DNDSModeAssertionRecord recordForDictionary:v7 keys:a4];
    [(DNDSModeAssertionInvalidationRecord *)v6 setAssertion:v8];

    v9 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var5.var1);
    [(DNDSModeAssertionInvalidationRecord *)v6 setInvalidationDate:v9];

    v10 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var5.var2);
    v11 = +[DNDSModeAssertionInvalidationDetailsRecord recordForDictionary:v10 keys:a4];
    [(DNDSModeAssertionInvalidationRecord *)v6 setDetails:v11];

    v12 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var5.var3);
    v13 = +[DNDSModeAssertionSourceRecord recordForDictionary:v12 keys:a4];
    [(DNDSModeAssertionInvalidationRecord *)v6 setSource:v13];

    v14 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var5.var4);
    [(DNDSModeAssertionInvalidationRecord *)v6 setReason:v14];

    v15 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var5.var5);

    [(DNDSModeAssertionInvalidationRecord *)v6 setReasonOverride:v15];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(DNDSModeAssertionInvalidationRecord *)self assertion];
  v9 = [v8 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var5.var0);

  v10 = [(DNDSModeAssertionInvalidationRecord *)self invalidationDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var5.var1);

  v11 = [(DNDSModeAssertionInvalidationRecord *)self details];
  v12 = [v11 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, a3->var5.var2);

  v13 = [(DNDSModeAssertionInvalidationRecord *)self source];
  v14 = [v13 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var5.var3);

  v15 = [(DNDSModeAssertionInvalidationRecord *)self reason];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v15, a3->var5.var4);

  v16 = [(DNDSModeAssertionInvalidationRecord *)self reasonOverride];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v16, a3->var5.var5);

  if (a4)
  {
    v17 = [(DNDSModeAssertionInvalidationRecord *)self invalidationDate];
    v18 = [NSString stringWithFormat:@"%@Local", a3->var5.var1];
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v17, v18);
  }
  return v7;
}

+ (id)recordForInvalidation:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationRecord);
    id v5 = [v3 assertion];
    v6 = +[DNDSModeAssertionRecord recordForAssertion:v5];
    [(DNDSModeAssertionInvalidationRecord *)v4 setAssertion:v6];

    v7 = NSNumber;
    v8 = [v3 invalidationDate];
    v9 = objc_msgSend(v7, "dnds_numberWithDate:", v8);
    [(DNDSModeAssertionInvalidationRecord *)v4 setInvalidationDate:v9];

    v10 = [v3 details];
    v11 = +[DNDSModeAssertionInvalidationDetailsRecord recordForInvalidationDetails:v10];
    [(DNDSModeAssertionInvalidationRecord *)v4 setDetails:v11];

    v12 = [v3 source];
    v13 = +[DNDSModeAssertionSourceRecord recordForAssertionSource:v12];
    [(DNDSModeAssertionInvalidationRecord *)v4 setSource:v13];

    v14 = objc_msgSend(NSString, "dnds_stringForInvalidationReason:", objc_msgSend(v3, "reason"));
    [(DNDSModeAssertionInvalidationRecord *)v4 setReason:v14];

    v15 = NSString;
    uint64_t v16 = [v3 reasonOverride];

    v17 = objc_msgSend(v15, "dnds_stringForInvalidationReasonOverride:", v16);
    [(DNDSModeAssertionInvalidationRecord *)v4 setReasonOverride:v17];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  id v3 = [(DNDSModeAssertionInvalidationRecord *)self assertion];
  v4 = [v3 object];

  id v5 = [(DNDSModeAssertionInvalidationRecord *)self invalidationDate];
  v6 = objc_msgSend(v5, "dnds_dateValue");

  v7 = [(DNDSModeAssertionInvalidationRecord *)self details];
  v8 = [v7 object];
  v9 = [(DNDSModeAssertionInvalidationRecord *)self source];
  v10 = [v9 object];

  v11 = [(DNDSModeAssertionInvalidationRecord *)self reason];
  uint64_t v12 = objc_msgSend(v11, "dnds_invalidationReasonValue");
  v13 = [(DNDSModeAssertionInvalidationRecord *)self reasonOverride];
  uint64_t v14 = objc_msgSend(v13, "dnds_invalidationReasonOverrideValue");
  v15 = 0;
  if (v4 && v6)
  {
    v15 = 0;
    BOOL v16 = v13 && v14 == 0;
    BOOL v17 = v16;
    BOOL v18 = v11 && v12 == 0;
    BOOL v19 = v18;
    BOOL v20 = v8 || v7 == 0;
    if (v20 && v10 && !v19 && !v17) {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F5F630]) initWithAssertion:v4 invalidationDate:v6 details:v8 source:v10 reason:v12 reasonOverride:v14];
    }
  }

  return v15;
}

- (DNDSModeAssertionRecord)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (NSNumber)invalidationDate
{
  return self->_invalidationDate;
}

- (void)setInvalidationDate:(id)a3
{
}

- (DNDSModeAssertionInvalidationDetailsRecord)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (DNDSModeAssertionSourceRecord)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)reasonOverride
{
  return self->_reasonOverride;
}

- (void)setReasonOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonOverride, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end