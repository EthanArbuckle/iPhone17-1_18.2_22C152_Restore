@interface DRSProtoDiagnosticRequestStatsBatchReply
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation DRSProtoDiagnosticRequestStatsBatchReply

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDiagnosticRequestStatsBatchReply;
  v4 = [(DRSProtoDiagnosticRequestStatsBatchReply *)&v8 description];
  v5 = [(DRSProtoDiagnosticRequestStatsBatchReply *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x263EFF9A0] dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticRequestStatsBatchReplyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end