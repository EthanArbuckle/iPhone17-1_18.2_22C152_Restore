@interface CRPunchoutCommand
- (SFPunchout)punchout;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPunchout:(id)a3;
@end

@implementation CRPunchoutCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRPunchoutCommand;
  id v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(CRPunchoutCommand *)self punchout];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setPunchout:v7];

  return v5;
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end