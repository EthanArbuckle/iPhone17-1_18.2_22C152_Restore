@interface LACUIAvailableMechanismsWrapper
- (BOOL)allowsBiometry;
- (BOOL)allowsPasscode;
- (BOOL)allowsWatch;
- (BOOL)isEmpty;
- (LACUIAvailableMechanismsWrapper)initWithMechanismEvents:(id)a3;
- (unint64_t)count;
@end

@implementation LACUIAvailableMechanismsWrapper

- (LACUIAvailableMechanismsWrapper)initWithMechanismEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIAvailableMechanismsWrapper;
  v5 = [(LACUIAvailableMechanismsWrapper *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      v7 = v4;
    }
    else {
      v7 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v5->_mechanismEvents, v7);
  }

  return v6;
}

- (BOOL)isEmpty
{
  return [(LACUIAvailableMechanismsWrapper *)self count] == 0;
}

- (unint64_t)count
{
  return [(NSArray *)self->_mechanismEvents count];
}

- (BOOL)allowsPasscode
{
  mechanismEvents = self->_mechanismEvents;
  v3 = [NSNumber numberWithInteger:*MEMORY[0x263F52388]];
  LOBYTE(mechanismEvents) = [(NSArray *)mechanismEvents containsObject:v3];

  return (char)mechanismEvents;
}

- (BOOL)allowsBiometry
{
  mechanismEvents = self->_mechanismEvents;
  id v4 = [NSNumber numberWithInteger:*MEMORY[0x263F52390]];
  if ([(NSArray *)mechanismEvents containsObject:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = self->_mechanismEvents;
    v7 = [NSNumber numberWithInteger:*MEMORY[0x263F52398]];
    if ([(NSArray *)v6 containsObject:v7])
    {
      char v5 = 1;
    }
    else
    {
      v8 = self->_mechanismEvents;
      objc_super v9 = [NSNumber numberWithInteger:*MEMORY[0x263F52380]];
      char v5 = [(NSArray *)v8 containsObject:v9];
    }
  }

  return v5;
}

- (BOOL)allowsWatch
{
  return 0;
}

- (void).cxx_destruct
{
}

@end