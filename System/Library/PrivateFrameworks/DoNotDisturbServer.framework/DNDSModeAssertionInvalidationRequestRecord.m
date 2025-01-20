@interface DNDSModeAssertionInvalidationRequestRecord
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
+ (id)recordForInvalidationRequest:(id)a3;
- (DNDSModeAssertionInvalidationDetailsRecord)details;
- (DNDSModeAssertionInvalidationPredicateRecord)predicate;
- (DNDSModeAssertionSourceRecord)source;
- (NSNumber)requestDate;
- (NSString)UUID;
- (NSString)reason;
- (NSString)reasonOverride;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)setDetails:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReason:(id)a3;
- (void)setReasonOverride:(id)a3;
- (void)setRequestDate:(id)a3;
- (void)setSource:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation DNDSModeAssertionInvalidationRequestRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationRequestRecord);
    v7 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var7.var0);
    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setUUID:v7];

    v8 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var7.var1);
    v9 = +[DNDSModeAssertionInvalidationPredicateRecord recordForDictionary:v8 keys:a4];
    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setPredicate:v9];

    v10 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var7.var2);
    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setRequestDate:v10];

    v11 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var7.var3);
    v12 = +[DNDSModeAssertionInvalidationDetailsRecord recordForDictionary:v11 keys:a4];
    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setDetails:v12];

    v13 = objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var7.var4);
    v14 = +[DNDSModeAssertionSourceRecord recordForDictionary:v13 keys:a4];
    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setSource:v14];

    v15 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var7.var5);
    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setReason:v15];

    v16 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var7.var6);

    [(DNDSModeAssertionInvalidationRequestRecord *)v6 setReasonOverride:v16];
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
  v8 = [(DNDSModeAssertionInvalidationRequestRecord *)self UUID];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var7.var0);

  v9 = [(DNDSModeAssertionInvalidationRequestRecord *)self predicate];
  v10 = [v9 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var7.var1);

  v11 = [(DNDSModeAssertionInvalidationRequestRecord *)self requestDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var7.var2);

  v12 = [(DNDSModeAssertionInvalidationRequestRecord *)self details];
  v13 = [v12 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var7.var3);

  v14 = [(DNDSModeAssertionInvalidationRequestRecord *)self source];
  v15 = [v14 dictionaryWithKeys:a3 options:a4];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v15, a3->var7.var4);

  v16 = [(DNDSModeAssertionInvalidationRequestRecord *)self reason];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v16, a3->var7.var5);

  v17 = [(DNDSModeAssertionInvalidationRequestRecord *)self reasonOverride];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v17, a3->var7.var6);

  if (a4)
  {
    v18 = [(DNDSModeAssertionInvalidationRequestRecord *)self requestDate];
    v19 = [NSString stringWithFormat:@"%@Local", a3->var7.var2];
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v18, v19);
  }
  return v7;
}

+ (id)recordForInvalidationRequest:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationRequestRecord);
    id v5 = [v3 UUID];
    v6 = [v5 UUIDString];
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setUUID:v6];

    v7 = [v3 predicate];
    v8 = +[DNDSModeAssertionInvalidationPredicateRecord recordForInvalidationPredicate:v7];
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setPredicate:v8];

    v9 = NSNumber;
    v10 = [v3 requestDate];
    v11 = objc_msgSend(v9, "dnds_numberWithDate:", v10);
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setRequestDate:v11];

    v12 = [v3 details];
    v13 = +[DNDSModeAssertionInvalidationDetailsRecord recordForInvalidationDetails:v12];
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setDetails:v13];

    v14 = [v3 source];
    v15 = +[DNDSModeAssertionSourceRecord recordForAssertionSource:v14];
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setSource:v15];

    v16 = objc_msgSend(NSString, "dnds_stringForInvalidationReason:", objc_msgSend(v3, "reason"));
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setReason:v16];

    v17 = NSString;
    uint64_t v18 = [v3 reasonOverride];

    v19 = objc_msgSend(v17, "dnds_stringForInvalidationReasonOverride:", v18);
    [(DNDSModeAssertionInvalidationRequestRecord *)v4 setReasonOverride:v19];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  id v3 = [(DNDSModeAssertionInvalidationRequestRecord *)self UUID];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    id v5 = [(DNDSModeAssertionInvalidationRequestRecord *)self UUID];
    v6 = (void *)[v4 initWithUUIDString:v5];
  }
  else
  {
    v6 = 0;
  }

  v7 = [(DNDSModeAssertionInvalidationRequestRecord *)self predicate];
  v8 = [v7 object];

  v9 = [(DNDSModeAssertionInvalidationRequestRecord *)self requestDate];
  v25 = objc_msgSend(v9, "dnds_dateValue");

  v10 = [(DNDSModeAssertionInvalidationRequestRecord *)self details];
  v11 = [v10 object];
  v12 = [(DNDSModeAssertionInvalidationRequestRecord *)self source];
  v13 = [v12 object];

  v14 = [(DNDSModeAssertionInvalidationRequestRecord *)self reason];
  uint64_t v15 = objc_msgSend(v14, "dnds_invalidationReasonValue");
  v16 = [(DNDSModeAssertionInvalidationRequestRecord *)self reasonOverride];
  uint64_t v17 = objc_msgSend(v16, "dnds_invalidationReasonOverrideValue");
  uint64_t v18 = 0;
  if (v6 && v8 && v25)
  {
    uint64_t v18 = 0;
    BOOL v19 = v16 && v17 == 0;
    BOOL v20 = v19;
    BOOL v21 = v14 && v15 == 0;
    BOOL v22 = v21;
    BOOL v23 = v11 || v10 == 0;
    if (v23 && v13 && !v22 && !v20) {
      uint64_t v18 = [[DNDSModeAssertionInvalidationRequest alloc] initWithUUID:v6 predicate:v8 requestDate:v25 details:v11 source:v13 reason:v15 reasonOverride:v17];
    }
  }

  return v18;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (DNDSModeAssertionInvalidationPredicateRecord)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSNumber)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
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
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end