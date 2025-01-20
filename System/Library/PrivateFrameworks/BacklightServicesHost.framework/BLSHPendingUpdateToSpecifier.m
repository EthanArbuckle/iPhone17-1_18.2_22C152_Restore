@interface BLSHPendingUpdateToSpecifier
- (BLSHPendingUpdateToSpecifier)initWithSpecifier:(id)a3;
- (BLSHPresentationDateSpecifier)specifier;
- (BOOL)isCompleted;
- (BOOL)isStarted;
- (NSString)description;
- (int64_t)type;
- (void)setCompleted:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation BLSHPendingUpdateToSpecifier

- (BLSHPendingUpdateToSpecifier)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHPendingUpdateToSpecifier;
  v6 = [(BLSHPendingUpdateToSpecifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specifier, a3);
  }

  return v7;
}

- (int64_t)type
{
  return 1;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateToSpecifier isStarted](self, "isStarted"), @"started");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateToSpecifier isCompleted](self, "isCompleted"), @"completed");
  id v6 = (id)[v3 appendObject:self->_specifier withName:@"specifier"];
  v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BLSHPresentationDateSpecifier)specifier
{
  return (BLSHPresentationDateSpecifier *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end