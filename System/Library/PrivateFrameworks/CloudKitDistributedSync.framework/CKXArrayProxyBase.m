@interface CKXArrayProxyBase
- ($3CC19D079FD0B010EE84973AA846B91B)listInstance;
- (void)associateWithListInstance:(id *)a3;
- (void)reset;
@end

@implementation CKXArrayProxyBase

- (void)associateWithListInstance:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_listInstance.structToken = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_listInstance.page = v3;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)CKXArrayProxyBase;
  [(CKXProxyBase *)&v3 reset];
  self->_listInstance.structToken = -1;
}

- ($3CC19D079FD0B010EE84973AA846B91B)listInstance
{
  long long v3 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

@end