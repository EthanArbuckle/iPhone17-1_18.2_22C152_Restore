@interface CHMecabraWrapper
- (CHMecabraWrapper)init;
- (__Mecabra)mecabra;
- (void)dealloc;
- (void)initMecabraIfNeededWithType:(int)a3 learningDictURL:(id)a4;
@end

@implementation CHMecabraWrapper

- (CHMecabraWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHMecabraWrapper;
  result = [(CHMecabraWrapper *)&v3 init];
  if (result) {
    result->_mecabra = 0;
  }
  return result;
}

- (void)initMecabraIfNeededWithType:(int)a3 learningDictURL:(id)a4
{
  id v6 = a4;
  if (a3 && !self->_mecabra)
  {
    id v7 = v6;
    self->_mecabra = (__Mecabra *)MecabraCreateWithOptions();
    id v6 = v7;
  }
}

- (void)dealloc
{
  if (self->_mecabra) {
    MecabraRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)CHMecabraWrapper;
  [(CHMecabraWrapper *)&v3 dealloc];
}

- (__Mecabra)mecabra
{
  return self->_mecabra;
}

@end