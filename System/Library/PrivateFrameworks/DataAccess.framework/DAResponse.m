@interface DAResponse
+ (BOOL)supportsSecureCoding;
- (DAResponse)initWithCoder:(id)a3;
- (DAResponse)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5 status:(int64_t)a6;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation DAResponse

- (DAResponse)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5 status:(int64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)DAResponse;
  v7 = [(DAAction *)&v10 initWithItemChangeType:a3 changedItem:a4 serverId:a5];
  v8 = v7;
  if (v7) {
    [(DAResponse *)v7 setStatus:a6];
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAResponse)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:216 description:@"Who does non-keyed coding nowadays?"];
  }
  v9.receiver = self;
  v9.super_class = (Class)DAResponse;
  v6 = [(DAAction *)&v9 initWithCoder:v5];
  if (v6) {
    -[DAResponse setStatus:](v6, "setStatus:", (int)[v5 decodeIntForKey:@"DARStatus"]);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"DAAction.m" lineNumber:225 description:@"Who does non-keyed coding nowadays?"];
  }
  v7.receiver = self;
  v7.super_class = (Class)DAResponse;
  [(DAAction *)&v7 encodeWithCoder:v5];
  objc_msgSend(v5, "encodeInt:forKey:", -[DAResponse status](self, "status"), @"DARStatus");
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

@end