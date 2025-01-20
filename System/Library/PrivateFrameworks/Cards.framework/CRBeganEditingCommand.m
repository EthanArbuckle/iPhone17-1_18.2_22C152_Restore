@interface CRBeganEditingCommand
- (NSDictionary)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)commandDirection;
- (void)setCommandDirection:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CRBeganEditingCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(CRBeganEditingCommand);
  v6 = [(CRBeganEditingCommand *)self userInfo];
  v7 = (void *)[v6 copyWithZone:a3];
  [(CRBeganEditingCommand *)v5 setUserInfo:v7];

  [(CRBeganEditingCommand *)v5 setCommandDirection:[(CRBeganEditingCommand *)self commandDirection]];
  return v5;
}

- (unint64_t)commandDirection
{
  if (self->_commandDirection) {
    return self->_commandDirection;
  }
  else {
    return 2;
  }
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->_commandDirection = a3;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end