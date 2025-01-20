@interface SGMITokenCounts
- (NSNumber)regularCount;
- (NSNumber)salientCount;
- (NSString)token;
- (SGMITokenCounts)init;
- (SGMITokenCounts)initWithCount:(id)a3 asSalient:(BOOL)a4 token:(id)a5;
- (SGMITokenCounts)initWithSalientCount:(id)a3 regularCount:(id)a4 token:(id)a5;
- (id)description;
- (id)newByAdding:(id)a3 asSalient:(BOOL)a4;
@end

@implementation SGMITokenCounts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_regularCount, 0);
  objc_storeStrong((id *)&self->_salientCount, 0);
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)regularCount
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)salientCount
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<SGMITokenCounts[%@]: %@ salient ; %@ regular>",
                 self->_token,
                 self->_salientCount,
                 self->_regularCount);
  return v2;
}

- (id)newByAdding:(id)a3 asSalient:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = NSNumber;
  v8 = [(SGMITokenCounts *)self salientCount];
  uint64_t v9 = [v8 longValue];
  if (v4) {
    uint64_t v10 = [v6 longValue];
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = [v7 numberWithLong:v10 + v9];

  v12 = NSNumber;
  v13 = [(SGMITokenCounts *)self regularCount];
  uint64_t v14 = [v13 longValue];
  if (v4) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = [v6 longValue];
  }
  v16 = [v12 numberWithLong:v15 + v14];

  v17 = [SGMITokenCounts alloc];
  v18 = [(SGMITokenCounts *)self token];
  v19 = [(SGMITokenCounts *)v17 initWithSalientCount:v11 regularCount:v16 token:v18];

  return v19;
}

- (SGMITokenCounts)initWithCount:(id)a3 asSalient:(BOOL)a4 token:(id)a5
{
  if (a4) {
    id v5 = a3;
  }
  else {
    id v5 = &unk_1F2536330;
  }
  if (a4) {
    id v6 = &unk_1F2536330;
  }
  else {
    id v6 = a3;
  }
  return [(SGMITokenCounts *)self initWithSalientCount:v5 regularCount:v6 token:a5];
}

- (SGMITokenCounts)init
{
  return [(SGMITokenCounts *)self initWithSalientCount:&unk_1F2536330 regularCount:&unk_1F2536330 token:&stru_1F24EEF20];
}

- (SGMITokenCounts)initWithSalientCount:(id)a3 regularCount:(id)a4 token:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMITokenCounts;
  v12 = [(SGMITokenCounts *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_salientCount, a3);
    objc_storeStrong((id *)&v13->_regularCount, a4);
    objc_storeStrong((id *)&v13->_token, a5);
  }

  return v13;
}

@end