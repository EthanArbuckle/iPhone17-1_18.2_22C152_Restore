@interface CRRequestUserConfirmationCommand
- (NSDictionary)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)commandDirection;
- (void)setCommandDirection:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CRRequestUserConfirmationCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(CRRequestUserConfirmationCommand);
  v6 = [(CRRequestUserConfirmationCommand *)self userInfo];
  v7 = (void *)[v6 copyWithZone:a3];
  [(CRRequestUserConfirmationCommand *)v5 setUserInfo:v7];

  [(CRRequestUserConfirmationCommand *)v5 setCommandDirection:[(CRRequestUserConfirmationCommand *)self commandDirection]];
  return v5;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)commandDirection
{
  return self->commandDirection;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->commandDirection = a3;
}

- (void).cxx_destruct
{
}

@end