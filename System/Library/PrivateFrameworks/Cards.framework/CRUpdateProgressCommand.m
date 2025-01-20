@interface CRUpdateProgressCommand
- (BOOL)animatesProgress;
- (CRUpdateProgressCommand)init;
- (NSDictionary)userInfo;
- (NSProgress)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)commandDirection;
- (unint64_t)event;
- (void)setAnimatesProgress:(BOOL)a3;
- (void)setCommandDirection:(unint64_t)a3;
- (void)setEvent:(unint64_t)a3;
- (void)setProgress:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CRUpdateProgressCommand

- (CRUpdateProgressCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRUpdateProgressCommand;
  result = [(CRUpdateProgressCommand *)&v3 init];
  if (result) {
    result->_animatesProgress = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(CRUpdateProgressCommand);
  v6 = [(CRUpdateProgressCommand *)self userInfo];
  v7 = (void *)[v6 copyWithZone:a3];
  [(CRUpdateProgressCommand *)v5 setUserInfo:v7];

  [(CRUpdateProgressCommand *)v5 setCommandDirection:[(CRUpdateProgressCommand *)self commandDirection]];
  return v5;
}

- (unint64_t)commandDirection
{
  return self->commandDirection;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->commandDirection = a3;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)event
{
  return self->_event;
}

- (void)setEvent:(unint64_t)a3
{
  self->_event = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (BOOL)animatesProgress
{
  return self->_animatesProgress;
}

- (void)setAnimatesProgress:(BOOL)a3
{
  self->_animatesProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->userInfo, 0);
}

@end