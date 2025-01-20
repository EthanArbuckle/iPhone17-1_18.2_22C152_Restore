@interface CKRecord
- (NSString)hashedDescription;
- (NSString)type;
- (id)fieldForKey:(id)a3;
- (void)setField:(id)a3 forKey:(id)a4;
@end

@implementation CKRecord

- (NSString)type
{
  return [(CKRecord *)self recordType];
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CKRecord *)self identifier];
  v5 = AMSHashIfNeeded();
  v6 = +[NSMutableString stringWithFormat:@"<%@: %p recordIdentifier = %@ | values = {", v3, self, v5];

  v7 = [(CKRecord *)self encryptedValuesByKey];
  v8 = [v7 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B8548;
  v12[3] = &unk_100219578;
  id v9 = v6;
  id v13 = v9;
  v14 = self;
  [v8 enumerateObjectsUsingBlock:v12];

  [v9 appendString:@"\n}"];
  id v10 = v9;

  return (NSString *)v10;
}

- (id)fieldForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKRecord *)self encryptedValuesByKey];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setField:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKRecord *)self encryptedValuesByKey];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

@end