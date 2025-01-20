@interface ASTErrorStatus
+ (ASTErrorStatus)errorStatusWithCode:(int64_t)a3;
- (ASTErrorStatus)init;
- (NSMutableDictionary)data;
- (NSNumber)code;
- (NSString)reason;
- (id)dictionary;
- (id)reasonForCode:(id)a3;
- (void)setCode:(id)a3;
- (void)setData:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation ASTErrorStatus

- (ASTErrorStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASTErrorStatus;
  v2 = [(ASTErrorStatus *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v3;

    code = v2->_code;
    v2->_code = (NSNumber *)&unk_26F0B5880;
  }
  return v2;
}

- (void)setCode:(id)a3
{
  objc_storeStrong((id *)&self->_code, a3);
  id v5 = a3;
  id v6 = [(ASTErrorStatus *)self reasonForCode:v5];

  [(ASTErrorStatus *)self setReason:v6];
}

- (id)dictionary
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ASTErrorStatus *)self code];
  char v4 = [v3 isEqualToNumber:&unk_26F0B5880];

  if (v4)
  {
    id v5 = @"NoError";
  }
  else
  {
    id v5 = [(ASTErrorStatus *)self code];
  }
  v18[0] = @"code";
  v18[1] = @"reason";
  v19[0] = v5;
  id v6 = [(ASTErrorStatus *)self reason];
  if (v6) {
    [(ASTErrorStatus *)self reason];
  }
  else {
  objc_super v7 = [MEMORY[0x263EFF9D0] null];
  }
  v19[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  v9 = [(ASTErrorStatus *)self data];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = (void *)[v8 mutableCopy];
    v16 = @"data";
    v12 = [(ASTErrorStatus *)self data];
    v17 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v11 addEntriesFromDictionary:v13];

    uint64_t v14 = [v11 copy];
    v8 = (void *)v14;
  }

  return v8;
}

- (id)reasonForCode:(id)a3
{
  return 0;
}

+ (ASTErrorStatus)errorStatusWithCode:(int64_t)a3
{
  char v4 = objc_alloc_init(ASTErrorStatus);
  id v5 = [NSNumber numberWithInteger:a3];
  [(ASTErrorStatus *)v4 setCode:v5];

  return v4;
}

- (NSNumber)code
{
  return self->_code;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

@end